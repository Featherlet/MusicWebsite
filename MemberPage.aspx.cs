using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class MemberPage : System.Web.UI.Page
{
    protected String user = "sophie";
    protected void Page_Load(object sender, EventArgs e)
    {
        //user = Session["username"].ToString();
        SqlDataSource1.SelectCommand = "SELECT Members.MemberUser, Songs.SongName, Singers.SingerName, Songs.SongId FROM Singers" +
        " INNER JOIN Singer_Sings_Song ON Singers.SingerId = Singer_Sings_Song.SingerId INNER JOIN Songs ON Singer_Sings_Song.SongId " +
        " = Songs.SongId INNER JOIN Member_Has_Song ON Songs.SongId = Member_Has_Song.SongId INNER JOIN Members ON " +
        " Member_Has_Song.MemberUser = Members.MemberUser where Members.MemberUser='"+user+"'";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("MainPage.aspx");
    }



    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Listen") 
        {
            //form1.Target = "_blank"; 
            Label song = (Label)e.Item.FindControl("SongNameLabel");
            String songId;
            string sql = "Data Source=(local);Initial Catalog=MusicDatabase;Integrated Security=false ;User ID=sa;Password=1234";
            SqlConnection conn = new SqlConnection(sql);
            conn.Open();
            //从歌曲表中读数据
            string search = "select SongId from Songs where SongName ='" + song.Text.ToString() + "'";
            SqlCommand comm = new SqlCommand();
            comm.CommandText = search;
            comm.Connection = conn;
            SqlDataReader dr = comm.ExecuteReader();
            if (dr.HasRows == true)
            {
                if (dr.Read())
                {
                    songId = dr["SongId"].ToString();
                    string s_url;
                    s_url = "SongPage.aspx?songname=" + songId; //由c#后台向java script传参数
                    Response.Write("<Script language=JavaScript>window.open('" + s_url + "');</Script>");
                }
            }
            dr.Close();
            conn.Close();
        }
        else if (e.CommandName == "Delete")
        {
            String songId;
            Label song = (Label)e.Item.FindControl("SongNameLabel");
            string sql = "Data Source=(local);Initial Catalog=MusicDatabase;Integrated Security=false ;User ID=sa;Password=1234";
            SqlConnection conn = new SqlConnection(sql);
            conn.Open();

            string search = "select SongId from Songs where SongName ='" + song.Text.ToString() + "'";
            SqlCommand comm = new SqlCommand();
            comm.CommandText = search;
            comm.Connection = conn;
            SqlDataReader dr = comm.ExecuteReader();
            if (dr.HasRows == true)
            {
                if (dr.Read())
                {
                    songId = dr["SongId"].ToString();
                    dr.Close();
                    //从歌曲表中删除数据
                    string search2 = "DELETE FROM Member_Has_Song WHERE SongId = '" + songId + "' and MemberUser ='" + user + "'";
                    SqlCommand comm2 = new SqlCommand();
                    comm2.CommandText = search2;
                    comm2.Connection = conn;
                    comm2.ExecuteNonQuery();
                }
            }
            conn.Close();
        }
    }
  
    protected void BtAdd_Click1(object sender, EventArgs e)
    {
        String singerName = SingerNameTextBox.Text.ToString();
        String songName = SongNameTextBox.Text.ToString();
        String type = DropDownList1.SelectedValue.ToString();
        String songuml = "null";
        String lyrics = "null";

        //将上传文件放入songs文件夹
        if (SongUpload.HasFile)
        {
            try
            {
                //生成完整的文件名:绝对路径+文件名
                string fn = Server.MapPath(Request.ApplicationPath) + "\\songs\\" + SongUpload.FileName;
                songuml = SongUpload.FileName.ToString();
                //保存文件
                SongUpload.SaveAs(fn);
            }
            catch (Exception ex)
            {
                //如果文件保存时发生异常,则显示异常信息
                Response.Write("<script>alert('保存文件出错!');</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('文件不存在!');</script>");
        }

        //将上传文件放入lyrics文件夹
        if (LyricsUpload1.HasFile)
        {
            try
            {
                //生成完整的文件名:绝对路径+文件名
                string fn = Server.MapPath(Request.ApplicationPath) + "\\lyrics\\" + LyricsUpload1.FileName;
                lyrics = SongUpload.FileName.ToString();
                //保存文件
                LyricsUpload1.SaveAs(fn);
            }
            catch (Exception ex)
            {
                //如果文件保存时发生异常,则显示异常信息
                Response.Write("<script>alert('保存文件出错!');</script>");
            }
        }

        string sql = "Data Source=(local);Initial Catalog=MusicDatabase;Integrated Security=false ;User ID=sa;Password=1234";
        SqlConnection conn = new SqlConnection(sql);
        conn.Open();
        //从歌曲表中读最大的ID号
        string search = "select Max(SongId) from Songs";
        SqlCommand comm = new SqlCommand();
        comm.CommandText = search;
        comm.Connection = conn;
        int maxId = (int)comm.ExecuteScalar();
        maxId++;
        //将新歌插入数据库
        string query = "insert into Songs (SongId, SongName, SongUml, SongLyrics, ClickNum, SongType) "+
                "values ('" + maxId.ToString() + "','" + songName + "','" + songuml + "','" + lyrics + "','0','" + type + "')";
        SqlCommand comm2 = new SqlCommand();
        comm2.CommandText = query;
        comm2.Connection = conn;
        comm2.ExecuteReader();
        conn.Close();


        SqlConnection conn2 = new SqlConnection(sql);
        conn2.Open();
        //从歌手表中读相应的ID号
        string search2 = "select SingerId from Singers where SingerName ='" + singerName + "'";
        SqlCommand comm3 = new SqlCommand();
        comm3.CommandText = search2;
        comm3.Connection = conn2;
        String singerId;
        SqlDataReader dr = comm3.ExecuteReader();
        if (dr.HasRows == true)
        {
            if (dr.Read())
            {
                singerId = dr["SingerId"].ToString();
                dr.Close();
                string query2 = "insert into Singer_Sings_Song (SingerId, SongId) " +
                "values ('" + singerId + "','" + maxId +  "')";
                SqlCommand comm4 = new SqlCommand();
                comm4.CommandText = query2;
                comm4.Connection = conn2;
                comm4.ExecuteReader();
                
            }
        }
        else
        {
            Response.Write("<script>alert('不存在此歌手!');</script>");
        }
        conn.Close();
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Ranking : System.Web.UI.Page
{
    protected String singerRank = "";
    protected String songRank = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "select * from Singers order by ClickNum desc";
        SqlDataSource2.SelectCommand = "select * from Songs, Singers, Singer_Sings_Song" +
            " where Songs.SongId = Singer_Sings_Song.SongId AND Singers.SingerId = Singer_Sings_Song.SingerId" +
            " order by Songs.ClickNum desc"; 
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Read")
        {
            //form1.Target = "_blank"; 
            Label singer = (Label)e.Item.FindControl("SingerNameLabel");
            String singerName = singer.Text.ToString();
            String singerId;
            int click;
            string sql = "Data Source=(local);Initial Catalog=MusicDatabase;Integrated Security=false ;User ID=sa;Password=1234";
            SqlConnection conn = new SqlConnection(sql);
            conn.Open();
            //从歌手表中读数据
            string search = "select ClickNum from Singers where SingerName ='" + singerName + "'";
            SqlCommand comm = new SqlCommand();
            comm.CommandText = search;
            comm.Connection = conn;
            SqlDataReader dr = comm.ExecuteReader();
            if (dr.HasRows == true)
            {
                int i = 1;
                if (dr.Read())
                {
                    singerRank = i.ToString();
                    click = (int)dr["ClickNum"];
                    //歌手被点击，所以点击率加1
                    click++;
                    string s_url;
                    s_url = "SingerPage.aspx?singer=" + singerName; //由c#后台向java script传参数
                    Response.Write("<Script language=JavaScript>window.open('" + s_url + "');</Script>");
                    dr.Close();
                    //更新歌手点击率
                    string clickUpdate = "UPDATE Singers SET ClickNum = '" + click + "' where SingerName ='" + singerName + "'";
                    SqlCommand comm2 = new SqlCommand();
                    comm2.CommandText = clickUpdate;
                    comm2.Connection = conn;
                    comm2.ExecuteReader();
                    i++;
                }
            }
            conn.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("MainPage.aspx");
    }
    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Listen")
        {
            //form1.Target = "_blank"; 
            Label song = (Label)e.Item.FindControl("SongNameLabel");
            String songId;
            int click;
            string sql = "Data Source=(local);Initial Catalog=MusicDatabase;Integrated Security=false ;User ID=sa;Password=1234";
            SqlConnection conn = new SqlConnection(sql);
            conn.Open();
            //从歌曲表中读数据
            string search = "select SongId, ClickNum from Songs where SongName ='" + song.Text.ToString() + "'";
            SqlCommand comm = new SqlCommand();
            comm.CommandText = search;
            comm.Connection = conn;
            SqlDataReader dr = comm.ExecuteReader();
            if (dr.HasRows == true)
            {
                if (dr.Read())
                {
                    songId = dr["SongId"].ToString();
                    click = (int)dr["ClickNum"];
                    //歌曲被点击，所以点击率加1
                    click++;
                    string s_url;
                    s_url = "SongPage.aspx?songname=" + songId; //由c#后台向java script传参数
                    Response.Write("<Script language=JavaScript>window.open('" + s_url + "');</Script>");
                    dr.Close();
                    //更新音乐点击率
                    string clickUpdate = "UPDATE Songs SET ClickNum = '" + click + "' where SongName ='" + song.Text.ToString() + "'";
                    SqlCommand comm2 = new SqlCommand();
                    comm2.CommandText = clickUpdate;
                    comm2.Connection = conn;
                    comm2.ExecuteReader();
                }
            }
            conn.Close();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class MainPage : System.Web.UI.Page
{
    protected String str = "<img src=\"images/logo.jpg\" height = \"30px\" width = \"30px\"/>";
    protected String tablestr = "<table border=0  width=\"100%\" height=\"100%\"";
    protected String tablestr2 = "<table border=0  align=\"center\" width=\"100%\" height=\"100%\"";
    protected String txt = "";
    
            
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["username"] != null)
            {
                String username = Session["username"].ToString();
                if (username != null)
                {
                    Panel1.Visible = false;
                    Response.Write("你好，" + "<a href=\"MemberPage.aspx\">" + username + "</a>" + "欢迎来到音乐网站！");
                    Session["username"] = username;
                    Session["isLogin"] = "yes";
                }
            }

            this.Panel3.Visible = true;
            this.Panel4.Visible = true;
            string sql = "Data Source=(local);Initial Catalog=MusicDatabase;Integrated Security=false ;User ID=sa;Password=1234";
            SqlConnection conn = new SqlConnection(sql);
            conn.Open();

            //从歌手表中读数据
            string search = "select * from Singers order by ClickNum desc";
            SqlCommand comm = new SqlCommand();
            comm.CommandText = search;
            comm.Connection = conn;
            SqlDataReader dr = comm.ExecuteReader();
            if (dr.HasRows == true)
            {
                int i = 1;
                while (dr.Read())
                {
                    String imgpath = "singers/" + dr["SingerUml"].ToString();
                    String name = dr["SingerName"].ToString();
                    tablestr = tablestr + "<tr style=\"font-weight: bold; font-family: 华文楷体; font-size: x-large\">  <td> " + i + "</td>";
                    tablestr = tablestr + "<td> <img src='" + imgpath + "' height=\"30px\" width=\"30px\"/> </td>";
                    tablestr = tablestr + "<td style=\"font-weight: bold; font-family: 华文楷体; font-size: x-large\">" + name + "</td> </tr>";
                    i++;
                }
            }
            dr.Close();
            tablestr = tablestr + "</table>";

            //热门歌曲初始化
            //从歌曲表中读数据
            string search2 = "select * from Songs, Singers, Singer_Sings_Song" +
                " where Songs.SongId = Singer_Sings_Song.SongId AND Singers.SingerId = Singer_Sings_Song.SingerId" +
                " order by Songs.ClickNum desc";
            SqlCommand comm2 = new SqlCommand();
            comm2.CommandText = search2;
            comm2.Connection = conn;
            SqlDataReader dr2 = comm2.ExecuteReader();
            if (dr2.HasRows == true)
            {
                int j = 1;
                while (dr2.Read() && j < 11)
                {
                    tablestr2 = tablestr2 + "<tr>  <td style=\"font-weight: bold; font-family: 华文楷体; font-size: x-large\" height = \"30px\" width = \"30px\"> " + j + "</td>";
                    tablestr2 = tablestr2 + "<td style=\"font-weight: bold; font-family: 华文楷体; font-size: x-large\"> " + dr2["SongName"].ToString() + "</td>";
                    tablestr2 = tablestr2 + "<td style=\"font-weight: bold; font-family: 华文楷体; font-size: x-large\"> " + dr2["SingerName"].ToString() + "</td> </tr>";
                    j++;
                }
            }
            dr2.Close();
            conn.Close();
            tablestr2 = tablestr2 + "</table>";
        }
        else 
        {
            tablestr = "";
            tablestr2 = "";
            if (Session["username"] != null)
            {
                String username = Session["username"].ToString();
                if (username != null)
                {
                    Panel1.Visible = false;
                    Response.Write("你好，" + "<a href=\"MemberPage.aspx\">" + username + "</a>" + "欢迎来到音乐网站！");
                    Session["username"] = username;
                    Session["isLogin"] = "yes";
                }
            }
        }
    }

    protected void ButtonReg_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }

    //登陆按钮
    protected void ButtonLog_Click(object sender, EventArgs e)
    {
        String username = TextUser.Text.ToString();
        String password = TextPw.Text.ToString();

        string sql = "Data Source=(local);Initial Catalog=MusicDatabase;Integrated Security=false ;User ID=sa;Password=1234";
        SqlConnection conn = new SqlConnection(sql);
        conn.Open();

        //从会员表中查询数据
        string search = "select * from Members where MemberUser = '" + username + "' and Password = '" + password + "'"; 
        SqlCommand comm = new SqlCommand();
        comm.CommandText = search;
        comm.Connection = conn;
        SqlDataReader dr = comm.ExecuteReader();
        if (dr.HasRows == true)
        {
             Panel1.Visible = false;
             Response.Write("你好，" + "<a href=\"MemberPage.aspx\">" + username + "</a>" + "欢迎来到音乐网站！");
             Session["username"] = username;
             Session["isLogin"] = "yes";
        }
        else 
        {
             LabelWrong.Text = "用户名或密码错误，请重新输入！";
        }
            
        
        dr.Close();
        conn.Close();
    }

    protected void ButtonSinger_Click(object sender, EventArgs e)
    {
        Response.Redirect("Singer.aspx");
    }
    protected void ButtonRanking_Click(object sender, EventArgs e)
    {
        Response.Redirect("Ranking.aspx");
    }
    protected void ButtonMine_Click(object sender, EventArgs e)
    {
        if (Session["isLogin"] != null)
        {
            Response.Redirect("MemberPage.aspx");
        }
        else
        {
            Response.Write("<script>alert('请先登陆!');</script>");
        }
    }
    protected void ButtonPop_Click(object sender, EventArgs e)
    {
        Response.Redirect("Type.aspx");
    }
    protected void ButtonJazz_Click(object sender, EventArgs e)
    {
        Response.Redirect("Type.aspx");
    }
    protected void ButtonRock_Click(object sender, EventArgs e)
    {
        Response.Redirect("Type.aspx");
    }
    protected void ButtonCla_Click(object sender, EventArgs e)
    {
        Response.Redirect("Type.aspx");
    }
    protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
    {
        this.Panel5.Visible = true;
        this.Panel3.Visible = false;
        this.Panel4.Visible = false;
        txt = TextBoxSrch.Text.ToString();

        SqlDataSource2.SelectCommand = "SELECT * FROM Singers" +
        " INNER JOIN Singer_Sings_Song ON Singers.SingerId = Singer_Sings_Song.SingerId INNER JOIN Songs ON Singer_Sings_Song.SongId " +
        " = Songs.SongId where Songs.SongName like '%" + txt + "%' or Singers.SingerName like '%" + txt + "%'";

    }

    protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
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
        else if (e.CommandName == "Collect")
        {
            if (Session["username"] == null)
                Response.Write("<script>alert('请先登陆!');</script>");
            else
            {
                String user = Session["username"].ToString();
                if (user == null)
                    Response.Write("<script>alert('请登录!');window.location.href ='MainPage.aspx'</script>");
                else
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

                            //添加数据
                            string search2 = "INSERT INTO Member_Has_Song (MemberUser, SongId) VALUES ('" + user + "', '" + songId + "')";
                            SqlCommand comm2 = new SqlCommand();
                            comm2.CommandText = search2;
                            comm2.Connection = conn;
                            comm2.ExecuteNonQuery();
                            Response.Write("<script>alert('收藏成功!');</script>");
                        }
                    }
                    conn.Close();
                }
            }
        }
    }

   
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        String name = TextName.Text.ToString();
        String user = TextUser.Text.ToString();
        String pw = passwordinput1.Text.ToString();
        String email = TextMail.Text.ToString();
        String music = TextMusic.Text.ToString();
        String singer = TextSinger.Text.ToString();
        String autograph = TextAuto.Text.ToString();
        String age = DropDownList1.SelectedValue.ToString();

        String prefer = "";
        if (CheckPop.Checked) 
        {
            prefer = prefer + "Pop ";
        }
        if (CheckClassical.Checked)
        {
            prefer = prefer + "Classical ";
        }
        if (CheckRock.Checked)
        {
            prefer = prefer + "Rock ";
        }
        if (CheckJazz.Checked)
        {
            prefer = prefer + "Dance ";
        }
        if (CheckOpera.Checked)
        {
            prefer = prefer + "Opear ";
        }

        Wizard1.Enabled = true;
        //写入数据库
        //读数据库
        string sql = "Data Source=(local);Initial Catalog=MusicDatabase;Integrated Security=false ;User ID=sa;Password=1234";
        SqlConnection conn = new SqlConnection(sql);
        conn.Open();      
 
        //查找用户名是否有重复
        string find = "select * from Members where MemberUser ='" + user + "'";
        SqlCommand comm = new SqlCommand();
        comm.CommandText = find;
        comm.Connection = conn;
        SqlDataReader dr = comm.ExecuteReader();
        if (dr.HasRows != true)
        {
            //读数据库
            string sql2 = "Data Source=(local);Initial Catalog=MusicDatabase;Integrated Security=false ;User ID=sa;Password=1234";
            SqlConnection conn2 = new SqlConnection(sql2);
            conn2.Open();
            //插入数据
            string tuple = "insert into Members (MemberName ,MemberUser, Password, Mail, AgeScale, FavorType, FavorSong, FavorSinger, Autograph) values ('" + name + "','"
                + user + "','" + pw + "','" + email + "','" + age + "','" + prefer + "','" + music + "','" + singer + "','" + autograph + "')";
            SqlCommand comm2 = new SqlCommand();
            comm2.CommandText = tuple;
            comm2.Connection = conn2;
            comm2.ExecuteReader();
            conn2.Close();
        }
        dr.Close();
        conn.Close();
        
        Response.Write("<script>alert('注册成功!');window.location.href ='MainPage.aspx'</script>"); 
    }

    protected void TextUser_TextChanged(object sender, EventArgs e)
    {
        String user = TextUser.Text.ToString();
        //database
        string sql = "Data Source=(local);Initial Catalog=MusicDatabase;Integrated Security=false ;User ID=sa;Password=1234";
        SqlConnection conn = new SqlConnection(sql);
        conn.Open();

        //查找用户名是否有重复
        string find = "select * from Members where MemberUser ='" + user + "'";
        SqlCommand comm = new SqlCommand();
        comm.CommandText = find;
        comm.Connection = conn;
        SqlDataReader dr = comm.ExecuteReader();
        if (dr.HasRows == true)
        {
            LabelNi.Text = "昵称已被使用，请修改！";
        }
        else 
        {
            LabelNi.Text = "";
        }
        dr.Close();
        conn.Close();
    }
}
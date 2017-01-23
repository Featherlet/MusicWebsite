using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Type : System.Web.UI.Page
{
    protected String tablestr1 = "<table border=1 class=\"style1\"";
    protected String tablestr2 = "<table border=1 class=\"style1\"";
    protected String tablestr3 = "<table border=1 class=\"style1\"";
    protected String tablestr4 = "<table border=1 class=\"style1\"";

    protected void Page_Load(object sender, EventArgs e)
    {
        string sql = "Data Source=(local);Initial Catalog=MusicDatabase;Integrated Security=false ;User ID=sa;Password=1234";
        SqlConnection conn = new SqlConnection(sql);
        conn.Open();

        //流行乐表
        string search1 = "select * from Songs, Singers, Singer_Sings_Song" +
            " where Songs.SongId = Singer_Sings_Song.SongId AND Singers.SingerId = Singer_Sings_Song.SingerId" +
            " AND Songs.SongType = 'Pop'"; 
        SqlCommand comm1 = new SqlCommand();
        comm1.CommandText = search1;
        comm1.Connection = conn;
        SqlDataReader dr = comm1.ExecuteReader();
        if (dr.HasRows == true)
        {
            int i = 1;
            while (dr.Read())
            {
                String name = dr["SingerName"].ToString();
                String song = dr["SongName"].ToString();
                tablestr1 = tablestr1 + "<tr>  <td width=\"80px\" height=\"30px\"> " + i + "</td>";
                tablestr1 = tablestr1 + "<td   width=\"160px\" height=\"30px\">" + song + "</td>";
                tablestr1 = tablestr1 + "<td   width=\"160px\" height=\"30px\">" + name + "</td> </tr>"; 
                i++;
            }
        }
        dr.Close();
        tablestr1 = tablestr1 + "</table>";

        //摇滚乐表
        string search2 = "select * from Songs, Singers, Singer_Sings_Song" +
            " where Songs.SongId = Singer_Sings_Song.SongId AND Singers.SingerId = Singer_Sings_Song.SingerId" +
            " AND Songs.SongType = 'Rock'";
        SqlCommand comm2 = new SqlCommand();
        comm2.CommandText = search2;
        comm2.Connection = conn;
        dr = comm2.ExecuteReader();
        if (dr.HasRows == true)
        {
            int i = 1;
            while (dr.Read())
            {
                String name = dr["SingerName"].ToString();
                String song = dr["SongName"].ToString();
                tablestr2 = tablestr2 + "<tr>  <td width=\"80px\" height=\"30px\"> " + i + "</td>";
                tablestr2 = tablestr2 + "<td  width=\"160px\" height=\"20px\">" + song + "</td>";
                tablestr2 = tablestr2 + "<td  width=\"160px\" height=\"20px\">" + name + "</td> </tr>";
                i++;
            }
        }
        dr.Close();
        tablestr2 = tablestr2 + "</table>";

        //舞曲表
        string search3 = "select * from Songs, Singers, Singer_Sings_Song" +
            " where Songs.SongId = Singer_Sings_Song.SongId AND Singers.SingerId = Singer_Sings_Song.SingerId" +
            " AND Songs.SongType = 'Dance'";
        SqlCommand comm3 = new SqlCommand();
        comm3.CommandText = search3;
        comm3.Connection = conn;
        dr = comm3.ExecuteReader();
        if (dr.HasRows == true)
        {
            int i = 1;
            while (dr.Read())
            {
                String name = dr["SingerName"].ToString();
                String song = dr["SongName"].ToString();
                tablestr3 = tablestr3 + "<tr>  <td width=\"80px\" height=\"30px\"> " + i + "</td>";
                tablestr3 = tablestr3 + "<td  width=\"160px\" height=\"20px\">" + song + "</td>";
                tablestr3 = tablestr3 + "<td  width=\"160px\" height=\"20px\">" + name + "</td> </tr>";
                i++;
            }
        }
        dr.Close();
        tablestr3 = tablestr3 + "</table>";


        //古典乐表
        string search4 = "select * from Songs, Singers, Singer_Sings_Song" +
            " where Songs.SongId = Singer_Sings_Song.SongId AND Singers.SingerId = Singer_Sings_Song.SingerId" +
            " AND Songs.SongType = 'Classical'";
        SqlCommand comm4 = new SqlCommand();
        comm4.CommandText = search4;
        comm4.Connection = conn;
        dr = comm4.ExecuteReader();
        if (dr.HasRows == true)
        {
            int i = 1;
            while (dr.Read())
            {
                String name = dr["SingerName"].ToString();
                String song = dr["SongName"].ToString();
                tablestr4 = tablestr4 + "<tr>  <td width=\"80px\" height=\"30px\"> " + i + "</td>";
                tablestr4 = tablestr4 + "<td  width=\"160px\" height=\"20px\">" + song + "</td>";
                tablestr4 = tablestr4 + "<td  width=\"160px\" height=\"20px\">" + name + "</td> </tr>";
                i++;
            }
        }
        dr.Close();
        tablestr4 = tablestr4 + "</table>";

        conn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("MainPage.aspx");
    }
}
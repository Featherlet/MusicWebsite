using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Singer : System.Web.UI.Page
{
    protected String tablestr = "<table border=1 width=\"100%\" height=\"100%\""; //  
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        String letter= RadioButtonList1.SelectedValue.ToString();
        
        //读数据库
        string sql = "Data Source=(local);Initial Catalog=MusicDatabase;Integrated Security=false ;User ID=sa;Password=1234";
        SqlConnection conn = new SqlConnection(sql);
        conn.Open();

        //从歌手表中读数据
        string search = "select * from Singers where FirstLetter ='" + letter + "'"; 
        SqlCommand comm = new SqlCommand();
        comm.CommandText = search;
        comm.Connection = conn;
        SqlDataReader dr = comm.ExecuteReader();

        if (dr.HasRows == true)
        {
            while (dr.Read()) { 
                String imgpath = "singers/" + dr["SingerUml"].ToString();
                String describ = dr["Description"].ToString();
                tablestr = tablestr + "<tr>  <td height=\"60px\" width=\"60px\"> <img src='" + imgpath + "'/> </td>"; //height=\"100%\" width=\"100%\" 
                tablestr = tablestr + "<td  class=\"style1\"> <p>" + describ + " </p></td> </tr>";
            }
        }
        dr.Close();
        conn.Close();
        tablestr = tablestr + "</table>";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("MainPage.aspx");
    }
}
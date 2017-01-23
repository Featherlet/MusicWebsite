using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class SingerPage : System.Web.UI.Page
{
    protected String name = "";
    protected String uml = "";
    protected String description = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        String str = "";
        str = Request.QueryString["singer"];
        /*if (str == null)
        {
            HttpContext rp = HttpContext.Current;
            str = rp.Request.Form["singer"].ToString();
        }*/
        
        string sql = "Data Source=(local);Initial Catalog=MusicDatabase;Integrated Security=false ;User ID=sa;Password=1234";
        SqlConnection conn = new SqlConnection(sql);
        conn.Open();

        //从歌手表中读数据
        string search = "select * from Singers where SingerName ='" + str + "'"; 
        SqlCommand comm = new SqlCommand();
        comm.CommandText = search;
        comm.Connection = conn;
        SqlDataReader dr = comm.ExecuteReader();
        if (dr.HasRows == true)
        {
            if (dr.Read())
            {
                name = dr["SingerName"].ToString();
                uml = dr["SingerUml"].ToString();
                description = dr["Description"].ToString();
            }
        }
        dr.Close();
        conn.Close();
    }
}
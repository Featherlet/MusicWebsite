using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

public partial class SongPage : System.Web.UI.Page
{
    protected String embed = "";
    protected String songname = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        
        String songId = Request.QueryString["songname"];
        if (songId == null)
        {
            HttpContext rp = HttpContext.Current;
            songId = rp.Request.Form["song"].ToString();
        }
        String lyrics = "";
        String strLine;
        String songPath = "";
        String song = "";
        String lyricsPath = "";

        string sql = "Data Source=(local);Initial Catalog=MusicDatabase;Integrated Security=false ;User ID=sa;Password=1234";
        SqlConnection conn = new SqlConnection(sql);
        conn.Open();

        //从歌曲表中读数据
        string search = "select * from Songs where SongId ='" + songId + "'";
        SqlCommand comm = new SqlCommand();
        comm.CommandText = search;
        comm.Connection = conn;
        SqlDataReader dr = comm.ExecuteReader();

        if (dr.HasRows == true)
        {
            if (dr.Read())
            {
                songname = dr["SongName"].ToString();
                songPath = "E:/webPro/MusicWeb/songs/" + dr["SongUml"].ToString();
                //song = "songs/" + dr["SongUml"].ToString();
                lyricsPath = "E:/webPro/MusicWeb/lyrics/" + dr["SongLyrics"].ToString();
            }
        }
       
        
        if (File.Exists(@songPath)) //文件存在
        {
            embed = "<embed src='songs/" + dr["SongUml"].ToString() + "' hidden=\"false\" autostart=\"false\" loop=\"false\"> </embed>";
        }
        else
        {
            embed = "<p>找不到歌曲文件</p>";
        }

        if (File.Exists(@lyricsPath)) //文件存在
        {
            FileStream fs = new System.IO.FileStream(lyricsPath, System.IO.FileMode.Open, System.IO.FileAccess.Read, FileShare.ReadWrite);
            StreamReader sr = new StreamReader(fs,System.Text.Encoding.ASCII);
            
            strLine = sr.ReadLine();
            while (strLine != null)
            {
                lyrics = lyrics + strLine + "\n";
                strLine = sr.ReadLine();
            }
            sr.Close();
            LyricsBox.Text = lyrics;
        }
        dr.Close();
        conn.Close();
    }
}
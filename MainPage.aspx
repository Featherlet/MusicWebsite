<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="MainPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-size: xx-large;
            font-family: 楷体;
            font-weight: 700;
        }
        .style5
        {
            width: 45px;
        }
        .style6
        {
            width: 363px;
        }
        .style8
        {
            width: 300px;
        }
        </style>
    </head>
<body >
    <form id="form1" runat="server">
    <div>

    <asp:Panel ID="Panel1" runat="server" Height="100px" style="margin-top: 0px" 
                        HorizontalAlign="Left" BackImageUrl="~/images/sky2.jpg" 
            BorderStyle="None">
                        <asp:Label ID="LabelNote" runat="server" Text="游客您好，请登录, 不是会员的请点击注册:"></asp:Label>
&nbsp;<asp:Button ID="ButtonReg" runat="server" Text="注册" onclick="ButtonReg_Click" />
                        <br />
                        <asp:Label ID="LabelUser" runat="server" Text="用户名"></asp:Label>
                        <asp:TextBox ID="TextUser" runat="server"></asp:TextBox>
                        &nbsp;
                        <asp:Label ID="LabelPw" runat="server" Text="密码"></asp:Label>
                        <asp:TextBox ID="TextPw" runat="server" TextMode="Password"></asp:TextBox>
                        &nbsp;<asp:Button ID="ButtonLog" runat="server" Text="登陆" 
                            onclick="ButtonLog_Click" />
                        &nbsp;<asp:Label ID="LabelWrong" runat="server"></asp:Label>
        </asp:Panel> 
        <asp:Panel ID="Panel7" runat="server" BackImageUrl="~/images/sky2.jpg" 
            BorderStyle="None" HorizontalAlign="Center">
            <img src="images/phones.jpg" style="height: 65px; width: 169px"/>
        
                    <asp:TextBox ID="TextBoxSrch" runat="server" Width="572px" 
                style="font-size: large" AutoPostBack="True"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="46px" 
                        ImageUrl="~/images/magnifying.jpg" style="margin-bottom: 0px" 
                Width="50px" onclick="ImageButton1_Click1" />
        </asp:Panel> 
        <asp:Panel ID="Panel2" runat="server" BackColor="#6699FF">
        <p align = "center"> 
            <asp:Button ID="ButtonSinger" runat="server" Text="歌手查询" Height="35px" 
                Width="190px" style="font-size: xx-large" onclick="ButtonSinger_Click" />
            <asp:Button ID="ButtonRanking" runat="server" Text="热度排行" Height="35px" 
                Width="190px" style="font-size: xx-large" onclick="ButtonRanking_Click" />
            <asp:Button ID="ButtonMine" runat="server" Text="我的收藏" Height="35px" 
                Width="190px" style="font-size: xx-large" onclick="ButtonMine_Click" />
        </p>
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server" HorizontalAlign="Center" Visible="False" >
            <img src="images/logo.jpg" width="100%" height="50%"/>
        </asp:Panel> 
    
       <asp:Panel ID="Panel4" runat="server" Visible="False" 
            BackImageUrl="~/images/bubble.jpg" BorderColor="#6699FF" >
       <table style="width:100%;" border="0">
        <tr>
            <td align="justify" class="style8">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label7" runat="server" class="style1" Text="热门歌手排行"></asp:Label>
                <%=tablestr %>
            </td>
            <td bgcolor="#6699FF" class="style5">
                &nbsp
            </td>
            <td align="justify" class="style8">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label6" runat="server" class="style1" Text="热度歌曲排行"></asp:Label>
                <%=tablestr2 %>
            </td>
            <td bgcolor="#6699FF" class="style5">
                &nbsp
            </td>
            <td align="center" class="style6">
                <asp:Label ID="Label8" runat="server" style="text-align: center" class="style1"
                    Text="选择你喜爱的音乐类型"></asp:Label>
                <br />
                <br />
                <asp:Button ID="ButtonPop" runat="server" BackColor="#9FFF9F" Height="63px" 
                    Text="流行乐" Width="99px" ToolTip="时下流行热曲" onclick="ButtonPop_Click" 
                    style="font-size: x-large; font-family: 楷体; font-weight: 700" />
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="ButtonJazz" runat="server" BackColor="#FCF09C" Height="55px" 
                    Text="动感舞曲" Width="129px" 
                    style="margin-right: 14px; font-size: x-large; font-family: 楷体; font-weight: 700;" ToolTip="跟随节拍尽情舞动" 
                    onclick="ButtonJazz_Click" />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="ButtonRock" runat="server" BackColor="#F05B57" Height="61px" 
                    onclick="ButtonRock_Click" 
                    style="font-size: x-large; font-family: 楷体; font-weight: 700" Text="摇滚乐" 
                    ToolTip="重金属的轰炸" Width="121px" />
                <br />
                &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Button ID="ButtonCla" runat="server" BackColor="#CC9900" Height="53px" 
                    onclick="ButtonCla_Click" 
                    style="font-size: x-large; font-family: 楷体; font-weight: 700" Text="古典音乐" 
                    ToolTip="穿越时间的声音" Width="138px" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                &nbsp;&nbsp;
                <br />
            </td>          
         </tr>
    </table>
    </asp:Panel>

    <asp:Panel ID="Panel5" runat="server" HorizontalAlign="Center" Visible="False" 
            BackImageUrl="~/images/bubble.jpg" BorderColor="#6699FF">
        <asp:DataList ID="DataList1" runat="server" HorizontalAlign="Center" 
            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Horizontal" 
             Width="949px" onitemcommand="DataList1_ItemCommand1">
            <ItemTemplate>
                  <table border="0" width="100%">
                      <tr>
                            <td Width="10%" align=center valign=middle><span style="color: navy">歌曲名</span></td>
                            <td Width="23%"><asp:Label ID="SongNameLabel" runat="server" Text='<%# Eval("SongName") %>' Font-Bold="True" Font-Size="Large" Font-Names="楷体 "></asp:Label></td>
                            <td Width="10%" align=center valign=middle><span style="color: navy">歌手名</span></td>                       
                            <td Width="23%"><asp:Label ID="SingerNameLabel" runat="server" Text='<%# Eval("SingerName") %>' Font-Bold="True" Font-Size="Large" Font-Names="楷体 "></asp:Label></td>
                            <td Width="24%"><asp:Button ID="Button2" runat="server" Text="收听" CommandName="Listen" Font-Size="Large" /></td>
                            <td Width="24%"><asp:Button ID="Button3" runat="server" Text="收藏" CommandName="Collect" Font-Size="Large" /></td>
                        </tr> 
                    </table>
                    </ItemTemplate>
            <AlternatingItemStyle BackColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />

        </asp:DataList>
        
     
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"   ConnectionString="<%$ ConnectionStrings:MusicDatabaseConnectionString %>"></asp:SqlDataSource>
           
    </asp:Panel>
    <asp:Panel ID="Panel6" runat="server" Height="79px" BackColor="#6699FF" 
            BorderColor="#6699FF" BorderStyle="None" HorizontalAlign="Center">
        <br />
        作者：杨丹羽<br /> 学号：1122900114<br /> 班级：12级2班
        </asp:Panel>
        
    </div>
    </form>
    </body>
</html>

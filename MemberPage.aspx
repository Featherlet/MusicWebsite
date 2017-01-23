<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberPage.aspx.cs" Inherits="MemberPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
    <style type="text/css">
        .style1
        {
            font-size: x-large;
            font-family: 楷体;
        }
        .style2
        {
            font-family: 华文楷体;
            font-size: x-large;
        }
    </style>
   
</head>
<body >
    <form id="form1" runat="server">
    <div align="center">
    <asp:Panel ID="Panel3" runat="server" HorizontalAlign="Left" BackImageUrl="~/images/member.jpg" Height="1000px">
        <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Left">
            <asp:Button ID="Button1" runat="server" Text="返回首页" onclick="Button1_Click" 
                Height="42px" style="font-size: large" Width="131px" />
        </asp:Panel>
        <table style="width: 100%;" align="center">
            <caption>
                `
                <tr>
                    <td align="center" colspan="2">
                        <asp:Label ID="Label1" runat="server" style="font-size: xx-large" Text="我的收藏夹"></asp:Label>
                    </td>
                </tr>
            </caption>
            </tr>
            <tr>                         
                <td align="center" >
                    <p class="style1">已收藏的曲目：</p>
                    <asp:DataList ID="DataList1" runat="server" CellPadding="4" 
                        DataSourceID="SqlDataSource1" ForeColor="#333333" 
                        Width="566px" 
                        onitemcommand="DataList1_ItemCommand">
                        <AlternatingItemStyle BackColor="White" />
                        <ItemTemplate>
                        <table border="1" width="100%">
                        <tr>
                            <td  Width="10%" align=center valign=middle><span style="color: navy">歌曲名</span></td>
                            <td  Width="20%"><asp:Label ID="SongNameLabel" runat="server" Text='<%# Eval("SongName") %>'></asp:Label></td>
                            <td  Width="10%"align=center valign=middle><span style="color: navy">歌手名</span></td>                       
                            <td  Width="20%"><asp:Label ID="SingerNameLabel" runat="server" Text='<%# Eval("SingerName") %>'></asp:Label></td>
                            <td  Width="20%"><asp:Button ID="Button2" runat="server" Text="收听" CommandName="Listen" /></td>
                            <td  Width="20%"><asp:Button ID="Button3" runat="server" Text="删除" CommandName="Delete"/></td>
                        </tr>
                    </table>
                    </ItemTemplate>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#EFF3FB" />
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataList>
           
                <td class="style18" align="center">
                <p class="style2">添加曲目：</p>
                <table border="1" style="color:#4A3C8C;background-color:#E7E7FF; width: 623px;" 
                        align=center>
                    <tr align=center>
                        <td align="center" valign="middle" class="style20"  >歌手名</td>
                        <td class="style13" ><asp:TextBox ID="SingerNameTextBox" runat="server" Width="97%" 
                                Text='' CssClass="style9"></asp:TextBox></td>
                        <td align="center" valign="middle" class="style21">歌曲名</td>
                        <td class="style16" >
                            <asp:TextBox ID="SongNameTextBox" runat="server" Width="91%" 
                                Text='' ></asp:TextBox></td>
                    </tr>
                    <tr align=center>                        
                        <td align="center" valign="middle" class="style20" >歌曲类型</td>
                        <td class="style13" align="left" >
                            <asp:DropDownList ID="DropDownList1" runat="server" >
                                <asp:ListItem>Pop</asp:ListItem>
                                <asp:ListItem>Classical</asp:ListItem>
                                <asp:ListItem>Dance</asp:ListItem>
                                <asp:ListItem>Opera</asp:ListItem>
                                <asp:ListItem>Rock</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="left" valign="middle" class="style21"  >上传文件</td>
                        <td class="style16" > 
                            <asp:FileUpload ID="SongUpload" runat="server" 
                                 /></td> 
                    </tr>
                    <tr align=center>
                        <td align="center" valign="middle" class="style20" >上传歌词</td>
                        <td class="style13" > 
                            <asp:FileUpload ID="LyricsUpload1" runat="server" 
                                /></td> 
                        <td class="style21"  > 
                            <asp:Button ID="BtAdd" runat="server" Text="新增" 
                                onclick="BtAdd_Click1" style="font-size: large"  /></td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Panel ID="Panel2" runat="server" Width="100%" Height="100%" >
                        <br />
                        <br />
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                            BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" 
                            Font-Size="9pt" ForeColor="Black" Height="283px" FirstDayOfWeek="Sunday" NextPrevFormat="FullMonth" 
                            SelectionMode="DayWeekMonth" 
                            SelectMonthText="月&amp;gt;&amp;gt;" SelectWeekText="周&amp;gt;" 
                            Width="356px">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                                Height="8pt" />
                            <DayStyle BackColor="#CCCCCC" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
                                Font-Size="12pt" ForeColor="White" Height="12pt" />
                            <TodayDayStyle BackColor="#999999" ForeColor="White" />
                        </asp:Calendar>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        </asp:Panel>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MusicDatabaseConnectionString %>" ></asp:SqlDataSource>
       
        <br />
    
    </div>
    </form>
</body>
</html>

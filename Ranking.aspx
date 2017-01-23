<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ranking.aspx.cs" Inherits="Ranking" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 409px;
        }
        .style5
        {
            width: 363px;
        }
        .style6
        {
            width: 16px;
        }
        .style7
        {
            font-size: x-large;
            font-family: 楷体;
        }
        .style8
        {
            font-size: x-large;
            font-family: 华文楷体;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>       
        <asp:Panel ID="Panel2" runat="server" Height="1000px" 
            BackImageUrl="~/images/rankback.jpg">
        
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="返回首页" 
            Height="42px" style="font-size: large" Width="151px" />
     <asp:Panel ID="Panel1" runat="server" Height="70px" HorizontalAlign="Center">
         <asp:Label ID="Label1" runat="server" Text="热门排行" style="font-size: xx-large"></asp:Label>
    </asp:Panel>

    <table style="width: 100%;" border="0" align="center">
        <tr>
            <td class="style5" align="center">
                <span class="style7">歌手热度排行</span><br class="style7" />
                <asp:DataList ID="DataList1" runat="server" CellPadding="4" 
                    DataSourceID="SqlDataSource1" ForeColor="#333333" 
                    onitemcommand="DataList1_ItemCommand" Width="433px">
                    <ItemTemplate>
                       <table border="0" width="100%">
                          <tr>
                            <td Width="50px"><asp:Label ID="SingerRank" runat="server" Text='<%# Container.ItemIndex+1%>'></asp:Label></td>                      
                            <td Width="100px"><asp:Label ID="SingerNameLabel" runat="server" Text='<%# Eval("SingerName") %>'></asp:Label></td>
                            <td Width="100px"><asp:Button ID="Button2" runat="server" Text="查看" CommandName="Read" /></td>
                          </tr> 
                      </table>
                    </ItemTemplate>
                    <AlternatingItemStyle BackColor="White" />
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                </asp:DataList>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MusicDatabaseConnectionString %>"></asp:SqlDataSource>
            </td>
            <td class="style6">                
                &nbsp;&nbsp;</td>
            <td class="style1" align="center">
                <span class="style8">歌曲热度排行</span><br />
                <asp:DataList ID="DataList2" runat="server" CellPadding="4" 
                    DataSourceID="SqlDataSource2" ForeColor="#333333" Width="485px" 
                    onitemcommand="DataList2_ItemCommand">
                    <ItemTemplate>
                    <table border="0" width="100%">
                      <tr>
                            <td Width="50px"><asp:Label ID="SongRank" runat="server" Text='<%# Container.ItemIndex+1%>'></asp:Label></td>                         
                            <td Width="100px"><asp:Label ID="SingerNameLabel" runat="server" Text='<%# Eval("SingerName") %>'></asp:Label></td>
                            <td Width="100px"><asp:Label ID="SongNameLabel" runat="server" Text='<%# Eval("SongName") %>'></asp:Label></td>                          
                            <td Width="100px"><asp:Button ID="Button2" runat="server" Text="试听" CommandName="Listen" /></td>
                        </tr> 
                    </table>
                    </ItemTemplate>
                    <AlternatingItemStyle BackColor="White" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#EFF3FB" />
                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
                <br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MusicDatabaseConnectionString %>"></asp:SqlDataSource>
            </td> 
        </tr>
        
    </table>

    </asp:Panel>
    </div>
    </form>
</body>
</html>

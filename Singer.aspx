<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Singer.aspx.cs" Inherits="Singer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
     <asp:Panel ID="Panel4" runat="server" HorizontalAlign="Left" BackColor="#DAB58F" 
            Height="914px">   

        <asp:Panel ID="Panel3" runat="server" HorizontalAlign="Left">
            <asp:Button ID="Button1" runat="server" Text="返回主页" onclick="Button1_Click" 
                Height="44px" style="font-size: large" Width="137px" />
        </asp:Panel>
        <br />
        
        <asp:Label ID="Label1" runat="server" 
            style="font-size: xx-large; text-align: center" Text="歌手查找">
        </asp:Label>
        
    &nbsp;
    
        <table style="width:100%;" bgcolor="#E4CAAF">
        <tr>
            <td bgcolor="#E4CAAF">
                <strong>按字母：</strong></td>
            <td bgcolor="#E4CAAF">
        <asp:RadioButtonList 
            ID="RadioButtonList1" runat="server" 
            RepeatDirection="Horizontal" CellSpacing="10" Width="100px" 
            onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
            AutoPostBack="True" ForeColor="Maroon" style="font-size: large; font-weight: 700"> 
            <asp:ListItem>C</asp:ListItem>
            <asp:ListItem>E</asp:ListItem>
            <asp:ListItem>L</asp:ListItem>
            <asp:ListItem>S</asp:ListItem>
            <asp:ListItem>V</asp:ListItem>
            <asp:ListItem>W</asp:ListItem>
            <asp:ListItem>Z</asp:ListItem>
        </asp:RadioButtonList>
    
            </td>
            <td bgcolor="#E4CAAF">
                <asp:Image ID="Image1" runat="server" Height="73px" 
                    ImageUrl="~/images/yuepu3.jpg" Width="395px" />
                <asp:Image ID="Image2" runat="server" Height="73px" 
                    ImageUrl="~/images/yuepu3.jpg" Width="395px" />
            </td>
        </tr>
    </table>
    
    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="请根据歌手名字的首字母查找!" 
            style="font-size: x-large"></asp:Label>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="False">
        <%=tablestr %>
    </asp:Panel>
    
    <table style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </asp:Panel>
    </div>
    </form>
</body>
</html>

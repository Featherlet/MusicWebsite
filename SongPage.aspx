<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SongPage.aspx.cs" Inherits="SongPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" style="width: 100%;">
            <tr>
                <td width="40%" style="font-weight: bold; font-family: 华文楷体; font-size: x-large" 
                    align="center">
                    <%=songname %>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="40%" align="center">
                    <%=embed %>
                </td>  
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>        
            </tr>
            <tr>
                <td width="40%" align="center">
                    <asp:TextBox ID="LyricsBox" runat="server" TextMode="MultiLine" Height="126px" 
            Width="401px" Font-Size="Large"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        

        <br />
         
    </div>
    </form>
</body>
</html>

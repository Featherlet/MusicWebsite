<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SingerPage.aspx.cs" Inherits="SingerPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table border="0" style="width:100%;" align="center">
            <tr>
                <td align="center" width="40%" style="font-weight: bold; font-family: 华文楷体; font-size: x-large">
                    <%=name %></td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" height="100%" width="40%">
                    <img alt="" src="singers/<%=uml %>" width="80%" /></td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    <p width="40%"><%=description %></p></td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Type.aspx.cs" Inherits="Type" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-size: x-large;
            text-align: center;
            height: 20px;
            font-family: 楷体;
            font-weight:bold;
        }
        .style2
        {
            height: 20px;
        }
        .style3
        {
            height: 175px;
        }
        .style4
        {
            font-size: xx-large;
            text-align: center;
            height: 20px;
            font-family: 楷体;
            font-weight:bold;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel6" runat="server" BackColor="#FFFFA4" Height="1178px">
        
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="返回首页" 
            Height="46px" style="font-size: large" Width="157px" />
        <asp:Panel ID="Panel1" runat="server" Height="72px" HorizontalAlign="Center" 
                BackImageUrl="~/images/wav.jpg">
            <br />
            <asp:Label ID="Label1" runat="server" Text="分 类 歌 曲" 
                style="font-size: xxx-large; font-weight: 700; font-family: 华文新魏; color: #FFFF00;" 
                Font-Size="XX-Large"></asp:Label>
        </asp:Panel>
        <br />
        <table align="center" style="width:100%;" border="0">
            <tr>
                <td align="center" class="style3">
                    <asp:Panel ID="Panel2" runat="server"  
                        BackImageUrl="~/images/pop.jpg" Height="400px" Width="450px">
                        <span class="style4">流行乐<br /> </span><br />
                        <%=tablestr1%>
                    </asp:Panel>                   
                </td>
                <td class="style3">                    
                    &nbsp;
                </td>
                <td align="center" class="style3">
                    <asp:Panel ID="Panel3" runat="server" BackImageUrl="~/images/rock.jpg" 
                        Height="400px" Width="450px">
                        <span class="style4">摇滚乐<br /> </span><br />
                        <%=tablestr2%>
                    </asp:Panel>                    
                </td>
            </tr>
            <tr>
                <td colspan=3> 
                    &nbsp;                  
                </td>
            </tr>
            <tr>
                <td align="center" class="style2">
                    <asp:Panel ID="Panel4" runat="server" 
                        BackImageUrl="~/images/dance.jpg" Height="400px" Width="450px">
                        <span class="style4">舞曲  
                        <br />
                        </span><br /> 
                        <%=tablestr3%>
                    </asp:Panel>                    
                </td>
                <td>                    
                    &nbsp;
                </td>
                <td align="center" class="style2">
                    <asp:Panel ID="Panel5" runat="server" 
                        BackImageUrl="~/images/classical.jpg" Height="400px" Width="450px">
                        <span class="style4">古典音乐<br /> </span><br />
                        <%=tablestr4%>
                    </asp:Panel>                   
                 </td>
            </tr>            
        </table>
        </asp:Panel>
    </div>
    </form>
</body>
</html>

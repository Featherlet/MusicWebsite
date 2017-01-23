<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style22
        {
            font-size: xx-large;
        }
        .style26
        {
            font-size: large;
        }
        .style27
        {
            font-size: small;
        }
        .style28
        {
            font-size: x-large;
        }
        .style29
        {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    
        <br />
        <strong><span class="style22">会员注册</span></strong><br />
        <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" BackColor="#EFF3FB" 
            BorderColor="#B5C7DE" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
            Height="672px" Width="888px" 
            onfinishbuttonclick="Wizard1_FinishButtonClick" style="margin-right: 16px">
            <HeaderStyle BackColor="#284E98" BorderColor="#EFF3FB" BorderStyle="Solid" 
                BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="White" 
                HorizontalAlign="Center" />
            <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" 
                BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
                ForeColor="#284E98" />
            <SideBarButtonStyle BackColor="#507CD1" Font-Names="Verdana" 
                ForeColor="White" />
            <SideBarStyle BackColor="#507CD1" Font-Size="0.9em" VerticalAlign="Top" />
            <StepStyle Font-Size="0.8em" ForeColor="#333333" />
            <WizardSteps>
                <asp:WizardStep runat="server" title="Step 1">
                    <div class="style29">
                        <span class="style28"><em><strong>个人基本信息</strong></em></span><br />
                        <br />
                        <br />
                        <span class="style26">&nbsp;真实姓名</span><asp:TextBox ID="TextName" runat="server" 
                            CssClass="style26"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextName" ErrorMessage="姓名不能为空！" style="font-size: large"></asp:RequiredFieldValidator>
                        <span class="style26">
                        <br />
                        <br />
                        &nbsp;&nbsp;用户名</span><asp:TextBox ID="TextUser" runat="server" 
                            CssClass="style26" OnTextChanged="TextUser_TextChanged" 
                            AutoPostBack="True"></asp:TextBox>
                        <asp:Label ID="LabelNi" runat="server" style="font-size: large"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="TextUser" ErrorMessage="昵称不能为空!" style="font-size: large"></asp:RequiredFieldValidator>
                        <span class="style26">
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 密码</span><asp:TextBox ID="passwordinput1" 
                            runat="server" style="font-size: large"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ErrorMessage="密码必须是4位以上" style="font-size: large" ValidationGroup=".{4,}" 
                            ControlToValidate="passwordinput1"></asp:RegularExpressionValidator>
                        <span class="style26">
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp; 密码确认</span><asp:TextBox ID="passwordinput2" runat="server" 
                            style="font-size: large"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="passwordinput1" ControlToValidate="passwordinput2" 
                            ErrorMessage="密码必须保持一致" style="font-size: large"></asp:CompareValidator>
                        <span class="style26">
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 邮箱</span><asp:TextBox ID="TextMail" runat="server" 
                            CssClass="style26"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="TextMail" ErrorMessage="邮箱格式错误！" style="font-size: large" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" style="font-size: large" Text="年龄段"></asp:Label>
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="37px" 
                            style="font-size: large" Width="315px" >
                            <asp:ListItem>default</asp:ListItem>
                            <asp:ListItem Value="10">0--10</asp:ListItem>
                            <asp:ListItem Value="20">11--20</asp:ListItem>
                            <asp:ListItem Value="30">21--30</asp:ListItem>
                            <asp:ListItem Value="40">31--40</asp:ListItem>
                            <asp:ListItem Value="100">40--100</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                        <asp:Label ID="Label4" runat="server"></asp:Label>
                        <asp:Label ID="Label5" runat="server"></asp:Label>
                    </div>
                </asp:WizardStep>
                <asp:WizardStep runat="server" title="Step 2">
                    <div class="style29">
                        <em><span class="style28"><strong>个人偏好信息</strong></span><span class="style26"><br />
                        <br />
                        </span></em>
                        <br />
                        <span class="style26">最喜爱的音乐风格(可多选):
                        <br />
                        </span>
                        <asp:CheckBox ID="CheckPop" runat="server" Text="流行乐" CssClass="style27" />
                        <span class="style27">&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="CheckRock" runat="server" Text="摇滚乐" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="CheckJazz" runat="server" Text="爵士乐" />
                        &nbsp;&nbsp;&nbsp;
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="CheckClassical" runat="server" Text="古典音乐" />
                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="CheckOpera" runat="server" Text="戏曲 " />
                        <br />
                        </span>
                        <br />
                        <br />
                        <br />
                        <span class="style26">最喜爱的歌手<asp:TextBox ID="TextSinger" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        最喜爱的歌曲<asp:TextBox ID="TextMusic" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <br />
                        </span>
                    </div>
                    

                </asp:WizardStep>
                <asp:WizardStep runat="server" title="Step 3">
                    <div class="style29">
                        <span class="style26">填写个人签名,让大家更了解你<br /></span>
                        <asp:TextBox ID="TextAuto" runat="server" CssClass="style26" Height="243px" 
                            TextMode="MultiLine" Width="536px"></asp:TextBox>
                        <span class="style26">
                        <br />
                        <br />
                        点击完成以完成注册,<br />注册完会自动登录到主页.</span></div>
                </asp:WizardStep>
            </WizardSteps>
        </asp:Wizard>
    
    </div>
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="HotelManagementSystemWebApp.Website.Home.Profile.changepassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
     <style>
        body {
            background-color: bisque;
        }

        .pass_form {
            border: 5px solid brown;
            margin: auto;
            width: 30%;
            padding: 10px;
        }

        .outer_div {
            padding: 18px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="outer_div">
        <div class="pass_form">
            <label>Email:</label>
            <br />
            <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
            <br />
            <br />
            <label>Current Password:</label>
            <br />
            <asp:TextBox ID="txtcurrent_pass" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <label>New Password:</label>
            <br />
            <asp:TextBox ID="txtnew_pass" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Submit" runat="server" Text="Change Password" BackColor="#CC0000" BorderColor="Maroon" ForeColor="White" OnClick="Submit_Click"/>
        </div>
    </div>
        </div>
    </form>
</body>
</html>

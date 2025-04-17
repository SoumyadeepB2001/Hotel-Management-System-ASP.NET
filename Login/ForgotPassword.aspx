<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="HotelManagementSystemWebApp.Login.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
<title>Star International Hotel - Login Page</title>
<link rel="stylesheet" href="bootstrap.min.css"/>
<link rel="stylesheet" href="font-awesome.min.css"/>
<script src="popper.min.js"></script>
<script src="bootstrap.min.js"></script>
<style>
    body{
        background-image: url("/Images/Hotel.jpg");
    }
    .login-form {
        width: 340px;
        margin: 50px auto;
        font-size: 15px;
    }
.login-form form {
    margin-bottom: 15px;
    background: #f7f7f7;
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    padding: 30px;
}
.login-form form:hover {
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}
.login-form h2 {
    margin: 0 0 15px;
}
.form-control, .btn {
    min-height: 38px;
    border-radius: 2px;
}
.btn {        
    font-size: 15px;
    font-weight: bold;
}
.container{
    position: relative;
}
</style>
     
</head>
<body>
    <div class="login-form">
    <form id="form1" runat="server">
        <h2 class="text-center">Forgot Password</h2>   
        <div class="form-group">
            <asp:Label ID="lbl_info" runat="server" Text="Enter your Employee ID to send an OTP to your registered Email"></asp:Label>
        </div>  

        <div class="form-group">
            <asp:TextBox ID="txtEId" runat="server" class="form-control" placeholder="Enter your Employee ID." required="required"></asp:TextBox>
        </div>        
        <div class="form-group">
            <asp:Button ID="btnSubmit" runat="server" Text="Send OTP" OnClick="btnSubmit_Click" class="btn btn-primary btn-block"/>
        </div>  
        
        <div class="form-group">
            <asp:TextBox ID="txt_OTP" runat="server" class="form-control" placeholder="Enter your OTP" required="required" Visible="False"></asp:TextBox>
        </div>  
        
        <div class="form-group">
            <asp:TextBox ID="txt_new_pass" runat="server" class="form-control" placeholder="Enter new password" required="required" Visible="False" TextMode="Password"></asp:TextBox>
        </div> 

        <div class="form-group">
            <asp:Button ID="change_password" runat="server" Text="Change Password" OnClick="change_password_Click" class="btn btn-primary btn-block" Visible="False" />
        </div>  

        <div class="form-group">
            <asp:Button ID="resend_password" runat="server" Text="Resend OTP" OnClick="resend_Click" class="btn btn-primary btn-block" Visible="False" CausesValidation="False" UseSubmitBehavior="False" />
        </div>  

        </form>
            
</div>
</body>
</html>

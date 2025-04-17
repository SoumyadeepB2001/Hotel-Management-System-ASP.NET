<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HotelManagementSystemWebApp.Login.Login" %>

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
        <h2 class="text-center">Log in</h2>       
        <div class="form-group">
            <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email" required="required"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control" placeholder="Password" required="required"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btnSubmit" runat="server" Text="Log-in" OnClick="btnLogIn_Click" class="btn btn-primary btn-block"/>
        </div>
        <div class="clearfix">
            <label class="float-left form-check-label"><asp:CheckBox ID="cbRemember" runat="server" /> Remember me</label>
            
            <a href="ForgotPassword.aspx" class="float-right">Forgot Password?</a>
            <br />
            <br />
            <p class="text-center"><a href="Register.aspx">Create an account</a></p>
        </div>
        </form>
            
</div>
</body>
</html>
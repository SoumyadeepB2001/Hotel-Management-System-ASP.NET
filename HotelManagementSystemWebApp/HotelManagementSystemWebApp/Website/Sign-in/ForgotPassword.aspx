<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="HotelManagementSystemWebApp.Website.Sign_in.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot password</title>
    <link rel="stylesheet" href="bootstrap.min.css" />
    <style>
        body {
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

        .container {
            position: relative;
        }
    </style>
</head>
<body>   
            <div class="login-form">
    <form id="form2" runat="server">
        <h2 class="text-center">Forgot Password</h2>   
        <div class="form-group">
            <asp:Label ID="lbl_info" runat="server" Text="Enter your Email ID to send an OTP"></asp:Label>
        </div>  

        <div class="form-group">
            <asp:TextBox ID="txt_email" runat="server" class="form-control" placeholder="Enter your Email." required="required"></asp:TextBox>
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
            <asp:Button ID="resend_otp" runat="server" Text="Resend OTP" OnClick="resend_otp_Click" class="btn btn-primary btn-block" Visible="False" CausesValidation="False" UseSubmitBehavior="False" />
        </div>  

        </form>
            
</div>
</body>
</html>

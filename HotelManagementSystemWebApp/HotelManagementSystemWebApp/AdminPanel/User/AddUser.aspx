<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminPanelMaster.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="HotelManagementSystemWebApp.AdminPanel.User.AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function exampleFunction() {
            var element1 = document.getElementById("user_dropdown");
            var element2 = document.getElementById("add_user");
            element1.classList.add("active");
            element2.classList.add("active");
        }
    </script>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: rgb(2,0,36);
            background: linear-gradient(194deg, rgba(2,0,36,1) 0%, rgba(73,100,227,1) 50%, rgba(0,212,255,1) 100%);
            min-height: 100vh;
        }

        .login-form {
            width: 370px;
            margin: 50px auto;
            font-size: 15px;
            margin-bottom: 15px;
            background: #f7f7f7;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            padding: 30px;
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
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="login-form">
        <h2 class="text-center">Insert new user</h2>
        <div class="form-group">
            <label>Employee ID</label>
            <asp:TextBox ID="txtE_id" class="form-control" runat="server" required="required"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Password</label>
            <asp:TextBox ID="txtPasswordReg" class="form-control" runat="server" required="required" TextMode="Password"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Confirm password</label>
            <asp:TextBox ID="txtConfirm" class="form-control" runat="server" required="required" TextMode="Password"></asp:TextBox>
        </div>
        <asp:Button ID="btnRegister" runat="server" Text="Add user" OnClick="btnRegister_Click" class="btn btn-primary mt-3" />

    </div>
</asp:Content>

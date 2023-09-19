<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="DeleteAccount.aspx.cs" Inherits="HotelManagementSystemWebApp.Home.UserSettings.DeleteAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function exampleFunction() {
            var element1 = document.getElementById("user_settings_dropdown");
            var element2 = document.getElementById("delete_account");
            element1.classList.add("active");
            element2.classList.add("active");
        }
    </script>
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="outer_div">
        <div class="pass_form">
            <label>Email:</label>
            <br />
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <br />
            <br />
            <label>Password:</label>
            <br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:CheckBox ID="confirm_checkBox" runat="server" OnCheckedChanged="confirm_checkBox_CheckedChanged" AutoPostBack="true"/><label>Please check this box to confirm account deletion.</label>
            <br />
            <br />
            <asp:Button ID="Submit" runat="server" Text="Delete account" BackColor="#CC0000" BorderColor="Maroon" ForeColor="White" Enabled="False" OnClick="Submit_Click"/>
        </div>
    </div>
</asp:Content>

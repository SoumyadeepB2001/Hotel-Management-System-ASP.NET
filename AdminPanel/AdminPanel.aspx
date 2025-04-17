<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminPanelMaster.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="HotelManagementSystemWebApp.AdminPanel.AdminPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap");
        @import url("https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap");

        .flex {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        img {
            width: 100%;
            display: block;
        }

        @media (max-width: 500px) {
            body {
                font-size: 14px;
            }
        }

        /* header */
        .header {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.2)), url("banner-img.jpg") center/cover no-repeat;
            min-height: 100vh;
            color: #fff;
            padding: 25px;
            display: flex;
            box-sizing: border-box;
            padding: 0;
            margin: 0;
            font-family: "Playfair Display", serif;
            line-height: 1.6;
        }

        .head-bottom {
            flex: 1;
            text-align: center;
            width: 80vw;
            margin: 0 auto;
        }

            .head-bottom h2 {
                padding: 22px 0;
                font-size: 45px;
                border-bottom: 1px solid #fff;
            }

            .head-bottom p {
                opacity: 0.75;
                font-size: 20px;
                margin: 45px auto;
                width: 60vw;
                color: #fff;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="header">
        <div class="head-bottom flex">
            <h2>Use the Admin Panel to effortlessly control the most important settings.</h2>
            <p>
                Use the menu button to open specific pages related to employees, rooms and user information.
            </p>
        </div>
    </header>
</asp:Content>

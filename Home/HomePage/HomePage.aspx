<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="HotelManagementSystemWebApp.Home.HomePage.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function exampleFunction() {
            var element = document.getElementById("home_link");
            element.classList.add("active");
        }
    </script>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@300&display=swap");

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background: url("Bg-image.jpg") center/cover no-repeat;
  min-height: 100vh;
}

.container {
  display: inline-block;
  line-height: 2.1;
  font-family: "Roboto Slab", serif;
  margin-top: 15vh;
  margin-left: 35vh;
  border: 2px solid black;
  padding: 45px;
  border-radius: 15px;
  background-color: #461c1b6b;
  width: 1050px;
}

.container h1,
h2 {
  color: #fff;
}
.container span {
  color: #70cdf8;
}

.btn {
  margin: 7px 5px;
  padding: 10px;
  border-radius: 10px;
  font-size: 20px;
  background-color:azure;
}

.btn:hover {
  background-color: #cc406c;
  transform: translateY(-5px);
  cursor: pointer;
  color: #fff;
}

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <h1>Welcome user: <span id="Message1" runat="server"></span></h1>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="timer_panel" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer" runat="server" OnTick="Timer_Tick" Interval="1000"></asp:Timer>
                <h2><span id="Message2" runat="server"></span></h2>
            </ContentTemplate>
        </asp:UpdatePanel>
        <h2>No. of check-ins today: <span id="check_in" runat="server"></span></h2>
        <asp:Button ID="btn_check_in" runat="server" Text="See today's check-ins" BorderColor="#000099" BorderStyle="Double" OnClick="btn_check_in_Click" class="btn"/>
        <h2>No. of check-outs today: <span id="check_out" runat="server"></span></h2>
        <asp:Button ID="btn_check_out" runat="server" Text="See today's check-outs" BorderColor="#000099" BorderStyle="Double" OnClick="btn_check_out_Click" class="btn"/>
    </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="CancelledBookings.aspx.cs" Inherits="HotelManagementSystemWebApp.Home.Employees.CancelledBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function exampleFunction() {
            var element1 = document.getElementById("booking_dropdown");
            var element2 = document.getElementById("cancelled_booking");
            element1.classList.add("active");
            element2.classList.add("active");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />

    <asp:GridView ID="GridView1" runat="server" EmptyDataText="No records found" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HorizontalAlign="Center" Caption="List of cancelled bookings" CaptionAlign="Top">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="b_id" HeaderText="B.ID." ReadOnly="True" />
            <asp:BoundField DataField="g_id" HeaderText="G.ID." ReadOnly="True" />           
            <asp:BoundField DataField="check_in" HeaderText="Check-in" DataFormatString="{0:yyyy/MM/dd}" ApplyFormatInEditMode="True" />
            <asp:BoundField DataField="check_out" HeaderText="Check-out" DataFormatString="{0:yyyy/MM/dd}" ApplyFormatInEditMode="True" />
            <asp:BoundField DataField="r_num" HeaderText="Room No." />
            <asp:BoundField DataField="room_price" HeaderText="Room Price" />
            <asp:BoundField DataField="total_price" HeaderText="Total Price" />
            <asp:BoundField DataField="deposit" HeaderText="Deposit" />
            <asp:BoundField DataField="no_of_adults" HeaderText="Adults" />
            <asp:BoundField DataField="no_of_children" HeaderText="Adults" />
        </Columns>

        <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle"></EditRowStyle>

        <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle"></EmptyDataRowStyle>

        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" HorizontalAlign="Center" VerticalAlign="Middle" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" VerticalAlign="Middle" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" HorizontalAlign="Center" VerticalAlign="Middle" />
    </asp:GridView>

</asp:Content>

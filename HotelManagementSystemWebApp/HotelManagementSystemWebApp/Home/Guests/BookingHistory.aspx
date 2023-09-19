<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="BookingHistory.aspx.cs" Inherits="HotelManagementSystemWebApp.Home.Guests.BookingHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" EmptyDataText="No records found" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HorizontalAlign="Center" Caption="Cancel bookings" CaptionAlign="Top" DataKeyNames="b_id">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="b_id" HeaderText="B.ID." ReadOnly="True" />
            <asp:BoundField DataField="guest_name" HeaderText="Name" />
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="phone" HeaderText="Phone" />
            <asp:BoundField DataField="check_in" HeaderText="Check-in" DataFormatString="{0:yyyy/MM/dd}" />
            <asp:BoundField DataField="check_out" HeaderText="Check-out" DataFormatString="{0:yyyy/MM/dd}" />
            <asp:BoundField DataField="r_num" HeaderText="Room No." />
            <asp:BoundField DataField="total_price" HeaderText="Total Price" />
            <asp:BoundField DataField="no_of_adults" HeaderText="Adults" />
            <asp:BoundField DataField="no_of_children" HeaderText="Children" />
            <asp:BoundField DataField="has_checked_in" HeaderText="Has checked-in" />
            <asp:BoundField DataField="checked_in_at" HeaderText="Checked-in at" />
            <asp:BoundField DataField="has_checked_out" HeaderText="Has checked-out" />
            <asp:BoundField DataField="checked_out_at" HeaderText="Checked-out at" />
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

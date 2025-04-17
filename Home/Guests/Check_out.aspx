<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="Check_out.aspx.cs" Inherits="HotelManagementSystemWebApp.Home.Guests.Check_out1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function exampleFunction() {
            var element1 = document.getElementById("guest_dropdown");
            var element2 = document.getElementById("list_of_guests");
            element1.classList.add("active");
            element2.classList.add("active");
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" Caption="Bookings" CaptionAlign="Top" CellPadding="3" DataKeyNames="b_id" EmptyDataText="No records found" GridLines="Horizontal" HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" PagerStyle-HorizontalAlign="Center" PagerStyle-VerticalAlign="Middle" RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" SelectedRowStyle-HorizontalAlign="Center" SelectedRowStyle-VerticalAlign="Middle" SortedAscendingCellStyle-HorizontalAlign="Center" SortedAscendingCellStyle-VerticalAlign="Middle" SortedAscendingHeaderStyle-HorizontalAlign="Center" SortedAscendingHeaderStyle-VerticalAlign="Middle" SortedDescendingCellStyle-HorizontalAlign="Center" SortedDescendingCellStyle-VerticalAlign="Middle" SortedDescendingHeaderStyle-HorizontalAlign="Center" SortedDescendingHeaderStyle-VerticalAlign="Middle" FooterStyle-HorizontalAlign="Center" FooterStyle-VerticalAlign="Middle" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-VerticalAlign="Middle" EditRowStyle-HorizontalAlign="Center" EditRowStyle-VerticalAlign="Middle" AlternatingRowStyle-HorizontalAlign="Center" AlternatingRowStyle-VerticalAlign="Middle" OnRowCommand="GridView1_RowCommand">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="b_id" HeaderText="B.ID." ReadOnly="True" />
            <asp:BoundField DataField="g_id" HeaderText="G.ID." ReadOnly="True" />
            <asp:BoundField DataField="guest_name" HeaderText="Name" />
            <asp:BoundField DataField="guest_address" HeaderText="Address" />
            <asp:BoundField DataField="dob" HeaderText="D.O.B" DataFormatString="{0:yyyy/MM/dd}" ApplyFormatInEditMode="True"/>
            <asp:BoundField DataField="gender" HeaderText="Gender" />
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="phone" HeaderText="Phone" />
            <asp:BoundField DataField="check_in" HeaderText="Check-in" DataFormatString="{0:yyyy/MM/dd}" ApplyFormatInEditMode="True"/>
            <asp:BoundField DataField="check_out" HeaderText="Check-out" DataFormatString="{0:yyyy/MM/dd}" ApplyFormatInEditMode="True"/>
            <asp:BoundField DataField="r_num" HeaderText="Room No." />
            <asp:BoundField DataField="no_of_adults" HeaderText="Adults" />
            <asp:BoundField DataField="no_of_children" HeaderText="Children" />
            <asp:BoundField DataField="checked_in_at" HeaderText="Checked in at" DataFormatString="{0:yyyy/MM/dd HH:mm:ss}" ApplyFormatInEditMode="True"/>
            <asp:ButtonField ButtonType="Button" Text="Check-out" />
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

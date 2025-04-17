<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="AllBookings.aspx.cs" Inherits="HotelManagementSystemWebApp.Home.Bookings.AllBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function exampleFunction() {
            var element1 = document.getElementById("booking_dropdown");
            var element2 = document.getElementById("all_bookings");
            element1.classList.add("active");
            element2.classList.add("active");
        }
    </script>
    <style>
        body {
            min-width: 100%;
            width: fit-content;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" EmptyDataText="No records found" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HorizontalAlign="Center" Caption="All Bookings" CaptionAlign="Top" DataKeyNames="b_id" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="b_id" HeaderText="B.ID." ReadOnly="True" />
            <asp:BoundField DataField="g_id" HeaderText="G.ID." ReadOnly="True" />
            <asp:BoundField DataField="guest_name" HeaderText="Name" ReadOnly="True" />
            <asp:BoundField DataField="guest_address" HeaderText="Address" ReadOnly="True" />
            <asp:BoundField DataField="dob" HeaderText="D.O.B" DataFormatString="{0:yyyy/MM/dd}" ReadOnly="True" />
            <asp:BoundField DataField="gender" HeaderText="Gender" ReadOnly="True" />
            <asp:BoundField DataField="email" HeaderText="Email" ReadOnly="True" />
            <asp:BoundField DataField="phone" HeaderText="Phone" ReadOnly="True" />
            <asp:BoundField DataField="id_proof" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="id_num" HeaderText="ID No." ReadOnly="True" />
            <asp:BoundField DataField="check_in" HeaderText="Check-in" DataFormatString="{0:yyyy/MM/dd}" ApplyFormatInEditMode="True" ReadOnly="True" />
            <asp:BoundField DataField="check_out" HeaderText="Check-out" DataFormatString="{0:yyyy/MM/dd}" ApplyFormatInEditMode="True" ReadOnly="True" />
            <asp:BoundField DataField="r_num" HeaderText="Room No." ReadOnly="True" />
            <asp:BoundField DataField="room_price" HeaderText="Room Price" />
            <asp:BoundField DataField="total_price" HeaderText="Total Price" />
            <asp:BoundField DataField="deposit" HeaderText="Deposit" />
            <asp:BoundField DataField="no_of_adults" HeaderText="Adults" ReadOnly="true" />
            <asp:BoundField DataField="no_of_children" HeaderText="Children" ReadOnly="true" />
            <asp:TemplateField HeaderText="Has checked-in">
                <EditItemTemplate>
                    <asp:DropDownList ID="hasCheckedInDdl" runat="server" SelectedValue='<%# Bind("has_checked_in") %>'>
                        <asp:ListItem>YES</asp:ListItem>
                        <asp:ListItem>NO</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("has_checked_in") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="checked_in_at" HeaderText="Checked-in at" ApplyFormatInEditMode="True" DataFormatString="{0:yyyy/MM/dd HH:mm:ss.fff}" />
            <asp:TemplateField HeaderText="Has checked-out">
                <EditItemTemplate>
                    <asp:DropDownList ID="hasCheckedOutDdl" runat="server" SelectedValue='<%# Bind("has_checked_out") %>'>
                        <asp:ListItem>YES</asp:ListItem>
                        <asp:ListItem Value="NO"></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("has_checked_out") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="checked_out_at" HeaderText="Checked-out at" ApplyFormatInEditMode="True" DataFormatString="{0:yyyy/MM/dd HH:mm:ss.fff}" />
            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
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

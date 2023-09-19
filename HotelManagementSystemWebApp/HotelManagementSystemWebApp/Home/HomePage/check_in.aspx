<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="check_in.aspx.cs" Inherits="HotelManagementSystemWebApp.Home.HomePage.check_in" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Caption="Guest check-in" CaptionAlign="Top" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand" DataKeyNames="b_id" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" EmptyDataText="No records found">                                 
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="b_id" HeaderText="B.ID" ReadOnly="True" />
            <asp:BoundField DataField="guest_name" HeaderText="Name" ReadOnly="True"/>
            <asp:BoundField DataField="guest_address" HeaderText="Address" ReadOnly="True"/>
            <asp:BoundField DataField="dob" HeaderText="D.O.B" DataFormatString="{0:yyyy/MM/dd}" ApplyFormatInEditMode="True" ReadOnly="True"/>
            <asp:BoundField DataField="gender" HeaderText="Gender" ReadOnly="True"/>
            <asp:BoundField DataField="email" HeaderText="Email" ReadOnly="True"/>
            <asp:BoundField DataField="phone" HeaderText="Phone" ReadOnly="True"/>
            <asp:BoundField DataField="id_proof" HeaderText="ID" ReadOnly="True"/>
            <asp:BoundField DataField="id_num" HeaderText="ID No." ReadOnly="True"/>
            <asp:BoundField DataField="check_in" HeaderText="Check-in" DataFormatString="{0:yyyy/MM/dd}" ApplyFormatInEditMode="True" ReadOnly="True"/>
            <asp:BoundField DataField="check_out" HeaderText="Check-out" DataFormatString="{0:yyyy/MM/dd}" ApplyFormatInEditMode="True" ReadOnly="True"/>
            <asp:BoundField DataField="r_num" HeaderText="Room No." ReadOnly="True"/>
            <asp:BoundField DataField="room_price" HeaderText="Room Price" ReadOnly="True"/>
            <asp:BoundField DataField="total_price" HeaderText="Total Price" ReadOnly="True" />
            <asp:BoundField DataField="deposit" HeaderText="Deposit" />
            <asp:BoundField DataField="no_of_adults" HeaderText="Adults" ReadOnly="True" />
            <asp:BoundField DataField="no_of_children" HeaderText="Children" ReadOnly="True" />
            <asp:CommandField ButtonType="Button" EditText="Edit deposit" ShowEditButton="True" />
            <asp:ButtonField ButtonType="Button" Text="Check-in" commandname="Check-in"/>
        </Columns>
        <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" HorizontalAlign="Center" VerticalAlign="Middle" />
    </asp:GridView>
</asp:Content>

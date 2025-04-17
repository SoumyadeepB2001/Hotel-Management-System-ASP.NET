<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="ViewEmployees.aspx.cs" Inherits="HotelManagementSystemWebApp.Home.Employees.ViewEmployees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function exampleFunction() {
            var element1 = document.getElementById("employee_dropdown");
            var element2 = document.getElementById("view_employees");
            element1.classList.add("active");
            element2.classList.add("active");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="e_id" EmptyDataText="No records found" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HorizontalAlign="Center" Caption="Employee Info" CaptionAlign="Top">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="e_id" HeaderText="E.ID" />
            <asp:BoundField DataField="name" HeaderText="Name" />
            <asp:BoundField DataField="employee_address" HeaderText="Address" />
            <asp:BoundField DataField="dob" DataFormatString="{0:yyyy/MM/dd}" HeaderText="Date of birth" />
            <asp:BoundField DataField="gender" HeaderText="Gender" />
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="phone" HeaderText="Phone" />
            <asp:BoundField DataField="document" HeaderText="Document" />
            <asp:BoundField DataField="docId" HeaderText="Document ID" />
            <asp:BoundField DataField="joining_date" DataFormatString="{0:yyyy/MM/dd}" HeaderText="Joining Date" />
            <asp:BoundField DataField="salary" HeaderText="Salary" />
            <asp:BoundField DataField="designation" HeaderText="Designation" />
            <asp:BoundField DataField="department" HeaderText="Department" />
            <asp:BoundField DataField="manager_id" HeaderText="Manager ID" />
            <asp:ImageField DataImageUrlField="image_link" HeaderText="Photo" ControlStyle-Width="150" ControlStyle-Height="150" />
        </Columns>
        <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />

    </asp:GridView>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminPanelMaster.Master" AutoEventWireup="true" CodeBehind="TerminateEmployee.aspx.cs" Inherits="HotelManagementSystemWebApp.AdminPanel.Employee.TerminateEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function exampleFunction() {
            var element1 = document.getElementById("employee_dropdown");
            var element2 = document.getElementById("terminate");
            element1.classList.add("active");
            element2.classList.add("active");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="e_id" EmptyDataText="No records found" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HorizontalAlign="Center" Caption="Terminate employee" CaptionAlign="Top" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating">
        <AlternatingRowStyle BackColor="#F7F7F7" />

        <Columns>
            <asp:BoundField DataField="e_id" HeaderText="E.ID" ReadOnly="True" />
            <asp:BoundField DataField="name" HeaderText="Name" ReadOnly="True" />
            <asp:BoundField DataField="dob" HeaderText="D.O.B" DataFormatString="{0:yyyy/MM/dd}" ReadOnly="True" />
            <asp:BoundField DataField="gender" HeaderText="Gender" ReadOnly="True" />
            <asp:BoundField DataField="email" HeaderText="Email" ReadOnly="True" />
            <asp:BoundField DataField="phone" HeaderText="Phone" ReadOnly="True" />
            <asp:BoundField DataField="designation" HeaderText="Designation" ReadOnly="True" />
            <asp:BoundField DataField="department" HeaderText="Department" ReadOnly="True" />
            <asp:BoundField DataField="manager_id" HeaderText="Manager ID" ReadOnly="True" />
            <asp:TemplateField HeaderText="Date of termination">
                <EditItemTemplate>
                    <asp:TextBox ID="txtTerminationDate" runat="server" Text='<%# Bind("termination_date", "{0:yyyy/MM/dd}") %>' TextMode="Date"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("termination_date", "{0:yyyy/MM/dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ImageField DataImageUrlField="image_link" ReadOnly="True" ControlStyle-Width="150" ControlStyle-Height="150">
            </asp:ImageField>
            <asp:CommandField ButtonType="Button" EditText="Terminate" ShowEditButton="True" UpdateText="Confirm" />
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

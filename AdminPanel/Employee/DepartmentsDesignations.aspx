<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminPanelMaster.Master" AutoEventWireup="true" CodeBehind="DepartmentsDesignations.aspx.cs" Inherits="HotelManagementSystemWebApp.AdminPanel.Employee.DepartmentsDesignations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function exampleFunction() {
            var element1 = document.getElementById("employee_dropdown");
            var element2 = document.getElementById("dept_des");
            element1.classList.add("active");
            element2.classList.add("active");
        }
    </script>
    <style>
        * {
            box-sizing: border-box;
        }

        .LeftColumn {
            float: left;
            width: 30%;
            padding: 20px;
        }

        .RightColumn {
            float: left;
            width: 70%;
            padding: 20px;
        }

        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        @media screen and (max-width: 600px) {
            .LeftColumn {
                width: 100%;
            }

            .RightColumn {
                width: 100%;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />

    <div class="row">

        <div class="LeftColumn">
            <h2>Add new department</h2>
            <asp:TextBox ID="txtDept" runat="server"></asp:TextBox>
            <asp:Button ID="btnDept" runat="server" Text="Add" OnClick="btnDept_Click" />
        </div>

        <div class="RightColumn">
            <h2>Edit departments</h2>

            <asp:GridView ID="DeptGridView" runat="server" DataKeyNames="d_id" EmptyDataText="No records found" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HorizontalAlign="Left" OnRowEditing="DeptGridView_RowEditing" OnRowUpdating="DeptGridView_RowUpdating" OnRowCancelingEdit="DeptGridView_RowCancelingEdit" OnRowDeleting="DeptGridView_RowDeleting">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="d_id" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="d_name" HeaderText="Department" />
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
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

        </div>

    </div>

    <div class="row">

        <div class="LeftColumn">
            <h2>Add new designations</h2>
            <asp:TextBox ID="txtDes" runat="server"></asp:TextBox>
            <asp:Button ID="btnDes" runat="server" Text="Add" OnClick="btnDes_Click" />
        </div>

        <div class="RightColumn">
            <h2>Edit designations</h2>

            <asp:GridView ID="DesGridView" runat="server" DataKeyNames="des_id" EmptyDataText="No records found" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HorizontalAlign="Left" OnRowEditing="DesGridView_RowEditing" OnRowUpdating="DesGridView_RowUpdating" OnRowCancelingEdit="DesGridView_RowCancelingEdit" OnRowDeleting="DesGridView_RowDeleting">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="des_id" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="des_name" HeaderText="Designation" />
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
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

        </div>

    </div>

</asp:Content>

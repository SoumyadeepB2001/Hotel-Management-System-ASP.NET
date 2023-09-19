<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="HotelManagementSystemWebApp.Home.Reports.Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
         window.onload = function exampleFunction() {
             var element = document.getElementById("inventory");
             element.classList.add("active");
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
     <div class="row">
        <div class="LeftColumn">
            <h2>Insert Items</h2>
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
            <br /><br />
            Category:
            <asp:TextBox ID="category" runat="server"></asp:TextBox>
            <br /><br />
            Quantity:&nbsp;
            <asp:TextBox ID="quantity" runat="server" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>
            <br /><br />
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click"/>
        </div>
        <div class="RightColumn">
            <h2>Edit Items</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" Caption="Inventory" CaptionAlign="Top" CellPadding="3" EmptyDataText="No records found" GridLines="Horizontal" HorizontalAlign="Left" RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" DataKeyNames="product_id" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating">                                          
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="product_id" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="product_name" HeaderText="Name" />
                    <asp:BoundField DataField="product_category" HeaderText="Category" />
                    <asp:BoundField DataField="product_quantity" HeaderText="Quanity" />
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />

            </asp:GridView>
        </div>
    </div>
</asp:Content>

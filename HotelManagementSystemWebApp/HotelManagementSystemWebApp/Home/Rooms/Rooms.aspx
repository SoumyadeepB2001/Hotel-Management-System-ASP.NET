<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="Rooms.aspx.cs" Inherits="HotelManagementSystemWebApp.Home.Rooms.Rooms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #SearchBox {
            display: flex;
            justify-content: center;
        }
    </style>

    <script>
        window.onload = function exampleFunction() {
            var element = document.getElementById("room");
            element.classList.add("active");
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
    <br />
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" Caption="Room Information" CaptionAlign="Top" CellPadding="3" GridLines="Horizontal" HorizontalAlign="Center" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="r_num" EmptyDataText="No records found">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="r_num" HeaderText="Room No." ReadOnly="True" />
            <asp:TemplateField HeaderText="Cleaning Status">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("cleaning_status") %>'>
                        <asp:ListItem>Clean</asp:ListItem>
                        <asp:ListItem>Unclean</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("cleaning_status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="price" HeaderText="Price (₹)" ReadOnly="True" />
            <asp:BoundField DataField="room_type" HeaderText="Room Type" ReadOnly="True" />
            <asp:BoundField DataField="bed_type" HeaderText="Bed Type" ReadOnly="True" />
            <asp:BoundField DataField="no_of_beds" HeaderText="No of beds" ReadOnly="True" />
            <asp:BoundField DataField="max_occupants" HeaderText="Max Occupants" ReadOnly="True" />
            <asp:ImageField DataImageUrlField="image_link" HeaderText="Image" ControlStyle-Width="150" ControlStyle-Height="150" ReadOnly="true">
            </asp:ImageField>
            <asp:CommandField ButtonType="Button" EditText="Update Status" ShowEditButton="True" />
        </Columns>
        <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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

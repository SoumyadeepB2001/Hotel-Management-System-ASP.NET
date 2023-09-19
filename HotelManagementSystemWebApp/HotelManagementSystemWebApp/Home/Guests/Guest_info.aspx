<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="Guest_info.aspx.cs" Inherits="HotelManagementSystemWebApp.Home.Guests.Guest_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function exampleFunction() {
            var element1 = document.getElementById("guest_dropdown");
            var element2 = document.getElementById("guest_info");
            element1.classList.add("active");
            element2.classList.add("active");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Caption="Guest Information" CaptionAlign="Top" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand" DataKeyNames="g_id" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" EmptyDataText="No records found">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="g_id" HeaderText="Guest ID." ReadOnly="True" />
            <asp:BoundField DataField="guest_name" HeaderText="Name" />
            <asp:BoundField DataField="guest_address" HeaderText="Address" />
            <asp:TemplateField HeaderText="D.O.B">
                <EditItemTemplate>
                    <asp:TextBox ID="txtDob" runat="server" Text='<%# Bind("dob", "{0:yyyy/MM/dd}") %>' TextMode="Date"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("dob", "{0:yyyy/MM/dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Gender">
                <EditItemTemplate>
                    <asp:DropDownList ID="Gender_ddl" runat="server" SelectedValue='<%# Bind("gender") %>'>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="phone" HeaderText="Phone" />
            <asp:TemplateField HeaderText="ID Proof">
                <EditItemTemplate>
                    <asp:DropDownList ID="Id_ddl" runat="server" SelectedValue='<%# Bind("id_proof") %>'>
                        <asp:ListItem Value="Aadhar Card">Aadhar Card</asp:ListItem>
                        <asp:ListItem Value="Driving License">Driving License</asp:ListItem>
                        <asp:ListItem Value="Voter ID Card">Voter ID Card</asp:ListItem>
                        <asp:ListItem Value="Passport">Passport</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("id_proof") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="id_num" HeaderText="ID No." />
            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
            <asp:ButtonField ButtonType="Button" Text="See Bookings" CommandName="See Bookings" />
        </Columns>
        <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" HorizontalAlign="Center" VerticalAlign="Middle" />
    </asp:GridView>

</asp:Content>

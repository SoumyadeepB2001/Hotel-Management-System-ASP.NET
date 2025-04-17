<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="CheckOutHistory.aspx.cs" Inherits="HotelManagementSystemWebApp.Home.Guests.CheckOutHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function exampleFunction() {
            var element1 = document.getElementById("guest_dropdown");
            var element2 = document.getElementById("check_out_history");
            element1.classList.add("active");
            element2.classList.add("active");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Caption="Guest check-out history" CaptionAlign="Top" HorizontalAlign="Center" DataKeyNames="b_id" EmptyDataText="No records found">                                 
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="b_id" HeaderText="B.ID"/>
            <asp:BoundField DataField="g_id" HeaderText="G.ID." ReadOnly="True" />
            <asp:BoundField DataField="guest_name" HeaderText="Name"/>
            <asp:BoundField DataField="guest_address" HeaderText="Address"/>
            <asp:BoundField DataField="dob" HeaderText="D.O.B" DataFormatString="{0:yyyy/MM/dd}"/>
            <asp:BoundField DataField="gender" HeaderText="Gender"/>
            <asp:BoundField DataField="email" HeaderText="Email"/>
            <asp:BoundField DataField="phone" HeaderText="Phone"/>
            <asp:BoundField DataField="id_proof" HeaderText="ID"/>
            <asp:BoundField DataField="id_num" HeaderText="ID No."/>
            <asp:BoundField DataField="check_in" HeaderText="Check-in" DataFormatString="{0:yyyy/MM/dd}"/>
            <asp:BoundField DataField="check_out" HeaderText="Check-out" DataFormatString="{0:yyyy/MM/dd}"/>
            <asp:BoundField DataField="r_num" HeaderText="Room No."/>
            <asp:BoundField DataField="no_of_adults" HeaderText="Adults"/>
            <asp:BoundField DataField="no_of_children" HeaderText="Children"/>
            <asp:BoundField DataField="checked_in_at" HeaderText="Time of check-in" />
            <asp:BoundField DataField="checked_out_at" HeaderText="Time of check-out" />
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

<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminPanelMaster.Master" AutoEventWireup="true" CodeBehind="BedRoomType.aspx.cs" Inherits="HotelManagementSystemWebApp.AdminPanel.Room.BedType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function exampleFunction() {
            var element1 = document.getElementById("room_dropdown");
            var element2 = document.getElementById("bed_room_type");
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
            <h2>New Bed Type</h2>
            Bed Type:
            <asp:TextBox ID="txtBed" runat="server"></asp:TextBox>
            <asp:Button ID="btnBed" runat="server" Text="Add" OnClick="btnBed_Click" />
        </div>

        <div class="RightColumn">
            <h2>Edit Bed Types</h2>

            <asp:GridView ID="BedGridView" runat="server" DataKeyNames="bed_id" EmptyDataText="No records found" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HorizontalAlign="Left" Caption="Bed Types" CaptionAlign="Top" OnRowDeleting="BedGridView_RowDeleting">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="bed_id" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="bed_type" HeaderText="Bed type" ReadOnly="True" />
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

    <br />
    <br />

    <div class="row">

        <div class="LeftColumn">
            <h2>New Room Type</h2>
            Room Type:
            <asp:TextBox ID="txtRoom" runat="server"></asp:TextBox>
            <asp:Button ID="btnRoom" runat="server" Text="Add" OnClick="btnRoom_Click" />
        </div>

        <div class="RightColumn">
            <h2>Edit Room Types</h2>
            <asp:GridView ID="RoomGridView" runat="server" DataKeyNames="room_type_id" EmptyDataText="No records found" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HorizontalAlign="Left" Caption="Room Types" CaptionAlign="Top" OnRowDeleting="RoomGridView_RowDeleting">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="room_type_id" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="room_type" HeaderText="Room type" ReadOnly="True" />
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


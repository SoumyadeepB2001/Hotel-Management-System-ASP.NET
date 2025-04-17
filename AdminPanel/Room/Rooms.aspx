<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminPanelMaster.Master" AutoEventWireup="true" CodeBehind="Rooms.aspx.cs" Inherits="HotelManagementSystemWebApp.AdminPanel.Room.Rooms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function exampleFunction() {
            var element1 = document.getElementById("room_dropdown");
            var element2 = document.getElementById("room_info");
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
            <h2>New Room</h2>
            Room No:
            <asp:TextBox ID="r_no" runat="server" required="required"></asp:TextBox>
            <br />
            <br />
            Cleaning Status:
            <asp:DropDownList ID="cleaning" runat="server">
                <asp:ListItem>Clean</asp:ListItem>
                <asp:ListItem>Unclean</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Price:
            <asp:TextBox ID="price" runat="server" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" required="required"></asp:TextBox>
            <br />
            <br />
            Room Type:
            <asp:DropDownList runat="server" ID="room" DataSourceID="SqlDataSource1" DataTextField="room_type" DataValueField="room_type"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connection1 %>" SelectCommand="SELECT [room_type] FROM [room_types]"></asp:SqlDataSource>
            <br />
            <br />
            Bed Type:
            <asp:DropDownList runat="server" ID="bed" DataSourceID="SqlDataSource2" DataTextField="bed_type" DataValueField="bed_type"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connection1 %>" SelectCommand="SELECT [bed_type] FROM [bed_types]"></asp:SqlDataSource>
            <br />
            <br />
            Max Occupants:
            <asp:TextBox ID="txt_max_occ" runat="server"></asp:TextBox>
            <br />
            <br />
            No. of beds:
            <asp:TextBox ID="txt_no_of_beds" runat="server"></asp:TextBox>
            <br />
            <br />
            Room Photo:
            <asp:FileUpload ID="photo_upload" runat="server" />
            <br />
            <br />
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
        </div>

        <div class="RightColumn">
            <h2>Edit Room Info</h2>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" Caption="Rooms" CaptionAlign="Top" CellPadding="3" EmptyDataText="No records found" GridLines="Horizontal" HorizontalAlign="Left" RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" DataKeyNames="r_num" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="r_num" HeaderText="Room No." ReadOnly="True" />
                    <asp:TemplateField HeaderText="Cleaning Status">
                        <EditItemTemplate>
                            <asp:DropDownList ID="cleaning_ddl" runat="server">
                                <asp:ListItem>Clean</asp:ListItem>
                                <asp:ListItem>Unclean</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("cleaning_status") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="price" HeaderText="Price" />
                    <asp:TemplateField HeaderText="Type">
                        <EditItemTemplate>
                            <asp:DropDownList ID="room_ddl" runat="server" DataSourceID="SqlDataSource1" DataTextField="room_type" DataValueField="room_type">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("room_type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bed">
                        <EditItemTemplate>
                            <asp:DropDownList ID="bed_ddl" runat="server" DataSourceID="SqlDataSource2" DataTextField="bed_type" DataValueField="bed_type">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("bed_type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="max_occupants" HeaderText="Max Occupants" />
                    <asp:BoundField DataField="no_of_beds" HeaderText="No. of beds" />
                    <asp:TemplateField HeaderText="Photo">
                        <EditItemTemplate>
                            <asp:FileUpload ID="photo_upload" runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image_link") %>' />
                        </ItemTemplate>
                        <ControlStyle Height="150px" Width="150px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="">
                        <EditItemTemplate>
                            <asp:HiddenField ID="hidden_image_link1" runat="server" Value='<%# Bind("image_link") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:HiddenField ID="hidden_image_link2" runat="server" Value='<%# Bind("image_link") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" CausesValidation="False" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" CausesValidation="False" />
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

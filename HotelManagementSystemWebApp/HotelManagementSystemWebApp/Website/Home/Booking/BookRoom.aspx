<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookRoom.aspx.cs" Inherits="HotelManagementSystemWebApp.Website.Home.Booking.BookRoom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstrap.min.css" rel="stylesheet" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: rgb(2,0,36);
            background: linear-gradient(194deg, rgba(2,0,36,1) 0%, rgba(73,100,227,1) 50%, rgba(0,212,255,1) 100%);
            min-height: 100vh;
        }

            body::-webkit-scrollbar {
                display: none;
            }

        .wrapper {
            max-width: 800px;
            margin: 80px auto;
            padding: 30px 45px;
            box-shadow: 5px 25px 35px #3535356b;
        }

            .wrapper label {
                display: block;
                padding-bottom: 0.2rem;
            }

            .wrapper .form .row {
                padding: 0.6rem 0;
            }

                .wrapper .form .row .form-control {
                    box-shadow: none;
                }

            .wrapper .form .option {
                position: relative;
                padding-left: 20px;
                cursor: pointer;
            }

                .wrapper .form .option input {
                    opacity: 0;
                }

            .wrapper .form .checkmark {
                position: absolute;
                top: 1px;
                left: 0;
                height: 20px;
                width: 20px;
                border: 1px solid #bbb;
                border-radius: 50%;
            }

            .wrapper .form .option input:checked ~ .checkmark:after {
                display: block;
            }

            .wrapper .form .option:hover .checkmark {
                background: #f3f3f3;
            }

            .wrapper .form .option .checkmark:after {
                content: "";
                width: 10px;
                height: 10px;
                display: block;
                background: linear-gradient(45deg, #ce1e53, #8f00c7);
                position: absolute;
                top: 50%;
                left: 50%;
                border-radius: 50%;
                transform: translate(-50%, -50%) scale(0);
                transition: 300ms ease-in-out 0s;
            }

            .wrapper .form .option input[type="radio"]:checked ~ .checkmark {
                background: #fff;
                transition: 300ms ease-in-out 0s;
            }

                .wrapper .form .option input[type="radio"]:checked ~ .checkmark:after {
                    transform: translate(-50%, -50%) scale(1);
                }

        @media(max-width: 768.5px) {
            .wrapper {
                margin: 30px;
            }

                .wrapper .form .row {
                    padding: 0;
                }
        }

        @media(max-width: 400px) {
            .wrapper {
                padding: 25px;
                margin: 20px;
            }
        }

        .dropdownlist {
            display: block;
            width: 100%;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
            color: #333;
        }

            .dropdownlist:focus {
                outline: none;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="wrapper rounded bg-white" id="gridview_div" runat="server">
                <div class="form">
                    <div class="row">
                        <asp:GridView ID="rooms_gridView" runat="server" AlternatingRowStyle-HorizontalAlign="Center" AlternatingRowStyle-VerticalAlign="Middle" DataKeyNames="r_num" EditRowStyle-HorizontalAlign="Center" EditRowStyle-VerticalAlign="Middle" EditRowStyle-Wrap="True" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" PagerStyle-HorizontalAlign="Center" PagerStyle-VerticalAlign="Middle" RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" SelectedRowStyle-HorizontalAlign="Center" SelectedRowStyle-VerticalAlign="Middle" SortedAscendingCellStyle-HorizontalAlign="Center" SortedAscendingCellStyle-VerticalAlign="Middle" SortedAscendingHeaderStyle-HorizontalAlign="Center" SortedAscendingHeaderStyle-VerticalAlign="Middle" SortedDescendingCellStyle-HorizontalAlign="Center" SortedDescendingCellStyle-VerticalAlign="Middle" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="7" GridLines="Horizontal" Width="145%" OnSelectedIndexChanged="rooms_gridView_SelectedIndexChanged">

                            <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#F7F7F7"></AlternatingRowStyle>

                            <Columns>
                                <asp:BoundField DataField="r_num" HeaderText="Room No." />
                                <asp:BoundField DataField="price" HeaderText="Price" />
                                <asp:BoundField DataField="room_type" HeaderText="Room Type" />
                                <asp:BoundField DataField="bed_type" HeaderText="Bed Size" />
                                <asp:ImageField DataImageUrlField="image_link" HeaderText="Image" ControlStyle-Height="200" ControlStyle-Width="200">
                                    <ControlStyle Height="200px" Width="200px"></ControlStyle>
                                </asp:ImageField>
                                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                            </Columns>

                            <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></EditRowStyle>

                            <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle"></EmptyDataRowStyle>

                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />

                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Right" VerticalAlign="Middle" BackColor="#E7E7FF" ForeColor="#4A3C8C"></PagerStyle>

                            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#E7E7FF" ForeColor="#4A3C8C"></RowStyle>

                            <SelectedRowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7"></SelectedRowStyle>

                            <SortedAscendingCellStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#F4F4FD"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#5A4C9D"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#D8D8F0"></SortedDescendingCellStyle>
                            <SortedDescendingHeaderStyle BackColor="#3E3277" />

                        </asp:GridView>
                    </div>
                </div>
            </div>

            <div class="wrapper rounded bg-white" id="form_div" runat="server">
                <div class="form">

                    <div class="row">
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Check-in date</label>
                            <asp:TextBox ID="txt_check_in" class="form-control" runat="server" Enabled="false" required="required"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Check-out date</label>
                            <asp:TextBox ID="txt_check_out" class="form-control" runat="server" Enabled="false" required="required"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Alloted room number</label>
                            <asp:TextBox ID="room_num" class="form-control" runat="server" Enabled="false" required="required"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Room price per night (₹)</label>
                            <asp:TextBox ID="price" runat="server" class="form-control" Enabled="false" required="required"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Total price (₹)</label>
                            <asp:TextBox ID="total_price" runat="server" class="form-control" Enabled="false" required="required"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>No. of adults</label>
                            <asp:TextBox ID="txt_adults" runat="server" class="form-control" Enabled="false" required="required"></asp:TextBox>

                        </div>
                    </div>

                    <div class="row">

                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>No. of children under 5 years</label>
                            <asp:TextBox ID="txt_children" class="form-control" runat="server" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mt-md-0 mt-3">
                            <asp:Button ID="btn_book" runat="server" Text="Confirm Booking" OnClick="btn_book_Click" class="btn btn-primary mt-3" />
                        </div>
                    </div>

                </div>
            </div>

            <div class="wrapper rounded bg-white" id="confirm_div" runat="server" visible="false">
                <div class="form">

                    <div class="row">
                        <h1>Booking Confirmed!</h1>
                    </div>
                    <div class="row">
                        <asp:Button ID="btn_redirect" runat="server" Text="Go back" OnClick="btn_redirect_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

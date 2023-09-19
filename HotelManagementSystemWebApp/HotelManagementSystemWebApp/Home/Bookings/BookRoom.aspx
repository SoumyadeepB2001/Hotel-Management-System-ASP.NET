<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="BookRoom.aspx.cs" Inherits="HotelManagementSystemWebApp.Home.Bookings.BookRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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


    <script>
        window.onload = function exampleFunction() {
            var element1 = document.getElementById("booking_dropdown");
            var element2 = document.getElementById("book_room");
            element1.classList.add("active");
            element2.classList.add("active");
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="wrapper rounded bg-white">

        <div class="h3">Room Booking Form</div>

        <div class="form">
            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Search with:</label>
                    <asp:DropDownList ID="ddl_search" runat="server" CssClass="dropdownlist">
                        <asp:ListItem Value="Email">Email Address</asp:ListItem>
                        <asp:ListItem Value="Phone">Phone Number</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Enter your Email/Phone No.</label>
                    <asp:TextBox ID="txt_search" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="search_validator" ControlToValidate="txt_search" runat="server" ValidationGroup="search" ErrorMessage="Please enter your Email/Phone No."></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="row">               
                    <asp:Button ID="btn_search" runat="server" Text="Search for existing records" class="btn btn-primary mt-3" UseSubmitBehavior="False" ValidationGroup="search" OnClick="btn_search_Click"/>                   
            </div>
        </div>
    </div>

    <div id="hidden_div" runat="server" visible="false">

    <div class="wrapper rounded bg-white">

        <div class="form">
            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Check-in Date</label>
                    <asp:TextBox ID="check_in" class="form-control" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="check_in" ValidationGroup="Date" runat="Server" ErrorMessage="Please enter check-in date"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Check-out Date</label>
                    <asp:TextBox ID="check_out" class="form-control" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="check_out" ValidationGroup="Date" runat="Server" ErrorMessage="Please enter check-out date"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Number of adults</label>
                    <asp:DropDownList ID="adults" runat="server" CssClass="dropdownlist">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Number of children under 5 years</label>
                    <asp:DropDownList ID="children" runat="server" CssClass="dropdownlist">
                        <asp:ListItem Value="1">0</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="row">
                <asp:Button ID="get_rooms" runat="server" Text="Get available rooms" OnClick="get_rooms_Click" class="btn btn-primary mt-3" ValidationGroup="Date" UseSubmitBehavior="False" />
            </div>

            <div class="row">
                <asp:GridView ID="rooms_gridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="6" GridLines="Horizontal" HorizontalAlign="Center" Width="100%" OnSelectedIndexChanged="rooms_gridView_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="r_num" HeaderText="Room No." />
                        <asp:BoundField DataField="price" HeaderText="Price" />
                        <asp:BoundField DataField="room_type" HeaderText="Room Type" />
                        <asp:BoundField DataField="bed_type" HeaderText="Bed Type" />
                        <asp:ImageField DataImageUrlField="image_link" HeaderText="Image" ControlStyle-Height="100" ControlStyle-Width="100">
                        </asp:ImageField>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
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
    </div>

    <div class="wrapper rounded bg-white">
        <div class="form">
            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Name</label>
                    <asp:TextBox ID="name" class="form-control" runat="server" required="required"></asp:TextBox>
                </div>
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Address</label>
                    <asp:TextBox ID="address" class="form-control" runat="server" required="required"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Date Of Birth</label>
                    <asp:TextBox ID="DOB" class="form-control" runat="server" required="required" TextMode="Date"></asp:TextBox>
                </div>
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Gender</label>
                    <div class="d-flex align-items-center mt-2">
                        <label class="option">
                            <asp:RadioButton ID="male" runat="server" GroupName="gender" />Male
                                <span class="checkmark"></span>
                        </label>
                        <label class="option ms-4">
                            <asp:RadioButton ID="female" runat="server" GroupName="gender" />Female
                                <span class="checkmark"></span>
                        </label>
                        <label class="option ms-4">
                            <asp:RadioButton ID="other" runat="server" GroupName="gender" />Other
                                <span class="checkmark"></span>
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Email</label>
                    <asp:TextBox ID="email" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Phone Number</label>
                    <asp:TextBox ID="phone" class="form-control" runat="server" required="required"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Identity Document</label>

                    <asp:DropDownList ID="IdDoc" runat="server" CssClass="dropdownlist">
                        <asp:ListItem Value="Aadhar Card">Aadhar Card</asp:ListItem>
                        <asp:ListItem Value="Driving License">Driving License</asp:ListItem>
                        <asp:ListItem Value="Voter ID Card">Voter ID Card</asp:ListItem>
                        <asp:ListItem Value="Passport">Passport</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>ID Number</label>
                    <asp:TextBox ID="IdNum" class="form-control" runat="server" required="required"></asp:TextBox>
                </div>

            </div>

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
                    <label>Deposit (₹)</label>
                    <asp:TextBox ID="deposit" class="form-control" runat="server" ToolTip="At least 50% of the room price must be paid at the time of booking, and the remaining amount has to be paid at the time of check-in."></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Number of adults</label>
                    <asp:DropDownList ID="ddl_adults" runat="server" CssClass="dropdownlist" Enabled="false">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Number of children under 5 years</label>
                    <asp:DropDownList ID="ddl_children" runat="server" CssClass="dropdownlist" Enabled="false">
                        <asp:ListItem Value="1">0</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <asp:Button ID="clear" runat="server" Text="Clear" OnClick="clear_Click" class="btn btn-primary mt-3" UseSubmitBehavior="False" CausesValidation="False" />
                </div>

                <div class="col-md-6 mt-md-0 mt-3">
                    <asp:Button ID="submit" runat="server" Text="Confirm Booking" OnClick="submit_Click" class="btn btn-primary mt-3" />
                </div>

            </div>

        </div>
    </div>

    </div>

</asp:Content>

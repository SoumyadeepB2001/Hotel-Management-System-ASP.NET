<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="HotelManagementSystemWebApp.Website.Home.Profile.edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit details</title>
    <link href="/Website/Sign-in/bootstrap.min.css" rel="stylesheet" />
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

            <div class="wrapper rounded bg-white">
                <div class="h3">Edit user details</div>
                <div class="form">
                    <div class="row">
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Name</label>
                            <asp:TextBox ID="name" class="form-control" runat="server" required="required" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Address</label>
                            <asp:TextBox ID="address" class="form-control" runat="server" required="required" Enabled="false"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Date Of Birth</label>
                            <asp:TextBox ID="DOB" class="form-control" runat="server" required="required" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Gender</label>
                             <asp:DropDownList ID="gender" runat="server" CssClass="dropdownlist" Enabled="false">
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Email</label>
                            <asp:TextBox ID="email" class="form-control" runat="server" Enabled="false" required="required"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Phone Number</label>
                            <asp:TextBox ID="phone" class="form-control" runat="server" required="required" TextMode="Phone" Enabled="false"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Identity Document</label>

                            <asp:DropDownList ID="IdDoc" runat="server" CssClass="dropdownlist" Enabled="false">
                                <asp:ListItem Value="Aadhar Card">Aadhar Card</asp:ListItem>
                                <asp:ListItem Value="Driving License">Driving License</asp:ListItem>
                                <asp:ListItem Value="Voter ID Card">Voter ID Card</asp:ListItem>
                                <asp:ListItem Value="Passport">Passport</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>ID Number</label>
                            <asp:TextBox ID="IdNum" class="form-control" runat="server" required="required" Enabled="false"></asp:TextBox>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6 mt-md-0 mt-3">
                            <asp:Button ID="btn_edit" runat="server" Text="Edit" OnClick="edit_Click" class="btn btn-primary mt-3" UseSubmitBehavior="False" CausesValidation="False" />
                        </div>

                        <div class="col-md-6 mt-md-0 mt-3">
                            <asp:Button ID="btn_update" runat="server" Text="Update" OnClick="update_Click" class="btn btn-primary mt-3" />
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>

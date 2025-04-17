<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminPanelMaster.Master" AutoEventWireup="true" CodeBehind="NewEmployee.aspx.cs" Inherits="HotelManagementSystemWebApp.AdminPanel.Employee.NewEmployee" %>

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
            var element1 = document.getElementById("employee_dropdown");
            var element2 = document.getElementById("add_employee");
            element1.classList.add("active");
            element2.classList.add("active");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper rounded bg-white">

        <div class="h3">New Employee Form</div>

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
                    <asp:TextBox ID="email" class="form-control" runat="server" required="required"></asp:TextBox>
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
                    <label>Joining Date</label>
                    <asp:TextBox ID="joining_date" class="form-control" runat="server" required="required" TextMode="Date"></asp:TextBox>
                </div>
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Salary (₹)</label>
                    <asp:TextBox ID="salary" class="form-control" runat="server" required="required"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Designation</label>

                    <asp:DropDownList ID="designation" runat="server" CssClass="dropdownlist">
                        <%--Items will be added dynamically--%>
                    </asp:DropDownList>
                </div>

                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Department</label>

                    <asp:DropDownList ID="department" runat="server" CssClass="dropdownlist">
                        <%--Items will be added dynamically--%>
                    </asp:DropDownList>
                </div>

            </div>

            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Manager ID</label>
                    <asp:DropDownList ID="m_id" runat="server" CssClass="dropdownlist">
                        <%--Items will be added dynamically--%>
                    </asp:DropDownList>
                </div>

                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Employee Photo</label>
                    <asp:FileUpload ID="photo_upload" runat="server" />
                </div>
            </div>

            <asp:Button ID="submit" runat="server" Text="Submit" class="btn btn-primary mt-3" OnClick="submit_Click" />
        </div>

    </div>
</asp:Content>

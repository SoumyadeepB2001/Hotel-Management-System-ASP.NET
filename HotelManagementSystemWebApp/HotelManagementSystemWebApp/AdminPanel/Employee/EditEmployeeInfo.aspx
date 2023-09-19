<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminPanelMaster.Master" AutoEventWireup="true" CodeBehind="EditEmployeeInfo.aspx.cs" Inherits="HotelManagementSystemWebApp.AdminPanel.Employee.EditEmployeeInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function exampleFunction() {
            var element1 = document.getElementById("employee_dropdown");
            var element2 = document.getElementById("edit_employee");
            element1.classList.add("active");
            element2.classList.add("active");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="e_id" EmptyDataText="No records found" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HorizontalAlign="Center" Caption="Edit employee info" CaptionAlign="Top" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="e_id" HeaderText="E.ID" ReadOnly="true" />
            <asp:BoundField DataField="name" HeaderText="Name" />
            <asp:BoundField DataField="employee_address" HeaderText="Address" />
            <asp:TemplateField HeaderText="Date of birth">
                <EditItemTemplate>
                    <asp:TextBox ID="txtDob" runat="server" Text='<%# Bind("dob", "{0:yyyy/MM/dd}") %>' TextMode="Date"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("dob", "{0:yyyy/MM/dd}") %>'></asp:Label>
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
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="phone" HeaderText="Phone" />
            <asp:TemplateField HeaderText="Document">
                <EditItemTemplate>
                    <asp:DropDownList ID="Document_ddl" runat="server" SelectedValue='<%# Bind("document") %>'>
                        <asp:ListItem>Aadhar Card</asp:ListItem>
                        <asp:ListItem>Driving License</asp:ListItem>
                        <asp:ListItem>Voter ID Card</asp:ListItem>
                        <asp:ListItem>Passport</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("document") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="docId" HeaderText="Document ID" />
            <asp:TemplateField HeaderText="Joining Date">
                <EditItemTemplate>
                    <asp:TextBox ID="txtJoiningDate" runat="server" Text='<%# Bind("joining_date", "{0:yyyy/MM/dd}") %>' TextMode="Date"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("joining_date", "{0:yyyy/MM/dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="salary" HeaderText="Salary" />
            <asp:TemplateField HeaderText="Designation">
                <EditItemTemplate>
                    <asp:DropDownList ID="Designation_ddl" runat="server" DataSourceID="SqlDataSource1" DataTextField="des_name" DataValueField="des_name" SelectedValue='<%# Bind("designation") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connection1 %>" SelectCommand="SELECT [des_name] FROM [designations]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("designation") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Department">
                <EditItemTemplate>
                    <asp:DropDownList ID="Department_ddl" runat="server" DataSourceID="SqlDataSource2" DataTextField="d_name" DataValueField="d_name" SelectedValue='<%# Bind("department") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connection1 %>" SelectCommand="SELECT [d_name] FROM [departments]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("department") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Manager ID">
                <EditItemTemplate>
                    <asp:DropDownList ID="Manager_ddl" runat="server" DataSourceID="SqlDataSource3" DataTextField="e_id" DataValueField="e_id" SelectedValue='<%# Bind("manager_id") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:connection1 %>" SelectCommand="SELECT NULL AS e_id UNION SELECT e_id FROM employees WHERE (designation = 'Manager' OR designation = 'General Manager') AND (is_terminated = 'NO')"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("manager_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
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

</asp:Content>

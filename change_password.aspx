<%@ Page Title="" Language="C#" MasterPageFile="~/Viewer.master" AutoEventWireup="true" CodeFile="change_password.aspx.cs" Inherits="change_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section>
					<div class="modal-body">
						<div class="w3_login_module">
							<div class="module form-module">
							  <div >
								
							  </div>
							  <div class="form">
								<h3>Change Your Password</h3>
								
                                  <asp:TextBox ID="oldpasswordtxt" runat="server" placeholder="Enter old password"  TextMode="Password" CausesValidation="false"  ></asp:TextBox>
                                  <asp:requiredfieldvalidator runat="server" errormessage="This field is Required" ControlToValidate="oldpasswordtxt" Font-Italic="True" ForeColor="Red"></asp:requiredfieldvalidator>
                                 
                                  <asp:TextBox ID="newpasswordtxt" runat="server" placeholder="Enter new password"  TextMode="Password" CausesValidation="false"></asp:TextBox>
                                  <asp:requiredfieldvalidator runat="server" errormessage="This field is Required" ControlToValidate="newpasswordtxt" Font-Italic="True" ForeColor="Red"></asp:requiredfieldvalidator>
                                  
                                  <asp:Button ID="update_password" runat="server" Text="Update Pssword" OnClick="update_password_Click" CausesValidation="false" />
							  </div>
							 
							 
							</div>
						</div>
					</div>
				</section>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Viewer.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script>
   
        function showContent() {
           // alert();
              toastr["error"]("Email ID is already registered!!! ");
            //window.location.replace("http://stackoverflow.com");

        };</script>
  <script src="cities.js"></script>
				<div class="faq">
		<div class="container">	
 
								<h3>Create an account</h3>
							
                                    <div class="col-lg-6 ">
                                  <asp:TextBox ID="Name" runat="server" CausesValidation="false"   placeholder="Name" class="form-control" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is Required" ControlToValidate="Name" ValidationGroup="b"></asp:RequiredFieldValidator>  
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Only Characters are allowed" ControlToValidate="Name" Font-Bold="True" ForeColor="Red" ValidationExpression="^([A-z][A-Za-z]*\s*[A-Za-z]*)$" ValidationGroup="b"></asp:RegularExpressionValidator>
                                                       
                                    </div>
                                        <div class="col-lg-6 ">
                                  <asp:TextBox ID="Password"  runat="server" CausesValidation="false"   class="form-control" placeholder="Password" TextMode="Password" ></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is Required" ControlToValidate="Password" ValidationGroup="b"  Font-Italic="True" ForeColor="Red"></asp:requiredfieldvalidator>
                                  </div>
              <div class="col-lg-6 ">
                                  <asp:TextBox ID="Email"  runat="server"  CausesValidation="false"  class="form-control" placeholder="Email" TextMode="Email" OnTextChanged="Email_TextChanged" AutoPostBack="True" ></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is Required" ControlToValidate="Email" ValidationGroup="b" Font-Italic="True" ForeColor="Red"></asp:requiredfieldvalidator>
                                  </div>
                    <div class="col-lg-6 ">
                                  <asp:TextBox ID="Phone_number"  runat="server" CausesValidation="false"   class="form-control" placeholder="Phone_number" ></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is Required" ControlToValidate="Phone_number" ValidationGroup="b" Font-Italic="True" ForeColor="Red"></asp:requiredfieldvalidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter Valid 10 Digit Mobile Number" ControlToValidate="Phone_number" Font-Bold="True" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                       
                        </div>
                          <div class="col-lg-6 ">
                                  <asp:TextBox ID="Address"  runat="server"  class="form-control" placeholder="Address" CausesValidation="false"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field is Required" ControlToValidate="Address" ValidationGroup="b" Font-Italic="True" ForeColor="Red"></asp:requiredfieldvalidator>
                              </div>

                                <div class="col-lg-6 ">
                              <%--    <asp:TextBox ID="city"  runat="server" class="form-control" placeholder="city"   ></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="This field is Required" ControlToValidate="city" ValidationGroup="b" Font-Italic="True" ForeColor="Red"></asp:requiredfieldvalidator>
                              --%>    
                                    <select onchange="print_city('state1', this.selectedIndex);" id="sts" name ="stt" class="form-control" required  ></select>
                                 <select id ="state1" class="form-control" required name="cty" ></select>
<script language="javascript">print_state("sts");</script>                       
                                
                                </div>



          
         <%--                             <div class="col-lg-6 ">
 
                                         
                                  <%--<asp:TextBox ID="State"  runat="server" class="form-control" placeholder="State"  ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="This field is Required" ControlToValidate="State" ValidationGroup="b" Font-Italic="True" ForeColor="Red"></asp:requiredfieldvalidator>--%>
<%--</div>--%>
                                            <div class="col-lg-6 ">
                                  <asp:TextBox ID="Country"  runat="server" class="form-control" Text="India" ReadOnly="true" ></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="This field is Required" ControlToValidate="Country" ValidationGroup="b" Font-Italic="True" ForeColor="Red"></asp:requiredfieldvalidator>
</div>
                                                  <div class="col-lg-6 ">
                                  <asp:TextBox ID="Pincode"  runat="server"   class="form-control" placeholder="Pincode"  ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="This field is Required" ControlToValidate="Pincode"  ValidationGroup="b" Font-Italic="True" ForeColor="Red"></asp:requiredfieldvalidator>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Valid 10 Digit Mobile Number" ControlToValidate="Pincode" Font-Bold="True" ForeColor="Red" ValidationExpression="[0-9]{6}"></asp:RegularExpressionValidator>
                       
                                                  </div><div class="col-lg-6 ">
                                    <asp:RadioButtonList ID="RadioButtonList1" class="form-control" runat="server" RepeatDirection="Horizontal" Width="219px">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:RadioButtonList>

                     
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="b" runat="server" ErrorMessage="This field is Required" ControlToValidate="RadioButtonList1" Font-Italic="True" ForeColor="Red"></asp:requiredfieldvalidator>
       </div> <div class="col-lg-6 ">
                                         
                          
                                  <asp:TextBox ID="qualification"  class="form-control" runat="server"  placeholder="qualification"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="b" runat="server" ErrorMessage="This field is Required" ControlToValidate="qualification" Font-Italic="True" ForeColor="Red"></asp:requiredfieldvalidator>
               </div>
                           <div class="col-lg-6 ">
                                  <asp:TextBox ID="occupation"  class="form-control" runat="server"  placeholder="occupation"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ValidationGroup="b" runat="server" ErrorMessage="This field is Required" ControlToValidate="occupation" Font-Italic="True" ForeColor="Red"></asp:requiredfieldvalidator>

                         </div>

								 <asp:Button ID="btn_submit"    runat="server" Text="Register" OnClick="btn_submit_Click" class="success" ValidationGroup="b"  CausesValidation="false" ></asp:Button>
                           <div class="col-lg-6 ">
			  
                           </div>            
            
            
            





            </div></div>


        
								
							
							 
</asp:Content>


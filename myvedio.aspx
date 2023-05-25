<%@ Page Title="" Language="C#" MasterPageFile="~/Viewer.master" AutoEventWireup="true" CodeFile="myvedio.aspx.cs" Inherits="myvedio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




								<div class="tittle-head">
									<h4 class="latest-text">Knowledge Bank Videos </h4>
									<div class="container">
										<div class="agileits-single-top">
											<ol class="breadcrumb">
											  <li><a href="Home.aspx">Home</a></li>
											  <li class="active">Video Details</li>
											</ol>
										</div>
									</div>
								</div>
     <div class="container">
             <asp:Repeater ID="Repeater1" runat="server" >
            <ItemTemplate>
								    
							<div class="browse-inner">
							   <div class="col-md-2 w3l-movie-gride-agile">
										
                                   
                                   <video width="200" height="150" controls ControlsList="nodownload" poster=' <%# Eval("poster") %>'   runat="server" >
                                
                                                  <source src='<%# Convert.ToDateTime(Eval("Exp_date").ToString()) > Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy")) ? Eval("Upload_File"):"No" %>' type="video/mp4" runat="server">
                                            </video> 
									    
								
									  <div class="mid-1">.
										<div class="w3l-movie-text">
											<h6><%# Eval("v_name") %></h6>		
                                            	<h6>Price:<%# Eval("Cost") %>/-</h6>		
										</div>
										<div class="mid-2">
										
											<p><%# Eval("v_desc") %></p>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Exp_date").ToString() != DateTime.Now.ToString("dd/MM/yyyy") ? "Active":"Expire" %>'   BackColor='<%# Eval("Exp_date").ToString() != DateTime.Now.ToString("dd/MM/yyyy") ? System.Drawing.Color.Green:System.Drawing.Color.Red %>' /></asp:Label>
														<div class="clearfix"></div>
										</div>
									
                                  					 	    <div class="ribben two">
										<p>NEW</p>
									</div>	
									</div></div>	
									</div>
            
                	</ItemTemplate>
          
        </asp:Repeater>
                </div>              
                      

</asp:Content>




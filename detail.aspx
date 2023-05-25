<%@ Page Title="" Language="C#" MasterPageFile="~/Viewer.master" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




     <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script type="text/javascript">
  
    function senemail(a, b,c,d) {
     
        var m = d;
	var totalAmount = a*100;

    var merchant_total = totalAmount;
    
    var merchant_order_id = "123";
    var currency_code_id = "INR";
     var options = {
    "key": "rzp_test_svDjV0nje7aVz8",
    "amount": merchant_total, // 2000 paise = INR 20
    "name": "Learn IT",
    "description": "Learn IT-Video Bank Library",

    "currency" : "INR",
    "netbanking" : true,
    prefill: {
            name: b,
           email: c,
            contact: 9898989898,

        },
     notes: {
            soolegal_order_id: merchant_order_id,
        },
    "handler": function (response){

        window.location.href = "callback.aspx?id="+b+"&day="+m;
	
    },

    "theme": {
        "color": "#528FF0"
    }
  };
  
  var rzp1 = new Razorpay(options);
  rzp1.open();
  

} 

</script>

    
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
             <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
								    
							<div class="browse-inner">
							   <div class="col-md-2 w3l-movie-gride-agile">
										
                                       
                                   <video width="200" height="150"  poster=' <%# Eval("poster") %>'   runat="server">
                                
                                                  <source src='<%#Eval("Upload_File") %>' type="video/mp4" runat="server">
                                            </video> 
									    
								
									  <div class="mid-1">
										<div class="w3l-movie-text">
											<h6><%# Eval("v_name") %></h6>		
                                            	<h6>Price:<%# Eval("Cost") %>/-</h6>		
										</div>
										<div class="mid-2">
										
											<p><%# Eval("v_desc") %></p>
												  <asp:Button ID="Button1" runat="server" Text="Subscribe" CommandName="buy" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" />	
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


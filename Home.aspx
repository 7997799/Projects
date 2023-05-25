<%@ Page Title="" Language="C#" MasterPageFile="~/Viewer.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="slidey" style="display:none;">
		<ul>
            <asp:Repeater ID="Repeater1" runat="server"    >
            <ItemTemplate>
                
			<li>
             
                   <asp:Image ID="Image2" runat="server"  ImageUrl=' <%# Eval("poster") %>'  />   
               
              <p class='title'><%# Eval("v_name") %></p><p class='description' ><%# Eval("v_desc") %><asp:Button ID="Button1" runat="server" Text='<%# Eval("Id") %>' BackColor="Yellow"   /> </p> </li>
               
                             </ItemTemplate>
          
        </asp:Repeater>
        
        </ul>   	
    </div>
    <script src="js/jquery.slidey.js"></script>
    <script src="js/jquery.dotdotdot.min.js"></script>
	   <script type="text/javascript">
			$("#slidey").slidey({
				interval: 8000,
				listCount: 5,
				autoplay: false,
				showList: true
			});
			$(".slidey-list-description").dotdotdot();
		</script>


</asp:Content>


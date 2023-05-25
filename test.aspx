<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="cities.js"></script>
    <title></title>
    
     
















</head>
<body>
    <form id="form1" runat="server">
        <div>
            <select onchange="print_city('state', this.selectedIndex);" id="sts" name ="stt" class="form-control" required runat="server"></select>
<select id ="state" class="form-control" required runat="server"></select>
<script language="javascript">print_state("sts");</script>

            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" OnClientClick="Confirm()" />
        </div>
    </form>
</body>
</html>
 <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want to save data?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>
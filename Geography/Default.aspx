<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Saving GeoLocation in SQL Server :: Techbrij.com</title>
    <style type="text/css">
        body {
            font:13px Arial;
        }
        p {
            margin: 0;
            padding: 3px;
        }

        .form label {
            display: block;
            width: 250px;
        }
    </style>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.js"></script>              
</head>
<body>
    <form id="form1" runat="server">
        <div class="form">
            <p>
                For more information, visit <a href="http://techbrij.com">techbrij.com</a>
            </p>
            <p>
                <asp:Label ID="Label1" runat="server" Text="Place Name" AssociatedControlID="txtName"></asp:Label>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label2" runat="server" Text="Address" AssociatedControlID="txtAddress"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label3" runat="server" Text="City" AssociatedControlID="txtCity"></asp:Label>
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label4" runat="server" Text="State" AssociatedControlID="txtState"></asp:Label>
                <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label5" runat="server" Text="Country" AssociatedControlID="txtState"></asp:Label>
                <asp:DropDownList ID="ddlCountry" runat="server">
                    <asp:ListItem Value="1">India</asp:ListItem>
                    <asp:ListItem Value="2">US</asp:ListItem>
                </asp:DropDownList>
            </p>
            <p>
                <asp:HiddenField ID="hdnLocation" runat="server" />

            </p>
            <p>
                <asp:Button ID="btnSubmit" runat="server" Text="Save"  OnClick="btnSubmit_Click" />
            </p>
            <p id="message"></p>
        </div>
    </form>
     
    <script type="text/javascript">
       
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition, showError);
        }
        else { $("#message").html("Geolocation is not supported by this browser."); }

        function showPosition(position) {
            var latlondata = position.coords.latitude + "," + position.coords.longitude;
            var latlon = "Latitude : " + position.coords.latitude + " <br/> " + "Longitude : " + position.coords.longitude;
            $("#message").html(latlon);
            $("[id*=hdnLocation]").val(position.coords.longitude + " " + position.coords.latitude);
        }

        function showError(error) {
            if (error.code == 1) {
                $("#message").html("User denied the request for Geolocation.");
            }
            else if (error.code == 2) {
                $("#message").html("Location information is unavailable.");
            }
            else if (error.code == 3) {
                $("#message").html("The request to get user location timed out.");
            }
            else {
                $("#message").html("An unknown error occurred.");
            }
        }
    </script>
</body>
</html>

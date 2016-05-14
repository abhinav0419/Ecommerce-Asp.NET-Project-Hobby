<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Confirmation.aspx.cs" Inherits="Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Hallooween Store - Order Confirmation</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="main">
        <h3> The Halloween Store</h3>
            <h1>Order Confirmation</h1>
            <asp:Label ID="lblConfirm" runat="server"></asp:Label><br /><br />
            </p>
            <p>
                <asp:Button ID="btnReturn" runat="server" Text="Return to main page" Font-Bold="True" Font-Size="Large" Height="38px"  CssClass ="button" PostBackUrl="~/Default.aspx" />
            </p>
    </div>
    </form>
</body>
</html>

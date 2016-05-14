<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>The Hallooween Store - Show Shopping Cart</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="main">
        <h3> The Halloween Store</h3>
            <h1>Your shopping cart</h1>
            <asp:ListBox ID="lstCart" runat="server"></asp:ListBox>

            <div id="cartbuttons">
                <br />
                &nbsp;<asp:Button ID="btnRemove" runat="server" Font-Bold="True" Font-Size="Large"  Height="38px" Text="Remove Item" Width="184px" CssClass="topbutton" OnClick="btnRemoveItem_Click"/><br />
                &nbsp;<asp:Button ID="btnEmpty" runat="server" Font-Bold="True" Font-Size="Large"  Height="38px" Text="Empty Cart" Width="184px" CssClass="button" OnClick="btnRemoveAllCartItems_Click" />
            </div>
            <div id="shopbuttons">
               <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" Font-Bold="True" Font-Size="Large"  Height="38px" Width="184px" CssClass="button" PostBackUrl="~/Default.aspx" />&nbsp;&nbsp;
               <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" Font-Bold="True" Font-Size="Large"  Height="38px"  Width="184px" CssClass="button" OnClick="btnCheckOut_Click" />
            </div>
        <p><asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></p>
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DisplayOrders.aspx.cs" Inherits="DisplayOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Display Invoices</title><link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="main">
        <h3>The Halloween Store</h3>
        <h2>Display Invoices</h2>
        Select an invoice to display ordered products:<br /><br />
 <div>
     <asp:GridView ID="GridView1" AllowSorting="true" AllowPaging="true" Runat="server"
        DataSourceID="SqlDataSource1" AutoGenerateSelectButton="true" DataKeyNames="InvoiceNumber"
        AutoGenerateColumns="False"  OnRowCommand="displayGridView2">
      <Columns>
        <asp:BoundField HeaderText="Invoice Number" DataField="InvoiceNumber" SortExpression="InvoiceNumber" />
        <asp:BoundField HeaderText="Customer Email" DataField="CustEmail" SortExpression="CustEmail" />
        <asp:BoundField HeaderText=" Order Date" DataField="OrderDate" SortExpression="OrderDate" DataFormatString="{0:dd/MM/yyyy}" />
        <asp:BoundField HeaderText="Subtotal" DataField="Subtotal" SortExpression="Subtotal" DataFormatString="{0:c}" />
        <asp:BoundField HeaderText="Shipping Method" DataField="ShipMethod" SortExpression="ShipMethod" />
        <asp:BoundField HeaderText="Shipping Cost" DataField="Shipping" SortExpression="Shipping" />
      </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
      SelectCommand="SELECT [InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping] FROM [Invoices]"
      ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" />
</div>
     <br />
  <asp:GridView ID="GridView2" DataSourceID="SqlDataSource2" AutoGenerateColumns="False"
      runat="server" Visible="false">
      <Columns>
        <asp:BoundField HeaderText="Invoice Number" DataField="InvoiceNumber"  />
        <asp:BoundField HeaderText="Product ID" DataField="ProductID"  />
        <asp:BoundField HeaderText="Unit Price" DataField="UnitPrice"   DataFormatString="{0:c}" />
        <asp:BoundField HeaderText="Quantity" DataField="Quantity"  />
          <asp:BoundField HeaderText="Extension" DataField="Extension"  DataFormatString="{0:c}" />
      </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" />
    </div>
    </form>
</body>
</html>

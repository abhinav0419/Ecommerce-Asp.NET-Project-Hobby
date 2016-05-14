<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Halloween Store< - Checkout</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="main">
        <h3> The Halloween Store</h3>
            <h1>Your shopping cart</h1><br /><br />
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="180px" Width="359px">
                <AlternatingRowStyle BackColor="White" />
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <br /><br />
             <p><asp:Label ID="Label2" runat="server" Text="Please select a customer" Font-Bold="True" Font-Size="Large" />

                 <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="SqlDataSource1" DataTextField="Expr1" DataValueField="Email" AutoPostBack="True"></asp:DropDownList>
          </asp:DropDownList><br />
                 <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateEditButton="True" AutoGenerateRows="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Email" DataSourceID="SqlDataSource2" EnablePagingCallbacks="True" ForeColor="Black" GridLines="Vertical" Height="50px" Width="326px">
                     <AlternatingRowStyle BackColor="White" />
                     <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                     <Fields>
                         <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                         <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                         <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                         <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                         <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                         <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                         <asp:BoundField DataField="ZipCode" HeaderText="Zip Code" SortExpression="ZipCode" />
                         <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber" />
                     </Fields>
                     <FooterStyle BackColor="#CCCC99" />
                     <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                     <RowStyle BackColor="#F7F7DE" />
                 </asp:DetailsView>
                 <br />
          </p>
     <hr />
                    <h2>Shipping method:</h2>
            <asp:RadioButtonList ID="rblShipping" runat="server">
                <asp:ListItem Selected="True">UPS Ground</asp:ListItem>
                <asp:ListItem>UPS Second Day</asp:ListItem>
                <asp:ListItem>Federal Express Next Day</asp:ListItem>
            </asp:RadioButtonList>
            <h2>Payment information:</h2>
            <div id="payment">
                <asp:ListBox ID="lstCardType" runat="server" Width="155px" Rows="4">
                    <asp:ListItem Selected="True" Value="None">--Select a credit card--</asp:ListItem>
                    <asp:ListItem>VISA</asp:ListItem>
                    <asp:ListItem Value="MC">MasterCard</asp:ListItem>
                    <asp:ListItem Value="AMEX">American Express</asp:ListItem>
                </asp:ListBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lstCardType"
                    Display="Dynamic" ErrorMessage="You must select a credit card." InitialValue="None" CssClass="validator">
                </asp:RequiredFieldValidator><br /><br />
                
                <label>Card number:</label>
                <asp:TextBox ID="txtCardNumber" runat="server" MaxLength="20" Width="160px" CssClass="entry"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCardNumber"
                        ErrorMessage="Credit card number is required." Display="Dynamic" CssClass="validator"></asp:RequiredFieldValidator><br />
                <label>Expiration date:</label>
                    <asp:DropDownList ID="ddlMonth" runat="server" Width="100px" CssClass="entry">
                        <asp:ListItem Value="1">January</asp:ListItem>
                        <asp:ListItem Value="2">February</asp:ListItem>
                        <asp:ListItem Value="3">March</asp:ListItem>
                        <asp:ListItem Value="4">April</asp:ListItem>
                        <asp:ListItem Value="5">May</asp:ListItem>
                        <asp:ListItem Value="6">June</asp:ListItem>
                        <asp:ListItem Value="7">July</asp:ListItem>
                        <asp:ListItem Value="8">August</asp:ListItem>
                        <asp:ListItem Value="9">September</asp:ListItem>
                        <asp:ListItem Value="10">October</asp:ListItem>
                        <asp:ListItem Value="1">November</asp:ListItem>
                        <asp:ListItem Value="12">December</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlYear" runat="server" Width="58px" CssClass="entry">
                    </asp:DropDownList><br />
            </div>

    <hr />
        <br />
   
            <div id=""<div id="shopbuttons">&nbsp;<asp:Button ID="btnPlaceOrder" Font-Bold="True" Font-Size="Large" Height="38px"  runat="server" Text="Place Order" 
                     CssClass="button" OnClick="btnPlaceOrder_Click" />&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" 
                     CssClass="button" Font-Bold="True" Font-Size="Large" Height="38px"  OnClick ="btnCancel_Click" CausesValidation="False" />&nbsp;
                <asp:Button ID="btnContinue" runat="server" Font-Bold="True" Font-Size="Large" Height="38px" 
                    Text="Continue Shopping" CausesValidation="False" 
                   CssClass="button" PostBackUrl="~/Default.aspx" />




                <br />
                <br />
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                <br />




        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" SelectCommand="SELECT LastName, FirstName, Email, FirstName +  ' ' + LastName AS Expr1 FROM Customers ORDER BY LastName, FirstName"></asp:SqlDataSource>
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" SelectCommand="SELECT [Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber] FROM [Customers] WHERE ([Email] = @Email)">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="ddlCustomers" Name="Email" PropertyName="SelectedValue" Type="String" />
                     </SelectParameters>

                 </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>"
                 InsertCommand="INSERT INTO Invoices (CustEMail, OrderDate, Subtotal, ShipMethod, Shipping, SalesTax, Total, CreditCardType, CardNumber, ExpirationMonth, ExpirationYear) VALUES (@CustEMail, @OrderDate, @Subtotal, @ShipMethod, @Shipping, @SalesTax, @Total, @CreditCardType, @CardNumber, @ExpirationMonth, @ExpirationYear)">
                <InsertParameters>
                    <asp:Parameter Name="CustEMail" />
                    <asp:Parameter Name="OrderDate" />
                    <asp:Parameter Name="Subtotal" Type="Decimal"/>
                    <asp:Parameter Name="ShipMethod" />
                    <asp:Parameter Name="Shipping" Type="Decimal" />
                    <asp:Parameter Name="SalesTax" Type="Decimal" />
                    <asp:Parameter Name="Total" Type="Decimal" />
                    <asp:Parameter Name="CreditCardType" />
                    <asp:Parameter Name="CardNumber" />
                    <asp:Parameter Name="ExpirationMonth" Type="Int16" />
                    <asp:Parameter Name="ExpirationYear" Type="Int16" />
                </InsertParameters>
            </asp:SqlDataSource>



               <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>"
                InsertCommand="INSERT INTO LineItems (InvoiceNumber, ProductID, UnitPrice, Quantity)
                               VALUES (@InvoiceNumber, @ProductID, @UnitPrice, @Quantity)">
                <InsertParameters>
                    <asp:Parameter Name="InvoiceNumber" />
                    <asp:Parameter Name="ProductID" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="Quantity" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

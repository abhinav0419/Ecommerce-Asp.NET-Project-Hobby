<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>The Halloween Store</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="main">
        <h3>The Halloween Store</h3>

      <section>

          &nbsp;<asp:Label ID="Label2" runat="server" Text="Please select a product" Font-Bold="True" Font-Size="Large" ></asp:Label> <br /><br />
          &nbsp;<asp:DropDownList ID="ddlProducts" runat="server" Width="216px" AutoPostBack="true" OnSelectedIndexChanged="ddl_SelectedIndexChanged">
          </asp:DropDownList>
          <br /><br />
         
          <table style="width: 530px;">
          <colgroup>
             <col style="width: 122px;" />
             <col style="width: 397px;" />
          </colgroup>
          <tr>
              <td style="width: 135px;"><asp:Label ID="Label1" runat="server" Text="Product ID:" Width="110px"></asp:Label></td>
              <td><asp:Label ID="lblProductID" runat="server" Text="Label"></asp:Label></td>
          </tr>

           <tr>         
              <td> <asp:Label ID="Label3" runat="server" Text="Product Name:" Width="110px"></asp:Label></td>
              <td><asp:Label ID="lblProductName" runat="server" Text="Label"></asp:Label></td>
          </tr>

           <tr> 
              <td class="description" style="height: 36px"><asp:Label ID="Label5" runat="server" Text="Description:" Width="110px"></asp:Label></td>
              <td class="description" style="height: 36px"><asp:Label ID="lblDescription" runat="server" Text="Label" Width="375px" Height="30px"></asp:Label></td>
          </tr>

          <tr> 
          <td><asp:Label ID="Label7" runat="server" Text="Product Category:" Width="110px"></asp:Label></td>
              <td><asp:Label ID="lblProductCategory" runat="server" Text="Label"></asp:Label></td>
          </tr>

          <tr> 
          <td><asp:Label ID="Label9" runat="server" Text="Price" Width="110px"></asp:Label></td>
              <td><asp:Label ID="lblProductPrice" runat="server" Text="Label"></asp:Label></td>
           </tr>
        <tr>
          <td><asp:Label ID="Label10" runat="server" Text="Quanity: " Width="110px"></asp:Label></td>
              <td>
                  <asp:TextBox ID="txtPurchaseQuantity" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="quantityReqError" ValidationGroup="defaultErrorPage"  ControlToValidate="txtPurchaseQuantity" ForeColor="Red" runat="server" ErrorMessage="Quantity cannot be blank!" />
         <asp:RangeValidator ID="rangeError" ValidationGroup="defaultErrorPage" ControlToValidate="txtPurchaseQuantity" ForeColor="Red" runat="server" type="Integer" MinimumValue="1" MaximumValue="100" ErrorMessage="Quantity range is 1-100"/>
                   </td>
                   </tr>
               </table>
      </section>
      <aside>
        <asp:Image ID="imgProduct" runat="server" Visible="True" CssClass="Left" Height="200px" Width="200px"  />
       </aside>
      <br />
      <br />
        <table style="width: 900px;" >
        <tr><td style="text-align: center;">
               <asp:Button ID="btnSaveCart" runat="server" ValidationGroup="defaultErrorPage" Font-Bold="True" Font-Size="Large"  Height="38px" Text="Add to Cart" Width="184px" CssClass="button" OnClick="btnSaveCart_Click" />
               &nbsp;&nbsp;

               <asp:Button ID="btnGetCart" runat="server" Font-Bold="True" Font-Size="Large" Height="38px" PostBackUrl="~/Cart.aspx" Text="Go to Cart" Width="176px" CssClass="button" />
               &nbsp;&nbsp;

              <asp:Button ID="btnCheckout" runat="server" Font-Bold="True" Font-Size="Large" Height="38px" Text="Check Out" Width="176px" CssClass="button" CausesValidation="false" OnClick="btnCheckOutCart_Click" />
              
         </td> </tr>  

         <tr><td>
             <asp:Label ID="Label4" runat="server" Text="#Items in Cart"></asp:Label>
               <asp:Label ID="lblCartCount" runat="server" ></asp:Label><br /><br />
               <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
         </td> </tr>

        </table>
    
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MaintainProducts.aspx.cs" Inherits="MaintainProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="main">
        <h3>The Halloween Store</h3>
        <h2>Maintain Products</h2>
        <br /><br />
 <div>
     <asp:GridView ID="GridView1" AllowSorting="true" AllowPaging="true" Runat="server"
        DataSourceID="SqlDataSource1" AutoGenerateSelectButton="true" DataKeyNames="ProductID"
        AutoGenerateColumns="False"   >
      <Columns>
        <asp:BoundField HeaderText="Product ID" DataField="ProductID" SortExpression="ProductID" />
        <asp:BoundField HeaderText="Name" DataField="Name" SortExpression="Name" />
          <asp:BoundField HeaderText="Category ID" DataField="CategoryID" SortExpression="CategoryID" />
      </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
      SelectCommand="SELECT [ProductID], [Name], [CategoryID] FROM [Products]"
      ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" />
</div>
     <br />
           <asp:formview id="ProductFormView"
        datasourceid="ProductSource"
        allowpaging="true"
        datakeynames="ProductID" 
        runat="server">
               <ItemTemplate>
                   <table border="0">

            <tr>

                <td class="ProductPropertyLabel">Product ID:</td>

                <td class="ProductPropertyValue">

                  <%# Eval("ProductID") %></td>
                </tr>
                <tr>
                <td class="ProductPropertyLabel">Name:</td>

                <td class="ProductPropertyValue">

                  <%# Eval("Name")%></td>
            </tr>
                <tr>
                <td class="ProductPropertyLabel">Short Description:</td>

                <td class="ProductPropertyValue">

                  <%# Eval("ShortDescription")%></td>

            </tr>
            <tr>
                <td class="ProductPropertyLabel">Long Description:</td>

                <td class="ProductPropertyValue">

                  <%# Eval("LongDescription")%></td>

            </tr>
                       <tr>
                <td class="ProductPropertyLabel">Category ID :</td>

                <td class="ProductPropertyValue">

                  <%# Eval("CategoryID")%></td>

            </tr>
                       <tr>
                <td class="ProductPropertyLabel">Image File:</td>

                <td class="ProductPropertyValue">

                  <%# Eval("ImageFile")%></td>

            </tr>
           <tr>
                <td class="ProductPropertyLabel">Unit Price :</td>

                <td class="ProductPropertyValue">

                  <%# Eval("UnitPrice")%></td>

            </tr>
                       <tr>
                <td class="ProductPropertyLabel">On Hand:</td>

                <td class="ProductPropertyValue">

                  <%# Eval("OnHand")%></td>

            </tr>
                       <tr>
                      <td colspan="2">
                        <asp:LinkButton ID="EditButton"
                                        Text="Edit"
                                        CommandName="Edit"
                                        RunAt="server"/>
                        &nbsp;
                        <asp:LinkButton ID="NewButton"
                                        Text="New"
                                        CommandName="New"
                                        RunAt="server"/>
                        &nbsp;
                        <asp:LinkButton ID="DeleteButton"
                                        Text="Delete"
                                        CommandName="Delete"
                                        RunAt="server"/>
                      </td>
                    </tr>
        </table>
               </ItemTemplate>

                <EditItemTemplate>
                  <table>
                    <tr><td align="right"><b>Product ID:</b></td><td><%# Eval("ProductID") %></td></tr>

                    <tr><td align="right"><b>Name:</b></td>
                        <td><asp:TextBox ID="EditLastNameTextBox" 
                                         Text='<%# Bind("Name") %>' 
                                         RunAt="Server" /></td></tr>
                        <tr><td align="right"><b>Short Description</b></td>
                        <td><asp:TextBox ID="EditFirstNameTextBox" 
                                         Text='<%# Bind("ShortDescription") %>' 
                                         RunAt="Server" /></td></tr>
                       <tr><td align="right"><b>Long Description</b></td>
                        <td><asp:TextBox ID="TextBox1" 
                                         Text='<%# Bind("LongDescription") %>' 
                                         RunAt="Server" /></td></tr>
                       <tr><td align="right"><b>Category ID</b></td>
                        <td><asp:TextBox ID="TextBox2" 
                                         Text='<%# Bind("CategoryID") %>' 
                                         RunAt="Server" /></td></tr>
                       <tr><td align="right"><b>Image File</b></td>
                        <td><asp:TextBox ID="TextBox3" 
                                         Text='<%# Bind("ImageFIle") %>' 
                                         RunAt="Server" /></td></tr>
                       <tr><td align="right"><b>On Hand</b></td>
                        <td><asp:TextBox ID="TextBox4" 
                                         Text='<%# Bind("OnHand") %>' 
                                         RunAt="Server" /></td></tr>
                       <tr><td align="right"><b>Unit Price</b></td>
                        <td><asp:TextBox ID="TextBox5" 
                                         Text='<%# Bind("UnitPrice") %>' 
                                         RunAt="Server" /></td></tr>
                    <tr>
                      <td colspan="2">
                        <asp:LinkButton ID="UpdateButton"
                                        Text="Update"
                                        CommandName="Update"
                                        RunAt="server"/>
                        &nbsp;
                        <asp:LinkButton ID="CancelUpdateButton"
                                        Text="Cancel"
                                        CommandName="Cancel"
                                        RunAt="server"/>
                      </td>
                    </tr>
                  </table>                 
                </EditItemTemplate>

               <InsertItemTemplate>
                  <table>
                       <tr><td align="right"><b>Product ID</b></td>
                        <td><asp:TextBox ID="TextBox7" 
                                         Text='<%# Bind("ProductID") %>' 
                                         RunAt="Server" /></td></tr>
                    <tr><td align="right"><b>Name:</b></td>
                        <td><asp:TextBox ID="EditLastNameTextBox" 
                                         Text='<%# Bind("Name") %>' 
                                         RunAt="Server" /></td></tr>
                        <tr><td align="right"><b>Short Description</b></td>
                        <td><asp:TextBox ID="EditFirstNameTextBox" 
                                         Text='<%# Bind("ShortDescription") %>' 
                                         RunAt="Server" /></td></tr>
                       <tr><td align="right"><b>Long Description</b></td>
                        <td><asp:TextBox ID="TextBox1" 
                                         Text='<%# Bind("LongDescription") %>' 
                                         RunAt="Server" /></td></tr>
                       <tr><td align="right"><b>Category ID</b></td>
                        <td><asp:TextBox ID="TextBox2" 
                                         Text='<%# Bind("CategoryID") %>' 
                                         RunAt="Server" /></td></tr>
                       <tr><td align="right"><b>Image File</b></td>
                        <td><asp:TextBox ID="TextBox3" 
                                         Text='<%# Bind("ImageFIle") %>' 
                                         RunAt="Server" /></td></tr>
                       <tr><td align="right"><b>On Hand</b></td>
                        <td><asp:TextBox ID="TextBox4" 
                                         Text='<%# Bind("OnHand") %>' 
                                         RunAt="Server" /></td></tr>
                         <tr><td align="right"><b>Unit Price</b></td>
                        <td><asp:TextBox ID="TextBox6" 
                                         Text='<%# Bind("UnitPrice") %>' 
                                         RunAt="Server" /></td></tr>
                   <tr>
                      <td colspan="2">
                        <asp:LinkButton ID="InsertButton"
                                        Text="Insert"
                                        CommandName="Insert"
                                        RunAt="server"/>
                        &nbsp;
                        <asp:LinkButton ID="CancelInsertButton"
                                        Text="Cancel"
                                        CommandName="Cancel"
                                        RunAt="server"/>
                      </td>
                    </tr>
                  </table>                 
                </InsertItemTemplate>
      </asp:formview>  
          
      <asp:sqldatasource id="ProductSource"
        selectcommand="Select [ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID],[ImageFile],[UnitPrice],[OnHand] From [Products] WHERE [ProductID]=@ProductID"
          DeleteCommand="DELETE [Products] WHERE [ProductID]=@ProductID"
          UpdateCommand="UPDATE [Products] SET [ShortDescription]=@ShortDescription, [Name]=@Name, [LongDescription]=@LongDescription,[CategoryID]=@CategoryID,[ImageFile]=@ImageFile,[UnitPrice]=@UnitPrice,[OnHand]=@OnHand  
                           WHERE [ProductID]=@ProductID"
          InsertCommand="INSERT INTO [Products](ProductID,Name, ShortDescription,LongDescription,CategoryID,ImageFile,UnitPrice,OnHand) VALUES (@ProductID, @Name,@ShortDescription,@LongDescription,@UnitPrice,@OnHand,@ImageFile,@CategoryID); 
                         SELECT @ProductID = SCOPE_IDENTITY()"
        connectionstring="<%$ ConnectionStrings:HalloweenConnectionString%>" 
        runat="server">
          <SelectParameters>
<asp:ControlParameter Name="ProductID"  Type="String" ControlID="GridView1" PropertyName="SelectedValue"></asp:ControlParameter>
</SelectParameters>
      </asp:sqldatasource>
    </div>
    </form>
</body>
</html>

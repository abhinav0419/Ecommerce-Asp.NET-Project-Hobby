using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using Halloween.App_Code;

public partial class Checkout : System.Web.UI.Page
{
    private SortedList<string, CartItem> cart;
    private string connectionString =
        WebConfigurationManager.ConnectionStrings["HalloweenConnectionString"].ConnectionString;
    private string invoiceNumber;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["cart"] == null)
        {
            lblMessage.Text = "There is no shopping cart - did you come to this page from one of this application's web pages?";
        }
        else
        //  The cart is used to populate the list box and is needed for remove operations.  Don't repopulate the list box on PostBacks.
        {
            cart = (SortedList<string, CartItem>)Session["cart"];
            GridView1.DataSource = cart.Values;
            GridView1.DataBind();


        }


        if (!IsPostBack)
            this.LoadYears();
    }

    private void LoadYears()
    {
        int year = DateTime.Now.Year;
        for (int i = 0; i < 7; i++)
        {
            ddlYear.Items.Add(year.ToString());
            year += 1;
        }
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("mycart");
        Response.Redirect("default.aspx");
    }

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            this.PutInvoice();
            this.GetInvoiceNumber();
            this.PutLineItems();
            Session.Remove("mycart");
            Response.Redirect("Confirmation.aspx"); 
        }
    }

    private void PutInvoice()
    {
        SqlDataSource3.InsertParameters["CustEMail"].DefaultValue = ddlCustomers.SelectedValue;
        SqlDataSource3.InsertParameters["OrderDate"].DefaultValue = DateTime.Today.ToString();
        int quantity = this.Quantity();

        SqlDataSource3.InsertParameters["ShipMethod"].DefaultValue
            = rblShipping.SelectedValue;
        double shipping = 0;
        switch (rblShipping.SelectedValue)
        {
            case "UPS Ground":
                shipping = 3.95 + (quantity - 1) * 1.25;
                break;
            case "UPS Second Day":
                shipping = 7.95 + (quantity - 1) * 2.5;
                break;
            case "Federal Express Next Day":
                shipping = 19.95 + (quantity - 1) * 4.95;
                break;
        }
        SqlDataSource3.InsertParameters["Shipping"].DefaultValue
            = shipping.ToString();

        decimal subTotal = this.SubTotal();
        SqlDataSource3.InsertParameters["Subtotal"].DefaultValue = subTotal.ToString();
        decimal salesTax = subTotal * (decimal)0.075;
        SqlDataSource3.InsertParameters["SalesTax"].DefaultValue = salesTax.ToString();
        decimal total = subTotal + salesTax;
        SqlDataSource3.InsertParameters["Total"].DefaultValue = total.ToString();
        SqlDataSource3.InsertParameters["CreditCardType"].DefaultValue = lstCardType.SelectedValue;
        SqlDataSource3.InsertParameters["CardNumber"].DefaultValue = txtCardNumber.Text;
        SqlDataSource3.InsertParameters["ExpirationMonth"].DefaultValue = ddlMonth.SelectedValue;
        SqlDataSource3.InsertParameters["ExpirationYear"].DefaultValue = ddlYear.SelectedValue;
        SqlDataSource3.Insert();
    }

    private int Quantity()
    {
        int quantity = 0;
        IList<CartItem> items = cart.Values;
        for (int i = 0; i < items.Count; i++)
        {
            CartItem item = items[i];
            quantity += item.OrderQty;
        }
        return quantity;
    }


    private decimal SubTotal()
    {
        decimal subTotal = 0;
        IList<CartItem> items = cart.Values;
        for (int i = 0; i < items.Count; i++)
        {
            CartItem item = items[i];
            subTotal += item.OrderQty * item.Price; 
        }
        return subTotal;
    }

    private void GetInvoiceNumber()
    {
        SqlConnection con =
            new SqlConnection(connectionString);
        SqlCommand invoiceNoCommand =
            new SqlCommand("Select Ident_Current('Invoices') From Invoices", con);
        con.Open();
        invoiceNumber = invoiceNoCommand.ExecuteScalar().ToString();
        con.Close();
    }

    private void PutLineItems()
    {
        IList<CartItem> items = cart.Values;
        for (int i = 0; i < items.Count; i++)
        {
            CartItem cartItem = items[i];
            SqlDataSource4.InsertParameters["InvoiceNumber"].DefaultValue = invoiceNumber;
            SqlDataSource4.InsertParameters["ProductID"].DefaultValue = cartItem.ProductID;
            SqlDataSource4.InsertParameters["UnitPrice"].DefaultValue = cartItem.Price.ToString();
            SqlDataSource4.InsertParameters["Quantity"].DefaultValue = cartItem.OrderQty.ToString();
            SqlDataSource4.Insert();
        }
    }



}
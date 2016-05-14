using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Collections.Generic;
using Halloween.App_Code;

public partial class Cart : System.Web.UI.Page
{

    SortedList<string, CartItem> cart;
    protected void Page_Load(object sender, EventArgs e)
    {

        cart = (SortedList<String, CartItem>)Session["cart"];

        if (Session["cart"] == null)
        {
            lblMessage.Text = "Session is Null, Either it expired or you came to this page directly.";
        }
        if (!IsPostBack)
        {
            displayCartItems();
        }
       
    }

    private void displayCartItems()
    {
        lstCart.Items.Clear();
        if (cart !=null) {
            foreach (KeyValuePair<String, CartItem> cartItem in cart)
            {
                ListItem entry = new ListItem();
                entry.Value = cartItem.Key;
                entry.Text = cartItem.Value.Name + "(" + cartItem.Value.OrderQty + " " + "at $" + " " + cartItem.Value.Price + " " + "each" + " " + ")";
                lstCart.Items.Add(entry);
            }
        }
    }

    public void btnRemoveAllCartItems_Click(object sender, EventArgs e)
    {
        cart.Clear();
        displayCartItems();
        Session.Remove("cart");
    }

    public void btnCheckOut_Click(object sender, EventArgs e)
    {
        if (cart!=null)
        {
            Response.Redirect("Checkout.aspx");
        }

        else if(cart==null)
        {
            lblMessage.Text = "There should be atleast one product in the cart before checkout";
        }
    }

    public void btnRemoveItem_Click(object sender,EventArgs e)
    {
        if (lstCart.SelectedIndex < 0)
        {
            lblMessage.Text = "Please Select The Item You Want To Remove.";
        }
        else if (lstCart.SelectedIndex >=0)
        {
            lblMessage.Text = "";
            String cartItem = lstCart.SelectedValue.ToString();
            cart.Remove(cartItem);
        }
        Session.Remove("cart");
        displayCartItems();
    }
   
}
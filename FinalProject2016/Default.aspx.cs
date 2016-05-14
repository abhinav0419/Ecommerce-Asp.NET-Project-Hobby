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

public partial class _Default : System.Web.UI.Page
{
    private SortedList<string, CartItem> cart;
    private DBConnector dbConn = new DBConnector();
    private int index = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlProducts.DataSource = dbConn.getProducts();
            ddlProducts.DataTextField = "Name";
            ddlProducts.DataValueField = "ProductID";
            ddlProducts.DataBind();
            ddlProducts.SelectedIndex = 0;
            setLabelsForProduct(ddlProducts.SelectedValue);
        }

        if (Session["cart"] == null)
        {
            cart = new SortedList<string, CartItem>();
            Session["cart"] = cart;
        }
        else
        {
            cart = (SortedList<string, CartItem>)Session["cart"];
        }
        lblCartCount.Text = countDiffItemsInCart().ToString();
    }

    private int countDiffItemsInCart()
    {
        int rs = 0;
        List<string> tmp = new List<string>();
        for (int i = 0; i < cart.Count; i++)
        {
            string key = cart.Keys[i];
            if (!tmp.Contains(key))
            {
                tmp.Add(key);
            }

        }
        rs = tmp.Count;
        return rs;
    }

    protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        string productID = ((DropDownList)sender).SelectedValue;
        setLabelsForProduct(productID);
    }

    private void setLabelsForProduct(string productID)
    {
        DataTable dt = dbConn.getProductInfo(productID);
        lblProductID.Text = dt.Rows[0][0].ToString();
        lblProductName.Text = dt.Rows[0][1].ToString();
        lblDescription.Text = dt.Rows[0][3].ToString();
        lblProductCategory.Text = dt.Rows[0][4].ToString();
        Decimal pp = Convert.ToDecimal(dt.Rows[0][6].ToString());
        lblProductPrice.Text = pp.ToString("C");
        string imgFile = dt.Rows[0][5].ToString();
        imgProduct.ImageUrl = "~/images/Products/" + imgFile;
    }

    protected void btnSaveCart_Click(object sender, EventArgs e)
    {
        if (!check(ddlProducts.SelectedValue.Trim()))
        {
            string sub = lblProductPrice.Text.Substring(1) ;
            CartItem _new = new CartItem(lblProductID.Text.Trim(), lblProductName.Text.Trim(), Convert.ToDecimal(sub), Convert.ToInt32(txtPurchaseQuantity.Text.Trim()));
            cart.Add(lblProductID.Text.Trim(), _new);

        }
        else
        {
            cart[lblProductID.Text.Trim()].OrderQty += Convert.ToInt32(txtPurchaseQuantity.Text.Trim());
        }
        lblCartCount.Text = countDiffItemsInCart().ToString();
        Response.Redirect("Cart.aspx");
    }

    private bool check(string productID)
    {
        for (int i = 0; i < cart.Count; i++)
            if (cart.Keys[i].Equals(productID))
                return true;
        return false;
    }

    protected void btnCheckOutCart_Click(object sender, EventArgs e)
    {
        if (countDiffItemsInCart()>0)
        {
            Response.Redirect("Checkout.aspx");
        }

        else
        {
            lblErrorMessage.Text = "There should be atleast one product in the cart before checkout";
        }
    }
}
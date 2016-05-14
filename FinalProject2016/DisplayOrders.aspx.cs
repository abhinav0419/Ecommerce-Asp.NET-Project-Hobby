using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Halloween.App_Code;

public partial class DisplayOrders : System.Web.UI.Page
{
    private DBConnector dbConn = new DBConnector();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void displayGridView2(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName=="Select")
        {
            //GridViewRow row = GridView1.SelectedRow;
            String invNum1=GridView1.Rows[index].Cells[1].Text;
            int invNum;
           int.TryParse(invNum1,out invNum);
            System.Diagnostics.Debug.WriteLine("inv numebr is "+invNum);
            SqlDataSource2.SelectCommand = "SELECT [InvoiceNumber], [ProductID], [UnitPrice], [Quantity], [Extension] FROM [LineItems] WHERE InvoiceNumber=" +invNum;
            GridView2.DataBind();
            GridView2.Visible = true;
        }
    }
}
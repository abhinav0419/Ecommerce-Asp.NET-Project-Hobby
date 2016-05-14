using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// This class represents data about an item in the shopping cart for a customer
/// </summary>
public class CartItem
{
    private string productID;
    private string name;
    private decimal price;
    private int orderQty;

	public CartItem()
	{
    }

    public CartItem(string productID, 
                    string name,
                    decimal price,
                    int orderQty)
	{
        ProductID = productID;
        Name = name;
        Price = price;
        OrderQty = orderQty; 
    }
    
    public string ProductID
    {
        get { return productID; }
        set { productID = value; }
    }
    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    public decimal Price
    {
        get { return price; }
        set { price = value; }
    }
    public int OrderQty
    {
        get { return orderQty; }
        set { orderQty = value; }
    }
}



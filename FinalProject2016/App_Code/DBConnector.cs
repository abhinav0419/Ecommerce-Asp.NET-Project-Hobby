using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Halloween.App_Code
{
    public class DBConnector
    {
        public static String stringConn = ConfigurationManager.ConnectionStrings["HalloweenConnectionString"].ToString();
        public SqlConnection conn = new SqlConnection(stringConn);
        public DataTable getProducts()
        {
            try
            {
                conn.Open();
                string select = "SELECT ProductID, Name FROM dbo.Products";
                SqlDataAdapter ad = new SqlDataAdapter(select, conn);
                DataSet ds = new DataSet();
                ad.Fill(ds, "Products");
                return ds.Tables[0];
            }
            catch (Exception e)
            {

            }
            finally
            {
                conn.Close();
            }
            return null;
        }

        public DataTable getProductInfo(string ProductID)
        {
            try
            {
                conn.Open();
                string select = "SELECT * FROM dbo.Products where ProductID ='" + ProductID + "'";
                SqlDataAdapter ad = new SqlDataAdapter(select, conn);
                DataSet ds = new DataSet();
                ad.Fill(ds, "info");
                return ds.Tables[0];
            }
            catch (Exception e)
            {

            }
            finally
            {
                conn.Close();
            }
            return null;
        }


    }
}

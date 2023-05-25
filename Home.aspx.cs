using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Home : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Learn_IT\Learn_IT\App_Data\learnit_database.mdf;Integrated Security=True");
   // SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Dell\Desktop\Learn_IT\Learn_IT\App_Data\learnit_database.mdf;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            categorynamemethod();
        }

    }
    public void categorynamemethod()
    {
        SqlCommand cmd = new SqlCommand("select * from addvideos", con);

        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            Repeater1.DataSource = rd;
            Repeater1.DataBind();
        }
        else
        {
            Response.Write("No Details are available");
        }
        con.Close();
    }



    
}
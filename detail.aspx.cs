using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class detail : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Learn_IT\Learn_IT\App_Data\learnit_database.mdf;Integrated Security=True");
    int id; string a = ""; string b = "";
    protected void Page_Load(object sender, EventArgs e)
    {
    id = Convert.ToInt32(Request.QueryString["id"].ToString());
        if (!Page.IsPostBack)
        {
           // Label3.Text = Session["email"].ToString();
            categorynamemethod();
        }

    }
    public void categorynamemethod()
    {
        if (id==0)
        {
            SqlCommand cmd = new SqlCommand("select * from addvideos ", con);

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
        else
        {
            SqlCommand cmd = new SqlCommand("select * from addvideos where Id='"+id+"'", con);

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

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName=="buy")
        {
            if (Session["email"]==null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Login First. ');window.location='Home.aspx ';", true);


            }

            else
            {
               int f=Convert.ToInt32(e.CommandArgument.ToString());
                con.Open();
                SqlCommand cmd1 = new SqlCommand("select * from sub_video where U_email='"+Session["email"].ToString()+"' and V_id ='"+e.CommandArgument.ToString()+"'", con);
              
                cmd1.ExecuteScalar();
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);
                con.Close();
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Selected Video Already Subscribed. ');window.location='myvedio.aspx ';", true);


                }

                else
                {

                    con.Open();
                    SqlCommand cmd = new SqlCommand("select * from addvideos where Id='"+e.CommandArgument.ToString()+"'", con);


                    cmd.ExecuteScalar();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    con.Close();

                    string i = ds.Tables[0].Rows[0]["Cost"].ToString();


                    string r = ds.Tables[0].Rows[0]["Id"].ToString();
                    string m = ds.Tables[0].Rows[0]["nofday"].ToString();
                    Response.Write(a);
                    ClientScript.RegisterStartupScript(this.GetType(), "myfunction", "senemail('" + i + "','" + r+ "','" + Session["email"].ToString() + "','"+m+"')", true);
                }
            }


        }
    }
}
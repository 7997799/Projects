using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data;

public partial class change_password : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Learn_IT\Learn_IT\App_Data\learnit_database.mdf;Integrated Security=True");
    //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Dell\Desktop\Learn_IT\Learn_IT\App_Data\learnit_database.mdf;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void update_password_Click(object sender, EventArgs e)
    {
       
        con.Open();
        SqlCommand cmd = new SqlCommand("select Password from register where  Email='" + Session["email"].ToString() + "' ", con);

        cmd.ExecuteScalar();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        
            string i = ds.Tables[0].Rows[0]["Password"].ToString();
            if (i == oldpasswordtxt.Text)
            {

                con.Open();
                SqlCommand cmd1 = new SqlCommand("update register set Password=@newpassword where Email='" + Session["email"].ToString() + "'", con);

                cmd1.Parameters.AddWithValue("@newpassword", newpasswordtxt.Text);
                cmd1.Parameters["@newpassword"].Value = newpasswordtxt.Text;
                cmd1.ExecuteNonQuery();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Your pasword change Succesfully. ');window.location='Home.aspx ';", true);

                con.Close();
            }

        else
        {
            Response.Write("<script language=javascript>alert('Kindly enter valid Old Password');</script>");

        }
























        //var check = cmd.ExecuteReader();
        //while (check.Read())
        //{
        //    if (oldpasswordtxt.Text == check["Password"].ToString())
        //    {
        //        up = 1;
        //    }
        //}

        //check.Close();
        //con.Close();
        //if (up == 1)
        //{
        //    con.Open();
        //    SqlCommand cmd1 = new SqlCommand("update register set Password=@newpassword where Email='" + Session["email"].ToString() + "'",con);

        //    cmd1.Parameters.AddWithValue("@newpassword", newpasswordtxt.Text);
        //    cmd1.Parameters["@newpassword"].Value = newpasswordtxt.Text;
        //    cmd1.ExecuteNonQuery();
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Your pasword change Succesfully. ');window.location='Home.aspx ';", true);

        //    con.Close();

        //}
        //else
        //{
        //    Response.Write("<script language=javascript>alert('ERROR');</script>");
        //}





    }
}
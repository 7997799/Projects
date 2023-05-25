using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Learn_IT\Learn_IT\App_Data\learnit_database.mdf;Integrated Security=True");
    //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Dell\Desktop\Learn_IT\Learn_IT\App_Data\learnit_database.mdf;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {

    }




    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string city = Request.Form["cty"];
        string state = Request.Form["stt"];

        //Response.Write(city);
        //Response.Write(state);
        con.Open();

        SqlCommand cmd = new SqlCommand("Insert into register values(@Name,@Password,@Email,@Phone_number,@Address,@city,@State,@Country,@Pincode,@Gender,@qualification,@occupation)", con);

        cmd.Parameters.AddWithValue("@Name", Name.Text);
        cmd.Parameters.AddWithValue("@Password", Password.Text);
        cmd.Parameters.AddWithValue("@Email", Email.Text);
        cmd.Parameters.AddWithValue("@Phone_number", Phone_number.Text);
        cmd.Parameters.AddWithValue("@Address", Address.Text);
        cmd.Parameters.AddWithValue("@city", city);
        cmd.Parameters.AddWithValue("@State", state);
        cmd.Parameters.AddWithValue("@Country", Country.Text);
        cmd.Parameters.AddWithValue("@Pincode", Pincode.Text);
        cmd.Parameters.AddWithValue("@Gender", RadioButtonList1.SelectedValue);
        cmd.Parameters.AddWithValue("@qualification", qualification.Text);
        cmd.Parameters.AddWithValue("@occupation", occupation.Text);

        

        Response.Redirect("Home.aspx");

        cmd.ExecuteNonQuery();
        con.Close();
       
    }

    protected void Email_TextChanged(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select Email from register where Email='" + Email.Text + "'", con);
        cmd.ExecuteScalar();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            btn_submit.Enabled = false;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showContent();", true);

        }
        else
        {
            btn_submit.Enabled = true;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;

public partial class callback : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Learn_IT\Learn_IT\App_Data\learnit_database.mdf;Integrated Security=True");
                                                                                   
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"].ToString());
        int m = Convert.ToInt32(Request.QueryString["day"].ToString());

        DateTime dt = Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy"));

        DateTime newDate = dt.AddDays(Convert.ToDouble(m));

        string mm1 = newDate.ToString("MM/dd/yyyy");



        con.Open();

        SqlCommand cmd = new SqlCommand("Insert into sub_video values(@V_id,@U_email,@sub_date,@Exp_date,@Status)", con);

        cmd.Parameters.AddWithValue("@V_id", id);
        cmd.Parameters.AddWithValue("@U_email", Session["email"].ToString());
        cmd.Parameters.AddWithValue("@sub_date", DateTime.Now.ToString("dd/MM/yyyy"));
        cmd.Parameters.AddWithValue("@Exp_date", mm1);
        cmd.Parameters.AddWithValue("@Status", "1");
        cmd.ExecuteNonQuery();
        con.Close();







        con.Open();
        SqlCommand cmd1 = new SqlCommand("select * from register where  Email='" + Session["email"].ToString() + "' ", con);

        cmd1.ExecuteScalar();
        SqlDataAdapter da = new SqlDataAdapter(cmd1);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();

        string user_email = ds.Tables[0].Rows[0]["Email"].ToString();
        string user_name = ds.Tables[0].Rows[0]["Name"].ToString();



        MailMessage mm = new MailMessage("krishnasandi8565@gmail.com", user_email);
        mm.Subject = "Payment Successfull.";
        mm.Body = "Dear Mr./Mrs." + user_name + "<br /> <br> <img src='http://www.shikharclasses.in/wp-content/uploads/2020/04/PAYMENT-SUCCESS.png' /><br/><br/> Thank You";
  
        mm.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.EnableSsl = true;
        System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
        NetworkCred.UserName = "krishnasandi8565@gmail.com";
        NetworkCred.Password = "Reddy525@";
        smtp.UseDefaultCredentials = true;
        smtp.Credentials = NetworkCred;
        smtp.Port = 587;
        smtp.Send(mm);


    }
}
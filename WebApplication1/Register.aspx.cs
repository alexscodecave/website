using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;

namespace WebApplication1
{
    public partial class Register : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void sendEmail()
        {
            MailMessage mail = new MailMessage("test@gmail.com", txtBoxEmail.Text, "test subject", "test body");
            SmtpClient client = new SmtpClient();
            client.Port = 587;
            client.EnableSsl = true;
            client.Send(mail);
            lblPasswordValidation.Text = "An email has been sent to your email address to confirm your account!";

        }

        private void checkIfEmailExists()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                //open connection
                conn.Open();
                string sqlSelectQuery = "SELECT * FROM tblUsers WHERE email = @email";
                SqlCommand sql = new SqlCommand(sqlSelectQuery, conn);
                sql.Parameters.AddWithValue("@email", txtBoxEmail.Text);
                //use datareader to equal the reading of the sql command entered into sql variable
                SqlDataReader reader = sql.ExecuteReader();
                //if there are rows, meaning there is an email in the database which is equal to what the user has entered
                //into the textbox
                if (reader.HasRows)
                {
                    lblPasswordAgainValidation.Text = "Apologies but that email is already taken";
                    
                } 
                else //if email is not taken
                {
                    if (txtBoxPassword.Text == txtBoxRepeatPassword.Text) //if password field is equal to repeat password field
                    {
                        lblEmailAddressValidation.Text = "Email address available";
                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            //open connection
                            connection.Open();

                            //using command release objects resources after completion
                            using (SqlCommand cmd = new SqlCommand("INSERT INTO tblUsers values(@email, @password)", connection))
                            {
                                cmd.Parameters.AddWithValue("email", txtBoxEmail.Text);
                                cmd.Parameters.AddWithValue("password", txtBoxPassword.Text);
                                cmd.ExecuteNonQuery();
                                connection.Close();
                                lblPasswordAgainValidation.Text = "Registration successful!";
                            }
                        }
                        lblEmailAddressValidation.Text = "";
                    }
                    else
                    {
                        lblPasswordAgainValidation.Text = "Passwords are different. Please ensure both password fields are the same values";
                    }
                    
                }

                conn.Close();


            }
        }


        private void insertIntoDatabase()
        {



        }

        protected void btnSignUp_Click1(object sender, EventArgs e)
        {
            checkIfEmailExists();


        }
    }
}
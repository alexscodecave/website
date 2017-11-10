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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       
        
        
        private void SignUpUser()
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


        private void insertIntoDatabase()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            //reference connection string from specific file
            using (SqlConnection con = new SqlConnection(connectionString))
            {

                SqlCommand selectCommand = new SqlCommand();
                //sql command to check 
                selectCommand.CommandText = "SELECT 1 from tblUsers WHERE email=@email";
                selectCommand.Parameters.AddWithValue("@email", txtBoxEmail.Text);
                selectCommand.Connection = con;

                //open connection
                con.Open();
                SqlDataReader sqlDataReader = selectCommand.ExecuteReader();

                //need to check if email already exists
                if (sqlDataReader.HasRows)
                {
                    //if email exists give user an indication by setting the text of the label
                    lblEmailAddressValidation.Text = "Sorry but that email alreay exists";
                    //close the sql data reader
                    sqlDataReader.Close();
                }

                else //if email does not exist in database
                {
                    if (sqlDataReader.IsClosed) //if sqlDataReader is closed
                    {
                        //perform a using statement to dispose of the command, then insert the values into the database
                        //RESEARCH needed for encrpytion and hashing password
                        using (SqlCommand sqlCmd = new SqlCommand("INSERT INTO tblUsers values(@email,@password)", con))
                        {
                            sqlCmd.Parameters.AddWithValue("email", txtBoxEmail.Text);
                            sqlCmd.Parameters.AddWithValue("password", txtBoxPassword.Text);
                            sqlCmd.ExecuteNonQuery();

                            con.Close();
                        }
                    }
                }


            }
        }

        protected void btnSignUp_Click1(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtBoxEmail.Text))
            {
                lblEmailAddressValidation.Text = "Please enter an email address";
            }
            if (!txtBoxEmail.Text.Contains("@"))
            {
                lblEmailAddressValidation.Text = "Please enter a valid email address with the @ symbol included";
            }

            else
            {
                if (txtBoxPassword.Text == txtBoxRepeatPassword.Text)
                {
                    insertIntoDatabase();
                    
                }
                else
                {
                    lblPasswordAgainValidation.Text = "Please ensure your passwords match";
                }

            }

        }
    }
}
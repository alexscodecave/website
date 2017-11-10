using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace WebApplication1
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        static string Encrypt(string value)
        {
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                UTF8Encoding utf8 = new UTF8Encoding();
                byte[] data = md5.ComputeHash(utf8.GetBytes(value));
                return Convert.ToBase64String(data);
            }
        }

        private void SignUpUser()
        {
            string connectionString = "Data Source=DESKTOP-MI79Q6G\\SQLEXPRESS;Initial Catalog=horrornovies;Integrated Security=True";


        }


        private void insertIntoDatabase()
        {
            string connectionString = "Data Source=DESKTOP-MI79Q6G\\SQLEXPRESS;Initial Catalog=horrornovies;Integrated Security=True";
            //reference connection string from specific file
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                //open connection
                con.Open();

                using (SqlCommand sqlCmd = new SqlCommand("INSERT INTO tblUsers values(@email,@password)", con))
                {
                    sqlCmd.Parameters.AddWithValue("email", txtBoxEmail.Text);
                    sqlCmd.Parameters.AddWithValue("password", txtBoxPassword.Text);
                    sqlCmd.ExecuteNonQuery();
                    con.Close();
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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            checkDBCredentials();
        }


        private void checkDBCredentials()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection sqlConnection = new SqlConnection(connectionString))
            {
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.CommandText = "SELECT * FROM tblUsers WHERE email=@email AND password=@password";
                sqlCommand.Parameters.AddWithValue("@email", txtBoxLoginEmail.Text);
                sqlCommand.Parameters.AddWithValue("@password", txtBoxLoginPassword.Text);
                sqlCommand.Connection = sqlConnection;

                //open connection
                sqlConnection.Open();
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                if (sqlDataReader.Read())
                {
                    //create a session object equal to the email user entered into the textbox
                    Session["user"] = txtBoxLoginEmail.Text;
                    //redirect user to UserProfile page
                    Response.Redirect("UserProfile.aspx");
                    
                }
                else
                {
                    lblLoginValidation.Text = "Either the username or password is incorrect";
                }
                sqlConnection.Close();
            }
        }
    }
}
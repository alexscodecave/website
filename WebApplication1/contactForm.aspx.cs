using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;


namespace WebApplication1
{
    public partial class contactForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void btnSendEmail_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtBoxName.Text))
            {
                lblUserName.Text = "Please enter your name";
                changeToRed(txtBoxName, "changeToRed");
            }
            else
            {
                changeToGreen(txtBoxName, "changeToGreen");
                lblUserName.Text = "";
            }
            if (string.IsNullOrEmpty(txtBoxEmail.Text))
            {
                lblUserEmail.Text = "Please enter your email";
                changeToRed(txtBoxEmail, "changeToRed");
            }

            //else if text box does not contain an @ symbol
            else if (!txtBoxEmail.Text.Contains("@"))
            {
                lblUserEmail.Text = "Please enter a valid email address";
                changeToRed(txtBoxEmail, "changeToRed");
            }
            else{
                changeToGreen(txtBoxName, "changeToGreen");
                lblUserEmail.Text = "";
            }
            if (string.IsNullOrEmpty(txtBoxQuery.Text))
            {
                lblUserQuery.Text = "Please enter a valid query";
                changeToRed(txtBoxQuery, "changeToRed");

            }
            else
            {
                changeToGreen(txtBoxName, "changeToGreen");
                lblUserQuery.Text = "";
            }
        }

        private void changeToRed(TextBox txtBoxContact, string toRed)
        {
            txtBoxContact.CssClass = toRed;

        }

        private void changeToGreen(TextBox txtBoxContact, string toGreen)
        {
            txtBoxContact.CssClass = toGreen;

        }

        private void clearlblText()
        {
            lblUserName.Text = "";
            lblUserEmail.Text = "";
            lblUserQuery.Text = "";
        }


        private void sendEmail()
        {
            MailMessage email = new MailMessage();
            SmtpClient smtpServer = new SmtpClient("smtp.gmail.com");
            email.From = new MailAddress("testaddress@gmail.com");
            smtpServer.Send(email);
            

        }

       
    }
}
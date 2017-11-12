using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;
using System.Configuration;

namespace WebApplication1
{
    public partial class AddAMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ispostback sends info to web server
            //an asp control will cause this such as
            //a button click
            //but can detect whether page is 
            //being loaded for first time or is getting
            //generated due to a postback
            if (!IsPostBack)
            {
                lblImgSuccess.Visible = false;
                loadImages();

            }

        }

        private void loadImages()
        {
            //connection string
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            //Create sqlconnection with the connection string as the parameter
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                //Create Sqlcommand with first parameter being the query, the second parameter
                //is the connection string the query goes to
                SqlCommand cmd = new SqlCommand("Select * FROM tblHorrorFilms", con);
                //open connection
                con.Open();
                //SqlDataReader is used to retrieve data
                SqlDataReader rdr = cmd.ExecuteReader();
                //set data source of grid view equal to sqldatareader
                GridView1.DataSource = rdr;
                //bind the data to the grid view data source
                GridView1.DataBind();
                //close the sqldatareader
                rdr.Close();
            }

        }

        protected void btnAddMovie_Click(object sender, EventArgs e)
        {

            //gets posted file from file upload control
            HttpPostedFile postedFile = imgUpload.PostedFile;

            //fileName gets the file name of the file uploaded using the fileUpload
            string fileName = Path.GetFileName(postedFile.FileName);
            //fileExtension gets the file extension of the file uploaded using the fileUpload
            string fileExtension = Path.GetExtension(fileName);
            //fileSize gets the length of the uploaded file
            int fileSize = postedFile.ContentLength;

            //if string is null or empty set the text of the empty to a validation message
            //run method 'changeToRed'
            if (string.IsNullOrEmpty(txtMovieName.Text))
            {
                lblAddMovieName.Text = "Please enter a movie name";
                changeToRed(txtMovieName, "changeToRed");
            }
            if (string.IsNullOrEmpty(txtBoxAgeRating.Text))
            {
                lblAddMovieRating.Text = "Please enter an age rating";
                changeToRed(txtBoxAgeRating, "changeToRed");
            }
            if (string.IsNullOrEmpty(txtBoxMovieDescription.Text))
            {
                lblAddMovieDescription.Text = "Please enter a description";
                changeToRed(txtBoxMovieDescription, "changeToRed");
            }

            else
            {

                //function to clear the validation labels
                clearLabels();

                //if image extension is equal to any of the below files
                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".bmp" ||
                    fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png")
                {
                    //Create stream of the uploaded file
                    Stream stream = postedFile.InputStream;
                    //read the binary data of the stream
                    BinaryReader binaryReader = new BinaryReader(stream);

                    //put the bytes into an array and convert the bytes to ints
                    byte[] bytes = binaryReader.ReadBytes((int)stream.Length);


                    //string containing the connection string
                    //string connectionString = "Data Source=DESKTOP-MI79Q6G\\SQLEXPRESS;Initial Catalog=horrornovies;Integrated Security=True";
                    string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

                    //using statement is used to to work with an object that implements the IDisposable interface
                    //which has a method called Dispose which disposes of the method
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {

                        //open connection
                        connection.Open();

                        //SQLCommand object contains an sql statement with @name etc acting as the columns to insert into
                        using (SqlCommand cmd = new SqlCommand("INSERT INTO tblHorrorFilms values(@name,@agerating,@description,@type,@image)", connection))
                        {
                            //name in quotation marks represents column name, txtMovieName.Text is value that will be
                            //inserted into database
                            cmd.Parameters.AddWithValue("name", txtMovieName.Text);
                            cmd.Parameters.AddWithValue("agerating", txtBoxAgeRating.Text);
                            cmd.Parameters.AddWithValue("description", txtBoxMovieDescription.Text);
                            cmd.Parameters.AddWithValue("type", rbMovieType.SelectedValue);
                            cmd.Parameters.AddWithValue("image", bytes);

                            //use ExecuteNonQuery if an sql statement needs to be run but no rows are supposed to be returned
                            cmd.ExecuteNonQuery();
                            connection.Close();

                        }
                        
                    }
                }
            }

        }

        private void changeToRed(TextBox txtBoxContact, string toRed)
        {
            txtBoxContact.CssClass = toRed;

        }

        //first parameter equal to a textbox instance
        //second parameter equal to a string instance
        private void changeToGreen(TextBox txtBoxContact, string toGreen)
        {
            //set the css class of the textbox equal to the string value of the second parameter

            txtBoxContact.CssClass = toGreen;
        }

        private void clearLabels()
        {
            //set labels text to empty
            lblAddMovieName.Text = "";
            lblAddMovieRating.Text = "";
            lblAddMovieDescription.Text = "";
            lblAddMovieType.Text = "";
            //replace the movie name class with an empty class when the text boxes are not empty
            txtMovieName.CssClass = txtMovieName.CssClass.Replace("changeToRed", "");
            txtBoxAgeRating.CssClass = txtBoxAgeRating.CssClass.Replace("changeToRed", "");
            txtBoxMovieDescription.CssClass = txtBoxMovieDescription.CssClass.Replace("changeToRed", "");
        }

        protected void gridViewDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }

}
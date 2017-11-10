<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link rel="stylesheet" href="main.css" />

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="Home.aspx">Horror Movies</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="Home.aspx">Home</a></li>
                    <li><a href="AddAMovie.aspx">Add a film</a></li>
                    <li><a href="showfilms.aspx">Show films</a></li>
                    <li><a href="Register.aspx">Register</a></li>
                    <li><a href="contactForm.aspx">Contact Us</a></li>
                </ul>
                
            </div>
        </nav>


        <div class="container">

            <!-- Border Heading -->


            <!--div containing 3 horror films-->

            <div class="row">
                <div class="col-md-4">
                    <img src="chucky.jpg" width="170" height="170" />
                </div>
                <div class="col-md-4">
                    <img src="evildead.jpg" width="170" height="170" />
                </div>
                <div class="col-md-4">
                    <img src="jason.jpg" width="170" height="170" />
                </div>

                <div class="row homepageChoice" style="width:100%;">
                    <div class="col-md-4" style="">
                        <ul>

                            <li><a href="#">Discover new  horror films</a></li>
                        </ul>
                        
                    </div>
                    <div class="col-md-4" style="text-align:center;height:70px;">
                        <a href="#" class="">DVDs on sale</a>
                    </div>

                    <div class="col-md-4" style="text-align:center;height:70px;">
                        <a href="#" class="">Login</a>
                    </div>



                </div>

            </div>


            <div class="homeFooter">
                <div class="row">
                    <div class="col-md-4">Alex </div>
                    <div class="col-md-4">Copyright</div>
                    <div class="col-md-4">2017</div>
                </div>
            </div>
    </form>

    <script src="style.js"></script>
</body>
</html>

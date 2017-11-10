<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contactForm.aspx.cs" Inherits="WebApplication1.contactForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
   <link rel="stylesheet" href="main.css" />
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
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

        <div class="container center_div">
            <div class="row">
                <label for="Name">Name:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtBoxName" TextMode="Email">

                </asp:TextBox>
                <asp:Label runat="server" ID="lblUserName" />

                <label for="Email">Email</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtBoxEmail" TextMode="Password">

                </asp:TextBox>
                <asp:Label runat="server" ID="lblUserEmail" />

                <label for="Query">Query:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtBoxQuery" TextMode="MultiLine">

                </asp:TextBox>

                <asp:Label runat="server" ID="lblUserQuery" />

                <asp:Button runat="server" CssClass="btn btn-default" Text="Submit"  />

            </div>
        </div>

    </form>
</body>
</html>

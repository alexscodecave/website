<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
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
                    <li ><a href="Home.aspx">Home</a></li>
                    <li><a href="AddAMovie.aspx">Add a film</a></li>
                    <li><a href="showfilms.aspx">Show films</a></li>
                    <li><a href="Register.aspx">Register</a></li>
                    <li class="active"><a href="Login.aspx">Login</a></li>
                    <li><a href="contactForm.aspx">Contact Us</a></li>
                </ul>

            </div>
        </nav>

        <div class="container-fluid">
            <div class="form-group">
                <asp:Label runat="server">Email address:</asp:Label>
                <asp:TextBox runat="server" class="form-control" ID="txtBoxLoginEmail"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server">Password:</asp:Label>
                <asp:TextBox runat="server" class="form-control" ID="txtBoxLoginPassword" TextMode="Password"></asp:TextBox>
            </div>
            <asp:Button runat="server" class="btn btn-default" ID="btnLogin" Text="Submit" OnClick="btnLogin_Click" />
            <asp:Label runat="server" ID="lblLoginValidation" />
        </div>

        <div>
        </div>
    </form>
</body>
</html>

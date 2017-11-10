<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showfilms.aspx.cs" Inherits="WebApplication1.showfilms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Horror films available</title>
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
                    <li><a href="contactForm.aspx">Contact Us</a></li>
                </ul>

            </div>
            <div class="input-group">
                <input type="text" class="form-control" style="width: 30%:" placeholder="Search for films" />
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-default">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </span>
            </div>
        </nav>

    </form>
</body>
</html>

﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link rel="stylesheet" href="main.css" />
    <link rel="stylesheet" href="Content/bootstrap.min.css" />

    <script type="text/javascript">

        function checkPassword() {
            var passwordTextBox = document.getElementById("txtBoxPassword");
            var password = passwordTextBox.value;
            var specialCharacters = "!£$%^&*_@#~?";
            var passwordScore = 0;

            for (var i = 0; i < password.length; i++) {
                if (specialCharacters.indexOf(password.charAt(i)) > - 1) {
                    passwordScore += 20;
                }
            }

            if (/[a-z]/.test(password)) {
                passwordScore += 20;
            }

            if (/[A-Z]/.test(password)) {
                passwordScore += 20;
            }
            if (/[\d]/.test(password)) {
                passwordScore += 20;
            }

            if (password.length >= 8) {
                passwordScore += 20;
            }

            var strength = "";
            var backgroundColor = "";

            if (passwordScore >= 100) {
                strength = "Strong";
                backgroundColor = "green";
            }
            else if (password >= 80) {
                strength = "Medium";
                backgroundColor = "gray";
            }
            else if (password >= 60) {
                strength = "Weak";
                backgroundColor = "maroon";
            }
            else {
                strength = "Very Weak";
                backgroundColor = "red";
            }
            document.getElementById("lblPasswordValidation").innerHTML = strength;
            
            passwordTextBox.style.backgroundColor = backgroundColor;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="Home.aspx">Horror Movies</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="Home.aspx">Home</a></li>
                    <li><a href="AddAMovie.aspx">Add a film</a></li>
                    <li><a href="showfilms.aspx">Show films</a></li>
                    <li class="active"><a href="Register.aspx">Register</a></li>
                    <li><a href="Login.aspx">Login</a></li>
                    <li><a href="contactForm.aspx">Contact Us</a></li>
                </ul>

            </div>
        </nav>
        <div class="pageContainer">

            <div class="form-group">
                <asp:Label runat="server" for="email">Email address:</asp:Label>
                <asp:TextBox runat="server"  CssClass="form-control"  ID="txtBoxEmail" TextMode="Email">

                </asp:TextBox>

                <asp:Label runat="server" ID="lblEmailAddressValidation" />

                <asp:Label runat="server" for="password">Password:</asp:Label>
                <asp:TextBox runat="server" onkeyup="checkPassword()" CssClass="form-control" ID="txtBoxPassword" TextMode="Password">

                </asp:TextBox>

                <asp:Label runat="server" ID="lblPasswordValidation" />

                <label for="repeatpassword">Repeat password</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtBoxRepeatPassword" TextMode="Password">

                </asp:TextBox>

                <asp:Label runat="server" ID="lblPasswordAgainValidation" />

                <asp:Button runat="server" CssClass="btn btn-default" Text="Submit" ID="btnSignUp" OnClick="btnSignUp_Click1" />

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
</body>
</html>

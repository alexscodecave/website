<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAMovie.aspx.cs" Inherits="WebApplication1.AddAMovie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add a movie</title>


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="main.css" />

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

        <div>
            <table class="auto-style1">
                <tr>
                    <td>Movie Name :</td>
                    <td>
                        <asp:TextBox ID="txtMovieName" CssClass="form-control" runat="server">

                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label runat="server" ID="lblAddMovieName" />
                    </td>
                </tr>

                <tr>
                    <td>Movie Age Rating :</td>
                    <td>
                        <asp:TextBox ID="txtBoxAgeRating" CssClass="form-control" runat="server">

                        </asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label runat="server" ID="lblAddMovieRating" />
                    </td>
                </tr>

                <tr>
                    <td>Movie Description</td>
                    <td>
                        <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ID="txtBoxMovieDescription" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label runat="server" ID="lblAddMovieDescription" />
                    </td>
                </tr>

                <tr>
                    <td>Horror Movie Type</td>
                    <td>
                        <asp:RadioButtonList ID="rbMovieType" runat="server">
                            <asp:ListItem>Slasher</asp:ListItem>
                            <asp:ListItem>Psychological</asp:ListItem>
                            <asp:ListItem>Gory</asp:ListItem>
                            <asp:ListItem>Torture</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:Label runat="server" ID="lblAddMovieType" />
                    </td>
                </tr>

                <tr>
                    <td>Select Image
                    </td>
                    <td>
                        <asp:FileUpload runat="server" ID="imgUpload" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label runat="server" ID="lblImgSuccess" /></td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Image runat="server" ID="imgDisplay" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnAddMovie" runat="server" Text="Submit" CssClass="btn btn-default" OnClick="btnAddMovie_Click" />
                    </td>
                </tr>
            </table>
        </div>

        <asp:GridView ID="GridView1" 
            runat="server" 
            AutoGenerateColumns="false" 
            GridLines="None"
            CssClass="mGrid"
            PagerStyle-CssClass="pgr"
            >
   
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Name" />
                <asp:BoundField DataField="agerating" HeaderText="Rating" />
                <asp:BoundField DataField="type" HeaderText="Type" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="imgOne" runat="server" Height="100px" Width="100px" ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("image")) %>' />

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

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

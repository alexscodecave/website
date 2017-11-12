<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAMovie.aspx.cs" Inherits="WebApplication1.AddAMovie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add a movie</title>

    <script type="text/javascript">
        
    </script>
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
                    <li><a href="Home.aspx">Home</a></li>
                    <li class="active"><a href="AddAMovie.aspx">Add a film</a></li>
                    <li><a href="showfilms.aspx">Show films</a></li>
                    <li><a href="Register.aspx">Register</a></li>
                    <li><a href="contactForm.aspx">Contact Us</a></li>
                </ul>
            </div>
        </nav>

        <div>
            <table class="tblAddMovie">
                <tr>
                    <td style="margin-top:10px;">Movie Name :</td>
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
                    <td style="margin-top:10px;">
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
                    <td style="padding-bottom:10px;">
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
            PagerStyle-CssClass="pgr" OnRowDataBound="gridViewDataBound"
            >
   
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Name" HeaderStyle-BackColor="#FFB07F" />
                <asp:BoundField DataField="agerating" HeaderText="Rating" HeaderStyle-BackColor="#FFB07F"  />
                <asp:BoundField DataField="type" HeaderText="Type" HeaderStyle-BackColor="#FFB07F" />
                <asp:BoundField DataField="Description" HeaderText="Description" HeaderStyle-BackColor="#FFB07F" />
                <asp:TemplateField HeaderText="Image" HeaderStyle-BackColor="#FFB07F">
                    <ItemTemplate>
                        <asp:Image ID="imgOne" runat="server" Height="100px" Width="100px" ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("image")) %>'  />

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </form>
</body>
</html>

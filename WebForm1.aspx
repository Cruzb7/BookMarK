<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="WebApplication2.WebForm1" aspcompat=true %>

<!DOCTYPE html>
<html lang="en">
  
<head runat="server">
    <title>Book MarK</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="StyleSheets.css">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="StyleSheets.css">

    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="StyleSheets.css">

</head>
<body>
    <form id="form2" runat="server">
    <script>
        // Get the modal
        var modal = document.getElementById('id01');

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>


    <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>

    <div id="id01" class="modal">

        <form class="modal-content animate" action="/action_page.php">
            <div class="imgcontainer">
                <span onclick="document.getElementById('id01').style.display='none'" class="close"
                    title="Close Modal">&times;</span>
            </div>

            <div class="container">
                <label for="uname"><b>Username</b></label>
                <input type="text" placeholder="Enter Username" name="uname" required>

                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="psw" required>

                <button type="submit">Login</button>
                <label>
                    <input type="checkbox" checked="checked" name="remember"> Remember me
                </label>
            </div>

            <div class="container" style="background-color:#f1f1f1">
                <button type="button" onclick="document.getElementById('id01').style.display='none'"
                    class="cancelbtn">Cancel</button>
                <span class="psw">Need an account? <a href="signUp.html">Sign Up.</a></span>
            </div>
        </form>
    </div>
    <div class="topnav">
        <a href="mainPage.html">Home</a>
        <a href="about.html">About</a>
        <a href="contact.html">Contact</a>
        <div class="search-container">
            <form action="/action_page.php">
                <input type="text" placeholder="Search.." name="search">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
    </div>

    <div style="padding-left:0px">

    <header>
        <h1>Books for Sale</h1>
    </header>

    <section>
        <nav>
            <ul>
                <h1>Search Books by College</h1>
                <li><a href="#">Arts and Sciences</a></li>
                <li><a href="#">Business Administration</a></li>
                <li><a href="#">Communication</a></li>
                <li><a href="#">Education</a></li>
                <li><a href="#">Engineering</a></li>
                <li><a href="#">Health Sciences</a></li>
                <li><a href="#">Nursing</a></li>
            </ul>
        </nav>

        <article>
             <%
                 Dim conn, rs
                 conn = Server.CreateObject("ADODB.Connection")
                 conn.Provider = "Microsoft.Jet.OLEDB.4.0"
                 conn.Open("C:\Users\Benjamin\Documents\Junior year\Spring\Software Methods\BookMarK-master\BookMarK-master\bookMarK_dataBase.mdb")

                 rs = Server.CreateObject("ADODB.recordset")
                 rs.Open("bookListings", conn)
    %> 
            <table border="1" width="100%">
  <tr>
  <%for each x In rs.Fields
        response.write("<th>" & x.name & "</th>")
    Next%>
  </tr>
  <%do until rs.EOF%>
    <tr>
    <%          For Each x In rs.Fields%>
      <td><%Response.Write(x.value)%></td>
    <%          Next
    rs.MoveNext%>
    </tr>
  <%        Loop
    rs.close
    conn.close
  %>
</table>

        </article>
    </section>

    <footer>
        <p><a href="sellPage.html">Click Here to Sell Your Books!</a></p>
    </footer>
        </form>
</body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="img/favicon.ico">

        <title>Edit Customer</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/login.css" rel="stylesheet">
        <link href="css/index.css" rel="stylesheet">


    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="index.htm" class="navbar-brand">Smolka Dots</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.htm">Logout</a></li>
                        <li><a href="help.jsp">Help</a></li>
                    </ul>
                </div>
            </div>
        </nav>   

        <div class="container">
            <form name="myForm" action="editcustomer.jsp" method="post" class="form-signin">
                <h2 class="form-signin-heading">Edit Customer</h2>
                <%
                    String ssn = request.getParameter("ssn");
                    String mysJDBCDriver = "com.mysql.jdbc.Driver";
                    String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/yromero";
                    String mysUserID = "yromero";
                    String mysPassword = "109210768";

                    if (ssn != null) {
                        if (ssn.trim().equals("")) {
                %>
                <script type="text/javascript">
                    function goBack() {
                        history.go(-1);
                    }
                    window.onload = goBack();
                </script>   
                <%
                } else {
                    java.sql.Connection conn = null;
                    try {
                        Class.forName(mysJDBCDriver).newInstance();
                        java.util.Properties sysprops = System.getProperties();
                        sysprops.put("user", mysUserID);
                        sysprops.put("password", mysPassword);

                        //connect to the database
                        conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
                        System.out.println("Connected successfully to database using JConnect");

                        conn.setAutoCommit(false);
                        java.sql.Statement stmt1 = conn.createStatement();
                        java.sql.ResultSet rs = stmt1.executeQuery("SELECT * FROM Customer C, Person P WHERE P.SSN = C.CustomerSSN AND C.CustomerSSN='" + ssn + "'");

                        if (rs.next()) {

                %> 

                <input id="ssn" name = "ssn" class="form-control" placeholder="Social Security #" value= "<%=rs.getString(1)%>" readonly>
                <input id="customerid" name="customerid" class="form-control" placeholder="CustomerID" value= "<%=rs.getString(2)%>" readonly>
                <input name = "firstname" id="firstname" class="form-control" placeholder="First Name" value= "<%=rs.getString(8)%>" required>
                <input name="lastname" id="lastName" class="form-control" placeholder="Last Name" value= "<%=rs.getString(7)%>" required>
                <input name="address" id="address" class="form-control" placeholder="Address" value="<%=rs.getString(9)%>" required>
                <input name="city" id="city" class="form-control" placeholder="City" value="<%=rs.getString(10)%>" required>
                <input name="state" id="state" class="form-control" placeholder="State" value="<%=rs.getString(11)%>" required>
                <input name="zipcode" id="zipcode" class="form-control" placeholder="Zip Code" value="<%=rs.getString(12)%>" required>
                <input name="telephone" id="telephone" class="form-control" placeholder="Telephone #" value="<%=rs.getString(13)%>" required>
                <input name="emailaddress" id="emailaddress" class="form-control" placeholder="Email Address" value="<%=rs.getString(14)%>" required>
                <input name="creditcard" id="creditcard" class="form-control" placeholder="Credit Card #" value="<%=rs.getString(3)%>" required>
                <input name="rating" id="rating" class="form-control" placeholder="Rating" value="<%=rs.getString(4)%>" required>
                <input type="password" name="password" id="password" class="form-control" placeholder="Password" value= "<%=rs.getString(5)%>" required>
                <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="return javascript:myForm.submit();">Submit</button>
                <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                try {
                                    conn.close();
                                } catch (Exception ee) {
                                };
                            }
                        }
                    }
                %>
            </form>
        </div> <!-- /container -->
    </body>
</html>
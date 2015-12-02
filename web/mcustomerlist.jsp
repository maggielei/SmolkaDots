<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="img/favicon.ico">

        <title>Customers Listing</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/dashboard.css" rel="stylesheet">
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
                    <a class="navbar-brand">Smolka Dots | Manager View</a>
                </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li><a href="managerdashboard.jsp">Employees</a></li>
                        <li class="active"><a href="#">Customers<span class="sr-only">(current)</span></a></li>
                        <li><a href="mitemlist.jsp">Items</a></li>
                        <li><a href="msaleslist.jsp">Sales Report</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

                    <!--LOAD CUSTOMER INFO INTO TABLES-->
                    <h3 class="sub-header">Customers</h3><br>
                    <button type="button" class="btn btn-default btn-primary" onclick="showAddUserForm()">
                        <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>&nbsp;Add
                    </button>
                    <button type="button" class="btn btn-default btn-primary" onclick="showDeleteUserForm()">
                        <span class="glyphicon glyphicon-minus-sign" aria-hidden="true"></span>&nbsp;Delete
                    </button>
                    <button type="button" class="btn btn-default btn-primary">
                        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>&nbsp;Edit
                    </button>

                    <!--ADD CUSTOMER FORM-->
                    <div class="addUserForm">
                        <form class="form-inline" name="userform" action="addnewuser.jsp" method="post">
                            <label for="inputSSN" class="sr-only">Customer SSN</label>
                            <input type="custssn" name="custssn" id="custssn" class="form-control" placeholder="Social Security #" required>

                            <label for="inputId" class="sr-only">Customer ID</label>
                            <input type="custid" name="custid" id="custid" class="form-control" placeholder="CustomerID" required>

                            <label for="inputFirstName" class="sr-only">First Name</label>
                            <input type="firstName" name="custfirstname" id="firstName" class="form-control" placeholder="First Name" required>

                            <label for="inputLastName" class="sr-only">Last Name</label>
                            <input type="lastName" name="custlastname" id="lastName" class="form-control" placeholder="Last Name" required>

                            <label for="inputAddress" class="sr-only">Address</label>
                            <input type="address" name="custaddress" id="address" class="form-control" placeholder="Address" required>

                            <label for="inputCity" class="sr-only">City</label>
                            <input type="city" name="custcity" id="city" class="form-control" placeholder="City" required>

                            <label for="inputState" class="sr-only">State</label>
                            <input type="state" name="custstate" id="state" class="form-control" placeholder="State" required>

                            <label for="inputZip" class="sr-only">Zip Code</label>
                            <input type="custzipCode" name="custzipcode" id="custzipCode" class="form-control" placeholder="Zip Code" required>

                            <label for="inputTelephone" class="sr-only">Telephone</label>
                            <input type="telephone" name="custtelephone" id="telephone" class="form-control" placeholder="Telephone #" required>

                            <label for="inputZip" class="sr-only">Credit Card</label>
                            <input type="creditCard" name="creditcard" id="creditCard" class="form-control" placeholder="Credit Card #" required>

                            <label for="inputEmail" class="sr-only">Email Address</label>
                            <input type="emailAddress" name="custemail" id="emailAddress" class="form-control" placeholder="Email Address" required>

                            <label for="inputPassword" class="sr-only">Password</label>
                            <input type="password" name="custpassword" id="password" class="form-control" placeholder="Password" required>
                            
                            <label for="inputPosition" class="sr-only">Position</label>
                            <input type="position" name="position" id="position" class="form-control" value="Customer" readonly>

                            <button type="button" class="btn btn-default btn-primary" type="submit" onclick="return document.userform.submit();">
                                <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>&nbsp;Add
                            </button>
                            <button type="button" class="btn btn-default btn-primary" onclick="hideAddUserForm()">
                                <span class="glyphicon glyphicon-minus-sign" aria-hidden="true"></span>&nbsp;Hide
                            </button>
                        </form>
                    </div>
                    <!--END ADD USER FORM-->
                    <!--START DELETE USER FORM-->
                    <div class="deleteUserForm">
                        <form class="form-inline" name="deleteUserForm" action="deleteuser.jsp" method="post">
                            <label for="inputSSN" class="sr-only">SSN</label>
                            <input id="ssn" name = "ssn" class="form-control" placeholder="Social Security #" required>

                            <label for="inputPosition" class="sr-only">Position</label>
                            <input type="position" name="position" id="position" class="form-control" value="Customer" readonly>
                            
                            <button type="button" class="btn btn-default btn-primary" onclick="return document.deleteUserForm.submit();">
                                <span class="glyphicon glyphicon-minus-sign" aria-hidden="true"></span>&nbsp;Delete
                            </button>
                            
                            <button type="button" class="btn btn-default btn-primary" onclick="hideDeleteUserForm()">
                                <span class="glyphicon glyphicon-minus-sign" aria-hidden="true"></span>&nbsp;Hide
                            </button>
                        </form>
                    </div>
                    <!--END DELETE USER FORM-->
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <!--11 COLUMNS-->
                                    <!--ROWS NEED TO BE FILLED IN USING JAVA CODE-->
                                    <th>SSN</th>
                                    <th>CustomerID</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Address</th>
                                    <th>City</th>
                                    <th>State</th>
                                    <th>Zip Code</th>
                                    <th>Telephone</th>
                                    <th>Email</th>
                                    <th>Credit Card #</th>
                                    <th>Rating</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    String mysJDBCDriver = "com.mysql.jdbc.Driver";
                                    String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/yromero";
                                    String mysUserID = "yromero";
                                    String mysPassword = "109210768";

                                    java.sql.Connection conn = null;

                                    try {
                                        Class.forName(mysJDBCDriver).newInstance();
                                        java.util.Properties sysprops = System.getProperties();
                                        sysprops.put("user", mysUserID);
                                        sysprops.put("password", mysPassword);

                                        //connect to the database
                                        conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
                                        System.out.println("Connected successfully to database using JConnect");

                                        Statement statement = conn.createStatement();
                                        ResultSet resultset = statement.executeQuery("SELECT P.SSN, C.CustomerID, P.FirstName, P.LastName, P.Address, P.City, P.State, P.ZipCode, P.Telephone, P.Email, C.CreditCardNum, C.Rating FROM Person P, Customer C WHERE P.SSN = C.CustomerSSN");

                                        while (resultset.next()) {
                                %>
                                <tr>
                                    <td><%=resultset.getString(1)%></td>
                                    <td><%=resultset.getString(2)%></td>
                                    <td><%=resultset.getString(3)%></td>
                                    <td><%=resultset.getString(4)%></td>
                                    <td><%=resultset.getString(5)%></td>
                                    <td><%=resultset.getString(6)%></td>
                                    <td><%=resultset.getString(7)%></td>
                                    <td><%=resultset.getString(8)%></td>
                                    <td><%=resultset.getString(9)%></td>
                                    <td><%=resultset.getString(10)%></td>
                                    <td><%=resultset.getString(11)%></td>
                                    <td><%=resultset.getString(12)%></td>  
                                </tr>
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                        out.print(e.toString());
                                    } finally {
                                        try {
                                            conn.close();
                                        } catch (Exception ee) {
                                            {
                                            };
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>

                    <h3 class="sub-header">Revenue Generated</h3><br>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>CustomerId</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Revenue Generated</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1,001</td>
                                    <td>Lorem</td>
                                    <td>ipsum</td>
                                    <td>dolor</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/sharedFunctionality.js"></script>
    </body>
</html>

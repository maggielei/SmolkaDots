<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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

        <title>Employee Listing</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/dashboard.css" rel="stylesheet">
        <link href="css/index.css" rel="stylesheet">
        <script language="javascript" type="text/javascript">
        </script>
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
                    <a class="navbar-brand">Smolka Dots | Customer Representative View</a>
                </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li><a href="custrepdashboard.jsp">Customers</a></li>
                        <li class="active"><a>Employees<span class="sr-only">(current)</span></a></li>
                        <li><a href="custrepitems.jsp">Items</a></li>
                        <li><a href="custrepsuggestions.jsp">Item Suggestions</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

                    <!--LOAD EMPLOYEE AND CUSTOMER INFO INTO TABLES-->
                    <h3 class="sub-header">Employees</h3><br>
               
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <!--11 COLUMNS-->
                                <!--ROWS NEED TO BE FILLED IN USING JAVA CODE-->
                                <th>SSN</th>
                                <th>UserID</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Address</th>
                                <th>City</th>
                                <th>State</th>
                                <th>Zip Code</th>
                                <th>Telephone</th>
                                <th>Email</th>
                                <th>Start Date</th>
                                <th>Level</th>
                                <th>Position</th>
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
                                    ResultSet resultset = statement.executeQuery("SELECT P.SSN, E.UserID, P.FirstName, P.LastName, P.Address, P.City, P.State, P.ZipCode, P.Telephone, P.Email, E.StartDate, E.HourlyRate, E.Level, E.Position FROM Person P, Employee E WHERE P.SSN = E.EmployeeID");

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
                                <td><%=resultset.getString(12)%></td>
                                <td><%=resultset.getString(13)%></td>
                                <td><%=resultset.getString(14)%></td>
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

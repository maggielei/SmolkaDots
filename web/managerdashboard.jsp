<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%              
                String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
		String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/malei"; 
		String mysUserID = "malei"; 
		String mysPassword = "108790364";
                
                java.sql.Connection conn = null;
                Class.forName(mysJDBCDriver).newInstance();
                java.util.Properties sysprops = System.getProperties();
                sysprops.put("user", mysUserID);
                sysprops.put("password", mysPassword);

                //connect to the database
                conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
                System.out.println("Connected successfully to database using JConnect");

                Statement statement = conn.createStatement() ;
                ResultSet resultset = statement.executeQuery("SELECT * FROM person WHERE SSN = '24685173'");
                while(resultset.next()){
                    System.out.println(resultset.getString(1));
                    System.out.println(resultset.getString(2));
                    System.out.println(resultset.getString(3));
                    System.out.println(resultset.getString(4));
                    System.out.println(resultset.getString(5));
                    System.out.println(resultset.getString(6));
                    System.out.println(resultset.getString(7));
                    System.out.println(resultset.getString(8));
                    System.out.println(resultset.getString(9));
                }
                
%>
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

        <title>Dashboard</title>

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
                        <li class="active"><a>Employees<span class="sr-only">(current)</a></span></li>
                        <li><a href="mcustomerlist.jsp">Customers</a></li>
                        <li><a href="mitemlist.jsp">Items</a></li>
                        <li><a href="msaleslist.jsp">Sales Report</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    
                    <!--LOAD EMPLOYEE AND CUSTOMER INFO INTO TABLES-->
                    <h3 class="sub-header">Employees</h3><br>
                    <button type="button" class="btn btn-default btn-primary">
                        <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>&nbsp;Add
                    </button>
                    <button type="button" class="btn btn-default btn-primary">
                        <span class="glyphicon glyphicon-minus-sign" aria-hidden="true"></span>&nbsp;Delete
                    </button>
                    <button type="button" class="btn btn-default btn-primary">
                        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>&nbsp;Edit
                    </button>
                    
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <!--11 COLUMNS-->
                                    <!--ROWS NEED TO BE FILLED IN USING JAVA CODE-->
                                    <th><input type="checkbox" aria-label="..."></th>
                                    <th>SSN</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Address</th>
                                    <th>City</th>
                                    <th>State</th>
                                    <th>Zip Code</th>
                                    <th>Telephone</th>
                                    <th>Start Date</th>
                                    <th>Hourly Rate</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (int row = 1; row < 5; row++) {
                                        %>
                                        <tr>
                                            <td><input type="checkbox" aria-label="..."></td>
                                            <td>column 1</td>
                                            <td>column 2</td>
                                            <td>column 3</td>
                                            <td>column 4</td>
                                            <td>column 5</td>
                                            <td>column 6</td>
                                            <td>column 7</td>
                                            <td>column 8</td>
                                            <td>column 9</td>
                                            <td>column 10</td>
                                        </tr>
                                        <%
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
                                    <!--11 COLUMNS-->
                                    <!--ROWS NEED TO BE FILLED IN USING JAVA CODE-->
                                    <th>SSN</th>
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
    </body>
</html>

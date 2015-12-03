<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <title>Sales Report</title>

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
                        <li><a href="mcustomerlist.jsp">Customers</a></li>
                        <li><a href="mitemlist.jsp">Items</a></li>
                        <li class="active"><a>Sales Report<span class="sr-only">(current)</span></a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

                    <!--LOAD ITEM INFO INTO TABLES-->
                    <h3 class="sub-header">Sales Report By Month</h3><br>

                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <!--11 COLUMNS-->
                                    <!--ROWS NEED TO BE FILLED IN USING JAVA CODE-->
                                    <th>Auction ID</th>
                                    <th>Item ID</th>
                                    <th>Bid Price</th>
                                    <th>Monitor</th>
                                    <th>Year</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String month = request.getParameter("month");

                                    String mysJDBCDriver = "com.mysql.jdbc.Driver";
                                    String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/yromero";
                                    String mysUserID = "yromero";
                                    String mysPassword = "109210768";

                                    if (month == null) {
                                        response.sendRedirect("msaleslist.jsp");
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
                                            java.sql.ResultSet rs = stmt1.executeQuery("SELECT A.AuctionID,"
                                                    + " A.ItemID, B.BidPrice, A.Monitor, YEAR(P.ExpireDate)"
                                                    + " AS YEAR FROM Post P, Auction A, Bid B WHERE"
                                                    + " P.AuctionID = A.AuctionID AND"
                                                    + " B.AuctionID = A.AuctionID AND MONTH(P.ExpireDate) = '" + month + "'"
                                                    + " AND B.BidPrice = (SELECT MAX(B.BidPrice) FROM Bid B);");
                                            while (rs.next()) {
                                %>
                                <tr>
                                    <td><%=rs.getString(1)%></td>
                                    <td><%=rs.getString(2)%></td>
                                    <td><%=rs.getString(3)%></td>
                                    <td><%=rs.getString(4)%></td>
                                    <td><%=rs.getString(5)%></td>
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
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>   
                    <button type="button" class="btn btn-default btn-primary" onclick="location.href = 'msaleslist.jsp';">
                        <span class="glyphicon glyphicon-circle-arrow-left" aria-hidden="true"></span>&nbsp;Back
                    </button>
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


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

        <title>Search Results</title>

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
                    <a class="navbar-brand">Smolka Dots</a>
                </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li><a href="customerdashboard.jsp">Items</a></li>
                        <li class="active"><a>Search</a><span class="sr-only">(current)</span></li>
                        <li><a href="bidhistory.jsp">Bid History</a>
                        <li><a href="auctionhistory.jsp">Your Auctions</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

                    <!--LOAD ITEM INFO INTO TABLES-->
                    <h3 class="sub-header">Search Results</h3><br>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <!--11 COLUMNS-->
                                    <!--ROWS NEED TO BE FILLED IN USING JAVA CODE-->
                                    <th>Customer ID</th>
                                    <th>Item ID</th>
                                    <th>Item Name</th>
                                    <th>Item Type</th>
                                    <th>Item Description</th>
                                    <th>Auction ID</th>
                                    <th>Bid Increment</th>
                                    <th>Minimum Bid</th>
                                    <th>Copies Sold</th>
                                    <th>Monitor</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String sellerid = request.getParameter("userid");

                                    String mysJDBCDriver = "com.mysql.jdbc.Driver";
                                    String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/yromero";
                                    String mysUserID = "yromero";
                                    String mysPassword = "109210768";

                                    if (sellerid == null) {
                                        response.sendRedirect("customersearch.jsp");
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
                                            java.sql.ResultSet rs = stmt1.executeQuery("SELECT P.CustomerID,"
                                                    + " A.ItemID, I.Name, I.Type, I.Description, A.AuctionID,"
                                                    + " A.BidIncrement, A.MinimumBid, A.CopiesSold, A.Monitor"
                                                    + " FROM Auction A, Post P, Item I"
                                                    + " WHERE P.CustomerID = '"+sellerid+"' AND"
                                                    + " A.AuctionID = P.AuctionID AND I.ItemID = A.ItemID;");
                                            while (rs.next()) {
                                %>
                                <tr>
                                    <td><%=rs.getString(1)%></td>
                                    <td><%=rs.getString(2)%></td>
                                    <td><%=rs.getString(3)%></td>
                                    <td><%=rs.getString(4)%></td>
                                    <td><%=rs.getString(5)%></td>
                                    <td><%=rs.getString(6)%></td>
                                    <td><%=rs.getString(7)%></td>
                                    <td><%=rs.getString(8)%></td>
                                    <td><%=rs.getString(9)%></td>
                                    <td><%=rs.getString(10)%></td>
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
                    <button type="button" class="btn btn-default btn-primary" onclick="location.href = 'customersearch.jsp';">
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

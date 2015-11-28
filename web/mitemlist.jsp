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

        <title>Items Listing</title>

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
                        <li class="active"><a>Items<span class="sr-only">(current)</span></a></li>
                        <li><a href="msaleslist.jsp">Sales Report</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    
                    <!--LOAD ITEM INFO INTO TABLES-->
                    <h3 class="sub-header">Items</h3><br>
                    
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <!--11 COLUMNS-->
                                    <!--ROWS NEED TO BE FILLED IN USING JAVA CODE-->
                                    <th><input id="selectAll" type="checkbox" aria-label="..."></th>
                                    <th>Name</th>
                                    <th>Poster</th>
                                    <th>Type</th>
                                    <th>Year</th>
                                    <th>Copies Available</th>
                                    <th>Open Bid</th>
                                    <th>Bid Increment</th>
                                    <th>Reserve Price</th>
                                    <th>Open Date</th>
                                    <th>Close Time/Date</th>
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

                                    Statement statement = conn.createStatement() ;
                                    ResultSet resultset = statement.executeQuery("SELECT I.Name, P.CustomerID, I.Type, "
                                            + "I.Year, I.NumCopies, A.MinimumBid, A.BidIncrement, "
                                            + "A.ReservePrice, P.PostDate, P.ExpireDate FROM Item I, Post P, Auction A "
                                            + "WHERE A.ItemID = I.ItemID AND A.AuctionID = P.AuctionID");
                
                                    while(resultset.next()) {
                                %>
                                    <tr>
                                        <td><input class="checkboxes" type="checkbox" aria-label="..."></td>
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
                                    </tr>
                                <%
                                    }
                                }
                                catch(Exception e) {
                                    e.printStackTrace();
                                    out.print(e.toString());
                                }
                                finally {
                                    try {
                                        conn.close();
                                    }   
                                    catch(Exception ee){
                                        {};
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

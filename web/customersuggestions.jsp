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

        <title>Item Suggestions</title>

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
                        <li><a href="customersearch.jsp">Search</a></li>
                        <li><a href="bidhistory.jsp">Bid History</a>
                        <li><a href="auctionhistory.jsp">Auction History</a></li>
                        <li class="active"><a>Item Suggestions</a><span class="sr-only">(current)</span></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

                    <!--LOAD ITEM INFO INTO TABLES-->
                    <h3 class="sub-header">Item Suggestions</h3><br>

                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <!--11 COLUMNS-->
                                    <!--ROWS NEED TO BE FILLED IN USING JAVA CODE-->
                                    <th>Item ID</th>
                                    <th>Item Type</th>
                                    <th>Item Name</th>
                                    <th>Item Description</th>
                                    <th>Item Year</th>
                                    <th>Auction ID</th>
                                    <th>Expiration Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String userid = session.getAttribute("login").toString();

                                    String mysJDBCDriver = "com.mysql.jdbc.Driver";
                                    String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/yromero";
                                    String mysUserID = "yromero";
                                    String mysPassword = "109210768";

                                    if (userid == null) {
                                        response.sendRedirect("customersuggestions.jsp");
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
                                            java.sql.Statement stmt2 = conn.createStatement();
                                            java.sql.Statement stmt3 = conn.createStatement();
                                            stmt3.execute("DROP VIEW IF EXISTS CustomerPurchaseTypes;");
                                            stmt2.execute("CREATE VIEW CustomerPurchaseTypes AS"
                                                    + " SELECT I.Type FROM Item I, Auction A, Bid B, Post P"
                                                    + " WHERE I.ItemID = A.ItemID AND A.AuctionID = B.AuctionID AND P.ExpireDate < NOW()"
                                                    + " AND A.AuctionID = P.AuctionID AND B.WinningBid IS NOT NULL AND B.CurrentWinner = '"+userid+"';");
                                            java.sql.ResultSet rs = stmt1.executeQuery("SELECT I.ItemID, I.Type, I.Name, I.Description, I.Year, A.AuctionID, P.ExpireDate"
                                                    + " FROM CustomerPurchaseTypes C, Item I, Post P, Auction A WHERE"
                                                    + " C.Type = I.Type AND P.AuctionID = A.AuctionID AND A.ItemID = I.ItemID;");
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
                                </tr>
                                <%
                                            }
                                            rs.last();
                                            if(rs.getRow() == 0){
                                            %>
                                                <div class="alert alert-info" role="alert">You have no item suggestions.</div>
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

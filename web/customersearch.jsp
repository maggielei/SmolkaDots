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

        <title>Search</title>

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
                        <li class="active"><a>Search<span class="sr-only">(current)</span></a></li>
                        <li><a href="bidhistory.jsp">Bid History</a>
                        <li><a href="auctionhistory.jsp">Your Auctions</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    
                    <!--LOAD ITEM INFO INTO TABLES-->
                    <h3 class="sub-header">Search Items By..</h3><br>
                    
                    <!--INPUT BOXES-->
                    <form class="form-inline" name="userid" action="searchsellerid.jsp" method="post">
                        <h4>Seller ID</h4><input id="userid" name="userid" class="form-control" placeholder="User ID" required>

                        <button type="submit" class="btn btn-default btn-primary">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;Search
                        </button>
                    </form><br>
        
                    <form class="form-inline" name="itemid" action="searchresults.jsp" method="post">
                        <h4>Item ID</h4><input id="itemid" name="itemid" class="form-control" placeholder="Item ID" required>

                        <button type="submit" class="btn btn-default btn-primary">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;Search
                        </button>
                    </form><br>
                    
                    <form class="form-inline" name="itemtype" action="searchitemtype.jsp" method="post">
                        <h4>Item Type</h4><input id="itemtype" name="itemtype" class="form-control" placeholder="Item Type" required>

                        <button type="submit" class="btn btn-default btn-primary">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;Search
                        </button>
                    </form><br>
                    
                    <form class="form-inline" name="itemname" action="searchresults.jsp" method="post">
                        <h4>Item Name</h4><input id="itemname" name="itemname" class="form-control" placeholder="Item Name" required>

                        <button type="submit" class="btn btn-default btn-primary">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;Search
                        </button>
                    </form>
                    <!--END INPUT BOXES-->
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

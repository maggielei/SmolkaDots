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

        <title>Auction History</title>

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
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.htm">Logout</a></li>
                        <li><a href="help.jsp">Help</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li><a href="customerdashboard.jsp">Items</a></li>
                        <li><a href="customersearch.jsp">Search</a></li>
                        <li><a href="bidhistory.jsp">Bid History</a>
                        <li class="active"><a>Auction History</a><span class="sr-only">(current)</span></li>
                        <li><a href="customersuggestions.jsp">Item Suggestions</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

                    <!--LOAD ITEM INFO INTO TABLES-->
                    <h3 class="sub-header">Get Current/Past Auctions of..</h3><br>

                    <form class="form-inline" action="auctionhistoryresult.jsp" method="post">
                        <input id="custid" name="custid" class="form-control" placeholder="Customer ID" required>

                        <button type="submit" class="btn btn-default btn-primary">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;Search
                        </button>
                    </form><br>
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

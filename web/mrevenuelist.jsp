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

        <title>Revenue Report</title>

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
                        <li><a href="managerdashboard.jsp">Employees</a></li>
                        <li><a href="mcustomerlist.jsp">Customers</a></li>
                        <li><a href="mitemlist.jsp">Items</a></li>
                        <li><a href="msaleslist.jsp">Sales Report</a></li>
                        <li class="active"><a>Revenue Report<span class="sr-only">(current)</span></a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    
                    <!--LOAD ITEM INFO INTO TABLES-->
                    <h3 class="sub-header">Get Revenue Report By..</h3><br>
                        <form class="form-inline" action="mrevenuebycust.jsp" method="post">
                            <input id="custid" name="custid" class="form-control" placeholder="Customer ID" required>

                            <button type="submit" class="btn btn-default btn-primary">
                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;Search
                            </button>
                        </form><br>
                        
                        <form class="form-inline" action="mrevenuebyiid.jsp" method="post">
                            <input id="itemid" name="itemid" class="form-control" placeholder="Item ID" required>

                            <button type="submit" class="btn btn-default btn-primary">
                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;Search
                            </button>
                        </form><br>
                        
                        <form class="form-inline" action="mrevenuebyitype.jsp" method="post">
                            <input id="itemtype" name="itemtype" class="form-control" placeholder="Item Type" required>

                            <button type="submit" class="btn btn-default btn-primary">
                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;Search
                            </button>
                        </form>
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


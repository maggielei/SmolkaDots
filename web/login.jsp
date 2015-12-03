<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="img/favicon.ico">
  
    <title>Log In</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/login.css" rel="stylesheet">
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
              <a href="index.htm" class="navbar-brand">Smolka Dots</a>
            </div>
            <div id="navbar" class="collapse navbar-collapse">
              <ul class="nav navbar-nav">
                  <li><a href="signup.jsp">Sign Up</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="">Contact</a></li>
              </ul>
            </div><!--/.nav-collapse -->
          </div>
        </nav>
        
        <div class="container">
            <form name="myForm" action="validation.jsp" method="post" class = "form-signin">
              <h2 class="form-signin-heading">Log In</h2>
              <label for="inputId" class="sr-only">User ID</label>
              <input type="userid" id="userid" name = "userid" class="form-control" placeholder="UserID" required autofocus>
              <label for="inputPassword" class="sr-only">Password</label>
              <input type="password" id="inputPassword" name = "password" class="form-control" placeholder="Password" required>
              <div class="checkbox">
                <label>
                  <input type="checkbox" value="remember-me"> Remember me
                </label>
              </div>
              <button class="btn btn-lg btn-primary btn-block" type="submit"> Log In</button>
            </form>
        </div> <!-- /container -->
    </body>
</html>

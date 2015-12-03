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

        <title>Delete User</title>

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
                </div><!--/.nav-collapse -->
            </div>
        </nav>   

        <div class="container">
            <div class="starter-template">
                <h2 class="form-signin-heading">Delete User</h2>
                <div class="alert alert-danger" role="alert"><h4>Deleting User failed. He/she is overseeing an auction or selling an item.</h4></div>
                <button type="button" class="btn btn-default btn-primary" onclick="history.go(-1);">
                    <span class="glyphicon glyphicon-circle-arrow-left" aria-hidden="true"></span>&nbsp;Back
                </button> 
            </div>
            <%
                String custRepSSN = null;
                String custSSN = null;
                String position = request.getParameter("position");
                if (position.equalsIgnoreCase("Customer_Representative")) {
                    custRepSSN = request.getParameter("ssn");
                } else {
                    custSSN = request.getParameter("ssn");
                }

                String mysJDBCDriver = "com.mysql.jdbc.Driver";
                String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/yromero";
                String mysUserID = "yromero";
                String mysPassword = "109210768";

                // code starts here
                java.sql.Connection conn = null;
                try {
                    Class.forName(mysJDBCDriver).newInstance();
                    java.util.Properties sysprops = System.getProperties();
                    sysprops.put("user", mysUserID);
                    sysprops.put("password", mysPassword);

                    // connect to the database
                    conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
                    System.out.println("Connected successfully to database using JConnect");

                    conn.setAutoCommit(false);

                    java.sql.Statement stmt1 = conn.createStatement();

                    if (custRepSSN != null) {
                        try {
                            stmt1.executeUpdate("DELETE Person, Employee FROM Person INNER JOIN Employee "
                                    + "WHERE Person.SSN = Employee.EmployeeID AND Person.SSN = '" + custRepSSN + "'");
                            stmt1.close();
                            conn.commit();
                        } catch (Exception e) {
                            conn.rollback();
                            e.printStackTrace();
                        }
                    } else {
                        try {
                            stmt1.executeUpdate("DELETE Person, Customer FROM Person INNER JOIN Customer "
                                    + "WHERE Person.SSN = Customer.CustomerSSN AND Person.SSN = '" + custSSN + "'");
                            stmt1.close();
                            conn.commit();
                        } catch (Exception e) {
                            conn.rollback();
                            e.printStackTrace();
                        }
                    }
                } catch (Exception g) {
                    g.printStackTrace();
                } finally {
                    try {
                        conn.close();
                    } catch (Exception ee) {
                    };
                }
            %>
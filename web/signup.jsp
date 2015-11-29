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

        <title>Sign Up</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/login.css" rel="stylesheet">
        <link href="css/index.css" rel="stylesheet">
        
        <script language="javascript" type="text/javascript">
            function Position_getVal() {
                if (document.getElementByName('inlineRadioOptions').value) {
                    value = document.getElementByName('inlineRadioOptions').value;
                }
                return value;
            }
        </script>
        
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
            <div id="userSelect">
                <h2 class="text-center">Sign Up</h2>
                <!--SELECT USER TYPE-->
                <div class="radioButtons">
                    <label class="radio-inline">
                        <input type="radio" class="option" name="inlineRadioOptions" id="Manager" value="empForm"> Manager
                    </label>
                    <label class="radio-inline">
                        <input type="radio" class="option" name="inlineRadioOptions" id="Customer_Representative" value="empForm"> Customer Representative
                    </label>
                    <label class="radio-inline">
                        <input type="radio" class = "option" name="inlineRadioOptions" id="Customer" value="custForm"> Customer
                    </label>
                </div>
            </div>
            <form name="userform" action="addnewuser.jsp" method="post" class="form-signin">
                <div id="empForm" class="hideMe">
                    <!--EMPLOYEE INFORMATION FORM-->
                    <label for="inputSSN" class="sr-only">SSN</label>
                    <input type="ssn" id="ssn" name = "ssn" class="form-control" placeholder="Social Security #" required>
                    
                    <label for="employeeID" class="sr-only">UserID</label>
                    <input type="userid" id="userid" name="userid" class="form-control" placeholder="UserID" required>

                    <label for="inputFirstName" class="sr-only">First Name</label>
                    <input type="firstName" name = "firstname" id="firstName" class="form-control" placeholder="First Name" required>

                    <label for="inputLastName" class="sr-only">Last Name</label>
                    <input type="lastName" name="lastname" id="lastName" class="form-control" placeholder="Last Name" required>

                    <label for="inputAddress" class="sr-only">Address</label>
                    <input type="address" name="address" id="address" class="form-control" placeholder="Address" required>

                    <label for="inputCity" class="sr-only">City</label>
                    <input type="city" name="city" id="city" class="form-control" placeholder="City" required>

                    <label for="inputState" class="sr-only">State</label>
                    <input type="state" name="state" id="state" class="form-control" placeholder="State" required>

                    <label for="inputZip" class="sr-only">Zip Code</label>
                    <input type="zipCode" name="zipcode" id="zipCode" class="form-control" placeholder="Zip Code" required>

                    <label for="inputTelephone" class="sr-only">Telephone</label>
                    <input type="telephone" name="telephone" id="telephone" class="form-control" placeholder="Telephone #" required>
                    
                    <label for="inputEmail" class="sr-only">Email Address</label>
                    <input type="emailAddress" name="emailaddress" id="emailAddress" class="form-control" placeholder="Email Address" required>

                    <label for="inputStartDate" class="sr-only">Start Date</label>
                    <input type="startDate" name="startdate" id="startDate" class="form-control" placeholder="Start Date" required>
                    
                    <label for="inputHourlyRate" class="sr-only">Hourly Rate</label>
                    <input type="hourlyRate" name="hourlyrate" id="hourlyRate" class="form-control" placeholder="Hourly Rate" required>

                    <label for="inputLevel" class="sr-only">Level</label>
                    <input type="level" name="level" id="level" class="form-control" placeholder="Level" required>
                    
                    <label for="inputPosition" class="sr-only">Position</label>
                    <input type="position" name="position" id="position" class="form-control" value="Position" readonly>
                    
                    <label for="inputPassword" class="sr-only">Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
                    <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="return document.userform.submit();">Sign Up</button>
                </div>
                
                <div id="custForm" class="hideMe">
                    <!--CUSTOMER INFORMATION FORM-->
                    <label for="inputSSN" class="sr-only">Customer SSN</label>
                    <input type="custssn" name="custssn" id="custssn" class="form-control" placeholder="Social Security #" required>
                    
                    <label for="inputId" class="sr-only">Customer ID</label>
                    <input type="custid" name="custid" id="custid" class="form-control" placeholder="CustomerID" required>

                    <label for="inputFirstName" class="sr-only">First Name</label>
                    <input type="firstName" name="custfirstname" id="firstName" class="form-control" placeholder="First Name" required>

                    <label for="inputLastName" class="sr-only">Last Name</label>
                    <input type="lastName" name="custlastname" id="lastName" class="form-control" placeholder="Last Name" required>

                    <label for="inputAddress" class="sr-only">Address</label>
                    <input type="address" name="custaddress" id="address" class="form-control" placeholder="Address" required>

                    <label for="inputCity" class="sr-only">City</label>
                    <input type="city" name="custcity" id="city" class="form-control" placeholder="City" required>

                    <label for="inputState" class="sr-only">State</label>
                    <input type="state" name="custstate" id="state" class="form-control" placeholder="State" required>

                    <label for="inputZip" class="sr-only">Zip Code</label>
                    <input type="custzipCode" name="custzipcode" id="custzipCode" class="form-control" placeholder="Zip Code" required>

                    <label for="inputTelephone" class="sr-only">Telephone</label>
                    <input type="telephone" name="custtelephone" id="telephone" class="form-control" placeholder="Telephone #" required>

                    <label for="inputZip" class="sr-only">Credit Card</label>
                    <input type="creditCard" name="creditcard" id="creditCard" class="form-control" placeholder="Credit Card #" required>

                    <label for="inputEmail" class="sr-only">Email Address</label>
                    <input type="emailAddress" name="custemail" id="emailAddress" class="form-control" placeholder="Email Address" required>

                    <label for="inputPassword" class="sr-only">Password</label>
                    <input type="password" name="custpassword" id="password" class="form-control" placeholder="Password" required>
                   
                    <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="return document.userform.submit();">Sign Up</button>
                </div>
            </form>
        </div> <!-- /container -->
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script>
            // HIDES FORM DEPENDING ON USER TYPE
            $(function() {
                $("[name=inlineRadioOptions]").click(function(){
                        $(".hideMe").hide();
                        $("#"+$(this).val()).show();
                        var thisRadio = $(this).attr('id');
                        $('#position').val(thisRadio);
                });
            });  
        </script>
        
        
    </body>
</html>

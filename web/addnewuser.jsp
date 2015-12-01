<%
    String employeeSSN = request.getParameter("ssn");
    String employeeID = request.getParameter("userid");
    String startDate = request.getParameter("startdate");
    String hourlyRate = request.getParameter("hourlyrate");
    String level = request.getParameter("level");
    String position = request.getParameter("position");
    
    if(position.equalsIgnoreCase("Customer_Representative")) {
        position = "Customer Representative";
    }
   
    String custFirstName = request.getParameter("custfirstname");
    String custLastName = request.getParameter("custlastname");
    String custAddress = request.getParameter("custaddress");
    String custCity = request.getParameter("custcity");
    String custState = request.getParameter("custstate");
    String custZipCode = request.getParameter("custzipcode");
    String custTelephone = request.getParameter("custtelephone");
    String custEmail = request.getParameter("custemail");
    String custPassword = request.getParameter("custpassword");
    
    String firstName = request.getParameter("firstname");
    String lastName = request.getParameter("lastname");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String zipCode = request.getParameter("zipcode");
    String telephone = request.getParameter("telephone");
    String email = request.getParameter("emailaddress");
    String password = request.getParameter("password");
    
    String customerSSN = request.getParameter("custssn");
    String customerID = request.getParameter("custid");
    String creditCard = request.getParameter("creditcard");
    
    String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
    String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/yromero";  
    String mysUserID = "yromero"; 
    String mysPassword = "109210768";
       	
    if(((employeeSSN == null) || (customerSSN == null)) && ((employeeID == null) || (customerID == null)) && (password == null)) {
        response.sendRedirect("signup.jsp");
    }
    else {
        // code starts here
        java.sql.Connection conn = null;
        try {
            Class.forName(mysJDBCDriver).newInstance();
            java.util.Properties sysprops=System.getProperties();
    	    sysprops.put("user",mysUserID);
            sysprops.put("password",mysPassword);
            
            // connect to the database
            conn = java.sql.DriverManager.getConnection(mysURL,sysprops);
            System.out.println("Connected successfully to database using JConnect");
            
            conn.setAutoCommit(false);
            
            java.sql.Statement stmt1 = conn.createStatement();
            java.sql.Statement stmt2 = conn.createStatement();
            
            if(!employeeID.isEmpty()) {
                try {
                    stmt1.executeUpdate("INSERT into Person values('"+employeeSSN+"', "
                        + "'"+lastName+"', '"+firstName+"', '"+address+"', '"+city+"', "
                        + "'"+state+"', '"+zipCode+"', '"+telephone+"', '"+email+"')");
                    stmt2.executeUpdate("INSERT into Employee values('"+employeeSSN+"', "
                        + "'"+startDate+"', '"+hourlyRate+"', '"+level+"', '"+position+"', "
                        + "'"+password+"', '"+employeeID+"')");
                    stmt1.close();
                    stmt2.close();
                    conn.commit();
                    %>
                    User has been added!
                    <a href="login.jsp"><font color="Blue">Home</font></a>
                    <%
                }
                catch(Exception e) {
                    conn.rollback();
                    e.printStackTrace();
                    out.print("There is an error with the values you are trying to insert. Please see the description below and try again.");
                    out.print("<BR>");
                    out.print("<BR>");
                    out.print(e.toString()); 
                }
            }
            else {
                try {
                    stmt1.executeUpdate("INSERT into Person values('"+customerSSN+"', "
                        + "'"+custLastName+"', '"+custFirstName+"', '"+custAddress+"', '"+custCity+"', "
                        + "'"+custState+"', '"+custZipCode+"', '"+custTelephone+"', '"+custEmail+"')");
                    stmt2.executeUpdate("INSERT into Customer values('"+customerSSN+"', "
                        + "'"+customerID+"', '"+creditCard+"', '0' , '"+custPassword+"')");
                    stmt1.close();
                    stmt2.close();
                    conn.commit();
                    %>
                    User has been added!
                    <a href="login.jsp"><font color="Blue">Home</font></a>
                    <%
                }
                catch(Exception f) {
                    conn.rollback();
                    f.printStackTrace();
                    out.print("There is an error with the values you are trying to insert. Please see the description below and try again.");
                    out.print("<BR>");
                    out.print("<BR>");
                    out.print(f.toString());
                }
            }  
        }
        catch(Exception g) {
            g.printStackTrace();
            out.print("There is an error. Please see the description below and try again.");
            out.print("<BR>");
            out.print("<BR>");
            out.print(g.toString()); 
        }
        finally {
           try{conn.close();}catch(Exception ee){}; 
        }
    }
%>
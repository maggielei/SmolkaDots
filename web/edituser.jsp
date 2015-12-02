<%
    String employeeSSN = request.getParameter("ssn");
    String employeeID = request.getParameter("userid");
    String startDate = request.getParameter("startdate");
    String hourlyRate = request.getParameter("hourlyrate");
    String level = request.getParameter("level");
    String position = request.getParameter("position");
    
    String firstName = request.getParameter("firstname");
    String lastName = request.getParameter("lastname");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String zipCode = request.getParameter("zipcode");
    String telephone = request.getParameter("telephone");
    String email = request.getParameter("emailaddress");
    String password = request.getParameter("password");
    
    String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
    String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/yromero";  
    String mysUserID = "yromero"; 
    String mysPassword = "109210768";
       	
    if((employeeSSN == null) || (employeeID == null) || (password == null)) {
        response.sendRedirect("edituserform.jsp");
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
                    stmt1.executeUpdate("UPDATE Person P SET P.LastName = '"+lastName+"', P.FirstName = '"+firstName+"',"
                            + "P.Address = '"+address+"', P.City = '"+city+"', P.State = '"+state+"',"
                            + "P.ZipCode = '"+zipCode+"', P.Telephone = '"+telephone+"', P.Email='"+email+"'"
                            + "WHERE P.SSN = '"+employeeSSN+"'");
                    stmt2.executeUpdate("UPDATE Employee E SET E.StartDate = '"+startDate+"', E.HourlyRate = '"+hourlyRate+"',"
                            + "E.Level= '"+level+"', E.Position = '"+position+"', E.Password = '"+password+"'"
                            + "WHERE E.EmployeeID = '"+employeeSSN+"' AND E.UserID = '"+employeeID+"'");
                    stmt1.close();
                    stmt2.close();
                    conn.commit();
                    %>
                    <script type="text/javascript">
                        function goBack() {
                            history.go(-1);
                        }
                        window.onload = goBack();
                    </script>  
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
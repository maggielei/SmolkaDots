<%
    String custRepSSN = null;
    String custSSN = null;
    String position = request.getParameter("position");
    if(position.equalsIgnoreCase("Customer_Representative")){
        custRepSSN = request.getParameter("ssn");
    }
    else{
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
        java.util.Properties sysprops=System.getProperties();
        sysprops.put("user",mysUserID);
        sysprops.put("password",mysPassword);

        // connect to the database
        conn = java.sql.DriverManager.getConnection(mysURL,sysprops);
        System.out.println("Connected successfully to database using JConnect");

        conn.setAutoCommit(false);

        java.sql.Statement stmt1 = conn.createStatement();

        if(custRepSSN != null) {
            try {
                stmt1.executeUpdate("DELETE Person, Employee FROM Person INNER JOIN Employee "
                        + "WHERE Person.SSN = Employee.EmployeeID AND Person.SSN = '"+custRepSSN+"'");
                stmt1.close();
                conn.commit();
                %>
                User has been deleted!
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
        else{
            try {
                stmt1.executeUpdate("DELETE Person, Customer FROM Person INNER JOIN Customer "
                        + "WHERE Person.SSN = Customer.CustomerSSN AND Person.SSN = '"+custSSN+"'");
                stmt1.close();
                conn.commit();
                %>
                User has been deleted!
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
%>
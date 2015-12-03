<%
    if((request.getParameter("action")!= null)&& (request.getParameter("action").trim().equals("logout"))) {
        session.putValue("login","");
        response.sendRedirect("index.htm");
        return;
    }
    String username = request.getParameter("userid");
    String userpasswd = request.getParameter("password");
    String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
    String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/yromero"; 
    String mysUserID = "yromero"; 
    String mysPassword = "109210768";
    	
    session.putValue("login","");
    if ((username!=null) &&(userpasswd!=null)) {
        if (username.trim().equals("") || userpasswd.trim().equals("")) {
            response.sendRedirect("index.htm");
        }
        else {
            java.sql.Connection conn = null;
            try {
		Class.forName(mysJDBCDriver).newInstance();
                java.util.Properties sysprops=System.getProperties();
                sysprops.put("user",mysUserID);
                sysprops.put("password",mysPassword);
        
                //connect to the database
                conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
                System.out.println("Connected successfully to database using JConnect");
            
                conn.setAutoCommit(false);
                java.sql.Statement stmt1=conn.createStatement();
                java.sql.ResultSet rs = stmt1.executeQuery("SELECT * FROM Employee E, Person P WHERE P.SSN = E.EmployeeID AND E.Position = 'Manager' AND E.UserID='"+username+"' AND E.Password='"+userpasswd+"'");
                if (rs.next()) {
                    // login success
                    session.setAttribute("login",username);
                    response.sendRedirect("managerdashboard.jsp");
                }
                else {
                    rs = stmt1.executeQuery("SELECT * FROM Employee E, Person P WHERE P.SSN = E.EmployeeID AND E.Position = 'Customer Representative' AND E.UserID='"+username+"' AND E.Password='"+userpasswd+"'");
                    if(rs.next()) {
                        session.setAttribute("login", username);
                        response.sendRedirect("custrepdashboard.jsp");
                    }
                    else {
                        rs = stmt1.executeQuery("SELECT * FROM Customer C, Person P WHERE P.SSN = C.CustomerSSN AND C.CustomerID='"+username+"' AND C.Password='"+userpasswd+"'");
                        if(rs.next()) {
                            session.setAttribute("login", username);
                            response.sendRedirect("customerdashboard.jsp");
                        }
                        else {
                            // Password or username mistake
                            response.sendRedirect("loginmistake.jsp");
                        }
                    }
                }
            } 
            catch(Exception e) {
                e.printStackTrace();
            }
            finally {
                try{conn.close();}catch(Exception ee){};
            }
        }
    }
%>
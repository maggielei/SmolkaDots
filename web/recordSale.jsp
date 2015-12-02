<%
    String itemID = request.getParameter("itemid");
    
    String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
    String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/yromero";  
    String mysUserID = "yromero"; 
    String mysPassword = "109210768";
       	
    if(itemID == null) {
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
            try {
                stmt1.executeUpdate("UPDATE Auction A SET A.CopiesSold = A.CopiesSold + 1 WHERE"
                        + " A.ItemID = '"+itemID+"'");
                stmt2.executeUpdate("UPDATE Item I SET I.NumCopies = I.NumCopies - 1 WHERE"
                        + " I.ItemID = '"+itemID+"' AND I.NumCopies > 0");
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
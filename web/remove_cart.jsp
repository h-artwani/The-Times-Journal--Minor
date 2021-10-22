<%-- 
    Document   : payment_his
    Created on : 15 Mar, 2020, 5:51:17 PM
    Author     : harshartwani
--%>

<%@page import="com.nds.db.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel = "stylesheet" href = "css\mark1.css">
        <link rel = "stylesheet" href = "css\mark2.css">
        <link rel = "stylesheet" href = "css\edit_cart.css">
        <script type="text/javascript">
            function load()
            {
                window.location.href = "cart.jsp";

            }
        </script>
    </head>
    <body onload="load()">
	<fieldset>
        <form action='update_cart_details'>
           <%@page import="java.sql.DriverManager"%>
            <%@page import="java.sql.ResultSet"%>
            <%@page import="java.sql.Statement"%>
            <%@page import="java.sql.Connection"%>
            <%
                String username = (String) session.getAttribute("Username");
                String email = (String) session.getAttribute("Email");
                String phone_number = (String) session.getAttribute("PhoneNumber");
                System.out.println("Username is " + username);

                System.out.println("email is " + email);

                System.out.println("phone_number is " + phone_number);
                session.setAttribute("Username", username);
                session.setAttribute("Email", email);
                session.setAttribute("PhoneNumber", phone_number);

                String category = (String) session.getAttribute("Category");

            %>
            <%            String id = request.getParameter("userId");
                String u = request.getParameter("u");
                session.setAttribute("id", u);
                int num = Integer.parseInt(u);
                System.out.println("Id is "+num);

                Connection connection = null;
                Statement statement = null;
                PreparedStatement ps = null;
                ResultSet resultSet = null;
            %>

            <%
                try {
                    connection = DbConnection.getConnection();
                    statement = connection.createStatement();

                    String sql2 = "DELETE FROM Cart where email ='" + email + "' and id ='" + num + "'";
                    ps=connection.prepareStatement(sql2);
                    ps.execute();
            %>
            
            <%
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>

        </form>
		</fieldset>
    </body>
</html>

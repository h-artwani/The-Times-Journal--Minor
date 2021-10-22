<%-- 
    Document   : update_dboy_details
    Created on : 17 Apr, 2020, 7:57:26 AM
    Author     : harshartwani
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> </title>
        <script>
            alert("Updated Successfully!");
        </script>  
        <script type="text/javascript">
            function load()
            {
                window.location.href = "delivery_boy_details.jsp";

            }
        </script>
    </head>
    <body onload="load()">
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

        %>
        
    </body>
</html>

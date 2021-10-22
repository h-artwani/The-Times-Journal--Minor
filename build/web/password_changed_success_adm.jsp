<%-- 
    Document   : error
    Created on : 04-Mar-2019, 11:07:53
    Author     : vijayartwani
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.nds.db.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> </title>
        <script>
            alert("Password Changed Successfully!");
        </script>  
        <script type="text/javascript">
            function load()
            {
                window.location.href = "welcomeAdmin.jsp";

            }
        </script>
    </head>

    <body onload="load()">
        <%
            String username = (String) session.getAttribute("Username");

            System.out.println("Username is " + username);

            session.setAttribute("Username", username);


        %> 

    </body>
</html>
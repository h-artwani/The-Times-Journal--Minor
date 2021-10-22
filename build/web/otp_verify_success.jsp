<%-- 
    Document   : emailverified
    Created on : 07-Mar-2019, 00:27:05
    Author     : vijayartwani
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> </title>
        <script>
            alert("OTP verified succesfully! Enter your new password to continue.");
        </script>  
        <script type="text/javascript">
            function load()
            {
                window.location.href = "enter_new_password.jsp";

            }
        </script>
    </head>

    <body onload="load()">
        <% 
            String email=(String)session.getAttribute("Email");
            String category=(String)session.getAttribute("Category");
            session.setAttribute("Email", email);
            session.setAttribute("Category", category);
            %>
            
    </body>
</html>

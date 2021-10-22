<%-- 
    Document   : error
    Created on : 04-Mar-2019, 11:07:53
    Author     : vijayartwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> </title>
        <script>
            alert("Email is already linked with another account.");
        </script>  
        <script type="text/javascript">
            function load()
            {
                window.location.href = "edit_personal_details.jsp";

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
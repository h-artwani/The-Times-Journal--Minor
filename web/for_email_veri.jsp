<%-- 
    Document   : for_email_veri
    Created on : 20 Apr, 2020, 5:29:24 AM
    Author     : harshartwani
--%>

<%@page import="com.nds.dao.NDS_Dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> </title>
        <script>
            alert("A link is sent to you on the mail. Please click the link to verify your email address.");
        </script>  
        <script type="text/javascript">
            function load()
            {
                window.location.href = "personal_details.jsp";

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

        <%                
            String email1 = request.getParameter("email");
            String name = request.getParameter("first_name");
            String category = request.getParameter("category");
            NDS_Dao.sendMail(username, email1, category);
        %>
        <h1>Hello World!</h1>
    </body>
</html>

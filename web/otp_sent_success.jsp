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
            alert("An OTP is sent to your registered Mail Id.");
        </script>  
        <script type="text/javascript">
            function load()
            {
                window.location.href = "enter_otp.jsp";

            }
        </script>
    </head>

    <body onload="load()">
        <% 
            System.out.println("Email is "+request.getParameter("nds.email"));
            System.out.println("Category is "+request.getParameter("nds.category"));
            session.setAttribute("Email", request.getParameter("nds.email"));
            session.setAttribute("Category", request.getParameter("nds.category"));
            %>
    </body>
</html>

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
            alert("Invalid Username, Password or Category.");
        </script>  
        <script type="text/javascript">
            function load()
            {
                window.location.href = "login.jsp";

            }
        </script>
    </head>

    <body onload="load()">
    </body>
</html>

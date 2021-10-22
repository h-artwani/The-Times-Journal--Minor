<%-- 
    Document   : enter_otp
    Created on : 6 May, 2020, 6:48:05 AM
    Author     : harshartwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		<link rel = "stylesheet" href = "css\mark1.css">
        <link rel = "stylesheet" href = "css\mark2.css">
        <link rel = "stylesheet" href = "css\enter_new_password.css">
		
		<script>
			function goBack() {
			window.history.back();
			}
		</script>
    </head>
    <body style="background-image: url('images_1/4.jpg');height:100%;background-size: cover;">
	<div>
            <h1 style="font-family:Old English Text MT;"><a href="#"style="color:white;text-decoration:none;" >&nbsp The Times-Journal</a><h1>
                    <ul class="p2">
                        <li class="p3"><button onclick="goBack()"class="registerbtn1">Go Back</button></li>
                        
                    </ul>
                    </div><br/>
    
	<fieldset>
	<%
            String email=(String)session.getAttribute("Email");
            String category=(String)session.getAttribute("Category");
            session.setAttribute("Email", email);
            session.setAttribute("Category", category);
            %>
        
        <form action="otp_verify">
            </br><center></br>
            <label for="otp"><b>Enter OTP :</b></label>
            <input type="text" placeholder="Enter OTP Here" name="nds.otp" required>
            <input type="hidden" name="nds.email" value="<%=email%>">
            <input type="hidden"  name="nds.category" value="<%=category%>">
            </center>
            <br/>
            <br/>
            	
            <br/>
            <br/>							
            <button type="submit"class="registerbtn">Submit OTP</button>    
        </form>
	</fieldset>
    </body>
</html>

<%-- 
    Document   : forgot_password
    Created on : 6 May, 2020, 6:09:54 AM
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
    <body style="background-image: url('images/4.jpg');height:100%;background-size: cover;">
	<div>
            <h1 style="font-family:Old English Text MT;"><a href="#"style="color:white;text-decoration:none;" >&nbsp The Times-Journal</a><h1>
                    <ul class="p2">
                        <li class="p3"><button onclick="goBack()"class="registerbtn1">Go Back</button></li>
                        
                    </ul>
                    </div><br/>
    
	<fieldset>
        <form action="forgotpassword">
            </br><center>
            <label for="email"><b>Enter Mail Id :</b></label>
            <input type="email" placeholder="Enter Email Id" name="nds.email" required>
            <br/>
            <br/>
            
            <b>Select Category :</b> </br></br>
                    <input type = "radio" name ="nds.category" value = "Vendor">Vendor
                        <input type = "radio" name ="nds.category" value = "Customer">Customer
               	
            <br/>
            <br/>							
            <button type="submit"class="registerbtn">Send OTP</button>    </center>
        </form>
		</fieldset>
    </body>
</html>

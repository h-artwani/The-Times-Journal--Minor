<%-- 
    Document   : reply_message
    Created on : 6 May, 2020, 5:23:31 AM
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
        <link rel = "stylesheet" href = "css\reply_message.css">
		
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
        <form action="reply">
            
            <center></br>
                <b>Name</b> 
                    <input type = "text" name ="nds.subject" value="<%=request.getParameter("name")%>" readonly>
                
                

                    <b>Subject</b>
                    <input type = "text" name ="nds.subject" value="<%=request.getParameter("subject")%>" readonly>
                
               
                    <b>Message</b>
                    <input type = "text" name ="nds.message" value="<%=request.getParameter("message")%>" readonly>
                    <input type = "hidden" name ="nds.email" value="<%=request.getParameter("email")%>" >
                    <input type = "hidden" name ="nds.id" value="<%=request.getParameter("id")%>" >
                
                

                    <b>Reply</b>
                    <input type = "text" name ="nds.reply" placeholder="Reply Here...">
                
				
                <th colspan="2"><button type="submit" class="registerbtn">Send</button>
                <button type="reset" class="registerbtn">Reset</button>
        </center>
        </form>
		</fieldset>
    </body>
</html>

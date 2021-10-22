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
    </head>
    <body>
        <form action="reply">
            <table>
                <tr>

                    <th>Name</th>
                    <th><input type = "text" name ="nds.subject" value="<%=request.getParameter("name")%>" readonly></th>
                </tr>
                <tr>

                    <th>Subject</th>
                    <th><input type = "text" name ="nds.subject" value="<%=request.getParameter("subject")%>" readonly></th>
                </tr>
                <tr>

                    <th>Message</th>
                    <th><input type = "text" name ="nds.message" value="<%=request.getParameter("message")%>" readonly></th>
                    <th><input type = "hidden" name ="nds.email" value="<%=request.getParameter("email")%>" ></th>
                    <th><input type = "hidden" name ="nds.id" value="<%=request.getParameter("id")%>" ></th>
                </tr>
                <tr>

                    <th>Reply</th>
                    <th><input type = "text" name ="nds.reply" placeholder="Reply Here..."></th>
                </tr>
                <th><button type="submit" class="registerbtn">Send</button></th>
                <th><button type="reset" class="registerbtn">Reset</button></th>
            </table>     
        </form>
    </body>
</html>

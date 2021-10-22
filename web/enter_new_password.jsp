<%-- 
    Document   : enter_new_password.jsp
    Created on : 6 May, 2020, 7:21:17 AM
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
        <script type="text/javascript">
            function Validate() {
                var password = document.getElementById("txtPassword").value;
                var confirmPassword = document.getElementById("txtConfirmPassword").value;
                if (password != confirmPassword) {
                    alert("Passwords do not match.");
                    return false;
                }
                return true;
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
                        <form action="newpassword" onsubmit="return Validate()">
                            <%
                                String email = (String) session.getAttribute("Email");
                                String category = (String) session.getAttribute("Category");
                                session.setAttribute("Email", email);
                                session.setAttribute("Category", category);
                                System.out.println("Email is " + email);
                                System.out.println("Category is " + category);
                            %>

                            <input type="hidden"  name="nds.email" value="<%=email%>">
                            <input type="hidden"  name="nds.category" value="<%=category%>">

                            </br><center><label for="npass"><b>New Password :</b></label>
                            <input type="password" placeholder="Enter New Password" name="nds.n_password" id="txtPassword" required>
                            <label for="cpass"><b>Confirm Password :</b></label>
                            <input type="password" placeholder="Confirm Password" name="c_password" id="txtConfirmPassword" required>
                            <button type="submit"class="registerbtn">Change Password</button>  </center>  
                        </form>
                    </fieldset>
                    </body>
                    </html>

<html>
    <head>
        <title>login</title>
        <link rel = "stylesheet" href = "css\mark1.css"/>
        <link rel = "stylesheet" href = "css\mark2.css"/>
        <link rel = "stylesheet" href = "css\change_password.css"/>
		
        <link rel = "stylesheet" href = "css\dropdown.css"/>
        <meta charset="utf-8">
        <meta name = "viewport" content = "width = device-width,initial-scale=1.0">
        
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
    <body style="background-image: url('images_1/4.jpg');height:100%;background-size: cover;">
        <div>
            <h1 style="font-family:Old English Text MT;"><a href="#"style="color:white;text-decoration:none;" >&nbsp The Times-Journal</a><h1>
                    <ul class="p2">
                        <li class="p3"><a href="login.jsp">Logout</a></li>
                        <li class="p3"><a href="contact_us_vend.jsp">Contact Us</a></li>
                        <li class="p3"> <div class="dropdown">
                        <button class="dropbtn"><span style="font-family:calibri;font-size:30px;float:right;"><b>About me</b></span> 
                        <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content">
                            <a href="change_password_vend.jsp">Change Password</a>
                            <a href="personal_details_vend.jsp">Personal Details</a>
                        </div>
                        </li>
                        <li class="p3"> <div class="dropdown">
                        <button class="dropbtn"><span style="font-family:calibri;font-size:30px;float:right;"><b>Details</b></span> 
                        <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content">
                            <a href="delivery_boy_details.jsp">Delivery Boy Details</a>
                            <a href="subscribed_customer.jsp">Subscribed Customers</a>
                        </div>
                        </li>
                        <li class="p3"><a href="add_delivery_boy.jsp">Add Delivery Boy</a></li>
                        <li class="p3"><a href="welcomeVendor.jsp">Home</a></li>
                    </ul>
                    </div>
<br/><br/><br/>
                    <fieldset>
                        <form action="change_password" onsubmit="return Validate()">
                            <center>
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
                                
                                <table style="width:35%;height:45%;">
                                        <th><input type = "hidden" name="nds.category" value="Vendor"></th>

                                    <tr>
                                        <th>Username</th>
                                        <th><input type = "text" name="nds.username" value="<%=username%>" readonly></th>
                                    </tr>
                                    <tr>
                                        <th>Old Password</th>
                                        <th><input type = "password" name="nds.o_password"></th>
                                    </tr>
                                    <tr>
                                        <th>New Password</th>
                                        <th><input type = "password" name="nds.n_password" id="txtPassword"></th>
                                    </tr>
                                    <tr>
                                        <th>Confirm Password</th>
                                        <th><input type = "password" name="nds.c_password" id="txtConfirmPassword"></th>
                                    </tr>



                                    <tr>
                                        <th><button type="submit" class="registerbtn">submit</button></th>
                                        <th><button type="reset" class="registerbtn">Reset </button></th>
                                    </tr>
                                </table>
                            </center>
                        </form>
                    </fieldset>
                    <br/>
                    <br/>
                    <br/>			
                    <footer >
                        <ul type =none>
                            <li class="line"><a href="welcomeVendor.jsp">Home</a></li>
                            <li class="line"><a href="subscribed_customer.jsp">Subscribed Customers</a></li>
                            <li class="line"><a href="add_delivery_boy.jsp">Add Delivery Boy</a></li>
                            <li class="line"><a href="delivery_boy_details.jsp">Delivery Boy Details</a></li>
                            <li class="line" ><a href="change_password_vend.jsp" >Change Password</a></li>
                            <li class="line" ><a href="personal_details_vend.jsp" >Personal Details</a></li>
                            <li class="line"><a href="contact_us_vend.jsp">Contact Us</a></li>
                        </ul>
                        <p style = "color:white;">Copyright &copy 2020, All Rights Reserved by Nishachars</p>
                    </footer>
                    </body>
                    </html>
<%-- 
    Document   : add_delivery_boy
    Created on : 18 Mar, 2020, 12:19:17 AM
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
        <link rel = "stylesheet" href = "css\add_dboy.css">
        <link rel = "stylesheet" href = "css\dropdown.css">
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
                    </div><br/>
                            <fieldset>

        <form action="add_dboy">
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
            

            <br/>
            <div class="container">
                <input type="hidden" placeholder="" name="nds.vendor_name" value="<%=username%>" required>
                <br/> <br/>
                <label for="uname"><b>Name of Delivery Boy</b></label>
                <input type="text" placeholder="Enter Name of Delivery Boy" name="nds.name_dboy" required>
                <br/> <br/>
                <label for="uname"><b>Name of Customer</b></label>
                <input type="text" placeholder="Enter Name of Customer" name="nds.name_cust" required>
                <br/>
                <br/>
                <label for="psw"><b>Contact Number of Delivery Boy</b></label>
                <input type="text" placeholder="Enter Contact Number of Delivery Boy" name="nds.c_no_dboy" required>
                <br/>
                <br/> 
                <label for="psw"><b>Contact Number of Customer</b></label>
                <input type="text" placeholder="Enter Contact Number of Customer" name="nds.c_no_cust" required>
                <br/>
                <br/> 
                <label for="psw"><b>Address of Customer</b></label>
                <input type="text" placeholder="Enter Address of Customer" name="nds.address" required>
                <br/>
                <br/> 
				<table>
				<tr>
                <th><button type="submit" class="registerbtn">Submit</button></th>
                <th><button type="reset" class="registerbtn">Reset</button></th>
				</tr>
				</table>
                <form action="add_dboy">
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

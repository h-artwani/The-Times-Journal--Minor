<%-- 
    Document   : welcomeCustomer
    Created on : 12 Feb, 2020, 9:51:36 AM
    Author     : harshartwani
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.nds.db.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel = "stylesheet" href = "css\mark1.css"/>
        <link rel = "stylesheet" href = "css\mark2.css"/>
        <link rel = "stylesheet" href = "css\dropdown.css"/>

        <meta charset="utf-8">
        <meta name = "viewport" content = "width = device-width,initial-scale=1.0">
    </head>
    <body style="background-image: url('images_1/4.jpg');height:100%;background-size: cover;">
        <form  action="" method="post">
		
		<div>
            <h1 style="font-family:Old English Text MT;"><a href="#"style="color:white;text-decoration:none;" >&nbsp The Times-Journal</a><h1>
                    <ul class="p2">
                        <li class="p3"><a href="login.jsp">Logout</a></li>
						
                        <li class="p3"><a href="change_password_adm.jsp">Change Password</a></li>
                        <li class="p3"> <div class="dropdown">
                        <button class="dropbtn"><span style="font-family:calibri;font-size:30px;float:right;"><b>Messages</b></span> 
                        <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content">
                            <a href="messages_vend.jsp">Messages from Vendor</a>
                            <a href="messages_cust.jsp">Messages from Customer</a>
                        </div>
                        </li>
                        <li class="p3"> <div class="dropdown">
                        <button class="dropbtn"><span style="font-family:calibri;font-size:30px;float:right;"><b>Details</b></span> 
                        <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content">
                            <a href="delivery_boy_details_adm.jsp">Delivery Boy Details</a>
                            <a href="payment_details.jsp">Payment Details</a>
                            <a href="vendor_details.jsp">Vendor Details</a>
                            <a href="customer_details.jsp">Customer Details</a>
                        </div>
                        </li>
                        <li class="p3"><a href="welcomeAdmin.jsp">Home</a></li>
                    </ul>
                    </div><br/>


                        
                        <%
                            String username = "admin";
                            session.setAttribute("Username", username);
                        %>


                        <h2 style="color:black;">Welcome Admin </h2><br/>

                        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                        <br/>
                        <br/>

                        <br/>			
                        <footer >
                            <ul type =none>
                                <li class="line"><a href="welcomeAdmin.jsp">Home</a></li>
                                <li class="line"><a href="customer_details.jsp">Customer Details</a></li>
                                <li class="line"><a href="vendor_details.jsp">Vendor Details</a></li>
                                <li class="line"><a href="delivery_boy_details_adm.jsp">Delivery Boy Details</a></li>
                                <li class="line" ><a href="subscribed_customer.jsp" >Payment Details</a></li>
                                <li class="line" ><a href="change_password_adm.jsp" >Change Password</a></li>
                                <li class="line"><a href="contact_us_details.jsp">Messages</a></li>
                                <li class="line"><a href="login.jsp">Logout</a></li>


                            </ul>
                            <p style = "color:white;">Copyright &copy 2020, All Rights Reserved by Nishachars</p>
                        </footer>

                        </form>
                        </body>
                        </html>

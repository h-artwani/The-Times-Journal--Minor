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

        <link rel = "stylesheet" href = "css\mark1.css">
        <link rel = "stylesheet" href = "css\mark2.css">
        <link rel = "stylesheet" href = "css\dropdown.css">

        <meta charset="utf-8">
        <meta name = "viewport" content = "width = device-width,initial-scale=1.0">
    </head>
    <body style="background-image: url('images_1/4.jpg');height:100%;background-size: cover;">
        <form  action="payment_his.jsp" method="get">
            <div>
                <h1 style="font-family:Old English Text MT;"><a href="welcomeCustomer.jsp"style="color:white;text-decoration:none;" >&nbsp The Times-Journal</a><h1>
                        <ul class="p2">
                            <li class="p3"><a href="login.jsp">Logout</a></li>
                            <li class="p3"><a href="contact_us_cust.jsp">Contact Us</a></li>
                            <li class="p3"> 
                                <div class="dropdown">
                 <button class="dropbtn"><span style="font-family:calibri;font-size:30px;float:right;"><b>About me</b></span> 
                        <i class="fa fa-caret-down"></i>
                        </button>
                                    <div class="dropdown-content">
                                        <a href="change_password_cust.jsp">Change Password</a>
                                        <a href="personal_details_cust.jsp">Personal Details</a>
                                    </div>
                            </li>
                            <li class="p3"><a href="cart.jsp">Show Cart</a></li>
                            <li class="p3"><a href="subscribe_newspaper.jsp">Subscribe Newspaper</a></li>
                            <li class="p3"><a href="payment_his.jsp">Payment History</a></li>
                            <li class="p3"><a href="welcomeCustomer.jsp">Home</a></li>
                        </ul>
                        </div><br/>
                        
						
                        <%
                            String username_from_login = request.getParameter("nds.username");
                            String dbUsername = "";
                            String dbEmail = "";
                            String dbPhoneNumber = "";
                            Connection conn = DbConnection.getConnection();
                            System.out.println("Username from login is " + username_from_login);
                            if (username_from_login != null) {
                                String sql = "select username,email,phone_number from Attributes where username='" + username_from_login + "'";
                                System.out.println("IS-USER Method Working=====================");
                                try {
                                    Statement st = conn.createStatement();
                                    ResultSet rs = st.executeQuery(sql);
                                    while (rs.next()) {
                                        dbUsername = rs.getString("username");
                                        dbEmail = rs.getString("email");
                                        dbPhoneNumber = rs.getString("phone_number");

                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }

                            String username = (String) session.getAttribute("Username");
                            String email = (String) session.getAttribute("Email");
                            String phone_number = (String) session.getAttribute("PhoneNumber");
                            System.out.println("Username is " + username);

                            System.out.println("email is " + email);

                            System.out.println("phone_number is " + phone_number);
                            if (username_from_login != null) {
                                session.setAttribute("Username", dbUsername);
                                session.setAttribute("Email", dbEmail);
                                session.setAttribute("PhoneNumber", dbPhoneNumber);
                            } else {
                                session.setAttribute("Username", username);
                                session.setAttribute("Email", email);
                                session.setAttribute("PhoneNumber", phone_number);
                            }
                            // username = (String) session.getAttribute("Username");
                            //email = (String) session.getAttribute("Email");

                            //phone_number = (String) session.getAttribute("PhoneNumber");
                            System.out.println("Username is " + username);

                            System.out.println("email is " + email);

                            System.out.println("phone_number is " + phone_number);


                        %>
                        <%                            if (username_from_login == null) {
                        %>
                        <h2 style="color:black;">Welcome Customer <%=username%> </h2><br/>
                        <%
                        } else {
                        %>
                        <h2 style="color:black;">Welcome Customer <%=username_from_login%> </h2><br/>
                        <%
                            }
                        %>
						<br/><br/>
        

                        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                        <br/>
                        <br/>

                        <br/>			
                        <footer >
                        <ul type =none>
                            <li class="line"><a href="welcomeCustomer.jsp">Home</a></li>
                            <li class="line"><a href="payment_his.jsp">Payment History</a></li>
                            <li class="line"><a href="subscribe_newspaper.jsp">Subscribe Newspaper</a></li>
                            <li class="line" ><a href="change_password_cust.jsp" >Change Password</a></li>
                            <li class="line"><a href="contact_us.jsp">Contact Us</a></li>
                            <li class="line"><a href="login.jsp">Logout</a></li>
                        </ul>
                        <p style = "color:white;">Copyright &copy 2020, All Rights Reserved by Nishachars</p>
                    </footer>
                    
                        </form>
                        </body>
                        </html>

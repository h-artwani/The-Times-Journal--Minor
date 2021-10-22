<%-- 
    Document   : payment_his
    Created on : 15 Mar, 2020, 5:51:17 PM
    Author     : harshartwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel = "stylesheet" href = "css\mark1.css"/>
        <link rel = "stylesheet" href = "css\mark2.css"/>
        <link rel = "stylesheet" href = "css\dropdown.css"/>
        <style>.registerbtn {
                background-color: grey;
                color:white;
                padding: 16px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 20%;
                opacity: 0.9;
            }</style>
        <meta charset="utf-8">
        <meta name = "viewport" content = "width = device-width,initial-scale=1.0">
    </head>
    <body style="background-image: url('images_1/4.jpg');height:100%;background-size: cover;">
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
                    <%@page import="java.sql.DriverManager"%>
                    <%@page import="java.sql.ResultSet"%>
                    <%@page import="java.sql.Statement"%>
                    <%@page import="java.sql.Connection"%>
                    <%
                        String username = (String) session.getAttribute("Username");
                        String email = (String) session.getAttribute("Email");
                        String phone_number = (String) session.getAttribute("PhoneNumber");
                        String category = "Customer";
                        System.out.println("Username is " + username);

                        System.out.println("email is " + email);

                        System.out.println("phone_number is " + phone_number);

                        System.out.println("category is " + category);

                        session.setAttribute("Username", username);
                        session.setAttribute("Email", email);
                        session.setAttribute("PhoneNumber", phone_number);
                        session.setAttribute("Category", category);

                    %>
                    <%            String id = request.getParameter("userId");
                        String driverName = "com.mysql.jdbc.Driver";
                        String connectionUrl = "jdbc:mysql://localhost:3306/";
                        String dbName = "NDS";
                        String userId = "root";
                        String password = "root";
                        String dbEmail = "";

                        try {
                            Class.forName(driverName);
                        } catch (ClassNotFoundException e) {
                            e.printStackTrace();
                        }

                        Connection connection = null;
                        Statement statement = null;
                        ResultSet resultSet = null;
                    %>

                    <h2 align="center" style="color: black;"><font ><strong>Personal Details</strong></font></h2>

                    <table align="center" cellpadding="5" cellspacing="5" border="1" style="background-color: black;border-radius: 3px;">
                        <tr>

                        </tr>
                        <%
                            try {
                                connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                statement = connection.createStatement();

                                System.out.println("Email id of user is " + email + "===================");
                                String sql2 = "SELECT * FROM Attributes where email ='" + email + "' and category='Customer'";

                                resultSet = statement.executeQuery(sql2);
                                while (resultSet.next()) {
                        %>
                        <tr bgcolor="grey">
                            <td><b>First Name</b></td>
                            <td bgcolor="white"><%=resultSet.getString("first_name")%></td>

                        </tr>
                        <tr bgcolor="grey">    
                            <td><b>Last Name</b></td>
                            <td bgcolor="white"><%=resultSet.getString("last_name")%></td>


                        </tr>    
                        <tr bgcolor="grey">    
                            <td><b>Email</b></td>
                            <td bgcolor="white"><%=resultSet.getString("email")%></td>

                        </tr>    
                        <tr bgcolor="grey">    
                            <td><b>Phone Number</b></td>
                            <td bgcolor="white"><%=resultSet.getString("phone_number")%></td>

                        </tr>    
                        <tr bgcolor="grey">    
                            <td><b>Username</b></td>
                            <td bgcolor="white"><%=resultSet.getString("username")%></td>

                        </tr>   
                        <tr bgcolor="grey">
                            <td><b>Email</b></td>
                            <td bgcolor="white"><%=resultSet.getString("email")%></td>

                        </tr>    
                        <tr bgcolor="grey">    
                            <td><b>Gender</b></td>
                            <td bgcolor="white"><%=resultSet.getString("gender")%></td>

                        </tr>    
                        <tr bgcolor="grey">    
                            <td><b>Age</b></td>
                            <td bgcolor="white"><%=resultSet.getString("age")%></td>

                        </tr>    
                        <tr bgcolor="grey">    
                            <td><b>Email Status</b></td>
                            <td bgcolor="white"><%=resultSet.getString("emailstatus")%></td>

                        </tr>


                        <%
                                }

                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                        <tr>
                            <td colspan="2" style="background-color:gray; height: 10px;"><button class="registerbtn"><a href='edit_personal_details.jsp' style="text-decoration: none;color: black;font-size:16px;background-color: grey;width: 15%;padding: 4px 200px; margin: 8px 0px;">Edit</a></button></td>
                        </tr>
                    </table>

                    <br/>
                    <br/>
                    <br/>			
                    <footer >
                        <ul type =none>
                            <li class="line"><a href="welcomeCustomer.jsp">Home</a></li>
                            <li class="line"><a href="payment_his.jsp">Payment History</a></li>
                            <li class="line"><a href="subscribe_newspaper.jsp">Subscribe Newspaper</a></li>
                            <li class="line" ><a href="change_password_cust.jsp" >Change Password</a></li>
                            <li class="line"><a href="contact_us_cust.jsp">Contact Us</a></li>
                            <li class="line"><a href="login.jsp">Logout</a></li>
                        </ul>
                        <p style = "color:white;">Copyright &copy 2020, All Rights Reserved by Nishachars</p>
                    </footer>
                    </body>
                    </html>

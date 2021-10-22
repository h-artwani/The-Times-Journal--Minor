<%-- 
    Document   : payment_his
    Created on : 15 Mar, 2020, 5:51:17 PM
    Author     : harshartwani
--%>

<%@page import="com.nds.db.DbConnection"%>
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
		<style>
			  button {
			  background-color: grey;
			  color: white;
			  padding: 14px 20px;
			  margin: 8px 0;
			  border: none;
			  cursor: pointer;
			  width: 100%;
			}
			input[type=text]{
			  width: 100%;
			  padding: 12px 20px;
			  margin: 8px 0 ;
			  display: inline-block;
			  border: 1px solid #ccc;
			  box-sizing: border-box;
			}


		</style>
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
                        System.out.println("Username is " + username);

                        System.out.println("email is " + email);

                        System.out.println("phone_number is " + phone_number);
                        session.setAttribute("Username", username);
                        session.setAttribute("Email", email);
                        session.setAttribute("PhoneNumber", phone_number);

                    %>
                    <%            

                        Connection connection = null;
                        Statement statement = null;
                        ResultSet resultSet = null;
                    %>
                    <form action="" method="get">
                        <table align="center">
                            <tr>
                                <th><center><input type="text" placeholder="Search Here..." name="q"></th>
                                <th> <button type="submit">Search</button></center></th>
                            </tr>
                        </table>
                    </form>
                    <h2 align="center" style="color: black;"><font><strong>Payment History :</strong></font></h2>

                    <table align="center" cellpadding="5" cellspacing="5" border="1" style="border-radius: 3px;border-style: double;background-color: black;">
                        <tr>

                        </tr>
                        <tr bgcolor="grey">
                            <td><b>id</b></td>
                            <td><b>Newspaper</b></td>
                            <td><b>Email</b></td>
                            <td><b>Address</b></td>
                            <td><b>Phone Number</b></td>
                            <td><b>Quantity</b></td>
                            <td><b>Payment Option</b></td>
                            <td><b>Amount Paid</b></td>
                        </tr>
                        <%
                            try {
                                connection = DbConnection.getConnection();
                                statement = connection.createStatement();

                                String data;
                                String query = request.getParameter("q");
                                if (query != null) {
                                    data = "Select * from Cart where (first_name LIKE '%" + query + "%' or title LIKE '%" + query + "%' or email LIKE '%" + query + "%' or address LIKE '%" + query + "%' or phone_number LIKE '%" + query + "%' or quantity LIKE '%" + query + "%' or payment_option LIKE '%" + query + "%') and payment_status= 'true' and email ='" + email + "' ";
                                } else {
                                    data = "SELECT * FROM Cart WHERE payment_status='true' and email ='" + email + "'";
                                }
                                resultSet = statement.executeQuery(data);
                                int i = 1;
                                while (resultSet.next()) {
                        %>
                        
                        <tr bgcolor="white">

                            <td><%=i%></td>
                            <td><%=resultSet.getString("title")%></td>
                            <td><%=resultSet.getString("email")%></td>
                            <td><%=resultSet.getString("address")%></td>
                            <td><%=resultSet.getString("phone_number")%></td>
                            <td><%=resultSet.getString("quantity")%></td>
                            <td><%=resultSet.getString("payment_option")%></td>
                            <td><%=resultSet.getString("amt_paid")%></td>


                        </tr>
						<%
                                    i++;
                                }

                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    
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

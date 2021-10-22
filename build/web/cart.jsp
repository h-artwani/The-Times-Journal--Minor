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
        <link rel = "stylesheet" href = "css\mark1.css">
        <link rel = "stylesheet" href = "css\mark2.css">
        <link rel = "stylesheet" href = "css\dropdown.css">

        <meta charset="utf-8">
        <meta name = "viewport" content = "width = device-width,initial-scale=1.0">

        <style>
            .registerbtn {
                background-color: grey;
                color:white;
                padding: 16px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 200px;
                opacity: 0.9;
            }

            .registerbtn:hover {
                opacity: 1;
            }
            .d{
                width: 200px;
                padding: 15px;
                margin: 5px 0 22px 0;
                display: inline-block;
                border: none;
                background: #f1f1f1;
            }

            .d:focus {
                background-color: #ddd;
                outline: none;
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
                        int total = 0;
                        int i = 1;
                        String[] a = new String[1000];

                        Connection connection = null;
                        Statement statement = null;
                        ResultSet resultSet = null;
                    %>
                    <form action="subscribe">
                        <h2 align="center" style="color: black;"><font><strong>Cart Details:</strong></font></h2>
                            <%
                                try {
                                    connection = DbConnection.getConnection();
                                    statement = connection.createStatement();

                                    String sql2 = "SELECT amt_paid FROM Cart where email ='" + email + "' and payment_status ='false'";

                                    resultSet = statement.executeQuery(sql2);
                                    while (resultSet.next()) {

                                        total += Integer.parseInt(resultSet.getString("amt_paid"));

                                    }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            %>

                        <%
                            if (total != 0) {
                        %>
                        <table align="center" cellpadding="5" cellspacing="5" border="1"style="border-radius: 3px;background-color: black;border-style:double;">
                            <tr>

                            </tr>
                            <tr bgcolor="grey">
                                <td><b>S. No.</b></td>
                                <td><b>Title</b></td>
                                <td><b>Email</b></td>
                                <td><b>Address</b></td>
                                <td><b>Phone Number</b></td>
                                <td><b>Quantity</b></td>
                                <td><b>Amount</b></td>
                            </tr>
                            <%
                                try {
                                    connection = DbConnection.getConnection();
                                    statement = connection.createStatement();

                                    System.out.println("Email id of user is " + email + "===================");
                                    String sql2 = "SELECT * FROM Cart where email ='" + email + "' and payment_status ='false'";

                                    resultSet = statement.executeQuery(sql2);
                                    while (resultSet.next()) {
                            %>
                            <tr bgcolor="white">

                                <td><%=i%></td>
                                <td><%=resultSet.getString("title")%></td>
                                <td><%=resultSet.getString("email")%></td>
                                <td><%=resultSet.getString("address")%></td>
                                <td><%=resultSet.getString("phone_number")%></td>
                                <td><%=resultSet.getString("quantity")%></td>
                                <td><%=resultSet.getString("amt_paid")%></td>
                                <td><a href='edit_cart.jsp?u=<%=resultSet.getString("id")%>' style="color: black;">Edit</a>
                                <td><a href='remove_cart.jsp?u=<%=resultSet.getString("id")%>' style="color: black;">Remove</a>
                                    <% a[i - 1] = resultSet.getString("id");
                                        System.out.println("All ids are ======" + a[i - 1]);
                                    %>


                            </tr>

                            <%
                                        i++;
                                    }

                                    System.out.println(
                                            "value of a is =====" + a);

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                                session.setAttribute("Total", total);
                                String first_id = a[0];
                                String last_id = a[i - 2];
                                System.out.println("First id =======" + first_id);
                                System.out.println("Last id id =======" + last_id);
                            %>
                        </table></br></br></br></br>
                        <center><b>Total Amount : <%=total%></b></br></br>
                            <input type="hidden" name="nds.amt_paid" value=<%=total%> readonly >
                            <input type="hidden" name="first_id" value=<%=first_id%> readonly >
                            <input type="hidden" name="last_id" value=<%=last_id%> readonly >

                            Select Payment Option : <select id="cars" class="d" name="nds.payment_option">
                                <option value="Debit_card">Debit Card</option>
                                <option value="Cash_on_Delivery">Cash on Delivery</option>
                                <option value="Credit_card">Credit Card</option>
                                <option value=""></option>
                            </select>
                            </br></br>

                            <button type="submit" class="registerbtn">Proceed to buy</button></center>
                            <% } else {
                            %>
                            <center>Your cart is empty, click  <a href='subscribe_newspaper.jsp'>here</a> to add newspaper into cart.</center></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>
                            <%
                                }
                            %>

                    </form>
                    <br/>
                    <br/>

                    <br/>			
                    <footer >
                        <ul type =none>
                            <li class="line"><a href="welcomeCustomer.jsp">Home</a></li>
                            <li class="line"><a href="payment_his.jsp">Payment History</a></li>
                            <li class="line"><a href="subscribe_newspaper.jsp">Subscribe Newspaper</a></li>
                            <li class="line" ><a href="personal_details_cust.jsp" >Personal Details</a></li>
                            <li class="line" ><a href="change_password_cust.jsp" >Change Password</a></li>
                            <li class="line"><a href="contact_us.jsp">Contact Us</a></li>
                            <li class="line"><a href="login.jsp">Logout</a></li>
                        </ul>
                        <p style = "color:white;">Copyright &copy 2020, All Rights Reserved by Nishachars</p>
                    </footer>
                    </body>
                    </html>

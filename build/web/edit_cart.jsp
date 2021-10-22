<%-- 
    Document   : payment_his
    Created on : 15 Mar, 2020, 5:51:17 PM
    Author     : harshartwani
--%>

<%@page import="com.nds.db.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel = "stylesheet" href = "css\mark1.css">
        <link rel = "stylesheet" href = "css\mark2.css">
        <link rel = "stylesheet" href = "css\edit_cart.css">

        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </head>
    <body style="background-image: url('images_1/4.jpg');height:100%;background-size: cover;">
        <div>
            <h1 style="font-family:Old English Text MT;"><a href="#"style="color:white;text-decoration:none;" >&nbsp The Times-Journal</a><h1>
                    <ul class="p2">
                        <li class="p3"><button onclick="goBack()"class="registerbtn1">Go Back</button></li>

                    </ul>
                    </div><br/>
                    <fieldset>
                        <form action='update_cart_details'>
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

                                String category = (String) session.getAttribute("Category");

                                String u = request.getParameter("u");
                                session.setAttribute("id", u);
                                int num = Integer.parseInt(u);

                                Connection connection = null;
                                Statement statement = null;
                                PreparedStatement stmt = null;
                                ResultSet resultSet = null;
                            %>

                            <%
                                try {
                                    connection = DbConnection.getConnection();
                                    statement = connection.createStatement();

                                    String sql2 = "SELECT * FROM Cart where email ='" + email + "' and id ='" + num + "'";

                                    resultSet = statement.executeQuery(sql2);
                                    while (resultSet.next()) {
                            %>
                            <input type="hidden" name="nds.id" value="<%=resultSet.getString("id")%>" >
                            <input type="hidden" name="nds.amt_paid" value="<%=resultSet.getString("amt_paid")%>" >
                            <table>
                                <tr>
                                    <th>Title</th>
                                    <th>Quantity</th>
                                </tr>
                                <tr>
                                    <th class="c">
                                        <%
                                            if (resultSet.getString("title").equals("Nai Duniya")) {
                                        %>
                                        <select id="newspaper" name="nds.title" class="e" >
                                            <option value="Nai Duniya" selected>Nai Duniya</option>
                                            <option value="Dainik Bhaskar">Dainik Bhaskar</option>
                                            <option value="Patrika" >Patrika</option>
                                            <option value="Hindustan Times">Hindustan Times</option>
                                            <option value="The Times of India">The Times of India</option>
                                        </select>
                                        <%
                                        } else if (resultSet.getString("title").equals("Dainik Bhaskar")) {
                                        %>
                                        <select id="newspaper" name="nds.title" class="e" >
                                            <option value="Nai Duniya">Nai Duniya</option>
                                            <option value="Dainik Bhaskar" selected>Dainik Bhaskar</option>
                                            <option value="Patrika">Patrika</option>
                                            <option value="Hindustan Times">Hindustan Times</option>
                                            <option value="The Times of India">The Times of India</option>
                                        </select>
                                        <%
                                        } else if (resultSet.getString("title").equals("Patrika")) {
                                        %>
                                        <select id="newspaper" name="nds.title" class="e" >
                                            <option value="Nai Duniya">Nai Duniya</option>
                                            <option value="Dainik Bhaskar">Dainik Bhaskar</option>
                                            <option value="Patrika" selected>Patrika</option>
                                            <option value="Hindustan Times">Hindustan Times</option>
                                            <option value="The Times of India">The Times of India</option>
                                        </select>
                                        <%
                                        } else if (resultSet.getString("title").equals("Hindustan Times")) {
                                        %>
                                        <select id="newspaper" name="nds.title" class="e" >
                                            <option value="Nai Duniya">Nai Duniya</option>
                                            <option value="Dainik Bhaskar">Dainik Bhaskar</option>
                                            <option value="Patrika" >Patrika</option>
                                            <option value="Hindustan Times" selected>Hindustan Times</option>
                                            <option value="The Times of India">The Times of India</option>
                                        </select>
                                        <%
                                        } else {
                                        %>
                                        <select id="newspaper" name="nds.title" class="e" >
                                            <option value="Nai Duniya">Nai Duniya</option>
                                            <option value="Dainik Bhaskar">Dainik Bhaskar</option>
                                            <option value="Patrika" >Patrika</option>
                                            <option value="Hindustan Times">Hindustan Times</option>
                                            <option value="The Times of India" selected>The Times of India</option>
                                        </select>
                                        <%
                                            }
                                        %>
                                    </th>

                                    <th style="margin-top:20px;"><input type="number" name="nds.quantity" placeholder="Quantity" min="1" value="<%=resultSet.getString("quantity")%>" ></th>
                                </tr>
                                <tr>
                                    <th>Email Id</th>
                                </tr>
                                <tr>
                                    <th><input type="email" name="nds.email" value="<%=resultSet.getString("email")%>" placeholder="Email Id" readonly></th>
                                </tr>
                                <tr>
                                    <th>Address </th>
                                </tr>
                                <tr>
                                    <th><input type="text" name="nds.address" placeholder="Address" value="<%=resultSet.getString("address")%>"></th>
                                </tr>
                                <tr>
                                    <th>Mobile Number</th>
                                </tr>
                                <tr>
                                    <th><input type="number" name="nds.phone_number" value="<%=resultSet.getString("phone_number")%>"placeholder="Mobile Number"></th>

                                </tr>

                            </table>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                            <button type="submit" class="registerbtn">Update</button>

                        </form>
                    </fieldset>
                    </body>
                    </html>

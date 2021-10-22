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
        <link rel = "stylesheet" href = "css\edit_personal_details.css"/>
        <link rel = "stylesheet" href = "css\mark1.css">
        <link rel = "stylesheet" href = "css\mark2.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


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
                        <form action='update_personal_details'>

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

                                Connection connection = null;
                                Statement statement = null;
                                PreparedStatement stmt = null;
                                ResultSet resultSet = null;
                            %>

                            <%
                                try {
                                    connection = DbConnection.getConnection();
                                    statement = connection.createStatement();

                                    String sql2 = "SELECT * FROM Attributes where email ='" + email + "' and category='" + category + "'";

                                    resultSet = statement.executeQuery(sql2);
                                    while (resultSet.next()) {
                                        System.out.println("=========age is " + resultSet.getString("age"));
                            %>

                            <input type="hidden" name="nds.id" value="<%=resultSet.getString("id")%>">
                            <br/> <br/>
                            <input type="hidden" name="nds.category" value="<%=category%>">
                            <br/> <br/>
                            <center> <label for="uname"><b>First Name</b></label>
                                <input type="text" placeholder="Enter First Name" name="nds.first_name" value="<%=resultSet.getString("first_name")%>" required>
                                <br/> <br/>
                                <label for="uname"><b>Last Name</b></label>
                                <input type="text" placeholder="Enter Last Name" name="nds.last_name" value="<%=resultSet.getString("last_name")%>" required>
                                <br/> <br/>
                                <label for="uname"><b>Email</b></label></br>
                                <input type="text" placeholder="Enter email" name="nds.email" value="<%=resultSet.getString("email")%>" required>
                                <br/>
                                <br/>
                                <label for="psw"><b>Phone Number</b></label>
                                <input type="text" placeholder="Enter Phone Number" name="nds.phone_number" value="<%=resultSet.getString("phone_number")%>" required>
                                <br/>
                                <br/> 
                                <label for="psw"><b>Username</b></label>
                                <input type="text" placeholder="Enter Username" name="nds.username" value="<%=resultSet.getString("username")%>" readonly required>
                                <br/>
                                <br/> 
                                <label for="psw"><b>Age</b></label></br>
                                <input type="text" placeholder="Enter Age" name="nds.age" value="<%=resultSet.getString("age")%>" required>
                                <br/>
                                <br/>
                                <%
                                    if (resultSet.getString("gender").equals("Male")) {
                                %>
                                <b>Gender</b></th></br></br>
                                <input type = "radio" name ="nds.gender" value = "Male" checked>Male
                                <input type = "radio" name ="nds.gender" value = "Female">Female
                                <input type = "radio" name ="nds.gender" value = "Other">Other
                                <br/>
                                <br/> 
                                <br/> 
                                <%
                                } else if (resultSet.getString("gender").equals("Female")) {
                                %>
                                <b>Gender</b></th></br></br>
                                <input type = "radio" name ="nds.gender" value = "Male">Male
                                <input type = "radio" name ="nds.gender" value = "Female" checked>Female
                                <input type = "radio" name ="nds.gender" value = "Other">Other
                                <br/>
                                <br/> 
                                <br/> 
                                <%
                                } else {
                                %>
                                <b>Gender</b></th></br></br>
                                <input type = "radio" name ="nds.gender" value = "Male">Male
                                <input type = "radio" name ="nds.gender" value = "Female">Female
                                <input type = "radio" name ="nds.gender" value = "Other" checked>Other
                                <br/>
                                <br/> 
                                <br/> 
                                <%
                                    }
                                    String email_status = resultSet.getString("emailstatus");
                                    if (email_status.equals("false")) {
                                %>
                                Your Email id is not Verified. Please click <a href='for_email_veri.jsp?email=<%=resultSet.getString("email")%>&name=<%=resultSet.getString("first_name")%>&category=<%=category%>'>here</a> for verifying your email address.
                                <br/>
                                <br/> 

                                <%} else if (email_status.equals("true")) {
                                %>
                                Your Email id is Verified.
                                </br>
                            </center>
                            <%
                                        }
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                            <button type="submit"class="registerbtn">Update</button>

                        </form>
                    </fieldset>

                    </body>
                    </html>

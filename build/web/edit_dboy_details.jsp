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
        <link rel = "stylesheet" href = "css\edit_dboy.css"/>
        <link rel = "stylesheet" href = "css\mark1.css"/>
        <link rel = "stylesheet" href = "css\mark2.css"/>
        
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
                    </div><br/><br/>
        
        <fieldset>
        <form action='update_dboy_details'>
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

                Connection connection = null;
                Statement statement = null;
                PreparedStatement stmt = null;
                ResultSet resultSet = null;
            %>

            <%
                try {
                    String u = request.getParameter("u");
                    session.setAttribute("id", u);
                    int num = Integer.parseInt(u);
                    connection = DbConnection.getConnection();
                    statement = connection.createStatement();

                    String sql2 = "SELECT * FROM Delivery_Boy where id='" + num + "'";

                    resultSet = statement.executeQuery(sql2);
                    while (resultSet.next()) {
            %>
        
		    
            <center>
            <input type="hidden" name="nds.id" value="<%=u%>">
            <br/> <br/>
            <label for="uname"><b>Name of Delivery Boy</b></label>
            <input type="text" placeholder="Enter Name of Delivery Boy" name="nds.name_dboy" value="<%=resultSet.getString("name_dboy")%>" required>
            <br/> <br/>
            <label for="uname"><b>Name of Customer</b></label>
            <input type="text" placeholder="Enter Name of Customer" name="nds.name_cust" value="<%=resultSet.getString("name_cust")%>" required>
            <br/>
            <br/>
            <label for="psw"><b>Contact Number of Delivery Boy</b></label>
            <input type="text" placeholder="Enter Contact Number of Delivery Boy" name="nds.c_no_dboy" value="<%=resultSet.getString("c_no_dboy")%>" required>
            <br/>
            <br/> 
            <label for="psw"><b>Contact Number of Customer</b></label>
            <input type="text" placeholder="Enter Contact Number of Customer" name="nds.c_no_cust" value="<%=resultSet.getString("c_no_cust")%>" required>
            <br/>
            <br/> 
            <label for="psw"><b>Address of Customer</b></label>
            <input type="text" placeholder="Enter Address of Customer" name="nds.address" value="<%=resultSet.getString("address")%>" required>
            <br/>
            <br/> 
            <button class="registerbtn" type="submit">Update</button>
            </center>
            
            <%
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </form>
        </fieldset>
		<br/>
            
    </body>
</html>

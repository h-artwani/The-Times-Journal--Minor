<%-- 
    Document   : customer_details
    Created on : 1 Mar, 2020, 7:04:02 PM
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

        <meta charset="utf-8">
        <meta name = "viewport" content = "width = device-width,initial-scale=1.0">
		<style>
			  .registerbtn {
			  background-color: grey;
			  color: white;
			  padding: 12px 20px;
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

        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>

        <%
            String id = request.getParameter("userId");
            String driverName = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String dbName = "NDS";
            String userId = "root";
            String password = "root";

            try {
                Class.forName(driverName);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>

        <form action="" method="get">
		<table align="center">
		<tr>
            <th><center><input type="text" placeholder="Search Here..." name="q"></th>
            <th><button type="submit"class="registerbtn">Search</button></center></th>
		</tr>
		</table>


        </form>
        <h2 align="center" style="color:black;"><font><strong>Vendor Details</strong></font></h2>
        <table align="center" cellpadding="5" cellspacing="5" border="1" style="background-color:black;border-style:double;border-radius:3px;">
            <tr>

            </tr>
            <tr bgcolor="grey">
                <td><b>id</b></td>
                <td><b>first_name</b></td>
                <td><b>last_name</b></td>
                <td><b>email</b></td>
                <td><b>username</b></td>
                <td><b>gender</b></td>
                <td><b>age</b></td>
            </tr>
            <%
                try {
                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                    statement = connection.createStatement();
                    String query = request.getParameter("q");
                    String data;
                    if (query != null) {
                        data = "Select * from Attributes where (first_name LIKE '%" + query + "%' or last_name LIKE '%" + query + "%' or email LIKE '%" + query + "%' or username LIKE '%" + query + "%' or gender LIKE '%" + query + "%' or age LIKE '%" + query + "%')  and category='Vendor'";
                    } else {
                        data = "SELECT * FROM Attributes WHERE category='Vendor'";
                    }
                    resultSet = statement.executeQuery(data);
                    int i = 1;
                    while (resultSet.next()) {
            %>
            <tr bgcolor="white">

                <td><%=i%></td>
                <td><%=resultSet.getString("first_name")%></td>
                <td><%=resultSet.getString("last_name")%></td>
                <td><%=resultSet.getString("email")%></td>
                <td><%=resultSet.getString("username")%></td>
                <td><%=resultSet.getString("gender")%></td>
                <td><%=resultSet.getString("age")%></td>

            </tr>
			<%
                        i++;
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
		<br/><br/><br/><br/><br/><br/><br/><br/>
				
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
    </body>
</html>

<%-- 
    Document   : payment_his
    Created on : 15 Mar, 2020, 5:51:17 PM
    Author     : harshartwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		<style>
		  input[type=text]{
		  width: 700px;
		  padding: 15px;
		  margin: 5px 0 22px 0;
		  display: inline-block;
		  border: none;
		  background: #f1f1f1;
		}
      	  .registerbtn {
		  background-color: grey;
		  color:white;
		  padding: 15px;
		  margin: 5px 0 22px 0;
		  border: none;
		  cursor: pointer;
		  width: 100%;
		  opacity: 0.9;
		}
		</style>
			
		<link rel = "stylesheet" href = "css\mark1.css">
        <link rel = "stylesheet" href = "css\mark2.css">
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
            String id = request.getParameter("userId");
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
        <form action="" method="get">
		<table align="center" style="">
		<tr>
            <th><center><input type="text" placeholder="Search Here..." name="q"></th>
			<th><button type="submit"class="registerbtn">Search</button></center></th>
		</tr>
		</table>


        </form>
        <h2 align="center" style="color:black;"><font><strong>Subscribed Customers</strong></font></h2>

        <table align="center" cellpadding="5" cellspacing="5" border="1"  style="border-radius:3px;border-style:double;background-color:black;width:80%;">
            <tr>

            </tr>
            <tr bgcolor="grey">
                <td><b>id</b></td>
                <td><b>Name </b></td>
                <td><b>Newspaper</b></td>
                <td><b>Email</b></td>
                <td><b>Address</b></td>
                <td><b>Phone Number</b></td>
                <td><b>Quantity</b></td>
                <td><b>Payment Option</b></td>
                <td><b>Amount</b></td>
            </tr>
           <%
                try {
                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                    statement = connection.createStatement();

                    System.out.println("Email id of user is " + email + "===================");
                    String data;
                    String query = request.getParameter("q");
                    if (query != null) {
                        data = "Select * from Cart where (first_name LIKE '%" + query + "%' or title LIKE '%" + query + "%' or email LIKE '%" + query + "%' or address LIKE '%" + query + "%' or phone_number LIKE '%" + query + "%' or quantity LIKE '%" + query + "%' or payment_option LIKE '%" + query + "%') and payment_status= 'true' ";
                    } else {
                        data = "SELECT * FROM Cart WHERE payment_status='true'";
                    }
                    resultSet = statement.executeQuery(data);
                    int i = 1;
                    while (resultSet.next()) {

            %>
            <tr bgcolor="white">

                <td><%=i%></td>
                <td><%=resultSet.getString("first_name")%></td>
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

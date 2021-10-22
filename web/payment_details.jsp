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
        <%            String id = request.getParameter("userId");
           
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>
        <form action="" method="get">
		<table align="center" >
		<tr>
           <th> <center><input type="text" placeholder="Search Here..." name="q"></th>
               <th> <button type="submit" class="registerbtn">Search</button></center></th>
</tr>
</table>

        </form>
       
        <h2 align="center" style="color:black;"><font><strong>Payment Details of Customers</strong></font></h2>
           
        <table align="center" cellpadding="5" cellspacing="5" border="1" style="border-radius: 3px;border-style:double;background-color: black;">
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
                    connection = DbConnection.getConnection();
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

    </body>
</html>


<%@page import="com.nds.db.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<html>
    <head>
        <title>Bill</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel = "stylesheet" href = "css\bill2.css"/>
        <link rel = "stylesheet" href = "css\mark1.css"/>
        <link rel = "stylesheet" href = "css\mark2.css"/>
        <link rel = "stylesheet" href = "css\dropdown.css"/>
    </head>

    <body style="background-image: url('images_1/16.jpg');height:100%;background-size: cover;">
        <div>
            <h1 style="font-family:Old English Text MT;"><a href="welcomeCustomer.jsp"style="color:white;text-decoration:none;" >&nbsp The Times-Journal</a><h1>
                    <ul class="p2">
                        <li class="p3"><a href="login.jsp">Logout</a></li>
                        <li class="p3"><a href="contact_us_cust.jsp">Contact Us</a></li>
                        <li class="p3"> <div class="dropdown">
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
                    </div>
                    <br/>
                    <h1><%
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

                        <%                                Connection connection = DbConnection.getConnection();
                            String dbfirst_name = "";
                            String dblast_name = "";
                            String name = "";
                            String sql = "select first_name,last_name from Attributes where email='" + email + "' and category='Customer'";
                            try {
                                Statement st = connection.createStatement();
                                ResultSet rs = st.executeQuery(sql);
                                System.out.println("Hello=====");
                                while (rs.next()) {
                                    dbfirst_name = rs.getString("first_name");
                                    dblast_name = rs.getString("last_name");

                                    name = dbfirst_name + " " + dblast_name;
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>


                    </h1>



                    <fieldset>
                        <form action="add_cart">
                            <table>
                                <tr>
                                    <th>Title</th>
                                    <th align="center">Quantity</th>
                                </tr>
                                <tr>
                                    <th class="c">

                                        <select id="newspaper" name="nds.title" style="text-align:center; left-margin:10px;" class="d">
                                            <option value="Nai Duniya">Nai Duniya</option>
                                            <option value="Dainik Bhaskar">Dainik Bhaskar</option>
                                            <option value="Patrika">Patrika</option>
                                            <option value="Hindustan Times">Hindustan Times</option>
                                            <option value="The Times of India">The Times of India</option>
                                        </select>
                                    </th>

                                    <th><input type="number" name="nds.quantity" placeholder="Quantity" min="1" required></th>
                                    <th><input type="hidden" name="nds.first_name" value="<%=name%>"></th>
                                <tr>
                                    <th>Email Id</th>
                                </tr>
                                <tr>
                                    <th><input type="email" name="nds.email" value="<%=email%>" placeholder="Email Id" readonly></th>
                                </tr>
                                <tr>
                                    <th>Address </th>
                                </tr>
                                <tr>
                                    <th><input type="text" name="nds.address" placeholder="Address" required></th>
                                </tr>
                                <tr>
                                    <th>Mobile Number</th>
                                </tr>
                                <tr>
                                    <th><input type="number" name="nds.phone_number" value="<%=phone_number%>"placeholder="Mobile Number" required></th>

                                </tr>

                                <tr>
                                    <th><button type="submit" class="registerbtn">Add to Cart</button></th>
                                    <th><button type="reset" class="registerbtn">Reset</button></th>
                                </tr>
                            </table>
                        </form>
                    </fieldset>
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
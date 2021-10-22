
<html>
    <head>
        <title>Bill</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel = "stylesheet" href = "css\bill1.css"/>
        <link rel = "stylesheet" href = "css\mark1.css"/>
        <link rel = "stylesheet" href = "css\mark2.css"/>
    </head>
    <body style="background-image: url('images_1/3.jpg');">

        <div>
            <h1 style="font-family:Old English Text MT;"><a href="#"style="color:white;text-decoration:none;" >&nbsp The Times-Journal</a><h1>
                    <ul class="p2">
                        <li class="p3"><a href="cart.jsp">Go Back</a></li>

                    </ul>
                    </div>	<br/>
                    <br/>
                    <fieldset>
                        <form action="payment_status"><br/>
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
                                session.setAttribute("Email1", request.getParameter("nds.email"));
                                session.setAttribute("PaymentOption", request.getParameter("nds.payment_option"));
                                session.setAttribute("Address", request.getParameter("nds.address"));
                            %>
                            <%
                                System.out.println("Payment Method is : " + request.getParameter("nds.payment_option"));
                                String total=request.getParameter("nds.amt_paid");
                                String first_id=request.getParameter("first_id");
                                String last_id=request.getParameter("last_id");
                                System.out.println("Last_id is ===="+last_id);
                                session.setAttribute("First_Id", first_id);
                                session.setAttribute("Last_Id", last_id);
                            %>
                            <table>
                                <% if (request.getParameter("nds.payment_option").equals("Debit_card")) { %>
                                <center><b><u>Debit Card:</u></b></center>
                                            <% } else if (request.getParameter("nds.payment_option").equals("Credit_card")) { %>
                                <center><b><u>Credit Card:</u></b></center>
                                            <% }%>
                                <tr>
                                    <th>Card Number</th>
                                    <th>Name on Card </th>
                                </tr>
                                <tr>
                                    <th><input type="number" name="credit card number" placeholder="Credit Card number"></th>
                                    <th><input type="text" name="Name" placeholder="Name on Credit Card"></th>
                                    <th><input type="hidden" name="last_id" value="<%=last_id%>"placeholder="Name on Credit Card"></th>
                                    <th><input type="hidden" name="first_id" value="<%=first_id%>" placeholder="Name on Credit Card"></th>
                                </tr>
                                <tr>
                                    <th>Card Type</th>
                                    <th>Expiry Date </th>
                                </tr>
                                <tr>
                                    <th><select id="cars" class="a">
                                            <option value="prepaid_card">Prepaid Cards</option>
                                            <option value="student_card">Student Credit Card</option>
                                            <option value="postpaid_card">Postpaid Credit </option>
                                            <option value="Business_card">Business Card</option>
                                        </select></th>
                                    <th><input type="date" name="date" placeholder="Date"></th>
                                </tr>
                                <tr>
                                    <th>CVV Number</th>
                                </tr>

                                <th><input type="number" name="cvv_number" placeholder="CVV Number"></th>

                                <tr>
                                    <th>Amount Paid</th>
                                </tr>
                                <tr>
                                    <th><input type="number" name="amount" value=<%=total%> readonly ></th>
                                </tr>
                                <tr>	
                                    <input type="hidden" name="nds.email" value=<%=email%> readonly >
                                    <th><button type="submit" class="registerbtn">Make Payment</button></th>
                                    <th><button type="reset" class="registerbtn">Cancel Payment</button></th>
                                </tr>
                            </table>
                        </form>		
                    </fieldset>
                    <br/><br/>

                    <footer >

                        <p style = "color:white;">Copyright &copy 2020, All Rights Reserved by Nishachars</p>
                    </footer>
                    </body>


                    </html>
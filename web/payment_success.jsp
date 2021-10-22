<%-- 
    Document   : error
    Created on : 04-Mar-2019, 11:07:53
    Author     : vijayartwani
--%>


<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.nds.dto.NDS"%>
<%@page import="com.nds.db.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> </title>
        <script>
            alert("Payment Successful!");
        </script>  
        <script type="text/javascript">
            function load()
            {
                window.location.href = "welcomeCustomer.jsp";

            }
        </script>
    </head>

    <body onload="load()">
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
        <%            String email1 = (String) session.getAttribute("Email1");
            String payment_option = (String) session.getAttribute("PaymentOption");
            String last_id = request.getParameter("last_id");
            int last = Integer.parseInt(last_id);
            System.out.println("Last id is =====" + last);
            String first_id = request.getParameter("first_id");
            int first = Integer.parseInt(first_id);
            System.out.println("FIRST id is =====" + first);

            Connection conn = DbConnection.getConnection();
            System.out.println("================ADD USER method started Working====================");
            for (int i = last; i >= first; i--) {
                System.out.println("i am in loop ");
                String sql = "Update Cart set payment_option='" + payment_option + "' where id='" + i + "'";
                Boolean flag = true;
                try {
                    PreparedStatement st = conn.prepareStatement(sql);
                    st.execute();

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            System.out.println("================ADD USER method WORKED PROPERLY====================");
            //sendMail(first_name, email);

        %>
    </body>
</html>

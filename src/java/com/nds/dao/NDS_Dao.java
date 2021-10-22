/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nds.dao;

import com.nds.db.DbConnection;
import com.nds.dto.NDS;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author harshartwani
 */
public class NDS_Dao {

    public static String addUser(NDS nds) {
        boolean flag = true;
        Connection conn = DbConnection.getConnection();
        String id = "";
        String email = nds.getEmail();
        String first_name = nds.getFirst_name();
        String last_name = nds.getLast_name();
        String password = nds.getPassword();
        String phone_number = nds.getPhone_number();
        String username = nds.getUsername();
        String age = nds.getAge();
        String category = nds.getCategory();
        String gender = nds.getGender();
        String emailstatus = "false";
        System.out.println("================ADD USER method started Working====================");
        Boolean flag1 = isEmailValid(email, category, id);
        Boolean flag2 = isUserNameValid(username);
        if (!flag1 && !flag2) {
            String sql = "insert into Attributes(first_name,last_name,email,phone_number,username,password,gender,age,category,emailstatus)values(?,?,?,?,?,?,?,?,?,?)";
            try {
                System.out.println("================ADD USER method in PROGRESS====================");

                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, first_name);
                ps.setString(2, last_name);
                ps.setString(3, email);
                System.out.println("================ADD USER method in PROGRESS====================");

                ps.setString(4, phone_number);
                ps.setString(5, username);
                ps.setString(6, password);
                System.out.println("================ADD USER method in PROGRESS====================");
                ps.setString(7, gender);
                ps.setString(8, age);
                ps.setString(9, category);
                ps.setString(10, emailstatus);
                System.out.println("================ADD USER method WORKING====================");

                flag = ps.execute();
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println("================ADD USER method WORKED PROPERLY====================");
            sendMail(first_name, email, category);
            return "success";
        } else if (flag1 && !flag2) {
            return "emailexist";
        } else if (!flag1 && flag2) {
            return "usernameexist";
        } else {
            return "success";
        }
    }

    public static boolean addDeliveryBoy(NDS nds) {
        boolean flag = true;
        Connection conn = DbConnection.getConnection();
        String name_dboy = nds.getName_dboy();
        String name_cust = nds.getName_cust();
        String c_no_dboy = nds.getC_no_dboy();
        String c_no_cust = nds.getC_no_cust();
        String address = nds.getAddress();
        String vendor_name = nds.getVendor_name();

        System.out.println("================ADD USER method started Working====================");
        String sql = "insert into Delivery_Boy(name_dboy,name_cust,c_no_dboy,c_no_cust,address,vendor_name)values(?,?,?,?,?,?)";
        try {
            System.out.println("================ADD USER method in PROGRESS====================");

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name_dboy);
            ps.setString(2, name_cust);
            ps.setString(3, c_no_dboy);
            ps.setString(4, c_no_cust);
            ps.setString(5, address);
            ps.setString(6, vendor_name);
            System.out.println("================ADD USER method in PROGRESS====================");

            System.out.println("================ADD USER method WORKING====================");

            flag = ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("================ADD USER method WORKED PROPERLY====================");
        //sendMail(first_name, email);
        return flag;

    }

    public static boolean update_Dboy_Details(NDS nds) {
        boolean flag = true;
        Connection conn = DbConnection.getConnection();
        String id = nds.getId();
        String name_dboy = nds.getName_dboy();
        String name_cust = nds.getName_cust();
        String c_no_dboy = nds.getC_no_dboy();
        String c_no_cust = nds.getC_no_cust();
        String address = nds.getAddress();
        String vendor_name = nds.getVendor_name();

        System.out.println("================ADD USER method started Working====================");
        String sql = "Update Delivery_Boy set name_dboy=?, name_cust=?, c_no_dboy=?, c_no_cust=?, address=? where id='" + id + "'";
        try {
            System.out.println("================ADD USER method in PROGRESS====================");

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name_dboy);
            ps.setString(2, name_cust);
            ps.setString(3, c_no_dboy);
            ps.setString(4, c_no_cust);
            ps.setString(5, address);
            System.out.println("================ADD USER method in PROGRESS====================");

            System.out.println("================ADD USER method WORKING====================");

            flag = ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("================ADD USER method WORKED PROPERLY====================");
        //sendMail(first_name, email);
        return flag;

    }

    public static boolean update_Personal_Details(NDS nds) {
        boolean flag = true;
        Connection conn = DbConnection.getConnection();
        String id = nds.getId();
        String email = nds.getEmail();
        String first_name = nds.getFirst_name();
        String last_name = nds.getLast_name();
        String phone_number = nds.getPhone_number();
        String username = nds.getUsername();
        String age = nds.getAge();
        String gender = nds.getGender();

        System.out.println("================ADD USER method started Working====================");
        String sql3 = "Update Attributes set first_name=?, last_name=?, email=?, phone_number=?, username=?, gender=?, age=? where id='" + id + "'";
        try {
            System.out.println("================ADD USER method in PROGRESS====================");

            PreparedStatement ps = conn.prepareStatement(sql3);
            ps.setString(1, first_name);
            ps.setString(2, last_name);
            ps.setString(3, email);
            ps.setString(4, phone_number);
            ps.setString(5, username);
            ps.setString(6, gender);
            ps.setString(7, age);
            System.out.println("================ADD USER method in PROGRESS====================");

            System.out.println("================ADD USER method WORKING====================");

            flag = ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("================ADD USER method WORKED PROPERLY====================");
        //sendMail(first_name, email);
        return flag;

    }

    public static boolean updatePassword(String password, String email, String category) {
        boolean flag = true;
        Connection conn = DbConnection.getConnection();

        System.out.println("================ADD USER method started Working====================");
        String sql3 = "Update Attributes set password='" + password + "' where email='" + email + "' and category ='" + category + "'";
        try {
            System.out.println("================ADD USER method in PROGRESS====================");

            PreparedStatement ps = conn.prepareStatement(sql3);
            System.out.println("================ADD USER method in PROGRESS====================");

            System.out.println("================ADD USER method WORKING====================");

            flag = ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("================ADD USER method WORKED PROPERLY====================");
        //sendMail(first_name, email);
        return flag;

    }

    public static boolean update_cart_details(NDS nds) {
        boolean flag = true;
        Connection conn = DbConnection.getConnection();
        String id = nds.getId();
        String email = nds.getEmail();
        String title = nds.getTitle();
        String phone_number = nds.getPhone_number();
        String address = nds.getAddress();
        int quantity = Integer.parseInt(nds.getQuantity());
        int amt_paid = 0;
        if (title.equals("Nai Duniya")) {
            amt_paid += quantity * 100;
        }
        if (title.equals("Dainik Bhaskar")) {
            amt_paid += quantity * 90;
        }
        if (title.equals("Patrika")) {
            amt_paid += quantity * 85;
        }
        if (title.equals("Hindustan Times")) {
            amt_paid += quantity * 95;
        }
        if (title.equals("The Times of India")) {
            amt_paid += quantity * 110;
        }
        System.out.println("================ADD USER method started Working====================");
        String sql = "Update Cart set title=?, email=?, address=?, phone_number=?, quantity=?, amt_paid=? where id='" + id + "'";
        try {
            System.out.println("================ADD USER method in PROGRESS====================");

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, email);
            ps.setString(3, address);
            ps.setString(4, phone_number);
            ps.setInt(5, quantity);
            ps.setInt(6, amt_paid);
            System.out.println("================ADD USER method in PROGRESS====================");

            System.out.println("================ADD USER method WORKING====================");

            flag = ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("================ADD USER method WORKED PROPERLY====================");
        //sendMail(first_name, email);
        return flag;

    }

    public static boolean addContactInfo(NDS nds) {
        boolean flag = true;
        Connection conn = DbConnection.getConnection();
        String email = nds.getEmail();
        String first_name = nds.getFirst_name();
        String subject = nds.getSubject();
        String message = nds.getMessage();
        String phone_number = nds.getPhone_number();
        String category = nds.getCategory();

        System.out.println("================ADD USER method started Working====================");
        String sql = "insert into Contact_Us(first_name,email,phone_number,subject,message,category)values(?,?,?,?,?,?)";
        try {
            System.out.println("================ADD USER method in PROGRESS====================");

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, first_name);
            ps.setString(2, email);
            ps.setString(3, phone_number);
            ps.setString(4, subject);
            ps.setString(5, message);
            ps.setString(6, category);
            System.out.println("================ADD USER method in PROGRESS====================");

            System.out.println("================ADD USER method WORKING====================");

            flag = ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("================ADD USER method WORKED PROPERLY====================");
        //sendMail(first_name, email);
        return flag;

    }

    public static boolean addToCart(NDS nds) {
        boolean flag = true;
        Connection conn = DbConnection.getConnection();
        String name = nds.getFirst_name();
        String email = nds.getEmail();
        String title = nds.getTitle();
        String address = nds.getAddress();
        int amt_paid = 0;
        String phone_number = nds.getPhone_number();
        int quantity = Integer.parseInt(nds.getQuantity());

        if (title.equals("Nai Duniya")) {
            amt_paid += quantity * 100;
        }
        if (title.equals("Dainik Bhaskar")) {
            amt_paid += quantity * 90;
        }
        if (title.equals("Patrika")) {
            amt_paid += quantity * 85;
        }
        if (title.equals("Hindustan Times")) {
            amt_paid += quantity * 95;
        }
        if (title.equals("The Times of India")) {
            amt_paid += quantity * 110;
        }
        System.out.println("Amount Paid is=======" + amt_paid);
        System.out.println("================ADD USER method started Working====================");
        String sql = "insert into Cart(first_name,title,email,address,phone_number,quantity,amt_paid)values(?,?,?,?,?,?,?)";
        try {
            System.out.println("================ADD USER method in PROGRESS====================");

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, title);
            ps.setString(3, email);
            ps.setString(4, address);
            ps.setString(5, phone_number);
            ps.setInt(6, quantity);
            ps.setInt(7, amt_paid);
            System.out.println("================ADD USER method in PROGRESS====================");

            System.out.println("================ADD USER method WORKING====================");

            flag = ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("================ADD USER method WORKED PROPERLY====================");
        //sendMail(first_name, email);
        return flag;

    }

    public static int isUserValid(String username, String password, String category) {

        Connection conn = DbConnection.getConnection();
        String sql = "select username,password,category from Attributes";
        System.out.println("IS-USER Method Working=====================");
        int flag = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                String dbUsername = rs.getString("username");
                String dbPassword = rs.getString("password");
                String dbCategory = rs.getString("category");

                if (username.equals(dbUsername) && password.equals(dbPassword) && category.equals(dbCategory)) {
                    System.out.println("Values ARE CHECKED============ND SAME");
                    flag = 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public static int isValid(String email, String category) {

        Connection conn = DbConnection.getConnection();
        String sql = "select email,category from Attributes";
        System.out.println("IS-USER Method Working=====================");
        int flag = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                String dbEmail = rs.getString("email");
                String dbCategory = rs.getString("category");

                if (email.equals(dbEmail) && category.equals(dbCategory)) {
                    System.out.println("Values ARE CHECKED============ND SAME");

                    flag = 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public static int isAdminValid(String password) {

        Connection conn = DbConnection.getConnection();
        String sql = "select password from Admin_Credentials where username = 'admin'";
        System.out.println("IS-USER Method Working=====================");
        int flag = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                String dbPassword = rs.getString("password");

                if (password.equals(dbPassword)) {
                    System.out.println("Values ARE CHECKED============ND SAME");
                    flag = 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public static boolean isPasswordChanged(String username, String o_password, String n_password) {

        Connection conn = DbConnection.getConnection();
        String sql = "SELECT password FROM Attributes where username='" + username + "'";
        System.out.println("IS-USER Method Working=====================");
        boolean flag = false;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                String dbPassword = rs.getString("password");
                System.out.println("Password from DB is " + dbPassword + "=====================");
                if (o_password.equals(dbPassword)) {
                    String sql_que = "UPDATE Attributes SET password='" + n_password + "' where username='" + username + "'";
                    PreparedStatement ps = conn.prepareStatement(sql_que);
                    flag = ps.execute();
                    System.out.println("I AM IN IF STATEMENT==========");
                    System.out.println("VALUE OF FLAG IS " + flag + " IN IF============");

                } else {
                    flag = true;
                    System.out.println("I AM IN ELSE STATEMENT==========");
                    System.out.println("VALUE OF FLAG IS " + flag + " IN ELSE============");
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    public static boolean isPasswordChangedAdm(String username, String o_password, String n_password) {

        Connection conn = DbConnection.getConnection();
        String sql = "SELECT password FROM Admin_Credentials where username='" + username + "'";
        System.out.println("IS-USER Method Working=====================");
        boolean flag = false;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                String dbPassword = rs.getString("password");
                System.out.println("Password from DB is " + dbPassword + "=====================");
                if (o_password.equals(dbPassword)) {
                    String sql_que = "UPDATE Admin_Credentials SET password='" + n_password + "' where username='" + username + "'";
                    PreparedStatement ps = conn.prepareStatement(sql_que);
                    flag = ps.execute();
                    System.out.println("I AM IN IF STATEMENT==========");
                    System.out.println("VALUE OF FLAG IS " + flag + " IN IF============");

                } else {
                    flag = true;
                    System.out.println("I AM IN ELSE STATEMENT==========");
                    System.out.println("VALUE OF FLAG IS " + flag + " IN ELSE============");
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    public static Boolean isEmailValid(String email, String category, String id) {

        Connection conn = DbConnection.getConnection();
        String sql = "";
        if (id.equals("")) {
            sql = "select email,category from Attributes";
        } else {
            sql = "select email,category from Attributes where id!=" + id;
        }
        Boolean flag = false;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                String dbEmail = rs.getString("email");
                String dbCategory = rs.getString("category");

                if (email.equals(dbEmail) && category.equals(dbCategory)) {
                    flag = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public static Boolean isUserNameValid(String username) {

        Connection conn = DbConnection.getConnection();
        String sql = "select username from Attributes";
        Boolean flag = false;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                String dbUsername = rs.getString("username");

                if (username.equals(dbUsername)) {
                    flag = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public static int isOTPVaild(String otp, String email, String category) {

        Connection conn = DbConnection.getConnection();
        String sql = "select otp from Attributes where email ='" + email + "' and category ='" + category + "'";
        int flag = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                String dbOtp = rs.getString("otp");

                if (otp.equals(dbOtp)) {
                    flag = 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public static void sendMail(String name, String to, String category) {
        //Get properties object    
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", "465");
        //get Session   
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("nds123.system@gmail.com", "nds1234%");
            }
        });
        //compose message    
        try {
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            String msg = "Hello " + name + " \n\n" + "Please click link below to verfiy your mail id.";
            String link = "http://localhost:8084/NDS_Demo2/emailverify?nds.email=" + to + "&nds.category=" + category;
            msg = msg + "\n\n" + link;
            message.setSubject("Email verification by The Times - Journal.");
            message.setText(msg);
            //send message  
            javax.mail.Transport.send(message);
            System.out.println("message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

    public static void sendOTP(String otp, String to) {
        //Get properties object    
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", "465");
        //get Session   
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("nds123.system@gmail.com", "nds1234%");
            }
        });
        //compose message    
        try {
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            String msg = "Hello " + " \n\n" + "Your One Time Password is " + otp + ". Please enter it to update your password.";
            message.setSubject("One Time Password, by The Times - Journal.");
            message.setText(msg);
            //send message  
            javax.mail.Transport.send(message);
            System.out.println("message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

    public static void sendReplyMail(String name, String to, String reply, String subject) {
        //Get properties object    
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", "465");
        //get Session   
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("nds123.system@gmail.com", "nds1234%");
            }
        });
        //compose message    
        try {
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            String msg = "Hello " + name + ", \n\n" + reply;
            message.setSubject(subject);
            message.setText(msg);
            //send message  
            javax.mail.Transport.send(message);
            System.out.println("message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

    public static Boolean forEmailVerification(String email, String category) {

        Connection conn = DbConnection.getConnection();
        String sql = "Update Attributes set emailstatus='true' where email='" + email + "' and category='" + category + "'";
        Boolean flag = true;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public static Boolean updateOTP(String email, String category, String otp) {

        Connection conn = DbConnection.getConnection();
        String sql = "Update Attributes set otp='" + otp + "' where email='" + email + "' and category='" + category + "'";
        Boolean flag = true;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public static Boolean forReplyStatus(String id) {

        Connection conn = DbConnection.getConnection();
        String sql = "Update Contact_Us set reply_status='Yes' where id='" + id + "'";
        Boolean flag = true;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public static Boolean forPaymentVerification(String email) {

        Connection conn = DbConnection.getConnection();
        String sql = "Update Cart set payment_status='true' where email='" + email + "'";
        Boolean flag = true;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

}

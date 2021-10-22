/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nds.controller;

import com.nds.dao.NDS_Dao;
import com.nds.dto.NDS;
import java.util.ArrayList;
import org.apache.struts2.interceptor.ServletRequestAware;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author harshartwani
 */
public class CommonController implements ServletRequestAware {

    NDS nds;
    HttpServletRequest request;
    ArrayList<NDS> ndsList = new ArrayList<>();

    public String addRecord() {
        System.out.println("================Add RECORD method Working====================");
        System.out.println(nds);
        System.out.println("================Add RECORD method Working===1=================");

        String flag = NDS_Dao.addUser(nds);
        if (flag == "success") {
            return "success";
        } else if (flag == "emailexist") {
            return "emailexist";
        } else {
            return "usernameexist";
        }
    }

    public String addDboy() {
        System.out.println("================Add RECORD method Working====================");
        System.out.println(nds);
        System.out.println("================Add RECORD method Working===1=================");

        boolean flag = NDS_Dao.addDeliveryBoy(nds);
        if (!flag) {
            return "success";
        } else {
            return "error";
        }
    }

    public String update_person_det() {
        System.out.println("================Add RECORD method Working====================");
        System.out.println(nds);
        System.out.println("================Add RECORD method Working===1=================");
        boolean flag1 = NDS_Dao.isEmailValid(nds.getEmail(), nds.getCategory(), nds.getId());
        if (flag1 == false) {
            boolean flag = NDS_Dao.update_Personal_Details(nds);
            if (!flag) {
                return "success";
            } else {
                return "error";
            }
        }
        return "emailnotvalid";
    }

    public String update_cart() {
        System.out.println("================Add RECORD method Working====================");
        System.out.println(nds);
        System.out.println("================Add RECORD method Working===1=================");
        boolean flag = NDS_Dao.update_cart_details(nds);
        if (!flag) {
            return "success";
        } else {
            return "error";
        }
    }

    public String update_Dboy() {
        System.out.println("================Add RECORD method Working====================");
        System.out.println(nds);
        System.out.println("================Add RECORD method Working===1=================");
        boolean flag = NDS_Dao.update_Dboy_Details(nds);
        if (!flag) {
            return "success";
        } else {
            return "error";
        }
    }

    public String subscribeNewspaper() {
        System.out.println("================Add RECORD method Working====================");
        System.out.println(nds);
        Boolean flag = true;
        System.out.println("================Add RECORD method Working===1=================");
        System.out.println("Flag1 is " + flag + "===============");

        if (nds.getPayment_option().equals("Cash_on_Delivery")) {
            return "successCOD";
        } else {
            return "otherOption";
        }
    }

    public String contactUs() {
        System.out.println("================Add RECORD method Working====================");
        System.out.println(nds);
        System.out.println("================Add RECORD method Working===1=================");

        Boolean flag = NDS_Dao.addContactInfo(nds);
        if (!flag) {
            if (nds.getCategory().equals("Customer")) {
                return "success_cust";
            } else {
                return "success_vend";
            }
        } else {
            return "error";
        }
    }

    public String forgotPassword() {
        int flag;
        flag = NDS_Dao.isValid(nds.getEmail(), nds.getCategory());
        if (flag != 1) {
            return "emailFailure";
        } else {
            int min = 1000;
            int max = 9999;
            System.out.println("Random value in int from " + min + " to " + max + ":");
            int random_int = (int) (Math.random() * (max - min + 1) + min);
            System.out.println(random_int);
            String otp = Integer.toString(random_int);
            NDS_Dao.updateOTP(nds.getEmail(), nds.getCategory(), otp);
            NDS_Dao.sendOTP(otp, nds.getEmail());

            return "success";
        }
    }

    public String otp_Verify() {
        int flag;
        flag = NDS_Dao.isOTPVaild(nds.getOtp(), nds.getEmail(), nds.getCategory());
        if (flag == 1) {
            return "success";
        } else {
            return "failure";
        }

    }

    public String newPassword() {
        boolean flag = false;
        flag = NDS_Dao.updatePassword(nds.getN_password(), nds.getEmail(), nds.getCategory());
        System.out.println("Flag is " + flag);
        if (flag == false) {
            return "success";
        } else {
            return "failure";
        }
    }

    public String cart() {
        System.out.println("================Add RECORD method Working====================");
        System.out.println(nds);
        System.out.println("================Add RECORD method Working===1=================");

        Boolean flag = NDS_Dao.addToCart(nds);
        if (!flag) {
            return "success";
        } else {
            return "error";
        }
    }

    public String success() {
        System.out.println("================Success Login method Working====================");
        String result = "";
        int flag = 0;
        System.out.println("=========Category is " + nds.getCategory());
        if (nds.getCategory().equals("Admin") && nds.getUsername().equals("admin")) {
            flag = NDS_Dao.isAdminValid(nds.getPassword());
            if (flag == 1) {
                result += "successAdmin";
            } else {
                result += "error";
            }
        } else if (!nds.getCategory().equals("Admin")) {
            flag = NDS_Dao.isUserValid(nds.getUsername(), nds.getPassword(), nds.getCategory());
            System.out.println("Value of FLAG IS " + flag + "======");

            if (flag == 1) {
                System.out.println("Value of FLAG IS 1======");
                System.out.println("Value of Category IS ======" + nds.getCategory());
                if (nds.getCategory().equals("Vendor")) {
                    result += "successVendor";
                } else if (nds.getCategory().equals("Customer")) {
                    result += "successCustomer";
                } else {
                    result += "error";
                }

            } else if (flag == 0) {
                System.out.println("FINAL RESULT IS " + result + "==================");

                result += "error";
            }
        }
        return result;
    }

    public String emailVerify() {
        System.out.println("================Verify Email method Working====================");
        System.out.println("Email is ==========" + nds.getEmail());
        Boolean flag = NDS_Dao.forEmailVerification(nds.getEmail(), nds.getCategory());
        if (flag) {
            return "success";
        } else {
            return "failure";
        }
    }

    public String reply() {
        NDS_Dao.sendReplyMail(nds.getFirst_name(), nds.getEmail(), nds.getReply(), nds.getSubject());
        NDS_Dao.forReplyStatus(nds.getId());
        return "success";
    }

    public String paymentStatus() {
        System.out.println("================Verify Email method Working====================");
        Boolean flag = NDS_Dao.forPaymentVerification(nds.getEmail());
        if (flag) {
            return "success";
        } else {
            return "failure";
        }
    }

    public String changePassword() {
        System.out.println("Username is ==========" + nds.getUsername());
        System.out.println("New Password is ==========" + nds.getN_password());

        boolean flag = NDS_Dao.isPasswordChanged(nds.getUsername(), nds.getO_password(), nds.getN_password());
        if (flag == false) {
            System.out.println("I AM IN SUCCESS=======");
            if (nds.getCategory().equals("Vendor")) {
                return "success_vend";
            } else if (nds.getCategory().equals("Customer")) {
                return "success_cust";
            } else {
                return "success_adm";
            }
        } else {
            System.out.println("I AM IN FAILURE=======");
            if ((nds.getCategory().equals("Vendor"))) {
                return "failure_vend";
            } else {
                return "failure_cust";
            }
        }
    }

    public String changePassword_adm() {
        boolean flag = NDS_Dao.isPasswordChangedAdm(nds.getUsername(), nds.getO_password(), nds.getN_password());
        if (flag == false) {
            return "success";
        } else {
            return "failure";
        }
    }

    @Override
    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }

    public NDS getNds() {
        return nds;
    }

    public void setNds(NDS nds) {
        this.nds = nds;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public ArrayList<NDS> getNdsList() {
        return ndsList;
    }

    public void setNdsList(ArrayList<NDS> ndsList) {
        this.ndsList = ndsList;
    }

}

package com.example.checkRevision.controller.unregistered;

import com.example.checkRevision.EmailSMTP.Email;
import com.example.checkRevision.dao.BuyerDAO;
import com.example.checkRevision.dao.UserDAO;
import com.example.checkRevision.model.Buyer;
import com.example.checkRevision.variables.MyVariables;
import reactor.core.publisher.Sinks;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;


@WebServlet(name = "buyerRegServlet", value = "/public/buyerRegSubmit")
public class buyerRegServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        getting input
        String username = request.getParameter("uname");
        String password = request.getParameter("pass");
        String password2 = request.getParameter("pass2");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String houseNo = request.getParameter("houseNo");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String province = request.getParameter("province");
        String mobileNo = request.getParameter("mobileNo");
        String email = request.getParameter("email");


//        Validating input and checking if already exit username
        UserDAO userDAO = new UserDAO();
        BuyerDAO buyerDAO = new BuyerDAO();
        try {
            if (!validateInput(username, password, password2, firstName,lastName, houseNo, street, city, district, province, mobileNo, email) || userDAO.isUsernameExist(username) || buyerDAO.isEmailExist(email)){
                response.sendRedirect("../inputError.html");
                return;
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return;
        }

        int salt = MyVariables.getRandomSalt();
        Buyer potentialBuyer = new Buyer(username, MyVariables.doHash(password+salt), "buyer", salt, new Timestamp(System.currentTimeMillis()),firstName, lastName,houseNo,street,city,district,province,false,mobileNo,email);
        BuyerDAO dao = new BuyerDAO();
        ArrayList<String> result = null;

        try {
            result = dao.addBuyer(potentialBuyer);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return;
        }

        Email emailObject = new Email();
        int verCode = (int)(Math.random() * 1000000);
        HttpSession session = request.getSession();
        session.setAttribute("verCode", verCode);
        emailObject.sendMail(email,"Verification code from SHELFS", String.valueOf(verCode));


        assert result != null;
        if(result.isEmpty()){
            //buyer is added
            response.sendRedirect("../verifyAccount");
        }
        else{
            //show error in input, something wrong
            response.sendRedirect("buyerRegForm.html");
        }

    }






    public boolean validateInput(String username, String password, String password2, String firstName, String lastName, String houseNo, String street, String city, String district, String province, String mobileNo, String email){
        System.out.println("Entering Validation....");

        if (!username.matches("\\w{3,20}")) {
            System.out.println(1);
            return false;
        }

        if ((password.length() < 8 || password.length() > 20 )) {
            System.out.println(2);
            return false;
        }

        if (!password2.equals(password)) {

            System.out.println(3);
            return false;
        }

        if (!firstName.matches("[A-Z][a-z]{1,19}")) {
            System.out.println(4);
            return false;
        }

        if (!lastName.matches("[A-Z][a-z]{1,19}")) {
            System.out.println(5);
            return false;
        }

        if (!houseNo.matches("[a-zA-Z0-9]{1,10}")) {
            System.out.println(6);
            return false;
        }

        if (!street.matches("[a-zA-Z\\s]{5,30}")) {
            System.out.println(7);
            return false;
        }

        if (!city.matches("[a-zA-Z\\s]{5,30}")) {
            System.out.println(8);
            return false;
        }

        if (!MyVariables.getDistricts().contains(district)) {
            System.out.println(9);
            return false;
        }

        if (!MyVariables.getProvinces().contains(province)) {
            System.out.println(10);
            return false;
        }

        if (!mobileNo.matches("(?:0|94|\\+94)?(?:(11|21|23|24|25|26|27|31|32|33|34|35|36|37|38|41|45|47|51|52|54|55|57|63|65|66|67|81|912)(0|2|3|4|5|7|9)|7(0|1|2|4|5|6|7|8)\\d)\\d{6}")) {
            System.out.println(11);
            return false;
        }

        if (!email.matches("\\w+([.-]?\\w+)*@\\w+([.-]?\\w+)*(\\.\\w{2,3})+")) {
            System.out.println(12);
            return false;
        }

        System.out.println("Out of validation");

        return true;
    }
}

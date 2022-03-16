package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.DeliveryDAO;
import com.example.checkRevision.dao.UserDAO;
import com.example.checkRevision.model.Delivery;
import com.example.checkRevision.variables.MyVariables;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

@WebServlet(name = "addDeliveryPersonServlet", value = "/admin/addDeliveryPerson")
public class addDeliveryPersonServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String mobileNo = request.getParameter("mobileNo");

//        MUST VALIDATE INPUT
        UserDAO userDAO = new UserDAO();
        try {
            if (!validateInput(username, password, password2, firstName,lastName, mobileNo) || userDAO.isUsernameExist(username)){
                response.sendRedirect("../inputError.html");
                return;
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        int salt = getRandomSalt();
        Delivery newDeliveryPerson = new Delivery(username, MyVariables.doHash(password+salt), new Timestamp(System.currentTimeMillis()), salt, firstName, lastName, mobileNo);

        DeliveryDAO dao = new DeliveryDAO();
        try {
            dao.addDeliveryPerson(newDeliveryPerson);
            response.sendRedirect("manageDeliveryPersons");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }


    }

    public int getRandomSalt(){
        return (int)(Math.random() * 10000);
    }

    public boolean validateInput(String username, String password, String password2, String firstName, String lastName, String mobileNo){
        System.out.println("Entering Validation in addDeliveryServlet....");

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

        if (!mobileNo.matches("(?:0|94|\\+94)?(?:(11|21|23|24|25|26|27|31|32|33|34|35|36|37|38|41|45|47|51|52|54|55|57|63|65|66|67|81|912)(0|2|3|4|5|7|9)|7(0|1|2|4|5|6|7|8)\\d)\\d{6}")) {
            System.out.println(11);
            return false;
        }

        System.out.println("Validation successfull in addDeliveryServlet");

        return true;
    }
}

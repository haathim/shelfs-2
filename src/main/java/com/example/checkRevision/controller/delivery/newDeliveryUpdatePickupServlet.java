package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.NewOrderPickupsDAO;
import com.example.checkRevision.dao.NewOrdersDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "newDeliveryUpdatePickupServlet", value = "/delivery/newDeliveryUpdatePickup")
public class newDeliveryUpdatePickupServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String deliverer = (String) session.getAttribute("username");
//        String deliverer = "delivery1";

        int pickupId = Integer.parseInt(request.getParameter("pickupId"));
        int status = Integer.parseInt(request.getParameter("status"));

        NewOrderPickupsDAO newOrderPickupsDAO = new NewOrderPickupsDAO();
        try {
            newOrderPickupsDAO.updatePickupStatus(deliverer, pickupId, status);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        //        get order id of pickup
        int orderIdOfPickup = -1;
        try {
            orderIdOfPickup = newOrderPickupsDAO.getOrderIdOfPickup(pickupId);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

//        code to check if all pickups are 2
        ArrayList<Integer> allPickupsStatusOfOrderId = null;
        try {
            allPickupsStatusOfOrderId = newOrderPickupsDAO.getAllPickupsStatusOfOrderId(orderIdOfPickup);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        boolean allDone = true;
        for (int pickupStatus: allPickupsStatusOfOrderId){
            if (pickupStatus != 2){
                System.out.println("All Pickups are not yet complete");
                allDone = false;
                break;
            }
        }

        NewOrdersDAO newOrdersDAO = new NewOrdersDAO();

        if (allDone){
            System.out.println("All the pickups are done.");

//            now have to change order table status to 1
            try {
                newOrdersDAO.updateOrderStatus(orderIdOfPickup, 1);
            } catch (SQLException | ClassNotFoundException throwables) {
                throwables.printStackTrace();
            }
        }

        response.sendRedirect("pendingPickupsNew");
    }
}

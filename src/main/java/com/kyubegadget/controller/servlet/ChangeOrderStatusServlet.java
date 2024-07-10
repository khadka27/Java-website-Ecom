package com.kyubegadget.controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kyubegadget.controller.dao.OrderDao;
import com.kyubegadget.utils.StringUtils;

@WebServlet("/ChangeOrderStatusServlet")
public class ChangeOrderStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the order ID and the new status from the request parameters
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String newStatus = request.getParameter("status");

        // Update the order status in the database
        OrderDao orderDao = new OrderDao();
        boolean updated = orderDao.updateOrderStatus(orderId, newStatus);

        // Redirect back to the order list page
        if (updated) {
            response.sendRedirect(request.getContextPath() + StringUtils.ORDER_LIST);
        } else {
            // Handle error if status update fails
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update order status");
        }
    }
}

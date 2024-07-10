package com.kyubegadget.controller.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kyubegadget.controller.dao.OrderDao;
import com.kyubegadget.controller.dao.OrderLineDao;
import com.kyubegadget.controller.dao.SalesDao;
import com.kyubegadget.controller.dao.UserDao;
import com.kyubegadget.model.Cart;
import com.kyubegadget.model.OrderLineModel;
import com.kyubegadget.model.OrderModel;
import com.kyubegadget.utils.StringUtils;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserDao ud = new UserDao();
	OrderDao od = new OrderDao();
	OrderLineDao ol = new OrderLineDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		try {
			HttpSession session = request.getSession();
			int userId = ud.getUserIdFromSession(session);
			
			//create an arrary list 
			ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");

			if (cartList == null || cartList.isEmpty()) {
				response.sendRedirect(request.getContextPath() + StringUtils.HOME_PAGE);
				return;
			}

			double totalAmount = (double) session.getAttribute("totalAmount"); // Retrieve totalAmount from session
			OrderModel order = new OrderModel(0, new Date(), userId, totalAmount, "Pending");
			int orderId = od.saveOrderToDatabase(order);

			for (Cart cartItem : cartList) {
				OrderLineModel orderLine = new OrderLineModel(0, orderId, cartItem.getProductId(), cartItem.getStock());
				ol.saveOrderLineToDatabase(orderLine);
			}
				
			// Store the sale information in the sales table
			for (Cart cartItem : cartList) {
			    
			    // Calculate total price
				
				double totalPrice = cartItem.getPrice() * cartItem.getStock();

			    // Convert java.util.Date to java.time.LocalDate
			    LocalDate saleDate = new Date().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

			    // Call the insertSaletoDatabase method with the calculated total price
			    SalesDao.insertSaletoDatabase(cartItem.getProductId(), userId, saleDate, cartItem.getStock(), cartItem.getPrice(), totalPrice);
			}


			response.sendRedirect(request.getContextPath() + StringUtils.BILL_PAGE);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
		}
	}
}



package com.kyubegadget.controller.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kyubegadget.model.Cart;
import com.kyubegadget.utils.StringUtils;

/**
 * Servlet implementation class RemoveFromCartServlet
 */
@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int productId = Integer.parseInt(request.getParameter("productId"));
			HttpSession session = request.getSession();
			ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");
			// removing from cart array list  
			if (cartList != null) {
				for (Cart c : cartList) {
					if (c.getProductId() == productId) {
						cartList.remove(c);
						break;
					}
				}
			}
			response.sendRedirect(request.getContextPath()+StringUtils.CART_PAGE);
		} catch (NumberFormatException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
		} catch (IOException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
		}
	}

}

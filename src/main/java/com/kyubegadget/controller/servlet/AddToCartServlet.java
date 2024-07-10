//
//package com.kyubegadget.controller.servlet;
//
//import java.io.IOException;
//import java.util.ArrayList;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.kyubegadget.model.Cart;
//import com.kyubegadget.utils.StringUtils;
//
///**
// * Servlet implementation class AddToCartServlet
// */
//@WebServlet("/AddToCartServlet")
//public class AddToCartServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html; charset=UTF-8");
//
//        try {
//            HttpSession session = request.getSession();
//            int productId = Integer.parseInt(request.getParameter("productId"));
//            
//            
//
//            Cart cart = new Cart();
//            cart.setProductId(productId);
//            cart.setStock(1);
//
//            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");
//            if (cartList == null) {
//                cartList = new ArrayList<>();
//                session.setAttribute("cartList", cartList);
//                //30 minutes
//                session.setMaxInactiveInterval(30 * 60);
//            }
//
//            boolean productExists = cartList.stream().anyMatch(c -> c.getProductId() == productId);
//            if (!productExists) {
//                cartList.add(cart);
//                response.sendRedirect(request.getContextPath()+StringUtils.SHOP_PAGE);
//            } else {
//                for (Cart c : cartList) {
//                    if (c.getProductId() == productId) {
//                        c.setStock(c.getStock() + 1);
//                        break;
//                    }
//                }
//                response.sendRedirect(request.getContextPath()+StringUtils.SHOP_PAGE);
//            }
//        } catch (NumberFormatException e) {
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
//        } catch (IOException e) {
//            e.printStackTrace();
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
//        }
//    }
//}

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
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");

        try {
            HttpSession session = request.getSession();
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = 1; // Default quantity is 1
            
            // Check if quantity parameter is provided
            String quantityParam = request.getParameter("quantity");
            if (quantityParam != null && !quantityParam.isEmpty()) {
                quantity = Integer.parseInt(quantityParam);
            }
            
            Cart cart = new Cart();
            cart.setProductId(productId);
            cart.setStock(quantity); // Set the quantity of the product

            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");
            if (cartList == null) {
                cartList = new ArrayList<>();
                session.setAttribute("cartList", cartList);
                //30 minutes
                session.setMaxInactiveInterval(30 * 60);
            }

            boolean productExists = false;
            for (Cart c : cartList) {
                if (c.getProductId() == productId) {
                    c.setStock(c.getStock() + quantity); // Update quantity if product already exists
                    productExists = true;
                    break;
                }
            }
            
            if (!productExists) {
                cartList.add(cart); // Add new product to the cart
            }
            
            response.sendRedirect(request.getContextPath()+StringUtils.SHOP_PAGE);
            
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
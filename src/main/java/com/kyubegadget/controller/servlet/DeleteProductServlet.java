package com.kyubegadget.controller.servlet;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kyubegadget.controller.dao.ProductDao;
import com.kyubegadget.utils.StringUtils;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the product ID parameter from the request
        String productIdStr = request.getParameter("productId");

        if (productIdStr != null && !productIdStr.isEmpty()) {
            try {
                int productId = Integer.parseInt(productIdStr);
                // Call the ProductDao to delete the product by ID
                ProductDao productDao = new ProductDao();
                boolean deleted = productDao.deleteProduct(productId);
                if (deleted) {
                    // Product successfully deleted
                    response.sendRedirect(request.getContextPath()+ "/pages/ManageProduct.jsp"); // Redirect to the product list page
                } else {
                    
                    String errorMessage = "Failed to delete product";
                    response.sendRedirect(request.getContextPath() + StringUtils.ERROR_PAGE + "?error=" + errorMessage);
                    
                }
            } catch (NumberFormatException e) {
                response.getWriter().println("Invalid product ID");
            }
        } else {
            response.getWriter().println("Product ID parameter is missing");
        }
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
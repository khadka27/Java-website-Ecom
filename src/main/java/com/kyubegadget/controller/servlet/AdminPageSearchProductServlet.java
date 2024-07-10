package com.kyubegadget.controller.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kyubegadget.controller.dao.ProductDao;
import com.kyubegadget.model.ProductModel;

/**
 * Servlet implementation class AdminPageSearchProductServlet
 */
@WebServlet("/AdminPageSearchProductServlet")
public class AdminPageSearchProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    ProductDao productDao = new ProductDao();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPageSearchProductServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	// get query from response parameter
        String query = request.getParameter("query");

        if (query != null && !query.isEmpty()) {
            List<ProductModel> searchResults = productDao.searchProductsByName(query);
            request.setAttribute("searchResults", searchResults);
        }

        // Forward the request to the testManageProduct.jsp page
        request.getRequestDispatcher("/pages/ManageProduct.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

package com.kyubegadget.controller.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kyubegadget.controller.dao.CategoryDao;
import com.kyubegadget.model.ProductCategoryModel;
import com.kyubegadget.utils.StringUtils;




/**
 * Servlet implementation class AddCategoryServlet
 */
@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryDao categoryDao = new CategoryDao(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		// getting category name
		String categoryName = request.getParameter("categoryName");
		
		ProductCategoryModel productCategoryModel = new ProductCategoryModel( categoryName);
		
		int result = categoryDao.addCategory(productCategoryModel);
		
		if(result>0) {
			 List<ProductCategoryModel> categories = categoryDao.getAllCategories() ;

		        // Set the categories as an attribute in the request scope
			 request.setAttribute("categories", categories);

		        // Redirect to the JSP with success message
			 
			response.sendRedirect(request.getContextPath() + "/pages/productCategory.jsp" + "?"
                    + StringUtils.ERROR_MESSAGE + "=" + StringUtils.SUCCESS_ADD_CATEGORY);

			
		}else {
	        // Redirect to register page with error message
	        response.sendRedirect(request.getContextPath() + "/pages/productCategory.jsp" + "?" + StringUtils.ERROR_MESSAGE
	        		 + "=" +  StringUtils.ADD_CATEGORY_ERROR_MESSAGE);
	        System.out.println("An unexpected server error occurred. ");
	    }
	
		
		
	}

}

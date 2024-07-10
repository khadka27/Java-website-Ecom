package com.kyubegadget.controller.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.kyubegadget.controller.dao.ProductDao;
import com.kyubegadget.model.ProductModel;
import com.kyubegadget.utils.StringUtils;

@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ProductDao productDao;

    public void init() {
        productDao = new ProductDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // to get productId when clicked edit from product management page
    	String productIdString = request.getParameter("productId");
        
        if(productIdString == null || productIdString.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/pages/ManageProduct.jsp?error=productId is required");
            return;
        }
        
        int productId = Integer.parseInt(productIdString);
        ProductModel product = productDao.getProductById(productId);
        
        if(product == null) {
            response.sendRedirect(request.getContextPath() + "/pages/ManageProduct.jsp?error=Product not found");
            return;
        }
        
        
        request.setAttribute("product", product);
        
        request.getRequestDispatcher("/pages/editProduct.jsp").forward(request, response);
    }
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    
    
    

}

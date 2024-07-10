package com.kyubegadget.controller.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.kyubegadget.model.ProductModel;
import com.kyubegadget.controller.dao.ProductDao;

import com.kyubegadget.utils.StringUtils;
/**
 * Servlet implementation class GetProductIdServlet
 */
@MultipartConfig
@WebServlet("/GetProductIdServlet")
public class GetProductIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProductIdServlet() {

    
    }
    
    
    private ProductDao productDao;

    public void init() {
        productDao = new ProductDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String productIdString = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String productBrand = request.getParameter("productBrand");
        double price = Double.parseDouble(request.getParameter("price"));
        String productDescription = request.getParameter("productDescription");
        int productCategoryId = Integer.parseInt(request.getParameter("productCategoryId"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        Part part = request.getPart("imageUrl");

        // Parse productId from request
        int productId = 0;
        try {
            productId = Integer.parseInt(productIdString);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pages/ManageProduct.jsp?error=Invalid product ID");
            return;
        }

        // Retrieve the existing product from the database
        ProductModel existingProduct = productDao.getProductById(productId);
        String imageUrl = existingProduct.getImageUrl(); // Default to existing image URL

        // Check if a new image is uploaded
        if (part.getSize() > 0) {
            // An image is uploaded, save it and get the file name
            String uploadPath = "C:\\Users\\VICTUS\\Desktop\\advanced-java-coursework\\kyubegadget\\src\\main\\webapp\\images\\";
            String fileName = ProductDao.generateUniqueFileName(part);

            // Save the uploaded image
            try (InputStream inputStream = part.getInputStream();
                 OutputStream outputStream = new FileOutputStream(uploadPath + fileName)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                imageUrl = fileName; // Update imageUrl with the new file name
            } catch (IOException e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/pages/ManageProduct.jsp?error=Failed to upload image");
                return;
            }
        }

        // Create a new ProductModel object
        ProductModel productModel = new ProductModel(productId, productName, productBrand, price, productDescription, imageUrl, productCategoryId, stock);

        // Update product in the database
        int result = productDao.updateProduct(productModel);

        // Redirect the user based on the result of the update operation
        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/pages/ManageProduct.jsp?success=Product updated successfully");
        } else {
            response.sendRedirect(request.getContextPath() + "/pages/ManageProduct.jsp?error=Failed to update product");
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

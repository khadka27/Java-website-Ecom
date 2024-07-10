 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.kyubegadget.model.ProductCategoryModel"%>
<%@ page import="com.kyubegadget.controller.dao.CategoryDao"%>
<%@ page import="com.kyubegadget.utils.StringUtils"%>
<%@page import="java.util.*"%>

<%
// Fetch categories from the database or wherever they are stored
CategoryDao categoryDao = new CategoryDao();
List<ProductCategoryModel> categories = categoryDao.getAllCategories();
%>
<%
    // Retrieve the existing session variable
    javax.servlet.http.HttpSession existingSessionn = request.getSession(false);

    // Check if session exists and if the role is "admin"
    if (existingSessionn == null || existingSessionn.getAttribute("role") == null || !existingSessionn.getAttribute("role").equals("admin")) {
        // If not admin, redirect to index page
        response.sendRedirect(request.getContextPath() +"/pages/home.jsp");
    } else {
        // Admin is authenticated, allow access to admin panel

        

        %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>
<link href="<%=request.getContextPath()%>/styles/output.css" rel="stylesheet">
</head>
<body>

<div class="bg-white border border-4 rounded-lg shadow relative m-10">
    <div class="flex items-start justify-between p-5 border-b rounded-t">
        <h3 class="text-2xl font-semibold">Edit Product</h3>
        <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" onclick="back()">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
            </svg>
        </button>
    </div>
    <div class="p-6 space-y-6">
        <form action="<%=request.getContextPath()%>/GetProductIdServlet?productId=${product.productId}" method="post" enctype="multipart/form-data">
			<h3 class="mb-2">Product Id : ${product.productId}</h3>
            <div class="grid grid-cols-6 gap-6">
            
                <div class="col-span-6 sm:col-span-3">
                    <label for="product-name" class="text-sm font-medium text-gray-900 block mb-2">Product Name</label>
                    <input type="text" name="productName" id="product-name" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-cyan-600 focus:border-cyan-600 block w-full p-2.5" placeholder="Product Name" value="${product.productName}" required="">
                </div>
                <div class="col-span-6 sm:col-span-3">
						<label for="category"
							class="text-sm font-medium text-gray-900 block mb-2">Category</label>
						<select id="category" name="productCategoryId"
							class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-cyan-600 focus:border-cyan-600 block w-full p-2.5"
							required="">
							<option value="" disabled selected>Select category</option>

							<%
							for (ProductCategoryModel pm : categories) {
							%>
							<option value="<%=pm.getProductCategoryId()%>">
								<%
								out.println(pm.getCategoryName());
								%>
							</option>
							<%
							}
							%>
							
						</select>

					</div>
                <div class="col-span-6 sm:col-span-3">
                    <label for="brand" class="text-sm font-medium text-gray-900 block mb-2">Brand</label>
                    <input type="text" name="productBrand" id="productBrand" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-cyan-600 focus:border-cyan-600 block w-full p-2.5" placeholder="Brand" value="${product.productBrand}" required="">
                </div>
                <div class="col-span-6 sm:col-span-3">
                    <label for="price" class="text-sm font-medium text-gray-900 block mb-2">Price</label>
                    <input type="number" name="price" id="price" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-cyan-600 focus:border-cyan-600 block w-full p-2.5" placeholder="Price" value="${product.price}" required="">
                </div>
                <div class="col-span-6 sm:col-span-3">
                    <label for="image-file" class="text-sm font-medium text-gray-900 block mb-2">Image Upload</label>
                    <input type="file" name="imageUrl" id="image-file" accept="image/*" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-cyan-600 focus:border-cyan-600 block w-full p-2.5" >
                </div>
                <div class="col-span-6 sm:col-span-3">
                    <label for="stock" class="text-sm font-medium text-gray-900 block mb-2">Stock</label>
                    <input type="text" name="stock" id="stock" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-cyan-600 focus:border-cyan-600 block w-full p-2.5" placeholder="Stock" value="${product.stock}" required="">
                </div>
                <div class="col-span-full">
                    <label for="productDescription" class="text-sm font-medium text-gray-900 block mb-2">Product Details</label>
                    <textarea id="productDescription" name="productDescription" rows="6" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-cyan-600 focus:border-cyan-600 block w-full p-4" placeholder="Details">${product.productDescription}</textarea>
                </div>
            </div>
            <div class="p-6 border-t border-gray-200 rounded-b">
                <button class="text-white bg-cyan-600 hover:bg-cyan-700 focus:ring-4 focus:ring-cyan-200 font-medium rounded-lg text-sm px-5 py-2.5 text-center" type="submit">Save Changes</button>
            </div>
        </form>
    </div>
</div>

</body>
<script>
    function back() {
        window.history.back();
    }
</script>
</html>

<%
    }
%>

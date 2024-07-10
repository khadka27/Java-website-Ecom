
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.kyubegadget.model.ProductCategoryModel"%>
<%@ page import="com.kyubegadget.controller.dao.CategoryDao"%>
<%@ page import="com.kyubegadget.utils.StringUtils"%>


<%
// Fetch categories from the database or wherever they are stored
CategoryDao categoryDao = new CategoryDao();
List<ProductCategoryModel> categories = categoryDao.getAllCategories();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Category</title>
<link href="<%=request.getContextPath()%>/styles/output.css" rel="stylesheet">
</head>
<body>
	<form action="../AddCategoryServlet" method="post">
		<div class="form-group">
			<label for="categoryName">Category Name:</label> <input
				class="border border-red-300" type="text" id="categoryName"
				name="categoryName" required>
		</div>

		<button type="submit" value="AddCategory"
			class="text-white bg-indigo-500 hover:bg-indigo-800  font-medium rounded-lg text-sm px-5 py-2.5 text-center ">Add
			Category</button>
		<%
		for (ProductCategoryModel pm : categories) {
		%>

		<a href="#"
			class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">

			<%
			out.println(pm.getCategoryName());
			%>
		</a>

		<%
		}
		%>
	</form>
</body>
</html>
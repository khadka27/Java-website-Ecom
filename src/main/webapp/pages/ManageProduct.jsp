<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kyubegadget.model.ProductModel" %>
<%@ page import="com.kyubegadget.controller.dao.*" %>
<%@ page import="com.kyubegadget.controller.dao.CategoryDao" %>
<%@ page import="com.kyubegadget.model.ProductCategoryModel" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Information</title>
    <link href="<%=request.getContextPath()%>/styles/output.css" rel="stylesheet">
</head>

<%
// Retrieve the existing session variable
javax.servlet.http.HttpSession existingSessiony = request.getSession(false);

// Check if session exists and if the role is "admin"
if (existingSessiony == null || existingSessiony.getAttribute("role") == null
        || !existingSessiony.getAttribute("role").equals("admin")) {
    // If not admin, redirect to index page
    response.sendRedirect(request.getContextPath() + "/pages/shop.jsp");
} else {
    // Admin is authenticated, allow access to admin panel
    List<ProductModel> products;
    if (request.getAttribute("searchResults") != null) {
        products = (List<ProductModel>) request.getAttribute("searchResults");
    } else {
        ProductDao productDao = new ProductDao();
        products = productDao.getAllProducts();
    }
%>
<%@include file="adminSideBar.jsp"%>
<body class="bg-gray-100 flex h-screen">

    <input type="hidden" id="productIdToDelete">
    <div id="content" class="relative overflow-x-auto shadow-md w-full ">
        <div class="pb-4 bg-white">
            <div class="flex items-center justify-between w-full px-4 py-2 bg-gray-800 ">
                <div class="flex items-center">
                    <span class="mr-2 text-sm font-medium text-white">All Products</span>
                    <form action="<%=request.getContextPath()%>/AdminPageSearchProductServlet" method="GET">
                        <div class="flex items-center">
                            <input type="text" name="query" id="search"
                                class="w-full px-3 py-2 rounded-md focus:outline-none focus:ring-1 focus:ring-indigo-500 border border-transparent"
                                placeholder="Search for products...">
                            <button type="submit">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                    stroke-width="1.5" stroke="white" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.607 10.607Z" />
                                </svg>
                            </button>
                        </div>
                    </form>
                </div>
                <div class="flex space-x-2">
                    <a href="<%=request.getContextPath()%>/pages/addProduct.jsp">
                        <button type="button"
                            class="px-3 py-2 mr-2 text-sm font-medium text-center text-white bg-blue-500 hover:bg-blue-700 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            Add New Product</button>
                    </a>
                    <button onclick="toggleModal('categoryModal')"
                        class="px-3 py-2 text-sm font-medium text-center text-white bg-blue-500 hover:bg-blue-700 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                        Add Category</button>
                </div>
            </div>
        </div>

        <table class="w-full text-sm text-left rtl:text-right text-gray-500">
            <thead
                class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                    <th scope="col" class="px-6 py-3">Product ID</th>
                    <th scope="col" class="px-6 py-3">Product Name</th>
                    <th scope="col" class="px-6 py-3">Price</th>
                    <th scope="col" class="px-6 py-3">Brand</th>
                    <th scope="col" class="px-6 py-3">Description</th>
                    <th scope="col" class="px-6 py-3">Category</th>
                    <th scope="col" class="px-6 py-3">Image</th>
                    <th scope="col" class="px-6 py-3">Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (ProductModel product : products) {
                %>
                <%
                CategoryDao cD = new CategoryDao();
                %>
                <tr class="bg-white border-b hover:bg-gray-50">
                    <td class="px-6 py-4"><%=product.getProductId()%></td>
					<td class="px-6 py-4"><%=product.getProductName()%></td>
					<td class="px-6 py-4"><%=product.getPrice()%></td>
					<td class="px-6 py-4"><%=product.getProductBrand()%></td>
					<td class="px-6 py-4"><%=product.getProductDescription()%></td>
					<td class="px-6 py-4"><%=cD.getCategoryNameById(product.getProductCategoryId())%></td>
					<td class="px-6 py-4"><img
						src="<%=request.getContextPath()%>/images/<%=product.getImageUrl()%>"
						alt="Product Image" class="h-16 w-16 object-cover rounded"></td>
					<td class="px-6 py-4"><a
						href="<%=request.getContextPath()%>/EditProductServlet?productId=<%=product.getProductId()%>"
						class="font-medium text-blue-600 hover:underline">Edit</a> |
                        <a href="#" onclick="confirmDelete(<%=product.getProductId()%>)"
                            class="font-medium text-red-600 hover:underline">Delete</a></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <div id="deleteConfirmationModal"
            class="fixed z-10 inset-0 overflow-y-auto hidden">
            <div class="flex items-center justify-center min-h-screen">
                <!-- Modal background -->
                <div
                    class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"
                    aria-hidden="true"></div>

                <!-- Modal content -->
                <div
                    class="bg-white rounded-lg overflow-hidden shadow-xl transform transition-all max-w-lg w-full">
                    <!-- Modal header -->
                    <div class="bg-gray-50 px-4 py-3 border-b">
                        <h2 class="text-lg font-semibold">Delete Confirmation</h2>
                    </div>

                    <!-- Modal body -->
                    <div class="p-4">
                        <p class="text-gray-700">Are you sure you want to delete this
                            product?</p>
                    </div>

                    <!-- Modal footer -->
                    <div class="bg-gray-100 px-4 py-3 border-t flex justify-end">
                        <button onclick="deleteProduct()"
                            class="bg-red-500 text-white font-bold py-2 px-4 rounded hover:bg-red-600 mr-2">
                            Delete</button>
                        <button onclick="closeModal()"
                            class="bg-gray-300 text-gray-700 font-bold py-2 px-4 rounded hover:bg-gray-400">
                            Cancel</button>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Category Modal -->
    <div id="categoryModal"
        class="fixed inset-0 z-50 flex items-center justify-center overflow-x-hidden overflow-y-auto outline-none focus:outline-none hidden mt-50">
        <div
            class="relative w-auto max-w-md mx-auto bg-white rounded-md shadow-lg h-[80vh]">
            <div id="content"
                class="relative overflow-x-auto shadow-md sm:rounded-lg mx-auto h-[80vh]">
                <div class="pb-4 bg-white"></div>
                <div class="p-6">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-lg font-medium text-gray-900">Add Category</h3>
                        <!-- Close button -->
                        <button type="button" onclick="toggleModal('categoryModal')"
                            class="text-gray-500 hover:text-gray-700 focus:outline-none focus:text-gray-700">
                            <span class="sr-only">Close</span>
                            <svg class="w-6 h-6" fill="none" stroke="currentColor"
                                viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round"
                                    stroke-linejoin="round" stroke-width="2"
                                    d="M6 18L18 6M6 6l12 12"></path>
                            </svg>
                        </button>
                    </div>
                    
                    
                    <table class="w-full text-sm text-left rtl:text-right text-gray-500">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
        <tr>
            <th scope="col" class="p-4">
                <div class="flex items-center">

                </div>
            </th>
            <th scope="col" class="px-6 ">Category ID</th>
            <th scope="col" class="px-6 ">Category Name</th>

        </tr>
        </thead>
        <tbody>
        <%
            CategoryDao categoryDao = new CategoryDao();
            List<ProductCategoryModel> categories = categoryDao.getAllCategories();
            for (ProductCategoryModel category : categories) {
        %>
        <tr class="bg-white border-b hover:bg-gray-50">
            <td class="w-4 p-4">
                <div class="flex items-center">
                    <!-- Any checkboxes or actions you want to include -->
                </div>
            </td>
            <td class="px-6 "><%= category.getProductCategoryId() %></td>
            <td class="px-6 "><%= category.getCategoryName() %></td>

        </tr>
        <%
            }
        %>
        </tbody>
    </table>
                    <!-- Form -->
                    <form id="addCategoryForm"
                        onsubmit="event.preventDefault(); addCategory();" class="mt-4">
                        <!-- Category name -->
                        <div class="mb-4">
                            <label for="categoryName"
                                class="block text-sm font-medium text-gray-700">Category
                                Name</label> <input type="text" name="categoryName" id="categoryName"
                                class="mt-1 p-2 block w-full border border-gray-300 rounded-md focus:ring-indigo-500 focus:border-indigo-500"
                                placeholder="Enter category name" required>
                        </div>
                        <!-- Submit button -->
                        <div class="flex justify-end">
                            <button type="submit"
                                class="px-3 py-2 text-sm font-medium text-center text-white bg-green-500 hover:bg-green-700 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Add</button>
                        </div>
                    </form>
                    <!-- Message for category added -->
                    <div id="successMessage"
                        class="hidden mt-4 text-green-600 font-semibold">Category
                        added successfully!</div>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
    function toggleModal(modalId) {
        var modal = document.getElementById(modalId);
        modal.classList.toggle('hidden');
        // Hide success message when modal is closed
        if (modal.classList.contains('hidden')) {
            document.getElementById('successMessage').classList.add('hidden');
        }
    }

    function addCategory() {
        // Get the category name input value
        var categoryName = document.getElementById("categoryName").value.trim(); // Trim any leading or trailing whitespace

        // Check if the category name is empty
        if (categoryName === "") {
            alert("Please enter a category name.");
            return; // Exit the function if the category name is empty
        }

        // Send AJAX request to the servlet
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "../AddCategoryServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Handle response from servlet
                // Show success message
                document.getElementById('successMessage').classList.remove('hidden');
                // Add a delay before reloading the page
                setTimeout(function() {
                    location.reload(); // Reload the page after 2 seconds
                }, 1000); // Delay in milliseconds (2 seconds in this example)
            }
        };
        xhr.send("categoryName=" + encodeURIComponent(categoryName)); // Send category name as POST parameter
    }

    function confirmDelete(productId) {
        // Show the modal
        document.getElementById('deleteConfirmationModal').classList.remove('hidden');
        // Set the productId to delete
        document.getElementById('productIdToDelete').value = productId;
    }

    function deleteProduct() {
        // Get the productId from the hidden field
        var productId = document.getElementById('productIdToDelete').value;
        // Redirect to the DeleteProductServlet with the productId
        window.location.href = "<%=request.getContextPath()%>/DeleteProductServlet?productId=" + productId;
    }

    function closeModal() {
        // Hide the modal
        document.getElementById('deleteConfirmationModal').classList.add('hidden');
    }
</script>
</html>
<%
}
%>









 
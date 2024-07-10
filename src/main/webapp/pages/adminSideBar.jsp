<%
    // Retrieve the existing session variable
    javax.servlet.http.HttpSession existingSession = request.getSession(false);

    // Check if session exists and if the role is "admin"
    if (existingSession == null || existingSession.getAttribute("role") == null || !existingSession.getAttribute("role").equals("admin")) {
        // If not admin, redirect to index page
        response.sendRedirect(request.getContextPath() +"/pages/home.jsp");
    } else {
        // Admin is authenticated, allow access to admin panel

        

        %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sidebar</title>
<link href="<%=request.getContextPath()%>/styles/output.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<style>
  /* Add custom CSS for active link */
  .active-link {
    background-color: #4F46E5; /* Change background color for active link */
  }
</style>
</head>
<body>
<div class="flex">
<div class="sidebar w-64 h-[100vh] relative bg-gray-800"> 
  <div class="flex flex-col items-center justify-center h-16 bg-indigo-600 text-white">
                <p class="font-bold text-xl">Admin Panel</p>
                <p class="font-bold text-md">Kyube Gadget</p>
            </div>
  <div class="p-3">
    <ul>
                    
                    <li class="my-2">
                        <a href="<%=request.getContextPath()%>/pages/dashboard.jsp" class="flex items-center p-3 rounded-lg text-white hover:bg-indigo-600 <%= request.getRequestURI().endsWith("dashboard.jsp") ? "active-link" : "" %>">
                            <i class='bx bxs-dashboard mr-3'></i>
                            Dashboard
                        </a>
                    </li>
                    <li class="my-2">
                        <a href="<%=request.getContextPath()%>/pages/orderList.jsp" class="flex items-center p-3 rounded-lg text-white hover:bg-indigo-600 <%= request.getRequestURI().endsWith("orderList.jsp") ? "active-link" : "" %>">
                            <i class='bx bx-list-ol mr-3'></i>
                            Orders
                        </a>
                    </li>
                    <li class="my-2">
                        <a href="<%=request.getContextPath()%>/pages/ManageProduct.jsp" class="flex items-center p-3 rounded-lg text-white hover:bg-indigo-600 <%= request.getRequestURI().endsWith("testManageProduct.jsp") ? "active-link" : "" %>">
                            <i class='bx bx-customize mr-3'></i>
                            Product
                        </a>
                    </li>
                    <li class="my-2">
                        <a href="<%=request.getContextPath()%>/pages/UserList.jsp" class="flex items-center p-3 rounded-lg text-white hover:bg-indigo-600 <%= request.getRequestURI().endsWith("UserList.jsp") ? "active-link" : "" %>">
                            <i class='bx bx-user-circle mr-3'></i>
                            Customer
                        </a>
                    </li>
                    <li class="my-2">
                        <a href="<%=request.getContextPath()%>/pages/SalesList.jsp" class="flex items-center p-3 rounded-lg text-white hover:bg-indigo-600 <%= request.getRequestURI().endsWith("SalesList.jsp") ? "active-link" : "" %>">
                            <i class='bx bx-dollar-circle mr-3'></i>
                            Sales
                        </a>
                    </li>
                    
                    
                    <li class="my-2" >
                    <a href="./logout.jsp" class="flex items-center p-3 rounded-lg text-white hover:bg-indigo-600">Logout</a>
                    </li>
                </ul>
  </div>
  
</div>
</div>
</body>
</html>

 <%
    }
%>

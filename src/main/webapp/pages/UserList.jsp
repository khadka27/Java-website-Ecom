<%
    // Retrieve the existing session variable
    javax.servlet.http.HttpSession existingSession5 = request.getSession(false);

    // Check if session exists and if the role is "admin"
    if (existingSession5 == null || existingSession5.getAttribute("role") == null || !existingSession5.getAttribute("role").equals("admin")) {
        // If not admin, redirect to index page
        response.sendRedirect(request.getContextPath() +"/pages/home.jsp");
    } else {
        // Admin is authenticated, allow access to admin panel

        

        %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, com.kyubegadget.model.UserModel, com.kyubegadget.controller.dao.UserDao"%>
<%@ page
	import="java.sql.*, com.kyubegadget.controller.dbcontroller.DatabaseController"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Information</title>
<link href="<%=request.getContextPath()%>/styles/output.css"
	rel="stylesheet">
</head>

<%@include file="adminSideBar.jsp"%>
<body class="bg-gray-100 flex h-[100vh]  ">
	<div id="content "
		class="relative overflow-x-auto shadow-md sm:rounded-lg">
		<div class="pb-4 bg-white"></div>
		
		<table class="  w-full text-sm text-left rtl:text-right text-gray-500">
			<thead
				class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
				<tr>
					
					<th scope="col" class="px-3 py-3">User ID</th>
					<th scope="col" class="px-3 py-3">User Name</th>
					<th scope="col" class="px-3 py-3">First Name</th>
					<th scope="col" class="px-3 py-3">Last Name</th>
					<th scope="col" class="px-3 py-3">DOB</th>
					<th scope="col" class="px-3 py-3">Email</th>
					<th scope="col" class="px-3 py-3">Address</th>
					<th scope="col" class="px-3 py-3">Phone Number</th>
					<th scope="col" class="px-3 py-3">Gender</th>
					
				</tr>
			</thead>
			<tbody>
				<%
				UserDao userDao = new UserDao();
				List<UserModel> users = userDao.getAllUsers();
				for (UserModel user : users) {
				%>
				<tr class="bg-white border-b hover:bg-gray-50">
					
					<td class="px-3 py-4"><%=user.getUserId()%></td>
					<td class="px-3 py-4"><%=user.getUserName()%></td>
					<td class="px-3 py-4"><input type="text" name="firstName"
						value="<%=user.getFirstName()%>"></td>
					<td class="px-3 py-4"><input type="text" name="lastName"
						value="<%=user.getLastName()%>"></td>
					<td class="px-3 py-4"><input type="date" name="dob"
						value="<%=user.getDob() != null ? user.getDob().toString() : ""%>"></td>

					<td class="px-3 py-4"><input type="email" name="email"
						value="<%=user.getEmail()%>"></td>
					<td class="px-3 py-4"><input type="text" name="address"
						value="<%=user.getAddress()%>"></td>
					<td class="px-3 py-4"><input type="text" name="phoneNumber"
						value="<%=user.getPhoneNumber()%>"></td>
					<td class="px-3 py-4"><input type="text" name="gender"
						value="<%=user.getGender()%>"></td>
	
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	

	
</body>
</html>
<%
    }
%>

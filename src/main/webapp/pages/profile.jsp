<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kyubegadget.model.UserModel" %>
<%@ page import="com.kyubegadget.utils.StringUtils"%>
<%@ page import="com.kyubegadget.controller.dao.ProfileDao" %>
<%
    String username = (String) session.getAttribute("userName");
    if (username == null) {
    	response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
    } else {
    	ProfileDao profileDao = new ProfileDao();
        UserModel userModel = profileDao.getUserByUsername(username);
        if (userModel != null) {
            session.setAttribute("userModel", userModel);
        }
        // Redirect to login page if the session doesn't exist
        
    
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Profile</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	
}

.cont-profile {

	display: flex;
	min-height: 70vh;
	
	/* Ensure container stretches to at least full viewport height */
}





.profile-Detiles, .profile-edit {
	display: block;
}

.profile-edit {
	display: none;
}
.content {
    margin-left: 100px;
    flex: 1;
    padding: 20px;
    margin-right: 500px;
    
}

.profile-heading {
	margin-bottom: 20px;
}

.profile-heading h2 {
	margin: 0;
	font-size: 24px;
	color: #333;
}

.profile-label {
	font-weight: bold;
	color: #333;
}

.profile-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.profile-table th, .profile-table td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	text-align: left;
}

.profile-edit input[type="text"] {
	width: calc(100% - 20px);
	/* Take up full width of parent with a little padding */
	padding: 8px;
	margin: 4px 0;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.profile-edit button {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-top: 10px;
	margin-right: 10px;
}

.profile-edit button.cancel {
	background-color: #ff5555;
}

.profile-edit button:hover {
	background-color: #45a049;
}
</style>


</head>
<body>
<%@ include file="./navigationbar.jsp"%>
	<div class="cont-profile">
	
	
	
		<div id="sidebar">
			<%@include file="./profileSidebar.jsp"%>
		</div>
<%-- <%
        // Check if session is null
       String username = (String) session.getAttribute("userName");
  		System.out.println(username);
        if( username== null) {
            // Redirect to login page
            response.sendRedirect(request.getContextPath()+StringUtils.LOGIN_PAGE);
        } else {
        	
            // Session exists, user is logged in
            String userName = (String) session.getAttribute("userName");
    %>
            
    <%
        }
    %> --%>
    
    
    
    
    
		<div class="content">
			<div class="profile-heading">
				<h2>User Profile</h2>
			</div>
			<div class="profile-Detiles">
				<table class="profile-table">
					<tr>
						<th scope="row">First Name</th>
						<td><%= userModel != null ? userModel.getFirstName() : "" %></td>
					</tr>
					<tr>
						<th scope="row">Last Name</th>
						<td><%= userModel != null ? userModel.getLastName() : "" %></td>
					</tr>
					<tr>
						<th scope="row">PhoneNumber</th>
						<td><%= userModel != null ? userModel.getPhoneNumber() : "" %></td>
					</tr>
					<tr>
						<th scope="row">Gender</th>
						<td><%= userModel != null ? userModel.getGender() : "" %></td>
					</tr>
				
					<tr>
						<th scope="row">Email</th>
						<td><%= userModel != null ? userModel.getEmail() : "" %></td>
					</tr>
					<tr>
						<th scope="row">Address</th>
						<td><%= userModel != null ? userModel.getAddress() : "" %></td>
					</tr>

				

					<!-- Add more rows for other profile details -->
				</table>
			</div>
			
			
			<div class="profile-edit">
    <form action="../EditProfileServlet" method="post">
        <table class="profile-table">
            <tr>
                <th scope="row">First Name</th>
                <td><input required="" type="text" name="firstName" value="<%= userModel != null ? userModel.getFirstName() : "" %> "></td>
            </tr>
            <tr>
                <th scope="row">Last Name</th>
                <td><input required="" type="text" name="lastName" value="<%= userModel != null ? userModel.getLastName() : "" %>"></td>
            </tr>
            <tr>
                <th scope="row">Phone Number</th>
                <td><input required="" type="text" name="phoneNumber" value="<%= userModel != null ? userModel.getPhoneNumber() : "" %>"></td>
            </tr>
            <tr>
                <th scope="row">Email</th>
                <td><input required="" type="text" name="email" value="<%= userModel != null ? userModel.getEmail() : "" %>"></td>
            </tr>
            
            <tr>
                <th scope="row">Address</th>
                <td><input required="" type="text" name="address" value="<%= userModel != null ? userModel.getAddress(): "" %>"></td>
            </tr>
            
            
        </table>
        <button type="submit">Save</button>
        <button type="button" class="cancel" onclick="cancelEdit()">Cancel</button>
    </form>
</div>

		</div>
	</div>
<%@ include file="./footer.jsp"%>
	<script>
		// Get DOM elements
		const editProfileLink = document.getElementById('edit-profile');
		const profileDetiles = document.querySelector('.profile-Detiles');
		const profileEdit = document.querySelector('.profile-edit');

		// Function to toggle between profile details and edit form
		function toggleProfileEdit() {
			profileDetiles.style.display = 'none';
			profileEdit.style.display = 'block';
		}

		// Event listener for clicking on the "Edit Profile" link
		editProfileLink.addEventListener('click', function(event) {
			event.preventDefault();
			toggleProfileEdit();
		});

		// Function to cancel edit and display profile details
		function cancelEdit() {
			profileDetiles.style.display = 'block';
			profileEdit.style.display = 'none';
		}
	</script>

	
</body>
</html>

<%

    }
%>
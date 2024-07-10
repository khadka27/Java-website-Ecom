<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
.sidebar {
	height: 100vh;
    
    background-color: #fb923c;
    color: #fff;
    padding: 20px;
    display: flex;
    flex-direction: column;
}

.avatar {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    margin-bottom: 20px;
}

.options {
    margin-top: 20px;
}

.options ul {
    list-style-type: none;
    padding: 0;
}

.options li {
    margin-bottom: 10px;
}

.options a {
    color: #fff;
    text-decoration: none;
    font-size: 16px;
}

.options a:hover {
    color: black;
    transform: scale(1.1); /* Zoom effect */
    transition: transform 0.3s;
}

</style>
<body>
<div class="sidebar">
    <img src="https://www.w3schools.com/howto/img_avatar.png" alt="Avatar" class="avatar">
    <div class="name">
        <p id="username"><%= (String) session.getAttribute("userName")%></p>
    </div>
    <div class="options">
        <ul>
        	<!-- Side bar for profile page -->
            <li><a href="./profile.jsp" id="edit-profile">Edit Profile</a></li>
            <li><a href="./orderHistory.jsp">Purchase History</a></li>
            <li><a href="./logout.jsp">Logout</a></li>
            
        </ul>
    </div>
</div>

</body>
</html>
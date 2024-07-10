
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to Kyube Gadget</title>
<style>
.min-h-screen {
	min-height: 100vh;
}

.bg-gray-100 {
	background-color: #f3f4f6;
}

.py-6 {
	padding-top: 1.5rem;
	padding-bottom: 1.5rem;
}

.flex {
	display: flex;
}

.flex-col {
	flex-direction: column;
}

.justify-center {
	justify-content: center;
}

.sm\:py-12 {
	padding-top: 3rem;
	padding-bottom: 3rem;
}

.relative {
	position: relative;
}

.py-3 {
	padding-top: 0.75rem;
	padding-bottom: 0.75rem;
}

.sm\:max-w-xl {
	max-width: 36rem;
}

.sm\:mx-auto {
	margin-left: auto;
	margin-right: auto;
}

.absolute {
	position: absolute;
}

.inset-0 {
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
}

.bg-gradient-to-r {
	background-image: linear-gradient(to right, #fbd38d, #ff7e66);
}

.from-orange-300 {
	background-color: #fed7aa;
}

.to-orange-600 {
	background-color: #d05353;
}

.shadow-lg {
	box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px
		rgba(0, 0, 0, 0.05);
}

.transform {
	transform: translateX(0) translateY(0) rotate(0) skewX(0) skewY(0)
		scaleX(1) scaleY(1);
}

.-skew-y-6 {
	transform: skewY(-6deg);
}

.sm\:skew-y-0 {
	transform: skewY(0);
}

.sm\:-rotate-6 {
	transform: rotate(-6deg);
}

.sm\:rounded-3xl {
	border-radius: 1.5rem;
}

.px-4 {
	padding-left: 1rem;
	padding-right: 1rem;
}

.py-10 {
	padding-top: 2.5rem;
	padding-bottom: 2.5rem;
}

.bg-white {
	background-color: #ffffff;
}

.sm\:p-20 {
	padding: 5rem;
}

.heading {
	color: #ed8936;
	font-weight: 700;
	font-family: sans-serif;
}

.alreadyAcc {
	margin-top: -15px;
	margin-left: 5px;
	/* margin-bottom: 20px; */
	font-family: sans-serif;
}

.signUpLink {
	color: #ed8936;
	text-decoration: none;
	font-family: sans-serif;
}

.input-group {
	position: relative;
	margin-top: 25px;
	margin-right: 10px;
}

.input-group .input-area {
	width: 250px;
	border: 1px solid #dadce0;
	padding: 10px 13px;
	font-size: 15px;
	border-radius: 5px;
}

.input-group .input-area:valid+.label {
	top: -8px;
	padding: 0 3px;
	font-size: 14px;
	color: #8d8d8d;
}

.input-group .input-area:focus {
	border: 2px solid #ed8936;
}

.input-group .input-area:focus+.label {
	top: -8px;
	padding: 0 3px;
	font-size: 12px;
	color: #ed8936;
}

.input-group .label {
	color: #8d8d8d;
	font-family: sans-serif;
	position: absolute;
	font-size: 13px;
	top: 13px;
	left: 13px;
	background: #ffffff;
	transition: .2s;
}

.loginButton {
	color: #ffffff;
	background-color: #ed8936;
	border-radius: 6px;
	padding: 10px 40px 10px 40px;
	border: none;
	font-size: 17px;
	margin-top: 35px;
}

.loginButton:hover {
	background-color: #dd6b20;
}
</style>
</head>
<!-- Login page for kyube gadget -->
<body>
	<div
		class="min-h-screen bg-gray-100 py-6 flex flex-col justify-center sm:py-12">
		<div class="relative py-3 sm:max-w-xl sm:mx-auto">
			<div
				class="absolute inset-0 bg-gradient-to-r from-orange-300 to-orange-600 shadow-lg transform -skew-y-6 sm:skew-y-0 sm:-rotate-6 sm:rounded-3xl"></div>
			<div
				class="relative px-4 py-10 bg-white shadow-lg sm:rounded-3xl sm:p-20">
				<div class="max-w-md mx-auto">
					<div>
						<h1 class="heading">Welcome to Kyube Gadget</h1>
					</div>
					<p class="alreadyAcc">
						Don't have an account? <a href="register.jsp" class="signUpLink">Sign
							Up</a>
					</p>

					<form action="../LoginServlet" method="POST">
						<div class="input-group">
							<input type="text" id="userName" required class="input-area"
								name="userName"> <label for="userName" class="label">Username</label>
						</div>
						<div class="input-group" style="margin-top: 20px;">
							<input type="password" id="password" required class="input-area"
								name="password"> <label for="password" class="label">Password</label>
						</div>
						<div class="checkbox-group"
							style="align-items: center; display: flex; margin-top: 10px;">
							<input type="checkbox" id="showPasswordCheckbox"> <label
								for="showPasswordCheckbox"
								style="font-family: sans-serif; font-size: 13px; color: #8d8d8d; margin-left: 5px;">Show
								Password</label>
						</div>

						<%
						String errorMessage = request.getParameter("error");
						if (errorMessage != null && !errorMessage.isEmpty()) {
						%>
						<div style="color: #cc0000;" class="error-message ">
							<%=errorMessage%>
						</div>
						<%
						}
						%>


						<div class="relative">
							<button class="loginButton">Login</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<script>
		document.getElementById("showPasswordCheckbox").addEventListener(
				"change", function() {
					var passwordInput = document.getElementById("password");
					if (this.checked) {
						passwordInput.type = "text";
					} else {
						passwordInput.type = "password";
					}
				});
	</script>
</body>

</html>
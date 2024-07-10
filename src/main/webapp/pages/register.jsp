<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Kyube Gadget</title>
    <style>
    
    	body{
    		height: 100vh;
    		overflow-y: hidden;
    	}
        .main-box {
            margin-top:30px;
            
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
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }

        .transform {
            transform: translateX(0) translateY(0) rotate(0) skewX(0) skewY(0) scaleX(1) scaleY(1);
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
            color: #fb923c;
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
            width: 180px;
            border: 1px solid #dadce0;
            padding: 10px 13px;
            font-size: 15px;
            border-radius: 5px;
        }


        select#gender.input-area {
            width: 208px;
        }

        .input-group .input-area:valid + .label {
            top: -8px;
            padding: 0 3px;
            font-size: 14px;
            color: #8d8d8d;
        }
        
        .input-group .input-area:focus {
            border: 2px solid #ed8936;
        }

        .input-group .input-area:focus + .label {
            top: -8px;
            padding: 0 3px;
            font-size: 12px;
            color: #ed8936;
        }

        .input-group .label{
            color: #8d8d8d;
            font-family: sans-serif;
            position: absolute;
            font-size: 15px;
            top: 13px;
            left: 13px;
            background: #ffffff;
            transition: .2s;
        }
  
        .loginButton {
            color: #ffffff;
            background-color: #fb923c;
            border-radius: 6px;
            padding: 10px 40px 10px 40px;
            border: none;
            font-size: 17px;
            margin-top: 35px;
        }

        .loginButton:hover {
            background-color: #dd6b20;
        }
        .error{
        	color:red;
        }

    </style>
</head>

<body>
    <div class="main-box  bg-gray-100 py-6 flex flex-col justify-center sm:py-12">
        <div class="relative py-3 sm:max-w-xl sm:mx-auto">
            <div class="absolute inset-0 bg-gradient-to-r from-orange-300 to-orange-600 shadow-lg transform -skew-y-6 sm:skew-y-0 sm:-rotate-6 sm:rounded-3xl"></div>
            <div class="relative px-4 py-10 bg-white shadow-lg sm:rounded-3xl sm:p-20">
                <div class="max-w-md mx-auto">
                    <div>
                        <h1 class="heading">Welcome to Kyube Gadget</h1>
                    </div>
                    <p class="alreadyAcc">Already have an account? <a href="login.jsp" class="signUpLink">Sign In</a></p>

                    <form id="registrationForm" action="../RegisterServlet" method="post"
			onsubmit="return validateForm()">
                        <div style="display: flex;">
                            <div>
                                <div class="input-group">
                                    <input type="text" id="firstName" required class="input-area" name="firstName">
                                    <label for="firstName" class="label">First name</label>
                                    <span class="error" id="firstNameError"></span>
                                </div>
                                <div class="input-group">
                                    <input type="date" id="dob" required class="input-area" name="dob">
                                    <label for="dob" class="label">Dob (dd/mm/yyyy)</label>
                                    <span class="error" id="dobError"></span>
                                </div>
                                <div class="input-group">
                                    <input type="text" id="phoneNumber" required class="input-area" name="phoneNumber">
                                    <label for="phoneNumber" class="label">Phone Number</label>
                                    <span class="error" id="phoneNumberError"></span>
                                </div>
                                <div class="input-group">
                                    <input type="text" id="address" required class="input-area" name="address">
                                    <label for="address" class="label">Address</label>
                                    <span class="error" id="addressError"></span>
                                </div>
                                      
                                <div class="input-group">
                                    <input type="text" id="userName" required class="input-area" name="userName">
                                    <label for="userName" class="label">Username</label>
                                    <span class="error" id="userNameError"></span>
                                </div>
                                <div class="checkbox-group" style="align-items: center; display: flex; margin-top: 10px;">
                                    <input type="checkbox" id="showPasswordCheckbox">
                                    <label for="showPasswordCheckbox" style="font-family: sans-serif; font-size: 13px; color: #8d8d8d; margin-left: 5px;">Show Password</label>
                                </div>
                            </div>
                            <div>
                                <div class="input-group">
                                    <input type="text" id="lastName" required class="input-area" name="lastName">
                                    <label for="lastName" class="label">Last Name</label>
                                    <span class="error" id="lastNameError"></span>
                                </div>
                                <div class="input-group">
                                    <select id="gender" required class="input-area" name="gender">
                                        <option value="" disabled selected hidden>Select Gender</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Other">Other</option>
                                    </select>
                                    <label for="gender" class="label">Gender (M/F/O)</label>
                                </div>
                                <div class="input-group">
                                    <input type="text" id="email" required class="input-area" name="email">
                                    <label for="email" class="label">Email</label>
                                    <span class="error" id="emailError"></span>
                                </div>
                                
                                <div class="input-group">
                                    <input type="password" id="password" required class="input-area" name="password">
                                    <label for="password" class="label">Password</label>
                                    <span class="error" id="passwordError"></span>
                                </div>
                                
                                <div class="input-group">
                                    <input type="password" id="rePassword" required class="input-area" name="rePassword">
                                    <label for="rePassword" class="label">Re-enter password</label>
                                    <span class="error" id="rePasswordError"></span>
                                </div>
                            </div>
                        </div>

                                <div class="relative">
                                    <button class="loginButton">Sign Up</button>
                                </div>
                    </form>

                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById("showPasswordCheckbox").addEventListener("change", function() {
            var passwordInput = document.getElementById("password");
            var retypePasswordInput = document.getElementById("rePassword");
    
            if (this.checked) {
                passwordInput.type = "text";
                retypePasswordInput.type = "text";
            } else {
                passwordInput.type = "password";
                retypePasswordInput.type = "password";
            }
        });
    </script>
    <script>
		function validateForm() {
			var isValid = true;

			// Reset previous error messages
			var errorElements = document.getElementsByClassName("error");
			for (var i = 0; i < errorElements.length; i++) {
				errorElements[i].innerText = "";
			}

			// Username validation
			var userName = document.getElementById("userName").value;
			if (userName.trim() === "" || userName.length < 6) {
				document.getElementById("userNameError").innerText = "Username must be at least 6 characters.";
				isValid = false;
			}

			// First name validation
			var firstName = document.getElementById("firstName").value;
			if (firstName.trim() === "") {
				document.getElementById("firstNameError").innerText = "Please enter your first name.";
				isValid = false;
			}

			// Last name validation
			var lastName = document.getElementById("lastName").value;
			if (lastName.trim() === "") {
				document.getElementById("lastNameError").innerText = "Please enter your last name.";
				isValid = false;
			}

			// Email validation
			var email = document.getElementById("email").value;
			if (email.trim() === "") {
				document.getElementById("emailError").innerText = "Please enter your email.";
				isValid = false;
			}

			// Phone number validation
			var phoneNumber = document.getElementById("phoneNumber").value;
			if (!/^\d{10}$/.test(phoneNumber)) {
				document.getElementById("phoneNumberError").innerText = "Phone number must be a 10-digit number.";
				isValid = false;
			}

			// Password validation
			var password = document.getElementById("password").value;
			if (!/^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-zA-Z]).{6,}$/.test(password)) {
				document.getElementById("passwordError").innerText = "Password must be at least 6 characters and contain at least one digit, one special character, and one letter.";
				isValid = false;
			}

			// Re-enter password validation
			var rePassword = document.getElementById("rePassword").value;
			if (rePassword.trim() === "") {
				document.getElementById("rePasswordError").innerText = "Please re-enter your password.";
				isValid = false;
			} else if (rePassword !== password) {
				document.getElementById("rePasswordError").innerText = "Passwords do not match.";
				isValid = false;
			}

			// Date of Birth validation
			var dob = document.getElementById("dob").value;
			var dobDate = new Date(dob);
			var currentDate = new Date();
			if (dobDate >= currentDate) {
				document.getElementById("dobError").innerText = "Date of birth must be before today's date.";
				isValid = false;
			}

			// Gender validation
			var gender = document.getElementById("gender").value;
			if (gender.trim() === "") {
				
			}

			// Address validation
			var address = document.getElementById("address").value;
			if (address.trim() === "") {
				document.getElementById("addressError").innerText = "Please enter your address.";
				isValid = false;
			}

			return isValid;
		}
	</script>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
	    $('#userName').blur(function() { // Use blur event instead of click for better UX
	        var userName = $('#userName').val();
	        $.ajax({
	            url: '../RegisterServlet',
	            type: 'GET',
	            data: {
	                userName: userName
	            },
	            success: function(response) {
	                if (response === 'true') {
	                    $('#userNameError').text('Username exists!');
	                } else {
	                    $('#userNameError').text('Available').css('color', 'green');
	                }
	            },
	            error: function() {
	                $('#userNameError').text('Error occurred while checking username.');
	            }
	        });
	    });
	});
	
	</script>

	<script>
	//for email
	$(document).ready(function() {
    $('#email').blur(function() { // Use blur event instead of click for better UX
        var email = $('#email').val();
        $.ajax({
            url: '../RegisterServlet',
            type: 'GET',
            data: {
                email: email
            },
            success: function(response) {
                if (response === 'true') {
                    $('#emailError').text('Email exists!');
                } else {
                    $('#emailError').text('Available').css('color', 'green');
                }
            },
            error: function() {
                $('#emailError').text('Error occurred while checking email.');
            }
        });
    });
});

	
	</script>

	<script>
	
	
	//for phone number
			
    $(document).ready(function() {
        $('#phoneNumber').blur(function() {
            var phoneNumber = $('#phoneNumber').val();
            $.ajax({
                url: '../RegisterServlet', // Update with the correct servlet mapping
                type: 'GET',
                data: {
                    phoneNumber: phoneNumber
                },
                success: function(response) {
                    if (response === 'true') {
                        $('#phoneNumberError').text('Phone number exists!').css('color', 'red');
                    } else {
                        $('#phoneNumberError').text('Available').css('color', 'green');
                    }
                },
                error: function() {
                    $('#phoneNumberError').text('Error occurred while checking phone number.');
                }
            });
        });
    });
    
    
    
    </script>
    
</body>

</html>
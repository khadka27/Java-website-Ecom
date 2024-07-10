<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kyubegadget.controller.dao.ProfileDao"%>
<%@ page import="com.kyubegadget.model.UserModel"%>
<%@ page import="com.kyubegadget.model.Cart"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.kyubegadget.controller.dao.ProductDao"%>
<%@ page import="com.kyubegadget.utils.StringUtils"%>

<%
// Check if the user is logged in
String username = (String) session.getAttribute("userName");
if (username == null) {
	// Redirect to the login page if not logged in
	response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
}

// Retrieve the user's information from the session
ProfileDao profileDao = new ProfileDao();
UserModel user = profileDao.getUserByUsername(username);
if (user != null) {
	session.setAttribute("userModel", user);
}

// Retrieve the cart items from the session
ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");
List<Cart> productList = null;

if (cartList != null) {
	ProductDao productDao = new ProductDao();
	productList = productDao.getCartProduct(cartList);
	request.setAttribute("cartList", cartList);
	session.setAttribute("cartList", cartList);
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bill</title>
<!-- Tailwind CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
	
</head>
<body class="bg-gray-100">
	<div class="bg-white rounded-lg shadow-lg px-8 py-10 max-w-xl mx-auto">
		<div class="flex items-center justify-between mb-8">
			<div class="flex items-center">
				<img class="h-8 w-8 mr-2"
					src="../assets/logo.jpg"
					alt="Logo" />
				<div class="text-gray-700 font-semibold text-lg">Kyube Gadgets</div>
			</div>
			<div class="text-gray-700">
				<div class="font-bold text-xl mb-2">INVOICE</div>
				<div class="text-sm">
					Date:
					<%=java.time.LocalDate.now()%></div>
				<div class="text-sm">
					Invoice no: KG<%=Math.round(Math.random() * 1000000)%></div>

			</div>
		</div>
		<div class="border-b-2 border-gray-300 pb-8 mb-8">
			<h2 class="text-2xl font-bold mb-4">
				Bill To:
				<%=user.getUserName()%></h2>
			<div class="text-gray-700 mb-2"><%=user.getFirstName() + " " + user.getLastName()%></div>
			<div class="text-gray-700 mb-2"><%=user.getAddress()%></div>
			<div class="text-gray-700 mb-2">NEPAL</div>
			<div class="text-gray-700"><%=user.getEmail()%></div>
		</div>
		<table class="w-full text-left mb-8">
			<thead>
				<tr>
					<th class="text-gray-700 font-bold uppercase py-2">Name</th>
					<th class="text-gray-700 font-bold uppercase py-2">Quantity</th>
					<th class="text-gray-700 font-bold uppercase py-2">Price</th>
					<th class="text-gray-700 font-bold uppercase py-2">Total</th>
				</tr>
			</thead>
			<tbody>
				<!-- Iterate over the cart items and display details -->
				<%
				double subtotal = 0;
				if (productList != null) {
					for (Cart item : productList) {
						double totalPrice = item.getPrice() * item.getStock();
						subtotal += totalPrice;
				%>
				<tr>
					<td class="py-4 text-gray-700"><%=item.getProductName()%></td>
					<td class="py-4 text-gray-700"><%=item.getStock()%></td>
					<td class="py-4 text-gray-700">$<%=item.getPrice()%></td>
					<td class="py-4 text-gray-700">$<%=totalPrice%></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
		<%
		// Format subtotal, tax, and total to two decimal places
		String formattedSubtotal = String.format("%.2f", subtotal);
		String formattedTax = String.format("%.2f", subtotal * 0.10);
		String formattedTotal = String.format("%.2f", subtotal + (subtotal * 0.10));
		%>

		<div class="flex justify-end mb-8">
			<div class="text-gray-700 mr-2">Subtotal:</div>
			<div class="text-gray-700">
				$<%=formattedSubtotal%></div>
		</div>
		<div class="flex justify-end mb-8">
			<div class="text-gray-700 mr-2">Tax (10%):</div>
			<div class="text-gray-700">
				$<%=formattedTax%></div>
		</div>
		<div class="flex justify-end mb-8">
			<div class="text-gray-700 mr-2">Total:</div>
			<div class="text-gray-700 font-bold text-xl">
				$<%=formattedTotal%></div>
		</div>
		<div class="button-container flex justify-end">
			<button onclick="cancel()"
				class="bg-red-500 hover:bg-red-600 text-white font-bold py-2 px-4 rounded mr-4">
				Go to home</button>

			<button onclick="saveBill()"
				class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
				Save Bill</button>
		</div>
		<div class="thank-you text-center mt-8">
			<h2 class="text-2xl font-bold mb-4">Thank you!</h2>
			<p class="text-gray-700">Thank you for shopping with us. We hope
				to see you again soon. Have a good day!</p>
		</div></body>
<script>
    function cancel(){
        // Redirect to the home page
        window.location.href = "<%=request.getContextPath()%>/pages/clearCart.jsp";

    }

    function saveBill() {
        // Generate bill content
        var billContent = "Bill\n\n";
        billContent += "User Information\n";
        billContent += "Name: <%=user.getFirstName() + ' ' + user.getLastName()%>\n";
        billContent += "Address: <%=user.getAddress()%>\n";
        billContent += "Phone Number: <%=user.getPhoneNumber()%>\n";
        billContent += "Email: <%=user.getEmail()%>\n";
        billContent += "Order Date: <%=java.time.LocalDate.now()%> <%=java.time.LocalTime.now()%>\n\n";

        billContent += "Bill Details\n";
        billContent += "Name\tBrand\tPrice\tQuantity\tTotal Price\n";
        <!-- Iterate over the cart items and add details to the bill content -->
        <%if (productList != null) {%>
            <%for (Cart item : productList) {%>
                var totalPrice_<%=item.getProductId()%> = <%=item.getPrice()%> * <%=item.getStock()%>;
                billContent += "<%=item.getProductName()%>\t<%=item.getProductBrand()%>\t$" + <%=item.getPrice()%> + "\t" + <%=item.getStock()%> + "\t$" + totalPrice_<%=item.getProductId()%> + "\n";
            <%}%>
        <%}%>

        // Create a new Blob object containing the bill content
        var blob = new Blob([billContent], { type: "text/plain;charset=utf-8" });

        // Create a link element to download the text file
        var link = document.createElement("a");
        link.href = window.URL.createObjectURL(blob);

        // Set the filename for the text file
        var fileName = "bill.txt";
        link.download = fileName;

        // Append the link to the document body and trigger the click event to initiate download
        document.body.appendChild(link);
        link.click();

        // Remove the link element from the document body
        document.body.removeChild(link);
        window.location.href = "<%=request.getContextPath()%>/pages/clearCart.jsp";
    }

</script>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kyubegadget.controller.dao.*" %>
<%@ page import="com.kyubegadget.model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kyubegadget.utils.StringUtils" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    String username = (String) session.getAttribute("userName");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
    } else {
        UserDao userDao = new UserDao();
        //get user order sales history from database 
        List<SalesModel> salesHistory = userDao.getUserOrderSalesHistory(username);

        
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Sales History</title>
    <style>
    
    body{
    	padding:0px;
    	margin:0px;
    }
    .sidebar{
    	margin-top:80px;
    	position:fixed;
    }
    .navbarok{
    	position:fixed;
    	width:100%;	
    }
    .sales-container{
    	margin-top:100px;
    	margin-left:150px;
    	margin-bottom:20px;
    }
        /* CSS styles for the sales history page */
.sales-history-table {
    width: 100%; /* Reduce the width of the table */
     /* Add margins to center the table */
    border-collapse: collapse;
    margin-left:200px;
}

.sales-history-table th,
.sales-history-table td {
    border: 1px solid #dddddd;
    padding: 8px;
    text-align: left;
}

.sales-history-table th {
    background-color: #fb923c;
}

.sales-history-table img {
    max-width: 80px; /* Reduce the maximum width of the image */
    max-height: 80px; /* Reduce the maximum height of the image */
}

        
    </style>
</head>
    
<body >
    <div class="navbarok">
     <%@ include file="./navigationbar.jsp"%>
    </div>
    <div class="flex flex-cols">
    <div id="sidebar">
			<%@include file="./profileSidebar.jsp"%>
		</div>
    
    <div class="sales-container ">
    
        <h2 class="text-center text-2xl">User Order History</h2>
        <table class="sales-history-table">
            <thead>
                <tr class="text-white">
                     <!-- <th>Sale ID</th> -->
                    <th>Product Name</th>
                    <th>Product Image</th>
                    <th>Sale Date</th>
                    <th>Quantity</th>
                    <th>Unit Price</th>
                    <th>Total Price</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    ProductDao productDao = new ProductDao();
                    for (SalesModel sale : salesHistory) {
                        ProductModel product = productDao.getProductById(sale.getProductId());
                %>
                
                <tr>
                    <%-- <td><%= sale.getSaleId() %></td> --%>
                    <td><%= product.getProductName() %></td>
                    <td><img src="<%=request.getContextPath()%>/images/<%= product.getImageUrl() %>"
                            alt="Product Image" class="product-image"></td>
                    <td><%= sale.getSaleDate().format(dateFormatter) %></td>
                    <td><%= sale.getQuantity() %></td>
                    <td>$<%= sale.getUnitPrice() %></td>
                    <td>$<%= sale.getTotalPrice() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    </div>
    
</body>
</html>

<%
    }
%>
   

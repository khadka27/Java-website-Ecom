<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kyubegadget.model.OrderModel, com.kyubegadget.controller.dao.OrderDao"%>
<%@ page import="java.sql.*, com.kyubegadget.controller.dbcontroller.DatabaseController"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order List</title>
    <!-- Add the CSS reference here -->
    <link href="<%=request.getContextPath()%>/styles/output.css" rel="stylesheet">
</head>

<body class="bg-gray-100 flex">
    <%@include file="adminSideBar.jsp"%>
    <div id="content" class="flex-1  relative overflow-x-auto shadow-md sm:rounded-lg h-[100vh]">
        <div class="pb-4 bg-white"></div>
        <table class="w-full text-sm text-left rtl:text-right text-gray-500">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                    
                    
                    <th scope="col" class="px-6 py-3">Order ID</th>
                    <th scope="col" class="px-6 py-3">Order Date</th>
                    <th scope="col" class="px-6 py-3">User ID</th>
                    <th scope="col" class="px-6 py-3">Total Amount</th>
                    <th scope="col" class="px-6 py-3">Status</th>
                    <th scope="col" class="px-6 py-3">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                	// fetch orderlist from database to show in admin panel
                    OrderDao orderDao = new OrderDao();
                    List<OrderModel> orders = orderDao.getAllOrders();
                    for (OrderModel order : orders) {
                %>
                <tr class="bg-white border-b hover:bg-gray-50">
                    
                    <td class="px-6 py-4"><%=order.getOrderId()%></td>
                    <td class="px-6 py-4"><%=order.getOrderDate()%></td>
                    <td class="px-6 py-4"><%=order.getUserId()%></td>
                    <td class="px-6 py-4">$<%=order.getTotalAmount()%></td>
                    <td id="status_<%=order.getOrderId()%>" class="px-6 py-4"><%=order.getOrderStatus()%></td>
                    <td class="px-6 py-4">
                        <form id="changeOrderForm_<%=order.getOrderId()%>" action="../ChangeOrderStatusServlet" method="post">
                            <input type="hidden" name="orderId" value="<%=order.getOrderId()%>">
                            <div class="relative inline-block text-left">
                                <select name="status" onchange="changeOrderStatus(<%=order.getOrderId()%>)" class="px-4 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                                    <option selected>Change Status</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Processing">Processing</option>
                                    <option value="Shipping">Shipping</option>
                                    <option value="Delivered">Delivered</option>
                                </select>
                            </div>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>

<script>
    function changeOrderStatus(orderId) {
        var formId = 'changeOrderForm_' + orderId;
        document.getElementById(formId).submit();
    }

    // JavaScript function to update order status color
    function updateOrderStatusColor() {
        var statuses = document.querySelectorAll('[id^="status_"]');
        statuses.forEach(function(status) {
            var orderId = status.id.split("_")[1];
            var statusText = status.innerText;
            var statusColor;
            switch (statusText) {
                case "Pending":
                    statusColor = "#FFA500"; // Orange
                    break;
                case "Processing":
                    statusColor = "#1E90FF"; // Dodger Blue
                    break;
                case "Shipping":
                    statusColor = "#228B22"; // Forest Green
                    break;
                case "Delivered":
                    statusColor = "#008000"; // Green
                    break;
                default:
                    statusColor = "inherit";
                    break;
            }
            status.style.color = statusColor;
        });
    }

    // Call the function once the document is loaded
    document.addEventListener("DOMContentLoaded", updateOrderStatusColor);
</script>

</html>

 
 
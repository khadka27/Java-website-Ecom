<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kyubegadget.controller.dao.*" %>
<%@ page import="com.kyubegadget.model.SalesModel" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.kyubegadget.controller.dao.OrderDao" %>
<%@ page import="com.kyubegadget.model.OrderModel" %>
<%
UserDao userDao = new UserDao();
    // Retrieve male and female user counts
    int[] maleFemaleOthersCount = userDao.getMaleFemaleOthersCount();
    int maleCount = maleFemaleOthersCount[0];
    int femaleCount = maleFemaleOthersCount[1];
    int othersCount = maleFemaleOthersCount[2];
%>
<%
    // Retrieve the existing session variable
    javax.servlet.http.HttpSession existingSession1 = request.getSession(false);

    // Check if session exists and if the role is "admin"
    if (existingSession1 == null || existingSession1.getAttribute("role") == null || !existingSession1.getAttribute("role").equals("admin")) {
        // If not admin, redirect to index page
        response.sendRedirect(request.getContextPath() +"/pages/home.jsp");
    } else {
        // Admin is authenticated, allow access to admin panel


        // Calculate total sales and total earnings
        double totalEarnings = 0;
        int totalSales = 0;
        SalesDao salesDao = new SalesDao();
        List<SalesModel> allSales = salesDao.getAllSales();
        for (SalesModel sale : allSales) {
            totalEarnings += sale.getTotalPrice();
            totalSales += sale.getQuantity();
        }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/styles/output.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
.sidebar {
    position: fixed;
    
}
#image-revenue{

	width:200px;
	height:200px;
}
#image-user{
	width:50px;
	height:50px;
}
.chart-container-sexratio{
	width:300px;
}

</style>
</head>

<body class="flex h-screen">


<div class="sidebar">
<%@include file="adminSideBar.jsp"%>
</div>
	<div class="ml-64 mx-auto  px-4 ">
        <h1 class="text-2xl font-semibold mb-4">Admin Dashboard</h1>
        <div class="grid grid-cols-2  gap-4">
            <!-- Total Users Card -->
            <div class="bg-white rounded-lg shadow-md p-6 grid grid-cols-2  ">
                <div class="row-span-2  ">
					<h2 class="text-lg font-semibold mb-4">Total Users </h2>
                 	      
                	<p class="text-4xl font-bold text-blue-500">
                    <%= UserDao.getTotalUsers() %>
                	</p>
                </div>
                <div class="grid grid-cols-2">
                	<img id="image-user" alt="revenue" src="<%=request.getContextPath()%>/assets/user.png">                
                </div>
            </div>
            
            <!-- Total Products Card -->
            <div class="bg-white rounded-lg shadow-md p-6 grid grid-cols-2">
            	<div class="row-span-2  ">
					<h2 class="text-lg font-semibold mb-4">Total Products </h2>
                 	      
                	<p class="text-4xl font-bold text-green-500">
                    <%= ProductDao.getTotalProducts() %>
                	</p>
                </div>
                <div class="grid grid-cols-2">
                	<img id="image-user" alt="revenue" src="<%=request.getContextPath()%>/assets/product.svg">                
                </div>
            
                
            </div>
            
            
            <!-- Total Categories Card -->
            <div class="bg-white rounded-lg shadow-md p-6 grid grid-cols-2">
            
            <div class="row-span-2  ">
					<h2 class="text-lg font-semibold mb-4">Total Categories </h2>
                 	      
                	<p class="text-4xl font-bold text-yellow-500">
                    <%= CategoryDao.getTotalCategories() %>
                	</p>
                </div>
                <div class="grid grid-cols-2">
                	<img id="image-user" alt="revenue" src="<%=request.getContextPath()%>/assets/categories.png">                
                </div>
            
                
            </div>
            
            <!-- Total Sales Card -->
            <div class="bg-white rounded-lg shadow-md p-6 grid grid-cols-2">
            
            
            	<div class="row-span-2  ">
					<h2 class="text-lg font-semibold mb-4">Total Sales </h2>
                 	      
                	<p class="text-4xl font-bold text-purple-500">
                    <%= totalSales %>
                	</p>
                </div>
                <div class="grid grid-cols-2">
                	<img id="image-user" alt="revenue" src="<%=request.getContextPath()%>/assets/sales.png">                
                </div>
                
            </div>
            
            <!-- Total Earnings Card -->
            <div class="bg-white rounded-lg shadow-md p-6 ">
                <h2 class="text-lg font-semibold mb-4">Total Earnings</h2>
                <p class="text-4xl font-bold text-red-500">
                    <%=  "$"+String.format("%.2f", totalEarnings) %>
                   
                </p>
                <img id="image-revenue" alt="revenue" src="<%=request.getContextPath()%>/assets/revenue.png">
            </div>
            <div class="" style="width: 500px; height: 300px;">
		    	<h1 class="text-lg font-semibold mb-4">Revenue by Category</h1>
		        <canvas id="revenueByCategoryChart"></canvas>
		    </div>
					
		    <div class="mb-5" style="width: 350px; height: 250px;">
		    	<h1 class="text-lg font-semibold mb-4">Order Status Distribution</h1>
		        <canvas id="orderStatusChart"></canvas>
		    </div>
        <div class="chart-container-sexratio ">
			<h1 class="text-lg font-semibold mb-4">Pie Chart Showing Customer Sex Ratio</h1>
			    <canvas id="pieChart" width="200" height="100"></canvas>
			</div>
			<div class="chart-container mb-5 rounded-lg shadow-md">
			<h1 class="text-lg font-semibold mb-4">Bar Graph Sales by category</h1>
			    <canvas id="dashboardChart" width="400" height="200"></canvas>
			</div>
			
            
            
	</div>
	</div>
	

</body>
<script>
    // java script code for creating bar graph
    var data = {
        labels: ["Total Users", "Total Products", "Total Categories"],
        datasets: [{
            label: "Count",
            data: [<%= UserDao.getTotalUsers() %>, <%= ProductDao.getTotalProducts() %>, <%= CategoryDao.getTotalCategories() %>],
            backgroundColor: [
                'rgba(255, 99, 132,0.2)',
                'rgba(54, 162, 235,0.2)',
                'rgba(255, 206, 86,0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)'
            ],
            borderWidth: 1
        }]
    };

    // Configure the chart
    var options = {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    };

    // Get the canvas element
    var ctx = document.getElementById('dashboardChart').getContext('2d');

    // Initialize the chart
    var dashboardChart = new Chart(ctx, {
        type: 'bar',
        data: data,
        options: options
    });
</script>

<script>
// js code for creating piechart to show customers sex ratio
        var maleCount = <%= maleFemaleOthersCount[0] %>;
        var femaleCount = <%= maleFemaleOthersCount[1] %>;
        var othersCount = <%= maleFemaleOthersCount[2] %>;

        // Prepare data for the chart
        var data = {
            labels: ["Male", "Female", "Other"],
            datasets: [{
                label: "Count",
                data: [maleCount, femaleCount, othersCount],
                backgroundColor: [
                    'rgba(255, 99, 132)',
                    'rgba(54, 162, 235)',
                    'rgba(255, 206, 86)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)'
                ],
                borderWidth: 1
            }]
        };

        // Configure the chart
        var options = {
            plugins: {
                legend: {
                    position: 'bottom' // Position the legend at the bottom
                },
                tooltip: {
                    enabled: true // Show tooltips
                }
            }
        };

        // Get the canvas element
        var ctx = document.getElementById('pieChart').getContext('2d');

        // Initialize the chart
        var dashboardChart = new Chart(ctx, {
            type: 'pie',
            data: data,
            options: options
        });
    </script>

<script>
        // Get order status distribution data from the servlet/controller
        var statusData = {
            <% OrderDao orderDao = new OrderDao();
               Map<String, Integer> statusDistribution = orderDao.getOrderStatusDistribution();
               for (Map.Entry<String, Integer> entry : statusDistribution.entrySet()) { %>
                   "<%= entry.getKey() %>": <%= entry.getValue() %>,
               <% } %>
        };

        // Convert status data to arrays for Chart.js
        var statusLabels = Object.keys(statusData);
        var statusCounts = Object.values(statusData);

        // Create Chart.js chart
        var ctx = document.getElementById('orderStatusChart').getContext('2d');
        var orderStatusChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: statusLabels,
                datasets: [{
                    data: statusCounts,
                    backgroundColor: [
                        '#228B22',
                        '#FFA500',
                        '#1E90FF'
                        // Add more colors as needed
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                // Customize chart options if needed
            }
        });
</script>



<script>

// code to make a bargraph for sales of product by category
    // Get revenue by category data from the servlet/controller
    var revenueData = {
        <% 
           Map<String, Double> revenueByCategory = salesDao.getRevenueByCategory();
           for (Map.Entry<String, Double> entry : revenueByCategory.entrySet()) { %>
               "<%= entry.getKey() %>": <%= entry.getValue() %>,
           <% } %>
    };

    // Convert revenue data to arrays for Chart.js
    var categoryLabels = Object.keys(revenueData);
    var categoryRevenues = Object.values(revenueData);

    // Function to generate random colors
    function getRandomColor() {
        var letters = '0123456789ABCDEF';
        var color = '#';
        for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }

    // Generate random colors for each dataset
    var backgroundColors = [];
    for (var i = 0; i < categoryLabels.length; i++) {
        backgroundColors.push(getRandomColor());
    }

    // Create Chart.js chart
    var ctx = document.getElementById('revenueByCategoryChart').getContext('2d');
    var revenueByCategoryChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: categoryLabels,
            datasets: [{
                label: 'Revenue',
                data: categoryRevenues,
                backgroundColor: backgroundColors,
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
    
</html>
<%
    }
%>
<%@ page import="com.kyubegadget.controller.dao.CategoryDao" %>
<%@ page import="com.kyubegadget.controller.dao.ProductDao" %>
<%@ page import="com.kyubegadget.model.ProductModel" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Random" %>
<%@ page import="com.kyubegadget.utils.StringUtils"%>
<%@page import="java.util.*"%>
<%@ page import="com.kyubegadget.model.ProductCategoryModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/styles/output.css"
	rel="stylesheet">
</head>


<%
// Get all products
ProductDao productDao = new ProductDao();
List<ProductModel> allProducts = productDao.getAllProducts();

// Shuffle all products randomly
Collections.shuffle(allProducts, new Random());

// Pick 20 random products
List<ProductModel> products = allProducts.subList(0, Math.min(allProducts.size(), 15));

// Rest of the code remains the same as before ...

%>
<body>
<%@ include file="navigationbar.jsp" %>

<div id="addToCartMessage" style="display: none;">Added to Cart</div>

<div class="max-w-7xl mt-4 mx-auto relative overflow-hidden">
  <div id="slider" class="w-full flex">
    <div class="slide w-full flex-shrink-0">
      <img src="<%=request.getContextPath()%>/assets/1.png" alt="Slide 1" class="w-full">
    </div>
    <div class="slide w-full flex-shrink-0">
      <img src="<%=request.getContextPath()%>/assets/2.png" alt="Slide 2" class="w-full">
    </div>
    <div class="slide w-full flex-shrink-0">
      <img src="<%=request.getContextPath()%>/assets/3.png" alt="Slide 3" class="w-full">
    </div>
  </div>
  <button id="prevBtn" class="absolute left-0 top-1/2 transform -translate-y-1/2 bg-gray-800 text-white p-2 rounded-full shadow-lg z-10">
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
    </svg>
  </button>
  <button id="nextBtn" class="absolute right-0 top-1/2 transform -translate-y-1/2 bg-gray-800 text-white p-2 rounded-full shadow-lg z-10">
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
    </svg>
  </button>
</div>


<section class="mx-auto mb-5 grid w-fit grid-cols-2 justify-center justify-items-center gap-x-4 gap-y-20 md:grid-cols-3 lg:grid-cols-5">

    <% for (ProductModel product : products) { %>
    <div class="relative m-5 flex w-full max-w-[12rem] flex-col overflow-hidden rounded-lg border border-gray-100 bg-white shadow-md">
        <a class="relative mx-2 mt-2 flex h-40 overflow-hidden rounded-xl" href="<%=request.getContextPath()%>/pages/insideProduct.jsp?id=<%=product.getProductId()%>">
            <img class="object-cover" src="<%=request.getContextPath()%>/images/<%=product.getImageUrl()%>" alt="<%=product.getProductName()%>" />
        </a>
        <div class="mt-2 px-3 pb-3">
            <a href="#">
                <h5 class="text-sm tracking-tight text-slate-900"><%=product.getProductName()%></h5>
            </a>
            <div class="mt-1 mb-3 flex items-center justify-between">
                <p>
                    <span class="text-lg font-bold text-slate-900">$
			                    <%=product.getPrice()%></span>
                   
                    
                </p>
            </div>

             
            <% if (session.getAttribute("userName") != null) { %>
            
            
            <a href="#" class="flex items-center justify-center rounded-md bg-orange-400 px-3 py-1.5 text-center text-xs font-medium text-white hover:bg-gray-700 focus:outline-none focus:ring-4 focus:ring-blue-300"
                onclick="addToCartWithAlert('<%=product.getProductId()%>'); return false;">
                <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                    stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                </svg>
                Add to cart
            </a>
            
            <% } else { %>
            <% if (session.getAttribute("userName") != null) { %>
            <a href="#" class="flex items-center justify-center rounded-md bg-orange-400 px-3 py-1.5 text-center text-xs font-medium text-white hover:bg-gray-700 focus:outline-none focus:ring-4 focus:ring-blue-300"
                onclick="addToCartWithAlert('<%=product.getProductId()%>'); return false;">
                <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                    stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                </svg>
                Add to cart
            </a>
            <% } else { %>
            <a href="<%=request.getContextPath()%>/pages/login.jsp" class="flex items-center justify-center rounded-md bg-orange-400 px-3 py-1.5 text-center text-xs font-medium text-white hover:bg-gray-700 focus:outline-none focus:ring-4 focus:ring-blue-300"
                >
                <svg xmlns="http://www.w3.org/2000/svg" class="mr-1 h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                    stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                </svg>
                Add to cart
            </a>
            <% } %>
                        <% } %>
        </div>
    </div>
    <% } %>

</section>

<%@ include file="footer.jsp" %>

</body>
<script>

// js for image slider
    const slides = document.querySelectorAll('.slide');
    const prevBtn = document.getElementById('prevBtn');
    const nextBtn = document.getElementById('nextBtn');
    let currentSlide = 0;
  
    function showSlide(index) {
      slides.forEach(slide => slide.style.display = 'none');
      slides[index].style.display = 'block';
    }
  
    function nextSlide() {
      currentSlide++;
      if (currentSlide >= slides.length) {
        currentSlide = 0;
      }
      showSlide(currentSlide);
    }
  
    function prevSlide() {
      currentSlide--;
      if (currentSlide < 0) {
        currentSlide = slides.length - 1;
      }
      showSlide(currentSlide);
    }
  
    // Set initial slide
    showSlide(currentSlide);
  
    // Auto play
    setInterval(nextSlide, 3000);
  
    // Event listeners for prev/next buttons
    prevBtn.addEventListener('click', prevSlide);
    nextBtn.addEventListener('click', nextSlide);
    
    
    // for add to cart
    function addToCart(productId) {
        fetch('<%=request.getContextPath()%>/AddToCartServlet?productId=' + productId)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Failed to add item to cart');
                }
                return response.json();
            })
            .then(data => {
                updateCartCount(data.count);
                
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
     
     

    
    function addToCartWithAlert(productId) {
        addToCart(productId); // Call the addToCart function
		
        // Display the message
        showAddToCartMessage();
    }
    
    
    function showAddToCartMessage() {
        var messageElement = document.getElementById("addToCartMessage");
        messageElement.style.display = "block"; // Show the message
        setTimeout(function() {
            messageElement.style.display = "none"; // Hide the message after 3 seconds (adjust as needed)
        }, 3000);
    }
    
  </script>
</html>
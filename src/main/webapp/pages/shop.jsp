<%@ page import="com.kyubegadget.controller.dao.CategoryDao" %>
<%@ page import="com.kyubegadget.controller.dao.ProductDao" %>
<%@ page import="com.kyubegadget.model.ProductModel" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kyubegadget.utils.StringUtils"%>
<%@page import="java.util.*"%>
<%@ page import="com.kyubegadget.model.ProductCategoryModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%
    // Get the category ID from the request parameter
    String categoryIdString = request.getParameter("categoryId");

    // Convert the categoryIdString to an int
    int categoryId = 0; // default value in case of conversion failure
    
	
    try {
    if (categoryIdString != null) { // Check if categoryIdString is not null
        categoryId = Integer.parseInt(categoryIdString);
    }
} catch (NumberFormatException e) {
    // Handle the exception if categoryIdString cannot be parsed to an int
    e.printStackTrace(); // Or log the error
}

    
    // Get the search query parameter from the request
    String searchQuery = request.getParameter("query");

    // Initialize variables
    ProductDao productDao = new ProductDao();
    List<ProductModel> products = null;
    String message = "";

    // Check if a search query is provided
    if (searchQuery != null && !searchQuery.isEmpty()) {
        // If a search query is provided, perform a search by product name
        products = productDao.searchProductsByName(searchQuery);
        message = "Search Results";
    } else if (categoryId != 0) {
        // If a category is selected, get products of that category
        products = productDao.getProductsByCategoryId(categoryId);
        message = "Products in Category";
    } else {
        // If no search query or category is provided, get all products
        products = productDao.getAllProducts();
        message = "All Products";
    }
    
 
    
    


%>

<%
// Fetch categories from the database or wherever they are stored
CategoryDao categoryDao = new CategoryDao();
List<ProductCategoryModel> categories = categoryDao.getAllCategories();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/styles/output.css"
	rel="stylesheet">

</head>
<body>

<%@ include file="navigationbar.jsp" %>

<div id="addToCartMessage" style="display: none;">Added to Cart</div>
<!-- search bar -->
<form action="<%=request.getContextPath()%>/SearchProductServlet"

					method="GET" class="max-w-md mx-auto mt-2">   
    <label for="default-search" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
    <div class="relative">
        <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
            <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
            </svg>
        </div>
        <input type="text" name="query" id="default-search" class="block w-full p-4 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-orange-500 focus:border-orange-500  " placeholder="Search Gadgets" required />
        <button type="submit" class="text-white absolute end-2.5 bottom-2.5 bg-orange-400 hover:bg-orange-500 focus:ring-4 focus:outline-none focus:ring-orange-400 font-medium rounded-lg text-sm px-4 py-2 ">Search</button>
    </div>
</form>




<form id="sort-form" class="sort p-4">
	
    <button type="button" class="text-black bg-gray-100 hover:bg-gray-200 focus:ring-4 focus:outline-none focus:ring-gray-300 font-medium rounded-lg text-sm px-4 py-2.5 text-center inline-flex items-center" onclick="sortProducts('asc')">
       Low To High
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="black" class="w-6 h-6">
  <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 6.75 12 3m0 0 3.75 3.75M12 3v18" />
</svg>
        

        
    </button>
    <button type="button" class="text-black bg-gray-100 hover:bg-gray-200 focus:ring-4 focus:outline-none focus:ring-gray-300 font-medium rounded-lg text-sm px-4 py-2.5 text-center inline-flex items-center" onclick="sortProducts('desc')">
        High to Low
        
<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="black" class="w-6 h-6">
  <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 17.25 12 21m0 0-3.75-3.75M12 21V3" />
</svg>
        
    </button>
</form>

<!-- categories sidebar -->

<div class="flex ">

    
<div class=" items-center  p-4">
    <button id="dropdownDefault" data-dropdown-toggle="dropdown"
      class="text-white bg-orange-500 hover:bg-orange-600 focus:ring-4 focus:outline-none focus:ring-orange-300 font-medium rounded-lg text-sm px-4 py-2.5 text-center inline-flex items-center">
      Filter by category
      <svg class="w-4 h-4 ml-2" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24"
        xmlns="http://www.w3.org/2000/svg">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
      </svg>
    </button>
  
    <!-- Dropdown menu -->
    <div id="dropdown" class="z-10 hidden w-[10rem] p-3 bg-white rounded-lg shadow">
      <h6 class="mb-3 text-sm font-medium text-gray-900">
        Category
      </h6>
      <%
								for (ProductCategoryModel pm : categories) {
								%>
      
      
      <ul class="space-y-2 text-sm" aria-labelledby="dropdownDefault">
      
      	<a class=" " href="<%=request.getContextPath()%>/pages/shop.jsp?categoryId=<%=pm.getProductCategoryId()%>">
        <li class="flex items-center w-full h-4 bg-gray-100 border-gray-300 rounded text-orange-500 focus:ring-orange-500 focus:ring-2">
        
  
            <%= pm.getCategoryName() %>
          
        </li>
        <%
								}
								%>
      </a>
  
        
      </ul>
    </div>


    
</div>


 <!-- product view -->
 


<section id="product-list" class="mx-auto mb-5 grid w-fit grid-cols-2 justify-center justify-items-center gap-x-4 gap-y-20 md:grid-cols-3 lg:grid-cols-5">

    <% for (ProductModel product : products) { %>
    <div class="product-item  relative m-5 flex w-full max-w-[12rem] flex-col overflow-hidden rounded-lg border border-gray-100 bg-white shadow-md" data-price="<%=product.getPrice()%>">
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
                    <%-- Add the discounted price here if available --%>
                    
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


</div>
<!-- Display message if no products found -->
    <div class="w-full text-center mt-5">
        <p><%=message%></p>
    </div>

<button class="text-white bg-orange-500 hover:bg-orange-600 focus:ring-4 focus:outline-none focus:ring-orange-300 font-medium rounded-lg p-2 m-4 sticky fixed bottom-4 right-4 " onclick="topFunction()" id="myBtn" title="Go to top">
    
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
        <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 15.75 7.5-7.5 7.5 7.5" />
      </svg>

</button> 


<script>
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
    
    

    // for categories
  document.addEventListener("DOMContentLoaded", function() {
    document.getElementById('dropdownDefault').addEventListener('click', function() {
      document.getElementById('dropdown').classList.toggle('hidden');
    });
  });


    


// for scroll to top

        // Get the button:
let mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
} 





    
  
    
    function sortProducts(order) {
        // Fetch the product elements
        const productElements = document.querySelectorAll('.product-item');

        // Convert the NodeList to an array
        const productsArray = Array.from(productElements);

        // Sort the products by price
        productsArray.sort((a, b) => {
            const priceA = parseFloat(a.dataset.price);
            const priceB = parseFloat(b.dataset.price);

            if (order === 'asc') {
                return priceA - priceB;
            } else if (order === 'desc') {
                return priceB - priceA;
            }
        });

        // Clear the current product list
        const productList = document.getElementById('product-list');
        productList.innerHTML = '';

        // Append the sorted products to the product list
        productsArray.forEach(product => {
            productList.appendChild(product);
        });
    }


    
   
  
</script>			
<%@ include file="footer.jsp" %>

</body>

</html>
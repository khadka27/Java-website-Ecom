<%
String userName1 = (String) session.getAttribute("userName");
%>
<%
String currentPage = request.getRequestURI();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>
<link href="<%=request.getContextPath()%>/styles/output.css"
    rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<style>
  /* Add custom CSS for active link */
  .active-link {
    text-decoration: underline;
    
  }
</style>
</head>
<body>

<nav style="background-color:#fb923c" class="p-3"> 
<!-- <nav style="background-color: #121212 " class="p-3"> -->
        <div class="max-w-7xl mx-auto px-4">
          <div class="flex justify-between items-center h-16">
            <!-- Logo -->
            <div class="flex-shrink-0">
              <a href="<%=request.getContextPath()%>/pages/home.jsp" class="flex items-center">
                <img class="h-8" src="https://p1.hiclipart.com/preview/175/373/242/chibi-kyuubi-illustration-of-naruto-fox-png-clipart.jpg" alt="GadgetSite">
                <span class="ml-2 text-white font-semibold">Kyube Gadget</span>
              </a>
            </div>
      
            <!-- Mobile menu button -->
            <div class="flex md:hidden">
              <button id="mobile-menu-btn" class="text-white">
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                </svg>
              </button>
            </div>
      
            <!-- Navigation links -->
            <div class="hidden md:flex flex-grow justify-end">
              <ul class="flex items-center space-x-4">
                <li><a href="<%=request.getContextPath()%>/pages/home.jsp" class="text-white hover:text-gray-200 <%= currentPage.endsWith("home.jsp") ? "active-link" : "" %>">Home</a></li>
                <li><a href="<%=request.getContextPath()%>/pages/shop.jsp" class="text-white hover:text-gray-200 <%= currentPage.endsWith("shop.jsp") ? "active-link" : "" %>">Shop</a></li>
                <li><a href="<%=request.getContextPath()%>/pages/about.jsp" class="text-white hover:text-gray-200 <%= currentPage.endsWith("about.jsp") ? "active-link" : "" %>">About</a></li>
                <li><a href="<%=request.getContextPath()%>/pages/contact.jsp" class="text-white hover:text-gray-200 <%= currentPage.endsWith("contact.jsp") ? "active-link" : "" %>">Contact Us</a></li>
                
                <% if (userName1 != null) { %>

                  <li>
                    <div class="flex items-center">
                      <a href="#" class="flex h-9 w-24 justify-center rounded-3xl items-center my-1 mx-4 text-sm text-gray-700 font-medium hover:text-indigo-500">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="white">
                          <path d="M12 2a5 5 0 1 0 5 5 5 5 0 0 0-5-5zm0 8a3 3 0 1 1 3-3 3 3 0 0 1-3 3zm9 11v-1a7 7 0 0 0-7-7h-4a7 7 0 0 0-7 7v1h2v-1a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v1z"></path>
                        </svg>
                        <p class="ml-2 text-white"><%=userName1%></p>
                      </a>
                    </div>
                  </li>

                  <li>
                    <div class="flex items-center">
                      <a href="<%=request.getContextPath()%>/pages/profile.jsp" class="flex h-9 w-24 justify-center rounded-3xl items-center my-1 mx-4 text-sm text-gray-700 font-medium hover:text-indigo-500">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="white">
                          <path d="M12 2a5 5 0 1 0 5 5 5 5 0 0 0-5-5zm0 8a3 3 0 1 1 3-3 3 3 0 0 1-3 3zm9 11v-1a7 7 0 0 0-7-7h-4a7 7 0 0 0-7 7v1h2v-1a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v1z"></path>
                        </svg>
                        <p class="ml-2 text-white">Profile</p>
                      </a>
                    </div>
                  </li>

                <% } else { %>

                  <li>
                    <div class="flex items-center">
                      <a href="<%=request.getContextPath()%>/pages/register.jsp" class="flex h-9 w-24 justify-center rounded-3xl items-center my-1 mx-4 text-sm text-gray-700 font-medium hover:text-indigo-500">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="white">
                          <path d="M12 2a5 5 0 1 0 5 5 5 5 0 0 0-5-5zm0 8a3 3 0 1 1 3-3 3 3 0 0 1-3 3zm9 11v-1a7 7 0 0 0-7-7h-4a7 7 0 0 0-7 7v1h2v-1a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v1z"></path>
                        </svg>
                        <p class="ml-2 text-white">Register</p>
                      </a>
                    </div>
                  </li>

                  <li>
                    <div class="flex items-center">
                      <a href="<%=request.getContextPath()%>/pages/login.jsp" class="flex h-9 w-24 justify-center rounded-3xl items-center my-1 mx-4 text-sm text-gray-700 font-medium hover:text-indigo-500">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="white">
                          <path d="M12 2a5 5 0 1 0 5 5 5 5 0 0 0-5-5zm0 8a3 3 0 1 1 3-3 3 3 0 0 1-3 3zm9 11v-1a7 7 0 0 0-7-7h-4a7 7 0 0 0-7 7v1h2v-1a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v1z"></path>
                        </svg>
                        <p class="ml-2 text-white">Login</p>
                      </a>
                    </div>
                  </li>

                <% } %>

                <li>
                  <div class="flex items-center">
                    <a href="<%=request.getContextPath()%>/pages/cart.jsp" class="flex h-9 w-24 justify-center rounded-3xl items-center my-1 mx-4 text-sm text-gray-700 font-medium hover:text-indigo-500">
                      <span class="text-white font-bold ">${cartList.size()}</span> 
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="white">
                        <path d="M21.822 7.431A1 1 0 0 0 21 7H7.333L6.179 4.23A1.994 1.994 0 0 0 4.333 3H2v2h2.333l4.744 11.385A1 1 0 0 0 10 17h8c.417 0 .79-.259.937-.648l3-8a1 1 0 0 0-.115-.921zM17.307 15h-6.64l-2.5-6h11.39l-2.25 6z"></path>
                        <circle cx="10.5" cy="19.5" r="1.5"></circle>
                        <circle cx="17.5" cy="19.5" r="1.5"></circle>
                      </svg>
                      <p class="ml-2 text-white">Cart</p>
                    </a>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      
        <!-- Mobile menu -->
        <div style="background-color:#fb923c" id="mobile-menu" class="md:hidden hidden ">
          <ul class="pt-4 pb-2 px-2 space-y-2">
            <li><a href="<%=request.getContextPath()%>/pages/home.jsp" class="block text-white font-semibold hover:text-gray-200 <%= currentPage.endsWith("home.jsp") ? "active-link" : "" %>">Home</a></li>
            <li><a href="<%=request.getContextPath()%>/pages/shop.jsp" class="block text-white font-semibold hover:text-gray-200 <%= currentPage.endsWith("shop.jsp") ? "active-link" : "" %>">Shop</a></li>
            <li><a href="<%=request.getContextPath()%>/pages/about.jsp" class="block text-white font-semibold hover:text-gray-200 <%= currentPage.endsWith("about.jsp") ? "active-link" : "" %>">About</a></li>
            <li><a href="<%=request.getContextPath()%>/pages/contact.jsp" class="block text-white font-semibold hover:text-gray-200 <%= currentPage.endsWith("contact.jsp") ? "active-link" : "" %>">Contact Us</a></li>
            <li><a href="<%=request.getContextPath()%>/pages/login.jsp" class="block text-white font-semibold hover:text-gray-200 <%= currentPage.endsWith("login.jsp") ? "active-link" : "" %>">Login</a></li>
            <li><a href="<%=request.getContextPath()%>/pages/cart.jsp" class="block text-white font-semibold hover:text-gray-200 <%= currentPage.endsWith("cart.jsp") ? "active-link" : "" %>">Cart</a></li>
          </ul>
        </div>
      </nav>

<script>
  //for navbar
  document.getElementById('mobile-menu-btn').addEventListener('click', function() {
    document.getElementById('mobile-menu').classList.toggle('hidden');
  });
</script>
</body>
</html>

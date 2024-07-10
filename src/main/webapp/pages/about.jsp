<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="<%= request.getContextPath() %>/styles/output.css" rel="stylesheet"> 
</head>
<body>
<!-- using navigation bar -->
<%@ include file="navigationbar.jsp"%>

        <div class="2xl:container 2xl:mx-auto lg:py-16 lg:px-20 md:py-12 md:px-6 py-9 px-4">
            <div class="flex flex-col lg:flex-row justify-between gap-8">
                <div class="w-full lg:w-5/12 flex flex-col justify-center">
                    <h1 class="text-3xl lg:text-4xl font-bold leading-9 text-gray-800 dark:text-white pb-4">About Us</h1>
                    <p class="font-normal text-base leading-6 text-gray-600 dark:text-white">We Kyube Gadgets are offical partnered sellers of electronics gadgets of numerous
                     tech brands. We sell gadgets of all types such as phones, tv, drones, etc</p>
                </div>
                
            </div>
    
            <div class="flex lg:flex-row flex-col justify-between gap-8 pt-12">
                <div class="w-full lg:w-5/12 flex flex-col justify-center">
                    <h1 class="text-3xl lg:text-4xl font-bold leading-9 text-gray-800 dark:text-white pb-4">Our Story</h1>
                    <p class="font-normal text-base leading-6 text-gray-600 dark:text-white"> Started with our love of technology and gadgets, we 5 co-founders converted our passion to business. We import directly from
                    the manufacturers which enables us to sell product cheaper than the market price. With our commitment, we present you Kyube Gadget's ecommerce website which is made using html, css jsp and java servlet. The website is fully functional
                     allowing customers to find product, search by name as well as sort it. Customers can add iterms to cart and then check out to complete the purchase process. </p>
                </div>
                <div class="w-full lg:w-8/12 lg:pt-8">
                    <div class="grid md:grid-cols-4 sm:grid-cols-2 grid-cols-1 lg:gap-4 shadow-lg rounded-md">
                        <div class="p-4 pb-6 flex justify-center flex-col items-center">
                            <img  src="<%= request.getContextPath() %>/assets/aashish.jpg" alt="Alexa featured Image" />
                           
                            <p class="font-medium text-xl leading-5 text-gray-800 dark:text-white mt-4">Aashish</p>
                        </div>
                        <div class="p-4 pb-6 flex justify-center flex-col items-center">
                            
                            <img  src="<%= request.getContextPath() %>/assets/abishek.jpg" alt="Olivia featured Image" />
                            <p class="font-medium text-xl leading-5 text-gray-800 dark:text-white mt-4">Abishek</p>
                        </div>
                        <div class="p-4 pb-6 flex justify-center flex-col items-center">
                            
                            <img  src="<%= request.getContextPath() %>/assets/saurabh.jpg" alt="Liam featued Image" />
                            <p class="font-medium text-xl leading-5 text-gray-800 dark:text-white mt-4">Saurabh</p>
                        </div>
                        <div class="p-4 pb-6 flex justify-center flex-col items-center">
                            
                            <img  src="<%= request.getContextPath() %>/assets/rahul.jpg" alt="Elijah featured image" />
                            <p class="font-medium text-xl leading-5 text-gray-800 dark:text-white mt-4">Rahul</p>
                        </div>
                        <div class="p-4 pb-6 flex justify-center flex-col items-center">
                            <img  src="<%= request.getContextPath() %>/assets/yougeen.jpg" alt="Yogeen Adhikari" />
                            
                            <p class="font-medium text-xl leading-5 text-gray-800 dark:text-white mt-4">Yogeen</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
<%@ include file="footer.jsp"%>
</body>
</html>
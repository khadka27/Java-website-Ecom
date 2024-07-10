
package com.kyubegadget.utils;

import java.util.UUID;

import javax.servlet.http.Part;

public class StringUtils {

	public static final String userName = "userName";
	public static final String firstName = "firstName";
	public static final String lastName = "lastName";
	public static final String email = "email";
	public static final String phoneNumber = "phoneNumber";
	public static final String password = "password";
	public static final String rePassword = "rePassword";
	public static final String dob = "dob";
	public static final String gender = "gender";
	public static final String address = "address";

	// Start messages
	public static final String SUCCESS_REGISTER_MESSAGE = "Successfully Registered!";
	public static final String REGISTER_ERROR_MESSAGE = "Please correct the form data.";
	public static final String ADDRESS_ERROR_MESSAGE = "Please fill address properly";
	public static final String SERVER_ERROR_MESSAGE = "An unexpected server error occurred. ";
	public static final String SUCCESS_MESSAGEERROR_MESSAGE = "successMessage";
	public static final String ERROR_MESSAGE = "errorMessage";

	// End messages

	// Start JSP Route
	public static final String LOGIN_PAGE = "/pages/login.jsp";
	public static final String REGISTER_PAGE = "/pages/register.jsp";
	public static final String WELCOME_PAGE = "/pages/index.jsp";
	public static final String HOME_PAGE = "/pages/home.jsp";
	public static final String SHOP_PAGE = "pages/shop.jsp";
	public static final String ADMIN_PAGE = "/pages/dashboard.jsp";
	public static final String ERROR_PAGE = "/pages/Error.jsp";
	// End JSP Routes

	// Start Servlet Route
	public static final String REGISTER_SERVLET = "/RegisterServlet";
	public static final String LOGIN_SERVLET = "/loginServlet";
	// End Servlet Route

	// productCategory

	public static final String SUCCESS_ADD_CATEGORY = "Category added Successfully Registered!";
	public static final String ADD_CATEGORY_ERROR_MESSAGE = "category cannot be added";

	// product
	public static final String PRODUCT_ADDED_MESSAGE = "product added successfully";
	public static final String ADD_PRODUCT_ERROR_MESSAGE = "product not added error";

	public static final String productName = "productName";
	public static final String productBrand = "productBrand";
	public static final String price = "price";
	public static final String productDescription = "productDescription";
	public static final String imageUrl = "imageUrl";
	public static final String productCategoryId = "productCategoryId";
	public static final String stock = "stock";

	public static final String ADD_PRODUCT = "/pages/addProduct.jsp";

	// profile

	public static final String PROFILE_PAGE = "/pages/profile.jsp";
	public static final String SUCCESS_MESSAGE = "successMessage";
	
	//cart
	public static final String CART_PAGE = "/pages/cart.jsp";
	
	//user list to show in admin
	public static final String USER_LIST = "/pages/UserList.jsp";
	///orderList.jsp
	public static final String ORDER_LIST = "/pages/orderList.jsp";
	//bill
	public static final String BILL_PAGE = "/pages/Bill.jsp";
	
	
	
	// admin product page
	
	public static final String PRODUCT_LIST_PAGE = "/pages/ManageProduct.jsp";

	
	
	
	
}

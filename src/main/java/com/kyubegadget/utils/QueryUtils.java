package com.kyubegadget.utils;

public class QueryUtils {

	
	
	
	//query to get product
	public static final String insertProductQuery = "INSERT INTO product ( productName, productBrand, price, productDescription, imageUrl, productCategoryId, stock)"
			+ "VALUES" + "(?,?,?,?,?,?,?)";
	public static final String insertCategoryQuery = "INSERT INTO productCategory (productCategoryId, categoryName)"
			+ "VALUES" + "(?,?)";
	
	
	
	// profile update 
	public static final String UPDATE_USER_DETAILS = "UPDATE Users SET firstName = ?, lastName = ?, email = ?, "
	        + "phoneNumber = ?, gender = ? WHERE userName = ?";

	public static final String UPDATE_ADDRESS_DETAILS = "UPDATE Address SET city = ?, province = ?, "
	        + "country = ?, postalCode = ? WHERE userId = ?";

	
	
	
	
	//product category
	
	public static final String ADD_CATEGORY = "INSERT INTO productCategory (categoryName)  values (?)";
	

    
    
    //for categories
    public static final String GET_ALL_CATEGORIES = "SELECT productCategoryId,categoryName from productCategory";
    public static final String GET_CATEGORY_NAME = "SELECT categoryName from productCategory where productCategoryId = ?";
    public static final String COUNT_ALL_CATEGORIES = "SELECT COUNT(*) FROM productcategory";
    


    
    //for user DAO
	public static final String insertUserQuery = "INSERT INTO Users (userName, firstName, lastName, email, phoneNumber,password, dob, gender, address) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)";

	public static final String GET_HASHED_PASSWORD = "SELECT password FROM Users WHERE userName = ?";

	public static final String GET_LOGIN_USER_INFOS = "SELECT userName, password FROM Users WHERE userName = ? And password = ?";

	public static final String GET_LOGIN_ADMIN_INFOS = "SELECT userType FROM users WHERE userName = ? AND password = ?";

	public static final String GET_USERDATA_BY_USERNAME ="SELECT * FROM users WHERE userName = ?";
	
	public static final String GET_SEX_RATIO = "SELECT SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) AS maleCount, " +
            "SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) AS femaleCount, " +
            "SUM(CASE WHEN gender NOT IN ('Male', 'Female') THEN 1 ELSE 0 END) AS othersCount " +
            "FROM Users";
	
	
	public static final String GET_USERDATA_BY_EMAIL = "SELECT * FROM users WHERE email = ?";
	
	public static final String GET_USERDATA_BY_PHONENUMBER = "SELECT * FROM users WHERE phoneNumber = ?";
	
	public static final String GET_USERID_BY_USERNAME = "SELECT userId FROM Users WHERE userName = ?";
	
	public static final String GET_USER = "SELECT * from Users";

	public static final String GET_DETAILS_BYUSERNAME = "SELECT * FROM Users WHERE userName = ?";
	
	public static final String UPDATE_USER_BY_USERNAME = "UPDATE users SET firstName=?, lastName=?,  email=?, address=?, phoneNumber=? WHERE userName= ?";

	
	public static final String COUNT_TOTAL_USERS = "SELECT COUNT(*) FROM users";
	
	
	
	
	
	
	
    
    // for product
    
    public static final String ADD_PRODUCT = "INSERT product (productName, productBrand, price, productDescription, imageUrl, productCategoryId, stock) VALUES (?, ?, ?, ?, ?, ?, ?)";
    
    public static final String GET_ALL_PRODUCTS = "SELECT * from product";
    
    public static final String GET_PRODUCT_BY_ID = "SELECT * FROM product WHERE productId = ?";
    
    public static final String DELETE_PRODUCT = "DELETE FROM product WHERE productId = ?";
    
    public static final String SEARCH_PRODUCT_BY_NAME = "SELECT * FROM product WHERE productName LIKE ?";
    public static final String GET_PRODUCT_PRICE = "SELECT price FROM product WHERE productId = ?";
    public static final String GET_PRODUCT_SORTBY_PRICE = "SELECT * FROM product ORDER BY price";
    
    public static final String UPDATE_PRODUCT = "UPDATE product SET productName=?, productBrand=?, price=?, productDescription=?, imageUrl=?, productCategoryId=?, stock=? WHERE productId=?";
    
    
    // delete user
    public static final String DELETE_USER = "DELETE FROM Users WHERE userName = ?";
    
    
    public static final String GET_PRODUCTS_BY_CATEGORY_ID = "SELECT * FROM product WHERE productCategoryId = ?";    
    
    //Cart
    public static final String GET_CART_PRODUCT = "SELECT * FROM product WHERE productId = ?";

    
    
    
    // for sales dao
    
    public static final String INSERT_SALES_QUERY = "INSERT INTO Sales (productId, userId, saleDate, quantity, unitPrice, totalPrice) VALUES (?, ?, ?, ?, ?, ?)";
    
    
    public static final String GET_ALL_SALES = "SELECT * FROM Sales";
    
    
    public static final String GET_REVENUE_BY_CATEGORY = "SELECT ProductCategory.categoryName, SUM(Sales.totalPrice) AS revenue " +
            "FROM Sales INNER JOIN Product ON Sales.productId = Product.productId " +
            "INNER JOIN ProductCategory ON Product.productCategoryId = ProductCategory.productCategoryId " +
            "GROUP BY ProductCategory.categoryName";
    
    
    public static final String GET_USER_SALES_HISTORY = "SELECT saleId, productId, userId, saleDate, quantity, unitPrice, totalPrice FROM sales WHERE userId = ? ORDER BY saleDate DESC";
    public static final String GET_USER_ORDER_HISTORY = "SELECT orderId, orderDate, totalAmount, orderStatus FROM Orders WHERE userId = ? ORDER BY orderDate DESC";
    
    
    //for order dao
    
    public static final String INSERT_ORDER_QUERY = "INSERT INTO Orders (orderDate, userId, totalAmount, orderStatus) VALUES (?, ?, ?, ?)";
    
    public static final String GET_ALL_ORDERS = "SELECT * FROM Orders";
    
    public static final String UPDATE_ORDER_STATUS = "UPDATE Orders SET orderStatus = ? WHERE orderId = ?";
    
    public static final String GET_COUNT_ORDER_STATUS = "SELECT orderStatus, COUNT(*) AS count FROM Orders GROUP BY orderStatus";
    
    
    
    // for order line dao
    
    public static final String INSERT_ORDERLINE_QUERY = "INSERT INTO OrderLine (orderId, productId, quantity) VALUES (?, ?, ?)";

}
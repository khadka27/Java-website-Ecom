package com.kyubegadget.model;

public class ProductModel {

	
	private int productId;
    private String productName;
    private String productBrand;
    private double price;
    private String productDescription;
    private String imageUrl;
    private int productCategoryId;
    private int stock;
    
    
    
    // constructor to add product as we dont have to add product id
	public ProductModel( String productName, String productBrand, double price, String productDescription,
			String imageUrl, int productCategoryId, int stock) {
		super();
	
		this.productName = productName;
		this.productBrand = productBrand;
		this.price = price;
		this.productDescription = productDescription;
		this.imageUrl = imageUrl;
		this.productCategoryId = productCategoryId;
		this.stock = stock;
	}
	
	
	// another constructor 
	public ProductModel(int productId, String productName, String productBrand, double price, String productDescription, String imageUrl, int productCategoryId, int stock) {
        this.productId = productId;
        this.productName = productName;
        this.productBrand = productBrand;
        this.price = price;
        this.productDescription = productDescription;
        this.imageUrl = imageUrl;
        this.productCategoryId = productCategoryId;
        this.stock = stock;
    }
	
	
	// try constructor
	public ProductModel(int productId, String productName, String productBrand, double price, String productDescription,  int productCategoryId, int stock) {
        this.productId = productId;
        this.productName = productName;
        this.productBrand = productBrand;
        this.price = price;
        this.productDescription = productDescription;
        
        this.productCategoryId = productCategoryId;
        this.stock = stock;
    }
	
	
	
	
	public ProductModel() {
		
	}
	
	


	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public int getProductCategoryId() {
		return productCategoryId;
	}
	public void setProductCategoryId(int productCategoryId) {
		this.productCategoryId = productCategoryId;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
    
    
}

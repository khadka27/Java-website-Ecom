package com.kyubegadget.model;

public class ProductCategoryModel {

	
	public int productCategoryId;
	public String categoryName;
	
	
	public ProductCategoryModel(int productCategoryId, String categoryName) {
		this.productCategoryId = productCategoryId;
		this.categoryName = categoryName;
		
	}
	


	public ProductCategoryModel() {
		
	}
	
	public ProductCategoryModel( String categoryName) {
		
		this.categoryName = categoryName;
	}

	public int getProductCategoryId() {
		return productCategoryId;
	}

	
	
	

	public void setProductCategoryId(int productCategoryId) {
		this.productCategoryId = productCategoryId;
	}





	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "ProductCategoryModel [productCategoryId=" + productCategoryId + ", categoryName=" + categoryName + "]";
	}
	
	
	
	
	
}

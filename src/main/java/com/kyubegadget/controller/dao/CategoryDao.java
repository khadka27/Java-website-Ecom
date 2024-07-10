package com.kyubegadget.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kyubegadget.controller.dbcontroller.DatabaseController;
import com.kyubegadget.model.ProductCategoryModel;
import com.kyubegadget.utils.QueryUtils;



public class CategoryDao {

	
	//this method is used to add category 
	public int addCategory(ProductCategoryModel productCategoryModel) {
		try (Connection conn = DatabaseController.getConn()) {
            // Update data in the users table
            String updateUserQuery = QueryUtils.ADD_CATEGORY;
            PreparedStatement categoryStatement = conn.prepareStatement(updateUserQuery);

            
            categoryStatement.setString(1, productCategoryModel.getCategoryName());
            
            int categoryInserted = categoryStatement.executeUpdate();
            categoryStatement.close();

            return categoryInserted; // Return the result of address insertion

        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return -1; // or handle the exception as needed
        }
    }
	
	
	//get all categories from database
	public List<ProductCategoryModel> getAllCategories() {
	    List<ProductCategoryModel> categories = new ArrayList<>();
	    try (Connection conn = DatabaseController.getConn()) {
	        String getAllCategoriesQuery = QueryUtils.GET_ALL_CATEGORIES;
	        PreparedStatement statement = conn.prepareStatement(getAllCategoriesQuery);
	        ResultSet resultSet = statement.executeQuery();

	        while (resultSet.next()) {
	            ProductCategoryModel category = new ProductCategoryModel();
	            //checking
	            category.setProductCategoryId(resultSet.getInt("productCategoryId")); // Set the productCategoryId
	            category.setCategoryName(resultSet.getString("categoryName"));
	            categories.add(category);
	        }
	        
	        // Debugging: Print retrieved categories
	        System.out.println("Retrieved categories: " + categories);

	    } catch (SQLException | ClassNotFoundException ex) {
	        ex.printStackTrace();
	    }
	    return categories;
	}
	
	
	// Method to retrieve category name by category ID
    public String getCategoryNameById(int categoryId) {
        String categoryName = null;
        try (Connection conn = DatabaseController.getConn()) {
            // Prepare SQL query to select category name based on category ID
            String query = QueryUtils.GET_CATEGORY_NAME;
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setInt(1, categoryId);

            // Execute query and retrieve result set
            ResultSet resultSet = statement.executeQuery();

            // Check if result set has next row (should have only one)
            if (resultSet.next()) {
                // Retrieve category name from result set
                categoryName = resultSet.getString("categoryName");
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return categoryName;
    }
	
    // Method to get total categories and show in dashboard
    public static int getTotalCategories() throws SQLException, ClassNotFoundException {
        int totalCategories = 0;
        String sql = QueryUtils.COUNT_ALL_CATEGORIES; // Assuming 'product_categories' is the table name
        try (Connection conn = DatabaseController.getConn();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                totalCategories = rs.getInt(1);
            }
        }
        return totalCategories;
    }
    


           
}

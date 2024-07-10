package com.kyubegadget.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kyubegadget.controller.dbcontroller.DatabaseController;
import com.kyubegadget.model.SalesModel;
import com.kyubegadget.utils.QueryUtils;

public class SalesDao {

	
	// method to add sales into sales database
    public static void insertSaletoDatabase(int productId, int userId, LocalDate saleDate, int quantity, double unitPrice, double totalPrice) throws ClassNotFoundException {
        try (Connection conn = DatabaseController.getConn()) {
            String query = QueryUtils.INSERT_SALES_QUERY;
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setInt(1, productId);
                statement.setInt(2, userId);
                statement.setDate(3, java.sql.Date.valueOf(saleDate));
                statement.setInt(4, quantity);
                statement.setDouble(5, unitPrice);
                statement.setDouble(6, totalPrice);

                statement.executeUpdate();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // method to get number of sales to show in admin database
    public List<SalesModel> getAllSales() {
        List<SalesModel> salesList = new ArrayList<>();
        try (Connection conn = DatabaseController.getConn()) {
            String query = QueryUtils.GET_ALL_SALES;
            try (PreparedStatement statement = conn.prepareStatement(query);
                 ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int saleId = resultSet.getInt("saleId");
                    int productId = resultSet.getInt("productId");
                    int userId = resultSet.getInt("userId");
                    LocalDate saleDate = resultSet.getDate("saleDate").toLocalDate();
                    int quantity = resultSet.getInt("quantity");
                    double unitPrice = resultSet.getDouble("unitPrice");
                    double totalPrice = resultSet.getDouble("totalPrice");

                    SalesModel sale = new SalesModel(saleId, productId, userId, saleDate, quantity, unitPrice, totalPrice);
                    salesList.add(sale);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return salesList;
    }
    
    
    //method to show revenue according to sales of category
    public Map<String, Double> getRevenueByCategory() {
        Map<String, Double> revenueByCategory = new HashMap<>();
        String query = QueryUtils.GET_REVENUE_BY_CATEGORY;
        try (Connection conn = DatabaseController.getConn();
             PreparedStatement statement = conn.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                String categoryName = resultSet.getString("categoryName");
                double revenue = resultSet.getDouble("revenue");
                revenueByCategory.put(categoryName, revenue);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return revenueByCategory;
    }

    
    
    

    

}

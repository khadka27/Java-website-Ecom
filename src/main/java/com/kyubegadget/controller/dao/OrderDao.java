package com.kyubegadget.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kyubegadget.controller.dbcontroller.DatabaseController;
import com.kyubegadget.model.OrderModel;
import com.kyubegadget.utils.QueryUtils;

public class OrderDao {

	
	// method to save order into database
	public int saveOrderToDatabase(OrderModel order) {
        try (Connection conn = DatabaseController.getConn()) {
            String query = QueryUtils.INSERT_ORDER_QUERY;
            PreparedStatement statement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setTimestamp(1, new Timestamp(order.getOrderDate().getTime()));
            statement.setInt(2, order.getUserId());
            statement.setDouble(3, order.getTotalAmount());
            statement.setString(4, order.getOrderStatus());

            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
                ResultSet generatedKeys = statement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); // Return the generated orderId
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return -1; // Return -1 if the order insertion failed
    }
	
	
	
	// method to get all the orders from database
	public List<OrderModel> getAllOrders() {
	    List<OrderModel> orderList = new ArrayList<>();
	    try (Connection conn = DatabaseController.getConn()) {
	        String query = QueryUtils.GET_ALL_ORDERS;
	        PreparedStatement statement = conn.prepareStatement(query);
	        ResultSet resultSet = statement.executeQuery();
	        while (resultSet.next()) {
	            OrderModel order = new OrderModel(0, null, 0, 0, query);
	            order.setOrderId(resultSet.getInt("orderId"));
	            order.setOrderDate(resultSet.getTimestamp("orderDate"));
	            order.setUserId(resultSet.getInt("userId"));
	            order.setTotalAmount(resultSet.getDouble("totalAmount"));
	            order.setOrderStatus(resultSet.getString("orderStatus"));
	            orderList.add(order);
	        }
	    } catch (SQLException | ClassNotFoundException ex) {
	        ex.printStackTrace();
	    }
	    return orderList;
	}
	
	
	// method to update order status in admin page
	 public boolean updateOrderStatus(int orderId, String newStatus) {
	        boolean updated = false;
	        // SQL query to update the order status
	        String query = QueryUtils.UPDATE_ORDER_STATUS;
	        try (Connection conn = DatabaseController.getConn();
	             PreparedStatement statement = conn.prepareStatement(query)) {
	            // Set parameters
	            statement.setString(1, newStatus);
	            statement.setInt(2, orderId);
	            // Execute the update query
	            int rowsAffected = statement.executeUpdate();
	            // Check if any rows were affected
	            if (rowsAffected > 0) {
	                updated = true;
	            }
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace();
	        }
	        return updated;
	    }
	 
	 // method to get order status distribution to show in admin dashboard
	 public Map<String, Integer> getOrderStatusDistribution() {
		    Map<String, Integer> statusDistribution = new HashMap<>();
		    String query = QueryUtils.GET_COUNT_ORDER_STATUS;
		    try (Connection conn = DatabaseController.getConn();
		         PreparedStatement statement = conn.prepareStatement(query);
		         ResultSet resultSet = statement.executeQuery()) {
		        while (resultSet.next()) {
		            String status = resultSet.getString("orderStatus");
		            int count = resultSet.getInt("count");
		            statusDistribution.put(status, count);
		        }
		    } catch (SQLException | ClassNotFoundException ex) {
		        ex.printStackTrace();
		    }
		    return statusDistribution;
		}

}

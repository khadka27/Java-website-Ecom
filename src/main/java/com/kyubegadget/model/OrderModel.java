package com.kyubegadget.model;
import java.util.Date;

public class OrderModel {

	private int orderId;
    private Date orderDate;
    private int userId;
    private double totalAmount;
    private String orderStatus;
    
    
    
	public OrderModel(int orderId, Date orderDate, int userId, double totalAmount, String orderStatus) {
		super();
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.userId = userId;
		this.totalAmount = totalAmount;
		this.orderStatus = orderStatus;
	}
	
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
    
    
		    


	}



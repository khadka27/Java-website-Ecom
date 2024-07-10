package com.kyubegadget.model;

import java.time.LocalDate;

public class SalesModel {
    private int saleId;
    private int productId;
    private int userId;
    private LocalDate saleDate;
    private int quantity;
    private double unitPrice;
    private double totalPrice;

    // Constructor
    public SalesModel(int saleId, int productId, int userId, LocalDate saleDate, int quantity, double unitPrice, double totalPrice) {
        this.saleId = saleId;
        this.productId = productId;
        this.userId = userId;
        this.saleDate = saleDate;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.totalPrice = totalPrice;
    }

    // Getters and Setters
    public int getSaleId() {
        return saleId;
    }

    public void setSaleId(int saleId) {
        this.saleId = saleId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public LocalDate getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(LocalDate saleDate) {
        this.saleDate = saleDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}

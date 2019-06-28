package com.virtusa.booking.models;

import java.time.LocalDate;

public class Product {
private int productId;
private String productName;
private LocalDate dop;
private int cost;
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
public LocalDate getDop() {
	return dop;
}
public void setDop(LocalDate dop) {
	this.dop = dop;
}
public int getCost() {
	return cost;
}
public void setCost(int cost) {
	this.cost = cost;
}

}

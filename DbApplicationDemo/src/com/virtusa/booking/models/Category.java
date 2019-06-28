package com.virtusa.booking.models;

import java.util.List;

public class Category {
private int categoryId;
private String categoryName;
private List<Product> productList;

public List<Product> getProductList() {
	return productList;
}
public void setProductList(List<Product> productList) {
	this.productList = productList;
}
public int getCategoryId() {
	return categoryId;
}
public void setCategoryId(int categoryId) {
	this.categoryId = categoryId;
}
public String getCategoryName() {
	return categoryName;
}
public void setCategoryName(String categoryName) {
	this.categoryName = categoryName;
}

}

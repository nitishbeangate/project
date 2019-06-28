package com.virtusa.booking.dao;

import java.sql.SQLException;
import java.util.List;

import com.virtusa.booking.models.Category;

public interface CategoryDao {
    void addCategory(Category category);
    void updateCategory(Category category);
    void deleteCategory(int categoryId);
    
	
	List<Category> getCategories() throws SQLException;
    Category getCategoryById(int categoryId) throws SQLException;
}

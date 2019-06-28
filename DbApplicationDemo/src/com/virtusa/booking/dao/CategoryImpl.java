package com.virtusa.booking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import com.mysql.jdbc.Connection;
import java.sql.PreparedStatement;
import com.virtusa.booking.helpers.MySQLHelper;
import com.virtusa.booking.models.Category;

public class CategoryImpl implements CategoryDao {
	private java.sql.Connection conn;
    private Statement statement;
    private ResultSet resultSet;
    private ResourceBundle rb;
    private Category category;
    private List<Category> categoryList;
    private PreparedStatement pre;
    public CategoryImpl()
    {
    	rb=ResourceBundle.getBundle("com/virtusa/resources/db");
    	categoryList=new ArrayList<Category>();
    }
    
	@Override
	public void addCategory(Category category) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCategory(Category category) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCategory(int categoryId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Category> getCategories() throws SQLException {
		conn=MySQLHelper.getConnection();
		String query=rb.getString("getcategories");
		
		try
		{
		statement=conn.createStatement();
		resultSet=statement.executeQuery(query);
		while (resultSet.next()) {
			category=new Category();
			category.setCategoryId(resultSet.getInt(1));
			category.setCategoryName(resultSet.getString(2));
			categoryList.add(category);
		}
	
	}
		catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		return categoryList;
     	}
	@Override
	public Category getCategoryById(int categoryId) throws SQLException {
		// TODO Auto-generated method stub
		conn=MySQLHelper.getConnection();
		String query=rb.getString("getcategorybyid");
		try {
			pre=conn.prepareStatement(query);
			pre.setInt(1, categoryId);
			resultSet=pre.executeQuery();
			resultSet.next();
			category=new Category();
			category.setCategoryId(resultSet.getInt(1));
			category.setCategoryName(resultSet.getString(2));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		
		return category;
	}

}

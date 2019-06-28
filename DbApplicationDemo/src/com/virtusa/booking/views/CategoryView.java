package com.virtusa.booking.views;

import java.sql.SQLException;
import java.util.Scanner;

import com.virtusa.booking.dao.CategoryDao;
import com.virtusa.booking.dao.CategoryImpl;
import com.virtusa.booking.models.Category;

public class CategoryView {
	private static Scanner sc=new Scanner(System.in);
	private static CategoryDao dao=new CategoryImpl();;
	
public static void getCategories()
{   
	
	
	
	CategoryDao dao=new CategoryImpl();
	try {
		for (Category category : dao.getCategories()) {
			System.out.println(category.getCategoryId()+"\t"+category.getCategoryName());
		}
	} catch (SQLException e) {
		// TODO: handle exception
		e.printStackTrace();
	}	

}

// get categoryByid

 public static void getCategoryById()
 {
	 System.out.println("Enter categoryId");
	 Category category;
	 try
	 {
		 category=dao.getCategoryById(sc.nextInt());	
		 System.out.println(category.getCategoryId()+"\t"+category.getCategoryName());
	 }
	catch (SQLException e) {
		// TODO: handle exception
		e.printStackTrace();
	}
 }
}

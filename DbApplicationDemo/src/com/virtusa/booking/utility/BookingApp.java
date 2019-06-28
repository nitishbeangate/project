package com.virtusa.booking.utility;

import java.sql.Connection;
import java.sql.SQLException;

import com.virtusa.booking.dao.CategoryDao;
import com.virtusa.booking.dao.CategoryImpl;
import com.virtusa.booking.helpers.MySQLHelper;
import com.virtusa.booking.models.Category;
import com.virtusa.booking.views.CategoryView;

public class BookingApp {
public static void main(String[] args) throws SQLException {
    CategoryView.getCategoryById();
}
}

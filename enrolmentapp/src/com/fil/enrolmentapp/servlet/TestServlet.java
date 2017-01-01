package com.fil.enrolmentapp.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.fil.enrolmentapp.manager.AppDBConnectionMgr;


@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	private DataSource dataSource;
	private Connection connection;
	private Statement statement;

    public TestServlet() {
        super();
      
    }

    /*
    public void init() throws ServletException {
    	
    	try {
    		
    		Context initContext = new InitialContext();
    		Context envContext = (Context)initContext.lookup("java:/comp/env");
    		dataSource = (DataSource)envContext.lookup("jdbc/enrolmentapp");
    		
    	} catch(NamingException e) {
    		
    		e.printStackTrace();
    	}
    }
	*/
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ResultSet resultSet = null;
		try {
			
			//connection = dataSource.getConnection();
			connection = AppDBConnectionMgr.getInstance().getConnection();
			statement = connection.createStatement();
			
			String query = "select * from user";
			resultSet = statement.executeQuery(query);
			
			while(resultSet.next()) {
				
				System.out.println(resultSet.getString(1) + resultSet.getString(2) + resultSet.getString(3));
			}
			
		} catch(SQLException se) {
			se.printStackTrace();
		} finally {
			
			if(resultSet!=null) {
				
				try {
					resultSet.close();
				} catch(SQLException e) {
					
				}
			}
			if(statement!=null) {
				try {
					statement.close();
				} catch(SQLException e) {
					
				}
			}
			if(connection != null) {
				try {
					connection.close();
				} catch(SQLException e) {
					
				}
			}
		}
		
	}

}

package com.fil.enrolmentapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.fil.enrolmentapp.beans.User;
import com.fil.enrolmentapp.manager.AppDBConnectionMgr;

public class UserDAO {
	
	private int userid;
	private int roleid;
	private User user;
	private String firstname;
	private String lastname;
	private String username;
	private String password;
	private String email;
	private String mobile;
	private String department;
	
	
	public UserDAO() {
		
		userid = 0;
		roleid = 0;
		firstname = "";
		lastname = "";
		username = "";
		password = "";
		email = "";
		mobile = "";
		department = "";
		user = null;
	}
	
	public List getAllUsers() {
		
		List<User> users = new ArrayList<User>();
		String userSQL = "select * from enrolmentapp.user";
		
		AppDBConnectionMgr mgr = AppDBConnectionMgr.getInstance();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = mgr.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(userSQL);
			while(rs.next()) {
				User user = new User();
				user.setUserid(rs.getInt("iduser"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setFirstname(rs.getString("firstname"));
				user.setLastname(rs.getString("lastname"));
				user.setMobile(rs.getString("mobile"));
				user.setEmail(rs.getString("email"));
				user.setRoleid(rs.getInt("role"));
				
				users.add(user);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			mgr.closeConnection(con);
		}
		
		return users;
	}
	
	public User getUserByUsername(String username) {
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		User user = new User();
		
		String userSQL = "select * from enrolmentapp.user where username='"+username+"'";
		System.out.println("SQL --> "+userSQL);
		AppDBConnectionMgr mgr = AppDBConnectionMgr.getInstance();
		
		try {
			con = mgr.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(userSQL);
			if(rs.next()) {
				user.setUserid(rs.getInt("iduser"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setFirstname(rs.getString("firstname"));
				user.setLastname(rs.getString("lastname"));
				user.setMobile(rs.getString("mobile"));
				user.setEmail(rs.getString("email"));
				user.setRoleid(rs.getInt("role"));
				
				return user;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			mgr.closeConnection(con);
		}
		return user;
	}
	
	public void insertUser(User user) {
		
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		AppDBConnectionMgr mgr = AppDBConnectionMgr.getInstance();
		
		String userSQL = "insert into enrolmentapp.user (role, firstname, lastname, mobile, email, department, username, password) "
							+"values (?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			
			con = mgr.getConnection();
			pstmt = con.prepareStatement(userSQL);
			
			pstmt.setInt(1, user.getRoleid());
			pstmt.setString(2, user.getFirstname());
			pstmt.setString(3, user.getLastname());
			pstmt.setString(4, user.getMobile());
			pstmt.setString(5, user.getEmail());
			pstmt.setString(6, user.getDepartment());
			pstmt.setString(7, user.getUsername());
			pstmt.setString(8, user.getPassword());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			mgr.closeConnection(con);
		}
	
	}

}

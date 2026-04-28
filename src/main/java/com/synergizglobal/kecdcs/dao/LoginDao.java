package com.synergizglobal.kecdcs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.synergizglobal.kecdcs.common.DBConnectionHandler;
import com.synergizglobal.kecdcs.model.User;

@Component
public class LoginDao {
	Logger logger = Logger.getLogger(LoginDao.class);
	
	@Autowired
	DataSource dataSource;

	public User validateUser(User user) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User userDeails = null;
		try{  
			con = dataSource.getConnection();
			String qry = "select usr.user_id as userid,user_name,usr.password,usr.name,mobile_number,email_id,role,"
					+ "user_role_id_fk,usr.address1,usr.address2,usr.zip_code,"
					+ "soft_delete_status_id_fk,us.status,rating,usr.created_by,"
					+ "usr.created_date,usr.modified_by,usr.modified_date "
					+ "from user usr "
					+ "join user_roles on user_role_id_fk = user_roles.user_role_id "
					+ "join soft_delete_status us on us.soft_delete_status_id = usr.soft_delete_status_id_fk "
					+ "where password = BINARY ? and user_name = ? and soft_delete_status_id_fk = ?";
			stmt = con.prepareStatement(qry); 
			stmt.setString(1, user.getPassword());
			stmt.setString(2, user.getUserId());
			stmt.setString(3, "1");
			
			rs = stmt.executeQuery();  
			if(rs.next()) {
				userDeails = new User();
				userDeails.setUserId(rs.getString("userId"));
				userDeails.setLogin_id(rs.getString("user_name"));
				userDeails.setPassword(rs.getString("password"));
				userDeails.setUserName(rs.getString("name"));
				userDeails.setMobileNumber(rs.getString("mobile_number"));
				userDeails.setEmailId(rs.getString("email_id"));
				userDeails.setRoleName(rs.getString("role"));
				userDeails.setRoleId(rs.getString("user_role_id_fk"));
				
				userDeails.setAddress1(rs.getString("address1"));
				userDeails.setAddress2(rs.getString("address2"));
				userDeails.setZipCode(rs.getString("zip_code"));
				//userDeails.setContractId(rs.getString("contractor_id_fk"));				
				userDeails.setStatusId(rs.getString("soft_delete_status_id_fk"));
				userDeails.setStatus(rs.getString("status"));
				userDeails.setRating(rs.getString("rating"));
				userDeails.setCreatedBy(rs.getString("created_by"));
				userDeails.setCreatedDate(rs.getString("created_date"));
				userDeails.setModifiedBy(rs.getString("modified_by"));
				userDeails.setModifiedDate(rs.getString("modified_date"));
			}
		}catch(Exception e){ 
			throw new Exception(e);
		}
		finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return userDeails;
	
	}
	
	private String getRoleId(String role, Connection con) throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String roleId = null;
		try{
			
			String qry = "SELECT user_role_id FROM user_roles WHERE UPPER(role) = ?";
			stmt = con.prepareStatement(qry); 
			stmt.setString(1, role.toUpperCase());
			rs = stmt.executeQuery();  
			if(rs.next()) {
				roleId = rs.getString("user_role_id");
			}
		}catch(Exception e){ 
			throw new Exception(e);
		}
		finally {
			DBConnectionHandler.closeJDBCResoucrs(null, stmt, rs);
		}
		return roleId;
	}

	public String getClientId(String companyId, Connection con) throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String clientId = null;
		try{ 
			String qry = "";
			stmt = con.prepareStatement(qry); 
			stmt.setString(1, companyId);
			rs = stmt.executeQuery();  
			if(rs.next()) {
				clientId = rs.getString("client_id_fk");
			}
		}catch(Exception e){ 
			throw new Exception(e);
		}
		finally {
			DBConnectionHandler.closeJDBCResoucrs(null, stmt, rs);
		}
		//logger.info("LoginDao >> validateUser() before returning userDetails "+userDeails);
		return clientId;
	}

	public String getCompanyName(String companyId, Connection con) throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String companyName = null;
		try{  
			String qry = "SELECT Name FROM company WHERE id = ?";
			stmt = con.prepareStatement(qry); 
			stmt.setString(1, companyId);
			rs = stmt.executeQuery();  
			if(rs.next()) {
				companyName = rs.getString("Name");
			}
		}catch(Exception e){ 
			throw new Exception(e);
		}
		finally {
			DBConnectionHandler.closeJDBCResoucrs(null, stmt, rs);
		}
		//logger.info("LoginDao >> validateUser() before returning userDetails "+userDeails);
		return companyName;
	}

	public String getContractTitle(String contractId, Connection con) throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String contractTitle = null;
		try{
			String qry = "SELECT Contract_Title FROM contracts WHERE id = ?";
			stmt = con.prepareStatement(qry); 
			stmt.setString(1, contractId);
			rs = stmt.executeQuery();  
			if(rs.next()) {
				contractTitle = rs.getString("Contract_Title");
			}
		}catch(Exception e){ 
			throw new Exception(e);
		}
		finally {
			DBConnectionHandler.closeJDBCResoucrs(null, stmt, rs);
		}
		return contractTitle;
	}
	
	/*********************************************************************************************/
	
	public String changePassword(User user) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String temp = null;
		boolean flag = false;
		try{  
			con = dataSource.getConnection();
			String qry = "SELECT user_name,password FROM user WHERE user_name = ? and password = ?";
			stmt = con.prepareStatement(qry);
			stmt.setString(1,user.getLogin_id());
			stmt.setString(2,user.getOldPassword());
			rs = stmt.executeQuery();  
			if(rs.next()) {
				flag = true;
			}
			
			DBConnectionHandler.closeJDBCResoucrs(null, stmt, rs);
			
			if(flag){
				String qry2 = "UPDATE user set password = ? WHERE user_name = ?";
				stmt = con.prepareStatement(qry2);
				stmt.setString(1, user.getNewPassword());
				stmt.setString(2, user.getLogin_id());
				int c = stmt.executeUpdate();  
				if(c > 0) {
					temp = "true";
				}
			}else{
				temp = "false";
			}
			
			if("true".equals(temp)) {
				changePasswordInIrcon(con,user);
			}
		}catch(Exception e){ 
			throw new Exception(e.getMessage());
		}
		finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return temp;
	}
	
	public String changePasswordInIrcon(Connection con,User user) throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String temp = null;
		boolean flag = false;
		try{  
			con = dataSource.getConnection();
			String qry = "SELECT user_id,password FROM ircon.user WHERE user_id = ?";
			stmt = con.prepareStatement(qry);
			stmt.setString(1,user.getLogin_id());
			rs = stmt.executeQuery();  
			if(rs.next()) {
				flag = true;
			}
			
			DBConnectionHandler.closeJDBCResoucrs(null, stmt, rs);
			
			if(flag){
				String qry2 = "UPDATE ircon.user set password = ? WHERE user_id = ?";
				stmt = con.prepareStatement(qry2);
				stmt.setString(1, user.getNewPassword());
				stmt.setString(2, user.getLogin_id());
				int c = stmt.executeUpdate();  
				if(c > 0) {
					temp = "true";
				}
			}else{
				temp = "false";
			}
		}catch(Exception e){ 
			throw new Exception(e);
		}
		finally {
			DBConnectionHandler.closeJDBCResoucrs(null, stmt, rs);
		}
		return temp;
	}
	
	/***************************************************************************************************/
}

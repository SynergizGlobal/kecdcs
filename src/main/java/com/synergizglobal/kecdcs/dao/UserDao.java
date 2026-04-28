package com.synergizglobal.kecdcs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.synergizglobal.kecdcs.common.DBConnectionHandler;
import com.synergizglobal.kecdcs.model.User;
@Component
public class UserDao {
	Logger logger = Logger.getLogger(UserDao.class);
	@Autowired
	DataSource dataSource;
	public List<User> getUsersList(User user) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<User> usersList = new ArrayList<User>();
		User dataObj = null;
		try{  
			con = dataSource.getConnection();
			String qry = "select usr.user_id as userid,usr.password,usr.name,role,"
					+ "user_role_id_fk "
					+ "from user usr "
					+ "left outer join user_roles on user_role_id_fk = user_roles.user_role_id "
					+ "left outer join soft_delete_status us on us.soft_delete_status_id = usr.soft_delete_status_id_fk ";
			stmt = con.prepareStatement(qry); 
			
			rs = stmt.executeQuery();  
			while(rs.next()) {
				dataObj = new User();
				dataObj.setUserId(rs.getString("userId"));
				dataObj.setUserName(rs.getString("name"));
				dataObj.setRoleName(rs.getString("role"));
				dataObj.setRoleId(rs.getString("user_role_id_fk"));
				usersList.add(dataObj);
			}
		}catch(Exception e){ 
			e.printStackTrace();
			throw new Exception(e);
		}
		finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return usersList;
	}
	
	public String getCompanyId(String companyId, Connection con) throws Exception {
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
		return companyName;
	}

	public String getContractId(String contractId, Connection con) throws Exception {
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
	
	public boolean deleteUser(String userId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		boolean flag = false;
		try{  
			con = dataSource.getConnection();
			String qry = "update user set soft_delete_status_id_fk = 2 where user_id = ?";
			stmt = con.prepareStatement(qry); 
			stmt.setLong(1, Long.parseLong(userId));
			
			int c = stmt.executeUpdate();
			if(c > 0)
				flag = true;
			
		}catch(Exception e){ 
			throw new Exception(e);
		}
		finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, null);
		}
		return flag;
	}
	public User getUser(String userId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User dataObj = null;
		try{  
			con = dataSource.getConnection();
			String qry = "select usr.user_id as userid,usr.password,usr.name,us.status,"
					//+ "usr.name,mobile_number,email_id,"
					+ "role,"
					+ "user_role_id_fk,"
					//+ "usr.address1,usr.address2,usr.zip_code,"
					//+ "usr.contractor_id_fk,"
					+ "usr.soft_delete_status_id_fk "
					//+ "us.status,rating,usr.created_by,"
					//+ "usr.created_date,usr.modified_by,usr.modified_date,city_name,password_expiry_days "
					+ "from user usr "
					+ "left outer join user_roles on user_role_id_fk = user_roles.user_role_id "
					//+ "left outer join contractor on usr.contractor_id_fk = contractor.contractor_id "
					//+ "left outer join city on usr.city_id_fk = city_id "
					+ "left outer join soft_delete_status us on us.soft_delete_status_id = usr.soft_delete_status_id_fk "
					+ "where usr.user_id = ?";
			stmt = con.prepareStatement(qry); 
			stmt.setString(1, userId);
			rs = stmt.executeQuery();  
			if(rs.next()) {
				dataObj = new User();
				dataObj.setUserId(rs.getString("userId"));
				dataObj.setPassword(rs.getString("password"));
				dataObj.setUserName(rs.getString("name"));
				//dataObj.setMobileNumber(rs.getString("mobile_number"));
				//dataObj.setEmailId(rs.getString("email_id"));
				dataObj.setRoleName(rs.getString("role"));
				dataObj.setRoleId(rs.getString("user_role_id_fk"));
				
				//dataObj.setAddress1(rs.getString("address1"));
				//dataObj.setAddress2(rs.getString("address2"));
				//dataObj.setCityId(rs.getString("city_id_fk"));
				//dataObj.setCity(rs.getString("city_name"));
				//dataObj.setZipCode(rs.getString("zip_code"));
				//dataObj.setCompanyId(rs.getString("contractor_id_fk"));		
				//dataObj.setCompanyName(rs.getString("contractor_name"));			
				dataObj.setStatusId(rs.getString("usr.soft_delete_status_id_fk"));
				dataObj.setStatus(rs.getString("status"));
				//dataObj.setRating(rs.getString("rating"));
				//dataObj.setPasswordExpiryDays(rs.getString("password_expiry_days"));
				//dataObj.setCreatedBy(rs.getString("created_by"));
				//dataObj.setCreatedDate(rs.getString("created_date"));
				//dataObj.setModifiedBy(rs.getString("modified_by"));
				//dataObj.setModifiedDate(rs.getString("modified_date"));
			}
		}catch(Exception e){ 
			e.printStackTrace();
			throw new Exception(e);
		}
		finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return dataObj;
	}
	public List<User> getUsersListForUploadTemplate(String clientId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<User> usersList = new ArrayList<User>();
		User dataObj = null;
		try{  
			con = dataSource.getConnection();
			String qry = "select usr.user_id as userid,usr.password,usr.name,mobile_number,email_id,usr.role,"
					+ "user_role_id_fk,usr.address1,usr.address2,usr.zip_code,"
					+ "usr.contractor_id_fk,"
					+ "usr.soft_delete_status_id_fk,us.status,rating,usr.created_by,"
					+ "usr.created_date,usr.modified_by,usr.modified_date,contractor_name,city_name,password_expiry_days "
					+ "from user usr "
					+ "left outer join user_roles on user_role_id_fk = user_roles.user_role_id "
					+ "left outer join contractor on usr.contractor_id_fk = contractor.contractor_id "
					//+ "left outer join city on usr.city_id_fk = city_id "
					+ "left outer join soft_delete_status us on us.soft_delete_status_id = usr.soft_delete_status_id_fk ";
			stmt = con.prepareStatement(qry); 
			
			rs = stmt.executeQuery();  
			while(rs.next()) {
				dataObj = new User();
				dataObj.setUserId(rs.getString("userId"));
				dataObj.setPassword(rs.getString("password"));
				dataObj.setUserName(rs.getString("name"));
				dataObj.setMobileNumber(rs.getString("mobile_number"));
				dataObj.setEmailId(rs.getString("email_id"));
				dataObj.setRoleName(rs.getString("role"));
				dataObj.setRoleId(rs.getString("user_role_id_fk"));
				
				dataObj.setAddress1(rs.getString("address1"));
				dataObj.setAddress2(rs.getString("address2"));
				//dataObj.setCityId(rs.getString("city_id_fk"));
				//dataObj.setCity(rs.getString("city_name"));
				dataObj.setZipCode(rs.getString("zip_code"));
				dataObj.setCompanyId(rs.getString("contractor_id_fk"));		
				dataObj.setCompanyName(rs.getString("contractor_name"));			
				dataObj.setStatusId(rs.getString("usr.soft_delete_status_id_fk"));
				dataObj.setStatus(rs.getString("status"));
				dataObj.setRating(rs.getString("rating"));
				dataObj.setPasswordExpiryDays(rs.getString("password_expiry_days"));
				dataObj.setCreatedBy(rs.getString("created_by"));
				dataObj.setCreatedDate(rs.getString("created_date"));
				dataObj.setModifiedBy(rs.getString("modified_by"));
				dataObj.setModifiedDate(rs.getString("modified_date"));
				usersList.add(dataObj);
			}
		}catch(Exception e){ 
			throw new Exception(e);
		}
		finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return usersList;
	}

	public User getRole(String roleId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User dataObj = null;
		try{  
			con = dataSource.getConnection();
			String qry = "SELECT user_role_id,role from user_roles where user_role_id = ?";
			stmt = con.prepareStatement(qry); 
			stmt.setString(1, roleId);
			rs = stmt.executeQuery();  
			if(rs.next()) {
				dataObj = new User();
				dataObj.setRoleId(rs.getString("user_role_id"));
				dataObj.setRoleName(rs.getString("role"));
			}
		}catch(Exception e){ 
			throw new Exception(e);
		}
		finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return dataObj;
	}
	
	public boolean deleteRole(String roleId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try{  
			con = dataSource.getConnection();
			String qry = "delete from user_roles where user_role_id = ?";
			stmt = con.prepareStatement(qry); 
			stmt.setString(1, roleId);
			int c = stmt.executeUpdate();  
			if(c > 0) {
				flag = true;
			}
		}catch(Exception e){ 
			throw new Exception(e);
		}
		finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return flag;
	}
	
	public boolean addRole(User role) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try{  
			con = dataSource.getConnection();
			String qry = "insert into user_roles(role)values(?)";
			stmt = con.prepareStatement(qry); 
			stmt.setString(1, !StringUtils.isEmpty(role.getRoleName())?role.getRoleName():null);
			int c = stmt.executeUpdate();  
			if(c > 0) {
				flag = true;
			}
		}catch(Exception e){ 
			throw new Exception(e);
		}
		finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return flag;
	}
	
	public boolean updateRole(User role) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try{  
			con = dataSource.getConnection();
			String qry = "update user_roles set role = ? where user_role_id = ?";
			stmt = con.prepareStatement(qry); 
			stmt.setString(1, role.getRoleName());
			stmt.setString(2, role.getRoleId());
			int c = stmt.executeUpdate();  
			if(c > 0) {
				flag = true;
			}
		}catch(Exception e){ 
			throw new Exception(e);
		}
		finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return flag;
	}
}

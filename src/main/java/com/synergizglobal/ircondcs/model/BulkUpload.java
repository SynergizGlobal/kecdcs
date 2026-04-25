package com.synergizglobal.ircondcs.model;

import org.springframework.web.multipart.MultipartFile;

public class BulkUpload {
	private MultipartFile uploadFile;
	private String tableName;
	private String userName;
	private String userNameOther;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNameOther() {
		return userNameOther;
	}
	public void setUserNameOther(String userNameOther) {
		this.userNameOther = userNameOther;
	}
}

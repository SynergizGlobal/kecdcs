package com.synergizglobal.kecdcs.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Upload {
	private List<MultipartFile> uploadFile;
	private String tableName;
	private String userName;
	private String userNameOther;
	
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
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
}

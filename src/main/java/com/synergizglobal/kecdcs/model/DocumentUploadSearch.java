package com.synergizglobal.kecdcs.model;

import java.util.List;

public class DocumentUploadSearch {
	private int iTotalDisplayRecords; 
	private int iTotalRecords;
	private List<DocumentUpload> aaData;
	public int getiTotalDisplayRecords() {
		return iTotalDisplayRecords;
	}
	public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}
	public int getiTotalRecords() {
		return iTotalRecords;
	}
	public void setiTotalRecords(int iTotalRecords) {
		this.iTotalRecords = iTotalRecords;
	}
	public List<DocumentUpload> getAaData() {
		return aaData;
	}
	public void setAaData(List<DocumentUpload> users) {
		this.aaData = users;
	}
	
}

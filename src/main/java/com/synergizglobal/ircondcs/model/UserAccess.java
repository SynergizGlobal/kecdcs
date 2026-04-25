package com.synergizglobal.ircondcs.model;

public class UserAccess {

	private String id;
	private String userId;
	private boolean bulkDownload;
	private boolean bulkUpload;
	private boolean edit;
	private boolean view;
	private boolean upload;
	private String folderId;
	private String levelDescription;
	private boolean delete;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public boolean isBulkDownload() {
		return bulkDownload;
	}
	public void setBulkDownload(boolean bulkDownload) {
		this.bulkDownload = bulkDownload;
	}
	public boolean isBulkUpload() {
		return bulkUpload;
	}
	public void setBulkUpload(boolean bulkUpload) {
		this.bulkUpload = bulkUpload;
	}
	public boolean isEdit() {
		return edit;
	}
	public void setEdit(boolean edit) {
		this.edit = edit;
	}
	public boolean isView() {
		return view;
	}
	public void setView(boolean view) {
		this.view = view;
	}
	public boolean isUpload() {
		return upload;
	}
	public void setUpload(boolean upload) {
		this.upload = upload;
	}
	public String getFolderId() {
		return folderId;
	}
	public void setFolderId(String folderId) {
		this.folderId = folderId;
	}
	public String getLevelDescription() {
		return levelDescription;
	}
	public void setLevelDescription(String levelDescription) {
		this.levelDescription = levelDescription;
	}
	public boolean isDelete() {
		return delete;
	}
	public void setDelete(boolean delete) {
		this.delete = delete;
	}
	@Override
	public String toString() {
		return "UserAccess [id=" + id + ", userId=" + userId + ", bulkDownload=" + bulkDownload + ", bulkUpload="
				+ bulkUpload + ", edit=" + edit + ", view=" + view + ", upload=" + upload + ", folderId=" + folderId
				+ ", levelDescription=" + levelDescription + ", delete=" + delete + "]";
	}
	
	
	
}

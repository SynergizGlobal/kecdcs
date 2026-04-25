package com.synergizglobal.ircondcs.model;

public class FolderHistory {
	private String id;
	private String folderId;
	private String createdBy;
	private String createdDate;
	private String modifiedBy;
	private String modifiedDate;
	private String levelId;
	private String levelDescription;
	private String level;
	private String parentLevelId;
	private String parentLevelIdDescription;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFolderId() {
		return folderId;
	}

	public void setFolderId(String folderId) {
		this.folderId = folderId;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public String getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(String modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public String getLevelId() {
		return levelId;
	}

	public void setLevelId(String levelId) {
		this.levelId = levelId;
	}

	public String getLevelDescription() {
		return levelDescription;
	}

	public void setLevelDescription(String levelDescription) {
		this.levelDescription = levelDescription;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getParentLevelId() {
		return parentLevelId;
	}

	public void setParentLevelId(String parentLevelId) {
		this.parentLevelId = parentLevelId;
	}

	public String getParentLevelIdDescription() {
		return parentLevelIdDescription;
	}

	public void setParentLevelIdDescription(String parentLevelIdDescription) {
		this.parentLevelIdDescription = parentLevelIdDescription;
	}

}

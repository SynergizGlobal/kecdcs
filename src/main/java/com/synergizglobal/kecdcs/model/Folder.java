package com.synergizglobal.kecdcs.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Folder implements Serializable {

	private static final long serialVersionUID = 475918891428093041L;

	private String folderId;
	private String createdBy;
	private String createdDate;
	private String modifiedBy;
	private String modifiedDate;
	private String levelId;
	private String levelDescription;
	private String parentLevelId;
	private String level;

	private String oldLevelId;
	private String oldLevelDescription;
	private String oldParentLevelId;
	private String oldLevel;
	private String parentLevelIdDescription;
	private String moveLevel;
	private String moveParentLevelId;
	private ArrayList<Folder> subFolderList;

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

	public String getParentLevelId() {
		return parentLevelId;
	}

	public void setParentLevelId(String parentLevelId) {
		this.parentLevelId = parentLevelId;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getOldLevelId() {
		return oldLevelId;
	}

	public void setOldLevelId(String oldLevelId) {
		this.oldLevelId = oldLevelId;
	}

	public String getOldLevelDescription() {
		return oldLevelDescription;
	}

	public void setOldLevelDescription(String oldLevelDescription) {
		this.oldLevelDescription = oldLevelDescription;
	}

	public String getOldParentLevelId() {
		return oldParentLevelId;
	}

	public void setOldParentLevelId(String oldParentLevelId) {
		this.oldParentLevelId = oldParentLevelId;
	}

	public String getOldLevel() {
		return oldLevel;
	}

	public void setOldLevel(String oldLevel) {
		this.oldLevel = oldLevel;
	}

	public String getParentLevelIdDescription() {
		return parentLevelIdDescription;
	}

	public void setParentLevelIdDescription(String parentLevelIdDescription) {
		this.parentLevelIdDescription = parentLevelIdDescription;
	}

	public String getMoveLevel() {
		return moveLevel;
	}

	public void setMoveLevel(String moveLevel) {
		this.moveLevel = moveLevel;
	}

	public String getMoveParentLevelId() {
		return moveParentLevelId;
	}

	public void setMoveParentLevelId(String moveParentLevelId) {
		this.moveParentLevelId = moveParentLevelId;
	}

	public ArrayList<Folder> getSubFolderList() {
		return subFolderList;
	}

	public void setSubFolderList(ArrayList<Folder> subFolderList) {
		this.subFolderList = subFolderList;
	}


}

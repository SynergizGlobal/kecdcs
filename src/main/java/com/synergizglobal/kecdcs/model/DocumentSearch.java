package com.synergizglobal.kecdcs.model;

import java.io.Serializable;
import java.util.List;

public class DocumentSearch implements Serializable {

	private static final long serialVersionUID = 475918891428093041L;
	private List<Folder> parentFolders;
	private List<User> users;
	private List<DocumentUpload> documentList;
	
	public List<Folder> getParentFolders() {
		return parentFolders;
	}
	public void setParentFolders(List<Folder> parentFolders) {
		this.parentFolders = parentFolders;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public List<DocumentUpload> getDocumentList() {
		return documentList;
	}
	public void setDocumentList(List<DocumentUpload> documentList) {
		this.documentList = documentList;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}

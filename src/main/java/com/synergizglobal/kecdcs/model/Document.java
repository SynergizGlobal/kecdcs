package com.synergizglobal.kecdcs.model;

import java.io.Serializable;
import java.util.List;

public class Document implements Serializable {

	private static final long serialVersionUID = 475918891428093041L;
	private DocumentUpload documentUpload;
	private List<Folder> parentFolders;
	private List<User> users;
	private List<DocumentUpload> versionOrRevisions;
	
	public DocumentUpload getDocumentUpload() {
		return documentUpload;
	}
	public void setDocumentUpload(DocumentUpload documentUpload) {
		this.documentUpload = documentUpload;
	}
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
	public List<DocumentUpload> getVersionOrRevisions() {
		return versionOrRevisions;
	}
	public void setVersionOrRevisions(List<DocumentUpload> versionOrRevisions) {
		this.versionOrRevisions = versionOrRevisions;
	}
}

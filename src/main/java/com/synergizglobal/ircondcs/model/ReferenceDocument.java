package com.synergizglobal.ircondcs.model;

import java.util.List;

public class ReferenceDocument extends DocumentUpload {

	private List<Folder> l1Folder;
	private List<Folder> l2Folder;
	private List<Folder> l3Folder;
	private List<Folder> l4Folder;
	
	public List<Folder> getL1Folder() {
		return l1Folder;
	}
	public void setL1Folder(List<Folder> l1Folder) {
		this.l1Folder = l1Folder;
	}
	public List<Folder> getL2Folder() {
		return l2Folder;
	}
	public void setL2Folder(List<Folder> l2Folder) {
		this.l2Folder = l2Folder;
	}
	public List<Folder> getL3Folder() {
		return l3Folder;
	}
	public void setL3Folder(List<Folder> l3Folder) {
		this.l3Folder = l3Folder;
	}
	public List<Folder> getL4Folder() {
		return l4Folder;
	}
	public void setL4Folder(List<Folder> l4Folder) {
		this.l4Folder = l4Folder;
	}

}

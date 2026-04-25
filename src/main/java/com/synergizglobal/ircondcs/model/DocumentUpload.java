package com.synergizglobal.ircondcs.model;

import java.io.Serializable;
import java.util.List;

public class DocumentUpload implements Serializable {
	private int document_id;
	private String document_name;
	private String document_no;
	private String soft_delete_status_id_fk="1";
	private String document_type_fk;
	private String tags_fk;
	private String version_number;
	private String user_id_fk;
	private String modified_date;
	private String l1_folder_id_fk;
	private String l2_folder_id_fk;;
	private String l3_folder_id_fk;
	private String l4_folder_id_fk;
	private String approval_date;
	private String confidential;
	private String structure_type_fk;
	private String revision_type_fk;
	private String approver_user_id_fk;
	private String comments;
	private String created_by;
	private String created_date;
	private String modified_by;
	private String owner_user_id_fk;
	private String title;
	private String subject;

	private String l1_folder_id_val;
	private String l2_folder_id_val;;
	private String l3_folder_id_val;
	private String l4_folder_id_val;

	private String location;
	private String userName;
	private String reference_no;
	private String status;
	private String docId;
	
	private String flCorrespondences = "N";
	private String flDrawings = "N";
	private String rootParentLevel;
	
	private String flAllowDelete = "N";
	private String flAllowEdit = "N";
	private String flAllowView = "N";
	private String flAllowUpload = "N";
	private String flAllowBulkUpload = "N";
	private String flAllowDownload = "N";
	
	private List<Folder> l1Folder;
	private List<Folder> l2Folder;
	private List<Folder> l3Folder;
	private List<Folder> l4Folder;
	List<DocumentUpload> refDocumentList;
	
	private String documentTypeVal;
	private String tagsVal;
	private String structureTypeVal;
	private String revisionTypeVal;
	
	private String createdTS;
	private String modifiedTS;
	
	private String appFlow;

	public int getDocument_id() {
		return document_id;
	}

	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}

	public String getDocument_name() {
		return document_name;
	}

	public void setDocument_name(String document_name) {
		this.document_name = document_name;
	}

	public String getDocument_no() {
		return document_no;
	}

	public void setDocument_no(String document_no) {
		this.document_no = document_no;
	}

	public String getVersion_number() {
		return version_number;
	}

	public void setVersion_number(String version_number) {
		this.version_number = version_number;
	}

	public String getModified_date() {
		return modified_date;
	}

	public void setModified_date(String modified_date) {
		this.modified_date = modified_date;
	}

	public String getL1_folder_id_fk() {
		return l1_folder_id_fk;
	}

	public void setL1_folder_id_fk(String l1_folder_id_fk) {
		this.l1_folder_id_fk = l1_folder_id_fk;
	}

	public String getL2_folder_id_fk() {
		return l2_folder_id_fk;
	}

	public void setL2_folder_id_fk(String l2_folder_id_fk) {
		this.l2_folder_id_fk = l2_folder_id_fk;
	}

	public String getL3_folder_id_fk() {
		return l3_folder_id_fk;
	}

	public void setL3_folder_id_fk(String l3_folder_id_fk) {
		this.l3_folder_id_fk = l3_folder_id_fk;
	}

	public String getL4_folder_id_fk() {
		return l4_folder_id_fk;
	}

	public void setL4_folder_id_fk(String l4_folder_id_fk) {
		this.l4_folder_id_fk = l4_folder_id_fk;
	}

	public String getApproval_date() {
		return approval_date;
	}

	public void setApproval_date(String approval_date) {
		this.approval_date = approval_date;
	}

	public String getConfidential() {
		return confidential;
	}

	public void setConfidential(String confidential) {
		this.confidential = confidential;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getCreated_by() {
		return created_by;
	}

	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	public String getModified_by() {
		return modified_by;
	}

	public void setModified_by(String modified_by) {
		this.modified_by = modified_by;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getL2_folder_id_val() {
		return l2_folder_id_val;
	}

	public void setL2_folder_id_val(String l2_folder_id_val) {
		this.l2_folder_id_val = l2_folder_id_val;
	}

	public String getL3_folder_id_val() {
		return l3_folder_id_val;
	}

	public void setL3_folder_id_val(String l3_folder_id_val) {
		this.l3_folder_id_val = l3_folder_id_val;
	}

	public String getL4_folder_id_val() {
		return l4_folder_id_val;
	}

	public void setL4_folder_id_val(String l4_folder_id_val) {
		this.l4_folder_id_val = l4_folder_id_val;
	}

	public String getL1_folder_id_val() {
		return l1_folder_id_val;
	}

	public void setL1_folder_id_val(String l1_folder_id_val) {
		this.l1_folder_id_val = l1_folder_id_val;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getReference_no() {
		return reference_no;
	}

	public void setReference_no(String reference_no) {
		this.reference_no = reference_no;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSoft_delete_status_id_fk() {
		return soft_delete_status_id_fk;
	}

	public void setSoft_delete_status_id_fk(String soft_delete_status_id_fk) {
		this.soft_delete_status_id_fk = soft_delete_status_id_fk;
	}

	public String getUser_id_fk() {
		return user_id_fk;
	}

	public void setUser_id_fk(String user_id_fk) {
		this.user_id_fk = user_id_fk;
	}

	public String getApprover_user_id_fk() {
		return approver_user_id_fk;
	}

	public void setApprover_user_id_fk(String approver_user_id_fk) {
		this.approver_user_id_fk = approver_user_id_fk;
	}

	public String getOwner_user_id_fk() {
		return owner_user_id_fk;
	}

	public void setOwner_user_id_fk(String owner_user_id_fk) {
		this.owner_user_id_fk = owner_user_id_fk;
	}

	public String getFlCorrespondences() {
		return flCorrespondences;
	}

	public void setFlCorrespondences(String flCorrespondences) {
		this.flCorrespondences = flCorrespondences;
	}

	public String getRootParentLevel() {
		return rootParentLevel;
	}

	public void setRootParentLevel(String rootParentLevel) {
		this.rootParentLevel = rootParentLevel;
	}

	public String getFlAllowDelete() {
		return flAllowDelete;
	}

	public void setFlAllowDelete(String flAllowDelete) {
		this.flAllowDelete = flAllowDelete;
	}

	public String getFlAllowEdit() {
		return flAllowEdit;
	}

	public void setFlAllowEdit(String flAllowEdit) {
		this.flAllowEdit = flAllowEdit;
	}

	public String getFlAllowView() {
		return flAllowView;
	}

	public void setFlAllowView(String flAllowView) {
		this.flAllowView = flAllowView;
	}

	public String getDocId() {
		return docId;
	}

	public void setDocId(String docId) {
		this.docId = docId;
	}

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

	
	public List<DocumentUpload> getRefDocumentList() {
		return refDocumentList;
	}

	public void setRefDocumentList(List<DocumentUpload> refDocumentList) {
		this.refDocumentList = refDocumentList;
	}

	public String getDocument_type_fk() {
		return document_type_fk;
	}

	public void setDocument_type_fk(String document_type_fk) {
		this.document_type_fk = document_type_fk;
	}

	public String getTags_fk() {
		return tags_fk;
	}

	public void setTags_fk(String tags_fk) {
		this.tags_fk = tags_fk;
	}

	public String getStructure_type_fk() {
		return structure_type_fk;
	}

	public void setStructure_type_fk(String structure_type_fk) {
		this.structure_type_fk = structure_type_fk;
	}

	public String getRevision_type_fk() {
		return revision_type_fk;
	}

	public void setRevision_type_fk(String revision_type_fk) {
		this.revision_type_fk = revision_type_fk;
	}

	public String getDocumentTypeVal() {
		return documentTypeVal;
	}

	public void setDocumentTypeVal(String documentTypeVal) {
		this.documentTypeVal = documentTypeVal;
	}

	public String getTagsVal() {
		return tagsVal;
	}

	public void setTagsVal(String tagsVal) {
		this.tagsVal = tagsVal;
	}

	public String getStructureTypeVal() {
		return structureTypeVal;
	}

	public void setStructureTypeVal(String structureTypeVal) {
		this.structureTypeVal = structureTypeVal;
	}

	public String getRevisionTypeVal() {
		return revisionTypeVal;
	}

	public void setRevisionTypeVal(String revisionTypeVal) {
		this.revisionTypeVal = revisionTypeVal;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getCreatedTS() {
		return createdTS;
	}

	public void setCreatedTS(String createdTS) {
		this.createdTS = createdTS;
	}

	public String getModifiedTS() {
		return modifiedTS;
	}

	public void setModifiedTS(String modifiedTS) {
		this.modifiedTS = modifiedTS;
	}

	public String getFlDrawings() {
		return flDrawings;
	}

	public void setFlDrawings(String flDrawings) {
		this.flDrawings = flDrawings;
	}

	public String getAppFlow() {
		return appFlow;
	}

	public void setAppFlow(String appFlow) {
		this.appFlow = appFlow;
	}

	public String getFlAllowUpload() {
		return flAllowUpload;
	}

	public void setFlAllowUpload(String flAllowUpload) {
		this.flAllowUpload = flAllowUpload;
	}

	public String getFlAllowBulkUpload() {
		return flAllowBulkUpload;
	}

	public void setFlAllowBulkUpload(String flAllowBulkUpload) {
		this.flAllowBulkUpload = flAllowBulkUpload;
	}

	public void setFlAllowDownload(String flAllowDownload) {
		this.flAllowDownload = flAllowDownload;
	}

	public String getFlAllowDownload() {
		return flAllowDownload;
	}

}

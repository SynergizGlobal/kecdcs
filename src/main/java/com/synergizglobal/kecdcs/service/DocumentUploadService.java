package com.synergizglobal.kecdcs.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.synergizglobal.kecdcs.dao.DocumentUploadDao;
import com.synergizglobal.kecdcs.model.DocumentUpload;
import com.synergizglobal.kecdcs.model.Folder;
import com.synergizglobal.kecdcs.model.UserAccess;

@Component
public class DocumentUploadService {
	Logger logger = Logger.getLogger(DocumentUploadService.class);
	@Autowired
	DocumentUploadDao dao;

	public List<String> getListOfLevels() throws Exception {
		return dao.getListOfLevels();
	}

	public List<Folder> getParentFolders(String userId) throws Exception {
		return dao.getParentFolders(userId);
	}

	public List<Folder> getSubFoldersForFolderId(String folderId) throws Exception {
		return dao.getSubFoldersForFolderId(folderId);
	}

	public boolean createDocumentUpload(DocumentUpload docUpload) throws Exception {
		return dao.createDocumentUpload(docUpload);
	}

	public boolean createDocumentUpload(ArrayList<DocumentUpload> docUploads) throws Exception {
		return dao.createDocumentUpload(docUploads);
	}

	public String getBucketLocation(DocumentUpload docUpload)  throws Exception{
		return dao.getBucketLocation(docUpload);
	}

	public void clearTempDocumentImages(String userId)  throws Exception {
		dao.clearTempDocumentImages(userId);
	}

	public boolean createTempDocumentImages(String userId, String documentName) throws Exception {
		return dao.createTempDocumentImages(userId, documentName);
	}

	public ArrayList<Folder> getLevelMenu() throws Exception {
		return dao.getLevelMenu();
	}
	
	public List<DocumentUpload> getDocumentList() throws Exception {
		return dao.getDocumentList();
	}

	public List<DocumentUpload> getDocumentList(String folderId, String levelId) throws Exception {
		return dao.getDocumentList(folderId, levelId);
	}

	public DocumentUpload getDocument(String docId) throws Exception {
		return dao.getDocument(docId);
	}

	public boolean deleteDocument(String docId) throws Exception {
		return dao.deleteDocument(docId);		
	}
	
	public boolean updateDocumentLevel(DocumentUpload docUpload) throws Exception{
		return dao.updateDocumentLevel(docUpload);
	}
	
	public boolean renameDocument(DocumentUpload docUpload) throws Exception {
		return dao.renameDocument(docUpload);
	}
	
	public List<DocumentUpload> getDocumentVersionList(String docNo) throws Exception {
		return dao.getDocumentVersionList(docNo);
	}
	
	public boolean shareDocument(DocumentUpload docUpload) throws Exception {
		return dao.shareDocument(docUpload);
	}
	
	public Map<String, UserAccess> getUserAccessDetails(String userId) throws Exception {
		return dao.getUserAccessDetails(userId);
	}
	
	public List<DocumentUpload> getCorrespondenceDocumentList(String docId,String userId) throws Exception {
		return dao.getCorrespondenceDocumentList(docId,userId);
	}
	
	public List<DocumentUpload> getCorrespondenceRecursiveDocList(String docId, String userId) throws Exception {
		return dao.getCorrespondenceRecursiveDocList(docId, userId);
	}
	
	public boolean createNewVersionDocumentUpload(DocumentUpload documentUpload) throws Exception {
		return dao.createNewVersionDocumentUpload(documentUpload);
	}
	
	public Map<String, Folder> getFolderLevelForBreadCrumb(String folderId) throws Exception {
		return dao.getFolderLevelForBreadCrumb(folderId);
	}
	
	public void doActiveOrDeactiveDocuments(String docId, int reqStatus, String userName) throws Exception {
		dao.doActiveOrDeactiveDocuments(docId, reqStatus, userName);
	}
	
	public List<Folder> getRefParentFoldersForLevel(String userId) throws Exception {
		return dao.getRefParentFoldersForLevel(userId);
	}
	public boolean updateDocumentUpload(DocumentUpload documentUpload) throws Exception {
		return dao.updateDocument(documentUpload);
	}
	public boolean validateDocumentNo(String docNo) throws Exception {
		return dao.validateDocumentNo(docNo);
	}
	
	public boolean validateVersionNo(String docNo, String versionNo) throws Exception {
		return dao.validateVersionNo(docNo, versionNo);
	}
	public boolean validateTypeValues(String value, String tableName) throws Exception {
		return dao.validateTypeValues(value, tableName);
	}
	
	public int addCreateTypeValues(String value, String tableName) throws Exception {
		return dao.addCreateTypeValues(value, tableName);
	}
	
	public List<Folder> getAllFolder() throws Exception {
		return dao.getAllFolder();
	}
	
	public Map<String, String> getLookupData(String dataType) throws Exception {
		return dao.getLookupData(dataType);
	}
	
	public int getTotalRecords() throws Exception {
		return dao.getTotalRecords();
	}
	
	public List<DocumentUpload> getDocumentList(DocumentUpload obj, int startIndex, int offset, String searchParameter) throws Exception {
		return dao.getDocumentList(obj, startIndex, offset, searchParameter);
	}
	
	public List<DocumentUpload> getSearchDocumentList(String searchType, DocumentUpload documentUpload) throws Exception {
		return dao.getSearchDocumentList(searchType, documentUpload);
	}
	
	public List<Folder> getLevel2Folders(int folderId) throws Exception {
		return dao.getLevel2Folders(folderId);
	}
	
	public List<Folder> getFoldersForLevel(String level) throws Exception {
		return dao.getFoldersForLevel(level);
	}
	
	public List<Folder> getMultiSearchFoldersForLevel(String level) throws Exception {
		return dao.getMultiSearchFoldersForLevel(level);
	}
	
	public List<Folder> getMultiSearchLevel2Folders(int folderId) throws Exception {
		return dao.getMultiSearchLevel2Folders(folderId);
	}
	
	public boolean deleteVersionDocument(String docId) throws Exception {
		return dao.deleteVersionDocument(docId);
	}
	
	public Map<String, String> getDocumentTypeWhichMapped(String docType) throws Exception {
		return dao.getDocumentTypeWhichMapped(docType);
	}
}

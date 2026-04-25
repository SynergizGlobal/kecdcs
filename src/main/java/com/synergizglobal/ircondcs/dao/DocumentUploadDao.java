package com.synergizglobal.ircondcs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.synergizglobal.ircondcs.common.DBConnectionHandler;
import com.synergizglobal.ircondcs.controller.ApplicationSingleton;
import com.synergizglobal.ircondcs.model.DocumentUpload;
import com.synergizglobal.ircondcs.model.Folder;
import com.synergizglobal.ircondcs.model.UserAccess;

@Component
public class DocumentUploadDao {
	Logger logger = Logger.getLogger(DocumentUploadDao.class);
	@Autowired
	DataSource dataSource;

	@Autowired
	ApplicationSingleton appSingleton;

	public List<String> getListOfLevels() throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<String> listOfLevels = new ArrayList<String>();
		try {
			con = dataSource.getConnection();
			String qry = " select distinct level from folder order by level  ";
			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			while (rs.next()) {
				String level = rs.getString("level");
				listOfLevels.add(level);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return listOfLevels;
	}

	public List<Folder> getFoldersForLevel(String level) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Folder> foldersList = new ArrayList<Folder>();
		try {
			con = dataSource.getConnection();
			String qry = " SELECT  folder_id, level_description, level_id, parent_level_id,level from folder where level = '"
					+ level + "' and status_id_fk=1 order by level_description ";
			stmt = con.prepareStatement(qry);

			rs = stmt.executeQuery();
			while (rs.next()) {
				foldersList.add(convertToFolder(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return foldersList;
	}

	public List<Folder> getParentFolders(String userId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Folder> foldersList = new ArrayList<Folder>();
		try {
			con = dataSource.getConnection();
			String qry = " SELECT  folder_id, level_description, level_id, parent_level_id,level "
					+ "from folder , user_access "
					+ "where status_id_fk=1 AND (parent_level_id = 0 or parent_level_id is NULL) "
					+ "AND folder_id = folder_id_fk and user_id_fk=" + userId;
			qry += " order by folder_id ";

			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			while (rs.next()) {
				foldersList.add(convertToFolder(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return foldersList;
	}

	public List<Folder> getAllFolder() throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Folder> foldersList = new ArrayList<Folder>();
		try {
			con = dataSource.getConnection();
			String qry = " SELECT  folder_id, level_description, level_id, parent_level_id,level " + "from folder "
					+ "where status_id_fk=1 ";
			qry += " order by level_description ";

			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			while (rs.next()) {
				foldersList.add(convertToFolder(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return foldersList;
	}

	public List<Folder> getRefParentFoldersForLevel(String userId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Folder> foldersList = new ArrayList<Folder>();
		try {
			con = dataSource.getConnection();
			String qry = " SELECT  folder_id, level_description, level_id, parent_level_id,level "
					+ "from folder , user_access "
					+ "where status_id_fk=1 AND (parent_level_id = 0 or parent_level_id is NULL) "
					+ "AND folder_id = folder_id_fk and user_id_fk=" + userId;
			qry += " order by level_description ";

			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			while (rs.next()) {
				foldersList.add(convertToFolder(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return foldersList;
	}

	public ArrayList<Folder> getLevelMenu() throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Folder> foldersList = new ArrayList<Folder>();
		try {
			con = dataSource.getConnection();

			// Parent Level
			String qry = " SELECT distinct folder_id, level_description, level_id, parent_level_id,level "
					+ "from folder, user_access where status_id_fk=1 " + "AND folder_id = folder_id_fk "
					+ "AND (parent_level_id = 0 or parent_level_id is NULL)";
			qry += " order by level_description ";

			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			while (rs.next()) {
				foldersList.add(convertToFolder(rs));
			}
			rs.close();
			stmt.close();

			getLevelSubMenu(con, foldersList);

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}

		return foldersList;
	}

	public DocumentUpload updateFolderLevelFK(DocumentUpload documentUpload) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Folder> foldersList = new ArrayList<Folder>();
		try {
			con = dataSource.getConnection();

			// Parent Level
			String qry = " SELECT distinct folder_id, level_description, level_id, parent_level_id,level "
					+ "from folder, user_access where status_id_fk=1 " + "AND folder_id = folder_id_fk "
					+ "AND (parent_level_id = 0 or parent_level_id is NULL)";
			qry += " order by level_description ";

			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			while (rs.next()) {
				foldersList.add(convertToFolder(rs));
			}
			rs.close();
			stmt.close();

			getLevelSubMenu(con, foldersList);

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}

		return documentUpload;
	}

	private void getLevelSubMenu(Connection con, ArrayList<Folder> foldersList) throws Exception {
		for (Folder folder : foldersList) {
			if (StringUtils.hasText(folder.getLevelId())) {
				logger.info("Folder - " + folder.getLevelDescription());
				ArrayList<Folder> subFoldersList = getLevelSubMenu(con, folder.getLevelId());
				if (!CollectionUtils.isEmpty(subFoldersList)) {
					folder.setSubFolderList(subFoldersList);
				}
			}
		}
	}

	public ArrayList<Folder> getLevelSubMenu(Connection con, String levelId) throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Folder> foldersList = new ArrayList<Folder>();
		try {

			String qry = " SELECT  folder_id, level_description, level_id, parent_level_id,level from folder where status_id_fk=1";
			qry += " and parent_level_id = ? ";
			qry += " order by level_description ";

			stmt = con.prepareStatement(qry);
			stmt.setString(1, levelId);
			rs = stmt.executeQuery();
			while (rs.next()) {
				foldersList.add(convertToFolder(rs));
			}
			rs.close();
			stmt.close();

			for (Folder folder : foldersList) {
				if (StringUtils.hasText(folder.getLevelId())) {
					logger.info("Level - " + folder.getLevelDescription() + ", " + levelId);
					ArrayList<Folder> subFoldersList = getLevelSubMenu(con, folder.getLevelId());
					if (!CollectionUtils.isEmpty(subFoldersList)) {
						folder.setSubFolderList(subFoldersList);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(null, stmt, rs);
		}
		return foldersList;
	}

	private Folder convertToFolder(ResultSet rs) throws SQLException {
		Folder folder = new Folder();
		folder.setFolderId(rs.getString("folder_id"));
		folder.setLevelDescription(rs.getString("level_description"));
		folder.setLevelId(rs.getString("level_id"));
		folder.setParentLevelId(rs.getString("parent_level_id"));
		folder.setLevel(rs.getString("level"));
		return folder;
	}

	public List<Folder> getSubFoldersForFolderId(String folderId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Folder> foldersList = new ArrayList<Folder>();
		try {
			String levelId = null;
			con = dataSource.getConnection();
			String qry = " SELECT level_id from folder where status_id_fk=1 and folder_id in ('" + folderId + "') ";
			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			if (rs.next()) {
				levelId = rs.getString("level_id");
			}
			rs.close();
			stmt.close();

			if (StringUtils.hasText(levelId)) {
				qry = " SELECT  folder_id, level_description, level_id, parent_level_id,level from folder where status_id_fk=1";
				qry += " and parent_level_id = ? ";
				qry += " order by folder_id ";

				stmt = con.prepareStatement(qry);
				stmt.setString(1, levelId);
				rs = stmt.executeQuery();
				while (rs.next()) {
					foldersList.add(convertToFolder(rs));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return foldersList;
	}

	public Map<String, Folder> getFolderLevelForBreadCrumb(String folderId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Map<String, Folder> levelFolders = new HashMap<String, Folder>();
		try {
			Folder curFolder = null;
			con = dataSource.getConnection();
			String qry = " SELECT folder_id, level_description, level_id, parent_level_id,level from folder where status_id_fk=1 and folder_id="
					+ folderId;
			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			if (rs.next()) {
				curFolder = convertToFolder(rs);
			}
			rs.close();
			stmt.close();

			if (curFolder != null) {
				levelFolders.put(curFolder.getLevel(), curFolder);
				if (StringUtils.hasText(curFolder.getParentLevelId())) {
					int level = Integer.parseInt(curFolder.getLevel());
					Folder parent = curFolder;
					for (int x = level; x > 1; x--) {
						parent = getParentFolder(con, parent.getParentLevelId());
						if (parent != null) {
							levelFolders.put(parent.getLevel(), parent);
						}
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return levelFolders;
	}

	private Folder getParentFolder(Connection con, String parentLevelId) throws Exception {
		Folder levelFolder = null;
		if (StringUtils.hasText(parentLevelId)) {
			PreparedStatement stmt = null;
			ResultSet rs = null;

			String qry = " SELECT  folder_id, level_description, level_id, parent_level_id,level from folder where status_id_fk=1";
			qry += " and level_id = ? ";
			qry += " order by level_description ";

			try {
				stmt = con.prepareStatement(qry);
				stmt.setString(1, parentLevelId);
				rs = stmt.executeQuery();
				if (rs.next()) {
					levelFolder = convertToFolder(rs);
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception(e);
			} finally {
				DBConnectionHandler.closeJDBCResoucrs(null, stmt, rs);
			}
		}
		return levelFolder;
	}

	public boolean createNewVersionDocumentUpload(DocumentUpload docUpload) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		boolean flag = false;
		try {
			con = dataSource.getConnection();
			String qry = "update document set soft_delete_status_id_fk=?,modified_by=?,modified_date=? where document_id = "
					+ docUpload.getDocument_id();
			stmt = con.prepareStatement(qry);
			stmt.setInt(1, 2);
			stmt.setString(2, docUpload.getUserName());
			stmt.setDate(3, new java.sql.Date(System.currentTimeMillis()));

			int c = stmt.executeUpdate();
			if (c > 0) {
				flag = true;
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, null);
		}
		if (flag) {
			return createDocumentUpload(docUpload);
		}
		return false;

	}

	public boolean createDocumentUpload(DocumentUpload documentUpload) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean flag = false;
		int docId = 0;
		try {
			con = dataSource.getConnection();

			String qry = "  INSERT INTO document (document_name,document_no,soft_delete_status_id_fk,document_type_fk,tags_fk,version_number,"
					+ "user_id_fk,modified_date,L1_folder_id_fk,L2_folder_id_fk,L3_folder_id_fk,L4_folder_id_fk,approval_date,"
					+ "confidential,structure_type_fk,revision_type_fk,approver_user_id_fk,comments,"
					+ "created_by,created_date,modified_by,location,owner_user_id_fk,reference_no,title,subject ) "
					+ " VALUES ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)  ";
			// stmt = con.prepareStatement(qry);
			stmt = con.prepareStatement(qry, Statement.RETURN_GENERATED_KEYS);

			stmt.setString(1, documentUpload.getDocument_name());
			stmt.setString(2, documentUpload.getDocument_no());
			stmt.setInt(3, 1);
			stmt.setInt(4, getNumber(documentUpload.getDocument_type_fk()));
			stmt.setString(5, documentUpload.getTags_fk());
			stmt.setInt(6, getNumber(documentUpload.getVersion_number()));
			stmt.setInt(7, getNumber(documentUpload.getUser_id_fk()));
			stmt.setTimestamp(8, new Timestamp(System.currentTimeMillis()));
			stmt.setInt(9, getNumber(documentUpload.getL1_folder_id_fk()));
			stmt.setInt(10, getNumber(documentUpload.getL2_folder_id_fk()));
			stmt.setInt(11, getNumber(documentUpload.getL3_folder_id_fk()));
			stmt.setInt(12, getNumber(documentUpload.getL4_folder_id_fk()));
			stmt.setDate(13, getSQLDate(documentUpload.getApproval_date()));
			stmt.setString(14, documentUpload.getConfidential());
			stmt.setInt(15, getNumber(documentUpload.getStructure_type_fk()));
			stmt.setInt(16, getNumber(documentUpload.getRevision_type_fk()));
			stmt.setInt(17, getNumber(documentUpload.getApprover_user_id_fk()));
			stmt.setString(18, documentUpload.getComments());
			stmt.setString(19, documentUpload.getUserName());
			stmt.setTimestamp(20, new Timestamp(System.currentTimeMillis()));
			stmt.setString(21, documentUpload.getUserName());
			stmt.setString(22, documentUpload.getLocation());
			stmt.setInt(23, getNumber(documentUpload.getOwner_user_id_fk()));
			stmt.setString(24, documentUpload.getReference_no());
			stmt.setString(25, documentUpload.getTitle());
			stmt.setString(26, documentUpload.getSubject());
			stmt.executeUpdate();
			rs = stmt.getGeneratedKeys();
			if (rs.next()) {
				docId = rs.getInt(1);
			}
			if (docId > 0) {
				flag = true;
			}

			rs.close();
			stmt.close();

			if (StringUtils.hasText(documentUpload.getReference_no())) {
				updateReferences(con, String.valueOf(docId), documentUpload.getReference_no(),
						documentUpload.getUserName());
			}

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return flag;
	}

	private void updateReferences(Connection con, String parentDocId, String references, String updatedBy)
			throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String[] refDocIds = references.split(",");
		if (refDocIds != null && refDocIds.length > 0) {
			try {
				for (String refDocId : refDocIds) {
					String curReferences = "";
					stmt = con.prepareStatement(
							"SELECT reference_no FROM document where document_id ='" + refDocId + "'");
					rs = stmt.executeQuery();
					if (rs.next()) {
						curReferences = rs.getString("reference_no");
					}
					rs.close();
					stmt.close();

					List<String> refList = new ArrayList<>();
					if (StringUtils.hasText(curReferences)) {
						refList = Arrays.asList(curReferences.split(","));
					} else {
						curReferences = "";
					}

					if (!refList.contains(parentDocId)) {
						StringBuffer tmpRef = new StringBuffer(curReferences);
						if (StringUtils.hasText(curReferences)) {
							tmpRef.append(",");
							tmpRef.append(parentDocId);
						} else {
							tmpRef.append(parentDocId);
						}
						stmt = con.prepareStatement(
								"update document set reference_no =?,modified_by=?,modified_date=? where document_id ='"
										+ refDocId + "'");
						stmt.setString(1, tmpRef.toString());
						stmt.setString(2, updatedBy);
						stmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
						stmt.executeUpdate();
						stmt.close();
					}
				}

			} catch (Exception e) {
				throw new Exception(e);
			} finally {
				DBConnectionHandler.closeJDBCResoucrs(null, stmt, rs);
			}
		}
	}

	public boolean updateDocument(DocumentUpload documentUpload) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		boolean flag = false;
		try {
			createDocumentHistory(documentUpload.getDocument_id());

			DocumentUpload eDocumentUpload = getDocument(String.valueOf(documentUpload.getDocument_id()));
			List<String> toRemoveRef = getRemovedReferences(eDocumentUpload.getReference_no(),
					documentUpload.getReference_no());

			con = dataSource.getConnection();
			String qry = "update document set document_name = ?, document_type_fk=?, tags_fk=?, structure_type_fk=?, revision_type_fk = ?, approver_user_id_fk=?, location=?, reference_no =? , title =?,"
					+ "modified_by=?,modified_date=?, version_number = ?, subject=?  where document_id = " + documentUpload.getDocument_id();
			stmt = con.prepareStatement(qry);
			stmt.setString(1, documentUpload.getDocument_name());
			stmt.setInt(2, getNumber(documentUpload.getDocument_type_fk()));
			stmt.setString(3, documentUpload.getTags_fk());
			stmt.setInt(4, getNumber(documentUpload.getStructure_type_fk()));
			stmt.setInt(5, getNumber(documentUpload.getRevision_type_fk()));
			stmt.setInt(6, getNumber(documentUpload.getApprover_user_id_fk()));
			stmt.setString(7, documentUpload.getLocation());
			stmt.setString(8, documentUpload.getReference_no());
			stmt.setString(9, documentUpload.getTitle());
			stmt.setString(10, documentUpload.getUserName());
			stmt.setTimestamp(11, new Timestamp(System.currentTimeMillis()));
			stmt.setInt(12, getNumber(documentUpload.getVersion_number()));
			stmt.setString(13, documentUpload.getSubject());
			
			int c = stmt.executeUpdate();
			if (c > 0) {
				flag = true;
			}

			if (StringUtils.hasText(documentUpload.getReference_no())) {
				updateReferences(con, String.valueOf(documentUpload.getDocument_id()), documentUpload.getReference_no(),
						documentUpload.getUserName());
			}

			if (!CollectionUtils.isEmpty(toRemoveRef)) {
				removeReferences(con, String.valueOf(documentUpload.getDocument_id()), toRemoveRef,
						documentUpload.getUserName());
			}

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, null);
		}
		return flag;
	}

	private void removeReferences(Connection con, String parentDocNo, List<String> toRemoveRef, String updatedBy)
			throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			for (String refDocId : toRemoveRef) {
				String curReferences = "";
				stmt = con.prepareStatement("SELECT reference_no FROM document where document_id ='" + refDocId + "'");
				rs = stmt.executeQuery();
				if (rs.next()) {
					curReferences = rs.getString("reference_no");
				}
				rs.close();
				stmt.close();

				List<String> refList = new ArrayList<>();
				if (StringUtils.hasText(curReferences)) {
					refList = new ArrayList<>(Arrays.asList(curReferences.split(",")));
					refList.remove(parentDocNo);
					if (!CollectionUtils.isEmpty(toRemoveRef)) {
						String toUpdateRef = refList.stream().collect(Collectors.joining(","));
						stmt = con.prepareStatement(
								"update document set reference_no =?,modified_by=?,modified_date=? where document_id ='"
										+ refDocId + "'");
						stmt.setString(1, toUpdateRef);
						stmt.setString(2, updatedBy);
						stmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
						stmt.executeUpdate();
						stmt.close();
					}
				}
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(null, stmt, rs);
		}
	}

	private List<String> getRemovedReferences(String existingRef, String newRef) {
		String eRef = "";
		String nRef = "";
		if (StringUtils.hasText(existingRef)) {
			eRef = existingRef.trim();
		}
		if (StringUtils.hasText(newRef)) {
			nRef = newRef.trim();
		}
		List<String> eRefList = new ArrayList<>(Arrays.asList(eRef.split(",")));
		List<String> nRefList = new ArrayList<>(Arrays.asList(nRef.split(",")));
		eRefList.removeAll(nRefList);
		return eRefList;
	}

	private int getNumber(String val) {
		int intVal = 0;
		if (StringUtils.hasLength(val)) {
			try {
				intVal = Integer.parseInt(val);
			} catch (Exception e) {
			}
		}
		return intVal;
	}

	private java.sql.Date getSQLDate(String dtString) {
		if (!StringUtils.hasLength(dtString)) {
			return null;
		}
		java.sql.Date sqlStartDate = null;
		try {
			SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
			java.util.Date date = sdf1.parse(dtString);
			sqlStartDate = new java.sql.Date(date.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return sqlStartDate;
	}

	public boolean createDocumentUpload(ArrayList<DocumentUpload> docUploads) throws Exception {
		if (CollectionUtils.isEmpty(docUploads)) {
			return true;
		}
		for (DocumentUpload docUpload : docUploads) {
			createDocumentUpload(docUpload);
		}
		return true;
	}

	public String getBucketLocation(DocumentUpload docUpload) throws Exception {
		StringBuffer pathStr = new StringBuffer();
		if (StringUtils.hasLength(docUpload.getL1_folder_id_fk())
				&& !"0".equalsIgnoreCase(docUpload.getL1_folder_id_fk())) {
			getFolderName(docUpload.getL1_folder_id_fk(), pathStr);
		}
		if (StringUtils.hasLength(docUpload.getL2_folder_id_fk())
				&& !"0".equalsIgnoreCase(docUpload.getL2_folder_id_fk())) {
			getFolderName(docUpload.getL2_folder_id_fk(), pathStr);
		}
		if (StringUtils.hasLength(docUpload.getL3_folder_id_fk())
				&& !"0".equalsIgnoreCase(docUpload.getL3_folder_id_fk())) {
			getFolderName(docUpload.getL3_folder_id_fk(), pathStr);
		}
		if (StringUtils.hasLength(docUpload.getL4_folder_id_fk())
				&& !"0".equalsIgnoreCase(docUpload.getL4_folder_id_fk())) {
			getFolderName(docUpload.getL4_folder_id_fk(), pathStr);
		}
		return pathStr.toString();
	}

	public StringBuffer getFolderName(String id, StringBuffer pathStr) throws Exception {
		String temp = getFolderName(id);
		if (StringUtils.hasLength(temp)) {
			if (pathStr.toString().length() > 0)
				pathStr.append("/");
			pathStr.append(temp);
		}
		return pathStr;
	}

	public String getFolderName(String id) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String folderName = null;
		try {
			con = dataSource.getConnection();
			String qry = " SELECT level_description from folder where folder_id =" + id;
			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			if (rs.next()) {
				folderName = rs.getString("level_description");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return folderName;
	}

	public void clearTempDocumentImages(String userId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = dataSource.getConnection();
			String qry = "delete from temp_document_images where created_by = " + userId;
			stmt = con.prepareStatement(qry);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, null);
		}
	}

	public boolean createTempDocumentImages(String user_id, String documentName) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		boolean flag = false;
		try {
			con = dataSource.getConnection();
			String qry = "  INSERT INTO temp_document_images (document_uploaded, created_by,created_date) "
					+ " VALUES (?,?,?)  ";
			stmt = con.prepareStatement(qry);

			stmt.setString(1, documentName);
			stmt.setInt(2, Integer.valueOf(user_id));
			stmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
			int c = stmt.executeUpdate();

			if (c > 0) {
				flag = true;
			}

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, null);
		}
		return flag;
	}

	public boolean validateDocumentNo(String docNo) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			con = dataSource.getConnection();
			String qry = "  Select count(document_id) as count from document where soft_delete_status_id_fk != 3 AND document_no = '" + docNo + "'";
			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			if (rs.next()) {
				int count = rs.getInt("count");
				if (count > 0) {
					flag = true;
				}
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return flag;
	}

	public boolean validateVersionNo(String docNo, String versionNo) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			con = dataSource.getConnection();
			String qry = "  Select count(document_id) as count from document where soft_delete_status_id_fk != 3 AND document_no = '" + docNo + "' AND version_number >= "+ versionNo;
			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			if (rs.next()) {
				int count = rs.getInt("count");
				if (count > 0) {
					flag = true;
				}
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return flag;
	}

	public boolean validateTypeValues(String value, String tableName) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			con = dataSource.getConnection();
			String qry = "  Select count(id) as count from " + tableName + " where value = '" + value.toUpperCase().trim() + "'";
			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			if (rs.next()) {
				int count = rs.getInt("count");
				if (count > 0) {
					flag = true;
				}
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return flag;
	}

	public int addCreateTypeValues(String value, String tableName) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int tagId = 0;
		try {
			con = dataSource.getConnection();
			String qry = " INSERT INTO " + tableName + " (value) values ('" + value.toUpperCase().trim() + "')";
			stmt = con.prepareStatement(qry, Statement.RETURN_GENERATED_KEYS);
			stmt.executeUpdate();
			rs = stmt.getGeneratedKeys();
			if (rs.next()) {
				tagId = rs.getInt(1);
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return tagId;
	}

	private String BASE_DOCUMENT_SQL = "SELECT document_id, document_name, document_no,document_type_fk,version_number,tags_fk,revision_type_fk,reference_no,level_description,"
			+ "L1_folder_id_fk,L2_folder_id_fk,L3_folder_id_fk,L4_folder_id_fk,document.created_by,document.modified_by,soft_delete_status_id_fk,approver_user_id_fk,"
			+ "location,confidential,structure_type_fk,DATE_FORMAT(approval_date, '%d-%m-%Y') AS approval_date,owner_user_id_fk,"
			+ "DATE_FORMAT(document.created_date, '%d-%m-%Y') AS created_date,DATE_FORMAT(document.modified_date, '%d-%m-%Y') AS modified_date, "
			+ "soft_delete_status.status, title,subject,document.modified_date as modifiedTS,document.created_date as createdTS "
			+ "FROM document, soft_delete_status, folder "
			+ "where document.document_id > 0 AND document.L1_folder_id_fk = folder.folder_id "
			+ "and document.soft_delete_status_id_fk = soft_delete_status.soft_delete_status_id ";

	public List<DocumentUpload> getDocumentList() throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<DocumentUpload> documentList = new ArrayList<DocumentUpload>();
		try {
			con = dataSource.getConnection();
			String qry = BASE_DOCUMENT_SQL + " AND soft_delete_status_id_fk = 1 order by document.modified_date desc ";
			stmt = con.prepareStatement(qry);

			rs = stmt.executeQuery();
			while (rs.next()) {
				documentList.add(getDocumentUpload(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}

		try {
			con = dataSource.getConnection();
			for (DocumentUpload dataObj : documentList) {
				if (dataObj != null) {
					dataObj.setL1_folder_id_val(getLevelDescription(dataObj.getL1_folder_id_fk(), con));
					dataObj.setL2_folder_id_val(getLevelDescription(dataObj.getL2_folder_id_fk(), con));
					dataObj.setL3_folder_id_val(getLevelDescription(dataObj.getL3_folder_id_fk(), con));
					dataObj.setL4_folder_id_val(getLevelDescription(dataObj.getL4_folder_id_fk(), con));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, null, null);
		}

		return documentList;
	}

	private String BASE_DOCUMENT_COUNT_SQL = "SELECT count(document_id) as totalCount "
			+ "FROM document, soft_delete_status, folder "
			+ "where document.document_id > 0 AND document.L1_folder_id_fk = folder.folder_id "
			+ "and document.soft_delete_status_id_fk = soft_delete_status.soft_delete_status_id ";

	public int getTotalRecords() throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int totalCount = 0;
		try {
			con = dataSource.getConnection();
			String qry = BASE_DOCUMENT_COUNT_SQL + " AND soft_delete_status_id_fk = 1 ";
			stmt = con.prepareStatement(qry);

			rs = stmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt("totalCount");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return totalCount;
	}

	public List<DocumentUpload> getDocumentList(DocumentUpload obj, int startIndex, int offset, String searchParameter)
			throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<DocumentUpload> documentList = new ArrayList<DocumentUpload>();
		try {
			con = dataSource.getConnection();
			String qry = BASE_DOCUMENT_SQL + " AND soft_delete_status_id_fk = 1 ";

			if ("Y".equalsIgnoreCase(obj.getFlCorrespondences())) {
				qry = qry + " AND LOWER(folder.level_description) LIKE  '%correspond%'";
			}
			if ("Y".equalsIgnoreCase(obj.getFlDrawings())) {
				qry = qry + " AND LOWER(folder.level_description) LIKE  '%drawings%'";
			}
			if (StringUtils.hasText(obj.getStructure_type_fk()) && !"0".equalsIgnoreCase(obj.getStructure_type_fk())) {
				qry = qry + " AND structure_type_fk = " + obj.getStructure_type_fk();
			}
			if (StringUtils.hasText(obj.getDocument_type_fk()) && !"0".equalsIgnoreCase(obj.getDocument_type_fk())) {
				qry = qry + " AND document_type_fk = " + obj.getDocument_type_fk();
			}
			if (StringUtils.hasText(obj.getTags_fk()) && !"0".equalsIgnoreCase(obj.getTags_fk())
					&& !"null".equalsIgnoreCase(obj.getTags_fk())) {
				qry = qry + " AND tags_fk like '%" + obj.getTags_fk() + "%' ";
			}
			if (StringUtils.hasText(obj.getL1_folder_id_fk()) && !"0".equalsIgnoreCase(obj.getL1_folder_id_fk())) {
				qry = qry + " AND L1_folder_id_fk = " + obj.getL1_folder_id_fk();
			}
			if (StringUtils.hasText(obj.getL2_folder_id_fk()) && !"0".equalsIgnoreCase(obj.getL2_folder_id_fk())) {
				qry = qry + " AND L2_folder_id_fk = " + obj.getL2_folder_id_fk();
			}
			if (StringUtils.hasText(obj.getL3_folder_id_fk()) && !"0".equalsIgnoreCase(obj.getL3_folder_id_fk())) {
				qry = qry + " AND L3_folder_id_fk = " + obj.getL3_folder_id_fk();
			}

			stmt = con.prepareStatement(qry);

			qry = qry + " order by document.modified_date desc limit ?,?  ";
			stmt = con.prepareStatement(qry);
			stmt.setInt(1, startIndex);
			stmt.setInt(2, offset);
			rs = stmt.executeQuery();
			while (rs.next()) {
				documentList.add(getDocumentUpload(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}

		try {
			con = dataSource.getConnection();
			for (DocumentUpload dataObj : documentList) {
				if (dataObj != null) {
					dataObj.setL1_folder_id_val(getLevelDescription(dataObj.getL1_folder_id_fk(), con));
					dataObj.setL2_folder_id_val(getLevelDescription(dataObj.getL2_folder_id_fk(), con));
					dataObj.setL3_folder_id_val(getLevelDescription(dataObj.getL3_folder_id_fk(), con));
					dataObj.setL4_folder_id_val(getLevelDescription(dataObj.getL4_folder_id_fk(), con));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, null, null);
		}

		return documentList;
	}

	public List<DocumentUpload> getDocumentList(String folderId, String levelId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		if (!StringUtils.hasText(folderId)) {
			folderId = "0";
		}

		List<DocumentUpload> documentList = new ArrayList<DocumentUpload>();
		try {
			con = dataSource.getConnection();
			String qry = BASE_DOCUMENT_SQL + " AND soft_delete_status_id_fk = 1 ";
			if ("1".equalsIgnoreCase(levelId)) {
				qry += " AND L2_folder_id_fk = 0 AND L3_folder_id_fk = 0 AND L4_folder_id_fk = 0 AND L1_folder_id_fk = "
						+ folderId;
			} else if ("2".equalsIgnoreCase(levelId)) {
				qry += " AND L3_folder_id_fk = 0 AND L4_folder_id_fk = 0 AND L2_folder_id_fk = " + folderId;
			} else if ("3".equalsIgnoreCase(levelId)) {
				qry += " AND L4_folder_id_fk = 0 AND L3_folder_id_fk = " + folderId;
			} else if ("4".equalsIgnoreCase(levelId)) {
				qry += " AND L4_folder_id_fk = " + folderId;
			}
			qry += "  order by document.modified_date desc   ";
			stmt = con.prepareStatement(qry);

			rs = stmt.executeQuery();
			while (rs.next()) {
				documentList.add(getDocumentUpload(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return documentList;
	}

	public List<DocumentUpload> getCorrespondenceDocumentList(String docId, String userId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DocumentUpload docUpload = getDocument(docId);
		ArrayList<String> corresDocIds = new ArrayList<String>();
		if (StringUtils.hasText(docUpload.getReference_no())) {
			String[] tempRefNo = docUpload.getReference_no().split(",");
			for (String tempRefDoc : tempRefNo) {
				if (StringUtils.hasText(tempRefDoc)) {
					corresDocIds.add(tempRefDoc);
				}
			}
		}

		List<Folder> level1Folders = getParentFolders(userId);
		// corresDocIds.add(docId);
		String allIds = corresDocIds.stream().collect(Collectors.joining("','"));

		List<DocumentUpload> documentList = new ArrayList<DocumentUpload>();
		if (!StringUtils.hasText(allIds)) {
			return documentList;
		}
		try {
			con = dataSource.getConnection();
			String qry = BASE_DOCUMENT_SQL;
			qry += " AND soft_delete_status_id_fk = 1 AND  AND document_id in ('" + allIds + "') ";
			qry += "  order by document.modified_date desc  ";
			stmt = con.prepareStatement(qry);

			rs = stmt.executeQuery();
			while (rs.next()) {
				documentList.add(getDocumentUpload(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}

		try {
			con = dataSource.getConnection();
			for (DocumentUpload dataObj : documentList) {
				if (dataObj != null) {
					dataObj.setL1_folder_id_val(getLevelDescription(dataObj.getL1_folder_id_fk(), con));
					dataObj.setL2_folder_id_val(getLevelDescription(dataObj.getL2_folder_id_fk(), con));
					dataObj.setL3_folder_id_val(getLevelDescription(dataObj.getL3_folder_id_fk(), con));
					dataObj.setL4_folder_id_val(getLevelDescription(dataObj.getL4_folder_id_fk(), con));

					dataObj.setL1Folder(level1Folders);
					dataObj.setL2Folder(getRefFolderGroup(con, dataObj.getL2_folder_id_fk()));
					dataObj.setL3Folder(getRefFolderGroup(con, dataObj.getL3_folder_id_fk()));
					dataObj.setL4Folder(getRefFolderGroup(con, dataObj.getL4_folder_id_fk()));

					if (!StringUtils.hasText(dataObj.getL2_folder_id_fk())) {
						dataObj.setRefDocumentList(getDocumentList(dataObj.getL1_folder_id_fk(), "1"));
					} else if (!StringUtils.hasText(dataObj.getL3_folder_id_fk())) {
						dataObj.setRefDocumentList(getDocumentList(dataObj.getL2_folder_id_fk(), "2"));
					} else if (!StringUtils.hasText(dataObj.getL4_folder_id_fk())) {
						dataObj.setRefDocumentList(getDocumentList(dataObj.getL3_folder_id_fk(), "3"));
					} else {
						dataObj.setRefDocumentList(getDocumentList(dataObj.getL4_folder_id_fk(), "4"));
					}

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, null, null);
		}

		return documentList;
	}

	private DocumentUpload getDocumentUpload(ResultSet rs) throws SQLException {
		DocumentUpload dataObj = new DocumentUpload();
		dataObj.setDocument_id(rs.getInt("document_id"));
		dataObj.setDocument_name(rs.getString("document_name"));
		dataObj.setDocument_no(rs.getString("document_no"));
		dataObj.setRevision_type_fk(convertIntToString(rs.getInt("revision_type_fk")));
		dataObj.setDocument_type_fk(convertIntToString(rs.getInt("document_type_fk")));
		dataObj.setCreated_by(rs.getString("created_by"));
		dataObj.setCreated_date(rs.getString("created_date"));
		dataObj.setModified_by(rs.getString("modified_by"));
		dataObj.setModified_date(rs.getString("modified_date"));
		dataObj.setL1_folder_id_fk(convertIntToString(rs.getInt("L1_folder_id_fk")));
		dataObj.setL2_folder_id_fk(convertIntToString(rs.getInt("L2_folder_id_fk")));
		dataObj.setL3_folder_id_fk(convertIntToString(rs.getInt("L3_folder_id_fk")));
		dataObj.setL4_folder_id_fk(convertIntToString(rs.getInt("L4_folder_id_fk")));
		dataObj.setVersion_number(rs.getString("version_number"));
		dataObj.setTags_fk(rs.getString("tags_fk"));
		dataObj.setLocation(rs.getString("location"));
		dataObj.setConfidential(rs.getString("confidential"));
		dataObj.setStructure_type_fk(convertIntToString(rs.getInt("structure_type_fk")));
		dataObj.setApproval_date(rs.getString("approval_date"));
		dataObj.setSoft_delete_status_id_fk(convertIntToString(rs.getInt("soft_delete_status_id_fk")));
		dataObj.setApprover_user_id_fk(convertIntToString(rs.getInt("approver_user_id_fk")));
		dataObj.setOwner_user_id_fk(convertIntToString(rs.getInt("owner_user_id_fk")));
		dataObj.setStatus(rs.getString("status"));
		dataObj.setReference_no(rs.getString("reference_no"));
		dataObj.setRootParentLevel(rs.getString("level_description"));
		dataObj.setTitle(rs.getString("title"));
		dataObj.setSubject(rs.getString("subject"));

		if (StringUtils.hasText(dataObj.getRootParentLevel())) {
			dataObj.setFlCorrespondences(dataObj.getRootParentLevel().toLowerCase().contains("correspond") ? "Y" : "N");
		}
		dataObj.setDocumentTypeVal(appSingleton.getDcoumentTypeValue(dataObj.getDocument_type_fk()));
		dataObj.setRevisionTypeVal(appSingleton.getRevisionTypeValue(dataObj.getRevision_type_fk()));
		dataObj.setStructureTypeVal(appSingleton.getStructureTypeValue(dataObj.getStructure_type_fk()));
		dataObj.setTagsVal(appSingleton.getTagsValue(dataObj.getTags_fk()));

		dataObj.setCreatedTS(convertIntoDDMMYYYYHHSSA(rs.getString("createdTS")));
		dataObj.setModifiedTS(convertIntoDDMMYYYYHHSSA(rs.getString("modifiedTS")));

		return dataObj;
	}

	public List<DocumentUpload> getDocumentVersionList(String docNo) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<DocumentUpload> documentList = new ArrayList<DocumentUpload>();
		try {
			con = dataSource.getConnection();
			String qry = BASE_DOCUMENT_SQL + " AND soft_delete_status_id_fk != 3 AND document_no ='" + docNo + "' order by document.version_number desc";
			stmt = con.prepareStatement(qry);

			rs = stmt.executeQuery();
			while (rs.next()) {
				documentList.add(getDocumentUpload(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return documentList;
	}

	public void doActiveOrDeactiveDocuments(String docId, int reqStatus, String userName) throws Exception {
		DocumentUpload documentUpload = getDocument(docId);
		List<DocumentUpload> documentList = getDocumentVersionList(documentUpload.getDocument_no());
		Connection con = null;
		try {
			con = dataSource.getConnection();
			activateOrInactivate(con, docId, userName, 1);

			for (DocumentUpload upload : documentList) {
				if (docId.equalsIgnoreCase(String.valueOf(upload.getDocument_id()))) {
					continue;
				}
				activateOrInactivate(con, String.valueOf(upload.getDocument_id()), userName, 2);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, null, null);
		}

	}

	public DocumentUpload getDocument(String docId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		DocumentUpload dataObj = null;
		try {
			con = dataSource.getConnection();
			String qry = BASE_DOCUMENT_SQL + " AND document_id =" + docId;
			stmt = con.prepareStatement(qry);

			rs = stmt.executeQuery();
			if (rs.next()) {
				dataObj = getDocumentUpload(rs);
			}
			rs.close();
			stmt.close();

			if (dataObj != null) {
				dataObj.setL1_folder_id_val(getLevelDescription(dataObj.getL1_folder_id_fk(), con));
				dataObj.setL2_folder_id_val(getLevelDescription(dataObj.getL2_folder_id_fk(), con));
				dataObj.setL3_folder_id_val(getLevelDescription(dataObj.getL3_folder_id_fk(), con));
				dataObj.setL4_folder_id_val(getLevelDescription(dataObj.getL4_folder_id_fk(), con));
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}

		return dataObj;
	}

	public String getLevelDescription(String folderId, Connection con) throws Exception {
		if (!StringUtils.hasText(folderId)) {
			return null;
		}
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String levelDesc = null;
		try {
			String qry = " SELECT level_description from folder where status_id_fk=1 and folder_id=" + folderId;
			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			if (rs.next()) {
				levelDesc = rs.getString("level_description");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(null, stmt, rs);
		}
		return levelDesc;
	}

	private String convertIntToString(int val) {
		if (val > 0) {
			return String.valueOf(val);
		}
		return "";
	}

	public boolean deleteVersionDocument(String docId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		boolean flag = false;
		try {
			
			DocumentUpload eDocumentUpload = getDocument(docId);
			List<String> toRemoveRef = getRemovedReferences(eDocumentUpload.getReference_no(),"");
			
			con = dataSource.getConnection();
			String qry = "update document set soft_delete_status_id_fk = 3 where document_id = " + docId;
			stmt = con.prepareStatement(qry);
			int c = stmt.executeUpdate();
			if (c > 0) {
				flag = true;
				if(!CollectionUtils.isEmpty(toRemoveRef)) {
					removeReferences(con, docId, toRemoveRef, eDocumentUpload.getUserName());	
				}
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, null);
		}
		return flag;
	}

	public boolean deleteDocument(String docId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		boolean flag = false;
		try {
			
			DocumentUpload eDocumentUpload = getDocument(docId);
			List<String> toRemoveRef = getRemovedReferences(eDocumentUpload.getReference_no(),"");
			
			con = dataSource.getConnection();
			String qry = "update document set soft_delete_status_id_fk = 3 where document_no = '" + eDocumentUpload.getDocument_no() + "'";
			stmt = con.prepareStatement(qry);
			int c = stmt.executeUpdate();
			if (c > 0) {
				flag = true;
				if(!CollectionUtils.isEmpty(toRemoveRef)) {
					removeReferences(con, docId, toRemoveRef, eDocumentUpload.getUserName());	
				}
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, null);
		}
		return flag;
	}

	private boolean createDocumentHistory(int docId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		boolean flag = false;
		try {
			con = dataSource.getConnection();
			String rowCopySql = " INSERT INTO document_history SELECT * FROM document WHERE document_id =" + docId;
			stmt = con.prepareStatement(rowCopySql);
			int c = stmt.executeUpdate();
			if (c > 0) {
				flag = true;
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, null);
		}
		return flag;

	}

	public boolean updateDocumentLevel(DocumentUpload docUpload) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		boolean flag = false;
		try {
			createDocumentHistory(docUpload.getDocument_id());
			con = dataSource.getConnection();

			String qry = "update document set L1_folder_id_fk = ?, L2_folder_id_fk=?, L3_folder_id_fk=?, L4_folder_id_fk=?,modified_by=?,modified_date=? where document_id = "
					+ docUpload.getDocument_id();
			stmt = con.prepareStatement(qry);
			stmt.setInt(1, getNumber(docUpload.getL1_folder_id_fk()));
			stmt.setInt(2, getNumber(docUpload.getL2_folder_id_fk()));
			stmt.setInt(3, getNumber(docUpload.getL3_folder_id_fk()));
			stmt.setInt(4, getNumber(docUpload.getL4_folder_id_fk()));
			stmt.setString(5, docUpload.getUserName());
			stmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));

			int c = stmt.executeUpdate();
			if (c > 0) {
				flag = true;
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, null);
		}
		return flag;
	}

	public boolean activateOrInactivate(Connection con, String docId, String userName, int status) throws Exception {
		PreparedStatement stmt = null;
		boolean flag = false;
		try {
			String qry = "update document set soft_delete_status_id_fk=?,modified_by=?,modified_date=? where document_id = "
					+ docId;
			stmt = con.prepareStatement(qry);
			stmt.setInt(1, status);
			stmt.setString(2, userName);
			stmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));

			int c = stmt.executeUpdate();
			if (c > 0) {
				flag = true;
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(null, stmt, null);
		}
		return flag;
	}

	public boolean renameDocument(DocumentUpload docUpload) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		boolean flag = false;
		try {
			createDocumentHistory(docUpload.getDocument_id());

			con = dataSource.getConnection();
			String qry = "update document set title=?,modified_by=?,modified_date=? where document_id = "
					+ docUpload.getDocument_id();
			stmt = con.prepareStatement(qry);
			stmt.setString(1, docUpload.getTitle());
			stmt.setString(2, docUpload.getUserName());
			stmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));

			int c = stmt.executeUpdate();
			if (c > 0) {
				flag = true;
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, null);
		}
		return flag;
	}

	public boolean shareDocument(DocumentUpload docUpload) throws Exception {
		boolean flag = false;
		try {
			DocumentUpload curCopy = getDocument(String.valueOf(docUpload.getDocument_id()));
			curCopy.setUser_id_fk(docUpload.getUser_id_fk());
			curCopy.setUserName(docUpload.getUserName());
			flag = createDocumentUpload(curCopy);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return flag;
	}

	public Map<String, UserAccess> getUserAccessDetails(String userId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Map<String, UserAccess> userAccessMap = new HashMap<String, UserAccess>();
		UserAccess dataObj = null;
		try {
			con = dataSource.getConnection();

			String qry = " select id,  bulk_download, bulk_upload, edit,  upload, view, "
					+ " user_id_fk, folder_id, ua.delete as is_delete , level_Description from folder f,  user_access ua "
					+ " where  f.folder_id = ua.folder_id_fk AND (parent_level_id = 0 or parent_level_id is NULL) and user_id_fk = "
					+ userId;
			stmt = con.prepareStatement(qry);

			rs = stmt.executeQuery();
			while (rs.next()) {
				dataObj = new UserAccess();
				dataObj.setBulkDownload(rs.getBoolean("bulk_download"));
				dataObj.setBulkUpload(rs.getBoolean("bulk_upload"));
				dataObj.setEdit(rs.getBoolean("edit"));
				dataObj.setUpload(rs.getBoolean("upload"));
				dataObj.setView(rs.getBoolean("view"));
				dataObj.setUserId(rs.getString("user_id_fk"));
				dataObj.setFolderId(rs.getString("folder_id"));
				dataObj.setDelete(rs.getBoolean("is_delete"));
				dataObj.setLevelDescription(rs.getString("level_Description"));
				userAccessMap.putIfAbsent(dataObj.getFolderId(), dataObj);
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return userAccessMap;
	}

	public List<Folder> getRefFolderGroup(Connection con, String folderId) throws Exception {
		if (!StringUtils.hasText(folderId)) {
			return null;
		}
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Folder> foldersList = new ArrayList<Folder>();
		try {
			String qry = " SELECT  folder_id, level_description, level_id, parent_level_id,level " + "from folder "
					+ "where status_id_fk=1  "
					+ "AND parent_level_id in (SELECT parent_level_id from folder where folder_id=" + folderId + ")";

			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			while (rs.next()) {
				foldersList.add(convertToFolder(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(null, stmt, rs);
		}
		return foldersList;
	}

	public Map<String, String> getLookupData(String tableName) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Map<String, String> lookups = new HashMap<String, String>();
		try {
			con = dataSource.getConnection();
			String qry = " select id, value from " + tableName + " where id > 0 order by value";
			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			while (rs.next()) {
				lookups.putIfAbsent(String.valueOf(rs.getInt("id")), rs.getString("value"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return lookups;
	}
	
	public Map<String, String> getDocumentTypeWhichMapped(String docType) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Map<String, String> lookups = new HashMap<String, String>();
		try {
			con = dataSource.getConnection();
			String qry = " select distinct (id), value from document_type dt, document d, folder f "
					+ "where d.document_type_fk = dt.id AND D.document_id > 0 AND d.L1_folder_id_fk = f.folder_id";
			if ("C".equalsIgnoreCase(docType)) {
				qry = qry + " AND LOWER(f.level_description) LIKE  '%correspond%'";
			} else if ("D".equalsIgnoreCase(docType)) {
				qry = qry + " AND LOWER(f.level_description) LIKE  '%drawings%'";
			}
			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			while (rs.next()) {
				lookups.putIfAbsent(String.valueOf(rs.getInt("id")), rs.getString("value"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return lookups;
	}


	private String convertIntoDDMMYYYYHHSSA(String tsStr) {
		if (StringUtils.hasText(tsStr)) {
			java.util.Date dateTS;
			try {
				dateTS = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tsStr);
				SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy hh:mm aa");
				return formatter.format(dateTS);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return "";
	}

	public List<DocumentUpload> getSearchDocumentList(String searchType, DocumentUpload obj) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<DocumentUpload> documentList = new ArrayList<DocumentUpload>();
		try {
			con = dataSource.getConnection();
			String qry = BASE_DOCUMENT_SQL + " AND soft_delete_status_id_fk = 1  ";

			if ("C".equalsIgnoreCase(searchType)) {
				qry = qry + " AND LOWER(folder.level_description) LIKE  '%correspond%'";
			} else if ("D".equalsIgnoreCase(searchType)) {
				qry = qry + " AND LOWER(folder.level_description) LIKE  '%drawings%'";
			} else {
				qry = qry + " AND LOWER(folder.level_description) NOT LIKE  '%drawings%' AND LOWER(folder.level_description) NOT LIKE  '%correspond%'";
			}
			if (StringUtils.hasText(obj.getStructure_type_fk()) && !"0".equalsIgnoreCase(obj.getStructure_type_fk())) {
				qry = qry + " AND structure_type_fk = " + obj.getStructure_type_fk();
			}
			if (StringUtils.hasText(obj.getDocument_type_fk()) && !"0".equalsIgnoreCase(obj.getDocument_type_fk())) {
				qry = qry + " AND document_type_fk = " + obj.getDocument_type_fk();
			}
			if (StringUtils.hasText(obj.getTags_fk()) && !"0".equalsIgnoreCase(obj.getTags_fk())
					&& !"null".equalsIgnoreCase(obj.getTags_fk())) {
				qry = qry + " AND tags_fk like '%" + obj.getTags_fk() + "%' ";
			}
			if (StringUtils.hasText(obj.getL1_folder_id_fk()) && !"0".equalsIgnoreCase(obj.getL1_folder_id_fk())) {
				qry = qry + " AND L1_folder_id_fk in ( " + obj.getL1_folder_id_fk() +") ";
			}
			if (StringUtils.hasText(obj.getL2_folder_id_fk()) && !"0".equalsIgnoreCase(obj.getL2_folder_id_fk())) {
				qry = qry + " AND L2_folder_id_fk in ( " + obj.getL2_folder_id_fk()+") ";
			}
			if (StringUtils.hasText(obj.getL3_folder_id_fk()) && !"0".equalsIgnoreCase(obj.getL3_folder_id_fk())) {
				qry = qry + " AND L3_folder_id_fk in ( " + obj.getL3_folder_id_fk()+") ";
			}
			qry = qry + " order by document.modified_date desc ";

			stmt = con.prepareStatement(qry);

			rs = stmt.executeQuery();
			while (rs.next()) {
				documentList.add(getDocumentUpload(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}

		try {
			con = dataSource.getConnection();
			for (DocumentUpload dataObj : documentList) {
				if (dataObj != null) {
					dataObj.setL1_folder_id_val(getLevelDescription(dataObj.getL1_folder_id_fk(), con));
					dataObj.setL2_folder_id_val(getLevelDescription(dataObj.getL2_folder_id_fk(), con));
					dataObj.setL3_folder_id_val(getLevelDescription(dataObj.getL3_folder_id_fk(), con));
					dataObj.setL4_folder_id_val(getLevelDescription(dataObj.getL4_folder_id_fk(), con));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, null, null);
		}

		return documentList;
	}

	public List<DocumentUpload> getCorrespondenceRecursiveDocList(String docId, String userId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		List<Folder> level1Folders = getParentFolders(userId);
		List<DocumentUpload> documentList = new ArrayList<DocumentUpload>();
		try {
			con = dataSource.getConnection();

			String refl1DocIds = getCorrespondanceDocIds(con, docId);
			if (!StringUtils.hasText(refl1DocIds)) {
				return documentList;
			}

			StringBuffer allDocIds = new StringBuffer(refl1DocIds);
			String refl2DocIds = getReferenceDocIds(con, allDocIds, refl1DocIds);
			String refl3DocIds = getReferenceDocIds(con, allDocIds, refl2DocIds);
			String refl4DocIds = getReferenceDocIds(con, allDocIds, refl3DocIds);
			getReferenceDocIds(con, allDocIds, refl4DocIds);

			String qry = BASE_DOCUMENT_SQL;
			qry += " AND soft_delete_status_id_fk = 1 AND document_id in ('" + getQryStrings(allDocIds.toString()) + "') AND document_id NOT IN ('"
					+ docId + "')";
			qry += "  order by document.modified_date desc  ";
			stmt = con.prepareStatement(qry);

			rs = stmt.executeQuery();
			while (rs.next()) {
				documentList.add(getDocumentUpload(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}

		try {
			con = dataSource.getConnection();
			for (DocumentUpload dataObj : documentList) {
				if (dataObj != null) {
					dataObj.setL1_folder_id_val(getLevelDescription(dataObj.getL1_folder_id_fk(), con));
					dataObj.setL2_folder_id_val(getLevelDescription(dataObj.getL2_folder_id_fk(), con));
					dataObj.setL3_folder_id_val(getLevelDescription(dataObj.getL3_folder_id_fk(), con));
					dataObj.setL4_folder_id_val(getLevelDescription(dataObj.getL4_folder_id_fk(), con));

					dataObj.setL1Folder(level1Folders);
					dataObj.setL2Folder(getRefFolderGroup(con, dataObj.getL2_folder_id_fk()));
					dataObj.setL3Folder(getRefFolderGroup(con, dataObj.getL3_folder_id_fk()));
					dataObj.setL4Folder(getRefFolderGroup(con, dataObj.getL4_folder_id_fk()));

					if (!StringUtils.hasText(dataObj.getL2_folder_id_fk())) {
						dataObj.setRefDocumentList(getDocumentList(dataObj.getL1_folder_id_fk(), "1"));
					} else if (!StringUtils.hasText(dataObj.getL3_folder_id_fk())) {
						dataObj.setRefDocumentList(getDocumentList(dataObj.getL2_folder_id_fk(), "2"));
					} else if (!StringUtils.hasText(dataObj.getL4_folder_id_fk())) {
						dataObj.setRefDocumentList(getDocumentList(dataObj.getL3_folder_id_fk(), "3"));
					} else {
						dataObj.setRefDocumentList(getDocumentList(dataObj.getL4_folder_id_fk(), "4"));
					}

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, null, null);
		}

		return documentList;
	}

	private String getReferenceDocIds(Connection con, StringBuffer allDocIds, String refDocIds) throws Exception {
		String reflDocIds = null;
		if (StringUtils.hasText(refDocIds)) {
			reflDocIds = getCorrespondanceDocIds(con, refDocIds);
			if (StringUtils.hasText(reflDocIds)) {
				allDocIds.append(",");
				allDocIds.append(reflDocIds);
			}
		}
		return reflDocIds;
	}

	private String getCorrespondanceDocIds(Connection con, String refDocIds) throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String rDocIds = null;

		try {

			String qry = "SELECT GROUP_CONCAT(reference_no) as reference_val FROM document "
					+ "where reference_no is not null AND reference_no != '' AND document_id in ('"
					+ getQryStrings(refDocIds) + "') ";
			stmt = con.prepareStatement(qry);

			rs = stmt.executeQuery();
			if (rs.next()) {
				rDocIds = rs.getString("reference_val");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(null, stmt, rs);
		}
		return rDocIds;
	}

	private String getQryStrings(String refDocIds) {
		ArrayList<String> corresDocIds = new ArrayList<String>();
		if (StringUtils.hasText(refDocIds)) {
			String[] tempRefNo = refDocIds.split(",");
			for (String tempRefDoc : tempRefNo) {
				if (StringUtils.hasText(tempRefDoc)) {
					corresDocIds.add(tempRefDoc);
				}
			}
		}
		String docIds = corresDocIds.stream().collect(Collectors.joining("','"));
		return docIds;
	}

	public List<Folder> getLevel2Folders(int folderId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Folder> foldersList = new ArrayList<Folder>();
		try {
			con = dataSource.getConnection();

			String qry = " SELECT * FROM folder where parent_level_id in (select level_id from folder "
					+ "where parent_level_id in (select level_id from folder where folder_id = " + folderId + ")) ";
			qry += " order by parent_level_id ";

			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			while (rs.next()) {
				foldersList.add(convertToFolder(rs));
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return foldersList;
	}
	
	public List<Folder> getMultiSearchFoldersForLevel(String level) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Folder> foldersList = new ArrayList<Folder>();
		try {
			con = dataSource.getConnection();
			String qry = " SELECT  group_concat(folder_id) as folder_id, level_description from folder where level = '"
					+ level + "' and status_id_fk=1  group  by level_description order by level_description ";
			stmt = con.prepareStatement(qry);

			rs = stmt.executeQuery();
			while (rs.next()) {
				Folder folder = new Folder();
				folder.setFolderId(rs.getString("folder_id"));
				folder.setLevelDescription(rs.getString("level_description"));
				foldersList.add(folder);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return foldersList;
	}
	
	public List<Folder> getMultiSearchLevel2Folders(int folderId) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Folder> foldersList = new ArrayList<Folder>();
		try {
			con = dataSource.getConnection();

			String qry = " SELECT group_concat(folder_id) as folder_id, level_description FROM folder where parent_level_id in (select level_id from folder "
					+ "where parent_level_id in (select level_id from folder where folder_id = " + folderId + ")) ";
			qry += "  group  by level_description order by parent_level_id ";

			stmt = con.prepareStatement(qry);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Folder folder = new Folder();
				folder.setFolderId(rs.getString("folder_id"));
				folder.setLevelDescription(rs.getString("level_description"));
				foldersList.add(folder);
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			DBConnectionHandler.closeJDBCResoucrs(con, stmt, rs);
		}
		return foldersList;
	}

	

}

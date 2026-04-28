package com.synergizglobal.kecdcs.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.synergizglobal.kecdcs.common.AmazonS3Utils;
import com.synergizglobal.kecdcs.common.EMailSender;
import com.synergizglobal.kecdcs.common.PrintFileService;
import com.synergizglobal.kecdcs.constants.PageConstants;
import com.synergizglobal.kecdcs.model.Document;
import com.synergizglobal.kecdcs.model.DocumentSearch;
import com.synergizglobal.kecdcs.model.DocumentUpload;
import com.synergizglobal.kecdcs.model.Folder;
import com.synergizglobal.kecdcs.model.MailDetails;
import com.synergizglobal.kecdcs.model.User;
import com.synergizglobal.kecdcs.model.UserAccess;
import com.synergizglobal.kecdcs.service.DocumentUploadService;
import com.synergizglobal.kecdcs.service.UserService;

@Controller
public class DocumentUploadController {
	Logger logger = Logger.getLogger(DocumentUploadController.class);

	@Value("${common.error.message}")
	public String commonError;

	@Value("${record.create.fail}")
	public String createFail;

	@Value("${record.create.success}")
	public String createSuccess;

	private static String awsTempRootFolder = "TempImages";

	@Autowired
	ApplicationSingleton appSingleton;

	@Autowired
	DocumentUploadService docUploadService;

	@Autowired
	UserService service;

	@RequestMapping(value = "/showEmailAttachment", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Document showEmailAttachment(@RequestParam("docId") String docId, @RequestParam("userId") String userId) {
		logger.info("showEmailAttachment() : Doc ID : " + docId);
		Document document = new Document();
		try {
			document.setDocumentUpload(docUploadService.getDocument(docId));
		} catch (Exception e) {
			logger.error("showEmailAttachment() : " + e.getMessage());
		}
		return document;
	}

	@RequestMapping(value = "/showShareDocument", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Document showShareDocument(@RequestParam("docId") String docId, @RequestParam("userId") String userId) {
		logger.info("showShareDocument() : Doc ID : " + docId);
		Document document = new Document();
		try {
			document.setDocumentUpload(docUploadService.getDocument(docId));
			document.setUsers(appSingleton.getUsers());
		} catch (Exception e) {
			logger.error("showShareDocument() : " + e.getMessage());
		}
		return document;
	}

	@RequestMapping(value = "/getFoldersForLevel", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Folder> getFoldersForLevel(@RequestParam("folderId") String folderId) {
		logger.info("getFoldersForLevel");
		List<Folder> folderList = null;
		try {
			folderList = docUploadService.getSubFoldersForFolderId(folderId);
		} catch (Exception e) {
			logger.error("getFoldersForLevel() : " + e.getMessage());
		}
		return folderList;
	}

	@RequestMapping(value = "/getRefParentFoldersForLevel", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Folder> getRefParentFoldersForLevel(@RequestParam("userId") String userId) {
		logger.info("getRefParentFoldersForLevel");
		List<Folder> folderList = null;
		try {
			folderList = docUploadService.getRefParentFoldersForLevel(userId);
		} catch (Exception e) {
			logger.error("getRefParentFoldersForLevel() : " + e.getMessage());
		}
		return folderList;
	}

	@RequestMapping(value = "/getRefDocumentsForLevel", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<DocumentUpload> getRefDocumentsForLevel(@RequestParam("folderId") String folderId,
			@RequestParam("levelId") int nxtLevelId, HttpServletRequest request, HttpSession session) {
		logger.info("getRefDocumentsForLevel");
		List<DocumentUpload> documentList = null;
		try {
			documentList = docUploadService.getDocumentList(folderId, String.valueOf(nxtLevelId - 1));
		} catch (Exception e) {
			logger.error("getRefDocumentsForLevel() : " + e.getMessage());
		}
		return documentList;
	}

	@RequestMapping(value = "/documentUpload", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView documentUpload(@ModelAttribute DocumentUpload docUpload, RedirectAttributes attributes,
			BindingResult result, @RequestParam("attachFile") MultipartFile attachFile, HttpSession session,
			HttpServletRequest request) {
		boolean flag = false;
		try {
			String userId = (String) session.getAttribute("USER_ID");

			docUpload.setUserName((String) request.getSession().getAttribute("USER_NAME"));
			docUpload.setUser_id_fk(userId);
			docUpload.setOwner_user_id_fk(userId);

			if (StringUtils.hasLength(docUpload.getDocId())) {
				docUpload.setDocument_id(Integer.parseInt(docUpload.getDocId()));
			}

			if (StringUtils.hasLength(docUpload.getDocument_name())) {
				docUpload.setDocument_name(docUpload.getDocument_name());
			}

			if (!attachFile.isEmpty() && StringUtils.hasLength(attachFile.getOriginalFilename())) {
				docUpload.setDocument_name(getFormattedFileName(attachFile.getOriginalFilename()));
				String destFolder = docUploadService.getBucketLocation(docUpload);
				if (StringUtils.hasLength(destFolder)) {
					AmazonS3Utils.getInstance().copyToS3BucketByStream(
							destFolder + SUFFIX + docUpload.getDocument_name(), attachFile,
							docUpload.getDocument_name());
				}
			}

			if (attachFile.isEmpty() && StringUtils.hasLength(attachFile.getOriginalFilename())) {
				request.setAttribute("error", "Please upload valid document to proceed");
			} else {
				if (docUpload.getDocument_id() > 0) {
					flag = docUploadService.updateDocumentUpload(docUpload);
				} else {
					flag = docUploadService.createDocumentUpload(docUpload);
				}

				if (flag) {
					request.setAttribute("success", "Document has been uploaded successfully");
				} else {
					request.setAttribute("error", "Document upload failed");
				}
			}
			
			if (StringUtils.hasText(docUpload.getAppFlow())
					&& "docSearch".toLowerCase().equalsIgnoreCase(docUpload.getAppFlow())) {
				String searchType = (String) session.getAttribute("DOC_SEARCH_TYPE");
				if (StringUtils.hasText(searchType)) {
					return returnDocumentSearchPage(session, searchType);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("documentUpload() : " + e.getMessage());
			request.setAttribute("error", commonError);
		}

		return returnFolderSearchPage(request, session);
	}

	@RequestMapping(value = "/newVersionDocumentUpload", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView newVersionDocumentUpload(@ModelAttribute DocumentUpload docUpload,
			RedirectAttributes attributes, BindingResult result, @RequestParam("attachFile") MultipartFile attachFile,
			HttpSession session, HttpServletRequest request) {
		logger.info("newVersionDocumentUpload() : Doc ID : " + docUpload.getDocId());

		try {
			uploadNewVersionDocument(docUpload, attachFile, session, request);

			if (StringUtils.hasText(docUpload.getAppFlow())
					&& "docSearch".toLowerCase().equalsIgnoreCase(docUpload.getAppFlow())) {
				String searchType = (String) session.getAttribute("DOC_SEARCH_TYPE");
				if (StringUtils.hasText(searchType)) {
					return returnDocumentSearchPage(session, searchType);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("newVersionDocumentUpload() : " + e.getMessage());
			request.setAttribute("error", commonError);
		}
		return returnFolderSearchPage(request, session);
	}

	private void uploadNewVersionDocument(DocumentUpload docUpload, MultipartFile attachFile, HttpSession session,
			HttpServletRequest request) throws Exception {
		String userId = (String) session.getAttribute("USER_ID");

		DocumentUpload existDocumentUpload = docUploadService.getDocument(String.valueOf(docUpload.getDocId()));
		existDocumentUpload.setUserName((String) request.getSession().getAttribute("USER_NAME"));
		existDocumentUpload.setUser_id_fk(userId);
		existDocumentUpload.setOwner_user_id_fk(userId);
		// existDocumentUpload.setTitle(docUpload.getTitle());
		existDocumentUpload.setDocument_name(getFormattedFileName(attachFile.getOriginalFilename()));
		existDocumentUpload.setVersion_number(docUpload.getVersion_number());

		boolean flag = docUploadService.createNewVersionDocumentUpload(existDocumentUpload);

		if (!attachFile.isEmpty() && StringUtils.hasLength(attachFile.getOriginalFilename())) {
			String destFolder = docUploadService.getBucketLocation(existDocumentUpload);
			if (StringUtils.hasLength(destFolder)) {
				AmazonS3Utils.getInstance().copyToS3BucketByStream(
						destFolder + SUFFIX + existDocumentUpload.getDocument_name(), attachFile,
						existDocumentUpload.getDocument_name());
			}
		}

		if (flag) {
			request.setAttribute("success", "Document has been uploaded successfully");
		} else {
			request.setAttribute("error", "Document upload failed");
		}
	}

	@RequestMapping(value = "/documentBulkUpload", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView documentBulkUpload(@ModelAttribute DocumentUpload docUpload, RedirectAttributes attributes,
			BindingResult result, HttpSession session, HttpServletRequest request) {
		try {
			boolean flag = false;
			String userId = (String) request.getSession().getAttribute("USER_ID");
			ArrayList<DocumentUpload> documentUploads = populateDocuments(docUpload, session);
			for (DocumentUpload upload : documentUploads) {
				upload.setUserName((String) request.getSession().getAttribute("USER_NAME"));
				upload.setUser_id_fk(userId);
				upload.setOwner_user_id_fk(userId);

				Random rnd = new Random();
				upload.setDocument_no(String.valueOf(1000000 + rnd.nextInt(9000000)));

				flag = docUploadService.createDocumentUpload(upload);
				if (flag) {
					String srcKey = awsTempRootFolder + SUFFIX + userId + SUFFIX + upload.getDocument_name();
					String curFolder = docUploadService.getBucketLocation(upload);
					if (StringUtils.hasLength(curFolder)) {
						AmazonS3Utils.getInstance().copyWithinS3Bucket(srcKey,
								curFolder + SUFFIX + upload.getDocument_name());
					}
				}
			}
			session.removeAttribute("bulkUploadDocs");
			if (flag) {
				request.setAttribute("success", "Documents has been uploaded successfully");
			} else {
				request.setAttribute("error", "Documents upload failed");
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("documentBulkUpload() : " + e.getMessage());
			request.setAttribute("error", commonError);
		}
		return returnFolderSearchPage(request, session);

	}

	@RequestMapping(value = "/showDocument", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Document showDocument(@RequestParam("docId") String docId, @RequestParam("userId") String userId) {
		logger.info("showDocument() : Doc ID : " + docId);
		Document document = new Document();
		try {
			document.setParentFolders(docUploadService.getAllFolder());
			document.setUsers(appSingleton.getUsers());
			document.setDocumentUpload(docUploadService.getDocument(docId));
		} catch (Exception e) {
			logger.error("showDocument() : " + e.getMessage());
		}
		return document;

	}

	@RequestMapping(value = "/showUploadDocument", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Document showUploadDocument(@RequestParam("userId") String userId) {
		logger.info("showUploadDocument() ");
		Document document = new Document();
		try {
			document.setUsers(appSingleton.getUsers());
			document.setParentFolders(getFolders(userId));
			document.setDocumentUpload(new DocumentUpload());
		} catch (Exception e) {
			logger.error("showUploadDocument() : " + e.getMessage());
		}
		return document;
	}

	@RequestMapping(value = "/showRenameDocument", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Document showRenameDocument(@RequestParam("docId") String docId, @RequestParam("userId") String userId) {
		logger.info("showRenameDocument() : Doc ID : " + docId);
		Document document = new Document();
		try {
			document.setDocumentUpload(docUploadService.getDocument(docId));
		} catch (Exception e) {
			logger.error("showRenameDocument() : " + e.getMessage());
		}
		return document;
	}

	@RequestMapping(value = "/showMoveDocument", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Document showMoveDocument(@RequestParam("docId") String docId, @RequestParam("userId") String userId) {
		logger.info("showMoveDocument() : Doc ID : " + docId);
		Document document = new Document();
		try {
			document.setDocumentUpload(docUploadService.getDocument(docId));
			document.setParentFolders(getFolders(userId));
		} catch (Exception e) {
			logger.error("showMoveDocument() : " + e.getMessage());
		}
		return document;
	}

	@RequestMapping(value = "/showDocumentVersions", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Document showDocumentVersions(@RequestParam("docId") String docId, @RequestParam("userId") String userId) {
		logger.info("showDocumentVersions() : Doc ID : " + docId);
		Document document = new Document();
		try {
			DocumentUpload documentUpload = docUploadService.getDocument(docId);
			document.setDocumentUpload(documentUpload);
			document.setUsers(appSingleton.getUsers());
			document.setVersionOrRevisions(docUploadService.getDocumentVersionList(documentUpload.getDocument_no()));
		} catch (Exception e) {
			logger.error("showDocumentVersions() : " + e.getMessage());
		}
		return document;
	}

	@RequestMapping(value = "/viewAttachment", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String viewAttachment(@RequestParam("docId") String docId) {
		logger.info("viewAttachment() : Doc ID : " + docId);
		try {
			DocumentUpload existDocumentUpload = docUploadService.getDocument(docId);
			String srcFolder = docUploadService.getBucketLocation(existDocumentUpload);
			return AmazonS3Utils.getInstance().getUrl(srcFolder + SUFFIX + existDocumentUpload.getDocument_name());
		} catch (Exception e) {
			logger.error("viewAttachment() : " + e.getMessage());
		}
		return "failed";
	}

	@RequestMapping(value = "/validateDocumentNo", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String validateDocumentNo(@RequestParam("docNo") String docNo) {
		logger.info("validateDocumentNo() : Doc No : " + docNo);
		String rtnValue = "failed";
		try {
			if (docUploadService.validateDocumentNo(docNo)) {
				rtnValue = "success";
			}
		} catch (Exception e) {
			logger.error("validateDocumentNo() : " + e.getMessage());
		}
		return rtnValue;
	}

	@RequestMapping(value = "/validateVersionNo", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String validateVersionNo(@RequestParam("docNo") String docNo, @RequestParam("versionNo") String versionNo) {
		logger.info("validateVersionNo() : Doc No : " + docNo);
		String rtnValue = "failed";
		try {
			if (docUploadService.validateVersionNo(docNo, versionNo)) {
				rtnValue = "success";
			}
		} catch (Exception e) {
			logger.error("validateVersionNo() : " + e.getMessage(), e);
		}
		return rtnValue;
	}

	@RequestMapping(value = "/printDocument", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String printDocument(@RequestParam("docId") String docId) {
		logger.info("printDocument() : Doc ID : " + docId);
		try {
			DocumentUpload documentUpload = docUploadService.getDocument(docId);
			String curFolder = getBucket(documentUpload);
			if (StringUtils.hasLength(curFolder)) {
				byte[] byteArray = AmazonS3Utils.getInstance().downLoadFromS3Bucket(
						curFolder + SUFFIX + documentUpload.getDocument_name(), documentUpload.getDocument_name());
				if (byteArray.length > 0) {
					new PrintFileService(byteArray);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("printDocument() : " + e.getMessage());
		}
		return "success";
	}

	@RequestMapping(value = "/doActiveOrInactive", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String doActiveOrInactive(@RequestParam("docId") String docId, @RequestParam("userId") String userId,
			@RequestParam("reqStatus") int reqStatus) {
		logger.info("doActiveOrInactive() : Doc ID : " + docId);
		try {
			docUploadService.doActiveOrDeactiveDocuments(docId, reqStatus, userId);
		} catch (Exception e) {
			logger.error("doActiveOrInactive() : " + e.getMessage());
		}
		return "success";
	}

	@RequestMapping(value = "/getDocumentName", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String getDocumentName(@RequestParam("docId") String docId) {
		logger.info("getDocumentName() : Doc ID : " + docId);
		try {
			DocumentUpload existDocumentUpload = docUploadService.getDocument(docId);
			return existDocumentUpload.getDocument_name();
		} catch (Exception e) {
			logger.error("getDocumentName() : " + e.getMessage());
		}
		return "";
	}

	@RequestMapping(value = "/moveDocument", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView moveDocument(@ModelAttribute DocumentUpload docUpload, RedirectAttributes attributes,
			BindingResult result, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		logger.info("moveDocument() : Doc ID : " + docUpload.getDocId());

		try {
			processDocumentMove(docUpload, request);
		} catch (Exception e) {
			logger.error("moveDocument() : " + e.getMessage());
			request.setAttribute("error", commonError);
		}

		if (StringUtils.hasText(docUpload.getAppFlow())
				&& "docSearch".toLowerCase().equalsIgnoreCase(docUpload.getAppFlow())) {
			String searchType = (String) session.getAttribute("DOC_SEARCH_TYPE");
			if (StringUtils.hasText(searchType)) {
				return returnDocumentSearchPage(session, searchType);
			}
		}
		return returnFolderSearchPage(request, session);
	}

	private void processDocumentMove(DocumentUpload docUpload, HttpServletRequest request) throws Exception {
		if (StringUtils.hasText(docUpload.getDocId())) {
			docUpload.setDocument_id(Integer.parseInt(docUpload.getDocId()));
		}

		DocumentUpload existDocumentUpload = docUploadService.getDocument(String.valueOf(docUpload.getDocument_id()));
		String srcFolder = docUploadService.getBucketLocation(existDocumentUpload);

		String destFolder = docUploadService.getBucketLocation(docUpload);
		docUpload.setUserName((String) request.getSession().getAttribute("USER_NAME"));
		boolean flag = docUploadService.updateDocumentLevel(docUpload);

		if (flag && StringUtils.hasLength(srcFolder) && StringUtils.hasLength(destFolder)) {
			if (AmazonS3Utils.getInstance().isFileAvailable(srcFolder,
					srcFolder + SUFFIX + existDocumentUpload.getDocument_name())) {
				AmazonS3Utils.getInstance().copyWithinS3Bucket(
						srcFolder + SUFFIX + existDocumentUpload.getDocument_name(),
						destFolder + SUFFIX + existDocumentUpload.getDocument_name());
				AmazonS3Utils.getInstance().deleteFromS3Bucket(srcFolder,
						srcFolder + SUFFIX + existDocumentUpload.getDocument_name());
			} else {
				logger.info("moveDocument() : Document not available in " + srcFolder);
			}
		}

		if (flag) {
			request.setAttribute("success", "Document has been moved successfully");
		} else {
			request.setAttribute("error", "Document move failed");
		}
	}

	@RequestMapping(value = "/renameDocument", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView renameDocument(@ModelAttribute DocumentUpload docUpload, RedirectAttributes attributes,
			BindingResult result, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		logger.info("renameDocument() : Doc ID : " + docUpload.getDocId());
		try {
			if (StringUtils.hasText(docUpload.getDocId())) {
				docUpload.setDocument_id(Integer.parseInt(docUpload.getDocId()));
			}
			docUpload.setUserName((String) request.getSession().getAttribute("USER_NAME"));
			boolean flag = docUploadService.renameDocument(docUpload);

			if (flag) {
				request.setAttribute("success", "Document has been renamed successfully");
			} else {
				request.setAttribute("error", "Document rename failed");
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("renameDocument() : " + e.getMessage());
			request.setAttribute("error", commonError);
		}

		return returnFolderSearchPage(request, session);
	}

	@RequestMapping(value = "/shareDocument", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView shareDocument(@ModelAttribute DocumentUpload docUpload, RedirectAttributes attributes,
			BindingResult result, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		logger.info("shareDocument() : Doc ID : " + docUpload.getDocId());
		try {
			if (StringUtils.hasText(docUpload.getDocId())) {
				docUpload.setDocument_id(Integer.parseInt(docUpload.getDocId()));
			}
			User user = service.getUser(docUpload.getUser_id_fk());
			docUpload.setUserName((String) user.getUserName());
			boolean flag = docUploadService.shareDocument(docUpload);
			if (flag) {
				request.setAttribute("success", "Document has been shared successfully");
			} else {
				request.setAttribute("error", "Document share failed");
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("shareDocument() : " + e.getMessage());
			request.setAttribute("error", commonError);
		}
		return returnFolderSearchPage(request, session);
	}

	@RequestMapping(value = "/deleteDocument", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteDocument(@RequestParam("docId") String docId, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("deleteDocument() : Doc ID : " + docId);
		processDelete(docId, request, false);
		return returnFolderSearchPage(request, session);
	}

	@RequestMapping(value = "/deleteDocumentFromSearch", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteDocumentFromSearch(@RequestParam("docId") String docId, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("deleteDocumentFromSearch() : Doc ID : " + docId);

		processDelete(docId, request, false);
		String searchType = (String) session.getAttribute("DOC_SEARCH_TYPE");
		if (StringUtils.hasText(searchType)) {
			return returnDocumentSearchPage(session, searchType);
		}

		ModelAndView model = new ModelAndView();
		model.setViewName(PageConstants.documentSearch);
		return model;
	}

	private void processDelete(String docId, HttpServletRequest request, boolean isVersionDelete) {
		boolean flag = false;
		try {
			String tmpDocId = docId.replaceAll("'", "");
			DocumentUpload documentUpload = docUploadService.getDocument(tmpDocId);
			String destFolder = getBucket(documentUpload);
			String destLocKey = destFolder + SUFFIX + documentUpload.getDocument_name();
			if (StringUtils.hasLength(destLocKey)) {
				if (AmazonS3Utils.getInstance().isFileAvailable(destFolder, destLocKey)) {
					AmazonS3Utils.getInstance().deleteFromS3Bucket(destFolder, destLocKey);
				}
				if(isVersionDelete) {
					flag = docUploadService.deleteVersionDocument(docId);
				} else {
					flag = docUploadService.deleteDocument(docId);
				}
				if (flag) {
					request.setAttribute("success", "Document has been deleted successfully");
				} else {
					request.setAttribute("error", "Document deletion failed");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("processDelete() : " + e.getMessage());
			request.setAttribute("error", commonError);
		}
	}

	@RequestMapping(value = "/deleteVersionDocument", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteVersionDocument(@RequestParam("docId") String docId, @RequestParam("appFlow") String appFlow, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("deleteVersionDocument() : Doc ID : " + docId);
		processDelete(docId, request, true);
		
		if (StringUtils.hasText(appFlow)
				&& "docSearch".toLowerCase().equalsIgnoreCase(appFlow)) {
			String searchType = (String) session.getAttribute("DOC_SEARCH_TYPE");
			if (StringUtils.hasText(searchType)) {
				return returnDocumentSearchPage(session, searchType);
			}
		}
		return returnFolderSearchPage(request, session);
	}

	private ModelAndView returnFolderSearchPage(HttpServletRequest request, HttpSession session) {
		String folderId = (String) session.getAttribute("folderId");
		String levelId = (String) session.getAttribute("levelId");
		return getDocuments(folderId, levelId, request, session);
	}

	@RequestMapping(value = "/sendMail", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sendMail(@ModelAttribute MailDetails mailDetails, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("sendMail() : Doc ID : " + mailDetails.getDocId());
		processMail(mailDetails, request);
		return returnFolderSearchPage(request, session);
	}

	@RequestMapping(value = "/sendMailFromSearch", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sendMailFromSearch(@ModelAttribute MailDetails mailDetails, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("sendMailFromSearch() : Doc ID : " + mailDetails.getDocId());
		processMail(mailDetails, request);

		String searchType = (String) session.getAttribute("DOC_SEARCH_TYPE");
		if (StringUtils.hasText(searchType)) {
			return returnDocumentSearchPage(session, searchType);
		}

		ModelAndView model = new ModelAndView();
		model.setViewName(PageConstants.documentSearch);
		return model;
	}

	private ModelAndView returnDocumentSearchPage(HttpSession session, String searchType) {
		if ("D".equalsIgnoreCase(searchType)) {
			return getDrawingsDocumentSearch(session);
		} else if ("C".equalsIgnoreCase(searchType)) {
			return getCorresDocumentSearch(session);
		} else {
			return getDocuments(session);
		}
	}

	private void processMail(MailDetails mailDetails, HttpServletRequest request) {
		boolean flag = false;
		try {
			if (StringUtils.hasText(mailDetails.getDocId())) {
				mailDetails.setDocument_id(Integer.parseInt(mailDetails.getDocId()));
			}

			DocumentUpload documentUpload = docUploadService.getDocument(String.valueOf(mailDetails.getDocument_id()));
			String curFolder = getBucket(documentUpload);
			if (StringUtils.hasLength(curFolder)) {
				byte[] byteArray = AmazonS3Utils.getInstance().downLoadFromS3Bucket(
						curFolder + SUFFIX + documentUpload.getDocument_name(), documentUpload.getDocument_name());
				if (byteArray.length > 0) {
					EMailSender.getInstance().sendMail(mailDetails, documentUpload, byteArray);
					logger.info("sendMail() : Document Found");
					flag = true;
				} else {
					logger.info("sendMail() : Document not available");
				}
			}
		} catch (Exception e) {
			logger.error("sendMail() : " + e.getMessage());
		}
		if (flag) {
			request.setAttribute("success", "E-Mail has been sent successfully");
		} else {
			request.setAttribute("error", "E-Mail send failed");
		}
	}

	@RequestMapping(value = "/downloadAttachment", method = { RequestMethod.GET, RequestMethod.POST })
	public void downloadAttachment(@RequestParam("docId") String docId, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("downloadAttachment() : Doc ID : " + docId);
		try {
			String tmpDocId = docId.replaceAll("'", "");
			DocumentUpload documentUpload = docUploadService.getDocument(tmpDocId);
			String curFolder = getBucket(documentUpload);
			if (StringUtils.hasLength(curFolder)) {
				byte[] byteArray = AmazonS3Utils.getInstance().downLoadFromS3Bucket(
						curFolder + SUFFIX + documentUpload.getDocument_name(), documentUpload.getDocument_name());
				if (byteArray.length > 0) {
					logger.info("downloadAttachment() : Document Found");
					String fileName = documentUpload.getDocument_name().toLowerCase();
					if (fileName.contains(".pdf")) {
						response.setContentType("application/pdf");
					} else if (fileName.contains(".doc") || fileName.contains(".docx")) {
						response.setContentType("application/msword");
					} else if (fileName.contains(".ppt") || fileName.contains(".pptx")) {
						response.setContentType("application/vnd.ms-powerpoint");
					} else if (fileName.contains(".xls") || fileName.contains(".xlsx")) {
						response.setContentType("application/vnd.ms-excel");
					} else if (fileName.contains(".txt")) {
						response.setContentType("application/text");
					}

					response.addHeader("Content-Disposition",
							"attachment; filename=" + documentUpload.getDocument_name());
					response.getOutputStream().write(byteArray);
					response.getOutputStream().flush();
				} else {
					logger.info("downloadAttachment() : Document not available");
				}
			}
		} catch (Exception e) {
			logger.error("downloadAttachment() : " + e.getMessage());
		}
	}

	@RequestMapping(value = "/fileUpload", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView fileUpload(MultipartHttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		ModelAndView model = new ModelAndView();
		try {
			String userId = (String) request.getSession().getAttribute("USER_ID");
			Map<String, MultipartFile> fileMap = request.getFileMap();

			for (MultipartFile multipartFile : fileMap.values()) {
				if (StringUtils.hasLength(multipartFile.getOriginalFilename())) {
					String fileName = getFormattedFileName(multipartFile.getOriginalFilename());
					String srcKey = awsTempRootFolder + SUFFIX + userId + SUFFIX + fileName;
					AmazonS3Utils.getInstance().copyToS3BucketByStream(srcKey, multipartFile, fileName);
					updateBulkUpload(session, fileName);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("fileUpload() : " + e.getMessage());
			model.addObject("error", commonError);
		}
		return model;
	}

	private ArrayList<DocumentUpload> populateDocuments(DocumentUpload docUpload, HttpSession session) {
		Map<String, String> bulkUploadDocs = (Map<String, String>) session.getAttribute("bulkUploadDocs");
		if (bulkUploadDocs == null) {
			return new ArrayList<DocumentUpload>();
		}

		ArrayList<DocumentUpload> uploads = new ArrayList<DocumentUpload>();
		for (String docName : bulkUploadDocs.values()) {
			DocumentUpload temp = new DocumentUpload();
			temp.setDocument_no("0");
			temp.setDocument_name(docName);
			temp.setTitle(getFileNameWithoutExtension(docName));
			temp.setVersion_number("1");
			temp.setL1_folder_id_fk(docUpload.getL1_folder_id_fk());
			temp.setL2_folder_id_fk(docUpload.getL2_folder_id_fk());
			temp.setL3_folder_id_fk(docUpload.getL3_folder_id_fk());
			temp.setL4_folder_id_fk(docUpload.getL4_folder_id_fk());
			temp.setSoft_delete_status_id_fk("1");
			temp.setOwner_user_id_fk(docUpload.getOwner_user_id_fk());
			uploads.add(temp);
		}
		return uploads;
	}

	private String getFileNameWithoutExtension(String fileName) {
		if (fileName.lastIndexOf("_") > 0)
			fileName = fileName.substring(0, fileName.lastIndexOf("_"));
		return fileName;
	}

	private static final String SUFFIX = "/";

	public String getBucket(DocumentUpload docUpload) {
		StringBuffer pathStr = new StringBuffer();
		if (StringUtils.hasLength(docUpload.getL1_folder_id_val())
				&& !"0".equalsIgnoreCase(docUpload.getL1_folder_id_val())) {
			pathStr.append(docUpload.getL1_folder_id_val());
		}
		if (StringUtils.hasLength(docUpload.getL2_folder_id_val())
				&& !"0".equalsIgnoreCase(docUpload.getL2_folder_id_val())) {
			pathStr.append(SUFFIX);
			pathStr.append(docUpload.getL2_folder_id_val());
		}
		if (StringUtils.hasLength(docUpload.getL3_folder_id_val())
				&& !"0".equalsIgnoreCase(docUpload.getL3_folder_id_val())) {
			pathStr.append(SUFFIX);
			pathStr.append(docUpload.getL3_folder_id_val());
		}
		if (StringUtils.hasLength(docUpload.getL4_folder_id_val())
				&& !"0".equalsIgnoreCase(docUpload.getL4_folder_id_val())) {
			pathStr.append(SUFFIX);
			pathStr.append(docUpload.getL4_folder_id_val());
		}
		return pathStr.toString();
	}

	@RequestMapping(value = "/documents", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getDocuments(@RequestParam("folderId") String folderId, @RequestParam("levelId") String levelId,
			HttpServletRequest request, HttpSession session) {
		ModelAndView model = new ModelAndView();
		return processGetDocuments(folderId, levelId, request, session, model);
	}

	private ModelAndView processGetDocuments(String folderId, String levelId, HttpServletRequest request,
			HttpSession session, ModelAndView model) {
		updateNavigation(folderId, levelId, session, model);
		session.removeAttribute("bulkUploadDocs");
		try {
			model.addObject("DOC_SEARCH_TYPE", "F");
			String userId = (String) session.getAttribute("USER_ID");
			String userName = (String) session.getAttribute("USER_NAME");
			String tmpFfolderId = folderId.replaceAll("'", "");
			if (tmpFfolderId.equalsIgnoreCase("0")) {
				model.addObject("LevelFolders", getFolders(userId));
			} else {
				List<DocumentUpload> documentList = docUploadService.getDocumentList(tmpFfolderId, levelId);
				String level1Val = updateUserAccessDetails(session, documentList);
				model.addObject("l1_folder_id_val", level1Val);
				model.addObject("LevelDocuments", documentList);
				model.addObject("LevelFolders", docUploadService.getSubFoldersForFolderId(tmpFfolderId));
			}

			String successMsg = (String) request.getAttribute("success");
			String failMsg = (String) request.getAttribute("fail");
			if (StringUtils.hasText(successMsg)) {
				model.addObject("success", successMsg);
			}
			if (StringUtils.hasText(failMsg)) {
				model.addObject("fail", failMsg);
			}

			populateDefaultModelValues(levelId, session, model, tmpFfolderId);
			session.setAttribute("DOC_SEARCH_TYPE", "F");
			model.addObject("DOC_SEARCH_TYPE", "F");
		} catch (Exception e) {
			logger.error("processGetDocuments() ", e);
		}
		return model;
	}

	private String updateUserAccessDetails(HttpSession session, List<DocumentUpload> documentList) {
		String level1Val = null;
		Map<String, UserAccess> userAccessMap = (Map<String, UserAccess>) session.getAttribute("USER_ACCESS");
		UserAccess userAccess = null;
		for (DocumentUpload doc : documentList) {
			userAccess = userAccessMap.getOrDefault(doc.getL1_folder_id_fk(), new UserAccess());
			if (userAccess.isDelete()) {
				doc.setFlAllowDelete("Y");
			}
			if (userAccess.isEdit()) {
				doc.setFlAllowEdit("Y");
			}
			if (userAccess.isView()) {
				doc.setFlAllowView("Y");
			}
			if (userAccess.isUpload()) {
				doc.setFlAllowUpload("Y");
			}
			if (userAccess.isBulkUpload()) {
				doc.setFlAllowBulkUpload("Y");
			}
			if (userAccess.isBulkDownload()) {
				doc.setFlAllowDownload("Y");
			}
			userAccess = null;

			if (StringUtils.hasText(doc.getRootParentLevel())) {
				level1Val = doc.getRootParentLevel().toLowerCase();
			}
		}
		return level1Val;
	}

	private void populateDefaultModelValues(String levelId, HttpSession session, ModelAndView model,
			String tmpFfolderId) throws Exception {
		Map<String, Folder> breadCrumbMenu = docUploadService.getFolderLevelForBreadCrumb(tmpFfolderId);
		StringBuffer breadCrumbStr = new StringBuffer();
		for (String key : breadCrumbMenu.keySet()) {
			Folder folder = breadCrumbMenu.get(key);
			if (StringUtils.hasText(breadCrumbStr)) {
				breadCrumbStr.append("&nbsp;>&nbsp;");
			}
			breadCrumbStr.append(folder.getLevelId());
			breadCrumbStr.append("&nbsp;");
			breadCrumbStr.append(folder.getLevelDescription());
		}
		model.addObject("breadCrumbTxt", breadCrumbStr.toString());
		model.addObject("breadCrumbMenu", breadCrumbMenu);
		model.addObject("folderId", tmpFfolderId);
		model.addObject("levelId", levelId);
		model.addObject("revisionType", appSingleton.getRevisionType());
		model.addObject("documentType", appSingleton.getDcoumentType());
		model.addObject("tagsType", appSingleton.getTags());
		model.addObject("structureType", appSingleton.getStructureType());
		model.setViewName(PageConstants.documents);

		String isAllowUpload = "N";
		String isAllowBulkUpload = "N";
		Map<String, UserAccess> userAccessMap = (Map<String, UserAccess>) session.getAttribute("USER_ACCESS");
		if (!CollectionUtils.isEmpty(userAccessMap)) {
			UserAccess userAccess = userAccessMap.getOrDefault(getCurrentRootFolderFromSession(session),
					new UserAccess());
			if (userAccess != null) {
				if (userAccess.isUpload()) {
					isAllowUpload = "Y";
				}
				if (userAccess.isBulkUpload()) {
					isAllowBulkUpload = "Y";
				}
			}
		}
		model.addObject("isAllowUpload", isAllowUpload);
		model.addObject("isAllowBulkUpload", isAllowBulkUpload);

		session.setAttribute("folderId", tmpFfolderId);
		session.setAttribute("levelId", levelId);
	}

	private void updateNavigation(String folderId, String levelId, HttpSession session, ModelAndView model) {
		Map<String, String> navigationMap = (Map<String, String>) session.getAttribute("navigationMap");
		if (navigationMap == null) {
			navigationMap = new HashMap<String, String>();
		}
		if ("1".equalsIgnoreCase(levelId)) {
			navigationMap.put("l1_folder_id_fk", folderId);
			navigationMap.remove("l2_folder_id_fk");
			navigationMap.remove("l3_folder_id_fk");
			navigationMap.remove("l4_folder_id_fk");
		} else if ("2".equalsIgnoreCase(levelId)) {
			navigationMap.put("l2_folder_id_fk", folderId);
			navigationMap.remove("l3_folder_id_fk");
			navigationMap.remove("l4_folder_id_fk");
		} else if ("3".equalsIgnoreCase(levelId)) {
			navigationMap.remove("l4_folder_id_fk");
			navigationMap.put("l3_folder_id_fk", folderId);
		} else if ("4".equalsIgnoreCase(levelId)) {
			navigationMap.put("l4_folder_id_fk", folderId);
		}
		model.addObject("l1_folder_id_fk", navigationMap.getOrDefault("l1_folder_id_fk", "0"));
		model.addObject("l2_folder_id_fk", navigationMap.getOrDefault("l2_folder_id_fk", "0"));
		model.addObject("l3_folder_id_fk", navigationMap.getOrDefault("l3_folder_id_fk", "0"));
		model.addObject("l4_folder_id_fk", navigationMap.getOrDefault("l4_folder_id_fk", "0"));
		session.setAttribute("navigationMap", navigationMap);
	}

	private String getCurrentRootFolderFromSession(HttpSession session) {
		Map<String, String> navigationMap = (Map<String, String>) session.getAttribute("navigationMap");
		if (!CollectionUtils.isEmpty(navigationMap)) {
			return navigationMap.getOrDefault("l1_folder_id_fk", "0");
		}
		return "0";
	}

	private void updateBulkUpload(HttpSession session, String fileName) {
		Map<String, String> bulkUploadDocs = (Map<String, String>) session.getAttribute("bulkUploadDocs");
		if (bulkUploadDocs == null) {
			bulkUploadDocs = new HashMap<String, String>();
		}
		bulkUploadDocs.put(fileName, fileName);
		session.setAttribute("bulkUploadDocs", bulkUploadDocs);
	}

	@RequestMapping(value = "/getDocumentVersionList", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<DocumentUpload> getDocumentVersionList(@RequestParam("docNo") String docNo, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		List<DocumentUpload> documentList = null;
		try {
			documentList = docUploadService.getDocumentVersionList(docNo);
		} catch (Exception e) {
			logger.error("getDocumentVersionList() : " + e.getMessage());
		}
		return documentList;
	}

	@RequestMapping(value = "/getCorrespondenceDocumentList", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Document getCorrespondenceDocumentList(@RequestParam("docId") String docId,
			@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		Document document = new Document();
		try {
			document.setVersionOrRevisions(docUploadService.getCorrespondenceDocumentList(docId, userId));
			document.setParentFolders(docUploadService.getAllFolder());
		} catch (Exception e) {
			logger.error("getDocumentRevisionsList() : " + e.getMessage());
		}
		return document;
	}

	@RequestMapping(value = "/getCorrespondenceTracks", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Document getCorrespondenceTracks(@RequestParam("docId") String docId, @RequestParam("userId") String userId,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Document document = new Document();
		try {
			document.setVersionOrRevisions(docUploadService.getCorrespondenceRecursiveDocList(docId, userId));
			document.setParentFolders(docUploadService.getAllFolder());
		} catch (Exception e) {
			logger.error("getDocumentRevisionsList() : " + e.getMessage());
		}
		return document;
	}

	@RequestMapping(value = "/documentHome", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView documentHome(HttpServletRequest request, HttpSession session) {
		ModelAndView model = new ModelAndView();
		String userId = null;
		String userName = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			model.addObject("folderId", 0);
			model.addObject("DOC_SEARCH_TYPE", "A");
			model.setViewName(PageConstants.documents);
		} catch (Exception e) {
			logger.error("users() : User Id - " + userId + " - User Name - " + userName + " - " + e.getMessage());
		}
		return model;
	}

	@RequestMapping(value = "/documentSearch", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getDocuments(HttpSession session) {
		ModelAndView model = new ModelAndView();
		try {
			session.setAttribute("DOC_SEARCH_TYPE", "A");
			model.addObject("DOC_SEARCH_TYPE", "A");

			String userId = (String) session.getAttribute("USER_ID");
			List<Folder> folders = getFolders(userId);
			model.addObject("Level1Ids", folders);
			model.addObject("Level2Ids", docUploadService.getMultiSearchFoldersForLevel("2"));
			model.addObject("revisionType", appSingleton.getRevisionType());
			model.addObject("documentType", appSingleton.getDcoumentType());
			model.addObject("tagsType", appSingleton.getTags());
			model.addObject("structureType", appSingleton.getStructureType());
			model.setViewName(PageConstants.documentSearch);
		} catch (Exception e) {
			logger.error("documentSearch() : " + e.getMessage(), e);
		}
		return model;
	}

	@RequestMapping(value = "/gotoDocumentFolder", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView gotoDocumentFolder(@RequestParam("l1_folder_id") String l1_folder_id,
			@RequestParam("l2_folder_id") String l2_folder_id, @RequestParam("l3_folder_id") String l3_folder_id,
			@RequestParam("l4_folder_id") String l4_folder_id, @RequestParam("folderId") String folderId,
			@RequestParam("levelId") String levelId, HttpServletRequest request, HttpSession session) {
		ModelAndView model = new ModelAndView();
		updateNavigation(l1_folder_id, "1", session, model);
		updateNavigation(l2_folder_id, "2", session, model);
		updateNavigation(l3_folder_id, "3", session, model);
		updateNavigation(l4_folder_id, "4", session, model);
		processGetDocuments(folderId, levelId, request, session, model);
		model.setViewName(PageConstants.documents);
		return model;
	}

	@RequestMapping(value = "/getDocumentList", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public DocumentSearch getDocumentList(HttpSession session) {
		DocumentSearch documentSearch = new DocumentSearch();
		try {
			documentSearch.setParentFolders(docUploadService.getAllFolder());
			documentSearch.setUsers(appSingleton.getUsers());
			documentSearch.setDocumentList(docUploadService.getDocumentList());
		} catch (Exception e) {
			logger.error("getDocumentList() : " + e.getMessage(), e);
		}
		return documentSearch;
	}

	@RequestMapping(value = "/getDocumentFolders", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Folder> getDocumentFolders(HttpSession session) {
		List<Folder> parentFolders = new ArrayList<Folder>();
		try {
			parentFolders = docUploadService.getAllFolder();
		} catch (Exception e) {
			logger.error("getDocumentFolders() : " + e.getMessage(), e);
		}
		return parentFolders;
	}

	@RequestMapping(value = "/corresDocumentSearch", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getCorresDocumentSearch(HttpSession session) {
		ModelAndView model = new ModelAndView();
		try {
			session.setAttribute("DOC_SEARCH_TYPE", "C");
			model.addObject("DOC_SEARCH_TYPE", "C");

			String userId = (String) session.getAttribute("USER_ID");
			List<Folder> folders = getFolders(userId);
			String tmpFfolderId = getCurrentSearchLevelId(folders, "Correspondance");
			model.addObject("curFolder", tmpFfolderId);
			model.addObject("Level1Ids", folders);
			model.addObject("revisionType", appSingleton.getRevisionType());
			model.addObject("documentType", appSingleton.getDocumentTypeWhichMappedWithCorres());
			model.addObject("tagsType", appSingleton.getTags());
			model.addObject("structureType", appSingleton.getStructureType());
			
			model.setViewName(PageConstants.documentSearch);
		} catch (Exception e) {
			logger.error("getCorresDocumentSearch() : " + e.getMessage(), e);
		}
		return model;
	}

	@RequestMapping(value = "/getLevel2Folders", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Folder> getLevel2Folders(@RequestParam("folderId") String folderId) {
		logger.info("getLevel2Folders");
		List<Folder> folderList = null;
		try {
			folderList = docUploadService.getMultiSearchLevel2Folders(Integer.parseInt(folderId));
		} catch (Exception e) {
			logger.error("getLevel2Folders() : " + e.getMessage());
		}
		return folderList;
	}

	@RequestMapping(value = "/drawingsDocumentSearch", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getDrawingsDocumentSearch(HttpSession session) {
		ModelAndView model = new ModelAndView();
		try {
			session.setAttribute("DOC_SEARCH_TYPE", "D");
			model.addObject("DOC_SEARCH_TYPE", "D");

			String userId = (String) session.getAttribute("USER_ID");
			List<Folder> folders = getFolders(userId);
			String tmpFfolderId = getCurrentSearchLevelId(folders, "Drawings");
			model.addObject("curFolder", tmpFfolderId);
			model.addObject("Level1Ids", folders);
			model.addObject("revisionType", appSingleton.getRevisionType());
			model.addObject("documentType", appSingleton.getDocumentTypeWhichMappedWithDrawings());
			model.addObject("tagsType", appSingleton.getTags());
			model.addObject("structureType", appSingleton.getStructureType());
			
			model.setViewName(PageConstants.documentSearch);
		} catch (Exception e) {
			logger.error("getDrawingsDocumentSearch() : " + e.getMessage(), e);
		}
		return model;
	}

	private List<Folder> getFolders(String userId) throws Exception {
		return docUploadService.getParentFolders(userId);
	}

	@RequestMapping(value = "/getAllDocumentSearchList", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public DocumentSearch getAllDocumentSearchList(@ModelAttribute DocumentUpload documentUpload,
			HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam("l1_folder_id_search") String l1_folder_id_search,
			@RequestParam("l2_folder_id_search") String l2_folder_id_search,
			@RequestParam("l3_folder_id_search") String l3_folder_id_search,
			@RequestParam("structure_type_search") String structure_type_search,
			@RequestParam("document_type_search_fk") String document_type_search_fk,
			@RequestParam("tags_search") String tags_search) throws IOException {

		DocumentSearch documentSearch = new DocumentSearch();
		List<DocumentUpload> totalDocList = null;
		try {
			documentUpload.setL1_folder_id_fk(l1_folder_id_search);
			documentUpload.setL2_folder_id_fk(l2_folder_id_search);
			documentUpload.setL3_folder_id_fk(l3_folder_id_search);
			documentUpload.setDocument_type_fk(document_type_search_fk);
			documentUpload.setStructure_type_fk(structure_type_search);
			documentUpload.setTags_fk(tags_search);

			String searchType = (String) session.getAttribute("DOC_SEARCH_TYPE");
			if (StringUtils.hasText(searchType)) {
				if ("D".equalsIgnoreCase(searchType)) {
					documentUpload.setFlDrawings("Y");
					totalDocList = docUploadService.getSearchDocumentList("D", documentUpload);
				} else if ("C".equalsIgnoreCase(searchType)) {
					documentUpload.setFlCorrespondences("Y");
					totalDocList = docUploadService.getSearchDocumentList("C", documentUpload);
				}
			}

			if (totalDocList == null) {
				totalDocList = docUploadService.getSearchDocumentList("A", documentUpload);
			}

			updateUserAccessDetails(session, totalDocList);
			documentSearch.setParentFolders(docUploadService.getAllFolder());
			documentSearch.setUsers(appSingleton.getUsers());
			documentSearch.setDocumentList(totalDocList);

		} catch (Exception e) {
			logger.error("getAllDocumentSearchList : " + e.getMessage(), e);
		}
		return documentSearch;
	}

	@RequestMapping(value = "/validateTypes", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String validateTypes(@RequestParam("typeValue") String typeValue,
			@RequestParam("typeTable") String typeTable) {
		logger.info("validateTypes() : " + typeTable + " : " + typeValue);
		String rtnValue = "failed";
		try {
			if (docUploadService.validateTypeValues(typeValue, typeTable)) {
				rtnValue = "success";
			}
		} catch (Exception e) {
			logger.error("validateTypes() : " + e.getMessage());
		}
		return rtnValue;
	}

	@RequestMapping(value = "/createTypeValues", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String createTypeValues(@RequestParam("typeValue") String typeValue,
			@RequestParam("typeTable") String typeTable) {
		logger.info("createTypeValues()  " + typeTable + " : " + typeValue);
		String rtnValue = "failed";
		try {
			int tagId = docUploadService.addCreateTypeValues(typeValue, typeTable);
			if (tagId > 0) {
				appSingleton.reloadTags();
				rtnValue = String.valueOf(tagId);
			}
		} catch (Exception e) {
			logger.error("createTypeValues() : " + e.getMessage());
		}
		return rtnValue;
	}

	@RequestMapping(value = "/getSearchFoldersForLevel", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Folder> getSearchFoldersForLevel(@RequestParam("folderId") String folderId,
			@RequestParam("level") String level, @RequestParam("rootFolder") String rootFolder) {
		logger.info("getSearchFoldersForLevel");
		List<Folder> folderList = new ArrayList<Folder>();
		try {
			if (StringUtils.hasText(folderId) && !"0".equalsIgnoreCase(folderId)) {
				folderList = docUploadService.getSubFoldersForFolderId(folderId);
			} else {
				if (StringUtils.hasText(rootFolder)) {
					folderList = docUploadService.getMultiSearchLevel2Folders(Integer.parseInt(rootFolder));
				} else {
					folderList = docUploadService.getMultiSearchFoldersForLevel("2");
				}

			}
		} catch (Exception e) {
			logger.error("getSearchFoldersForLevel() : " + e.getMessage());
		}
		return folderList;
	}

	@RequestMapping(value = "/getLevelFolders", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Folder> getLevelFolders(@RequestParam("level") String level) {
		logger.info("getLevelFolders");
		List<Folder> folderList = null;
		try {
			folderList = docUploadService.getFoldersForLevel(level);
		} catch (Exception e) {
			logger.error("getLevelFolders() : " + e.getMessage());
		}
		return folderList;
	}

	private String getCurrentSearchLevelId(List<Folder> folders, String searchFolderName) {
		for (Folder doc : folders) {
			if (doc.getLevelDescription().contains(searchFolderName)) {
				return doc.getFolderId();
			}
		}
		return null;
	}

	private String getFormattedFileName(String srFileNme) {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String ts = df.format(new Date());
		int index = srFileNme.lastIndexOf('.');
		if (index > 0) {
			String fileName = srFileNme.substring(0, srFileNme.lastIndexOf("."));
			String extension = srFileNme.substring(index + 1, srFileNme.length());
			return fileName + "_" + ts + "." + extension;
		}
		return srFileNme + "_" + ts;
	}

}

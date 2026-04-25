package com.synergizglobal.ircondcs.controller;

import org.springframework.stereotype.Controller;

@Controller
public class DocumentUploadControllerTemp {/*
	Logger logger = Logger.getLogger(DocumentUploadController.class);

	@Value("${common.error.message}")
	public String commonError;

	@Value("${record.create.fail}")
	public String createFail;

	@Value("${record.create.success}")
	public String createSuccess;

	@Value("${aws.temp.root.folder}")
	private static String awsTempRootFolder;

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
			document.setUsers(service.getUsersList(new User()));
		} catch (Exception e) {
			logger.error("showShareDocument() : " + e.getMessage());
		}
		return document;
	}

	@RequestMapping(value = "/newDocumentUpload", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView newDocumentUpload(@ModelAttribute DocumentUpload docUpload, RedirectAttributes attributes,
			HttpSession session) {
		ModelAndView model = new ModelAndView();
		try {
			String userId = (String) session.getAttribute("USER_ID");
			model.setViewName(PageConstants.newDocumentUpload);
			model.addObject("listOfLevels", docUploadService.getListOfLevels());
			model.addObject("Level1Ids", docUploadService.getFolderParentLevelIds(userId));
			model.addObject("usersList", service.getUsersList(new User()));
			model.addObject("documentUpload", new DocumentUpload());
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("newDocumentUpload() : " + e.getMessage());
			model.addObject("error", commonError);
		}
		return model;
	}

	@RequestMapping(value = "/getFoldersForLevel", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Folder> getFoldersForLevel(@RequestParam("folderId") String folderId) {
		logger.info("getFoldersForLevel");
		List<Folder> folderList = null;
		try {
			folderList = docUploadService.getFolderLevelForFolderId(Integer.parseInt(folderId));
		} catch (Exception e) {
			logger.error("getFoldersForLevel() : " + e.getMessage());
		}
		return folderList;
	}

	@RequestMapping(value = "/documentUpload", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView documentUpload(@ModelAttribute DocumentUpload docUpload, RedirectAttributes attributes,
			BindingResult result, @RequestParam("attachFile") MultipartFile attachFile, HttpSession session,
			HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		try {
			String userId = (String) session.getAttribute("USER_ID");

			docUpload.setUserName((String) request.getSession().getAttribute("USER_NAME"));
			docUpload.setUser_id_fk(userId);
			docUpload.setDocument_name(attachFile.getOriginalFilename());

			boolean flag = docUploadService.createDocumentUpload(docUpload);

			if (!attachFile.isEmpty() && StringUtils.hasLength(attachFile.getOriginalFilename())) {
				String destFolder = docUploadService.getBucketLocation(docUpload);
				if (StringUtils.hasLength(destFolder)) {
					AmazonS3Utils.getInstance().copyToS3Bucket(destFolder + SUFFIX + attachFile.getOriginalFilename(),
							attachFile, "");
				}
			}

			model.setViewName(PageConstants.newDocumentUpload);
			model.addObject("listOfLevels", docUploadService.getListOfLevels());
			model.addObject("Level1Ids", docUploadService.getFolderParentLevelIds(userId));
			model.addObject("usersList", service.getUsersList(new User()));
			model.addObject("documentUpload", new DocumentUpload());

			if (flag) {
				model.addObject("success", "Document has been uploaded successfully");
			} else {
				model.addObject("error", "Document upload failed");
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("documentUpload() : " + e.getMessage());
			model.addObject("error", commonError);
		}
		return model;
	}

	@RequestMapping(value = "/newVersionDocumentUpload", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView newVersionDocumentUpload(@ModelAttribute DocumentUpload docUpload, RedirectAttributes attributes,
			BindingResult result, @RequestParam("attachFile") MultipartFile attachFile, HttpSession session,
			HttpServletRequest request) {
		logger.info("newVersionDocumentUpload() : Doc ID : " + docUpload.getDocId());
		ModelAndView model = (ModelAndView) session.getAttribute("CURRENT_DOC_SEARCH");
		if (model == null) {
			model = new ModelAndView();
			model.setViewName(PageConstants.documents);
		}
		try {
			String userId = (String) session.getAttribute("USER_ID");

			DocumentUpload existDocumentUpload = docUploadService
					.getDocument(String.valueOf(docUpload.getDocId()));
			existDocumentUpload.setUserName((String) request.getSession().getAttribute("USER_NAME"));
			existDocumentUpload.setUser_id_fk(userId);
			existDocumentUpload.setDocument_name(attachFile.getOriginalFilename());
			existDocumentUpload.setVersion_number(docUpload.getVersion_number());

			boolean flag = docUploadService.createNewVersionDocumentUpload(existDocumentUpload);

			if (!attachFile.isEmpty() && StringUtils.hasLength(attachFile.getOriginalFilename())) {
				String destFolder = docUploadService.getBucketLocation(existDocumentUpload);
				if (StringUtils.hasLength(destFolder)) {
					AmazonS3Utils.getInstance().copyToS3Bucket(destFolder + SUFFIX + attachFile.getOriginalFilename(),
							attachFile,"");
				}
			}

			if (flag) {
				model.addObject("success", "Document has been uploaded successfully");
			} else {
				model.addObject("error", "Document upload failed");
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("newVersionDocumentUpload() : " + e.getMessage());
			model.addObject("error", commonError);
		}
		return model;
	}

	@RequestMapping(value = "/newBulkDocumentUpload", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView newBulkDocumentUpload(@ModelAttribute DocumentUpload docUpload, RedirectAttributes attributes,
			HttpSession session, HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		try {
			// String userId = (String) request.getSession().getAttribute("USER_ID");
			// deleteAllFilesS3TempFolder(userId);

			String userId = (String) session.getAttribute("USER_ID");

			model.setViewName(PageConstants.newBulkDocumentUpload);
			model.addObject("listOfLevels", docUploadService.getListOfLevels());
			model.addObject("Level1Ids", docUploadService.getFolderParentLevelIds(userId));
			model.addObject("documentUpload", new DocumentUpload());
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("newDocumentUpload() : " + e.getMessage());
			model.addObject("error", commonError);
		}
		return model;
	}
	
	private void readExcelSheet(MultipartFile multipartFile) {
		ArrayList<DocumentUpload> uploads = new ArrayList<DocumentUpload>();
		File file = AmazonS3Utils.getInstance().multipartToFile(multipartFile,"");
		FileInputStream fis;
		try {
			fis = new FileInputStream(file);
			XSSFWorkbook wb = new XSSFWorkbook(fis);
			XSSFSheet sheet = wb.getSheetAt(0);
			for (int j = 0; j < sheet.getLastRowNum() + 1; j++) {
				Row row = sheet.getRow(j);
				DocumentUpload temp = new DocumentUpload();
				temp.setDocument_no(getStringFromCell(row.getCell(0)));
				temp.setDocument_name(getStringFromCell(row.getCell(1)));
				temp.setType(getStringFromCell(row.getCell(2)));
				temp.setL1_folder_id_fk(getStringFromCell(row.getCell(3)));
				temp.setL2_folder_id_fk(getStringFromCell(row.getCell(4)));
				temp.setL3_folder_id_fk(getStringFromCell(row.getCell(5)));
				temp.setL4_folder_id_fk(getStringFromCell(row.getCell(6)));
				temp.setSoft_delete_status_id_fk("1");
				temp.setVersion_number("1");
				uploads.add(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("readExcelSheet() : " + e.getMessage());
		}
	}
	
	private String getStringFromCell(Cell cell) {
		if (cell != null && StringUtils.hasText(cell.getStringCellValue())) {
			return cell.getStringCellValue();
		}
		return null;
	}

	@RequestMapping(value = "/documentBulkUpload", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView documentBulkUpload(@ModelAttribute DocumentUpload docUpload, RedirectAttributes attributes,
			BindingResult result, HttpSession session, HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		try {
			boolean flag = false;
			String userId = (String) request.getSession().getAttribute("USER_ID");
			ArrayList<DocumentUpload> documentUploads = populateDocuments(docUpload);
			for (DocumentUpload upload : documentUploads) {
				upload.setUserName((String) request.getSession().getAttribute("USER_NAME"));
				upload.setUser_id_fk(userId);
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

			model.setViewName(PageConstants.newBulkDocumentUpload);
			model.addObject("listOfLevels", docUploadService.getListOfLevels());
			model.addObject("Level1Ids", docUploadService.getFolderParentLevelIds(userId));
			model.addObject("documentUpload", new DocumentUpload());

			if (flag) {
				model.addObject("success", "Document has been uploaded successfully");
			} else {
				model.addObject("error", "Document upload failed");
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("documentBulkUpload() : " + e.getMessage());
			model.addObject("error", commonError);
		}
		return model;
	}

	@RequestMapping(value = "/showDocument", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Document showDocument(@RequestParam("docId") String docId, @RequestParam("userId") String userId) {
		logger.info("showDocument() : Doc ID : " + docId);
		Document document = new Document();
		try {
			document.setDocumentUpload(docUploadService.getDocument(docId));
		} catch (Exception e) {
			logger.error("showDocument() : " + e.getMessage());
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
			document.setParentFolders(docUploadService.getFolderParentLevelIds(userId));
		} catch (Exception e) {
			logger.error("showMoveDocument() : " + e.getMessage());
		}
		return document;
	}

	@RequestMapping(value = "/showDocumentVersions", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Document showDocumentVersions(@RequestParam("docId") String docId, @RequestParam("docNo") String docNo,
			@RequestParam("userId") String userId) {
		logger.info("showDocumentVersions() : Doc ID : " + docId);
		Document document = new Document();
		try {
			document.setDocumentUpload(docUploadService.getDocument(docId));
			document.setVersionOrRevisions(docUploadService.getDocumentVersionList(docNo));
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
		return "";
	}

	@RequestMapping(value = "/moveDocument", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView moveDocument(@ModelAttribute DocumentUpload docUpload, RedirectAttributes attributes,
			BindingResult result, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		logger.info("moveDocument() : Doc ID : " + docUpload.getDocId());
		ModelAndView model = (ModelAndView) session.getAttribute("CURRENT_DOC_SEARCH");
		if (model == null) {
			model = new ModelAndView();
			model.setViewName(PageConstants.documents);
		}

		try {
			if (StringUtils.hasText(docUpload.getDocId())) {
				docUpload.setDocument_id(Integer.parseInt(docUpload.getDocId()));
			}

			DocumentUpload existDocumentUpload = docUploadService
					.getDocument(String.valueOf(docUpload.getDocument_id()));
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
				model.addObject("success", "Document has been moved successfully");
			} else {
				model.addObject("error", "Document move failed");
			}

		} catch (Exception e) {
			logger.error("moveDocument() : " + e.getMessage());
		}
		return model;
	}

	@RequestMapping(value = "/renameDocument", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView renameDocument(@ModelAttribute DocumentUpload docUpload, RedirectAttributes attributes,
			BindingResult result, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		logger.info("renameDocument() : Doc ID : " + docUpload.getDocId());
		ModelAndView model = (ModelAndView) session.getAttribute("CURRENT_DOC_SEARCH");
		if (model == null) {
			model = new ModelAndView();
			model.setViewName(PageConstants.documents);
		}

		try {
			if (StringUtils.hasText(docUpload.getDocId())) {
				docUpload.setDocument_id(Integer.parseInt(docUpload.getDocId()));
			}

			DocumentUpload existDocumentUpload = docUploadService
					.getDocument(String.valueOf(docUpload.getDocument_id()));
			String srcFolder = docUploadService.getBucketLocation(existDocumentUpload);

			docUpload.setUserName((String) request.getSession().getAttribute("USER_NAME"));
			boolean flag = docUploadService.renameDocument(docUpload);

			if (flag && StringUtils.hasLength(srcFolder)) {
				if (AmazonS3Utils.getInstance().isFileAvailable(srcFolder,
						srcFolder + SUFFIX + existDocumentUpload.getDocument_name())) {
					AmazonS3Utils.getInstance().copyWithinS3Bucket(
							srcFolder + SUFFIX + existDocumentUpload.getDocument_name(),
							srcFolder + SUFFIX + docUpload.getDocument_name());
					AmazonS3Utils.getInstance().deleteFromS3Bucket(srcFolder,
							srcFolder + SUFFIX + existDocumentUpload.getDocument_name());
				} else {
					logger.info("renameDocument() : Document not available in " + srcFolder);
				}
			}

			if (flag) {
				model.addObject("success", "Document has been renamed successfully");
			} else {
				model.addObject("error", "Document rename failed");
			}

		} catch (Exception e) {
			logger.error("renameDocument() : " + e.getMessage());
		}
		return model;
	}

	@RequestMapping(value = "/shareDocument", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView shareDocument(@ModelAttribute DocumentUpload docUpload, RedirectAttributes attributes,
			BindingResult result, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		logger.info("shareDocument() : Doc ID : " + docUpload.getDocId());
		ModelAndView model = (ModelAndView) session.getAttribute("CURRENT_DOC_SEARCH");
		if (model == null) {
			model = new ModelAndView();
			model.setViewName(PageConstants.documents);
		}

		try {
			if (StringUtils.hasText(docUpload.getDocId())) {
				docUpload.setDocument_id(Integer.parseInt(docUpload.getDocId()));
			}
			User user = service.getUser(docUpload.getUser_id_fk());
			docUpload.setUserName((String) user.getUserName());
			boolean flag = docUploadService.shareDocument(docUpload);
			if (flag) {
				model.addObject("success", "Document has been shared successfully");
			} else {
				model.addObject("error", "Document share failed");
			}

		} catch (Exception e) {
			logger.error("shareDocument() : " + e.getMessage());
		}
		return model;
	}

	@RequestMapping(value = "/showDocumentRevisions", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView showDocumentRevisions(@RequestParam("docId") String docId, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("showDocumentRevisions() : Doc ID : " + docId);
		ModelAndView model = new ModelAndView();
		try {
			model.setViewName(PageConstants.documentRevisions);
			model.addObject("documentUpload", docUploadService.getDocument(docId));
		} catch (Exception e) {
			logger.error("showDocumentRevisions() : " + e.getMessage());
		}
		return model;
	}

	@RequestMapping(value = "/renderAttachment", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView renderAttachment(@RequestParam("docId") String docId, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("renderAttachment() : Doc ID : " + docId);
		ModelAndView model = new ModelAndView();
		try {
			model.setViewName(PageConstants.dispAttachment);
			String tmpDocId = docId.replaceAll("'", "");
			DocumentUpload documentUpload = docUploadService.getDocument(tmpDocId);
			String curFolder = getBucket(documentUpload);
			if (StringUtils.hasLength(curFolder)) {
				if (AmazonS3Utils.getInstance().isFileAvailable(curFolder,
						curFolder + SUFFIX + documentUpload.getDocument_name())) {
					byte[] byteArray = AmazonS3Utils.getInstance().downLoadFromS3Bucket(
							curFolder + SUFFIX + documentUpload.getDocument_name(), documentUpload.getDocument_name());
					if (byteArray.length > 0) {
						logger.info("renderAttachment() : Doc Found");
						request.setAttribute("fileContent", byteArray);
					} else {
						logger.info("downloadAttachment() : Document not available");
					}
				} else {
					logger.info("downloadAttachment() : Document not available");
				}
			}
		} catch (Exception e) {
			logger.error("downloadAttachment() : " + e.getMessage());
		}
		return model;
	}

	@RequestMapping(value = "/deleteDocument", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteDocument(@RequestParam("docId") String docId, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("deleteDocument() : Doc ID : " + docId);
		ModelAndView model = new ModelAndView();
		String userId = null;
		String userName = null;
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
				flag = docUploadService.deleteDocument(docId);
				if (flag) {
					model.addObject("success", "Document deleted successfully");
				} else {
					model.addObject("error", "Failed to delete document");
				}
			}
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			model.setViewName(PageConstants.documents);
		} catch (Exception e) {
			logger.error("users() : User Id - " + userId + " - User Name - " + userName + " - " + e.getMessage());
		}
		return model;
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

	@RequestMapping(value = "/sendMail", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sendMail(@ModelAttribute MailDetails mailDetails, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("sendMail() : Doc ID : " + mailDetails.getDocId());
		ModelAndView model = (ModelAndView) session.getAttribute("CURRENT_DOC_SEARCH");
		if (model == null) {
			model = new ModelAndView();
			model.setViewName(PageConstants.documents);
		}

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
			model.addObject("success", "E-Mail has been sent successfully");
		} else {
			model.addObject("error", "E-Mail sent failed");
		}
		return model;
	}

	@RequestMapping(value = "/fileUpload", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView fileUpload(MultipartHttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		try {
			String userId = (String) request.getSession().getAttribute("USER_ID");
			Map<String, MultipartFile> fileMap = request.getFileMap();

			for (MultipartFile multipartFile : fileMap.values()) {
				if (StringUtils.hasLength(multipartFile.getOriginalFilename())) {
					String srcKey = awsTempRootFolder + SUFFIX + userId + SUFFIX + multipartFile.getOriginalFilename();
					AmazonS3Utils.getInstance().copyToS3Bucket(srcKey, multipartFile,"");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("documentBulkUpload() : " + e.getMessage());
			model.addObject("error", commonError);
		}
		return model;
	}

	private ArrayList<DocumentUpload> populateDocuments(DocumentUpload docUpload) {
		if (docUpload == null) {
			return new ArrayList<DocumentUpload>();
		}

		String[] docNos = null;
		String[] docNames = null;
		String[] docType = null;
		String[] level1 = null;
		String[] level2 = null;
		String[] level3 = null;
		String[] level4 = null;

		if (StringUtils.hasLength(docUpload.getDocument_no())) {
			docNos = docUpload.getDocument_no().split(",");
		}
		if (StringUtils.hasLength(docUpload.getDocument_name())) {
			docNames = docUpload.getDocument_name().split(",");
		} else {
			docNames = new String[docNos.length];
		}
		if (StringUtils.hasLength(docUpload.getType())) {
			docType = docUpload.getType().split(",");
		} else {
			docType = new String[docNos.length];
		}
		if (StringUtils.hasLength(docUpload.getL1_folder_id_fk())) {
			level1 = docUpload.getL1_folder_id_fk().split(",");
		} else {
			level1 = new String[docNos.length];
		}
		if (StringUtils.hasLength(docUpload.getL2_folder_id_fk())) {
			level2 = docUpload.getL2_folder_id_fk().split(",");
		} else {
			level2 = new String[docNos.length];
		}
		if (StringUtils.hasLength(docUpload.getL3_folder_id_fk())) {
			level3 = docUpload.getL3_folder_id_fk().split(",");
		} else {
			level3 = new String[docNos.length];
		}
		if (StringUtils.hasLength(docUpload.getL4_folder_id_fk())) {
			level4 = docUpload.getL4_folder_id_fk().split(",");
		} else {
			level4 = new String[docNos.length];
		}

		ArrayList<DocumentUpload> uploads = new ArrayList<DocumentUpload>();
		int counter = 0;
		if (docNos != null && docNos.length > 0) {
			for (String docNo : docNos) {
				DocumentUpload temp = new DocumentUpload();
				temp.setDocument_no(docNo);
				temp.setDocument_name(docNames[counter]);
				temp.setRevision_type("1");
				temp.setType(docType[counter]);
				temp.setL1_folder_id_fk(level1[counter]);
				temp.setL2_folder_id_fk(level2[counter]);
				temp.setL3_folder_id_fk(level3[counter]);
				temp.setL4_folder_id_fk(level4[counter]);
				temp.setSoft_delete_status_id_fk("1");
				uploads.add(temp);
				counter++;
			}
		}
		return uploads;
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
	public ModelAndView getDocuments(@RequestParam("folderId") String folderId, HttpServletRequest request,
			HttpSession session) {
		ModelAndView model = new ModelAndView();
		String userId = null;
		String userName = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			String tmpFfolderId = folderId.replaceAll("'", "");
			if(tmpFfolderId.equalsIgnoreCase("0")) {
				model.addObject("LevelFolders", docUploadService.getFolderParentLevelIds(userId));
			} else {
				
				 * List<DocumentUpload> documentList =
				 * docUploadService.getDocumentList(tmpFfolderId); Map<String, UserAccess>
				 * userAccessMap = (Map<String, UserAccess>)
				 * session.getAttribute("USER_ACCESS"); UserAccess userAccess = null; for
				 * (DocumentUpload doc : documentList) { userAccess =
				 * userAccessMap.getOrDefault(doc.getL1_folder_id_fk(), new UserAccess()); if
				 * (userAccess.isDelete()) { doc.setFlAllowDelete("Y"); } if
				 * (userAccess.isEdit()) { doc.setFlAllowEdit("Y"); } if (userAccess.isView()) {
				 * doc.setFlAllowView("Y"); } userAccess = null; }
				 * model.addObject("LevelDocuments", documentList);
				 * model.addObject("LevelFolders",
				 * docUploadService.getFolderLevelForFolderId(Integer.parseInt(tmpFfolderId)));
				 }
			model.addObject("breadCrumbMenu", docUploadService.getFolderLevelForBreadCrumb(tmpFfolderId));
			model.addObject("folderId", tmpFfolderId);
			model.setViewName(PageConstants.documents);
			session.setAttribute("CURRENT_DOC_SEARCH", model);
		} catch (Exception e) {
			logger.error("users() : User Id - " + userId + " - User Name - " + userName + " - " + e.getMessage());
		}
		return model;
	}

	@RequestMapping(value = "/getDocumentList", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<DocumentUpload> getDocumentList(@RequestParam("folderId") String folderId, HttpServletRequest request,
			HttpSession session) {
		List<DocumentUpload> documentList = null;
		try {
			//documentList = docUploadService.getDocumentList(folderId.replaceAll("'", ""));
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
				userAccess = null;
			}
		} catch (Exception e) {
			logger.error("getDocumentList() : " + e.getMessage());
		}
		return documentList;

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

	@RequestMapping(value = "/getDocumentRevisionsList", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<DocumentUpload> getDocumentRevisionsList(@RequestParam("docId") String docId,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		List<DocumentUpload> documentList = null;
		try {
			documentList = docUploadService.getCorrespondenceDocumentList(docId);
		} catch (Exception e) {
			logger.error("getDocumentRevisionsList() : " + e.getMessage());
		}
		return documentList;
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
			model.setViewName(PageConstants.documents);
		} catch (Exception e) {
			logger.error("users() : User Id - " + userId + " - User Name - " + userName + " - " + e.getMessage());
		}
		return model;
	}

*/}

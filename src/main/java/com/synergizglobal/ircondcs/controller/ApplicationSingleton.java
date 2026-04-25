package com.synergizglobal.ircondcs.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.synergizglobal.ircondcs.model.User;
import com.synergizglobal.ircondcs.service.DocumentUploadService;
import com.synergizglobal.ircondcs.service.UserService;

@Component
public class ApplicationSingleton {
	Logger logger = Logger.getLogger(ApplicationSingleton.class);

	@Autowired
	DocumentUploadService docUploadService;

	@Autowired
	UserService service;

	private static Map<String, String> singletonTags = null;
	private static Map<String, String> singletonDocumentType = null;
	private static Map<String, String> singletonStructureType = null;
	private static Map<String, String> singletonRevisionType = null;
	private static List<User> singletonUsers = null;
	private static Map<String, String> singletonDocumentTypeWhichMappedWithCorres = null;
	private static Map<String, String> singletonDocumentTypeWhichMappedWithDrawing = null;

	@PostConstruct
	public void init() {
		try {
			loadDatas();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("init() : " + e.getMessage());
		}
	}

	private void loadDatas() {
		singletonTags = getTags();
		singletonDocumentType = getDcoumentType();
		singletonStructureType = getStructureType();
		singletonRevisionType = getRevisionType();
		singletonUsers = getUsers();
		singletonDocumentTypeWhichMappedWithCorres = getDocumentTypeWhichMappedWithCorres();
		singletonDocumentTypeWhichMappedWithDrawing = getDocumentTypeWhichMappedWithDrawings();
	}

	public void reloadTags() {
		singletonTags.clear();
		singletonDocumentType.clear();
		singletonStructureType.clear();
		singletonRevisionType.clear();
		singletonDocumentTypeWhichMappedWithCorres.clear();
		singletonDocumentTypeWhichMappedWithDrawing.clear();
		loadDatas();
	}

	public synchronized Map<String, String> getTags() {
		try {
			if (CollectionUtils.isEmpty(singletonTags)) {
				singletonTags = docUploadService.getLookupData("tags");
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("getTags() : " + e.getMessage());
		}
		return singletonTags;
	}

	public synchronized String getTagsValue(String key) {
		try {
			if (!CollectionUtils.isEmpty(singletonTags)) {
				ArrayList<String> tagIds = new ArrayList<String>();
				if (StringUtils.hasText(key)) {
					String[] tempIds = key.split(",");
					for (String tagId : tempIds) {
						if (StringUtils.hasText(tagId)) {
							tagIds.add(singletonTags.getOrDefault(tagId, ""));
						}
					}
				}
				return tagIds.stream().collect(Collectors.joining(","));
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("getTagsValue() : " + e.getMessage());
		}
		return "";
	}

	public synchronized List<User> getUsers() {
		try {
			if (CollectionUtils.isEmpty(singletonUsers)) {
				singletonUsers = service.getUsersList(new User());
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("getUsers() : " + e.getMessage());
		}
		return singletonUsers;
	}

	public synchronized Map<String, String> getDcoumentType() {
		try {
			if (CollectionUtils.isEmpty(singletonDocumentType)) {
				singletonDocumentType = docUploadService.getLookupData("document_type");
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("getDcoumentType() : " + e.getMessage());
		}
		return singletonDocumentType;
	}

	public synchronized Map<String, String> getDocumentTypeWhichMappedWithCorres() {
		try {
			singletonDocumentTypeWhichMappedWithCorres = docUploadService.getDocumentTypeWhichMapped("C");

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("getDcoumentType() : " + e.getMessage());
		}
		return singletonDocumentTypeWhichMappedWithCorres;
	}

	public synchronized Map<String, String> getDocumentTypeWhichMappedWithDrawings() {
		try {

			singletonDocumentTypeWhichMappedWithDrawing = docUploadService.getDocumentTypeWhichMapped("D");

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("getDcoumentType() : " + e.getMessage());
		}
		return singletonDocumentTypeWhichMappedWithDrawing;
	}

	public synchronized String getDcoumentTypeValue(String key) {
		try {
			if (!CollectionUtils.isEmpty(singletonDocumentType)) {
				return singletonDocumentType.getOrDefault(key, "");
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("getDcoumentType() : " + e.getMessage());
		}
		return "";
	}

	public synchronized Map<String, String> getStructureType() {
		try {
			if (CollectionUtils.isEmpty(singletonStructureType)) {
				singletonStructureType = docUploadService.getLookupData("structure_type");
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("getStructureType() : " + e.getMessage());
		}
		return singletonStructureType;
	}

	public synchronized String getStructureTypeValue(String key) {
		try {
			if (!CollectionUtils.isEmpty(singletonStructureType)) {
				return singletonStructureType.getOrDefault(key, "");
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("getStructureTypeValue() : " + e.getMessage());
		}
		return "";
	}

	public synchronized Map<String, String> getRevisionType() {
		try {
			if (CollectionUtils.isEmpty(singletonRevisionType)) {
				singletonRevisionType = docUploadService.getLookupData("revision_type");
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("getRevisionType() : " + e.getMessage());
		}
		return singletonRevisionType;
	}

	public synchronized String getRevisionTypeValue(String key) {
		try {
			if (!CollectionUtils.isEmpty(singletonRevisionType)) {
				return singletonRevisionType.getOrDefault(key, "");
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("getRevisionTypeValue() : " + e.getMessage());
		}
		return "";
	}

}

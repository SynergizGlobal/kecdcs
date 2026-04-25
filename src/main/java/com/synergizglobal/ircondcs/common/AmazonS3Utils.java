package com.synergizglobal.ircondcs.common;

import java.io.BufferedInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URL;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.HttpMethod;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectSummary;

public class AmazonS3Utils {
	public static Logger logger = Logger.getLogger(AmazonS3Utils.class);
	private static final String SUFFIX = "/";

	public static String awsAccessKey;
	public static String awsSecretKey;
	public static String awsBucket;
	public static String awsTempRootFolder;

	public static AmazonS3Utils amazonS3Utils;

	public static AmazonS3Utils getInstance() {
		if (amazonS3Utils == null) {
			amazonS3Utils = new AmazonS3Utils();
		}
		return amazonS3Utils;
	}

	private AmazonS3Utils() {
		try {
			String propFileName = "Placeholders.properties";
			Properties prop = new Properties();
			InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);

			if (inputStream != null) {
				prop.load(inputStream);
			} else {
				throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
			}

			awsAccessKey = prop.getProperty("aws.access.key");
			awsSecretKey = prop.getProperty("aws.secret.key");
			awsBucket = prop.getProperty("aws.bucket");
			awsTempRootFolder = "TempImages";

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Loading properties failed");
		}

	}

	public void deleteAllFilesS3TempFolder(String userId) {
		logger.info("deleteAllFilesS3Folder() : Deleting files in folder: " + userId);
		AmazonS3 s3Client = getS3Client();
		List<S3ObjectSummary> fileList = s3Client.listObjects(awsBucket, awsTempRootFolder + SUFFIX + userId)
				.getObjectSummaries();
		try {
			for (S3ObjectSummary file : fileList) {
				s3Client.deleteObject(awsBucket, file.getKey());
			}
		} catch (Exception e) {
			logger.error("deleteAllFilesS3Folder() : " + e.getMessage());
		}
		logger.info("deleteAllFilesS3Folder() : S3 Document delete complete");
	}

	public byte[] downLoadFromS3Bucket(String destKey, String docName) {
		logger.info("downLoadFromS3Bucket() : Downloading Key : " + destKey + ", Doc Name: " + docName);
		S3Object s3Obj = getS3Client().getObject(new GetObjectRequest(awsBucket, destKey));
		InputStream in = new BufferedInputStream(s3Obj.getObjectContent());
		byte[] byteArray = null;
		try {
			byteArray = in.readAllBytes();
		} catch (Exception e) {
			logger.error("downLoadFromS3Bucket() : " + e.getMessage());
			logger.error(e.getMessage(), e);
		}
		logger.info("downLoadFromS3Bucket() : Document download complete");
		return byteArray;
	}

	public boolean isFileAvailable(String destFolder, String destKey) {
		boolean isAvailable = false;
		List<S3ObjectSummary> fileList = getS3Client().listObjects(awsBucket, destFolder).getObjectSummaries();
		try {
			for (S3ObjectSummary file : fileList) {
				if (file.getKey().equalsIgnoreCase(destKey)) {
					isAvailable = true;
					break;
				}
			}
		} catch (Exception e) {
			logger.error("isFileAvailable() : " + e.getMessage());
			logger.error(e.getMessage(), e);
		}
		return isAvailable;
	}

	public void deleteFromS3Bucket(String destFolder, String destKey) {
		logger.info("deleteFromS3Bucket() : Deleting files in folder: " + destFolder + ", Doc : " + destKey);
		AmazonS3 s3Client = getS3Client();
		List<S3ObjectSummary> fileList = s3Client.listObjects(awsBucket, destFolder).getObjectSummaries();
		try {
			for (S3ObjectSummary file : fileList) {
				if (file.getKey().equalsIgnoreCase(destKey)) {
					s3Client.deleteObject(awsBucket, file.getKey());
				}
			}
		} catch (Exception e) {
			logger.error("deleteFromS3Bucket() : " + e.getMessage());
			logger.error(e.getMessage(), e);
		}
		logger.info("deleteFromS3Bucket() : S3 Document delete complete");
	}

	@SuppressWarnings("deprecation")
	private AmazonS3 getS3Client() {
		AWSCredentials credentials = new BasicAWSCredentials(awsAccessKey, awsSecretKey);
		AmazonS3 s3Client = new AmazonS3Client(credentials);
		return s3Client;
	}

	
	/*public void copyToS3Bucket(String srcKey, MultipartFile multipartFile, String destFileName) {
		File newFile = multipartToFile(multipartFile, destFileName);
		getS3Client().putObject(
				new PutObjectRequest(awsBucket, srcKey, newFile).withCannedAcl(CannedAccessControlList.PublicRead));
		logger.info("File Copied to " + srcKey + " - " + multipartFile.getOriginalFilename());
	}*/
	
	public void copyToS3BucketByStream(String srcKey, MultipartFile multipartFile, String destFileName) {
		try {
			ObjectMetadata omd = new ObjectMetadata();
	        omd.setContentType(multipartFile.getContentType());
	        omd.setContentLength(multipartFile.getBytes().length);
	        omd.setHeader("filename", destFileName);
			getS3Client().putObject(
					new PutObjectRequest(awsBucket, srcKey, multipartFile.getInputStream(), omd).withCannedAcl(CannedAccessControlList.PublicRead));
			logger.info("File Copied to " + srcKey + " - " + destFileName);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}
	}


	public void copyWithinS3Bucket(String src, String dest) {
		getS3Client().copyObject(awsBucket, src, awsBucket, dest);
		logger.info("File Copied from " + src + " to " + dest);
	}

	/*public File multipartToFile(MultipartFile multipart, String destFileName) {
		File convFile = null;
		try {
			convFile = new File(destFileName);
			multipart.transferTo(convFile);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return convFile;
	}*/
	
	public String getUrl(String objKey) {
		java.util.Date expiration = Calendar.getInstance().getTime();
		expiration.setTime(expiration.getTime() + 1000*60*60);

		GeneratePresignedUrlRequest generatePresignedUrlRequest = new GeneratePresignedUrlRequest(awsBucket, objKey)
				.withMethod(HttpMethod.GET).withExpiration(expiration);
		URL url = getS3Client().generatePresignedUrl(generatePresignedUrlRequest);
		logger.info("Presigned URL :" + url.toString());
		System.out.println("Presigned URL :" + url.toString());
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return url.toString();
	}

}

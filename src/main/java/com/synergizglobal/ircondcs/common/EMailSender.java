package com.synergizglobal.ircondcs.common;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

import org.apache.log4j.Logger;
import org.springframework.util.StringUtils;

import com.synergizglobal.ircondcs.model.DocumentUpload;
import com.synergizglobal.ircondcs.model.MailDetails;

public class EMailSender {

	private static Logger logger = Logger.getLogger(EMailSender.class);

	public static String mailHost;
	public static String mailPort;
	public static String mailUser;
	public static String mailPassword;

	public static EMailSender mailSender;

	public static EMailSender getInstance() {
		if (mailSender == null) {
			mailSender = new EMailSender();
		}
		return mailSender;
	}

	private EMailSender() {
		try {
			String propFileName = "Placeholders.properties";
			Properties prop = new Properties();
			InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);

			if (inputStream != null) {
				prop.load(inputStream);
			} else {
				throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
			}
			mailHost = prop.getProperty("mail.host");
			mailPort = prop.getProperty("mail.port");
			mailUser = prop.getProperty("mail.user_mail_id");
			mailPassword = prop.getProperty("mail.user_password");

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Loading properties failed");
		}

	}

	private static Session getSession() {
		Properties props = new Properties();
		props.put("mail.smtp.host", mailHost);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", mailPort);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mailUser, mailPassword);
			}
		});
		return session;
	}

	public boolean send(String toAddress, String subject, String body) {
		boolean isSend = false;
		try {
			Message message = new MimeMessage(getSession());
			message.setFrom(new InternetAddress(mailUser));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toAddress));
			message.setSubject(subject);
			message.setText(body);
			Transport.send(message);
			isSend = true;
		} catch (MessagingException e) {
			logger.error("send() : " + e.getMessage());
		}
		return isSend;
	}

	private void addMailAddress(MimeMessage message, String address, RecipientType recipientType)
			throws AddressException, MessagingException {
		if (StringUtils.hasText(address)) {
			String[] mailAddr = address.split(";");
			if (mailAddr != null && mailAddr.length > 0) {
				for (String addr : mailAddr) {
					message.addRecipient(recipientType, new InternetAddress(addr));
				}
			}
		}
	}

	public void sendMail(MailDetails mailDetails, DocumentUpload documentUpload, byte[] byteArray) {
		 
		try {
			MimeMessage message = new MimeMessage(getSession());
			message.setFrom(new InternetAddress(mailUser));
			addMailAddress(message, mailDetails.getToAddress(), javax.mail.Message.RecipientType.TO);
			addMailAddress(message, mailDetails.getCcAddress(), javax.mail.Message.RecipientType.CC);
			message.setSubject(mailDetails.getSubject());

			if (StringUtils.hasText(mailDetails.getMessage())) {
				BodyPart messageBodyPart = new MimeBodyPart();
				messageBodyPart.setContent(mailDetails.getMessage(), "text/html");

				Multipart multipart = new MimeMultipart();
				multipart.addBodyPart(messageBodyPart);

				messageBodyPart = new MimeBodyPart();
				DataSource source = new ByteArrayDataSource(byteArray, "application/*");
				messageBodyPart.setDataHandler(new DataHandler(source));
				messageBodyPart.setFileName(documentUpload.getDocument_name());
				multipart.addBodyPart(messageBodyPart);

				message.setContent(multipart);
				Transport.send(message);
				logger.info("message sent successfully..." + mailDetails.getToAddress());

			} else {
				message.setContent("Empty Message", "text/html");
			}
		} catch (Exception e) {
			logger.error("sendMail() : " + e.getMessage());
			e.printStackTrace();
		}
	}

}

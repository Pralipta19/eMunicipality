package com.emunicipality.app.util;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailServiceUtil {

	public static String sendMail(String body, String subject, String emailId) { 		
		final String from = "medisoft.bhubaneswar@gmail.com";
		final String password = "medisoft.bbsr"; 
		Properties props;
		try {
			props = new Properties();

			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			props.put("mail.smtp.port", 587);

			Session session = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(from, password);
				}
			});
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailId));
			// message.setRecipients(Message.RecipientType.CC,
			// InternetAddress.parse(emailId));
			message.setSubject(subject);
			message.setText(body);

			Transport.send(message);
			System.out.println("Mail sent successfully..........");

			return "SUCCESS";
		} catch (MessagingException mex) {
			mex.printStackTrace();

			Exception ex = mex;
			do {
				if (ex instanceof SendFailedException) {
					SendFailedException sfex = (SendFailedException) ex;
					Address[] invalid = sfex.getInvalidAddresses();
					if (invalid != null) {

					}
					Address[] validUnsent = sfex.getValidUnsentAddresses();
					if (validUnsent != null) {

					}
					Address[] validSent = sfex.getValidSentAddresses();
					if (validSent != null) {

					}
				}

				if (ex instanceof MessagingException)
					ex = ((MessagingException) ex).getNextException();
				else
					ex = null;
			} while (ex != null);
		}
		return "FAILURE";

	}

}

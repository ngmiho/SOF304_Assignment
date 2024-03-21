package com.poly.service.impl;

import javax.servlet.ServletContext;

import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.EmailService;
import com.poly.utils.SendEmailUtil;

public class EmailServiceImpl implements EmailService {

	private static final String EMAIL_WELCOME_SUBJECT = "Welcome to Online Entertainment";
	private static final String EMAIL_FORGOT_PASSWORD_SUBJECT = "Online Entertainment - New Password";
	private static final String EMAIL_SHARE_SUBJECT = "Online Entertainment, Sharing Video";

	@Override
	public void sendEmail(ServletContext context, User recipient, String type) {
		String host = context.getInitParameter("host");
        String port = context.getInitParameter("port");
        String user = context.getInitParameter("user");
        String pass = context.getInitParameter("pass");
        
        try {
        	String subject = null;
        	String content = null;
        	
        	switch (type) {
				case "welcome": 
					subject = EMAIL_WELCOME_SUBJECT;
					content = "Hello " + recipient.getUsername() + ", we hope you have a good time watching our videos on our website.";
					break;
				case "forgot": 
					subject = EMAIL_FORGOT_PASSWORD_SUBJECT;
					content = "Hello " + recipient.getUsername() + ", your new password is " + recipient.getPassword();
					break;
				default:
					subject = "Online Entertainment";
					content = "This is a spam so don't care about it.";
        	}
        	
        	SendEmailUtil.sendEmail(host, port, user, pass, recipient.getEmail(), subject, content);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void sendShareEmail(ServletContext context, User sender, Video video, String email) {
		String host = context.getInitParameter("host");
        String port = context.getInitParameter("port");
        String user = context.getInitParameter("user");
        String pass = context.getInitParameter("pass");
        
        try {
        	String subject = null;
        	String content = null;
        	
        	subject = EMAIL_SHARE_SUBJECT;
			content = sender.getUsername() + " has shared " + video.getTitle() + " to you. "
					+ "We hope you'll enjoy it. "
					+ "Link here: https://www.youtube.com/watch?v=" + video.getHref();
        	
        	SendEmailUtil.sendEmail(host, port, user, pass, email, subject, content);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

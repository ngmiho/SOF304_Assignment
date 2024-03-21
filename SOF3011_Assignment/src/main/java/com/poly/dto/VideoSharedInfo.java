package com.poly.dto;

import java.util.Date;

public class VideoSharedInfo {
	
	private String title;
	private String href;
	private String username;
	private String senderEmail;
	private String reciverEmail;
	private Date sharedDate;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSenderEmail() {
		return senderEmail;
	}
	public void setSenderEmail(String senderEmail) {
		this.senderEmail = senderEmail;
	}
	public String getReciverEmail() {
		return reciverEmail;
	}
	public void setReciverEmail(String reciverEmail) {
		this.reciverEmail = reciverEmail;
	}
	public Date getSharedDate() {
		return sharedDate;
	}
	public void setSharedDate(Date sharedDate) {
		this.sharedDate = sharedDate;
	}
	
	
}

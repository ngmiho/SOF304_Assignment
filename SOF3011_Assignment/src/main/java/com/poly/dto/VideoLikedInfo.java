package com.poly.dto;

import java.util.Date;

public class VideoLikedInfo {

	private Integer videoId;
	private String title;
	private String href;
	private Integer totalLike;
	private Date oldestDate;
	private Date newestDate;

	public Integer getVideoId() {
		return videoId;
	}

	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}

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

	public Integer getTotalLike() {
		return totalLike;
	}

	public void setTotalLike(Integer totalLike) {
		this.totalLike = totalLike;
	}

	public Date getOldestDate() {
		
		return oldestDate;
	}

	public void setOldestDate(Date oldestDate) {
		this.oldestDate = oldestDate;
	}

	public Date getNewestDate() {
		return newestDate;
	}

	public void setNewestDate(Date newestDate) {
		this.newestDate = newestDate;
	}

	@Override
	public String toString() {
		return "VideoLikedInfo [videoId=" + videoId + ", title=" + title + ", href=" + href + ", totalLike=" + totalLike
				+ ", oldestDate=" + oldestDate + ", newestDate=" + newestDate + "]";
	}

}

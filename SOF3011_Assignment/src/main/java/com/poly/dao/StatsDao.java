package com.poly.dao;

import java.util.List;

import com.poly.dto.UserLikedInfo;
import com.poly.dto.VideoLikedInfo;
import com.poly.dto.VideoSharedInfo;

public interface StatsDao {
	
	List<VideoLikedInfo> findeVideoLikedInfo();
	
	List<UserLikedInfo> findUserLikedInfoByVideoHref(String href);
	
	List<VideoSharedInfo> findVideoSharedInfo();
	
	List<VideoSharedInfo> findVideoSharedInfoByVideoHref(String href);
}

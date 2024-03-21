package com.poly.service;

import java.util.List;

import com.poly.dto.UserLikedInfo;
import com.poly.dto.VideoLikedInfo;
import com.poly.dto.VideoSharedInfo;

public interface StatsService {

	List<VideoLikedInfo> findeVideoLikedInfo();

	List<UserLikedInfo> findUserLikedInfoByVideoHref(String href);

	List<VideoSharedInfo> findVideoSharedInfo();

	List<VideoSharedInfo> findVideoSharedInfoByVideoHref(String href);
}

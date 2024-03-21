package com.poly.service.impl;

import java.util.List;

import com.poly.dao.StatsDao;
import com.poly.dao.impl.StatsDaoImpl;
import com.poly.dto.UserLikedInfo;
import com.poly.dto.VideoLikedInfo;
import com.poly.dto.VideoSharedInfo;
import com.poly.service.StatsService;

public class StatsServiceImpl implements StatsService {

	private StatsDao statsDao;
	
	public StatsServiceImpl() {
		statsDao = new StatsDaoImpl();
	}
	
	@Override
	public List<VideoLikedInfo> findeVideoLikedInfo() {
		return statsDao.findeVideoLikedInfo();
	}

	@Override
	public List<UserLikedInfo> findUserLikedInfoByVideoHref(String href) {
		return statsDao.findUserLikedInfoByVideoHref(href);
	}

	@Override
	public List<VideoSharedInfo> findVideoSharedInfo() {
		return statsDao.findVideoSharedInfo();
	}

	@Override
	public List<VideoSharedInfo> findVideoSharedInfoByVideoHref(String href) {
		return statsDao.findVideoSharedInfoByVideoHref(href);
	}

}

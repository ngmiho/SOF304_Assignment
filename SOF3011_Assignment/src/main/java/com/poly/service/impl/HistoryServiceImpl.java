package com.poly.service.impl;

import java.sql.Timestamp;
import java.util.List;

import com.poly.dao.HistoryDao;
import com.poly.dao.impl.HistoryDaoImpl;
import com.poly.entity.History;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;

public class HistoryServiceImpl implements HistoryService {

	private HistoryDao dao;
	
	private VideoService videoService = new VideoServiceImpl();
	
	public HistoryServiceImpl() {
		dao = new HistoryDaoImpl();
	}
	
	@Override
	public List<History> findByUser(String username) {
		return dao.findByUser(username);
	}

	@Override
	public List<History> findByUserAndIsLiked(String username) {
		return dao.findByUserAndIsLiked(username);
	}

	@Override
	public History findByUserIdAndVideoId(Integer userId, Integer videoId) {
		return dao.findByUserIdAndVideoId(userId, videoId);
	}

	@Override
	public History create(User user, Video video) {
		History history = findByUserIdAndVideoId(user.getId(), video.getId());
		
		if (history == null) {
			history = new History();
			
			history.setUser(user);
			history.setVideo(video);
			history.setIsLiked(Boolean.FALSE);
			history.setViewedDate(new Timestamp(System.currentTimeMillis()));
			
			return dao.create(history);
		}
		
		return history;
	}

	@Override
	public boolean updateLikeOrUnlike(User user, String href) {
		Video video = videoService.findByHref(href);
		
		History history = dao.findByUserIdAndVideoId(user.getId(), video.getId());
		
		if (history.getIsLiked() == Boolean.FALSE) {
			history.setIsLiked(Boolean.TRUE);
			history.setLikedDate(new Timestamp(System.currentTimeMillis()));
		} else {
			history.setIsLiked(Boolean.FALSE);
			history.setLikedDate(null);
		}
		
		History updatedHistory = dao.update(history);
		
		return updatedHistory != null ? true : false;
	}

}

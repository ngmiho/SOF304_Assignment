package com.poly.service.impl;

import java.sql.Timestamp;
import java.util.List;

import com.poly.dao.ShareDao;
import com.poly.dao.impl.ShareDaoImpl;
import com.poly.entity.Share;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.ShareService;

public class ShareServiceImpl implements ShareService {

	private ShareDao dao;

	public ShareServiceImpl() {
		dao = new ShareDaoImpl();
	}

	@Override
	public List<Share> findByUser(String username) {
		return dao.findByUser(username);
	}

	@Override
	public List<Share> findByUserIdAndVideoId(Integer userId, Integer videoId) {
		return dao.findByUserIdAndVideoId(userId, videoId);
	}

	@Override
	public Share findByUserIdAndVideoIdAndEmail(Integer userId, Integer videoId, String email) {
		return dao.findByUserIdAndVideoIdAndEmail(userId, videoId, email);
	}	

	@Override
	public Share update(Share share) {
		return dao.update(share);
	}

	@Override
	public Share create(User user, Video video, String email) {
		Share share = dao.findByUserIdAndVideoIdAndEmail(user.getId(), video.getId(), email);
		
		if (share == null) {
			share = new Share();
			
			share.setUser(user);
			share.setVideo(video);
			share.setEmail(email);
			share.setSharedDate(new Timestamp(System.currentTimeMillis()));
			
			return dao.create(share);
		} else {
			share.setSharedDate(new Timestamp(System.currentTimeMillis()));
			return dao.update(share);
		}
	}

	

}

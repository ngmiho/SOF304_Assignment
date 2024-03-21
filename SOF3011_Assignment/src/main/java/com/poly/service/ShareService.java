package com.poly.service;

import java.util.List;

import com.poly.entity.Share;
import com.poly.entity.User;
import com.poly.entity.Video;

public interface ShareService {
	List<Share> findByUser(String username);
	List<Share> findByUserIdAndVideoId(Integer userId, Integer videoId);
	Share findByUserIdAndVideoIdAndEmail(Integer userId, Integer videoId, String email);
	
	Share create(User user, Video video, String email);
	Share update(Share share);
}

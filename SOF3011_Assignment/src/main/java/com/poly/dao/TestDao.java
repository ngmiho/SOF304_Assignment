package com.poly.dao;

import java.util.Date;
import java.util.List;

import com.poly.dao.impl.HistoryDaoImpl;
import com.poly.dao.impl.ShareDaoImpl;
import com.poly.dao.impl.StatsDaoImpl;
import com.poly.dao.impl.UserDaoImpl;
import com.poly.dao.impl.VideoDaoImpl;
import com.poly.dto.UserLikedInfo;
import com.poly.dto.VideoLikedInfo;
import com.poly.dto.VideoSharedInfo;
import com.poly.entity.History;
import com.poly.entity.Share;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.utils.XDate;

public class TestDao {
	public static void main(String[] args) {
		/*
		UserDao userDao = new UserDaoImpl();
		List<User> listUser = userDao.findAll();
		System.out.println("List User");
		for (User user : listUser) {
			System.out.println("Id: " + user.getId());
			System.out.println("Username: " + user.getUsername());
		}
		
		VideoDao videoDao = new VideoDaoImpl();
		List<Video> listVideo = videoDao.findAll();
		System.out.println("List User");
		for (Video video : listVideo) {
			System.out.println("Id: " + video.getId());
			System.out.println("Title: " + video.getTitle());
		}
		
		HistoryDao historyDao = new HistoryDaoImpl();
		List<History> historyList = historyDao.findByUser("hungphan");
		if (!historyList.isEmpty()) {
			for (History history : historyList) {
				System.out.println("Id: " + history.getId());
				System.out.println("Video Title" + history.getVideo().getTitle());
				System.out.println("Like: " + history.getIsLiked());
			}
		}
		
		
		ShareDao shareDao = new ShareDaoImpl();
		Share share = shareDao.findByUserIdAndVideoIdAndEmail(1, 1, "a@gmail.com");
		System.out.println(share.getEmail());
		
		
		StatsDao statsDao = new StatsDaoImpl();
		List<VideoLikedInfo> list = statsDao.findeVideoLikedInfo();
		
		for (VideoLikedInfo video : list) {
			
			System.out.println("NewestDate: " + XDate.toString(video.getNewestDate(), "dd-MM-yyyy"));
		}
		
		StatsDao statsDao = new StatsDaoImpl();
		List<UserLikedInfo> list = statsDao.findUserLikedInfoByVideoHref("7ICKkagL3xA");
		for (UserLikedInfo user : list) {
			System.out.println(user.getUsername());
		}*/
		
		StatsDao statsDao = new StatsDaoImpl();
		List<VideoSharedInfo> list = statsDao.findVideoSharedInfoByVideoHref("7ICKkagL3xA");
		for (VideoSharedInfo video : list) {
			System.out.println(video.getTitle());
		}
	}
}

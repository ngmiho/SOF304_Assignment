package com.poly.service;

import com.poly.entity.Share;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.impl.ShareServiceImpl;
import com.poly.service.impl.UserServiceImpl;
import com.poly.service.impl.VideoServiceImpl;

public class TestService {
	public static void main(String[] args) {
		UserService userService = new UserServiceImpl();
		VideoService videoService = new VideoServiceImpl();
		ShareService shareService = new ShareServiceImpl();

		User user = userService.findById(1);
		Video video = videoService.findById(1);

		Share share = shareService.create(user, video, "b@gmail.com");
		
		if (share != null) {
			System.out.println("True");
		} else {
			System.out.println("False");
		}
	}

}

package com.poly.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.dto.UserLikedInfo;
import com.poly.dto.VideoLikedInfo;
import com.poly.dto.VideoSharedInfo;
import com.poly.entity.Video;
import com.poly.service.StatsService;
import com.poly.service.VideoService;
import com.poly.service.impl.StatsServiceImpl;
import com.poly.service.impl.VideoServiceImpl;

@WebServlet(urlPatterns = { "/admin/report", "/admin/report/favorites", "/admin/report/share" })
public class AdminReportController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private StatsService statsService = new StatsServiceImpl();

	private VideoService videoService = new VideoServiceImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();

		switch (path) {
		case "/admin/report/favorites":
			doGetAdminReportFavorite(req, resp);
			break;
		case "/admin/report/share":
			doGetAdminReportShare(req, resp);
			break;
		}

		doGetAdminReport(req, resp);
	}

	private void doGetAdminReport(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// Favorite Video Stats
		List<VideoLikedInfo> likedVideos = statsService.findeVideoLikedInfo();
		req.setAttribute("likedVideos", likedVideos);
		
		List<VideoSharedInfo> sharedVideos = statsService.findVideoSharedInfo();
		req.setAttribute("sharedVideos", sharedVideos);

		req.setAttribute("view", "/views/admin/admin-report.jsp");
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);
	}

	private void doGetAdminReportFavorite(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// Favorite User Stats
		String method = req.getMethod();

		if (method.equals("POST")) {
			String videoHref = req.getParameter("selectedVideoHref");
			List<UserLikedInfo> users = new ArrayList<UserLikedInfo>();

			if (videoHref != null) {
				users = statsService.findUserLikedInfoByVideoHref(videoHref);
				Video selectedVideo = videoService.findByHref(videoHref);
				req.setAttribute("selectedVideo", selectedVideo);
			}

			req.setAttribute("users", users);
		}
	}
	
	private void doGetAdminReportShare(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// Favorite User Stats
		String method = req.getMethod();

		if (method.equals("POST")) {
			String videoHref = req.getParameter("selectedSharedVideoHref");
			List<VideoSharedInfo> videos = new ArrayList<VideoSharedInfo>();

			if (videoHref != null) {
				videos = statsService.findVideoSharedInfoByVideoHref(videoHref);
				Video selectedVideo = videoService.findByHref(videoHref);
				req.setAttribute("selectedSharedVideo", selectedVideo);
			}

			req.setAttribute("sharedUserVideos", videos);
		}
	}

}

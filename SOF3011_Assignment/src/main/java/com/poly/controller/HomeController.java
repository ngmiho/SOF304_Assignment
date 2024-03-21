package com.poly.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constant.SessionAttribute;
import com.poly.entity.History;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;
import com.poly.service.impl.HistoryServiceImpl;
import com.poly.service.impl.VideoServiceImpl;

@WebServlet(urlPatterns = { "/index", "/favorite", "/history"})
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private VideoService videoService = new VideoServiceImpl();

	private HistoryService historyService = new HistoryServiceImpl();
	
	private static final int VIDEO_MAX_PAGE_SIZE = 6;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath();

		switch (path) {
		case "/index":
			doGetIndex(req, resp);
			break;
		case "/favorite":
			doGetFavorite(session, req, resp);
			break;
		case "/history":
			doGetHistory(session, req, resp);
			break;
		default:
			doGetIndex(req, resp);
			break;
		}

	}

	private void doGetIndex(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// http://localhost:8080/SOF3011_ASM/index?page={page}
		List<Video> countVideo = videoService.findAll();
		int maxPage = (int) Math.ceil(countVideo.size() / (double) VIDEO_MAX_PAGE_SIZE);
		req.setAttribute("maxPage", maxPage);
		
		String pageNumber = req.getParameter("page");
		List<Video> videos = null;
		
		if (pageNumber == null || Integer.valueOf(pageNumber) > maxPage) {
			videos = videoService.findAll(1, VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", 1);
		} else {
			videos = videoService.findAll(Integer.valueOf(pageNumber), VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", Integer.valueOf(pageNumber));
		}
		
		
		req.setAttribute("videos", videos);
		
		String[] categories = {"News", "Music", "Entertainment", "Sport", "Film", "Comedy", "Life", "Travel"};
		req.setAttribute("categories", categories);

		req.setAttribute("view", "/views/user/index.jsp");
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);
	}

	private void doGetFavorite(HttpSession session, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		User currentUser = (User) session.getAttribute(SessionAttribute.CURRENT_USER);

		List<History> histories = historyService.findByUserAndIsLiked(currentUser.getUsername());

		List<Video> videos = new ArrayList<Video>();
		
		if (histories != null) {
			histories.forEach(item -> videos.add(item.getVideo()));
		}

		req.setAttribute("videos", videos);

		req.setAttribute("view", "/views/user/favorite.jsp");
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);
	}

	private void doGetHistory(HttpSession session, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		User currentUser = (User) session.getAttribute(SessionAttribute.CURRENT_USER);

		List<History> histories = historyService.findByUser(currentUser.getUsername());

		List<Video> videos = new ArrayList<Video>();

		if (histories != null) {
			histories.forEach(item -> videos.add(item.getVideo()));
		}
		
		req.setAttribute("videos", videos);

		req.setAttribute("view", "/views/user/favorite.jsp");
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);
	}
}

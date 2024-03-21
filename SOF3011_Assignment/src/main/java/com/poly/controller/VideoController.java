package com.poly.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constant.SessionAttribute;
import com.poly.entity.History;
import com.poly.entity.Share;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.EmailService;
import com.poly.service.HistoryService;
import com.poly.service.ShareService;
import com.poly.service.VideoService;
import com.poly.service.impl.EmailServiceImpl;
import com.poly.service.impl.HistoryServiceImpl;
import com.poly.service.impl.ShareServiceImpl;
import com.poly.service.impl.VideoServiceImpl;

@WebServlet(urlPatterns = "/video")
public class VideoController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private VideoService videoService = new VideoServiceImpl();

	private HistoryService historyService = new HistoryServiceImpl();

	private ShareService shareService = new ShareServiceImpl();

	private EmailService emailService = new EmailServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionParam = req.getParameter("action");
		String href = req.getParameter("id");

		HttpSession session = req.getSession();

		switch (actionParam) {
		case "watch":
			doGetWatch(session, href, req, resp);
			break;
		case "like":
			doGetLike(session, href, req, resp);
			break;
		case "share":
			doGetShare(session, href, req, resp);
			break;
		}
	}

	private void doGetWatch(HttpSession session, String href, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Video> videos = videoService.findAll();

		req.setAttribute("videos", videos);

		Video video = videoService.findByHref(href);
		req.setAttribute("video", video);

		User currentUser = (User) session.getAttribute(SessionAttribute.CURRENT_USER);

		if (currentUser != null) {
			History history = historyService.create(currentUser, video);

			req.setAttribute("flagLiked", history.getIsLiked());
		}

		req.setAttribute("view", "/views/user/video-detail.jsp");
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);
	}

	private void doGetLike(HttpSession session, String href, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("application/json");
		User currentUser = (User) session.getAttribute(SessionAttribute.CURRENT_USER);

		if (currentUser == null) {
			resp.sendRedirect("http://localhost:8080/SOF3011_ASM/login");
		} else {
			boolean result = historyService.updateLikeOrUnlike(currentUser, href);

			if (result == true) {
				// Thành công nhưng không trả về Data
				resp.setStatus(204);
			} else {
				resp.setStatus(400);
			}
		}
	}

	private void doGetShare(HttpSession session, String href, HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("application/json");
		User currentUser = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		Video video = videoService.findByHref(href);
		String email = req.getParameter("email");

		if (currentUser == null) {
			resp.sendRedirect("http://localhost:8080/SOF3011_ASM/login");
		} else {
			if (!email.isEmpty()) {
				Share share = shareService.create(currentUser, video, email);

				if (share != null) {
					// Thành công nhưng không trả về Data
					emailService.sendShareEmail(getServletContext(), currentUser, video, email);
					resp.setStatus(204);
				} else {
					resp.setStatus(400);
				}
			} else {
				resp.setStatus(400);
			}
		}

	}

}

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
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.VideoService;
import com.poly.service.impl.VideoServiceImpl;

@WebServlet(urlPatterns = { "/admin/video", "/admin/video/edit/*", "/admin/video/create", "/admin/video/update",
		"/admin/video/delete" })
public class AdminVideoController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private VideoService videoService = new VideoServiceImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute(SessionAttribute.CURRENT_USER);

		if (currentUser != null && currentUser.isActive() == Boolean.TRUE) {
			Video video = new Video();
			String uri = req.getRequestURI();

			boolean edit = false;

			if (uri.contains("edit")) {
				String id = uri.substring(uri.lastIndexOf("/") + 1);
				video = videoService.findById(Integer.valueOf(id));
				edit = true;
			} else if (uri.contains("create")) {
				try {
					String title = req.getParameter("title");
					String href = req.getParameter("href");
					String poster = req.getParameter("poster");
					String description = req.getParameter("description");

					if (title.isEmpty() || href.isEmpty() || poster.isEmpty() || description.isEmpty()) {
						throw new Exception();
					}

					Video newVideo = new Video(title, href, poster, description);

					video = videoService.create(newVideo);

					req.setAttribute("message", "Thêm mới thành công");

					edit = true;
				} catch (Exception e) {
					e.printStackTrace();
					edit = false;
					req.setAttribute("message", "Thêm mới thất bại");
				}
			} else if (uri.contains("update")) {
				try {
					String title = req.getParameter("title");
					String href = req.getParameter("href");
					String poster = req.getParameter("poster");
					String description = req.getParameter("description");
					boolean isActive = (req.getParameter("isActive") != null);

					if (title.isEmpty() || href.isEmpty() || poster.isEmpty() || description.isEmpty()) {
						throw new Exception();
					}

					Video updatedVideo = new Video();
					
					updatedVideo = videoService.findByHref(href);
					updatedVideo.setTitle(title);
					updatedVideo.setDescription(description);
					updatedVideo.setIsActive(isActive);
					
					videoService.update(updatedVideo);

					req.setAttribute("message", "Cập nhật thành công");
				} catch (Exception e) {
					e.printStackTrace();
					req.setAttribute("message", "Cập nhật thất bại");
				}
			} else if (uri.contains("delete")) {
				try {
					String href = req.getParameter("href");
					
					videoService.delete(href);

					req.setAttribute("message", "Xóa thành công");
				} catch (Exception e) {
					e.printStackTrace();
					req.setAttribute("message", "Xóa thất bại");
				}
			}

			List<Video> videos = videoService.findAll();
			req.setAttribute("videos", videos);

			req.setAttribute("video", video);

			req.setAttribute("edit", edit);

			req.setAttribute("view", "/views/admin/admin-video.jsp");
			req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("index");
		}

	}
}

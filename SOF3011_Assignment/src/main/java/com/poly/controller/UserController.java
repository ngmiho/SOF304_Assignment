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
import com.poly.service.EmailService;
import com.poly.service.HistoryService;
import com.poly.service.UserService;
import com.poly.service.impl.EmailServiceImpl;
import com.poly.service.impl.HistoryServiceImpl;
import com.poly.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = { "/login", "/register", "/logout", "/forgot-password", "/profile", "/change-password"})
public class UserController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	private UserService userService = new UserServiceImpl();
	
	private HistoryService historyService = new HistoryServiceImpl();
	
	private EmailService emailService = new EmailServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath();

		switch (path) {
			case "/login": 
				doGetLogin(req, resp);
				break;
			case "/profile": 
				doGetProfile(session, req, resp);
				break;
			case "/register":
				doGetRegister(req, resp);
				break;
			case "/logout":
				doGetLogout(session, req, resp);
				break;
			case "/forgot-password":
				doGetForgotPassword(req, resp);
				break;
			case "/change-password":
				doGetChangePassword(req, resp);
				break;
		}

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String path = req.getServletPath();

		switch (path) {
			case "/login": 
				doPostLogin(session, req, resp);
				break;
			case "/register":
				doPostRegister(session, req, resp);
				break;
			case "/forgot-password":
				doPostForgotPassword(req, resp);
				break;
			case "/change-password":
				doPostChangePassword(session, req, resp);
				break;
			case "/logout":
				break;
		}
	}

	protected void doGetLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("view", "/views/user/login.jsp");
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);
	}
	
	protected void doGetProfile(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User currentUser = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		req.setAttribute("user", currentUser);

		List<History> favorites = historyService.findByUserAndIsLiked(currentUser.getUsername());

		List<Video> favoriteVideos = new ArrayList<Video>();
 
		if (favorites != null) {
			for (History favorite : favorites) {
				favoriteVideos.add(favorite.getVideo());
			}
		}
		
		req.setAttribute("favoriteVideos", favoriteVideos);
		
		List<History> histories = historyService.findByUser(currentUser.getUsername());

		List<Video> videos = new ArrayList<Video>();

		if (histories != null) {
			for (History history : histories) {
				videos.add(history.getVideo());
			}
		}

		req.setAttribute("videos", videos);
		
		
		req.setAttribute("view", "/views/user/profile.jsp");
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);
	}
	
	protected void doGetRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("view", "/views/user/register.jsp");
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);
	}
	
	protected void doGetLogout(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		session.removeAttribute(SessionAttribute.CURRENT_USER);
		resp.sendRedirect("index");
	}
	
	protected void doGetForgotPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("view", "/views/user/forgot-password.jsp");
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);
	}
	
	protected void doGetChangePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("view", "/views/user/change-password.jsp");
		req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);
	}
	
	protected void doPostLogin(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		User user = userService.login(username, password);
		
		if (user != null) {
			session.setAttribute(SessionAttribute.CURRENT_USER, user);
			resp.sendRedirect("index");
		} else {
			String loginMessage = "Login Failed";
			req.setAttribute("loginMessage", loginMessage);
//			resp.sendRedirect("login");
			req.setAttribute("view", "/views/user/login.jsp");
			req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);
		}
	}
	
	protected void doPostRegister(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		
		User user = userService.create(username, password, email);
		
		if (user != null) {
			emailService.sendEmail(getServletContext(), user, "welcome");
			session.setAttribute(SessionAttribute.CURRENT_USER, user);
			resp.sendRedirect("index");
		} else {
			resp.sendRedirect("register");
		}
	}
	
	protected void doPostForgotPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		
		String email = req.getParameter("email");
		
		User userWithNewPassword = userService.resetPassword(email);
		
		if (userWithNewPassword != null) {
			emailService.sendEmail(getServletContext(), userWithNewPassword, "forgot");
			resp.setStatus(204);
		} else {
			resp.setStatus(400);
		}
	}
	
	protected void doPostChangePassword(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String password = req.getParameter("password");
		String newPassword = req.getParameter("newPassword");
		
		User currentUser = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		
		if (currentUser.getPassword().equals(password)) {
			currentUser.setPassword(newPassword);
			User updatedUser = userService.update(currentUser);
			
			if (updatedUser != null) {
				session.setAttribute(SessionAttribute.CURRENT_USER, updatedUser);
				resp.setStatus(204);
			} else {
				resp.setStatus(400);
			}
		} else {
			resp.setStatus(400);
		}
		
	}


}

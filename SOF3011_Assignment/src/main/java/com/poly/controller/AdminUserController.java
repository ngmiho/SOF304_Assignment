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
import com.poly.service.UserService;
import com.poly.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = { "/admin/user", "/admin/user/edit/*", "/admin/user/create", "/admin/user/update",
		"/admin/user/delete" })
public class AdminUserController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private UserService userService = new UserServiceImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		
		if (currentUser != null && currentUser.isActive() == Boolean.TRUE) {
			User user = new User();
			String uri = req.getRequestURI();
			
			boolean edit = false;
			
			if (uri.contains("edit")) {
				String id = uri.substring(uri.lastIndexOf("/") + 1);
				user = userService.findById(Integer.valueOf(id));
				edit = true;
			} else if (uri.contains("create")) {
				try {
					String username = req.getParameter("username");
					
					String password = req.getParameter("password");
					String email = req.getParameter("email");
					
					if (username.isEmpty() || password.isEmpty() || email.isEmpty()) {
						throw new Exception();
					}
					
					user = userService.create(username, password, email);
					
					req.setAttribute("message", "Thêm mới thành công");
					
					edit = true;
				} catch (Exception e) {
					e.printStackTrace();
					edit = false;
					req.setAttribute("message", "Thêm mới thất bại");
				}
			} else if (uri.contains("update")) {
				try {
					String username = req.getParameter("username");
					String password = req.getParameter("password");
					String email = req.getParameter("email");
					boolean isActive = (req.getParameter("isActive") != null);
					boolean isAdmin = (req.getParameter("isAdmin") != null);
					
					if (password.isEmpty() || email.isEmpty()) {
						throw new Exception();
					}
					
					user = userService.findByUsername(username);
					
					user.setPassword(password);
					user.setEmail(email);
					user.setActive(isActive);
					user.setAdmin(isAdmin);
					
					userService.update(user);
					
					user = new User();
					
					req.setAttribute("message", "Cập nhật thành công");
				} catch (Exception e) {
					e.printStackTrace();
					req.setAttribute("message", "Cập nhật thất bại");
				}
			} else if (uri.contains("delete")) {
				try {
					String username = req.getParameter("username");
					
					userService.delete(username);
					
					user = new User();
					
					req.setAttribute("message", "Xóa thành công");
				} catch (Exception e) {
					e.printStackTrace();
					req.setAttribute("message", "Xóa thất bại");
				}
			}
			
			
			List<User> users = userService.findAll();
			req.setAttribute("users", users);
			
			req.setAttribute("user", user);
			
			req.setAttribute("edit", edit);

			req.setAttribute("view", "/views/admin/admin-user.jsp");
			req.getRequestDispatcher("/views/layout.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("index");
		}
	}

}

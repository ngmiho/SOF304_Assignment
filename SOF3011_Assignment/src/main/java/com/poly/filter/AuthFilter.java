package com.poly.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.constant.SessionAttribute;
import com.poly.entity.User;

@WebFilter({ "/admin/*", "/favorite", "/history", "/logout", "/profile", "/change-password" })
public class AuthFilter implements HttpFilter {

	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		String uri = req.getRequestURI();
		User user = (User) req.getSession().getAttribute(SessionAttribute.CURRENT_USER);
		String error = "";
		
		System.out.println("AuthFilter is running");

		if (user == null) {
			error = resp.encodeURL("Vui lòng đăng nhập");
		} else if (!user.isAdmin() && uri.contains("/admin/")) {
			error = resp.encodeURL("Vui lòng đăng nhập với vai trò admin");
		}

		if (!error.isEmpty()) {
			req.getSession().setAttribute("securi", uri);
			System.out.println(error);
			resp.sendRedirect("http://localhost:8080/SOF3011_ASM/login");
		} else {
			chain.doFilter(req, resp);
		}
	}

}

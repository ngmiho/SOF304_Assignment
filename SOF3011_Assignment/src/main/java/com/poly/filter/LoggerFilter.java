package com.poly.filter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.entity.User;

@WebFilter("/admin/*")
public class LoggerFilter implements HttpFilter {

	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// Ghi nhận current user, uri, time vào Database hoặc File
		User user = (User) req.getSession().getAttribute("currentUser");
		String uri = req.getRequestURI();
		Date time = new Date();
		
		chain.doFilter(req, resp);
	}

}

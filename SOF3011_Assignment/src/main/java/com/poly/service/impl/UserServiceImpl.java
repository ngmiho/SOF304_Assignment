package com.poly.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.poly.dao.UserDao;
import com.poly.dao.impl.UserDaoImpl;
import com.poly.dto.UserLikedInfo;
import com.poly.entity.User;
import com.poly.service.UserService;

public class UserServiceImpl implements UserService {

	private UserDao dao;
	
	public UserServiceImpl() {
		dao = new UserDaoImpl();
	}
	
	@Override
	public User findById(Integer id) {
		return dao.findById(id);
	}

	@Override
	public User findByEmail(String email) {
		return dao.findByEmail(email);
	}

	@Override
	public User findByUsername(String username) {
		return dao.findByUsername(username);
	}

	@Override
	public User login(String username, String password) {
		return dao.findByUsernameAndPassword(username, password);
	}

	@Override
	public User resetPassword(String email) {
		User existUser = findByEmail(email);
		
		if (existUser != null) {
			// (Math.random()) * ((max - min) + 1)) + min
			String newPassword = String.valueOf((int) (Math.random() * ((999999 - 100000) + 1)) + 100000);
			existUser.setPassword(newPassword);
			return dao.update(existUser);
		}
		
		return null;
	}

	@Override
	public List<User> findAll() {
		return dao.findAll();
	}

	@Override
	public User create(String username, String password, String email) {
		User user = new User();
		
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setAdmin(Boolean.FALSE);
		user.setActive(Boolean.TRUE);
		
		return dao.create(user);
	}

	@Override
	public User update(User entity) {
		return dao.update(entity);
	}

	@Override
	public User delete(String username) {
		User user = dao.findByUsername(username);
		
		user.setActive(Boolean.FALSE);
		
		return dao.update(user);
	}

	@Override
	public List<User> findUsersLikedVideoByVideoHref(String href) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("videoHref", href);
		
		List<User> users = dao.findUsersLikedVideoByVideoHref(params);
		
		return users;
	}

}

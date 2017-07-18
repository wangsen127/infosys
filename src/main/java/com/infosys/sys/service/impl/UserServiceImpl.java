package com.infosys.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infosys.sys.dao.UserDao;
import com.infosys.sys.pojo.User;
import com.infosys.sys.service.UserService;
import com.infosys.sys.util.JsonUtil;

/**
 * 
 * <p> Title: UserServiceImpl </p>
 * <p> Description: 用户Service实现类 </p>
 * <p> Company: www.infosys.com </p>
 *
 * @author 王森
 * @date 2017年7月18日
 * @version 1.0
 */
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public boolean saveUser(User user) throws Exception {
		return userDao.insertUser(user);
	}

	@Override
	public boolean editUser(User user) throws Exception {
		return userDao.updateUser(user);
	}

	@Override
	public boolean delUser(Integer[] ids) throws Exception {
		return userDao.deleteUser(ids);
	}

	@Override
	public User getUser(Integer userid) throws Exception {
		User user =userDao.getUser(userid);
		return user;
	}

	@Override
	public Map<String, Object> queryUser(User user) throws Exception {
		List<User> list = userDao.queryUser(user);
		Integer total = userDao.queryUserCount();
		return JsonUtil.renderJson(list, total);
	}
}

package com.infosys.sys.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infosys.sys.pojo.User;
import com.infosys.sys.service.UserService;
import com.infosys.sys.util.ConstantUtil;
import com.infosys.sys.util.MD5Util;

/**
 * 
 * <p> Title: UserController </p>
 * <p> Description: 用户Controller </p>
 * <p> Company: www.infosys.com </p>
 *
 * @author 王森
 * @date 2017年7月18日
 * @version 1.0
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/user.html")
	public String user() throws Exception {
		return "sys/user";
	}
	
	@RequestMapping("/saveUser.do")
	public @ResponseBody String saveUser(User user) throws Exception {
		user.setPassword(MD5Util.toMD5(ConstantUtil.PASSWORD));
		boolean result = userService.saveUser(user);
		if(result)
			return "success";
		return "failure";
	}
	
	@RequestMapping("/editUser.do")
	public @ResponseBody String editUser(User user) throws Exception {
		boolean result = userService.editUser(user);
		if(result)
			return "success";
		return "failure";
	}
	
	@RequestMapping("/delUser.do")
	public @ResponseBody String delUser( @RequestParam("ids[]") Integer[] ids) throws Exception {
		boolean result = userService.delUser(ids);
		if(result)
			return "success";
		return "failure";
	}
	
	@RequestMapping("/getUser.do")
	public @ResponseBody User getUser(Integer userid) throws Exception {
		User user = userService.getUser(userid);
		return user;
	}
	
	@RequestMapping("/queryUser.do")
	public @ResponseBody Map<String, Object> queryUser(User user) throws Exception {
		Map<String, Object> map = userService.queryUser(user);
		return map;
	}
	
	@RequestMapping("/existsUser.do")
	public @ResponseBody String existsUser(String usercode) throws Exception{
		int i = userService.existsUser(usercode);
		if(i==0)
			return "success";
		return "failure";
	}
}

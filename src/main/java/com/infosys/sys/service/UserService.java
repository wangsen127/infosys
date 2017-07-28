package com.infosys.sys.service;

import java.util.Map;

import com.infosys.sys.pojo.User;
/**
 * 
 * <p> Title: UserService </p>
 * <p> Description: 用户Service接口 </p>
 * <p> Company: www.infosys.com </p>
 *
 * @author 王森
 * @date 2017年7月18日
 * @version 1.0
 */
public interface UserService {
	public boolean saveUser(User user) throws Exception;
	public boolean editUser(User user) throws Exception;
	public boolean delUser(Integer[] ids) throws Exception;
	public User getUser(Integer userid) throws Exception;
	public Map<String, Object> queryUser(User user) throws Exception;
	public int existsUser(String usercode) throws Exception;
}

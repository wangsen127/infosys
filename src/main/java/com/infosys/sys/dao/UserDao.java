package com.infosys.sys.dao;

import java.util.List;

import com.infosys.sys.pojo.User;

/**
 * 
 * <p> Title: UserDao </p>
 * <p> Description: 用户Dao接口 </p>
 * <p> Company: www.infosys.com </p>
 *
 * @author 王森
 * @date 2017年7月18日
 * @version 1.0
 */
public interface UserDao {
	public boolean insertUser(User user) throws Exception;
	public boolean updateUser(User user) throws Exception;
	public boolean deleteUser(Integer[] ids) throws Exception;
	public User getUser(Integer userid) throws Exception;
	public List<User> queryUser(User user) throws Exception;
	public int queryUserCount() throws Exception;
	public int existsUser(String usercode) throws Exception;
}

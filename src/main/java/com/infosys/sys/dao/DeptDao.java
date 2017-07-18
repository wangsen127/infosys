package com.infosys.sys.dao;

import java.util.List;

import com.infosys.sys.pojo.Dept;
import com.infosys.sys.pojo.TreeNode;

/**
 * 
 * <p>Title: DeptDao</p>
 * <p>Description: 组织机构Dao接口</p>
 * <p>Company: www.infosys.com</p> 
 * @author 王森
 * @date 2017年7月6日下午4:34:01
 * @version 1.0
 */
public interface DeptDao {

	public boolean insertDept(Dept dept) throws Exception;
	public boolean updateDept(Dept dept) throws Exception;
	public boolean deleteDept(Integer[] ids) throws Exception;
	public Dept getDept(Integer deptid) throws Exception;
	public List<Dept> queryDept(Dept dept) throws Exception;
	public int queryDeptCount() throws Exception;
	/**
	 * 部门树形结构
	 */
	public List<TreeNode> deptTree(Integer deptid) throws Exception;
	/**
	 * 获取父部门
	 */
	public int getParent(Integer[] ids) throws Exception;
	
}

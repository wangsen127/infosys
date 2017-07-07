package com.infosys.sys.dao;

import java.util.List;

import com.infosys.sys.pojo.Dept;
import com.infosys.sys.pojo.TreeNode;

/**
 * 
 * <p>Title: DeptDao</p>
 * <p>Description: 部门Dao接口</p>
 * <p>Company: www.infosys.com</p> 
 * @author 王森
 * @date 2017年7月6日下午4:34:01
 * @version 1.0
 */
public interface DeptDao {

	public void insertDept(Dept dept) throws Exception;
	public void updateDept(Dept dept) throws Exception;
	public void deleteDept(Integer[] ids) throws Exception;
	public Dept getDept(Integer deptid) throws Exception;
	public List<Dept> queryDept() throws Exception;
	public List<TreeNode> quertDeptForTree(Integer parent) throws Exception;
	
}

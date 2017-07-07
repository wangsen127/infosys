package com.infosys.sys.service;

import java.util.List;
import java.util.Map;

import com.infosys.sys.pojo.Dept;
import com.infosys.sys.pojo.TreeNode;
/**
 * 
 * <p>Title: DeptService</p>
 * <p>Description: 部门Service接口</p>
 * <p>Company: www.infosys.com</p> 
 * @author 王森
 * @date 2017年7月6日下午4:34:28
 * @version 1.0
 */
public interface DeptService {
	public void saveDept(Dept dept) throws Exception;
	public void editDept(Dept dept) throws Exception;
	public void delDept(Integer[] ids) throws Exception;
	public Dept getDept(Integer deptid) throws Exception;
	public List<Dept> queryDept() throws Exception;
	public List<TreeNode> quertDeptForTree(Integer parent) throws Exception;
	
}

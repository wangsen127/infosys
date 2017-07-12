package com.infosys.sys.service;

import java.util.List;
import java.util.Map;

import com.infosys.sys.pojo.Dept;
import com.infosys.sys.pojo.PageBean;
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
	public boolean saveDept(Dept dept) throws Exception;
	public boolean editDept(Dept dept) throws Exception;
	public boolean delDept(Integer[] ids) throws Exception;
	public Dept getDept(Integer deptid) throws Exception;
	public Map<String, Object> queryDept(PageBean pageBean) throws Exception;
	public List<TreeNode> deptTree(Integer deptid) throws Exception;
}

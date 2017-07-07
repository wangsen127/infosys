package com.infosys.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infosys.sys.dao.DeptDao;
import com.infosys.sys.pojo.Dept;
import com.infosys.sys.pojo.TreeNode;
import com.infosys.sys.service.DeptService;

/**
 * 
 * <p>Title: DeptServiceImpl</p>
 * <p>Description: 部门Service实现类</p>
 * <p>Company: www.infosys.com</p> 
 * @author 王森
 * @date 2017年7月6日下午4:35:00
 * @version 1.0
 */
@Service
public class DeptServiceImpl implements DeptService{

	@Autowired
	private DeptDao deptDao;
	
	@Override
	public void saveDept(Dept dept) throws Exception {
		deptDao.insertDept(dept);
	}

	@Override
	public void editDept(Dept dept) throws Exception {
		deptDao.updateDept(dept);
	}

	@Override
	public void delDept(Integer[] ids) throws Exception {
		deptDao.deleteDept(ids);
	}

	@Override
	public Dept getDept(Integer deptid) throws Exception {
		Dept dept =deptDao.getDept(deptid);
		return dept;
	}

	@Override
	public List<Dept> queryDept() throws Exception {
		List<Dept> list = deptDao.queryDept();
		return list;
	}

	@Override
	public List<TreeNode> quertDeptForTree(Integer parent) throws Exception {
		List<TreeNode> list = deptDao.quertDeptForTree(parent);
		
		return list;
	}
	
	public void getChildren(List<TreeNode> list) throws Exception {
		for (TreeNode treeNode : list) {
			List<TreeNode> sublist = deptDao.quertDeptForTree(treeNode.getId());
			if(sublist!=null && sublist.size()>0){
				treeNode.setChildren(sublist);
				getChildren(sublist);
			}else{
				
			}
		}
	}
}

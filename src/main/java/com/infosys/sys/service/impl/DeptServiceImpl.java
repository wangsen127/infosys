package com.infosys.sys.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infosys.sys.dao.DeptDao;
import com.infosys.sys.pojo.Dept;
import com.infosys.sys.pojo.TreeNode;
import com.infosys.sys.service.DeptService;
import com.infosys.sys.util.JsonUtil;

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
	public boolean saveDept(Dept dept) throws Exception {
		return deptDao.insertDept(dept);
	}

	@Override
	public boolean editDept(Dept dept) throws Exception {
		return deptDao.updateDept(dept);
	}

	@Override
	public boolean delDept(Integer[] ids) throws Exception {
		int count = deptDao.getParent(ids);
		if(count==0){
			return deptDao.deleteDept(ids);
		}
		return false;
	}

	@Override
	public Dept getDept(Integer deptid) throws Exception {
		Dept dept =deptDao.getDept(deptid);
		return dept;
	}

	@Override
	public Map<String, Object> queryDept(Dept dept) throws Exception {
		List<Dept> list = deptDao.queryDept(dept);
		Integer total = deptDao.queryDeptCount();
		return JsonUtil.renderJson(list, total);
	}

	@Override
	public List<TreeNode> deptTree(Integer deptid) throws Exception {
		List<TreeNode> list = deptDao.deptTree(deptid);
		List<TreeNode> treeList = new ArrayList<TreeNode>();
		if(deptid==null){
			for (TreeNode treeNode : list) {
				if(treeNode.getParent()==null){
					deptid=treeNode.getId();
					break;
				}
			}
		}
		getChildren(list,treeList,deptid);
		return treeList;
	}
	/**
	 * 获取部门树所有子节点
	 * @param list
	 * @throws Exception
	 */
	public void getChildren(List<TreeNode> list,List<TreeNode> treeList,Integer deptid) throws Exception {
		TreeNode root = null;
		for (TreeNode treeNode : list) {
			if(treeNode.getId().equals(deptid)){
				root = treeNode;
				treeList.add(treeNode);
				break;
			}
		}
		for (TreeNode treeNode : list) {
			if(deptid.equals(treeNode.getParent())){
				getChildren(list,root.getChildren(),treeNode.getId());
			}
		}
	}
}

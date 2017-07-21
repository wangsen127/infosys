package com.infosys.sys.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infosys.sys.pojo.Dept;
import com.infosys.sys.pojo.TreeNode;
import com.infosys.sys.service.DeptService;

/**
 * 
 * <p>Title: DeptController</p>
 * <p>Description: 部门Controller</p>
 * <p>Company: www.infosys.com</p> 
 * @author 王森
 * @date 2017年7月6日下午4:33:33
 * @version 1.0
 */
@Controller
public class DeptController {

	@Autowired
	private DeptService deptService;
	
	@RequestMapping("/dept.html")
	public String dept() throws Exception {
		return "sys/dept";
	}
	
	@RequestMapping("/saveDept.do")
	public @ResponseBody String saveDept(Dept dept) throws Exception {
		boolean result = deptService.saveDept(dept);
		if(result)
			return "success";
		return "failure";
	}
	
	@RequestMapping("/editDept.do")
	public @ResponseBody String editDept(Dept dept) throws Exception {
		boolean result = deptService.editDept(dept);
		if(result)
			return "success";
		return "failure";
	}
	
	@RequestMapping("/delDept.do")
	public @ResponseBody String delDept( @RequestParam("ids[]") Integer[] ids) throws Exception {
		boolean result = deptService.delDept(ids);
		if(result)
			return "success";
		return "failure";
	}
	
	@RequestMapping("/getDept.do")
	public @ResponseBody Dept getDept(Integer deptid) throws Exception {
		Dept dept = deptService.getDept(deptid);
		return dept;
	}
	
	@RequestMapping("/queryDept.do")
	public @ResponseBody Map<String, Object> queryDept(Dept dept) throws Exception {
		Map<String, Object> map = deptService.queryDept(dept);
		return map;
	}
	
	@RequestMapping("/deptTree.do")
	public @ResponseBody List<TreeNode> deptTree(Integer deptid) throws Exception{
		List<TreeNode> list = deptService.deptTree(deptid);
		return list;
	}
	
	@RequestMapping("/existsDept.do")
	public @ResponseBody String existsDept(String deptcode) throws Exception{
		int i = deptService.existsDept(deptcode);
		if(i==0)
			return "success";
		return "failure";
	}
}

package com.infosys.sys.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public void saveDept(HttpServletResponse response, Dept dept) throws Exception {
		deptService.saveDept(dept);
		response.getWriter().write("true");
	}
	
	@RequestMapping("/editDept.do")
	public void editDept(HttpServletResponse response, Dept dept) throws Exception {
		deptService.editDept(dept);
		response.getWriter().write("true");
	}
	
	@RequestMapping("/delDept.do")
	public void delDept(HttpServletResponse response, Integer[] ids) throws Exception {
		deptService.delDept(ids);
		response.getWriter().write("true");
	}
	
	@RequestMapping("/queryDept.do")
	public @ResponseBody List<Dept> queryDept() throws Exception {
		List<Dept> list = deptService.queryDept();
		return list;
	}
	
	@RequestMapping("/quertDeptForTree.do")
	public @ResponseBody List<TreeNode> quertDeptForTree(Integer parent) throws Exception{
		List<TreeNode> list = deptService.quertDeptForTree(parent);
		return list;
	}
}

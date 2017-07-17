package com.infosys.sys.pojo;
/**
 * 
 * <p>Title: Dept</p>
 * <p>Description: 部门POJO</p>
 * <p>Company: www.infosys.com</p> 
 * @author 王森
 * @date 2017年7月6日下午3:46:59
 * @version 1.0
 */
public class Dept extends PageBean{
	private Integer deptid;
	private String deptcode;
	private String deptname;
	private Integer manager;
	private Dept parent;
	private Integer deptlevel;
	public Integer getDeptid() {
		return deptid;
	}
	public void setDeptid(Integer deptid) {
		this.deptid = deptid;
	}
	public String getDeptcode() {
		return deptcode;
	}
	public void setDeptcode(String deptcode) {
		this.deptcode = deptcode;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public Integer getManager() {
		return manager;
	}
	public void setManager(Integer manager) {
		this.manager = manager;
	}
	public Dept getParent() {
		return parent;
	}
	public void setParent(Dept parent) {
		this.parent = parent;
	}
	public Integer getDeptlevel() {
		return deptlevel;
	}
	public void setDeptlevel(Integer deptlevel) {
		this.deptlevel = deptlevel;
	}
	
}

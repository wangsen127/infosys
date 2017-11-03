package com.infosys.sys.pojo;
/**
 * 
 * <p> Title: Position </p>
 * <p> Description: 岗位POJO </p>
 * <p> Company: www.infosys.com </p>
 *
 * @author 王森
 * @date 2017年8月4日
 * @version 1.0
 */
public class Position extends PageBean{
	private Integer postid;
	private String postname;
	private String obligatory;
	public Integer getPostid() {
		return postid;
	}
	public void setPostid(Integer postid) {
		this.postid = postid;
	}
	public String getPostname() {
		return postname;
	}
	public void setPostname(String postname) {
		this.postname = postname;
	}
	public String getObligatory() {
		return obligatory;
	}
	public void setObligatory(String obligatory) {
		this.obligatory = obligatory;
	}
}

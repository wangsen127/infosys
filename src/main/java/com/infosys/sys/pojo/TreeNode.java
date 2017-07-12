package com.infosys.sys.pojo;

import java.util.ArrayList;
import java.util.List;

public class TreeNode {
	private Integer id;// 节点编号
	private String text;// 节点文本
	private Integer parent;
	private String state = "open";// 节点状态
	private List<TreeNode> children = new ArrayList<TreeNode>();// 子节点集合

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	public Integer getParent() {
		return parent;
	}

	public void setParent(Integer parent) {
		this.parent = parent;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public List<TreeNode> getChildren() {
		return children;
	}

	public void setChildren(List<TreeNode> children) {
		this.children = children;
	}

}
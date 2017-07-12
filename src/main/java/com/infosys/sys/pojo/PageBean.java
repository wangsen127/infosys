package com.infosys.sys.pojo;

public class PageBean {

	/**
	 * 当前页数
	 */
	private Integer page;
	/**
	 * 每页条数
	 */
	private Integer rows;
	/**
	 * 开始记录数据
	 */
	private Integer begin;
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getBegin() {
		begin = (page-1)*rows;
		return begin;
	}
	public void setBegin(Integer begin) {
		this.begin = (page-1)*rows;
	}
}

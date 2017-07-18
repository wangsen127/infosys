package com.infosys.sys.pojo;
/**
 * 
 * <p> Title: PageBean </p>
 * <p> Description: 分页POJO </p>
 * <p> Company: www.infosys.com </p>
 *
 * @author 王森
 * @date 2017年7月18日
 * @version 1.0
 */
public class PageBean {

	/**
	 * 当前页数
	 */
	private int page;
	/**
	 * 每页条数
	 */
	private int rows;
	/**
	 * 开始记录数据
	 */
	private int begin;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getBegin() {
		begin = (page-1)*rows;
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = (page-1)*rows;
	}
}

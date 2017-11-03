package com.infosys.sys.service;

import java.util.Map;

import com.infosys.sys.pojo.Position;

/**
 * 
 * <p> Title: PositionService </p>
 * <p> Description: 岗位Service接口 </p>
 * <p> Company: www.infosys.com </p>
 *
 * @author 王森
 * @date 2017年8月15日
 * @version 1.0
 */
public interface PositionService {

	public boolean savePosition(Position post) throws Exception;
	public boolean editPosition(Position post) throws Exception;
	public boolean delPosition(Integer[] ids) throws Exception;
	public Position getPosition(Integer postid) throws Exception;
	public Map<String, Object> queryPosition(Position post) throws Exception;
}

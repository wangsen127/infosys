package com.infosys.sys.dao;

import java.util.List;

import com.infosys.sys.pojo.Position;

/**
 * 
 * <p> Title: PositionDao </p>
 * <p> Description: 岗位Dao接口 </p>
 * <p> Company: www.infosys.com </p>
 *
 * @author 王森
 * @date 2017年8月4日
 * @version 1.0
 */
public interface PositionDao {

	public boolean insertPosition(Position post) throws Exception;
	public boolean updatePosition(Position post) throws Exception;
	public boolean deletePosition(Integer[] ids) throws Exception;
	public Position getPosition(Integer postid) throws Exception;
	public List<Position> queryPosition(Position post) throws Exception;
	public int queryPositionCount() throws Exception;
}

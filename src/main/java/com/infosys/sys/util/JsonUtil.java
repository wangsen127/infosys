package com.infosys.sys.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * 
 * <p> Title: JsonUtil </p>
 * <p> Description: Json工具类 </p>
 * <p> Company: www.infosys.com </p>
 *
 * @author 王森
 * @date 2017年7月18日
 * @version 1.0
 */
public class JsonUtil {

	private JsonUtil(){}
	
	public static Map<String, Object> renderJson(List data,Integer total){
		Map<String,Object> map = new HashMap<String, Object>();
		if(data != null)
			map.put("rows", data);
		if(total != null)
			map.put("total", total);
		
		return map;
	}
}

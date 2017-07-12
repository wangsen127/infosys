package com.infosys.sys.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

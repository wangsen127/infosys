package com.infosys.sys.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
/**
 * 
 * <p> Title: CustomDateSerializer </p>
 * <p> Description: java日期对象经过Jackson库转换成JSON日期格式化 </p>
 * <p> Company: www.infosys.com </p>
 *
 * @author 王森
 * @date 2017年7月18日
 * @version 1.0
 */
public class CustomDateSerializer extends JsonSerializer<Date> {  
	  
    @Override  
    public void serialize(Date value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonProcessingException {  
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
            String formattedDate = formatter.format(value);  
            jgen.writeString(formattedDate);  
    }  
}  

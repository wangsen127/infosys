package com.infosys.sys.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.format.Formatter;

public class DateFormatter implements Formatter<Date>{

	private SimpleDateFormat sdf;
	public DateFormatter(){
		sdf = new SimpleDateFormat("yyyy-MM-dd");
	}
	public DateFormatter(String pattern){
		sdf = new SimpleDateFormat(pattern);
	}
	@Override
	public String print(Date arg0, Locale arg1) {
		// TODO Auto-generated method stub
		return sdf.format(arg0);
	}

	@Override
	public Date parse(String arg0, Locale arg1) throws ParseException {
		// TODO Auto-generated method stub
		return sdf.parse(arg0);
	}
}

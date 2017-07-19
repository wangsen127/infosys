package infosys;

import org.junit.Test;

import com.infosys.sys.util.ConstantUtil;
import com.infosys.sys.util.MD5Util;

public class TestMD5 {

	@Test
	public void test(){
		System.out.println(MD5Util.toMD5(ConstantUtil.PASSWORD));
		System.out.println(MD5Util.toMD5("123"));
	}
}

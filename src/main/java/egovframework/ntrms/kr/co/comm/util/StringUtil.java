package egovframework.ntrms.kr.co.comm.util;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("unchecked")
public class StringUtil {
	
	public static List getIbatisIterate(String context, String name, String delim){
		List templist = new ArrayList();
		String[] tempLine = context.split(delim);
		for(int j=0;j<tempLine.length;j++){
			templist.add(tempLine[j]);
		}
		return templist;
	}
	 
    /**
     * @param value
     * @return ' ==> ''
     *
     */
    public static String escape(String value)
    {
        value = replace(value, "'", "''");

        return value;
    }
    
    public static String replace(String str, String pattern, String replace)
    {
        int s = 0;
        int e = 0;
        int patternLength = pattern.length();
        StringBuffer buf = new StringBuffer();

        while ((e = str.indexOf(pattern, s)) >= 0)
        {
            buf.append(str.substring(s, e));
            buf.append(replace);
            s = e + patternLength;
        }

        buf.append(str.substring(s));
        return buf.toString();
    }

    /**
     * Number Comma Replace
     * @param str
     * @return 
     */
    public static String getComma(String str) {
		String sj = str;

		try {
			if (str == null)
				return null;
			if (str.trim().equals(""))
				return "";
			if (str.indexOf(",") != -1)
				return str;
			if (sj.startsWith("0")) {
				for (int i = 0; i < str.length(); i++) {
					sj = str.substring(i);
					if (!sj.startsWith("0"))
						break;
				}
			}
			if (str.equals("0"))
				return "0";
			else {
				double nu = Double.parseDouble(sj);
				NumberFormat nf = NumberFormat.getInstance();
				String no = nf.format(nu);
				return no;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			return str;
		}
	}
    
    public static String convertHtmlBr(String comments) {
    	StringBuffer buffer = new StringBuffer();
    	
    	if (comments != null) {
			int lg = comments.length();
	
			for (int i = 0; i < lg; ++i) {
				String temp = comments.substring(i, i + 1);
	
				if ("\r".equals(temp)) {
					temp = comments.substring(++i, i + 1);
	
					if ("\n".equals(temp))
						buffer.append("<br>\r");
					else
						buffer.append("\r");
				}
	
				buffer.append(temp);
			}
    	}
		return buffer.toString();
	}
    
	public static String nvl(String value) {
		return (value == null ? "" : value.trim());
	}
	
	public static String nvl(String value, String returnValue) {
		return (value == null ? returnValue : value.trim());
	}
	
	public static String byteToString(byte[] value, int startIndex, int endIndex) {
		
		if(value.length >= startIndex + endIndex) {
			return new String(value, startIndex, endIndex);
		}
		return null;
	}
}
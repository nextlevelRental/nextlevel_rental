package egovframework.ntrms.kr.co.comm.util;

import java.beans.PropertyDescriptor;
import java.io.Reader;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.security.MessageDigest;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.Vector;

import org.apache.commons.lang.StringUtils;

import egovframework.ntrms.kr.co.brn.exception.NtRmsServiceException;
import oracle.sql.CLOB;
import sun.misc.BASE64Encoder;;

@SuppressWarnings("unchecked")
public class CommonUtil {
	
	/**
	 * Null 판단
	 * @param str
	 * @return
	 */
	public static String isNull(Object str){
		
		String rtnStr = "";
		String orgStr = "";
		try{
			
			orgStr = str.toString();
			
			if(StringUtils.isEmpty(orgStr)){
				rtnStr = "";
			}else{
				rtnStr = orgStr;
			}	
		}catch(Exception e){
			rtnStr = "";
		}
		
		return rtnStr;	
	}
	
	
	/**
	 * Null -> Space 
	 * @param str
	 * @return
	 */
	public static String Base64Encode(String str)
    {
        if (str == null)
        {
            return "";
        }
        else
        {
        	BASE64Encoder encoder = new BASE64Encoder();
        	byte[] b1 = str.getBytes();
            return encoder.encode(b1);
        }
    }
	
	
	public static String nullToSpace(String str)
	{
		if (str == null)
		{
			return "";
		}
		else
		{
			return str;
		}
	}
	
	public static String getValue(Object obj, String title) {
		String value = "";
		try {
			PropertyDescriptor propertyDesc;
			propertyDesc = org.springframework.beans.BeanUtils.getPropertyDescriptor(obj.getClass(), title);
			value = propertyDesc.getReadMethod().invoke(obj, new Object[0]).toString();
		} catch(Exception se) {
			value = "";
		}
		return value;
	}
	
	/**
	 * JQuery Tree getStringData
	 * @param Gubun
	 * @param list
	 * @return String
	 */
	public static String getTreeString(String Gubun, List<Object> list){
		StringBuffer sb = new StringBuffer("");

		int bfLevelCount = 1;
		int currLevelCount = 0;
		int iCount = 0;
		
		Iterator<Object> it = list.iterator();
		
		try{
			if(list.size() > 0 ){
				while(it.hasNext()){
					iCount++;
					
					Map bean = (HashMap)it.next();
					
					currLevelCount = ((BigDecimal)bean.get("LEVEL")).intValue();
					
					if(bfLevelCount == currLevelCount){
						if(iCount != 1) sb.append("}, \n ");
						sb.append(getTreeMenuString(Gubun, bean));
						
					}else if(bfLevelCount < currLevelCount){
						sb.append(", \n children: [ \n ");
						sb.append(getTreeMenuString(Gubun, bean));
						bfLevelCount = currLevelCount;
						
					}else if(bfLevelCount > currLevelCount){
						while(bfLevelCount != currLevelCount){
							sb.append("} \n ] ");
							bfLevelCount--;	 				
						}
						sb.append("}, \n ");
						sb.append(getTreeMenuString(Gubun, bean));
					}
				}
				while(1 != bfLevelCount){
					sb.append("} \n ] ");
					bfLevelCount--;
				}
				sb.append("} ");
			}
			return sb.toString();
		}catch(Exception e){
			e.printStackTrace();
			return "";
		}
	}
	
	// Create Zipcode Tree
	public static String getZipcodeTreeString(String Gubun, List<Object> list){
		StringBuffer sb = new StringBuffer("");
		
		Iterator<Object> it = list.iterator();
		
		int iCount = 0;
		
		try{
			if(list.size() > 0 ){
				while(it.hasNext()){				
					Map bean = (HashMap)it.next();
					
					if(iCount > 0){
						sb.append("},\n");
					}
					sb.append(getTreeZipcodeString(Gubun, bean));
					iCount++;
				}
				sb.append("} ");
			}
			return sb.toString();
		}catch(Exception e){
			e.printStackTrace();
			return "";
		}
	}
	
	public static String getTreeMenuString(String Gubun, Map bean){
		String tmp = "";
		tmp = "{parent_cd:'" + (String)bean.get("PARENT_CD")   
			+ "', parent_nm:'" + (String)bean.get("PARENT_NM")
			+ "', sort_cd:'" + (String)bean.get("SORT_CD")
			+ "', note:'" + (String)bean.get("NOTE")  
			+ "', use_yn:'" + (String)bean.get("USE_YN") + "'";
		if ("menu".equals(Gubun)) {
			tmp += ", menu_link:'" + (String)bean.get("MENU_LINK")  
				+ "', menu_image:'" + (String)bean.get("MENU_IMAGE")
				+ "', menu_note:'" + (String)bean.get("MENU_NOTE")
				+ "', title:'" + (String)bean.get("MENU_NM")
				+ "', key:'" + (String)bean.get("MENU_CD") + "'";
		}else{
			tmp = tmp + ", title:'" + (String)bean.get("CATEGORY_NM");
			if ( bean.get("MAIN_YN") != null && ((String)bean.get("MAIN_YN")).equals("1") ) {
				tmp = tmp + "[main]";
			}
			tmp = tmp +	"', related_category_cd:'" + (String)bean.get("RELATED_CATEGORY_CD")
				+ "', related_category_nm:'" + (String)bean.get("RELATED_CATEGORY_NM")
				+ "', category_sort_cd:'" + (String)bean.get("CATEGORY_SORT_CD")
				+ "', level:'" + bean.get("LEVEL")
				+ "', main_yn:'" + (String)bean.get("MAIN_YN")
				+ "', key:'" + (String)bean.get("CATEGORY_CD") + "'";
		}
		return tmp;
	}

	public static String getTreeZipcodeString(String Gubun, Map bean){
		String tmp = "";
		
		tmp = "{title:'" + (String)bean.get("TEXTNM") + "'," + "key:'" + (String)bean.get("VAL")+ "'"
			+ "," + "type:'" + Gubun + "', isFolder: true";

		return tmp;
	}
	
	
	
	
	/**
	 * Jquery Tree getVectorData
	 * @param Gubun
	 * @param bean
	 * @return List
	 */
	public static List getTreeVector(String Gubun, List list, int beforeLevelCount, String start_cd, int rowNum) {
    	
		Vector result = new Vector(); 	
		
		Map currBean = new HashMap();
		boolean isChild = false;
		
		for(int i=rowNum;i<list.size();i++){
			Map tempBean = (Map)list.get(i);
			
			String parent_cd = (String)tempBean.get("PARENT_CD");  // iRowNum : start point
			int currLevelCount = ((BigDecimal)tempBean.get("LEVEL")).intValue();
			
			if(start_cd.equals(parent_cd) && beforeLevelCount == currLevelCount){
				if(currBean.size() > 0){
					result.addElement(currBean);
					currBean = new HashMap();							
				}
				if(isChild) isChild = false;
				getTreeMenuMap(Gubun, tempBean, currBean);	
			}else{
				if(beforeLevelCount < currLevelCount && !isChild){
					currBean.put("children", (List)getTreeVector(Gubun, list, currLevelCount, parent_cd, i));
					isChild = true;
					if(currBean.size() > 0){
						result.addElement(currBean);
						currBean = new HashMap();							
					}							
				}else if(beforeLevelCount >= currLevelCount && !isChild){
					break;
				}
			}
		}
		if(currBean.size() > 0){
			result.addElement(currBean);
			currBean = new HashMap();							
		}
		return result;
	}
	
	/**
	 * Jquery Tree getVectorData
	 * @param Gubun
	 * @param bean
	 * @return List
	 */
	public static List getTreeVector(String Gubun, List list,int iRowNum,int bfLevelCount) {
    	
		Iterator<Object> it = list.iterator();	 
			
		Vector result = new Vector(); 	
		
		Map currBean = new HashMap();
		
		while(it.hasNext()){
			
			Map bean = (HashMap)it.next();
			int tempRowNum = ((BigDecimal)bean.get("ROWNUM")).intValue();
			
			if(iRowNum <= tempRowNum){
				
				int currLevelCount = ((BigDecimal)bean.get("LEVEL")).intValue();
				
				if(bfLevelCount < currLevelCount && currBean.size() > 0){
					currBean.put("children", (List)getTreeVector(Gubun, list, tempRowNum, currLevelCount));
					result.addElement(currBean);
					currBean = new HashMap();			
				}else if(bfLevelCount > currLevelCount && currBean.size() > 0  && iRowNum != 1){
					result.addElement(currBean);
					currBean = new HashMap();	
					return result;
				}else if(bfLevelCount == currLevelCount){
					if(currBean.size() > 0){
						result.addElement(currBean);
						currBean = new HashMap();							
					}
					getTreeMenuMap(Gubun, bean, currBean);
				}
				if(!it.hasNext() && currBean.size() > 0){
					result.addElement(currBean);
				}
			}
		}
		return result;
    }
	
	public static String getUserZipCodeStatusTree(List list) {
    	
		Iterator<Object> it = list.iterator();	 
			
		StringBuffer result = new StringBuffer();
			
		while(it.hasNext()){
			
			Map bean = (HashMap)it.next();					
			result.append((String)bean.get("VAL") + "^");
		}
		return result.toString();
    }
	
	public static void getTreeMenuMap(String Gubun, Map bean, Map currBean){
		if("menu".equals(Gubun)){
			currBean.put("menu_link", (String)bean.get("MENU_LINK"));
			currBean.put("menu_image", (String)bean.get("MENU_IMAGE"));
			currBean.put("menu_note", (String)bean.get("MENU_NOTE"));
			currBean.put("title", (String)bean.get("MENU_NM"));
			currBean.put("key", (String)bean.get("MENU_CD"));
		}else{
			if ( bean.get("MAIN_YN") != null && ((String)bean.get("MAIN_YN")).equals("1") ) {
				currBean.put("title", (String)bean.get("CATEGORY_NM") + "[main]");
			} else {
				currBean.put("title", (String)bean.get("CATEGORY_NM"));
			}
			
			currBean.put("level", ((BigDecimal)bean.get("LEVEL")).toString());
			currBean.put("key", (String)bean.get("CATEGORY_CD"));
			currBean.put("note", (String)bean.get("NOTE"));
			currBean.put("related_category_cd", (String)bean.get("RELATED_CATEGORY_CD"));
			currBean.put("related_category_nm", (String)bean.get("RELATED_CATEGORY_NM"));
			currBean.put("category_sort_cd", (String)bean.get("CATEGORY_SORT_CD"));
			currBean.put("main_yn", (String)bean.get("MAIN_YN"));
		}
		currBean.put("parent_cd", (String)bean.get("PARENT_CD"));
		currBean.put("parent_nm", (String)bean.get("PARENT_NM"));
		currBean.put("sort_cd", (String)bean.get("SORT_CD"));
		currBean.put("use_yn", (String)bean.get("USE_YN"));
		if("true".equals((String)bean.get("CHECKED"))){
			currBean.put("select", true);
		}
	}
	
	public static String getStringToListCombo(List list, String textName, String valueName)throws NtRmsServiceException{
		
		StringBuffer sb = new StringBuffer();
		
		Object obj = null;
		String tName = "";
		String vName = "";
		
		int listSize = list.size();
		
		try{			
			
			if(list.get(0) instanceof Map){
				Iterator iterator = list.iterator();
				while(iterator.hasNext()){
					Map bean = (HashMap)iterator.next();
			        if(bean.get(textName) instanceof Integer || bean.get(textName) instanceof BigDecimal){
			        	tName = bean.get(textName).toString();
			        }else{
			        	tName = (String)bean.get(textName);
			        }
			        if(bean.get(valueName) instanceof Integer || bean.get(valueName) instanceof BigDecimal){
			        	vName = bean.get(valueName).toString();
			        }else{
			        	vName = (String)bean.get(valueName);
			        }
			        sb.append(tName + "|" + vName + "^");
				}
			}else{
				for (int i = 0; i < listSize; i++) {
					
					obj = list.get(i);				
					// 객체의 모든 메소드를 가지고 온다.
					Method[] methods = obj.getClass().getMethods();
					
					for (int j = 0; j < methods.length; j++) {
						if(("get" + textName).equalsIgnoreCase(methods[j].getName().toLowerCase())){
							tName = (String)methods[j].invoke(obj, null);
						}
						if(("get" + valueName).equalsIgnoreCase(methods[j].getName().toLowerCase())){
							vName = (String)methods[j].invoke(obj, null);
						}
					}
					sb.append(tName + "|" + vName + "^");
				}	
			}
		}catch(Exception e){
			e.printStackTrace();
			throw new NtRmsServiceException("City Search Error");
		}
		
		return sb.toString();
	}
	
	// clob -> string
	public static String getStringCLOB(CLOB clob) throws NtRmsServiceException{
		
		Reader reader = null;

		try {

			reader = clob.getCharacterStream();
			StringBuffer out = new StringBuffer();
			char[] buff = new char[1024];

			int nchars = 0;
			while((nchars = reader.read(buff)) > 0)
				out.append(buff, 0, nchars);

			return out.toString();
		}catch(Exception e) {
			e.printStackTrace();
			throw new NtRmsServiceException("City Search Error");
		}finally {
			if(reader != null) {
				try {
					reader.close();
				}catch(Exception ee) {
				}
			}
		}
	}
	
	public static List getEbayMapToList(Map map)throws NtRmsServiceException{
		
		List list = new ArrayList();
    	Set entries = map.entrySet();
    	Iterator it = entries.iterator();
    	while (it.hasNext()){
    		Map bean = new HashMap();
    		Entry entry = (Entry) it.next();
    		Object key = entry.getKey();
    		Object value = entry.getValue();
    		bean.put("txt", key);
    		bean.put("val", value);
    		list.add(bean);
    	}
    	return list;
	}
	
	public static List getEbayStringsToList(String[] datas)throws NtRmsServiceException{
		
		List list = new ArrayList();
		
		if(datas == null)return list;
		
		for(int i=0;i<datas.length;i++){
			Map bean = new HashMap();
    		bean.put("txt", datas[i]);
    		bean.put("val", datas[i]);
    		list.add(bean);
		}
			
    	return list;
	}
	
	
	
	// Create Main Schedule
	public static String getMainSchedule(List<Object> list){
		
		StringBuffer sb = new StringBuffer("");
		Iterator<Object> it = list.iterator();
		
		int iCount = 0;
		
		try{
			if(list.size() > 0 ){
				while(it.hasNext()){				
					Map bean = (HashMap)it.next();
					
					if(iCount > 0){
						sb.append("},\n");
					}
					sb.append(getMainScheduleDetail(bean));
					iCount++;
				}
				sb.append("} ");
			}
			return sb.toString();
		}catch(Exception e){
			e.printStackTrace();
			return "";
		}
	}
	
	public static String getMainScheduleDetail(Map bean){
		String tmp = "";
		tmp = "{id:'" + bean.get("ACTIVITY_SEQ") + "'"
			+ ", title: '" + (String)bean.get("SUBJECT_TEXT") + "'"
			+ ", type: '" + (String)bean.get("ACTIVITY_TYPE") + "'"
			+ ", start:new Date(" + (String)bean.get("START_YYYY") + "," + (String)bean.get("START_DD") + "," + (String)bean.get("START_MM") + 
			"," + (String)bean.get("START_M") + "," + (String)bean.get("START_S") + ")";
		if (bean.get("END_YYYY") != null && !"".equals(bean.get("END_YYYY"))) {
			tmp += ", end: new Date(" + (String)bean.get("END_YYYY") + "," + (String)bean.get("END_DD") + "," + (String)bean.get("END_MM") +
			"," + (String)bean.get("END_M") + "," + (String)bean.get("END_S") + ")";
		}
		tmp += ", allDay: false ";
		return tmp;
	}
	

	public static List getScheduleVector(List list) {
    	
		Iterator<Object> it = list.iterator();	 
			
		List resultList = new ArrayList();
		
		while(it.hasNext()){
			
			Map bean = (HashMap)it.next();
			Map currBean = new HashMap();
						
			currBean.put("id", bean.get("ACTIVITY_SEQ"));
			currBean.put("title", (String)bean.get("SUBJECT_TEXT"));
			currBean.put("start", (String)bean.get("START_DT"));
			if (bean.get("END_DT") != null && !"".equals(bean.get("END_DT"))) {
				currBean.put("end", (String)bean.get("END_DT"));
			}
			currBean.put("allDay", false);			
			currBean.put("type", (String)bean.get("ACTIVITY_TYPE"));			
			resultList.add(currBean);
		}
		return resultList;
    }
		
	public static String getUSNumber(double price) throws NtRmsServiceException{
		NumberFormat nf = NumberFormat.getCurrencyInstance(Locale.US);
		nf.setMaximumFractionDigits(2);
		return nf.format(price);
	}
	
	private static String makeBodyContext(String context, Map fillData) throws NtRmsServiceException{
		
		Set entries = fillData.entrySet();
    	Iterator it = entries.iterator();
    	while (it.hasNext()){
    		Entry entry = (Entry) it.next();
    		String key = (String)entry.getKey();
    		String value = (String)entry.getValue();
    		context = StringUtil.replace(context, '#' + key + '#', value);
    	}
				
		return context;
	}
	
	public static String convertMd5(String str) throws Exception {
		byte[] digest = MessageDigest.getInstance("md5").digest(str.getBytes());
		StringBuffer s = new StringBuffer();
		for (int i = 0; i < digest.length; i++) {
			s.append(Integer.toString((digest[i] & 0xf0) >> 4, 16));
			s.append(Integer.toString(digest[i] & 0x0f, 16));
		}
		return s.toString();
	}
	
	
	/**
	 *
	 * VO값을 Map으로 변환한다.
	 * <pre>
	 * 	EX>
	 * 		VOUtil.mapBind(VO)
	 * 		VO 멤버변수명들이 키가 되며, 해당 getter가 값이 된다.
	 * </pre>
	 *
	 * @param obj - 값을 가진 VO
	 * @return map - VO의 값을 <k,v>타입의 Map으로 변경
	 */
	public static Object mapBind(Map obj)
	{
		Map map = new HashMap();
		if (obj == null) return map;
		Field[] fields = obj.getClass().getDeclaredFields();
		
		for(Field field : fields)
		{
			try {
				field.setAccessible(true);
				if(field.get(obj) == null) 
					map.put(field.getName(), "");
				else 
					map.put(field.getName(), field.get(obj));
			} catch (Exception e) {
				
			}
		}
		return map;
	}

	
	/**
	 *
	 * tag로 변환
	 * <pre>
	 * 	EX>
	 * 		VOUtil.mapBind(VO)
	 * 		VO 멤버변수명들이 키가 되며, 해당 getter가 값이 된다.
	 * </pre>
	 *
	 * @param obj - 값을 가진 VO
	 * @return map - VO의 값을 <k,v>타입의 Map으로 변경
	 */	
	public String unscript(String data) {
	    if (data == null || data.trim().equals("")) {
	        return "";
	    }
	    String ret = data;
	    
	    ret = ret.replaceAll("&lt;", "<");
	    ret = ret.replaceAll("&gt;", ">");
	    ret = ret.replaceAll("&quot;", "'");
	    
	    ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "<script");
	    ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "<script");
	    ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "</script");
		ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "<object");
	    ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "</object");
	    ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "<applet");
	    ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "</applet");
	    ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "<embed");
	    ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "<embed");
	    ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "<form");
	    ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "<form");
	    return ret;
	}
	

	
}
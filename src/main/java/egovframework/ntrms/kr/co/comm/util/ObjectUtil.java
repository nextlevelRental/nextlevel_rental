package egovframework.ntrms.kr.co.comm.util;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.MutablePropertyValues;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.support.RequestContextUtils;


/**
 * Object Utils
 * @author eniac
 */
@SuppressWarnings("unchecked")
public class ObjectUtil {

	public ObjectUtil() {
		super();
	}

	public static Map getParameterMap(HttpServletRequest request)throws Exception {
		return getParameterMap(request, null, true);
	}

	/**
	 * OBJ <-- session (User)
	 * @param request
	 * @param obj
	 * @return
	 */
	public static Map getParameterMap(HttpServletRequest request, Object obj) throws Exception{
		return getParameterMap(request, obj, true);
	}

	@SuppressWarnings("deprecation")
	public static Map getParameterMap(HttpServletRequest request, Object obj, boolean containAttribute)throws Exception {

		Map paramMap = new HashMap();
		WebApplicationContext context = null;

		Enumeration e = request.getSession().getAttributeNames();
		while (e.hasMoreElements()) {
			try{
				String key = (String) e.nextElement();
				if("User".equals(key) || "categoryListingType".equalsIgnoreCase(key)
						|| "store_category".equalsIgnoreCase(key)|| "Config".equalsIgnoreCase(key)){
					if(obj != null){
						DomainBinderUtil binder = new DomainBinderUtil(obj);
						MutablePropertyValues mpvs = new MutablePropertyValues();
						mpvs.addPropertyValue(key.toLowerCase(), request.getSession().getValue(key));
						binder.doBind(mpvs);
					}
					paramMap.put(key, request.getSession().getValue(key));
				}
			}catch(Exception ei){
				ei.printStackTrace();
			}
		}

		// Grid Used according to the presence or absence of branching
		//if(null != request.getParameter("mode")){
		

			e = request.getParameterNames();
			while (e.hasMoreElements()) {
				String key = (String) e.nextElement();
				String[] values = request.getParameterValues(key);
				if (values.length == 1) {
					paramMap.put(key, values[0].trim());
				} else {
					paramMap.put(key, values);
				}
			}

			if (containAttribute) {
				e = request.getAttributeNames();
				while (e.hasMoreElements()) {
					String key = (String) e.nextElement();
					paramMap.put(key, request.getAttribute(key));
				}
			}

			MultipartHttpServletRequest mpRequest = null;
			if (request instanceof MultipartHttpServletRequest) {
				mpRequest = (MultipartHttpServletRequest) request;
				Iterator iter = mpRequest.getFileNames();
				while (iter.hasNext()) {
					String key = (String) iter.next();
					MultipartFile file = mpRequest.getFile(key);
					if (file.getSize() > 0) {
						paramMap.put(key, file);
					}
				}
			}


		//Top title, Left menu setting
		if(paramMap.get("cur_parent_cd") != null && paramMap.get("cur_menu_cd") != null){
			request.getSession().setAttribute("cur_menu_cd", paramMap.get("cur_menu_cd"));
			request.getSession().setAttribute("cur_parent_cd", paramMap.get("cur_parent_cd"));
			request.getSession().setAttribute("cur_parent_nm", MenuUtil.getParent_nm((List)request.getSession().getAttribute("MenuList"), (String)paramMap.get("cur_parent_cd")));
			request.getSession().setAttribute("cur_menu_nm", MenuUtil.getMenu_nm((List)request.getSession().getAttribute("MenuList"), (String)paramMap.get("cur_menu_cd")));
			request.getSession().setAttribute("cur_menu_navi", MenuUtil.getMenu_navi((List)request.getSession().getAttribute("MenuList"), (String)paramMap.get("cur_menu_cd")));
		}

		// required setting
		if(paramMap.get("currPage") == null || paramMap.get("currPage").equals("") || paramMap.get("currPage").equals("undefined"))
			paramMap.put("currPage", "1");
		if(paramMap.get("pageLine") == null || paramMap.get("pageLine").equals("") || paramMap.get("pageLine").equals("undefined"))
			paramMap.put("pageLine", "10");

		// Local Vs Server
		context = RequestContextUtils.getWebApplicationContext(request);
		String realPath = context.getServletContext().getRealPath("");
		paramMap.put("realPath", realPath);
		String server_name = request.getServerName();

//		System.out.println("realPath=[" + realPath + "]");

		if("df.hgrinc.com".equals(server_name)){
			paramMap.put("serverType", "real");
		}else if("erp.yesc.co.kr".equals(server_name)){
			paramMap.put("serverType", "test");
		}else{
			paramMap.put("serverType", "local");
		}

		return paramMap;
	}

	public static String toStrTrim(Object obj) {
		if (obj == null) {
			return "";
		}

		return String.valueOf(obj).trim();
	}

	/**
	 * request ---> file list
	 * @param request
	 * @return
	 */
	public static Map getFileList(HttpServletRequest request){

		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;

		Map<String, MultipartFile> files = multiRequest.getFileMap();

		return files;

	}
	
	/**
	 * Convert Objects to Map
	 * @param fromObj
	 * @param sUpperDiv
	 * @return
	 */
	public static List<Map> getListToList(List objs, String sUpperDiv){
		
		List<Map> resultList = new ArrayList();
		for(int i=0; i<objs.size(); i++){
			resultList.add(getObjectToMap(objs.get(i), null));
		}
		
		return resultList;
	}
	
	/**
	 * Convert Object to Map
	 * @param fromObj
	 * @param sUpperDiv
	 * @return
	 */
	public static Map<String, Object> getObjectToMap(Object obj, String sUpperDiv){
		
		java.lang.reflect.Field[] fields = obj.getClass().getDeclaredFields();
		Map<String, Object> map = new HashMap<String, Object>();
		for(int i=0 ; i < fields.length ; i++ ) {
			// private 변수에 접근 허용
			fields[i].setAccessible(true);
			try {
				// 변수 명을 key로 value 저장.
				String sKey = fields[i].getName();
				if(sUpperDiv != null)
					sKey = (fields[i].getName()).toUpperCase();
				
				map.put(sKey, fields[i].get(obj));
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		
		return map;
	}
	
	/**
	 * Convert Object to List<Map>
	 * @param fromObj
	 * @param sUpperDiv
	 * @return
	 */
	public static List<Map> getObjectToList(Object obj, String sUpperDiv){
		
		
		List<Map> resultList = new ArrayList<Map>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		java.lang.reflect.Field[] fields = obj.getClass().getDeclaredFields();
		
		for(int i=0 ; i < fields.length ; i++ ) {
			// private 변수에 접근 허용
			fields[i].setAccessible(true);
			try {
				// 변수 명을 key로 value 저장.
				String sKey = fields[i].getName();
				if(sUpperDiv != null)
					sKey = (fields[i].getName()).toUpperCase();
				
				map.put(sKey, fields[i].get(obj));
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		resultList.add(map);
		
		return resultList;
	}
	
	
}
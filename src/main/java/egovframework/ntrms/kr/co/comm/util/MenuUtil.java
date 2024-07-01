package egovframework.ntrms.kr.co.comm.util;

import java.util.Iterator;
import java.util.List;

import org.springframework.context.annotation.Scope;

import egovframework.com.nexa.common.domain.LoginMenu;

@Scope("session")
@SuppressWarnings("unchecked")
public class MenuUtil { 
	
	public MenuUtil() {}
	
	protected static List<Object> menuList = null;
	protected static LoginMenu menu = null;
	String highest_cd = "";
	String beforeHigh_cd = "";
	
	// Create Menu Treexdcfd
	public String getMenuString(List<Object> list){
		StringBuffer sb = new StringBuffer("");
		
		int level = 0;//Present Level
		int nlevel = 2;//Next Level
		int plevel = 0;//Parent Level
		int loop = 1;//Looping count
		boolean end = false;//Last check
		boolean child = false;//child check
	
		LoginMenu nmenu = null;
		
		menuList = list;
		Iterator<Object> it = list.iterator();
		
		try{
			if(list.size() > 0 ){
				while(end || it.hasNext()){
					
					if(loop == 1){
						menu = (LoginMenu)it.next();
					}
					loop++;
					
					if(it.hasNext()){
						nmenu = (LoginMenu)it.next();
						nlevel = new Integer(nmenu.getMenu_level()).intValue();
					}
					
					level = new Integer(menu.getMenu_level()).intValue();
					
					if(level ==1){
						//Total First
						//sb.append("	<span id=").append(menu.getMenu_cd()).append( " = '").append(menu.getMenu_nm()).append("';\n");
						sb.append("<div id='div_menu").append(menu.getMenu_cd()).append("' style='display:none;position:absolute;left:11px;'>\n");
						sb.append("<ul id='menu").append(menu.getMenu_cd()).append("' class='menu noaccordion expand'>\n");
						
						highest_cd = menu.getMenu_cd();
						
					}
					
					if(level >= 2 ){
						
						if(level < nlevel){// ascending level
							sb.append("<li>\n");
						}						
						
						sb.append(getTreeMenuString(menu));
						
						if(level < nlevel){// ascending level
							if(new Integer(nmenu.getMenu_level()).intValue() != 2){//Child
								sb.append("<ul>\n");
								plevel = level;
								child = true;
							}
						}else if(level == nlevel && !end){// same level
						}else{//descending level
							if(child){
								sb.append("</ul>\n");
								sb.append("</li>\n");
								child = false;
							}
						}
					}
					
					//Total End
					if(nlevel == 1){
						sb.append("</ul>\n");
						sb.append("</div>\n");
					}
					
					if(loop > list.size() && end){
						if(end){
							sb.append("</ul>\n");
							sb.append("</div>\n\n");							
						}
						break;
					}		
					
					if(loop == list.size()){
						end = true;
					}					
					
					menu = nmenu;
					
				}
			}
			return sb.toString();
		}catch(Exception e){
			e.printStackTrace();
			return "";
		}
	}
	
	public String getTreeMenuString(LoginMenu menu){
		StringBuffer sb = new StringBuffer();
		if(menu.getMenu_link() == null) {
			sb.append("<a href='#'>").append(menu.getMenu_nm()).append("</a>\n");
		}else{
			sb.append("<li>").append("" + getUrl(menu.getMenu_link(), menu.getMenu_nm(), menu.getMenu_cd(), menu.getMenu_navi())).append("</li>\n");
		}
		return sb.toString();
	}
	
	private String getUrl(String url, String menu_nm, String menu_cd, String menu_navi){
		
		StringBuffer sb = new StringBuffer("");
		StringBuffer recordSb = new StringBuffer("");
		
		if (url == null){
			url = "";
			return url;
		}

		sb.append("<a href=\"javascript:fillNavi('");

		if(-1 < url.indexOf("?")){
			sb.append(url).append("&cur_parent_cd=").append(highest_cd).append("&cur_menu_cd=").append(menu_cd);
			recordSb.append(url).append("&cur_parent_cd=").append(highest_cd).append("&cur_menu_cd=").append(menu_cd);
		}else{
			sb.append(url).append("?cur_parent_cd=").append(highest_cd).append("&cur_menu_cd=").append(menu_cd);
			recordSb.append(url).append("?cur_parent_cd=").append(highest_cd).append("&cur_menu_cd=").append(menu_cd);
		}
		
		sb.append("','").append(menu_navi).append("','").append(menu_nm).append("','").append(menu_cd).append("');\">").append(menu_nm).append("</a>");
		recordSb.append("^").append(menu_navi).append("^").append(menu_nm);
		
		if(!beforeHigh_cd.equals(highest_cd)){
			beforeHigh_cd = highest_cd;
			sb.append("<input type='hidden' name='" + beforeHigh_cd + "' id='" + beforeHigh_cd + "' value='" + recordSb.toString() + "' />");
		}
		sb.append("<input type='hidden' name='" + menu_cd + "' id='" + menu_cd + "' value='" + recordSb.toString() + "' />");

		return sb.toString();

	}
	
	public static String getParent_nm(List list, String menu_cd){
		Iterator<Object> it = list.iterator();
		String parent_nm = null;
			while(it.hasNext()){
				menu = (LoginMenu)it.next();
				if(menu_cd.equals(menu.getMenu_cd())){
					parent_nm = menu.getMenu_nm();
					break;
				}
			}
		
		return parent_nm;
	}
	
	public static String getMenu_nm(List list, String menu_cd){
		Iterator<Object> it = list.iterator();
		String menu_nm = null;
			while(it.hasNext()){
				menu = (LoginMenu)it.next();
				if(menu_cd.equals(menu.getMenu_cd())){
					menu_nm = menu.getMenu_nm();
					break;
				}
			}
		
		return menu_nm;
	}
	
	public static String getMenu_navi(List list, String menu_cd){
		Iterator<Object> it = list.iterator();
		String menu_navi = null;
		while(it.hasNext()){
			menu = (LoginMenu)it.next();
			if(menu_cd.equals(menu.getMenu_cd())){
				menu_navi = menu.getMenu_navi();
				break;
			}
		}
		
		return menu_navi;
	}
	
	public static int getMenu_auth(String menu_cd){
		Iterator<Object> it = menuList.iterator();
		int menu_auth = 0;
		while(it.hasNext()){
			menu = (LoginMenu)it.next();
			if(menu_cd.equals(menu.getMenu_cd())){
				try{
					menu_auth = Integer.parseInt(menu.getMenu_auth());
				}catch(NumberFormatException e){
					menu_auth = 0;
				}
				break;
			}
		}
		
		return menu_auth;
	}
	
	public static int getMenu_auth(List list, String menu_cd){
		if("99".equals(menu_cd)) return 2;
		Iterator<Object> it = list.iterator();
		int menu_auth = 0;
		while(it.hasNext()){
			menu = (LoginMenu)it.next();
			if(menu_cd != null && menu.getMenu_cd() != null){
				if(menu_cd.equals(menu.getMenu_cd())){
					try{
						menu_auth = Integer.parseInt(menu.getMenu_auth());
					}catch(NumberFormatException e){
						menu_auth = 0;
					}
					break;
				}
			}else{
				menu_auth = 0;
				break;
			}
		}
		
		return menu_auth;
	}

}
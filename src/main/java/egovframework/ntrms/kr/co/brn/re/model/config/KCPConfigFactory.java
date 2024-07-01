package egovframework.ntrms.kr.co.brn.re.model.config;

import javax.servlet.http.HttpServletRequest;

import egovframework.ntrms.kr.co.brn.re.model.RTREEnums.ModeType;

/**
 * TODO 설명을 작성하세요
 * 
 * @author 강신규
 * @since 2019. 2. 27. 오전 11:08:15
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2019. 2. 27. / 강신규 : 최초생성
 * </pre>
 */
public class KCPConfigFactory {
	public static KCPConfig getConfig(ModeType modeType) {
		KCPConfig result = new LOCALKCPConfig();
		
		switch(modeType) {
			case PROD:
				result = new PRODKCPConfig();
				break;
			case DEV:
				result = new DEVKCPConfig();
				break;
			default:
				break;
		}
		
		return result;
	}
	
	public static KCPConfig getConfig(String mode) {
		return getConfig(ModeType.get(mode));
	}
	
	public static KCPConfig getConfigByUrl(String reqUrl) {
		ModeType modeType = ModeType.UnKnown;
		
		if(reqUrl != null) {
			/* 아래 룰은 확인해 주세요!!! */
			if(reqUrl.indexOf("172.17.0.135") != -1 || reqUrl.indexOf("1.254.67.135") != -1) {
				modeType = ModeType.DEV;
			} else if(reqUrl.indexOf("localhost") != -1 || reqUrl.indexOf("127.0.0.1") != -1) {
				modeType = ModeType.LOCAL;
			} else {
				modeType = ModeType.PROD;
			}
		}
		
		return getConfig(modeType);
	}
	public static KCPConfig getConfig(HttpServletRequest request) {
		if(request != null) {
			return getConfigByUrl(request.getRequestURL().toString());
		}
		
		return getConfig(ModeType.UnKnown);
	}
}
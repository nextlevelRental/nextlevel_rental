package egovframework.ntrms.kr.co.comm.api;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.comm.util.HttpConnectForGet;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 택배API연동을 위한 클래스
 * @author kstka
 * @version 1.0
 * @since 2022. 12. 22.
 */
@Service
public class LogisticApi {
	
	private String rootUrl = null;
	private String subUrl = null;
	
	private Map<String, Object> settingMap;
	private Map<String, Object> paramMap;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/**
	 * HTTP연결을 위한 초기 세팅
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 12. 22.
	 */
	public void init(){
		
		//스마트택배 서버 주소
		rootUrl = propertiesService.getString("smartbox.interface.root.url");
		subUrl = propertiesService.getString("smartbox.interface.tracking.url");
		
		LogisticsVO vo = LogisticsVO.builder()
				.timeout(0)
				.method("GET")
				.sendUrl(rootUrl + subUrl)
				.build();
		
		//파라미터 세팅			
		settingMap = vo.getSettingMap();
	}
	
	/**
	 * 택배 API연동을 위한 value값 세팅
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 12. 22.
	 */
	public void setValue(String t_code, String t_invoice, String t_key){

		LogisticsVO vo = LogisticsVO.builder()
				.t_code(t_code)
				.t_invoice(t_invoice)
				.t_key(t_key)
				.build();
		
		paramMap = vo.getParamMap();
	}
	
	/**
	 * HTTP연결 함수
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 12. 22.
	 */
	public Map connect(){
		
		HttpConnectForGet connectUtil = null;
		Map<String, Object> resultMap = null;
		try {
			
			connectUtil = new HttpConnectForGet();
			resultMap = connectUtil.connect(String.valueOf(settingMap.get("sendUrl")), settingMap, paramMap);
			
		} catch (Exception e) {
			// TODO: handle exception
			new Exception(e.getMessage());
		}
		
		return resultMap;
	}
}

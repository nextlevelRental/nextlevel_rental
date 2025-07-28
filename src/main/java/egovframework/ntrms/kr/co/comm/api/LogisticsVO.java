package egovframework.ntrms.kr.co.comm.api;

import java.util.HashMap;
import java.util.Map;

/**
 * 택배API를 위한 VO
 * @author kstka
 * @version 1.0
 * @since 2022. 12. 22.
 */
public class LogisticsVO {
	
	private int timeout = 0;
	private String method = null;
	private String sendUrl = null;
	private String t_key = null;
	private String t_code = null;
	private String t_invoice = null;
	
	private Map<String, Object> settingMap;
	private Map<String, Object> paramMap;
	
	public LogisticsVO(int timeout, String method, String sendUrl, String t_key, String t_code, String t_invoice){
		this.timeout = timeout;
		this.method = method;
		this.sendUrl = sendUrl;
		this.t_key = t_key;
		this.t_code = t_code;
		this.t_invoice = t_invoice;
	}
	
	/**
	 * HTTP연결을 위한 파라미터 세팅
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 12. 22.
	 */
	public Map<String, Object> getSettingMap(){
		//파라미터 세팅			
		settingMap = new HashMap<>();
		settingMap.put("timeout", this.timeout);
		settingMap.put("method", this.method);
		settingMap.put("sendUrl", this.sendUrl);
		return this.settingMap;
	}
	
	/**
	 * 택배 API연동을 위한 파라미터 세팅
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 12. 22.
	 */
	public Map<String, Object> getParamMap(){
		//파라미터 세팅			
		paramMap = new HashMap<>();
		paramMap.put("t_key", this.t_key);
		paramMap.put("t_code", this.t_code);
		paramMap.put("t_invoice", this.t_invoice);
		return this.paramMap;
	}
	
	/**
	 * call builder
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 12. 22.
	 */
	public static LogisticsVO.LogisticsVOMember builder(){
		return new LogisticsVOMember();
	}
	
	/**
	 * set member
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 12. 22.
	 */
	public  static class LogisticsVOMember{
		
		private int timeout = 0;
		private String method = null;
		private String sendUrl = null;
		private String t_key = null;
		private String t_code = null;
		private String t_invoice = null;
		
		LogisticsVOMember() {
		}
		
		public LogisticsVO.LogisticsVOMember timeout(int timeout){
			this.timeout = timeout;
			return this;
		}
		
		public LogisticsVO.LogisticsVOMember method(String method){
			this.method = method;
			return this;
		}
		
		public LogisticsVO.LogisticsVOMember sendUrl(String sendUrl){
			this.sendUrl = sendUrl;
			return this;
		}
		
		public LogisticsVO.LogisticsVOMember t_key(String t_key){
			this.t_key = t_key;
			return this;
		}
		
		public LogisticsVO.LogisticsVOMember t_code(String t_code){
			this.t_code = t_code;
			return this;
		}
		
		public LogisticsVO.LogisticsVOMember t_invoice(String t_invoice){
			this.t_invoice = t_invoice;
			return this;
		}
		
		public LogisticsVO build(){
			return new LogisticsVO(timeout, method, sendUrl, t_key, t_code, t_invoice);
		}
	}
	
	@Override
	public String toString() {
		return "LogisticsVO [timeout=" + timeout + ", method=" + method + ", sendUrl=" + sendUrl + ", t_key=" + t_key
				+ ", t_code=" + t_code + ", t_invoice=" + t_invoice + ", settingMap=" + settingMap + ", paramMap="
				+ paramMap + "]";
	}
}

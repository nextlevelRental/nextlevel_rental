package egovframework.ntrms.kr.co.brn.re.model.config;

/**
 * 
 * 
 * @author 강신규
 * @since 2019. 2. 27. 오전 10:56:41
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2019. 2. 27. / 강신규 : 최초생성
 * </pre>
 */
public abstract class KCPConfig {
	private String modeType	= "";
	private String logDir	= "C:\\logs\\kcp";
	//private String url		= "testpaygw.kcp.co.kr";
	private String url		= "paygw.kcp.co.kr";
	private String port		= "8090";
	private String logLevel	= "3";
	private int txMode		= 0;
	private String siteCd	= "T0000";
	private String siteKey	= "3grptw1.zW0GSo4PQdaGvsF__";
	
	public String getModeType() {
		return modeType;
	}
	public String getLogDir() {
		return logDir;
	}
	public String getUrl() {
		return url;
	}
	public String getPort() {
		return port;
	}
	public String getLogLevel() {
		return logLevel;
	}
	public int getTxMode() {
		return txMode;
	}
	public String getSiteCd() {
		return siteCd;
	}
	public String getSiteKey() {
		return siteKey;
	}
	
	protected void setModeType(String modeType) {
		this.modeType = modeType;
	}
	protected void setLogDir(String logDir) {
		this.logDir = logDir;
	}
	protected void setUrl(String url) {
		this.url = url;
	}
	protected void setPort(String port) {
		this.port = port;
	}
	protected void setLogLevel(String logLevel) {
		this.logLevel = logLevel;
	}
	protected void setTxMode(int txMode) {
		this.txMode = txMode;
	}
	protected void setSiteCd(String siteCd) {
		this.siteCd = siteCd;
	}
	protected void setSiteKey(String siteKey) {
		this.siteKey = siteKey;
	}
}
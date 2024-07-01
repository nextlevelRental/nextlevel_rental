package egovframework.ntrms.kr.co.brn.jco;

import java.util.Properties;

import com.sap.conn.jco.ext.DestinationDataEventListener;
import com.sap.conn.jco.ext.DestinationDataProvider;

/**
 * 넥센 SAP 연결 provider.
 */
public class DestinationDataProviderToNexen implements DestinationDataProvider {
	
	/** 접속정보 */
	private static final Properties props = new Properties();
	static {
		// 설정 파일 로드
		try {
			props.load(DestinationDataProviderToNexen.class.getResourceAsStream("jco.properties"));
		}
		catch( Exception e ) {
			e.printStackTrace();
		}
	}
	/**
	 * 생성자.
	 */
	public DestinationDataProviderToNexen() {
	}

	public Properties getDestinationProperties(String destinationName) {
		return props;
	}

	public void setDestinationDataEventListener(DestinationDataEventListener eventListener) {
	}

	public boolean supportsEvents() {
		return false;
	}

}
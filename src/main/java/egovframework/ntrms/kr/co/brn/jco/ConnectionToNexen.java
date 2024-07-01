package egovframework.ntrms.kr.co.brn.jco;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import com.sap.conn.jco.JCoContext;
import com.sap.conn.jco.JCoDestination;
import com.sap.conn.jco.JCoDestinationManager;
import com.sap.conn.jco.JCoException;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoRepository;
import com.sap.conn.jco.ext.Environment;

/**
 * 넥센타이어 SAP 과의 연결관리.
 * 
 * @author hypky
 *
 */
@Service
public class ConnectionToNexen {
    
	/** */
	private JCoRepository repos;
	
	/** */
	private JCoDestination dest;
	
	/** 로거 */
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	static {
		try {
			//logger = Logger.getLogger(ConnectionToNexen.class);	// 로거 생성
			
			if( Environment.isDestinationDataProviderRegistered() ) {
				//logger.debug("이미 등록되어 있습니다.");
			}
			else {
				DestinationDataProviderToNexen provider = new DestinationDataProviderToNexen();
				Environment.registerDestinationDataProvider(provider);
			}
		}
		catch( Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 생성자.
	 */
	public ConnectionToNexen() {
		DestinationDataProviderToNexen provider = new DestinationDataProviderToNexen();

		try {
			dest	= JCoDestinationManager.getDestination("SAP_SERVER_NEXEN");
			repos	= dest.getRepository();
		}
		catch( JCoException e ) {
			throw new RuntimeException(e);
		}

	}
	

	/**
	 * Method getFunction read a SAP Function and return it to the caller. The
	 * caller can then set parameters (import, export, tables) on this function
	 * and call later the method execute.
	 * 
	 * getFunction translates the JCo checked exceptions into a non-checked
	 * exceptions
	 */
	public JCoFunction getFunction(String functionStr) {
		JCoFunction function = null;
		try {
			function = repos.getFunction(functionStr);
		}
		catch( Exception e ) {
			e.printStackTrace();
			throw new RuntimeException("Problem retrieving JCO.Function object.");
		}
		if( function == null ) {
			throw new RuntimeException("Not possible to receive function. ");
		}

		return function;
	}

	/**
	 * Method execute will call a function. The Caller of this function has
	 * already set all required parameters of the function
	 * 
	 */
	public void execute(JCoFunction function) {
		try {
			JCoContext.begin(dest);
			function.execute(dest);

		}
		catch( JCoException e ) {
			e.printStackTrace();
		}
		finally {
			try {
				JCoContext.end(dest);
			}
			catch( JCoException e ) {
				e.printStackTrace();
			}
		}
	}

}
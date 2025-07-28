package egovframework.ntrms.kr.co.brn.exception;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 
 *<pre>
 *<b>사용자정의 Exception 클래스</b>
 *설명:
 *</pre>
 *
 * @author   kstka
 * @since     2024. 1. 25.
 * @version  1.0
 * @see
 */
public class NtRmsUserDefineException extends NtRmsException {
	
	private static final long serialVersionUID = -1121094779090553561L;
	
	protected static final Log logger = LogFactory.getLog(NtRmsUserDefineException.class);
	
    private static final String LOG_LABEL = "[ERROR]";
    
	private String code = null;
	private String message = null;
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public NtRmsUserDefineException() {
		super();		
	}

	public NtRmsUserDefineException(String code, String message, Throwable cause) {
		
		this.code = code;
		this.message = message;
		
		new NtRmsUserDefineException( message, cause );
	}
	
	public NtRmsUserDefineException(String code, String message, Object[] parameter, Throwable cause) {
		
		this.code = code;
		this.message = message;
		
		if( message == null ) {
			message = getDefinedMessage( code, parameter );
		}
		
		logger.error( String.format( "{0} code:{1}, message:{2}, error message:{3}" , LOG_LABEL , code , message, cause.toString() ) );
		
		new NtRmsUserDefineException( message, cause );
	}
	
	public NtRmsUserDefineException(String message, Throwable cause) {
		super( message , cause );
	}

	public NtRmsUserDefineException(String message) {
		super( message );
	}

	public NtRmsUserDefineException(Throwable cause) {
		super( cause );
	}
	
}
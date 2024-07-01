/**************************************************************************************
 * nexacro SAMPLE SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.프로그램명  	: NexaServiceException
 * 2.파일명		: NexaServiceException.java
 * 3.개발자		: sian
 * 4.개발일자		: 2014.09.06 
 * 5.버젼		: 0.1
 * 6.설명		: NexaServiceException 발생시 공통 처리 부분
 * 7.이력		 
*************************************************************************************/
package egovframework.ntrms.kr.co.brn.exception;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * <pre>
 * <b>변경이력 (Modification Information)</b>
 * 1.0, 2024. 1. 24., kstka, 최초작성
 * </pre>
 *
 * @author   kstka
 * @since     2024. 1. 24.
 * @version  1.0
 * @see
 */
public class NtRmsServiceException extends NtRmsException {

	private static final long serialVersionUID = 6557749074552618868L;
	
	protected static final Log logger = LogFactory.getLog(NtRmsServiceException.class);
	
	private static final String LOG_LABEL = "[SERVICE ERROR]";
	
	public NtRmsServiceException() {
		super();		
	}

	public NtRmsServiceException(String message, Throwable cause) {
		super( getMessage(message) , cause );
	}

	public NtRmsServiceException(String message) {
		super( getMessage(message) );
	}

	public NtRmsServiceException(Throwable cause) {
		super( cause );
	}

	private static String getMessage(String message){
		return String.format( "{0} {1} " , LOG_LABEL, message );
	}
}
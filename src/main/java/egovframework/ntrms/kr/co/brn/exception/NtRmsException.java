/**
 * 
 */
package egovframework.ntrms.kr.co.brn.exception;

import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.context.MessageSource;

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
public abstract class NtRmsException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	
	@Resource(name="messageSource")
	MessageSource messageSource ;
	
	protected String getDefinedMessage(String code, Object[] parameter) {
		return messageSource.getMessage( code , parameter , Locale.getDefault() );
	}
	
	protected NtRmsException(String message, Throwable cause){
		super(message, cause);
	}
	
	protected NtRmsException(String message){
		super(message);
	}
	
	protected NtRmsException(Throwable cause){
		super(cause);
	}
	
	protected NtRmsException(){
		super();
	}
}

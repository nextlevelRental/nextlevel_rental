/**
 * 
 */
package egovframework.ntrms.kr.co.exec.handler.interceptor;

import java.text.MessageFormat;

import org.slf4j.Logger;

import egovframework.ntrms.kr.co.exec.handler.annotation.InjectLogger;
import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;

/**
 * Service Exception Handler
 * 
 * @author 강신규
 * @since 2018. 12. 23. 오후 4:32:19
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2018. 12. 23. / 강신규 : 최초생성
 * </pre>
 */
public class ServiceExceptionHandler implements ExceptionHandler {
    @InjectLogger
    private Logger logger;
    
    /* (non-Javadoc)
     * @see egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler#occur(java.lang.Exception, java.lang.String)
     */
    @Override
    public void occur( Exception exception, String packageName ) {
        if ( logger.isDebugEnabled() ) {
            logger.debug( 
                MessageFormat.format( "[ServiceException] - {0}\n{1}", packageName, exception.toString() ) 
            );
        }
    }

}

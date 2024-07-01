package egovframework.ntrms.kr.co.exec.model;

import egovframework.ntrms.kr.co.exec.model.ExecModelEnums.MessageTypes;
import egovframework.ntrms.kr.co.exec.model.ExecModelEnums.ValueTypes;

/**
 * 
 * @author 강신규
 * @since 2019. 1. 10. 오후 1:38:53
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2019. 1. 10. / 강신규 : 최초생성
 * </pre>
 */
public class FailReturnType extends ReturnType<FailReturnType> {

    /**  */
    private static final long serialVersionUID = 1396977251900816985L;
    
    public FailReturnType() {
        setFail( true );
    }
    
    public FailReturnType callback( Exception exception ) {
        return callback( ValueTypes.ErrorCode.value(), MessageTypes.valueFormat( "{0} [{1}]", MessageTypes.NormalError.value(), exception.getMessage() ) );
    }
}

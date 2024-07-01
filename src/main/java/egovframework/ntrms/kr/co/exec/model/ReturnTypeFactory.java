package egovframework.ntrms.kr.co.exec.model;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

import egovframework.ntrms.kr.co.exec.model.ExecModelEnums.MessageTypes;
import egovframework.ntrms.kr.co.exec.model.ExecModelEnums.ValueTypes;

/**
 * ReturnType Factory
 * 
 * @author 강신규
 * @since 2019. 1. 15. 오전 10:01:21
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2019. 1. 15. / 강신규 : 최초생성
 * </pre>
 */
public class ReturnTypeFactory {
    public static ReturnType<?> createReturnType(Exception exception) {
        return new FailReturnType().callback( exception );
    }
    
    public static ReturnType<?> createReturnType() {
        return createReturnType( null, null );
    }
    public static ReturnType<?> createReturnType(Object message) {
        return createReturnType( null, message );
    }
    
    public static ReturnType<?> createReturnType(boolean isOk, Object message) {
        return createReturnType( isOk ? ValueTypes.SuccessCode.value(): ValueTypes.ErrorCode.value(), message );
    }
    public static ReturnType<?> createReturnType(Object code, Object message) {
        
        int chkCode = NumberUtils.toInt( ValueTypes.SuccessCode.value() );
        String chkMessage = MessageTypes.NormalSuccess.value();
        
        if ( code != null && NumberUtils.isNumber( code.toString() ) )
            chkCode = NumberUtils.toInt( code.toString() );
        
        if ( message != null )
            chkMessage = message.toString();
        
        ReturnType<?> result = null;
        if (chkCode < 0)
            result = new FailReturnType();
        else
            result = new SuccessReturnType();
        
        return result.callback( chkMessage );
    }
}

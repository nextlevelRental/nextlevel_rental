package egovframework.ntrms.kr.co.exec.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.model.ExecModelEnums.MessageTypes;
import egovframework.ntrms.kr.co.exec.model.ExecModelEnums.ValueTypes;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

/**
 * 
 * 
 * @author 강신규
 * @since 2019. 1. 10. 오후 1:20:32
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2019. 1. 10. / 강신규 : 최초생성
 * </pre>
 */
@SuppressWarnings( "unchecked" )
public abstract class ReturnType<T extends ReturnType<T>> implements Serializable {

    /**  */
    private static final long serialVersionUID = 1L;
    
    /** 성공/실패 객체 여부 */
    private boolean isFail = false;
    
    /** out Variables */
    private Map<String, Object> mapVar = new HashMap<>();
    /** out DataSetMap */
    private Map<String, DataSetMap> mapDS = new HashMap<>();
    
    private int returnCode = 0;
    private String returnMessage = "";
    
    
    public Map<String, Object> getMapVar() {
        return MapUtils.unmodifiableMap( mapVar );
    }
    public Map<String, DataSetMap> getMapDS() {
        return MapUtils.unmodifiableMap( mapDS );
    }
    
    protected boolean isFail() {
        return isFail;
    }
    protected void setFail( boolean isFail ) {
        this.isFail = isFail;
        if (isFail) {
            this.returnCode = NumberUtils.toInt( ValueTypes.ErrorCode.value(), 0 );
        }
    }
    
    public int getReturnCode() {
        return returnCode;
    }
    protected void setReturnCode( int returnCode ) {
        this.returnCode = returnCode;
    }
    public String getReturnMessage() {
        return returnMessage;
    }
    protected void setReturnMessage( String returnMessage ) {
        this.returnMessage = returnMessage;
    }
    
    
    /**
     * nexacro client transaction argument<br>
     * 
     * 
     * @author 강신규
     * @since 2019. 1. 16. 오전 11:00:36
     * 
     * @return
     */
    public T callback() {
        return ( T ) this;
    }
    
    /**
     * nexacro client transaction argument
     * 
     * @author 강신규
     * @since 2019. 1. 16. 오전 11:00:38
     * 
     * @param message
     * @return
     */
    public T callback(String message) {
        this.setReturnMessage( message );
        return ( T ) this;
    }
    
    /**
     * nexacro client transaction argument
     * 
     * @author 강신규
     * @since 2019. 1. 16. 오전 11:00:42
     * 
     * @param code
     * @param message
     * @return
     */
    public T callback(String code, String message) {
        return callback(NumberUtils.toInt( code, 0 ), message);
    }
    
    /**
     * nexacro client transaction argument
     * 
     * @author 강신규
     * @since 2019. 1. 16. 오전 11:00:46
     * 
     * @param code
     * @param message
     * @return
     */
    public T callback(int code, String message) {
        this.setReturnCode( code );
        this.setReturnMessage( message );
        
        return ( T ) this;
    }
    
    /**
     * nexacro client association object
     * 
     * @author 강신규
     * @since 2019. 1. 16. 오전 11:12:57
     * 
     * @param dto
     * @return
     */
    public T setOut( NexacroMapDTO dto ) {
        if (dto != null ) {
            setOut( dto.getOutVariableMap(), dto.getOutDataSetMap() );
        }
        return ( T ) this;
    }

    /**
     * nexacro client association object
     * 
     * @author 강신규
     * @since 2019. 1. 16. 오전 11:13:01
     * 
     * @param outVar
     * @param outDS
     * @return
     */
    public T setOut( Map<String, Object> outVar, Map<String, DataSetMap> outDS ) {
        setOutVar( outVar ).setOutDS( outDS );
        
        return ( T ) this;
    }

    /**
     * nexacro client association object
     * 
     * @author 강신규
     * @since 2019. 1. 16. 오전 11:13:05
     * 
     * @param outVar
     * @return
     */
    public T setOutVar( Map<String, Object> outVar ) {
        if (outVar != null)
            this.mapVar = outVar;
        return ( T ) this;
    }

    /**
     * nexacro client association object
     * 
     * @author 강신규
     * @since 2019. 1. 16. 오전 11:13:08
     * 
     * @param outDS
     * @return
     */
    public T setOutDS( Map<String, DataSetMap> outDS ) {
        if (outDS != null)
            this.mapDS = outDS;
        return ( T ) this;
    }
    
    /**
     * 영업관리용 기본 ModelAndView 생성
     * 
     * @author 강신규
     * @since 2019. 1. 10. 오전 10:35:56
     * 
     * @return
     */
    private ModelAndView newModelAndView() {
        return new ModelAndView( "nexacroMapView" );
    }
    
    
    /**
     * 
     * @author 강신규
     * @since 2019. 1. 16. 오후 2:27:54
     * 
     * @return
     */
    private ReturnType<?> checkOutput() {
        ReturnType<?> result = this;
        
        if ( result instanceof SuccessReturnType && ( ( SuccessReturnType ) result ).isComplete() == false ) {
            ((SuccessReturnType)result).setComplete( true );
            
            if ( result.mapVar != null ) {
                int code = result.getReturnCode();
                String message = result.getReturnMessage();
                
                if ( result.mapVar.containsKey( ValueTypes.CodeKey.value() ) ) {
                    code = NumberUtils.toInt( StringUtils.defaultIfEmpty( result.mapVar.get( ValueTypes.CodeKey.value() ).toString(), ValueTypes.SuccessCode.value() ) );
                }
                
                if ( result.mapVar.containsKey( ValueTypes.MessageKey.value() ) ) {
                    message = StringUtils.defaultString( result.mapVar.get( ValueTypes.MessageKey.value() ).toString(), MessageTypes.NormalError.value() );
                }
                
                result.setReturnCode( code );
                result.setReturnMessage( message );
                
                if ( code < 0 ) {
                    result = new FailReturnType().callback( message );
                }
            }
        }
        
        return result;
    }
    
    /**
     * <pre>
     * 오류메시지이면 throw error
     * 
     * DB Transaction이 필요한 Service Method에서 필수 사용 
     * </pre>
     * 
     * @author 강신규
     * @since 2019. 1. 16. 오후 2:53:11
     * 
     * @return
     */
    public ReturnType<?> validateIfThrow() {
        ReturnType<?> result = checkOutput();
        
        if (result.isFail()) {
            throw new NtRmsDaoException( result.getReturnMessage() );
        }
        
        return result;
    }
    
    public ModelAndView output() {
        ReturnType<?> returnType = checkOutput();
        
        ModelAndView result = newModelAndView();
        if (returnType.isFail()) {
            result
                .addObject( NexacroConstant.ERROR_CODE, String.valueOf( returnType.getReturnCode() ) )
                .addObject( NexacroConstant.ERROR_MSG, returnType.getReturnMessage() );
        }
        else {
            result
                .addObject( NexacroConstant.OUT_VARIABLES_ATT_NAME, returnType.mapVar )
                .addObject( NexacroConstant.OUT_DATASET_ATT_NAME, returnType.mapDS )
                .addObject( NexacroConstant.ERROR_CODE, String.valueOf( returnType.getReturnCode() ) )
                .addObject( NexacroConstant.ERROR_MSG, returnType.getReturnMessage() );
        }
        
        return result;
    }
}

package egovframework.ntrms.kr.co.exec.model;

/**
 * 
 * @author 강신규
 * @since 2019. 1. 10. 오후 1:38:19
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2019. 1. 10. / 강신규 : 최초생성
 * </pre>
 */
public class SuccessReturnType extends ReturnType<SuccessReturnType> {

    /**  */
    private static final long serialVersionUID = -4020261141821335150L;
    
    /** 완성여부 */
    private boolean isComplete = false;
    
    /**
     * 완성여부
     * 
     * @author 강신규
     * @since 2019. 1. 16. 오후 2:14:38
     * 
     * @return
     */
    public boolean isComplete() {
        return isComplete;
    }
    
    public void setComplete( boolean isComplete ) {
        this.isComplete = isComplete;
    }


    public SuccessReturnType() {
        setFail( false );
    }
    public SuccessReturnType(boolean isComplete) {
        this();
        this.isComplete = isComplete;
    }
}

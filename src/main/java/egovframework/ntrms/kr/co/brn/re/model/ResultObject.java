package egovframework.ntrms.kr.co.brn.re.model;

import java.io.Serializable;

/**
 * 
 * @author 강신규
 * @since 2019. 2. 26. 오후 11:06:52
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2019. 2. 26. / 강신규 : 최초생성
 * </pre>
 */
public class ResultObject<T> implements Serializable {

    /**  */
    private static final long serialVersionUID = 1L;
    
    private boolean ok = false;
    private T out = null;
    
    public ResultObject() {
    }
    public ResultObject(boolean ok, T out) {
        this.ok = ok;
        this.out = out;
    }
    
    public boolean isOk() {
        return ok;
    }
    public ResultObject<T> setOk( boolean ok ) {
        this.ok = ok;
        return this;
    }
    public T getOut() {
        return out;
    }
    public ResultObject<T> setOut( T out ) {
        this.out = out;
        return this;
    }
    
    public ResultObject<T> success( T out ) {
        this.ok = true;
        this.out = out;
        return this;
    }
    public ResultObject<T> fail(T out) {
        this.ok = false;
        this.out = out;
        return this;
    }
}

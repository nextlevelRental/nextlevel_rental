package egovframework.ntrms.kr.co.exec.model;

import java.text.MessageFormat;

/**
 * enum 객체
 * 
 * @author 강신규
 * @since 2019. 1. 16. 오전 11:40:54
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2019. 1. 16. / 강신규 : 최초생성
 * </pre>
 */
public class ExecModelEnums {
    private interface StringEnum {
        public String value();
    }
    
    /**
     * 
     * @author 강신규
     * @since 2019. 1. 16. 오후 1:19:17
     * @see 
     * <pre>
     * ========== History ==========
     * 
     * 2019. 1. 16. / 강신규 : 최초생성
     * </pre>
     */
    public enum MessageTypes implements StringEnum {
        DeveloperError("[개발자 오류]"),
        NotSetError("정의되지 않은 오류가 발생했습니다"),
        NormalError("오류가 발생했습니다"),
        NormalSuccess("정상적으로 처리되었습니다"),
        UnKnown("")
        ;
        
        private String value = null;
        private MessageTypes(String value) {
            this.value = value;
        }

        @Override
        public String value() {
            return value;
        }
        
        public static String valueFormat(String pattern, String...arguments) {
            return MessageFormat.format( pattern, arguments );
        }
    }
    
    /**
     * 
     * @author 강신규
     * @since 2019. 1. 16. 오후 1:26:32
     * @see 
     * <pre>
     * ========== History ==========
     * 
     * 2019. 1. 16. / 강신규 : 최초생성
     * </pre>
     */
    public enum ValueTypes implements StringEnum {
        CodeKey("successCode"),
        MessageKey("returnMessage"),
        ErrorCode("-1"),
        SuccessCode("0")
        ;
        
        private String value = null;
        private ValueTypes(String value) {
            this.value = value;
        }
        @Override
        public String value() {
            return value;
        }
    }
}

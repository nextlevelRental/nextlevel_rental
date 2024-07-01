package egovframework.ntrms.kr.co.brn.re.model;

import org.apache.commons.lang3.StringUtils;

import com.kcp.J_PP_CLI_N;

/**
 * RTRE enum
 * 
 * @author 강신규
 * @since 2019. 2. 27. 오전 10:14:38
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2019. 2. 27. / 강신규 : 최초생성
 * </pre>
 */
public class RTREEnums {
    
    /**
     * 
     * @author 강신규
     * @since 2019. 2. 27. 오후 12:37:30
     * @see 
     * <pre>
     */
    public enum ModeType {
        PROD("PROD"),
        DEV("DEV"),
        LOCAL("LOCAL"),
        UnKnown("")
        ;
        
        private String value = "";
        private ModeType(String value) {
            this.value = value;
        }
        
        public static ModeType get(String mode) {
            for ( ModeType type : ModeType.values() ) {
                if ( StringUtils.equalsIgnoreCase( type.value, mode ) ) {
                    return type;
                }
            }
            
            return UnKnown;
        }
    }
    
    /**
     * 취소/환불 유형
     * 
     * @author 강신규
     * @since 2019. 3. 5. 오후 4:49:57
     * @see 
     */
    public enum KCPCancelType {
        /** 부분취소 */
        PART("STPC"),
        /** 전체취소 */
        ENTIRE("STSC"),
        Unknown("")
        ;
        
        private String value = "";
        private KCPCancelType(String value) {
            this.value = value;
        }
        
        public String val() {
            return this.value;
        }
        
        public static KCPCancelType find(String value) {
            KCPCancelType result = Unknown;
            
            for ( KCPCancelType type : KCPCancelType.values() ) {
                if (StringUtils.equalsIgnoreCase( value, type.val() )) {
                    result = type;
                    break;
                }
            }
            return result;
        }
    }
    
    /**
     * 결제/취소 요청 코드
     * 
     * @author 강신규
     * @since 2019. 2. 27. 오후 12:41:05
     * @see 
     * <pre>
     * ========== History ==========
     * 
     * 2019. 2. 27. / 강신규 : 최초생성
     * </pre>
     */
    public enum KCPReqType {
        /** 승인 요청 */
        PAY("PAY", "00100000"),
        /** 취소/매입 요청 */
        MOD("MOD", "00200000"),
        
        Unknown("", "")
        ;
        
        private String cd = "";
        private String value = "";
        private KCPReqType(String cd, String value) {
            this.cd = cd;
            this.value = value;
        }
        
        public String cd() {
            return this.cd;
        }
        public String val() {
            return value;
        }
        
        /**
         * 결제/취소 요청코드 확인
         * 
         * @author 강신규
         * @since 2019. 3. 4. 오후 3:52:05
         * 
         * @param cd
         * @return
         */
        public static boolean containsCd(String cd) {
            if (StringUtils.isNotEmpty( cd )) {
                for ( KCPReqType type : KCPReqType.values() ) {
                    if ( StringUtils.equalsIgnoreCase( type.cd(), cd) ) {
                        return true;
                    }
                }
            }
            
            return false;
        }
        
        /**
         * 결제/취소 요청코드 찾기
         * 
         * @author 강신규
         * @since 2019. 3. 4. 오후 3:57:41
         * 
         * @param cd
         * @return
         */
        public static KCPReqType findCd(String cd) {
            for ( KCPReqType type : KCPReqType.values() ) {
                if (StringUtils.equalsIgnoreCase( cd, type.cd() )) {
                    return type;
                }
            }
            
            return Unknown;
        }
    }
    
    /**
     * 결제수단
     * 
     * @author 강신규
     * @since 2019. 2. 27. 오후 2:24:41
     * @see 
     * <pre>
     * ========== History ==========
     * 
     * 2019. 2. 27. / 강신규 : 최초생성
     * </pre>
     */
    public enum PayMethodType {
        /** 카드결제 */
        CARD("100000000000"),
        Unknown("")
        ;
        
        private String value = "";
        private PayMethodType(String value) {
            this.value = value;
        }
        
        public String val() {
            return value;
        }
        
        public boolean checkVal(String value) {
            return StringUtils.equals( this.value, value );
        }
    }
    
    /**
     * SQL Statement
     * 
     * @author 강신규
     * @since 2019. 3. 6. 오후 3:55:18
     * @see 
     * <pre>
     * ========== History ==========
     * 
     * 2019. 3. 6. / 강신규 : 최초생성
     * </pre>
     */
    public enum ProcessPaymentSQLType {
        /** KCP 수납 이력 - 항상 */
        HISTORY_PAY_ALL("procPayment.insertRtre0205CrdHst"),
        /** KCP 수납 이력 - 성공 */
        HISTORY_PAY_SUCC("procPayment.insertRtre0202CrdHst"),
        /** KCP 취소/환불 이력 - 항상 */
        HISTORY_MOD_ALL("procPayment.insertRtre0206CrdHst"),
        
        /** 카드 즉시출금 수납처리 */
        MANAGE_PAY("procPayment.TotCrdRecvMng"),
        /** 카드 즉시출금 환불처리 */
        MANAGE_MOD("procPayment.TotCrdRecvRfndMng")
        ;
        
        private String value;
        private ProcessPaymentSQLType(String value) {
            this.value = value;
        }
        
        public String val() {
            return value;
        }
    }
    
    /**
     * KCP 오류 코드
     * 
     * @author 강신규
     * @since 2019. 2. 27. 오후 1:47:04
     * @see 
     * <pre>
     * ========== History ==========
     * 
     * 2019. 2. 27. / 강신규 : 최초생성
     * </pre>
     */
    public enum KCPErrorType {
        /** 정상처리 */
        E_0000("0000", "정상처리"),
        /** [일반] 에러_기타 */
        E_0900("0900", "[일반] 에러_기타"),
        /** [일반] 에러_전문파싱 */
        E_0902("0902", "[일반] 에러_전문파싱"),
        /** 해당 결제수단이 없습니다. */
        E_3101("3101", "해당 결제수단이 없습니다."),
        /** 업무요청 구분이 없습니다. - 관리자에게 문의하여 주시길 바랍니다. */
        E_9316("9316", "업무요청 구분이 없습니다. - 관리자에게 문의하여 주시길 바랍니다."),
        /** 연동 모듈 호출 오류 */
        E_9502("9502", "연동 모듈 호출 오류"),
        /** 기타메시지 */
        E_9999("9999", "기타메시지"),
        /** 전문 필수 값 오류 */
        E_DM10("DM10", "전문 필수 값 오류")
        ;
        
        private String cd = "";
        private String value = "";
        private KCPErrorType(String cd, String value) {
            this.cd = cd;
            this.value = value;
        }
        
        public String cd() {
            return this.cd;
        }
        public String val() {
            return value;
        }
        
        /**
         * 코드 확인
         * @author 강신규
         * @since 2019. 3. 4. 오후 1:54:46
         * 
         * @param cd
         * @return
         */
        public boolean equalsCd(String cd) {
            return StringUtils.equals( this.cd, cd );
        }
        public static J_PP_CLI_N setError(final J_PP_CLI_N kcp, KCPErrorType errorType) {
            return setError( kcp, errorType.cd(), errorType.val() );
        }
        
        public static J_PP_CLI_N setError(final J_PP_CLI_N kcp, String cd, String msg) {
            J_PP_CLI_N chkkcp = kcp;
            if (kcp != null) {
                kcp.m_res_cd = cd;
                kcp.m_res_msg = msg;
            }
            return chkkcp;
        }
    }
}

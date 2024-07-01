package egovframework.ntrms.kr.co.brn.re.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Marker;
import org.slf4j.MarkerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.google.common.base.Joiner;
import com.kcp.J_PP_CLI_N;

import egovframework.ntrms.kr.co.brn.exception.NtRmsServiceException;
import egovframework.ntrms.kr.co.brn.re.model.PayRequestVO;
import egovframework.ntrms.kr.co.brn.re.model.PayResultVO;
import egovframework.ntrms.kr.co.brn.re.model.RTREEnums.KCPCancelType;
import egovframework.ntrms.kr.co.brn.re.model.RTREEnums.KCPErrorType;
import egovframework.ntrms.kr.co.brn.re.model.RTREEnums.KCPReqType;
import egovframework.ntrms.kr.co.brn.re.model.RTREEnums.PayMethodType;
import egovframework.ntrms.kr.co.brn.re.model.RTREEnums.ProcessPaymentSQLType;
import egovframework.ntrms.kr.co.brn.re.model.ResultObject;
import egovframework.ntrms.kr.co.brn.re.model.config.KCPConfig;
import egovframework.ntrms.kr.co.brn.re.model.config.KCPConfigFactory;
import egovframework.ntrms.kr.co.exec.handler.service.ComService;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

/**
 * 수납, 취소/환불 Agency Module
 * 
 * @author 강신규
 * @since 2019. 2. 26. 오후 9:24:42
 * @see
 *      <pre>
 *      ========== History ==========
 * 
 *      2019. 2. 26. / 강신규 : 최초생성
 *      </pre>
 */
@Service
@SuppressWarnings( "unused" )
public class RTREProcessPaymentService extends ComService {
    // logger marker
    private static final Marker KCP_MARKER = MarkerFactory.getMarker( "KCP_CRD_APPROVAL" );

    /**
     * KCP 객체 생성 및 초기화
     * 
     * @author 강신규
     * @since 2019. 2. 27. 오전 11:48:44
     * 
     * @param config
     * @return
     */
    private J_PP_CLI_N initializeKCP( KCPConfig config ) {
        J_PP_CLI_N kcp = new J_PP_CLI_N();

        if ( config != null ) {
            kcp.mf_init( "", config.getUrl(), config.getPort(), config.getTxMode(), config.getLogDir() );
            kcp.mf_init_set();
        }
        else {
            throw new NtRmsServiceException( "KCP 처리 객체를 초기화할 수 없습니다." );
        }

        return kcp;
    }

    /**
     * KCP 실행
     * 
     * @author 강신규
     * @since 2019. 2. 27. 오후 2:00:25
     * 
     * @param kcp
     * @param config
     * @return
     */
    private J_PP_CLI_N executeKcp( J_PP_CLI_N kcp, KCPReqType payModType, KCPConfig config, PayRequestVO reqVO ) {
        kcp.mf_do_tx( config.getSiteCd(), config.getSiteKey(), payModType.val(), reqVO.getRemoteAddr(), reqVO.getOrdNo(), config.getLogLevel(), "1" );

        // 이력테이블 저장

        if ( KCPErrorType.E_0000.equalsCd( kcp.m_res_cd ) ) {
            // 성공일 때
        }

        return kcp;
    }

    /**
     * DataSetMap empty check
     * 
     * @author 강신규
     * @since 2019. 3. 7. 오전 10:01:31
     * 
     * @param dsms
     * @return
     */
    private boolean isNotEmptyDataSetMap( DataSetMap... dsms ) {
        if ( dsms.length == 0 ) return false;

        for ( DataSetMap dataSetMap : dsms ) {
            if ( dataSetMap == null || dataSetMap.size() == 0 ) { return false; }
        }

        return true;
    }

    /**
     * 수납 승인 처리
     * 
     * @author 강신규
     * @since 2019. 2. 26. 오후 11:19:58
     * 
     * @param kcp
     * @param reqVO
     * @return
     */
    private ResultObject<PayResultVO> subProcessPAY( J_PP_CLI_N kcp, KCPConfig kcpConfig, PayRequestVO reqVO, Map<String, DataSetMap> inDataset ) {
        ResultObject<PayResultVO> result = new ResultObject<>();
        PayResultVO vo = new PayResultVO();

        KCPReqType payModType = KCPReqType.PAY;

        int payxData = kcp.mf_add_set( "payx_data" );
        int commonData = kcp.mf_add_set( "common" );

        kcp.mf_set_us( commonData, "amount", reqVO.getRecpAmt() );
        kcp.mf_set_us( commonData, "currency", reqVO.getCurrency() );
        kcp.mf_set_us( commonData, "cust_ip", reqVO.getRemoteAddr() );
        kcp.mf_set_us( commonData, "escw_mod", "N" );

        kcp.mf_add_rs( payxData, commonData );

        /* 주문 정보 */
        int ordrData = kcp.mf_add_set( "ordr_data" );
        
        // 계약번호로 상품명 추출
        Map<String, Object> matInfo = selectMatInfoWithOrd( reqVO.getOrdNo() );
        
        kcp.mf_set_us( ordrData, "ordr_idxx", reqVO.getOrdNo() );
        kcp.mf_set_us( ordrData, "good_name", matInfo.get( "matNm30" ).toString() );
        kcp.mf_set_us( ordrData, "good_mny", reqVO.getRecpAmt() );

        Map<String, Object> custMap = selectRtsd0100( reqVO.getCustNo() );
        kcp.mf_set_us( ordrData, "buyr_name", MapUtils.getString( custMap, "custNm", "" ) );
        kcp.mf_set_us( ordrData, "buyr_tel1", MapUtils.getString( custMap, "telNo", "" ) );
        kcp.mf_set_us( ordrData, "buyr_tel2", MapUtils.getString( custMap, "telNo2", "" ) );
        kcp.mf_set_us( ordrData, "buyr_mail", MapUtils.getString( custMap, "emailAddr", "" ) );

        reqVO.setEmail( MapUtils.getString( custMap, "emailAddr", "" ) );
        
        // 상품명
        vo.setMatNm( matInfo.get( "matNm" ).toString() );
        // 주문자 정보
        vo.setCustomer( custMap );

        /* 카드결제 */
        if ( PayMethodType.CARD.checkVal( reqVO.getPayMethodCd() ) ) {
            int cardData = kcp.mf_add_set( "card" );

            kcp.mf_set_us( cardData, "card_mny", reqVO.getRecpAmt() ); /* 결제 금액 */
            kcp.mf_set_us( cardData, "card_tx_type", "11121000" );
            kcp.mf_set_us( cardData, "quota", StringUtils.leftPad( reqVO.getQuotaopt(), 2, "0" ) );
            kcp.mf_set_us( cardData, "card_no", reqVO.getCrdNo() );
            kcp.mf_set_us( cardData, "card_expiry", Joiner.on( "" ).join( reqVO.getExpiryYy(), StringUtils.leftPad( reqVO.getExpiryMm(), 2, "0" ) ) );
            kcp.mf_set_us( cardData, "card_taxno", reqVO.getCardauth() );
            kcp.mf_set_us( cardData, "card_pwd", reqVO.getCardpwd() );

            kcp.mf_add_rs( payxData, cardData );
        }
        else {
            KCPErrorType.setError( kcp, KCPErrorType.E_3101 );
        }

        /* 결재 요청 */
        this.executeKcp( kcp, payModType, kcpConfig, reqVO );

        vo.setTno( kcp.mf_get_res( "tno" ) ); /* KCP 거래고유번호 */
        vo.setCrdCd( kcp.mf_get_res( "card_cd" ) );
        vo.setCrdNm( kcp.mf_get_res( "card_name" ) );
        vo.setAppTime( kcp.mf_get_res( "app_time" ) );
        vo.setAppNo( kcp.mf_get_res( "app_no" ) );
        vo.setQuota( kcp.mf_get_res( "quota" ) );
        vo.setNoinf( kcp.mf_get_res( "noinf" ) );
        vo.setNoinfType( kcp.mf_get_res( "noinf_type" ) );
        vo.setAmount( kcp.mf_get_res( "amount" ) );
        vo.setResCd( kcp.m_res_cd );
        vo.setResMsg( kcp.m_res_msg );

        Map<String, Object> mergeMap = mergeToMap( reqVO.outputMap(), vo.outputMap() );
        
        // 수납실행 후 - 항상
        this.actionBySQLType( ProcessPaymentSQLType.HISTORY_PAY_ALL, mergeMap );
        
        if ( StringUtils.equals( kcp.m_res_cd, KCPErrorType.E_0000.cd() ) ) {
            /* 정상 결제시 */

            // 수납실행 후 - 성공
            this.actionBySQLType( ProcessPaymentSQLType.HISTORY_PAY_SUCC, mergeMap );

            /* ------------------------------------------------------------------------------ */
            /* 신용카드 승인 결과 처리 */
            /* ------------------------------------------------------------------------------ */
            if ( PayMethodType.CARD.checkVal( reqVO.getPayMethodCd() ) ) {

                /*
                 * 결재 후처리
                 */
                ResultObject<String> afterResult = this.afterProcessPAY( mergeMap );
                if ( afterResult.isOk() == false ) { return result.fail( vo.setError( KCPErrorType.E_9999, afterResult.getOut() ) ); }
            }
            else {
                return result.fail( vo.setError( KCPErrorType.E_3101 ) );
            }
        }
        else {
            return result.fail( vo.setError( kcp.m_res_cd, kcp.m_res_msg ) );
        }

        result.success( vo.setError( KCPErrorType.E_0000, "승인 처리 성공" ) );
        return result;
    }

    /**
     * KCP 승인결제 후처리
     * 
     * @author 강신규
     * @since 2019. 2. 27. 오후 2:57:39
     * 
     * @return
     */
    private ResultObject<String> afterProcessPAY( Map<String, Object> paramMap ) {
        ResultObject<String> result = actionBySQLType( ProcessPaymentSQLType.MANAGE_PAY, paramMap );
        if ( result.isOk() == false ) {
            // 자동 취소 처리

            PayRequestVO requestVO = new PayRequestVO().loadMap( paramMap );

            KCPConfig kcpConfig = KCPConfigFactory.getConfigByUrl( requestVO.getRequestURL() );
            J_PP_CLI_N kcp = initializeKCP( kcpConfig );

            int modData = kcp.mf_add_set( "mod_data" );

            kcp.mf_set_us( modData, "tno", requestVO.getTno() ); // KCP 원거래 거래번호
            kcp.mf_set_us( modData, "mod_type", KCPCancelType.ENTIRE.val() ); // 원거래 변경 요청 종류
            kcp.mf_set_us( modData, "mod_ip", requestVO.getRemoteAddr() ); // 변경 요청자 IP
            kcp.mf_set_us( modData, "mod_desc", "결과 처리 오류 - 자동 취소" ); // 변경 사유

            executeKcp( kcp, KCPReqType.MOD, kcpConfig, requestVO );
            if ( KCPErrorType.E_0000.equalsCd( kcp.m_res_cd ) ) {
                result.fail( "결제는 정상적으로 이루어졌지만 결제 결과를 처리하는 중\n오류가 발생하여 시스템에서 자동으로 취소 요청을 하였습니다. \n\n 관리자에게 전화하여 확인하시기 바랍니다." );
            }
            else {
                result.fail( "결제는 정상적으로 이루어졌지만 결제 결과를 처리하는 중\n오류가 발생하여 시스템에서 자동으로 취소 요청을 하였으나 \n자동 취소가 실패하였습니다.\n\n 관리자에게 전화하여 확인하시기 바랍니다." );
            }
        }

        return result;
    }

    /**
     * 취소/매입 처리
     * 
     * @author 강신규
     * @since 2019. 2. 26. 오후 11:20:08
     * 
     * @param kcp
     * @param reqVO
     * @return
     */
    private ResultObject<PayResultVO> subProcessMOD( J_PP_CLI_N kcp, KCPConfig kcpConfig, PayRequestVO reqVO, Map<String, DataSetMap> inDataset ) {
        ResultObject<PayResultVO> result = new ResultObject<>();
        PayResultVO vo = new PayResultVO();

        KCPReqType payModType = KCPReqType.MOD;
        int modData = kcp.mf_add_set( "mod_data" );

        kcp.mf_set_us( modData, "tno", reqVO.getTno() );
        kcp.mf_set_us( modData, "mod_type", reqVO.getModType() );
        kcp.mf_set_us( modData, "mod_ip", reqVO.getRemoteAddr() );
        kcp.mf_set_us( modData, "mod_desc", reqVO.getModDesc() );

        KCPCancelType cancelType = KCPCancelType.find( reqVO.getModType() );
        if ( cancelType == KCPCancelType.PART ) {
            kcp.mf_set_us( modData, "mod_mny", reqVO.getModMny() );
            kcp.mf_set_us( modData, "rem_mny", reqVO.getRemMny() );
        }

        /* 결재 요청 */
        this.executeKcp( kcp, payModType, kcpConfig, reqVO );

        vo.setResCd( kcp.m_res_cd );
        vo.setResMsg( kcp.m_res_msg );

        Map<String, Object> mergeMap = mergeToMap( reqVO.outputMap(), vo.outputMap() );

        // 취소/환불 실행 후 - 항상
        this.actionBySQLType( ProcessPaymentSQLType.HISTORY_MOD_ALL, mergeMap );
        if ( StringUtils.equals( kcp.m_res_cd, KCPErrorType.E_0000.cd() ) ) {
            vo.setAmount( "-1" );
            vo.setPanc_mod_mny( "-1" );
            vo.setPanc_rem_mny( "-1" );
            
            /* 정상 결제시 */
            if ( cancelType == KCPCancelType.PART ) {
                vo.setAmount( kcp.mf_get_res( "amount" ) );
                vo.setPanc_mod_mny( kcp.mf_get_res( "panc_mod_mny" ) );
                vo.setPanc_rem_mny( kcp.mf_get_res( "panc_rem_mny" ) );
            }

            mergeMap = mergeToMap( reqVO.outputMap(), vo.outputMap() );

            ResultObject<String> afterResult = this.afterProcessMOD( mergeMap );
            if ( afterResult.isOk() == false ) { return result.fail( vo.setError( KCPErrorType.E_9999, afterResult.getOut() ) ); }
        }
        else {
            return result.fail( vo.setError( kcp.m_res_cd, kcp.m_res_msg ) );
        }

        return result.success( vo.setError( KCPErrorType.E_0000, "취소/매입 처리 성공" ) );
    }

    /**
     * KCP 취소/매입 후처리
     * 
     * @author 강신규
     * @since 2019. 2. 27. 오후 2:58:13
     * 
     * @return
     */
    private ResultObject<String> afterProcessMOD( Map<String, Object> paramMap ) {
        ResultObject<String> result = actionBySQLType( ProcessPaymentSQLType.MANAGE_MOD, paramMap );
        if ( result.isOk() == false ) {
            // 취소/매입 후처리 중 오류발생 시 KCP에서 자동 취소기능 지원 안함
        }

        return result;
    }

    /**
     * 승인, 취소/매입 처리
     * 
     * @author 강신규
     * @since 2019. 2. 27. 오후 3:20:33
     * 
     * @param inVar
     * @param inDataset
     * @return
     */
    public ResultObject<PayResultVO> processPayment( Map<String, Object> inVar, Map<String, DataSetMap> inDataset ) {
        ResultObject<PayResultVO> result = new ResultObject<>();
        PayResultVO vo = new PayResultVO();

        PayRequestVO reqVO = new PayRequestVO().loadMap( inVar );
        // 수납일자 확인
        if ( StringUtils.isEmpty( reqVO.getRecvDay() ) ) {
            SimpleDateFormat sdf = new SimpleDateFormat( "yyyyMMdd" );
            reqVO.setRecvDay( sdf.format( new Date() ) );
        }

        String reqTx = reqVO.getReqTx();
        if ( KCPReqType.containsCd( reqTx ) ) {
            KCPReqType pmType = KCPReqType.findCd( reqTx );

            KCPConfig kcpConfig = KCPConfigFactory.getConfigByUrl( reqVO.getRequestURL() );

            J_PP_CLI_N kcp = initializeKCP( kcpConfig );

            switch ( pmType ) {
                case PAY:
                    result = subProcessPAY( kcp, kcpConfig, reqVO, inDataset );
                    break;
                case MOD:
                    result = subProcessMOD( kcp, kcpConfig, reqVO, inDataset );
                    break;
                default:
                    break;
            }
        }
        else {
            result.fail( vo.setResMsg( "요청종류를 알 수 없습니다." ) );
        }

        return result;
    }

    private String toStringMap( Map<String, Object> map ) {
        List<String> list = new ArrayList<>();
        if ( MapUtils.isNotEmpty( map ) ) {
            for ( String key : map.keySet() ) {
                list.add( Joiner.on( "=" ).join( key, MapUtils.getString( map, key, "" ) ) );
            }
        }

        return Joiner.on( ", " ).join( list );
    }

    private Map<String, Object> mergeToMap( Map<String, Object>... paramMap ) {
        Map<String, Object> map = new HashMap<>();
        for ( Map<String, Object> formap : paramMap ) {
            for ( String key : formap.keySet() ) {
                if ( map.containsKey( key ) == false || MapUtils.getString( formap, key, "" ).equals( "" ) == false ) {
                    // 값이 있는 곳만 추가
                    map.put( key, MapUtils.getObject( formap, key ) );
                }
            }
        }

        return map;
    }

    /**
     * 수납이력, 후처리 SQL 실행
     * 
     * @author 강신규
     * @since 2019. 3. 7. 오전 10:26:53
     * 
     * @param sqlType
     * @param paramMap
     * @return
     */
    public ResultObject<String> actionBySQLType( ProcessPaymentSQLType sqlType, Map<String, Object> paramMap ) {

        int successCode = 0;
        String message = "";

        logger.info( KCP_MARKER, "BEGIN::{} [{}]", sqlType.val(), toStringMap( paramMap ) );
        try {
            this.queryForObject( sqlType.val(), paramMap );

            successCode = MapUtils.getInteger( paramMap, "successCode", 0 );
            message = MapUtils.getString( paramMap, "returnMessage", "" );
        }
        catch ( DataAccessException e ) {
            successCode = -1;
            message = e.getMessage();
        }
        finally {
            logger.info( KCP_MARKER, "END::{} [{}]", sqlType.val(), toStringMap( paramMap ) );
        }

        ResultObject<String> result = new ResultObject<String>( successCode == 0, message );

        return result;
    }

    /**
     * 계약번호를 이용한 MAT_NM 추출
     * 
     * @author 강신규
     * @since 2019. 3. 5. 오후 2:09:47
     * 
     * @param ordNo
     * @return
     */
    public Map<String, Object> selectMatInfoWithOrd( String ordNo ) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put( "piVal", ordNo );

        this.queryForObject( "procPayment.selectMatInfoWithOrd", paramMap );
        List<Map<String, Object>> result = ( List<Map<String, Object>> ) paramMap.get( "vcursor" );

        Map<String, Object> map = new HashMap<>();
        map.put( "mapCd", null );
        map.put( "mapNm", null );
        map.put( "mapNm30", null );

        if ( result != null && result.isEmpty() == false ) {
            map = result.get( 0 );
        }

        return map;
    }

    /**
     * 고객 마스터 추출
     * 
     * @author 강신규
     * @since 2019. 3. 5. 오후 6:04:27
     * 
     * @param custNo
     * @return
     */
    public Map<String, Object> selectRtsd0100( String custNo ) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put( "custNo", custNo );

        this.queryForObject( "popup.listCustInfoBase", paramMap );
        List<Map<String, Object>> result = ( List<Map<String, Object>> ) paramMap.get( "vcursor" );

        Map<String, Object> map = new HashMap<>();
        if ( result != null && result.isEmpty() == false ) {
            map = result.get( 0 );
        }

        return map;
    }
}

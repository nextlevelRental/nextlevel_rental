package egovframework.ntrms.kr.co.brn.cm.service;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMSmsRegMapDAO;
import egovframework.ntrms.kr.co.brn.cm.vo.RTCMSmsParamVO;
import egovframework.ntrms.kr.co.brn.cm.vo.RTCMSmsRegVO;
import egovframework.ntrms.kr.co.brn.cm.vo.RTCMSmsValueVO;
import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.brn.exception.NtRmsServiceException;
import egovframework.ntrms.kr.co.brn.exception.NtRmsUserDefineException;
import egovframework.rte.cmmn.utils.StringUtil;

@Service
public class RTCMSmsRegServiceImpl implements RTCMSmsRegService {

	Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private RTCMSmsRegMapDAO rtcmSmsRegMapDAO;
	
	@Override
	public List<RTCMSmsRegVO> selectSmsHeaderCd(RTCMSmsRegVO vo) throws Exception {
		return rtcmSmsRegMapDAO.selectSmsHeaderCd(vo);
	}

	@Override
	public List<RTCMSmsRegVO> selectSmsDetailCd(RTCMSmsRegVO vo) throws Exception {
		return rtcmSmsRegMapDAO.selectSmsDetailCd(vo);
	}

	@Override
	public List<RTCMSmsParamVO> selectSmsParamInfo(Map<String, Object> inVar) throws Exception {
		return rtcmSmsRegMapDAO.selectSmsParamInfo(inVar);
	}

	@Override
	public String selectSeqSmsPosNo(RTCMSmsRegVO vo) throws Exception {
		return rtcmSmsRegMapDAO.selectSeqSmsPosNo(vo);
	}

	@Override
	public List<RTCMSmsRegVO> selectSmsSendPos(RTCMSmsRegVO vo) throws Exception {
		return rtcmSmsRegMapDAO.selectSmsSendPos(vo);
	}

	@Override
	public int selectSmsCheckCd(RTCMSmsRegVO vo) throws Exception {
		return rtcmSmsRegMapDAO.selectSmsCheckCd(vo);
	}

	@Override
	public String makeSmsMessage(Map<String, Object> inVar) {
		
		String message = null;
		try {
			
			List<RTCMSmsRegVO> messageInfos = rtcmSmsRegMapDAO.selectSmsMessageInfo(inVar);
			List<RTCMSmsParamVO> paramInfos = rtcmSmsRegMapDAO.selectSmsParamInfo(inVar);
			//List<RTCMSmsValueVO> valueInfos   = rtcmSmsRegMapDAO.selectSmsValueInfo(inVar);
			
			RTCMSmsRegVO messageInfo = messageInfos.get(0);
			message = replaceValueOfContents(messageInfo.getMsgContents(), paramInfos);
			
		} catch ( NtRmsDaoException e ) {
			throw new NtRmsUserDefineException("errors.cm.0001", null, new Object[]{}, e);
		} catch ( NtRmsServiceException e) {
			throw new NtRmsUserDefineException("errors.cm.0001", null, new Object[]{}, e);
		}
		
		return message;
	}
	
	private String replaceValueOfContents( String message , final List<RTCMSmsParamVO> paramInfos ){
		
		Class<RTCMSmsValueVO> clz = RTCMSmsValueVO.class;
		
		try {
			
			for ( RTCMSmsParamVO vo : paramInfos ) {
				
				Field field = clz.getField( vo.getParamCd() );

				message.replaceAll( makeFiledFormat( vo.getParamCdNm() ) , StringUtil.toQueryString( field.get(clz) ) );
			}
		
		} catch (IllegalArgumentException e) {
			throw new NtRmsServiceException(e);
		} catch (IllegalAccessException e) {
			throw new NtRmsServiceException(e);
		} catch (NoSuchFieldException e) {
			throw new NtRmsServiceException(e);
		} catch (SecurityException e) {
			throw new NtRmsServiceException(e);
		}
		
		return message;
	}
	
	private String makeFiledFormat(String cdNm){
		
		StringBuffer sb = new StringBuffer();
		sb.append( "#{" );
		sb.append( cdNm );
		sb.append( "}" );
		
		return sb.toString();
	}
}

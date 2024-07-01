package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.List;
import java.util.Map;

import egovframework.ntrms.kr.co.brn.cm.vo.RTCMSmsParamVO;
import egovframework.ntrms.kr.co.brn.cm.vo.RTCMSmsRegVO;
import egovframework.ntrms.kr.co.brn.cm.vo.RTCMSmsValueVO;
import egovframework.ntrms.kr.co.brn.exception.NtRmsServiceException;

public interface RTCMSmsRegService {

	public List<RTCMSmsRegVO> selectSmsHeaderCd(RTCMSmsRegVO vo) throws Exception;
	public List<RTCMSmsRegVO> selectSmsDetailCd(RTCMSmsRegVO vo) throws Exception;
	public List<RTCMSmsParamVO> selectSmsParamInfo(Map<String, Object> inVar) throws Exception;
	public String selectSeqSmsPosNo(RTCMSmsRegVO vo) throws Exception;
	public List<RTCMSmsRegVO> selectSmsSendPos(RTCMSmsRegVO vo) throws Exception;
	public int selectSmsCheckCd(RTCMSmsRegVO vo) throws Exception;
	public String makeSmsMessage(final Map<String, Object> inVar) throws NtRmsServiceException;
}

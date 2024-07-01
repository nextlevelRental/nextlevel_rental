package egovframework.ntrms.kr.co.brn.cm.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.cm.vo.RTCMSmsParamVO;
import egovframework.ntrms.kr.co.brn.cm.vo.RTCMSmsRegVO;
import egovframework.ntrms.kr.co.brn.cm.vo.RTCMSmsValueVO;
import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;

@Repository
public class RTCMSmsRegMapDAO extends RtcmAbstractDAO {

	public List<RTCMSmsRegVO> selectSmsHeaderCd(RTCMSmsRegVO vo) throws Exception {
		
		getSqlMapClientTemplate().queryForObject("smsReg.selectSmsHeaderCd", vo);
		return vo.getResult();
	}
	
	public List<RTCMSmsRegVO> selectSmsDetailCd(RTCMSmsRegVO vo) throws Exception {
		
		getSqlMapClientTemplate().queryForObject("smsReg.selectSmsDetailCd", vo);
		return vo.getResult();
	}
	
	public List<RTCMSmsParamVO> selectSmsParamInfo(Map<String, Object> inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("smsReg.selectSmsParamInfo", inVar);
		return (List<RTCMSmsParamVO>)inVar.get("result");
	}
	
	public List<RTCMSmsValueVO> selectSmsValueInfo(Map<String, Object> inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("smsReg.selectSmsValueInfo", inVar);
		return (List<RTCMSmsValueVO>)inVar.get("result");
	}
	
	public String selectSeqSmsPosNo(RTCMSmsRegVO vo) throws Exception {
		getSqlMapClientTemplate().queryForObject("smsReg.selectSmsPosSeq", vo);
		return vo.getSeqSmsPosSeqNo();
	}
	
	public List<RTCMSmsRegVO> selectSmsSendPos(RTCMSmsRegVO vo) throws Exception {
		getSqlMapClientTemplate().queryForObject("smsReg.selectSmsSendPos", vo);
		return vo.getResult();
	}
	
	public int selectSmsCheckCd(RTCMSmsRegVO vo) throws Exception {
		getSqlMapClientTemplate().queryForObject("smsReg.checkCd", vo);
		return vo.getCheckCdCnt();
	}
	
	public List<RTCMSmsRegVO> selectSmsMessageInfo( final Map<String, Object> inVar ) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("smsReg.selectSmsMessageInfo", inVar);
		return (List<RTCMSmsRegVO>)inVar.get("result");
	}
}

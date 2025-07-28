/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTREAccReqProcServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.core.Logger;
import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREAccReqProcMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREAccReqProcService")
@SuppressWarnings("unchecked")
public class RTREAccReqProcServiceImpl extends EgovAbstractServiceImpl implements RTREAccReqProcService {
	
	@Resource(name="rTREAccReqProcMapDAO")
	RTREAccReqProcMapDAO rTREAccReqProcMapDAO;

	//계좌신청일 조회
	public String getAccReqDate(Map<String, Object> inVar) throws Exception {
		return rTREAccReqProcMapDAO.getAccReqDate(inVar);
	}	
	//결제정보 변경일 조회
	public String getPayChgDate(Map<String, Object> inVar) throws Exception {
		return rTREAccReqProcMapDAO.getPayChgDate(inVar);
	}	
	//계좌신청 대상 조회
	public Map getAccReqTargetList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = (Map)rTREAccReqProcMapDAO.listaccReqTarget(inVar, outDataset);
		return result;
	}
	//확인완료(전송처리 업무상태 업데이트)
	public Map confirmProc(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "accreqProc.confirmProc");

		Map result = rTREAccReqProcMapDAO.confirmProc(inVar);
		return result;			
	}
	
	//집계
	public Map setAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "accreqProc.setAggregate");

		Map result = rTREAccReqProcMapDAO.setAggregate(inVar);
		return result;		
	}
	
	//계좌신청 송신대상 내역 생성
	public Map accReqMakeData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "accreqProc.accReqMakeData");

		Map result = rTREAccReqProcMapDAO.accReqMakeData(inVar);
		return result;		
	}
	
	//계좌신청증빙 송신대상 내역 생성
	public Map accReqMakeLData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "accreqProc.accReqMakeLData");

		Map result = rTREAccReqProcMapDAO.accReqMakeData(inVar);
		return result;		
	}
}

/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTREAccResultServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREAccResultMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREAccResultService")
@SuppressWarnings("unchecked")
public class RTREAccResultServiceImpl extends EgovAbstractServiceImpl implements RTREAccResultService {
	
	@Resource(name="rTREAccResultMapDAO")
	RTREAccResultMapDAO rTREAccResultMapDAO;
	//결과파일 반영조회
	public Map getAccResultList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = (Map)rTREAccResultMapDAO.listaccResult(inVar, outDataset);
		return result;
	}
	//결과파일 반영
	public Map saveFileMakeData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "accResult.saveFileMakeData");

		Map result = rTREAccResultMapDAO.saveFileMakeData(inVar);
		return result;		
	}
	//계좌신청 결과반영(회사접수분)
	public Map accReqResultApplyA(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "accResult.accReqResultApplyA");

		Map result = rTREAccResultMapDAO.accReqResultApplyA(inVar);		
		return result;		
	}
	//계촤신청 결과반영(은행접수분)
	public Map accReqResultApplyB(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "accResult.accReqResultApplyB");

		Map result = rTREAccResultMapDAO.accReqResultApplyB(inVar);		
		return result;		
	}		
	//계촤신청 결과반영(은행접수분)파일생성
	public Map makeFileApplyB(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "accResult.makeFileApplyB");
		
		Map result = (Map)rTREAccResultMapDAO.makeFileApplyB(inVar);
		return result;
	}		
	
/*
	public Map accReqMakeData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "accreqProc.accReqMakeData");

		Map result = rTREAccReqProcMapDAO.accReqMakeData(inVar);
		return result;		
	}	 	
 */

}

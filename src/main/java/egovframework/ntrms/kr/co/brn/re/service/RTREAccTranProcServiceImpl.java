/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTREAccReqTranServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREAccTranProcMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREAccTranProcService")
@SuppressWarnings("unchecked")
public class RTREAccTranProcServiceImpl extends EgovAbstractServiceImpl implements RTREAccTranProcService {
	
	@Resource(name="rTREAccTranProcMapDAO")
	RTREAccTranProcMapDAO rTREAccTranProcMapDAO;

	//출금이체 대상 조회
	public Map getAccTranTargetList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = (Map)rTREAccTranProcMapDAO.listaccTranTarget(inVar, outDataset);
		return result;
	}
	//집계
	public Map tranAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "accTranProc.tranAggregate");

		Map result = rTREAccTranProcMapDAO.tranAggregate(inVar);
		return result;		
		
	}
	//출금이체 송신대상 내역 생성
	public Map accTranMakeData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "accTranProc.accTranMakeData");

		Map result = rTREAccTranProcMapDAO.accTranMakeData(inVar);
		return result;		
	}		
}

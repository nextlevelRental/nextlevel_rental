/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTREMiddleFullPaymentServiceImpl.java
 * 3.Developer			: kstka
 * 4.Development Date	: 2018.10.10
 * 5.Version			: 0.2
 * 6.Note				: 
 * 7.History			: ncho - 2018.12.10 - 수납공통 > 중도완납수납 개발
 ************************************************************************************/
package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREMiddleFullPaymentMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREMiddleFullPaymentService")
@SuppressWarnings("unchecked")
public class RTREMiddleFullPaymentServiceImpl extends EgovAbstractServiceImpl implements RTREMiddleFullPaymentService {
	
	@Resource(name="rTREMiddleFullPaymentMapDAO")
	RTREMiddleFullPaymentMapDAO rTREMiddleFullPaymentMapDAO;
	
	/* 납부예정금액 조회 */
	@SuppressWarnings("rawtypes")
	public Map pSrtsd0109CancelList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("pSrtsd0109CancelList", rTREMiddleFullPaymentMapDAO.pSrtsd0109CancelList(inVar, outDataset));
		return result;
	}
	
	/* 결제정보 저장 */
	@SuppressWarnings("rawtypes")
	public Map cancelSave(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input1");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "middleFullPayment.cancelSave");
		Map result = rTREMiddleFullPaymentMapDAO.cancelSave(inVar);
		return result;
	}
}
/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTREClosingMngServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREClosingMngMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREClosingMngService")
@SuppressWarnings("unchecked")
public class RTREClosingMngServiceImpl extends EgovAbstractServiceImpl implements RTREClosingMngService {
	
	@Resource(name="rTREClosingMngMapDAO")
	RTREClosingMngMapDAO rTREClosingMngMapDAO;
	
	//선수금 내역
	public Map getPrePayList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("prePayList", rTREClosingMngMapDAO.getPrePayList(inVar, outDataset));		
		return result;
	}
	//선수금 정리 내역
	public Map getPrePayArrangeList(Map<String, Object> inVar,	Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("prePayArrangeList", rTREClosingMngMapDAO.getPrePayArrangeList(inVar, outDataset));		
		return result;
	}
	//선수금 관리 정리
	public Map prePayArrange(Map<String, DataSetMap> inDataset,	Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "closingMng.prePayArrange");		
		Map result = rTREClosingMngMapDAO.prePayArrange(inVar);
		return result;	
	}
	//선수금 관리 정리취소
	public Map prePayArrangeCancel(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "closingMng.prePayArrangeCancel");		
		Map result = rTREClosingMngMapDAO.prePayArrangeCancel(inVar);
		return result;	
	}
	//선수금 관리 집계
	public Map prePaymentAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "closingMng.prePaymentAggregate");		
		Map result = rTREClosingMngMapDAO.prePaymentAggregate(inVar);
		return result;		
	}		
	//자산별 매출원가 취득처리 집계
	public Map acquisitionAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "closingMng.acquisitionAggregate");		
		Map result = rTREClosingMngMapDAO.acquisitionAggregate(inVar);
		return result;		
	}
	//이연처리 변경대상 적용 집계
	public Map deferChgTargetAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "closingMng.deferChgTargetAggregate");		
		Map result = rTREClosingMngMapDAO.deferChgTargetAggregate(inVar);
		return result;		
	}
	
	//렌탈등록비 이연처리 집계
	public Map deferProcAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "closingMng.deferProcAggregate");		
		Map result = rTREClosingMngMapDAO.deferProcAggregate(inVar);
		return result;		
	}	
	
	//선수내역 집계
	public Map prePaymentHistAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "closingMng.prePaymentHistAggregate");		
		Map result = rTREClosingMngMapDAO.prePaymentHistAggregate(inVar);
		return result;		
	}
	
	//선수금 환불 처리
	public Map prePayRefund(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "closingMng.prePayRefund");		
		Map result = rTREClosingMngMapDAO.prePayRefund(inVar);
		return result;	
	}	
}



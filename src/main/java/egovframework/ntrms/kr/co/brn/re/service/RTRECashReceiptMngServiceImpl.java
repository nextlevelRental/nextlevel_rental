/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTRECashReceiptMngServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTRECashReceiptMngMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTRECashReceiptMngService")
@SuppressWarnings("unchecked")
public class RTRECashReceiptMngServiceImpl extends EgovAbstractServiceImpl implements RTRECashReceiptMngService {
	
	@Resource(name="rTRECashReceiptMngMapDAO")
	RTRECashReceiptMngMapDAO rTRECashReceiptMngMapDAO;


	public Map getCashReceiptTargetList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = (Map)rTRECashReceiptMngMapDAO.getCashReceiptTargetList(inVar, outDataset);
		return result;
	}

	public Map cashReceiptAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "cashReceiptMng.cashReceiptAggregate");
		Map result = rTRECashReceiptMngMapDAO.cashReceiptAggregate(inVar);	
		return result;		
	}

	public Map cashReceiptMakeData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "cashReceiptMng.cashReceiptMakeData");
		Map result = rTRECashReceiptMngMapDAO.cashReceiptMakeData(inVar);	
		return result;			
	}

	public Map cashReceiptResultFileUpload(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "cashReceiptMng.cashReceiptResultFileUpload");
		Map result = rTRECashReceiptMngMapDAO.cashReceiptResultFileUpload(inVar);	
		return result;			
	}

	public Map cashReceiptProc(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "cashReceiptMng.cashReceiptProc");
		Map result = rTRECashReceiptMngMapDAO.cashReceiptProc(inVar);	
		return result;			
	}

	public Map getSndRcvList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = (Map)rTRECashReceiptMngMapDAO.getSndRcvList(inVar, outDataset);
		return result;
	}

	public Map getCashReceiptList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = (Map)rTRECashReceiptMngMapDAO.getCashReceiptList(inVar, outDataset);
		return result;
	}

	public Map cashReceiptsRegister(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTRECashReceiptMngMapDAO.cashReceiptsRegister(inVar, outDataset);
	}
	
	public Map cashReceiptsRegisterOut(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "cashReceiptMng.cashReceiptsRegisterOut");
		Map result = rTRECashReceiptMngMapDAO.cashReceiptsRegisterOut(inVar);
		return result;	
	}
}

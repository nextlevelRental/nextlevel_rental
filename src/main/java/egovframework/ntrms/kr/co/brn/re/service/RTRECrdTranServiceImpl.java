/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTRECrdTranServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.brn.re.dao.RTRECrdTranMapDAO;
import egovframework.ntrms.kr.co.comm.util.HttpConnectForJson;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTRECrdTranService")
@SuppressWarnings("unchecked")
public class RTRECrdTranServiceImpl extends EgovAbstractServiceImpl implements RTRECrdTranService {
	
	@Resource(name="rTRECrdTranMapDAO")
	RTRECrdTranMapDAO rTRECrdTranMapDAO;

	//카드이체조회(계약번호별 내격조회)
	public Map getCrdTranOrdNoList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("crdTranOrdNoList", 	rTRECrdTranMapDAO.getCrdTranOrdNoList(inVar, outDataset));		
		return result;
	}
	
	//카드이체조회(카드사별 내격조회)
	public Map getCrdTranCardList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("crdTranCardList", 	rTRECrdTranMapDAO.getCrdTranCardList(inVar, outDataset));		
		return result;
	}
	
	//카드이체 처리 - STEP1 카드이체 대상집계
	public Map crdTranAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "crdTran.crdTranAggregate");		
		Map result = rTRECrdTranMapDAO.crdTranAggregate(inVar);
		return result;				
	}
	
	//카드이체 대상조회
	public Map getCrdTranTargetList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = (Map)rTRECrdTranMapDAO.listCrdTranTarget(inVar, outDataset);
		return result;
	}
	//카드이체 결과파일 반영
	public Map crdMakeFileData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "crdTran.crdMakeFileData");		
		Map result = rTRECrdTranMapDAO.crdMakeFileData(inVar);
		return result;			
	}
	//카드이체결과처리 수납처리
	public Map crdTranReceipt(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "crdTran.crdTranReceipt");		
		Map result = rTRECrdTranMapDAO.crdTranReceipt(inVar);
		return result;			
	}	
	
	//카드이체 파일생성
	public Map crdTranMakeData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "crdTran.crdTranMakeData");		
		Map result = rTRECrdTranMapDAO.crdTranMakeData(inVar);
		return result;	
	}	
	
	//카드이체결과처리 완료여부
	public Map crdTranEnd(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws NtRmsDaoException {
		Map result = (Map)rTRECrdTranMapDAO.crdTranEnd(inVar, outDataset);
		return result;
	}
	
	//access token
	public Map getAccessToken(String sendUrl, Map<String, Object> paramMap) throws NtRmsDaoException {
		
		HttpConnectForJson connectUtil = null;
		Map<String, Object> resultMap = null;
		try {
			
			connectUtil = new HttpConnectForJson();
			resultMap = connectUtil.connect(sendUrl, paramMap);
			
		} catch (Exception e) {
			// TODO: handle exception
			new Exception(e.getMessage());
		}
		
		return resultMap;
	}
	
	//export file
	public Map exportFile(String sendUrl, Map<String, Object> paramMap) throws NtRmsDaoException {
		
		HttpConnectForJson connectUtil = null;
		Map<String, Object> resultMap = null;
		try {
			
			connectUtil = new HttpConnectForJson();
			resultMap = connectUtil.connect(sendUrl, paramMap);
			
		} catch (Exception e) {
			// TODO: handle exception
			new Exception(e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map upanddownKCP(String sendUrl, Map<String, Object> paramMap) throws NtRmsDaoException {
		// TODO Auto-generated method stub
		HttpConnectForJson connectUtil = null;
		Map<String, Object> resultMap = null;
		try {
			
			connectUtil = new HttpConnectForJson();
			resultMap = connectUtil.connect(sendUrl, paramMap);
			
		} catch (Exception e) {
			// TODO: handle exception
			new Exception(e.getMessage());
		}
		
		return resultMap;
	}
}



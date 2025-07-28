package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTRECollectionMoneyMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rtreCollectionMoneyService")
@SuppressWarnings("unchecked")
public class RTRECollectionMoneyServiceImpl extends EgovAbstractServiceImpl implements RTRECollectionMoneyService {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rtreCollectionMoneyMapDAO")	
	RTRECollectionMoneyMapDAO rtreCollectionMoneyMapDAO;
	
	/* 수금내역 조회 */
	@SuppressWarnings("rawtypes")
	public Map getCollectionMoneyList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listCollectionMoney", rtreCollectionMoneyMapDAO.getCollectionMoneyList(inVar, outDataset));
		return result;
	}
	
	/* 청구내역 조회 */
	@SuppressWarnings("rawtypes")
	public Map getBillingRecordList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listBillingRecord", rtreCollectionMoneyMapDAO.getBillingRecordList(inVar, outDataset));
		return result;
	}
	
	/* 수납관리 팝업용 청구/수납내역 조회 */
	@SuppressWarnings("rawtypes")
	public Map getCollectForReq(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listCollectForReq", rtreCollectionMoneyMapDAO.getCollectForReq(inVar, outDataset));
		return result;
	}

	@SuppressWarnings("rawtypes")
	public Map getReceiptList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listReceipt", rtreCollectionMoneyMapDAO.getReceiptList(inVar, outDataset));
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public Map getCancelReceiptList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listCancelReceipt", rtreCollectionMoneyMapDAO.getCancelReceiptList(inVar, outDataset));
		return result;
	}

	@SuppressWarnings("rawtypes")
	public Map cancelReceipt(Map<String, Object> inVar, Map<String, DataSetMap> inDsMap) throws Exception {
		DataSetMap inMap = (DataSetMap)inDsMap.get("input");
		inVar.put("inDsMap", inMap);
		inVar.put("sqlnamespace", "collectionMoney.cancelReceipt");
		
		Map result = rtreCollectionMoneyMapDAO.cancelReceipt(inVar);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public Map getCancelExOContractList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listCancelReceipt", rtreCollectionMoneyMapDAO.getCancelExOContractList(inVar, outDataset));
		return result;
	}

	@SuppressWarnings("rawtypes")
	public Map cancelExOContract(Map<String, Object> inVar, Map<String, DataSetMap> inDsMap) throws Exception {
//		inVar.put("sqlnamespace", "collectionMoney.cancelExOContract");
//		
//		Map result = rtreCollectionMoneyMapDAO.cancelExOContract(inVar);
//		return result;
		return rtreCollectionMoneyMapDAO.cancelExOContract(inVar);
	}
	
	public int getRecSeq(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		return rtreCollectionMoneyMapDAO.getRecSeq(inVar);
	}
	
	/**
	 * 가상계좌 내역을 조회한다
	 * 
	 * @param inVar
	 * @param outDataset
	 * @return Map
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-10-20	wjim		신규생성
	 */
	@SuppressWarnings("rawtypes")
	public Map getVaList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listVa", rtreCollectionMoneyMapDAO.getVaList(inVar, outDataset));
		return result;
	}
	
	/**
	 * 가상계좌 세부내역을 조회한다(PG결제 - 가상계좌)
	 * 
	 * @param inVar
	 * @param outDataset
	 * @return Map
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-10-20	wjim		신규생성
	 */
	@SuppressWarnings("rawtypes")
	public Map getVaDetail0141List(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listVaDetail", rtreCollectionMoneyMapDAO.getVaDetail0141List(inVar, outDataset));
		return result;
	}
	
	/**
	 * 가상계좌 세부내역을 조회한다(세틀뱅크 고정형 가상계좌)
	 * 
	 * @param inVar
	 * @param outDataset
	 * @return Map
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-10-20	wjim		신규생성
	 */
	@SuppressWarnings("rawtypes")
	public Map getVaDetail0221List(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listVaDetail", rtreCollectionMoneyMapDAO.getVaDetail0221List(inVar, outDataset));
		return result;
	}
		
	/**
	 * 가상계좌 내역을 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return Map
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-10-10	wjim		신규생성
	 */
	public Map <String, Object> saveVaccount(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception {
		return rtreCollectionMoneyMapDAO.saveVaccount(mapInDSM, mapInVar);
	}
	
	/**
	 * 가상계좌 연체정보를 조회한다
	 * 
	 * @param inVar
	 * @param outDataset
	 * @return Map
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2018-01-05	wjim		[20180104_01] 신규생성
	 */
	@SuppressWarnings("rawtypes")
	public Map getVaOrdDelyList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listVa", rtreCollectionMoneyMapDAO.getVaOrdDelyList(inVar, outDataset));
		return result;
	}
}

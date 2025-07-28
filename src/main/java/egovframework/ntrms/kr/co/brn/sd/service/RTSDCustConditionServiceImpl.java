package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTRECollectionMoneyMapDAO;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDCustConditionMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;



@Service("rtsdCustConditionService")
@SuppressWarnings("unchecked")
public class RTSDCustConditionServiceImpl extends EgovAbstractServiceImpl implements RTSDCustConditionService {
    
	protected Log logger = LogFactory.getLog(this.getClass()); 
	
	@Resource(name="rtsdCustConditionMapDAO")	
	RTSDCustConditionMapDAO rtsdCustConditionMapDAO;
	
	//고객정보 조회
	public Map getCustResultList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listCustResult", rtsdCustConditionMapDAO.getCustResultList(inVar, outDataset));
		return result;
	}
    //차량정보 조회
	public Map getCarResultList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listCarResult", rtsdCustConditionMapDAO.getCarResultList(inVar, outDataset));
		return result;
	}
	// 계약현황 조회
	public Map getOrderResultList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listOrderResult", rtsdCustConditionMapDAO.getOrderResultList(inVar, outDataset));
		return result;
	}
	// 결제내역 조회
	public Map getPaymentList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listPayment", rtsdCustConditionMapDAO.getPaymentList(inVar, outDataset));
		return result;
	}
	// 프리미엄서비스 조회
	public Map getPremiumServiceList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listPremiumService", rtsdCustConditionMapDAO.getPremiumServiceList(inVar, outDataset));
		return result;
	}
	//인바운드콜 조회
	public Map getInboundCallList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listInboundCall", rtsdCustConditionMapDAO.getInboundCallList(inVar, outDataset));
		return result;
	}
	//아웃바운드콜 조회
	public Map getOutboundCallList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listOutboundCall", rtsdCustConditionMapDAO.getOutboundCallList(inVar, outDataset));
		return result;
	}
	//클레임 접수 조회
	public Map getClaimReceiptList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listClaimReceipt", rtsdCustConditionMapDAO.getClaimReceiptList(inVar, outDataset));
		return result;
	}
	// 계약현황 조회New
	public Map getOrderResultListNew(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listOrderResultNew", rtsdCustConditionMapDAO.getOrderResultListNew(inVar, outDataset));
		return result;
	}
}

/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREArrearsPaymentServiceImpl.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.11.12
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREChargeSendMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREChargeSendService")
@SuppressWarnings("unchecked")
public class RTREChargeSendServiceImpl extends EgovAbstractServiceImpl implements RTREChargeSendService {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREChargeSendMapDAO")	
	RTREChargeSendMapDAO rTREChargeSendMapDAO;
	
	/* 벤더정보등록 */
	@SuppressWarnings("rawtypes")
	public Map saveVendorList(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "chargeSend.saveVendorList");

		Map result = rTREChargeSendMapDAO.saveDatas(inVar);
		return result;
	}
	
	/* 수수료정보등록 */
	@SuppressWarnings("rawtypes")
	public Map saveChargeList(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "chargeSend.saveChargeList");

		Map result = rTREChargeSendMapDAO.saveDatas(inVar);
		return result;
	}
	
	/* SMS정보생성 */
	@SuppressWarnings("rawtypes")
	public Map aggregateSms(Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "chargeSend.aggregateSms");

		Map result = rTREChargeSendMapDAO.saveData(inVar);
		return result;
	}
	
	/* SMS발송 */
	@SuppressWarnings("rawtypes")
	public Map saveSendSms(Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "chargeSend.saveSendSms");

		Map result = rTREChargeSendMapDAO.saveData(inVar);
		return result;
	}
}
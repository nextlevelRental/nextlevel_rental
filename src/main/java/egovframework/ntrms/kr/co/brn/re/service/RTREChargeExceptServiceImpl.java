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

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREChargeExceptMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREChargeExceptService")
@SuppressWarnings("unchecked")
public class RTREChargeExceptServiceImpl extends EgovAbstractServiceImpl implements RTREChargeExceptService {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREChargeExceptMapDAO")	
	RTREChargeExceptMapDAO rTREChargeExceptMapDAO;
	
	/* 청구제외대상등록 */
	@SuppressWarnings("rawtypes")
	public Map saveChargeExcept(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "chargeExcept.saveChargeExcept");

		Map result = rTREChargeExceptMapDAO.saveChargeExcept(inVar);
		return result;
	}
	
	/* 청구제외대상조회 */
	public Map listChargeExcept(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listChargeExcept", rTREChargeExceptMapDAO.listChargeExcept(inVar));
		return result;
	}
}
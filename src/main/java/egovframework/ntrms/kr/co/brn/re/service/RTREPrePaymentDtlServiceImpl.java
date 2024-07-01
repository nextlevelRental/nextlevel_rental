/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREPrePaymentServiceDtlImpl.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.12.18
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

import egovframework.ntrms.kr.co.brn.re.dao.RTREPrePaymentDtlMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREPrePaymentDtlService")
@SuppressWarnings("unchecked")
public class RTREPrePaymentDtlServiceImpl extends EgovAbstractServiceImpl implements RTREPrePaymentDtlService {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREPrePaymentDtlMapDAO")	
	RTREPrePaymentDtlMapDAO rTREPrePaymentDtlMapDAO;
	
	/* 선납내역조회 */
	@SuppressWarnings("rawtypes")
	public Map retrievePrePaymentMstList(Map<String, Object> mapInVar, Map<String, DataSetMap> mapOutDSM) throws Exception {
		Map result = new HashMap();
		
		result.put("listPrePaymentMst", rTREPrePaymentDtlMapDAO.retrievePrePaymentMstList(mapInVar, mapOutDSM));
		return result;
	}
	
	/* 선납내역상세조회 */
	@SuppressWarnings("rawtypes")
	public Map retrievePrePaymentDtlList(Map<String, Object> mapInVar, Map<String, DataSetMap> mapOutDSM) throws Exception {
		Map result = new HashMap();
		
		result.put("listPrePaymentDtl", rTREPrePaymentDtlMapDAO.retrievePrePaymentDtlList(mapInVar, mapOutDSM));
		return result;
	}
	
	/* 선납할인금액계산 */
	@SuppressWarnings("rawtypes")
	public Map prePymntDscntAmtCalc(Map<String, Object> mapInVar, Map<String, DataSetMap> mapOutDSM) throws Exception {
		Map result = new HashMap();
		
		result.put("prePymntDscntAmtCalc", rTREPrePaymentDtlMapDAO.prePymntDscntAmtCalc(mapInVar, mapOutDSM));
		return result;
	}
}
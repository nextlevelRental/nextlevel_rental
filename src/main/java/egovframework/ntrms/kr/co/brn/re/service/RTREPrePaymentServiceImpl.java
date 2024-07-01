/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREPrePaymentServiceImpl.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.12.10
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

import egovframework.ntrms.kr.co.brn.re.dao.RTREPrePaymentMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREPrePaymentService")
@SuppressWarnings("unchecked")
public class RTREPrePaymentServiceImpl extends EgovAbstractServiceImpl implements RTREPrePaymentService {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREPrePaymentMapDAO")	
	RTREPrePaymentMapDAO rTREPrePaymentMapDAO;
	
	/* 선납개월 선택항목 조회 */
	@SuppressWarnings("rawtypes")
	public Map retrievePrptMonList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		
		result.put("listPrptMon", rTREPrePaymentMapDAO.retrievePrptMonList(inVar, outDataset));
		return result;
	}
	
	/* 선납금액계산 */
	@SuppressWarnings("rawtypes")
	public Map retrievePrePymntAmtCalc(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		
		result.put("listPrePymntAmtCalc", rTREPrePaymentMapDAO.retrievePrePymntAmtCalc(inVar, outDataset));
		return result;
	}
	
	/* 납부예정상세 조회 */
	@SuppressWarnings("rawtypes")
	public Map retrievePymntSchdlDtlList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		
		result.put("listPymntSchdlDtl", rTREPrePaymentMapDAO.retrievePymntSchdlDtlList(inVar, outDataset));
		return result;
	}
	
	/* 선납할인가능여부체크 */
	public Map checkPrePaymentAbleYn(Map<String, Object> inVar) throws Exception {
		Map result = rTREPrePaymentMapDAO.checkPrePaymentAbleYn(inVar);
		
		return result;
	}
}
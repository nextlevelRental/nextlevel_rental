/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREPaymentCommServiceImpl.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.12.10
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

import egovframework.ntrms.kr.co.brn.re.dao.RTREPaymentCommMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREPaymentCommService")
public class RTREPaymentCommServiceImpl extends EgovAbstractServiceImpl implements RTREPaymentCommService {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREPaymentCommMapDAO")	
	RTREPaymentCommMapDAO rTREPaymentCommMapDAO;
	
	/* 카드즉시출금결제 저장 */
	public Map<String, Object> saveCrdImmWthdrPayment(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception {
		return rTREPaymentCommMapDAO.saveCrdImmWthdrPayment(mapInDSM, mapInVar);
	}
	
	/* 카드즉시출금결제이력 저장 */
	public Map<String, Object> saveCardPaymentHst(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception {
		return rTREPaymentCommMapDAO.saveCardPaymentHst(mapInDSM, mapInVar);
	}
	
	/* 카드즉시출금취소 저장 */
	public Map<String, Object> saveCrdImmWthdrCancel(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception {
		return rTREPaymentCommMapDAO.saveCrdImmWthdrCancel(mapInDSM, mapInVar);
	}
	
	/* 카드 선수납처리 */
	public Map<String, Object> crdPartClear(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception {
		return rTREPaymentCommMapDAO.crdPartClear(mapInDSM, mapInVar);
	}
	
	/* 계좌 선수납처리 */
	public Map<String, Object> accPartClear(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception {
		return rTREPaymentCommMapDAO.accPartClear(mapInDSM, mapInVar);
	}
	
	/* 카드즉시출금취소이력 저장 */
	public Map<String, Object> saveCardCancelHst(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception {
		return rTREPaymentCommMapDAO.saveCardCancelHst(mapInDSM, mapInVar);
	}
	
	/* 계좌즉시출금결제 저장 */
	public Map<String, Object> saveAccImmWthdrPayment(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception {
		return rTREPaymentCommMapDAO.saveAccImmWthdrPayment(mapInDSM, mapInVar);
	}
	
	/* 계좌즉시출금결제이력 저장 */
	public Map<String, Object> saveAccImmWthdrPaymentHst(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception {
		return rTREPaymentCommMapDAO.saveAccImmWthdrPaymentHst(mapInDSM, mapInVar);
	}
	
	/* 계좌즉시출금취소 저장 */
	public Map<String, Object> saveAccImmWthdrCancel(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception {
		return rTREPaymentCommMapDAO.saveAccImmWthdrCancel(mapInDSM, mapInVar);
	}
	
	/* 계좌즉시출금취소이력 저장 */
	public Map<String, Object> saveAccCancelHst(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception {
		return rTREPaymentCommMapDAO.saveAccCancelHst(mapInDSM, mapInVar);
	}
	
	/* 가상계좌발급 */
	public Map<String, Object> vaccIssued(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception {
		return rTREPaymentCommMapDAO.vaccIssued(mapInDSM, mapInVar);
	}
}
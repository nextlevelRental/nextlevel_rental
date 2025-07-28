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

import egovframework.ntrms.kr.co.brn.re.dao.RTREArrearsPaymentMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREArrearsPaymentService")
@SuppressWarnings("unchecked")
public class RTREArrearsPaymentServiceImpl extends EgovAbstractServiceImpl implements RTREArrearsPaymentService {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREArrearsPaymentMapDAO")	
	RTREArrearsPaymentMapDAO rTREArrearsPaymentMapDAO;
	
	/* 미납내역상세 조회 */
	@SuppressWarnings("rawtypes")
	public Map retrieveUnpaidList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		
		result.put("listUnpaid", rTREArrearsPaymentMapDAO.retrieveUnpaidList(inVar, outDataset));
		return result;
	}
}
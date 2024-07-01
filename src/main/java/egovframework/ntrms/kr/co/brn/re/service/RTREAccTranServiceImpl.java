/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTREAccTranServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREAccTranMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREAccTranService")
@SuppressWarnings("unchecked")
public class RTREAccTranServiceImpl extends EgovAbstractServiceImpl implements RTREAccTranService {
	
	@Resource(name="rTREAccTranMapDAO")
	RTREAccTranMapDAO rTREAccTranMapDAO;

	//출금이체조회(계약번호별 내격조회)
	public Map getAccTranOrdNoList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("accTranOrdNoList", 	rTREAccTranMapDAO.getAccTranOrdNoList(inVar, outDataset));		
		return result;
	}
	
	//출금이체조회(은행별 내격조회)
	public Map getAccTranBankList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("accTranBankList", 	rTREAccTranMapDAO.getAccTranBankList(inVar, outDataset));		
		return result;
	}
}

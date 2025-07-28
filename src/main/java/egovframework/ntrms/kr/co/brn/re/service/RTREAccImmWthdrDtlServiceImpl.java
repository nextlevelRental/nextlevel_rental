/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREAccImmWthdrDtlServiceImpl.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.11.05
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREAccImmWthdrDtlMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREAccImmWthdrDtlService")
@SuppressWarnings("unchecked")
public class RTREAccImmWthdrDtlServiceImpl extends EgovAbstractServiceImpl implements RTREAccImmWthdrDtlService {
	
	@Resource(name="rTREAccImmWthdrDtlMapDAO")
	RTREAccImmWthdrDtlMapDAO rTREAccImmWthdrDtlMapDAO;
	
	/* 계좌즉시출금 내역조회 */
	@SuppressWarnings("rawtypes")
	public Map retrieveAccImmWthdrList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listAccImmWthdr", rTREAccImmWthdrDtlMapDAO.retrieveAccImmWthdrList(inVar, outDataset));
		
		return result;
	}
	
	/* 수납내역 상세조회 */
	@SuppressWarnings("rawtypes")
	public Map retrieveAccImmWthdrDtlList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listAccImmWthdrDtl", rTREAccImmWthdrDtlMapDAO.retrieveAccImmWthdrDtlList(inVar, outDataset));
		
		return result;
	}
}
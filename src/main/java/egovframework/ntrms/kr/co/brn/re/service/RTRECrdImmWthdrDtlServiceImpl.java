/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTRECrdImmWthdrDtlServiceImpl.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.11.06
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTRECrdImmWthdrDtlMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTRECrdImmWthdrDtlService")
@SuppressWarnings("unchecked")
public class RTRECrdImmWthdrDtlServiceImpl extends EgovAbstractServiceImpl implements RTRECrdImmWthdrDtlService {
	
	@Resource(name="rTRECrdImmWthdrDtlMapDAO")
	RTRECrdImmWthdrDtlMapDAO rTRECrdImmWthdrDtlMapDAO;
	
	/* 계좌즉시출금 내역조회 */
	@SuppressWarnings("rawtypes")
	public Map retrieveCrdImmWthdrList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listCrdImmWthdr", rTRECrdImmWthdrDtlMapDAO.retrieveCrdImmWthdrList(inVar, outDataset));
		
		return result;
	}
	
	/* 수납내역 상세조회 */
	@SuppressWarnings("rawtypes")
	public Map retrieveCrdImmWthdrDtlList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listCrdImmWthdrDtl", rTRECrdImmWthdrDtlMapDAO.retrieveCrdImmWthdrDtlList(inVar, outDataset));
		
		return result;
	}
}
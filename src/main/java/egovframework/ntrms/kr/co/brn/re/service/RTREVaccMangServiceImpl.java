/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREVaccMangServiceImpl.java
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

import egovframework.ntrms.kr.co.brn.re.dao.RTREVaccMangMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREVaccMangService")
@SuppressWarnings("unchecked")
public class RTREVaccMangServiceImpl extends EgovAbstractServiceImpl implements RTREVaccMangService {
	
	@Resource(name="rTREVaccMangMapDAO")
	RTREVaccMangMapDAO rTREVaccMangMapDAO;

	/* 가상계좌 현황 조회 */
	@SuppressWarnings("rawtypes")
	public Map retrieveVaccMangList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("vaccMang", rTREVaccMangMapDAO.retrieveVaccMangList(inVar, outDataset));
		
		return result;
	}
	
	/* 기간만료계좌정리 */
	@SuppressWarnings("rawtypes")
	public Map prdExprArngm(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "vaccMang.sRtre0220PrdExprArngm");
		Map result = rTREVaccMangMapDAO.prdExprArngm(inVar);
		
		return result;
	}
}
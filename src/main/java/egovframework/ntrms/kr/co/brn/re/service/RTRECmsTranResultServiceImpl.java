/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTRECmsTranResultServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.brn.re.dao.RTRECmsTranResultMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTRECmsTranResultService")
@SuppressWarnings("unchecked")
public class RTRECmsTranResultServiceImpl extends EgovAbstractServiceImpl implements RTRECmsTranResultService {
	
	@Resource(name="rTRECmsTranResultMapDAO")
	RTRECmsTranResultMapDAO rTRECmsTranResultMapDAO;
	
	//출금이체결과처리 결과파일반영
	public Map makeFileData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "cmsTranResult.makeFileData");

		Map result = rTRECmsTranResultMapDAO.makeFileData(inVar);
		return result;		
	}
	//CMS수납처리
	public Map cmsTranReceipt(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "cmsTranResult.cmsTranReceipt");

		Map result = rTRECmsTranResultMapDAO.cmsTranReceipt(inVar);	
		return result;			
	}
	
	//CMS이체결과처리 완료여부
	public Map cmsTranEnd(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws NtRmsDaoException {
		Map result = (Map)rTRECmsTranResultMapDAO.cmsTranEnd(inVar, outDataset);
		return result;
	}

}

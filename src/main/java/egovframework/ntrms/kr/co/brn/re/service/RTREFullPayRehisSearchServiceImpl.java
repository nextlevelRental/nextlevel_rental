/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREFullPayRehisSearchServiceImpl.java
 * 3.Developer			: sunq
 * 4.Development Date	: 2018.12.07
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREFullPayRehisSearchMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREFullPayRehisSearchService")
public class RTREFullPayRehisSearchServiceImpl extends EgovAbstractServiceImpl implements RTREFullPayRehisSearchService {
	
	@Resource(name="rTREFullPayRehisSearchMapDAO")
	RTREFullPayRehisSearchMapDAO rTREFullPayRehisSearchMapDAO;
	
	public Map<String, Object> getFullPayRehisSearchSVC(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("fullPayRehSearchList", rTREFullPayRehisSearchMapDAO.getFullPayRehisSearch(inVar, outDataset));
		return resultMap;
	}

	public Map<String, Object> getCommUserGroupCodeListSVC(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("commUserGroupCodeList", rTREFullPayRehisSearchMapDAO.getCommUserGroupCodeList(inVar, outDataset));
		return resultMap;
	}

}

/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSSurveyMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSSurveyService")
@SuppressWarnings("unchecked")
public class RTCSSurveyServiceImpl extends EgovAbstractServiceImpl implements RTCSSurveyService {
	
	
	@Resource(name="rTCSSurveyMapDAO")
	RTCSSurveyMapDAO rTCSSurveyMapDAO;

	//목록조회
	public List<Map> getSurveyList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSSurveyMapDAO.getSurveyList(inVar, outDataset);
	}
		
	//데이타생성, 수정, 삭제
	public Map saveSurveyInfo(Map<String, DataSetMap> inDataset, Map inVar)
		throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "survey.insertSurvey");
		return rTCSSurveyMapDAO.saveSurveyInfo(inVar);
		
	}
		
	
	
}

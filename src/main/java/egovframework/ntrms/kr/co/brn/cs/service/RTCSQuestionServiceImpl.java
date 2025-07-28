/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCSQuestionServiceImpl.java
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

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSQuestionMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSQuestionService")
@SuppressWarnings("unchecked")
public class RTCSQuestionServiceImpl extends EgovAbstractServiceImpl implements RTCSQuestionService {
	
	
	@Resource(name="rTCSQuestionMapDAO")
	RTCSQuestionMapDAO rTCSQuestionMapDAO;

	//목록조회
	public List<Map> getQuestionList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSQuestionMapDAO.getQuestionList(inVar, outDataset);
	}
		
	//데이타생성, 수정, 삭제
	public Map saveQuestionInfo(Map<String, DataSetMap> inDataset, Map inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "question.insertQuestion");
		return rTCSQuestionMapDAO.saveQuestionInfo(inVar);
		
	}
		
	
	
}

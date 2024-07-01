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

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSAnswerMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSAnswerService")
@SuppressWarnings("unchecked")
public class RTCSAnswerServiceImpl extends EgovAbstractServiceImpl implements RTCSAnswerService {
	
	
	@Resource(name="rTCSAnswerMapDAO")
	RTCSAnswerMapDAO rTCSAnswerMapDAO;

	//목록조회
	public List<Map> getAnswerList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSAnswerMapDAO.getAnswerList(inVar, outDataset);
	}
		
	//데이타생성, 수정, 삭제
	public Map saveAnswerInfo(Map<String, DataSetMap> inDataset, Map inVar)
		throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "answer.insertAnswer");
		return rTCSAnswerMapDAO.saveAnswerInfo(inVar);
		
	}
		
	
	
}

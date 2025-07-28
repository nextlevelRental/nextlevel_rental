/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCSResultServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSResultMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSResultService")
@SuppressWarnings("unchecked")
public class RTCSResultServiceImpl extends EgovAbstractServiceImpl implements RTCSResultService {
	
	
	@Resource(name="rTCSResultMapDAO")
	RTCSResultMapDAO rTCSResultMapDAO;

	//목록조회
	public List<Map> getResultList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSResultMapDAO.getResultList(inVar, outDataset);
	}
	
	//답변리스트
	public List<Map> getListQustAns(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSResultMapDAO.getQustAns(inVar, outDataset);
	}
		
}

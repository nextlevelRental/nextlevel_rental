/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCSInboundServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSInboundMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSInboundService")
@SuppressWarnings("unchecked")
public class RTCSInboundServiceImpl extends EgovAbstractServiceImpl implements RTCSInboundService {
	
	
	@Resource(name="rTCSInboundMapDAO")
	RTCSInboundMapDAO rTCSInboundMapDAO;

	//목록조회
	public List<Map> getInboundList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSInboundMapDAO.getInboundList(inVar, outDataset);
	}
		
	public Map qmsList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSInboundMapDAO.qmsList(inVar, outDataset);
	}
}

/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMMenuProRegMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMProRegMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMProMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMUserMapDAO;
import egovframework.ntrms.kr.co.brn.sample.service.ProGramService;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDClaimMapDAO;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDContractMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDContractService")
@SuppressWarnings("unchecked")
public class RTSDContractServiceImpl extends EgovAbstractServiceImpl implements RTSDContractService {
	
	@Resource(name="rTSDContractMapDAO")
	RTSDContractMapDAO rTSDContractMapDAO;
	
	//메인 List
	public Map listContractInfo(Map<String, Object> inVar, Map <String, DataSetMap>outDataset) throws Exception {
		Map result = new HashMap();
		result.put("contractList", rTSDContractMapDAO.listContractInfo(inVar, outDataset));
		return  result;
	}	
	
	//메인 Detail List
	public Map listContractDetail(Map<String, Object> inVar, Map <String, DataSetMap>outDataset) throws Exception {
		Map result = new HashMap();
		result.put("contractListDetail", rTSDContractMapDAO.listContractDetail(inVar, outDataset));
		return  result;
	}	

}

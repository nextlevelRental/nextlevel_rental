/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
 *************************************************************************************/

package egovframework.ntrms.kr.co.brn.cms.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMCdGrpMapDAO;
import egovframework.ntrms.kr.co.brn.cms.dao.CMSInterfaceMapDAO;
import egovframework.ntrms.kr.co.brn.cms.dao.KCPHubBatchMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("kCPHubBatchService")
@SuppressWarnings("unchecked")

public class KCPHubBatchServiceImpl extends EgovAbstractServiceImpl implements KCPHubBatchService {
	protected Log logger = LogFactory.getLog(this.getClass());

	@Resource(name="kCPHubBatchMapDAO")
	KCPHubBatchMapDAO kCPHubBatchMapDAO;
	
	public Map kcphubBatch(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		return kCPHubBatchMapDAO.kcphubBatch(inVar);
	}	

	public Map kcphubBatchResult(Map <String, DataSetMap> inDsMap, Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		DataSetMap inDsMap2 = (DataSetMap)inDsMap.get("input");
		
		for(int i = 0; i<inDsMap2.size(); i++) {
			inDsMap2.get(i).put(NexacroConstant.DATASET_ROW_TYPE,  DataSet.ROW_TYPE_UPDATED);
			inDsMap2.get(i).put("dvsn", "U");
			String resCd = (String)inDsMap2.get(i).get("res_cd");
			inDsMap2.get(i).remove("bkeyChk");
			if(!"0000".equals(resCd)) {
				inDsMap2.get(i).put("bkeyChk", "N");
			} else {
				inDsMap2.get(i).put("bkeyChk", "Y");
			}
		}

		inVar.put("inDsMap", inDsMap2);
		inVar.put("sqlnamespace", "cardReqDAO.saveCardBatchResult");
		return kCPHubBatchMapDAO.kcphubBatchResult(inVar);
	}
}

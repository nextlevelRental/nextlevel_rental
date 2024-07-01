/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMGrpRegMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMProMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMUserMapDAO;
import egovframework.ntrms.kr.co.brn.sample.service.ProGramService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCMGrpRegService")
@SuppressWarnings("unchecked")
public class RTCMGrpRegServiceImpl extends EgovAbstractServiceImpl implements RTCMGrpRegService {
	
	@Resource(name="rTCMGrpRegMapDAO")
	RTCMGrpRegMapDAO rTCMGrpRegMapDAO;

	//목록조회
		public List<Map> getGrpRegList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
			return rTCMGrpRegMapDAO.getGrpRegList(inVar, outDataset);
		}
		
		//데이타생성, 수정, 삭제
		public Map grpRegSaveDaset(Map<String, DataSetMap> inDataset, Map <String, Object> inVar)
			throws Exception {
			DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
			
			
			for(int i = 0; i<inDsMap.size(); i++) {
				//Map map = inDsMap.get(i);
				inDsMap.get(i).put("authGrpCd", inVar.get("authGrpCd"));
				inDsMap.get(i).put("regId", inVar.get("logInId"));
				int rowType = ((Integer) inDsMap.get(i).get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
				
				if(rowType == DataSet.ROW_TYPE_INSERTED) { //1
					inDsMap.get(i).put("dvsn", "U");
					inDsMap.get(i).put("delFg", "N");
				} else if(rowType == DataSet.ROW_TYPE_UPDATED) { //2
					inDsMap.get(i).put("dvsn", "U");
					inDsMap.get(i).put("delFg", "N");
				} else if(rowType == DataSet.ROW_TYPE_DELETED) { //3
					inDsMap.get(i).put("dvsn", "D");
					inDsMap.get(i).put("delFg", "Y");
				}
				
			}
			inVar.put("inDsMap", inDsMap);
			inVar.put("sqlnamespace", "grpReg.saveGrpRegInfo");
			return rTCMGrpRegMapDAO.saveGrpRegInfo(inVar);
		}
		
		public List<Map> authGroupUserList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
			return rTCMGrpRegMapDAO.authGroupUserList(inVar, outDataset);
		}
		
		public List<Map> authGroupUserNotList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
			return rTCMGrpRegMapDAO.authGroupUserNotList(inVar, outDataset);
		}
	
	
}

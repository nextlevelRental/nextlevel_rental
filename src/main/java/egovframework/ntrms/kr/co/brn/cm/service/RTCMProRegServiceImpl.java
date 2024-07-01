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

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMProRegMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMProMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMUserMapDAO;
import egovframework.ntrms.kr.co.brn.sample.service.ProGramService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCMProRegService")
@SuppressWarnings("unchecked")
public class RTCMProRegServiceImpl extends EgovAbstractServiceImpl implements RTCMProRegService {
	
	@Resource(name="rTCMProRegMapDAO")
	RTCMProRegMapDAO rTCMProRegMapDAO;

	//목록조회
		public List<Map> getGrpRegList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
			return rTCMProRegMapDAO.getGrpRegList(inVar, outDataset);
		}
		
		//데이타생성, 수정, 삭제
		public Map proRegSaveDaset(Map<String, DataSetMap> inDataset, Map <String, Object> inVar)
			throws Exception {
			DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
			for(int i = 0; i<inDsMap.size(); i++) {
				Map map = inDsMap.get(i);
				map.put("authGrpCd", inVar.get("authGrpCd"));
				map.put("regId", inVar.get("logInId"));
				int rowType = ((Integer) map.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
				if(rowType == DataSet.ROW_TYPE_INSERTED) { //1
					map.put("dvsn", "U");
					map.put("delFg", "N");
				} else if(rowType == DataSet.ROW_TYPE_UPDATED) { //2
					map.put("dvsn", "U");
					map.put("delFg", "N");
				} else if(rowType == DataSet.ROW_TYPE_DELETED) { //3
					map.put("dvsn", "D");
					map.put("delFg", "Y");
				}
				
				
			}
			inVar.put("inDsMap", inDsMap);
			inVar.put("sqlnamespace", "proReg.saveProRegInfo");
			return rTCMProRegMapDAO.saveProRegInfo(inVar);
		}
		
		public List<Map> authGroupProList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
			return rTCMProRegMapDAO.authGroupProList(inVar, outDataset);
		}
		
		public List<Map> authGroupProNotList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
			return rTCMProRegMapDAO.authGroupProNotList(inVar, outDataset);
		}
	
	
}

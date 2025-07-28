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

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMMenuRegMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCMMenuRegService")
@SuppressWarnings("unchecked")
public class RTCMMenuRegServiceImpl extends EgovAbstractServiceImpl implements RTCMMenuRegService {
	
	@Resource(name="rTCMMenuRegMapDAO")
	RTCMMenuRegMapDAO rTCMMenuRegMapDAO;

	//목록조회
		public List<Map> getMenuRegList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
			return rTCMMenuRegMapDAO.getMenuRegList(inVar, outDataset);
		}
		
		//데이타생성, 수정, 삭제
		public Map menuRegSaveDaset(Map<String, DataSetMap> inDataset, Map <String, Object> inVar)
			throws Exception {
			DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
			for(int i = 0; i<inDsMap.size(); i++) {
				Map map = inDsMap.get(i);
				map.put("authGrpCd", inVar.get("authGrpCd"));
				map.put("regId", inVar.get("regId"));
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
			inVar.put("sqlnamespace", "menuReg.saveMenuRegInfo");
			return rTCMMenuRegMapDAO.saveMenuRegInfo(inVar);
		}

		
		public List<Map> authGroupMenuList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
			return rTCMMenuRegMapDAO.authGroupMenuList(inVar, outDataset);
		}
		
		public List<Map> authGroupMenuNotList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
			return rTCMMenuRegMapDAO.authGroupMenuNotList(inVar, outDataset);
		}
	
	
}

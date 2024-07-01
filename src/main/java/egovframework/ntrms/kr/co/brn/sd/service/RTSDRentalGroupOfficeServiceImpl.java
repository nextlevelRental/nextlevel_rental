/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.sample.service.ProGramService;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDRentalGroupOfficeMapDAO;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDRentalMasterMapDAO;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDRentalGroupOfficeService")
@SuppressWarnings("unchecked")
public class RTSDRentalGroupOfficeServiceImpl extends EgovAbstractServiceImpl implements RTSDRentalGroupOfficeService {
	
	@Resource(name="rTSDRentalGroupOfficeMapDAO")
	RTSDRentalGroupOfficeMapDAO rTSDRentalGroupOfficeMapDAO;
	
	//렌탈지사지역 조회
	public Map listRentalGroupOffice(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("rentalGroupOffice", rTSDRentalGroupOfficeMapDAO.listRentalGroupOffice(inVar));
		return  result;
	}

	//저장
	public Map saveRentalGroupOffice(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		for(int i = 0; i<inDsMap.size(); i++) {
			Map map = inDsMap.get(i);
			int rowType = ((Integer) map.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
			if(rowType == DataSet.ROW_TYPE_INSERTED) {
				map.put("dvsn", "I");				
			} else if(rowType == DataSet.ROW_TYPE_UPDATED) {
				map.put("dvsn", "U");				
			} else if(rowType == DataSet.ROW_TYPE_DELETED) {
				map.put("dvsn", "D");				
			}		
		}
		
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "rentalGroupOffice.saveRentalGroupOffice");
		
		return rTSDRentalGroupOfficeMapDAO.saveRentalGroupOffice(inVar);
	}	

}

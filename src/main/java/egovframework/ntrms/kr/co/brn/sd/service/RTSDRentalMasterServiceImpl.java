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
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDRentalMasterMapDAO;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDRentalMasterService")
@SuppressWarnings("unchecked")
public class RTSDRentalMasterServiceImpl extends EgovAbstractServiceImpl implements RTSDRentalMasterService {
	
	@Resource(name="rTSDRentalMasterMapDAO")
	RTSDRentalMasterMapDAO rTSDRentalMasterMapDAO;
	
	//렌탈  Master
	public Map listRentalMaster(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("rentalMaster", rTSDRentalMasterMapDAO.listRentalMaster(inVar));
		return  result;
	}
	
	//렌탈 관리지역
	public Map listMgmtArea(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("rentalMgtArea", rTSDRentalMasterMapDAO.listMgmtArea(inVar));
		return  result;
	}
	
	//소속판매인 조회
	public Map listSalesAgent(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("rentalSalesAgent", rTSDRentalMasterMapDAO.listSalesAgent(inVar));
		return  result;
	}

	public int getNuSeq(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		return rTSDRentalMasterMapDAO.getNuSeq(inVar);
	}	
	
	//저장
	public Map saveRentalMaster (Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap1 = (DataSetMap)inDataset.get("input1");
		Map areaMap = new HashMap();
		for(int i = 0; i<inDsMap1.size(); i++) {
			areaMap = inDsMap1.get(i);
			int rowType = ((Integer) areaMap.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
			if(rowType == DataSet.ROW_TYPE_INSERTED) {
				areaMap.put("dvsn", "I");				
			} else if(rowType == DataSet.ROW_TYPE_UPDATED) {
				areaMap.put("dvsn", "U");				
			}	
		}		
		areaMap.put("inDsMap", inDsMap1);
		areaMap.put("sqlnamespace", "rentalMaster.saveRentalMaster");
		
		DataSetMap inDsMap2 = (DataSetMap)inDataset.get("input2");
		Map officeMap = new HashMap();
		for(int i = 0; i<inDsMap2.size(); i++) {
			officeMap = inDsMap2.get(i);
			int rowType = ((Integer) officeMap.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
			if(rowType == DataSet.ROW_TYPE_INSERTED) {
				officeMap.put("dvsn", "I");				
			} else if(rowType == DataSet.ROW_TYPE_UPDATED) {
				officeMap.put("dvsn", "U");				
			} else if(rowType == DataSet.ROW_TYPE_DELETED) {
				officeMap.put("dvsn", "D");
			}		
		}		
		officeMap.put("inDsMap", inDsMap2);
		officeMap.put("sqlnamespace", "rentalMaster.saveRentalArea");		
				
		List list = new ArrayList();
		list.add(areaMap);
		list.add(officeMap);
		
		return rTSDRentalMasterMapDAO.saveRentalMaster (inVar, list);
	}		
}

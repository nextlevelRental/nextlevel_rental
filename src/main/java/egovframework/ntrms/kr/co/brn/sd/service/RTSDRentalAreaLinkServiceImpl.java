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
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDRentalAreaLinkMapDAO;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDRentalAreaLinkService")
@SuppressWarnings("unchecked")
public class RTSDRentalAreaLinkServiceImpl extends EgovAbstractServiceImpl implements RTSDRentalAreaLinkService {
	
	@Resource(name="rTSDRentalAreaLinkMapDAO")
	RTSDRentalAreaLinkMapDAO rTSDRentalAreaLinkMapDAO;
	
	//사용자 렌탈그룹 조회 
	public Map userRentalGroupInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("userRentalGroupInfo", rTSDRentalAreaLinkMapDAO.userRentalGroupInfo(inVar));
		return  result;
	} 
	 
	//렌탈 지사 List
	public Map listGroupInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listGroupInfo", rTSDRentalAreaLinkMapDAO.listGroupInfo(inVar));
		return  result;
	}

	//렌탈 지역 List
	public Map listOfficeInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listOfficeInfo", rTSDRentalAreaLinkMapDAO.listOfficeInfo(inVar));
		return  result;
	}
	
	//렌탈 지사 저장
	public Map saveRentalMst (Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap1 = (DataSetMap)inDataset.get("input1");
		Map areaMap = new HashMap();
		for(int i = 0; i<inDsMap1.size(); i++) {
			areaMap = inDsMap1.get(i);
			int rowType = ((Integer) areaMap.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
			if(rowType == DataSet.ROW_TYPE_INSERTED) {
				areaMap.put("dvsn", "I");				
			} else if(rowType == DataSet.ROW_TYPE_UPDATED) {
				areaMap.put("dvsn", "U");				
			} else if(rowType == DataSet.ROW_TYPE_DELETED) {
				areaMap.put("dvsn", "D");				
			}		
		}		
		areaMap.put("inDsMap", inDsMap1);
		areaMap.put("sqlnamespace", "rentalAreaLink.saveRentalMst");
		
		List list = new ArrayList();
		list.add(areaMap);
		
		return rTSDRentalAreaLinkMapDAO.saveRentalMst (inVar, list);
	}	
	
	//렌탈 지점 저장
	public Map saveRentalDtl (Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap1 = (DataSetMap)inDataset.get("input2");
		Map areaMap = new HashMap();
		for(int i = 0; i<inDsMap1.size(); i++) {
			areaMap = inDsMap1.get(i);
			int rowType = ((Integer) areaMap.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
			if(rowType == DataSet.ROW_TYPE_INSERTED) {
				areaMap.put("dvsn", "I");				
			} else if(rowType == DataSet.ROW_TYPE_UPDATED) {
				areaMap.put("dvsn", "U");				
			} else if(rowType == DataSet.ROW_TYPE_DELETED) {
				areaMap.put("dvsn", "D");				
			}		
		}		
		areaMap.put("inDsMap", inDsMap1);
		areaMap.put("sqlnamespace", "rentalAreaLink.saveRentalDtl");
		
		List list = new ArrayList();
		list.add(areaMap);
		
		return rTSDRentalAreaLinkMapDAO.saveRentalDtl (inVar, list);
	}	
	
}

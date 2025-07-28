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

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.brn.sample.service.ProGramService;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDGroupRegisterMapDAO;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDGroupRegisterService")
@SuppressWarnings("unchecked")
public class RTSDGroupRegisterServiceImpl extends EgovAbstractServiceImpl implements RTSDGroupRegisterService {
	
	@Resource(name="rTSDGroupRegisterMapDAO")
	RTSDGroupRegisterMapDAO rTSDGroupRegisterMapDAO;
	
	//List
	public Map listGroupInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("priceList", rTSDGroupRegisterMapDAO.listGroupInfo(inVar));
		return  result;
	}
	
	//저장
	public Map saveGroupInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
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
		inVar.put("sqlnamespace", "group.saveGroupInfo");
		
		return rTSDGroupRegisterMapDAO.saveGroupInfo(inVar);
	}
	
	//해지
	public Map cancelOrdInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		for(int i = 0; i<inDsMap.size(); i++) {
			Map map = inDsMap.get(i);
			map.put("pkgDcYn", inVar.get("pkgDcYn"));
			map.put("restCnt", inVar.get("restCnt"));
		}		
	
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "group.cancelOrdNo");
				
		
		return rTSDGroupRegisterMapDAO.cancelOrdInfo(inVar);
	}	

	//단체상태 변경(해지)
	public Map cancelOrdInfo_All(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "group.cancelOrdNoAll");
		
		return rTSDGroupRegisterMapDAO.cancelOrdInfo_All(inVar);
	}		
	//List
	
	public Map listAddPackageInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("priceList", rTSDGroupRegisterMapDAO.listAddPackageInfo(inVar));
		return  result;
	}
	
	public Map cancelPackage(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
			
		DataSetMap dsOrdNolistChk = (DataSetMap)inDataset.get("dsOrdNolistChk");
		Map dsOrdNolistChkMap = new HashMap();
		dsOrdNolistChkMap.put("dsOrdNolistChkMap", dsOrdNolistChk);
		dsOrdNolistChkMap.put("sqlnamespace", "group.cancelOrdNo");
		
		DataSetMap dsOrdNolistChk00 = (DataSetMap)inDataset.get("dsOrdNolistChk00");
		Map dsOrdNolistChk00Map = new HashMap();
		dsOrdNolistChk00Map.put("dsOrdNolistChk00Map", dsOrdNolistChk00);
		dsOrdNolistChk00Map.put("sqlnamespace", "group.cancelOrdNo2");
		
		return rTSDGroupRegisterMapDAO.cancelPackage(dsOrdNolistChkMap, dsOrdNolistChk00Map, inVar);		
	}
	
	public Map cancelOrdNo2(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		
		DataSetMap dsOrdNolistChk = (DataSetMap)inDataset.get("dsOrdNolistChk");
		Map dsOrdNolistChkMap = new HashMap();
		dsOrdNolistChkMap.put("dsOrdNolistChkMap", dsOrdNolistChk);
		dsOrdNolistChkMap.put("sqlnamespace", "group.cancelOrdNo");
		
		DataSetMap dsOrdNolistChk00 = (DataSetMap)inDataset.get("dsOrdNolistChk00");
		Map dsOrdNolistChk00Map = new HashMap();
		dsOrdNolistChk00Map.put("dsOrdNolistChk00Map", dsOrdNolistChk00);
		dsOrdNolistChk00Map.put("sqlnamespace", "group.cancelOrdNoGroup");
		
		return rTSDGroupRegisterMapDAO.cancelOrdNo2(dsOrdNolistChkMap, dsOrdNolistChk00Map, inVar);		
	}

	
	public String cancelPrice(Map<String, Object> inVar) throws NtRmsDaoException {
		return rTSDGroupRegisterMapDAO.cancelPrice(inVar);
	}
	
	
}

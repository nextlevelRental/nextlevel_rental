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
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDSaleSubsidyMapDAO;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDSaleSubsidyService")
@SuppressWarnings("unchecked")
public class RTSDSaleSubsidyServiceImpl extends EgovAbstractServiceImpl implements RTSDSaleSubsidyService {
	
	@Resource(name="rTSDSaleSubsidyMapDAO")
	RTSDSaleSubsidyMapDAO rTSDSaleSubsidyMapDAO;
	
	//판매보조금정책항목 목록조회
	public Map listSaleSubsidyInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("SaleSubsidyInfo", rTSDSaleSubsidyMapDAO.listSaleSubsidyInfo(inVar));
		return  result;
	}


	//판매보조금정책항목 저장
	public Map saveSaleSubsidy (Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
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
		areaMap.put("sqlnamespace", "saleSubsidy.saveSaleSubsidy");
		
		List list = new ArrayList();
		list.add(areaMap);
		
		return rTSDSaleSubsidyMapDAO.saveSaleSubsidy (inVar, list);
	}	
	
	
}

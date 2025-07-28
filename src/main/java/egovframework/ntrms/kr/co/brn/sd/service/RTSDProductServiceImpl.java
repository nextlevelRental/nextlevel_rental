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
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDPlanMapDAO;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDProductMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDProductService")
@SuppressWarnings("unchecked")
public class RTSDProductServiceImpl extends EgovAbstractServiceImpl implements RTSDProductService {
	
	@Resource(name="rTSDProductMapDAO")
	RTSDProductMapDAO rTSDProductMapDAO;
	
	//장착 정보 List
	public Map detailProductInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("productList", rTSDProductMapDAO.detailProductInfo(inVar));
		return  result;
	}
	
	//계좌 데이타생성, 수정, 삭제
	public Map saveProductInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "product.saveProductInfo");
		return rTSDProductMapDAO.saveProductInfo(inVar);
	}
	
	public Map saveOrderNo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		
		DataSetMap dsRtsd0100 = (DataSetMap)inDataset.get("input");
		Map dsRtsd0100Map = new HashMap();
		dsRtsd0100Map.put("dsRtsd0100Map", dsRtsd0100);
		dsRtsd0100Map.put("sqlnamespace", "product.saveNoOrderNo");
		
		return rTSDProductMapDAO.saveOrderNo(dsRtsd0100Map,inVar);
	}
	
	public Map TopMenuNoList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	rTSDProductMapDAO.TopMenuNoList(inVar));
		return result;
	}
	public Map TopMenuNoList2(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	rTSDProductMapDAO.TopMenuNoList2(inVar));
		return result;
	}

	public Map saveOrderNo2(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "product.saveNoOrderNo");
		return rTSDProductMapDAO.saveOrderNo2(inVar);
	}

}

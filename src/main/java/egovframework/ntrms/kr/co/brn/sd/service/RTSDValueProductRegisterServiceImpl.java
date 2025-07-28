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

import egovframework.ntrms.kr.co.brn.sample.service.ProGramService;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDValueProductRegisterMapDAO;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDValueProductRegisterService")
@SuppressWarnings("unchecked")
public class RTSDValueProductRegisterServiceImpl extends EgovAbstractServiceImpl implements RTSDValueProductRegisterService {
	
	@Resource(name="rTSDValueProductRegisterMapDAO")
	RTSDValueProductRegisterMapDAO rTSDValueProductRegisterMapDAO;
	
	//부가제품 List
	public Map listProductInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("priceList", rTSDValueProductRegisterMapDAO.listProductInfo(inVar));
		return  result;
	}
	
	//저장
	public Map saveProductInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
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
		inVar.put("sqlnamespace", "vProduct.saveProductInfo");
		
		return rTSDValueProductRegisterMapDAO.saveProductInfo(inVar);
	}

	//부가제품추가 팝업조회 List
	public Map listProductPopInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("priceList", rTSDValueProductRegisterMapDAO.listProductPopInfo(inVar));
		return  result;
	}	
	
	//주문번호별 부가제품 조회 List
	public Map listProductInfoSch(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", rTSDValueProductRegisterMapDAO.listProductInfoSch(inVar));
		return  result;
	}
	
}

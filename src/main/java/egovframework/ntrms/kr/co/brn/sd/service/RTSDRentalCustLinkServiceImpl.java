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
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDRentalCustLinkMapDAO;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDRentalCustLinkService")
@SuppressWarnings("unchecked")
public class RTSDRentalCustLinkServiceImpl extends EgovAbstractServiceImpl implements RTSDRentalCustLinkService {
	
	@Resource(name="rTSDRentalCustLinkMapDAO")
	RTSDRentalCustLinkMapDAO rTSDRentalCustLinkMapDAO;
	
	/* 렌탈지점/판매자연결 MASTER 조회 */
	@SuppressWarnings("rawtypes")
	public Map listRentalCustLinkMstInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("RentalCustLinkMstInfo", rTSDRentalCustLinkMapDAO.listRentalCustLinkMstInfo(inVar));
		return  result;
	}
	
	/* 렌탈지점/판매자연결 DETAIL 조회 */
	@SuppressWarnings("rawtypes")
	public Map listRentalCustLinkDtlInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("RentalCustLinkDtlInfo", rTSDRentalCustLinkMapDAO.listRentalCustLinkDtlInfo(inVar));
		return  result;
	}
	
	/* 렌탈지점/판매자연결 저장 */
	@SuppressWarnings("rawtypes")
	public Map saveRentalCustLink (Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
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
		areaMap.put("sqlnamespace", "rentalCustLink.saveRentalCustLink");
		
		List list = new ArrayList();
		list.add(areaMap);
		
		return rTSDRentalCustLinkMapDAO.saveRentalCustLink (inVar, list);
	}	
	
	/* 미반영판매자 조회 */
	@SuppressWarnings("rawtypes")
	public Map retrieveUnRlsSelerList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listUnRlsSeler", rTSDRentalCustLinkMapDAO.retrieveUnRlsSelerList(inVar));
		
		return  result;
	}
}
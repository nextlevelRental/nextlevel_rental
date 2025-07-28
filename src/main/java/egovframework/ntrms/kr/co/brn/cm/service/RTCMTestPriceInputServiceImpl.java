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

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMMenuProRegMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMProRegMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMProMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMTestPriceInputMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMUserMapDAO;
import egovframework.ntrms.kr.co.brn.sample.service.ProGramService;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCMTestPriceInputService")
@SuppressWarnings("unchecked")
public class RTCMTestPriceInputServiceImpl extends EgovAbstractServiceImpl implements RTCMTestPriceInputService {

	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTCMTestPriceInputMapDAO")
	RTCMTestPriceInputMapDAO rTCMTestPriceInputMapDAO;
	
	//상품및등록비,렌탈료정보
	public Map listProductAndPriceInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("productAndPriceList", rTCMTestPriceInputMapDAO.listProductAndPriceInfo(inVar));
		return  result;
	}

	// 저장
	public Map savePriceInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		//ToDo: 가격정보 조회후 이전데이타 존재할경우 업데이트처리
		//이전일 값이 정상적으로 리턴된경우 이전데이타 업데이트처리

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
		
		logger.debug("===================================================");
		logger.debug(inDsMap);
		logger.debug("===================================================");		
		
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "testprice.savePriceInfo");
		
		return rTCMTestPriceInputMapDAO.savePriceInfo(inVar);
	}

}

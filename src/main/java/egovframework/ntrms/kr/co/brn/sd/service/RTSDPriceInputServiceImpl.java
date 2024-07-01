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
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDPriceInputMapDAO;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDProductMapDAO;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDPriceInputService")
@SuppressWarnings("unchecked")
public class RTSDPriceInputServiceImpl extends EgovAbstractServiceImpl implements RTSDPriceInputService {
	
	@Resource(name="rTSDPriceInputMapDAO")
	RTSDPriceInputMapDAO rTSDPriceInputMapDAO;
	
	//장착 정보 List
	public Map listPriceInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("priceList", rTSDPriceInputMapDAO.listPriceInfo(inVar));
		return  result;
	}
	
	//상품및등록비,렌탈료정보
	public Map listProductAndPriceInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("productAndPriceList", rTSDPriceInputMapDAO.listProductAndPriceInfo(inVar));
		return  result;
	}
		
	//가격등록 및 수정처리
	public Map savePriceInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		//가격정보 조회후 이전데이타 존재할경우 업데이트처리
		Map params 		= inDsMap.get(0);
		Map preDayMap 	= rTSDPriceInputMapDAO.exitsPriceDay(params);
		
		
		//이전일 값이 정상적으로 리턴된경우 이전데이타 업데이트처리
		Map update = new HashMap();
		
		String tmpDay = (String)preDayMap.get("result");	//조회결과 시작일자
		String endDay = (String)preDayMap.get("endDay");	//조회결과 종료일자
		String strDay = (String)params.get("strDay");		//입력받은 시작일자
		String preDay = "";
		String seq	  = preDayMap.get("seq") + "";
		
		//조회된 데이타가 있을경우 이전데이타를 업데이트한다.
		if(tmpDay != null && !"".equals(tmpDay)) {
			if(Integer.parseInt(strDay) >= Integer.parseInt(tmpDay)) {
				
				preDay = DateUtil.addDays(strDay, -1);	//입력받은일자하루전
				
				update.put("priceCd",	params.get("priceCd"));
				update.put("matCd", 	params.get("matCd"));
				update.put("periodCd",	params.get("periodCd"));	
				update.put("cntCd", 	params.get("cntCd"));
				update.put("regiCd",	params.get("regiCd"));
				update.put("strDay", 	tmpDay);
				update.put("endDay",	endDay);
				update.put("preDay",	preDay);
				update.put("seq", 		seq);
				update.put("regId", 	inVar.get("regId"));
				
				rTSDPriceInputMapDAO.updatePriceInfo(update);
				
			}
		}
		
		inVar.remove("inDsMap");
		inVar.remove("sqlnamespace");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "price.savePriceInfo");
		return rTSDPriceInputMapDAO.savePriceInfo(inVar);
	}
}

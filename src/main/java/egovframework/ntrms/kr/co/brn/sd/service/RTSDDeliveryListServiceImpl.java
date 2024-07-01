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
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.comm.service.PopupCommonService;
import egovframework.ntrms.kr.co.brn.jco.JCoManager;
import egovframework.ntrms.kr.co.comm.api.LogisticApi;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.property.EgovPropertyService;

@Service("rtsdDeliveryListService")
@SuppressWarnings("unchecked")
public class RTSDDeliveryListServiceImpl extends EgovAbstractServiceImpl implements RTSDDeliveryListService {
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	@Resource(name = "commonService")
	CommonService commonService;
	
	@Resource(name = "rTSDArrivalAlarmListService")
	RTSDArrivalAlarmListService rTSDArrivalAlarmListService;
	
	@Resource(name = "popupCommonService")
	PopupCommonService popupCommonService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name = "logisticApi")
	LogisticApi logisticApi;
	
	/**
	 * 실시간 배송 현황 조회 서비스
	 */
	public List<Map> getDeliveryInfoRealTime(Map<String, Object> inputParams, List paramList, Map<String, Object> addParam) throws Exception {
		
		// SAP 통신
		JCoManager manager = null;
		List<Map<String, String>> li = new ArrayList<>();
		
		String o_Flag = null;
		String o_Message = null;
		try {
			logger.info("==================SAP INTERFACE START =======================");
			logger.info("inputParams::" + inputParams);
			
			manager = new JCoManager("ZNTRMS_O_TRACKING", inputParams, paramList);
			li = manager.getListForTest();
			
			o_Flag = String.valueOf(manager.getReturn().get("TYPE"));
			o_Message = String.valueOf(manager.getReturn().get("MESSAGE"));
			
			logger.info("return::" + manager.getReturn());
			
			if(o_Flag.equals("E")){
				throw new Exception(o_Message);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.error("SAP 통신 불가:::" + e.getMessage());
			throw new Exception(e.getMessage());
		}
		
		logger.info("==================SAP INTERFACE END =======================");
		
		Map<String, Object> param = new HashMap();
		
		// SAP 통신 결과값 처리
		List resultList = new ArrayList();
		Map<String, String> resultMap = new HashMap<>();
		Map statusMap = new HashMap();
		Map ordListMap = null;
		Map ordMap = null;
		List ordList = null;
		
		String zdf3= null;
		String zad = null;
		String type = "01";
		String typeNm = null;
		
		String zcompany = null;
		String invoiceNo = null;
		
		String status = null;
		String statusNm = null;
		String estimate = null;
		
		String abrvw = null;
		String ordType = null;
		
		String sendCnt = "0";
		
		Map codeMap = new HashMap();
		codeMap.put("cdGrpCd", "S315");
		codeMap.put("cd", "01");
		String license = commonService.getCodeName(codeMap);
		
		logisticApi.init();
		
		for(int i=0; i<li.size(); i++){
			
			resultMap.put("BSTKD", String.valueOf(((Map<String, String>)li.get(i)).get("BSTKD")));									//계약번호
			resultMap.put("VBELN_S", String.valueOf(((Map<String, String>)li.get(i)).get("VBELN_S")));							//Sales Order
			resultMap.put("VBELN_D", String.valueOf(((Map<String, String>)li.get(i)).get("VBELN_D")));							//Delivery
			resultMap.put("WADAT", String.valueOf(((Map<String, String>)li.get(i)).get("WADAT")));								//Planned G/I Date
			resultMap.put("SHIPMENT", String.valueOf(((Map<String, String>)li.get(i)).get("SHIPMENT")));						//Shipment No
			resultMap.put("WADAT_IST", String.valueOf(((Map<String, String>)li.get(i)).get("WADAT_IST")));					//G/I Date
			
			//usage유형 변경
			abrvw = String.valueOf(((Map<String, String>)li.get(i)).get("ABRVW"));
			if(abrvw.isEmpty()){
				abrvw = "3PL";
			}else if (abrvw.equals("01")){
				abrvw = "지정일출고";
			}else if (abrvw.equals("02")){
				abrvw = "퀵";
			}else if (abrvw.equals("03")){
				abrvw = "특송";
			}else if (abrvw.equals("04")){
				abrvw = "택배";
			}else if (abrvw.equals("05")){
				abrvw = "P&D";
			}else if (abrvw.equals("06")){
				abrvw = "방문장착";
			}
			
			resultMap.put("ABRVW", abrvw);																								//Usage
			
			zcompany = String.valueOf(((Map<String, String>)li.get(i)).get("ZCOMPANY"));
			invoiceNo = String.valueOf(((Map<String, String>)li.get(i)).get("ZPARCELINVOICE"));
			
			logger.info("=================택배 API START=================");
			logger.info("zcompany::" + zcompany);
			logger.info("invoiceNo::" + invoiceNo);
			
			if(!zcompany.isEmpty() && !invoiceNo.isEmpty()){
				//택배사코드 by 택배사명
				param.put("logisticsCdNm", zcompany);
				String zcompanyCode = rTSDArrivalAlarmListService.getLogisticsCode(param);
				
				resultMap.put("ZCOMPANY", zcompany);			//택배사
				resultMap.put("ZPARCELINVOICE", invoiceNo);		//송장번호
				
				logisticApi.setValue(zcompanyCode, invoiceNo, license);
				statusMap = logisticApi.connect();
				
				//배송도착일자
				estimate = String.valueOf(statusMap.get("estimate"));
				
				//택배API 조회
				//statusMap = rTSDArrivalAlarmListService.getLogisticsStatus(settingMap.get("sendUrl").toString(), settingMap, paramMap);
			}
			if(!String.valueOf(statusMap.get("level")).equals("null")){
				//진행단계 [level 1: 배송준비중, 2: 집화완료, 3: 배송중, 4: 지점 도착, 5: 배송출발, 6:배송 완료]
				status = String.format("%02d", (int)(double)statusMap.get("level"));
				resultMap.put("LOG_STATUS", status);
				
				param.clear();
				param.put("cdGrpCd", "S312");
				param.put("cd", status);
				statusNm = commonService.getCodeName(param);
				
				resultMap.put("LOG_STATUS_NAME", statusNm);
				
				logger.info("status::" + status);
				logger.info("statusNm::" + statusNm);
			}
			
			logger.info("=================택배 API END=================");
			
			zdf3 = String.valueOf(((Map<String, String>)li.get(i)).get("ZDF3_ORDER"));
			zad = String.valueOf(((Map<String, String>)li.get(i)).get("ZAD_ORDER"));
			
			resultMap.put("ZDF3_ORDER", zdf3);					//걱정제로인경우 'X'
			resultMap.put("ZAD_ORDER", zad);					//마모파손인경우 'X'
			
			//01: 일반주문, 02: 걱정제로, 03: 마모파손
			if(zdf3.equals("X")){
				type = "B";
			}else if(zad.equals("X")){
				type = "C";
			}else{
				type = "A";
			}
			
			param.clear();
			param.put("cdGrpCd", "S314");
			param.put("cd", type);
			typeNm = commonService.getCodeName(param);
			
			resultMap.put("TYPE", type);
			resultMap.put("TYPE_NAME", typeNm);
			
			param.put("ordNo", String.valueOf(inputParams.get("I_BSTKD")).substring(0, 12));
			param.put("orderType", type);
			param.put("reqNum", addParam.get("reqNum"));
			ordListMap = popupCommonService.ordNoList4(param);
			ordList = (List)ordListMap.get("ordNoList4");
			
			if(ordList.size() > 0){
				ordMap = (Map)ordList.get(0);
				//추가 정보
				resultMap.put("CUST_NM", String.valueOf(ordMap.get("custNm")));																				//고객명
				resultMap.put("MOB_NO", String.valueOf(ordMap.get("mobNo")));																				//휴대폰번호
				
				if(!String.valueOf(ordMap.get("sendCnt")).equals("null")){
					sendCnt = String.valueOf(ordMap.get("sendCnt"));
				}
				resultMap.put("SEND_CNT", sendCnt);																		    //도착알림문자 발송횟수
				
				//윈터타이어인 경우 매입재고로 표기
				if(String.valueOf(ordMap.get("outStockType")).equals("02")){
					resultMap.put("ABRVW", "매입재고");																								                //Usage
				}
			}
			
			resultList.add(resultMap);
		}
		
		return resultList;
	}
}

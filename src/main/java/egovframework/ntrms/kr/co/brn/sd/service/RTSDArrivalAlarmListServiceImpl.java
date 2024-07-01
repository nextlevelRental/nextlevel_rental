package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDArrivalAlarmListMapDAO;
import egovframework.ntrms.kr.co.comm.api.LogisticApi;
import egovframework.ntrms.kr.co.comm.util.HttpConnectForGet;
import egovframework.ntrms.kr.co.exec.handler.service.ServiceBase;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@Service("rTSDArrivalAlarmListService")
@SuppressWarnings("unchecked")
public class RTSDArrivalAlarmListServiceImpl extends ServiceBase implements RTSDArrivalAlarmListService {
	@Resource(name="rTSDArrivalAlarmListMapDAO")
	RTSDArrivalAlarmListMapDAO rTSDArrivalAlarmListMapDAO;
	
	@Autowired
	CommonService commonService;
	
	@Resource(name = "logisticApi")
	LogisticApi logisticApi;

	/* (non-Javadoc)
	 * @see egovframework.ntrms.kr.co.brn.sd.service.RTSDArrivalAlarmListService#selectArrivalAlarmList(java.util.Map, java.util.Map)
	 * 도착알람문자 집계내역 조회
	 */
	@Override
	public Map selectArrivalAlarmList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result= new HashMap();
		result.put("result", 	rTSDArrivalAlarmListMapDAO.selectArrivalAlarmList(inVar, outDataset));
		return result;
	}
	
	/* (non-Javadoc)
	 * @see egovframework.ntrms.kr.co.brn.sd.service.RTSDArrivalAlarmListService#aggregateArrivalAlarmList(java.util.Map, java.util.Map)
	 * 도착알람문자 집계
	 */
	@Override
	public Map aggregateArrivalAlarmList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset)
			throws Exception {
		inVar.put("sqlnamespace", "rTSDArrivalAlarmList.p_sRTSD0420Aggregate");
		
		return rTSDArrivalAlarmListMapDAO.aggregateArrivalAlarmList(inVar);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.ntrms.kr.co.brn.sd.service.RTSDArrivalAlarmListService#saveArrivalAlarmList(java.util.Map, java.util.Map)
	 * 저장
	 */
	@Override
	public Map saveArrivalAlarmList(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception {
		return rTSDArrivalAlarmListMapDAO.saveArrivalAlarmList(mapInDSM, mapInVar);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.ntrms.kr.co.brn.sd.service.RTSDArrivalAlarmListService#sendArrivalAlarmList(java.util.Map, java.util.Map)
	 * 도착알람문자 발송
	 */
	@Override
	public Map sendArrivalAlarmList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {

		inVar.put("sqlnamespace", "rTSDArrivalAlarmList.p_sRTSD0420SendMsg");
		
		return rTSDArrivalAlarmListMapDAO.sendArrivalAlarmList(inVar);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.ntrms.kr.co.brn.sd.service.RTSDArrivalAlarmListService#selectArrivalAlarmList(java.util.Map, java.util.Map)
	 * 도착알람문자 집계내역 조회
	 */
	@Override
	public Map selectArrivalAlarmHistList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result= new HashMap();
		result.put("result", 	rTSDArrivalAlarmListMapDAO.selectArrivalAlarmHistList(inVar, outDataset));
		return result;
	}

	@Override
	public Map renewArrivalAlarmList(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception {
		
		mapInVar.put("sqlnamespace", "rTSDArrivalAlarmList.p_sRTSD0420Renew");
		
		return rTSDArrivalAlarmListMapDAO.renewArrivalAlarmList(mapInVar);
	}

	@Override
	public Map selectArrivalAlarmByLogisticsList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset)
			throws Exception {
		Map result= new HashMap();
		result.put("result", 	rTSDArrivalAlarmListMapDAO.selectArrivalAlarmByLogisticsList(inVar));
		return result;
	}
	
	@Override
	public Map getLogisticsStatus(String sendUrl, Map<String, Object> settingMap, Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		HttpConnectForGet connectUtil = null;
		Map<String, Object> resultMap = null;
		try {
			
			connectUtil = new HttpConnectForGet();
			resultMap = connectUtil.connect(sendUrl, settingMap, paramMap);
			
		} catch (Exception e) {
			// TODO: handle exception
			new Exception(e.getMessage());
		}
		
		return resultMap;
	}

	@Override
	public Map getLogistics(String sendUrl, Map<String, Object> settingMap, Map<String, Object> paramMap)
			throws Exception {
		// TODO Auto-generated method stub
		HttpConnectForGet connectUtil = null;
		Map<String, Object> resultMap = null;
		try {
			
			connectUtil = new HttpConnectForGet();
			resultMap = connectUtil.connect(sendUrl, settingMap, paramMap);
			
		} catch (Exception e) {
			// TODO: handle exception
			new Exception(e.getMessage());
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> processLogistics(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		String sendUrl = String.valueOf(inVar.get("sendUrl"));
		Map settingMap = (Map<String, Object>)inVar.get("setting");
		Map paramMap = (Map<String, Object>)inVar.get("param");
		
		Map codeMap = new HashMap();
		codeMap.put("cdGrpCd", "S315");
		codeMap.put("cd", "01");
		String license = commonService.getCodeName(codeMap);
		
		paramMap.put("t_key", license);
		
		logisticApi.init();
		logisticApi.setValue(String.valueOf(paramMap.get("t_code")), String.valueOf(paramMap.get("t_invoice")), license);
		Map logistics = logisticApi.connect();
		
		//Map logistics = getLogistics(sendUrl, settingMap, paramMap);
		List<Map> companies = (List<Map>)logistics.get("Company");
		Map result = null;
		
		for(int i=0; i<companies.size(); i++){
			Map company = companies.get(i);
			paramMap.put("logisticsCd", String.valueOf(company.get("Code")));
			paramMap.put("logisticsNm", String.valueOf(company.get("Name")));
			if(Boolean.valueOf(company.get("International").toString())){
				paramMap.put("logisticsInternational", "Y");
			}else{
				paramMap.put("logisticsInternational", "N");
			}
			
			int count = rTSDArrivalAlarmListMapDAO.getLogisticsCount(paramMap);
			if(count == 0){
				paramMap.put("dvsn", "I");
			}else{
				paramMap.put("dvsn", "U");
			}

			rTSDArrivalAlarmListMapDAO.startTransaction();
			result = rTSDArrivalAlarmListMapDAO.updateLogistics(paramMap);
			rTSDArrivalAlarmListMapDAO.endTransaction();
			
			if(result.get("successCode").equals("-1")){
				throw new Exception(String.valueOf(result.get("returnMessage")) + String.valueOf(result.get("errortext")));
			}
		}
		return result;
	}
	
	@Override
	public Map<String, Object> batchLogisticsStatus(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		
		List<Map<String, Object>> list = rTSDArrivalAlarmListMapDAO.selectArrivalAlarmByLogisticsList(inVar);
		
		Map<String, Object> settingMap = (Map<String, Object>)inVar.get("setting");
		Map<String, Object> paramMap = null;
		Map<String, Object> statusMap = null;
		Map<String, Object> resultMap = null;
		
		Map codeMap = new HashMap();
		codeMap.put("cdGrpCd", "S315");
		codeMap.put("cd", "01");
		String license = commonService.getCodeName(codeMap);
		
		logisticApi.init();
		for(Map<String, Object> map : list){
			//택배건들 중 택배사명이 정규화 되어 있지 않아 택배사코드가 없는경우 발생
			if(!String.valueOf(map.get("logisticsCd")).isEmpty()){
				paramMap = new HashMap<>();				
				paramMap.put("t_key", String.valueOf(license));
				paramMap.put("t_code", String.valueOf(map.get("logisticsCd")));
				paramMap.put("t_invoice", String.valueOf(map.get("invoiceNo")));
				
				logisticApi.setValue(String.valueOf(map.get("logisticsCd")), String.valueOf(map.get("invoiceNo")), license);
				statusMap = logisticApi.connect();
				//statusMap = getLogisticsStatus(inVar.get("sendUrl").toString(), settingMap, paramMap);
				
				paramMap.put("dvsn", "U");
				paramMap.put("sendDay", String.valueOf(map.get("sendDay")));
				paramMap.put("ordNo", String.valueOf(map.get("ordNo")));
				paramMap.put("orderType", String.valueOf(map.get("orderType")));
				paramMap.put("invoiceNo", String.valueOf(map.get("invoiceNo")));
				paramMap.put("logistics", String.valueOf(map.get("logisticsNm")));
				paramMap.put("sendCnt", String.valueOf(map.get("sendCnt")));
				paramMap.put("giDay", String.valueOf(map.get("giDay")));
				paramMap.put("giYn", String.valueOf(map.get("giYn")));
				paramMap.put("mobNo", String.valueOf(map.get("mobNo")));
				paramMap.put("smsType", String.valueOf(map.get("smsType")));
				paramMap.put("deliveryType", String.valueOf(map.get("deliveryType")));
				paramMap.put("delYn", String.valueOf(map.get("delYn")));
				paramMap.put("holdYn", String.valueOf(map.get("holdYn")));
				paramMap.put("regId", String.valueOf(inVar.get("userId")));
				
				//진행단계 [level 1: 배송준비중, 2: 집화완료, 3: 배송중, 4: 지점 도착, 5: 배송출발, 6:배송 완료]
				paramMap.put("logisticsStatus", String.format("%02d", (int)(double)statusMap.get("level")));
				
				rTSDArrivalAlarmListMapDAO.startTransaction();
				resultMap = rTSDArrivalAlarmListMapDAO.updateLogisticsStatus(paramMap);
				rTSDArrivalAlarmListMapDAO.endTransaction();
				if(resultMap.get("successCode").equals("-1")){
					throw new Exception(String.valueOf(resultMap.get("returnMessage")) + String.valueOf(resultMap.get("errortext"))); 
				}
			}
		}
		
		return resultMap;
	}

	@Override
	public String getLogisticsCodeName(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		return rTSDArrivalAlarmListMapDAO.getLogisticsCodeName(inVar);
	}
	
	@Override
	public String getLogisticsCode(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		return rTSDArrivalAlarmListMapDAO.getLogisticsCode(inVar);
	}
}

package egovframework.ntrms.kr.co.brn.sd.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.comm.service.PopupCommonService;
import egovframework.ntrms.kr.co.brn.re.service.RTREBondMngService;
import egovframework.ntrms.kr.co.brn.sample.service.SampleService;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDContractRegisterMapDAO;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDCustRegisterMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDCustRegisterService")
@SuppressWarnings("unchecked")
public class RTSDCustRegisterServiceImpl extends EgovAbstractServiceImpl implements RTSDCustRegisterService{
	@Resource(name="rTSDCustRegisterMapDAO")
	RTSDCustRegisterMapDAO rTSDCustRegisterMapDAO;
	
	@Resource(name="rTSDContractRegisterMapDAO")
	RTSDContractRegisterMapDAO rTSDContractRegisterMapDAO;
	
	@Resource(name="rTREBondMngService")
	RTREBondMngService rTREBondMngService;
	
	@Resource(name="sampleService")
	SampleService sampleService;
	
	@Resource(name="rTSDCustRegisterService")
	RTSDCustRegisterService rTSDCustRegisterService;
	
	@Resource(name="popupCommonService")
	PopupCommonService popupCommonService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	
	public String safeKeyConfirm(Map<String, Object> inVar) throws Exception {
		return rTSDCustRegisterMapDAO.safeKeyConfirm(inVar);
	}
	
	public String countSafeKey(Map<String, Object> inVar) throws Exception {
		return rTSDCustRegisterMapDAO.countSafeKey(inVar);
	}
	
	public Map saveSafeKey(Map <String, Object> inVar) throws Exception {
		return rTSDCustRegisterMapDAO.saveSafeKey(inVar);
	}
	
	public int checkBuslNo(Map<String, Object> inVar) throws Exception {
		return rTSDCustRegisterMapDAO.checkBuslNo(inVar);
	}
	
	public Map saveCustRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap inDsMap1 = (DataSetMap)inDataset.get("input1");
		Map dsRtsd0100Map = new HashMap();
		dsRtsd0100Map.put("inDsMap1", inDsMap1);
		dsRtsd0100Map.put("sqlnamespace", "cust.saveRtsd0100");
		
		DataSetMap inDsMap2 = (DataSetMap)inDataset.get("input2");
		Map dsRtsd0110Map = new HashMap();
		dsRtsd0110Map.put("inDsMap2", inDsMap2);
		dsRtsd0110Map.put("sqlnamespace", "cust.saveRtsd0110");
		
		DataSetMap inDsMap3 = (DataSetMap)inDataset.get("input3");
		Map onlineMap = new HashMap();
		onlineMap.put("inDsMap3", inDsMap3);
		onlineMap.put("sqlnamespace", "cust.saveOnline");
		
		DataSetMap inDsMap4 = (DataSetMap)inDataset.get("input4");
		Map onlineUpdateMap = new HashMap();
		onlineUpdateMap.put("inDsMap4", inDsMap4);
		onlineUpdateMap.put("sqlnamespace", "cust.updateOnline");
		
		Map result = rTSDCustRegisterMapDAO.saveCustRegister(dsRtsd0100Map, dsRtsd0110Map, onlineMap, onlineUpdateMap, inVar);
		return result;		
	}
	
	//계좌 select
	public Map getaccList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("accList", 	rTSDCustRegisterMapDAO.getaccList(inVar, outDataset));
		return result;		
	}
	
	//계좌 데이타생성, 수정, 삭제
	public Map saveAccData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar)
		throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		for(int i = 0; i<inDsMap.size(); i++) {
			Map map = inDsMap.get(i);
			map.put("regId", inVar.get("regId"));
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
		inVar.put("sqlnamespace", "cust.saveDataSetBank");
		return rTSDCustRegisterMapDAO.saveAccData(inVar);
		
	}
	
	//카드 select
	public Map getcardList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("cardList", 	rTSDCustRegisterMapDAO.getcardList(inVar, outDataset));
		return result;		
	}
	
	//카드 데이타생성, 수정, 삭제
	public Map saveCardData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar)
		throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		for(int i = 0; i<inDsMap.size(); i++) {
			Map map = inDsMap.get(i);
			map.put("regId", inVar.get("regId"));
			
		}
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "cust.saveDataSetCard");
		return rTSDCustRegisterMapDAO.saveCardData(inVar);
		
	}

	public Map selectRtsd0110(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("selectRtsd0110", 	rTSDCustRegisterMapDAO.selectRtsd0110(inVar, outDataset));
		return result;
	}
	
	public Map selectRtsd0111(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("selectRtsd0111", 	rTSDCustRegisterMapDAO.selectRtsd0111(inVar, outDataset));
		return result;
	}
	
	public Map selectRtsd0111_2(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("selectRtsd0111_2", 	rTSDCustRegisterMapDAO.selectRtsd0111_2(inVar, outDataset));
		return result;
	}
	
	//IR SafeKey 전문내용저장처리
	public Map createIRSafeKey(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		rTSDCustRegisterMapDAO.createIRSafeKey(inVar);
		return inVar;
	}
	//Nice 신용정보 전문내용저장처리
	public Map createNiceTrust(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		rTSDCustRegisterMapDAO.createNiceTrust(inVar);
		return inVar;
	}

	//Nice 신용정보 당일저장건 여부조회(SafeKey + 생성일)
	public Map searchTodayNiceData(Map<String, Object> inVar) throws Exception {
		return rTSDCustRegisterMapDAO.searchTodayNiceData(inVar);
	}
	
	//Nice 신용정보 전문내용저장처리
	public Map createNice0202(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		rTSDCustRegisterMapDAO.createNice0202(inVar);
		return inVar;
	}
	
	public String onlineEnterdupe(Map<String, Object> inVar) throws Exception {
		return rTSDCustRegisterMapDAO.onlineEnterdupe(inVar);
	}
	
	public int onlineDupe(Map<String, Object> inVar) throws Exception {
		return rTSDCustRegisterMapDAO.onlineDupe(inVar);
	}
	
	public Map insertRtsd0110(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {		
		DataSetMap inDsMap2 = (DataSetMap)inDataset.get("input2");
		Map dsRtsd0110Map = new HashMap();
		dsRtsd0110Map.put("inDsMap2", inDsMap2);
		dsRtsd0110Map.put("sqlnamespace", "cust.saveRtsd0110");
		
		Map result = rTSDCustRegisterMapDAO.insertRtsd0110(dsRtsd0110Map, inVar);
		return result;		
	}
	
	/*
	 * SMS메세지 저장
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map saveSmsMsg(Map<String, Object> inVar) throws Exception {	
		return rTSDCustRegisterMapDAO.saveSmsMsg(inVar);		
	}
	
	//재렌탈기준조회
	public List<Map> getReRentalInfo(Map <String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		return rTSDCustRegisterMapDAO.getReRentalInfo(inDataset, inVar);
	}
	
	
	public void beforeCheckEmpInfo(Map <String, Object> inVar) throws Exception {
		
		int monthDelyAmt = 0;
		try{
			
			String custNo = "";
			
			// 01. 나이제한확인
			String birth = String.valueOf(inVar.get("birthDay"));
			int birthYear = Integer.parseInt(birth.substring(0, 4));
			int birthMonth = Integer.parseInt(birth.substring(5, 6));
			int birthDay = Integer.parseInt(birth.substring(7, 8));
			
			Calendar current = Calendar.getInstance();
			int currentYear = current.get(Calendar.YEAR);
			int currentMonth = current.get(Calendar.MONTH) + 1;
			int currentDay = current.get(Calendar.DAY_OF_MONTH);
			
			int age = currentYear - birthYear;
			if(birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) age--;
			
			if(age < 19 || age >= 75){
				throw new Exception("일시불 구매만 가능합니다.(연령 제한)");
			}
			
			
			// 02. 회원정보 체크
			custNo = inVar.get("custNo").toString();
			if(custNo.equals("0")) {
				Map custList = popupCommonService.listCustInfo(inVar);
				List listCustInfo = (List)custList.get("listCustInfo");
				if(listCustInfo.size() > 0) {
					Map custInfo = (Map) listCustInfo.get(0);
					custNo = custInfo.get("custNo").toString();
				}
			}
			

			// 03. 신용정보조회
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyyMMdd", java.util.Locale.KOREA);
			String toDay = formatter.format(new java.util.Date());
			inVar.put("creDay", toDay);
			Map map =rTSDCustRegisterService.searchTodayNiceData(inVar);
			
			int trustLevel = 0;
			int cdLevel = 0;
			if(map != null) {
				inVar.put("cdGrpCd", "S048");
				inVar.put("useYn", "Y");
				Map result = commonService.listCommInfo(inVar);
				List listComm	= (List)result.get("result");
				Map commonMap = (Map)listComm.get(0);
				
				trustLevel = Integer.parseInt(String.valueOf(map.get("crGrade")));
				cdLevel = Integer.parseInt(String.valueOf(commonMap.get("cd")));
				
				if(trustLevel < cdLevel){
					throw new Exception("일시불 구매만 가능합니다.(신용조회)");
				}
			} else {
				//신용조회
				Map niceTrustMap = sampleService.sendNiceTrustInfo(inVar);
				trustLevel = Integer.parseInt(String.valueOf(niceTrustMap.get("trustLevel")));
				cdLevel = Integer.parseInt(String.valueOf(niceTrustMap.get("cdLevel")));
				String returnCode = String.valueOf(niceTrustMap.get("returnCode"));
				if(returnCode.equals("P000")){
					if(trustLevel < cdLevel){
						throw new Exception("일시불 구매만 가능합니다.(신용조회)");
					}
				} else {
					throw new Exception("일시불 구매만 가능합니다.(신용조회)[" + returnCode + "]");
				}
			}
			
			
			if(!custNo.equals("0")) {
				
				// 04. 채권매각확인
				inVar.put("cdGrpCd", "R082");
				inVar.put("cd", "DELY_DAY");
				String delyDay = commonService.getCodeName(inVar);
				
				inVar.put("delyDay", delyDay);
				
				Map saleBondMap = rTREBondMngService.selectSaleBondList(inVar);
				List saleBondList = (List)saleBondMap.get("selectSaleBondList");
				if(saleBondList.size() > 0){
					throw new Exception("일시불 구매만 가능합니다.(채권 매각)");
				}
				
				
				// 05. 연체금액확인
				monthDelyAmt = rTREBondMngService.getMonthDelyAmt(inVar);
				if(monthDelyAmt > 0){
					throw new Exception("연체금액이 존재합니다.(1855-0100 문의)");
				}
				
				
				// 06. 온라인계약 취소 후 한달이내 재주문인 경우
				String orderCancYn = rTSDContractRegisterMapDAO.checkCancOrder(inVar);
				if(orderCancYn.equals("Y")){
					throw new Exception("최초 온라인 계약 고객은 온라인 렌탈 계약만 가능합니다.");
				}

			}
			
		}catch(Exception e){
			throw new Exception(e.getMessage());
		}
		
	}
	
}



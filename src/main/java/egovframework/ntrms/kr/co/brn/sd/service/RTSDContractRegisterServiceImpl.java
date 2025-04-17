package egovframework.ntrms.kr.co.brn.sd.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.re.service.RTREBondMngService;
import egovframework.ntrms.kr.co.brn.sample.service.SampleService;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDContractRegisterMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDContractRegisterService")
@SuppressWarnings("unchecked")
public class RTSDContractRegisterServiceImpl extends EgovAbstractServiceImpl implements RTSDContractRegisterService{
	@Resource(name="rTSDContractRegisterMapDAO")
	RTSDContractRegisterMapDAO rTSDContractRegisterMapDAO;
	
	@Resource(name="rTREBondMngService")
	RTREBondMngService rTREBondMngService;
	
	@Resource(name="sampleService")
	SampleService sampleService;
	
	@Resource(name="rTSDCustRegisterService")
	RTSDCustRegisterService rTSDCustRegisterService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	public Map listRtsd0104(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listRtsd0104", 	rTSDContractRegisterMapDAO.listRtsd0104(inVar, outDataset));
		return result;
	}
	
	public Map listRtsd0106(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listRtsd0106", 	rTSDContractRegisterMapDAO.listRtsd0106(inVar, outDataset));
		return result;
	}
	
	public Map listRtsd0013(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listRtsd0013", 	rTSDContractRegisterMapDAO.listRtsd0013(inVar, outDataset));
		return result;
	}
	
	public Map listRtsd0014(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listRtsd0014", 	rTSDContractRegisterMapDAO.listRtsd0014(inVar, outDataset));
		return result;
	}
	
	public Map applyRtsd0014(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("applyRtsd0014", 	rTSDContractRegisterMapDAO.applyRtsd0014(inVar, outDataset));
		return result;
	}
	
	public Map listRateAmt(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listRateAmt", 	rTSDContractRegisterMapDAO.listRateAmt(inVar, outDataset));
		return result;
	}
	
	public Map saveContractRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap bank = (DataSetMap)inDataset.get("dsRtre0010");
		DataSetMap card = (DataSetMap)inDataset.get("dsRtre0020");
		
		Map bankAndCardMap = new HashMap();
		if( bank.size() != 0 ){
			bankAndCardMap.put("bankAndCardMap", bank);
			bankAndCardMap.put("sqlnamespace", "contact.saveBank");
		}else if( card.size() != 0 ){
			bankAndCardMap.put("bankAndCardMap", card);
			bankAndCardMap.put("sqlnamespace", "contact.saveCard");
		}
		
		
		DataSetMap dsRtsd0104 = (DataSetMap)inDataset.get("dsRtsd0104");
		Map dsRtsd0104Map = new HashMap();
		dsRtsd0104Map.put("dsRtsd0104Map", dsRtsd0104);
//		dsRtsd0104Map.put("sqlHisnamespace", "contact.f_InsertRtsd0105");
		dsRtsd0104Map.put("sqlnamespace", "contact.dsRtsd0104");
		
		DataSetMap dsRtsd0106 = (DataSetMap)inDataset.get("dsRtsd0106");
		Map dsRtsd0106Map = new HashMap();
		dsRtsd0106Map.put("dsRtsd0106Map", dsRtsd0106);
		dsRtsd0106Map.put("sqlnamespaceDel", "contact.f_DeleteRtsd0106New");
		dsRtsd0106Map.put("sqlnamespaceSaleDel", "contact.f_DeleteRtsd0040");
		dsRtsd0106Map.put("sqlnamespace", "contact.dsRtsd0106New");
		
		DataSetMap dsRtsd0013 = (DataSetMap)inDataset.get("dsRtsd0013");
		Map dsRtsd0013Map = new HashMap();
		dsRtsd0013Map.put("dsRtsd0013Map", dsRtsd0013);
		dsRtsd0013Map.put("sqlnamespaceDel", "contact.f_DeleteRtsd0013");
		dsRtsd0013Map.put("sqlnamespace", "contact.dsRtsd0013");
		
		DataSetMap dsRtsd0014 = (DataSetMap)inDataset.get("dsRtsd0014");
		Map dsRtsd0014Map = new HashMap();
		dsRtsd0014Map.put("dsRtsd0014Map", dsRtsd0014);
		dsRtsd0014Map.put("sqlnamespaceDel", "contact.f_DeleteRtsd0014");
		dsRtsd0014Map.put("sqlnamespace", "contact.dsRtsd0014");
		
		DataSetMap dsRtsd0041 = (DataSetMap)inDataset.get("dsRtsd0041");
		Map dsRtsd0041Map = new HashMap();
		dsRtsd0041Map.put("dsRtsd0041Map", dsRtsd0041);
		dsRtsd0041Map.put("sqlnamespaceDel", "contact.f_DeleteRtsd0041");
		dsRtsd0041Map.put("sqlnamespace", "contact.dsRtsd0041");
		
		// 2016-07-28 이영근, 문자메시지 발송 추가
		DataSetMap dsRtsd0205 = (DataSetMap)inDataset.get("dsRtsd0205");
		Map dsRtsd0205Map = new HashMap();
		dsRtsd0205Map.put("dsRtsd0205Map", dsRtsd0205);
		dsRtsd0205Map.put("mobNo", dsRtsd0205.getMapValue(0, "mobNo"));
		dsRtsd0205Map.put("smsMsg", dsRtsd0205.getMapValue(0, "smsMsg"));
		dsRtsd0205Map.put("chanCd", dsRtsd0205.getMapValue(0, "chanCd"));
		dsRtsd0205Map.put("sqlnamespace", "cust.saveSmsMsg");		
		
		// [20181122_01] 방문장착 추가
		DataSetMap dsRtsd0401 = (DataSetMap)inDataset.get("dsRtsd0401");
		Map dsRtsd0401Map = new HashMap();
		dsRtsd0401Map.put("dsRtsd0401Map", dsRtsd0401);
		dsRtsd0401Map.put("sqlnamespace", "contact.dsRtsd0401"); 
		
		// [20191205_01] 거점정보추가
		DataSetMap dsRtsd0213 = (DataSetMap)inDataset.get("dsRtsd0213");
		Map dsRtsd0213Map = new HashMap();
		dsRtsd0213Map.put("dsRtsd0213Map", dsRtsd0213);

		return rTSDContractRegisterMapDAO.saveContractRegister(bankAndCardMap, dsRtsd0104Map, dsRtsd0106Map, dsRtsd0013Map, dsRtsd0014Map, dsRtsd0205Map, dsRtsd0041Map, dsRtsd0401Map, dsRtsd0213Map, inVar);		
	}
	
	
	public int selectRtsd0108SaleCdCount(Map<String, Object> inVar) throws Exception {
		return rTSDContractRegisterMapDAO.selectRtsd0108SaleCdCount(inVar);
	}
	
	public String selectSalesmanTel(Map<String, Object> inVar) throws Exception {
		return rTSDContractRegisterMapDAO.selectSalesmanTel(inVar);
	}
	
	public String selectFirstDay(Map<String, Object> inVar) throws Exception {
		return rTSDContractRegisterMapDAO.selectFirstDay(inVar);
	}
	
	public String selectFirstDayByTerm(Map<String, Object> inVar) throws Exception {
		return rTSDContractRegisterMapDAO.selectFirstDayByTerm(inVar);
	}
	
	public String sRtsd0104ChanCd(Map<String, Object> inVar) throws Exception {
		return rTSDContractRegisterMapDAO.sRtsd0104ChanCd(inVar);
	}
	
	public Map sRtsd0113UserGrp(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("sRtsd0113UserGrp", 	rTSDContractRegisterMapDAO.sRtsd0113UserGrp(inVar, outDataset));
		return result;
	}

	public Map listAddProduct(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	rTSDContractRegisterMapDAO.listAddProduct(inVar));
		return result;
	}
	public Map listGrpAdd(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	rTSDContractRegisterMapDAO.listGrpAdd(inVar));
		return result;
	}
	
	public Map cntPrdPymInfoList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("cntPrdPymInfoList", 	rTSDContractRegisterMapDAO.cntPrdPymInfoList(inVar, outDataset));
		return result;
	}
	
	public Map listAddSelProduct(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	rTSDContractRegisterMapDAO.listAddSelProduct(inVar));
		return result;
	}
	
	public Map prmmSrvcOrdList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	rTSDContractRegisterMapDAO.prmmSrvcOrdList(inVar));
		return result;
	}
	
	public Map listPrdInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	rTSDContractRegisterMapDAO.listPrdInfo(inVar));
		return result;
	}
	public Map combosetPettern(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("combosetPettern", rTSDContractRegisterMapDAO.combosetPettern(inVar));
		return result;
	}
	public Map combosetStan(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("combosetStan", rTSDContractRegisterMapDAO.combosetStan(inVar));
		return result;
	}
	public String wheelQty(Map<String, Object> inVar) throws Exception {
		return rTSDContractRegisterMapDAO.wheelQty(inVar);
	}
	public String wheelQtyLt(Map<String, Object> inVar) throws Exception {
		return rTSDContractRegisterMapDAO.wheelQtyLt(inVar);
	}
	public Map saveRtsd0213(Map <String, Object> inVar) throws Exception {
		return rTSDContractRegisterMapDAO.saveRental2Oms(inVar);		
	}
	public Map tmsSchedule(Map <String, Object> inVar) throws Exception {
		return rTSDContractRegisterMapDAO.tmsSchedule(inVar);
	}
	public String o2oAgencyYn(Map <String, Object> inVar) throws Exception {
		return rTSDContractRegisterMapDAO.o2oAgencyYn(inVar);
	}
	public Map o2oAgencyInfo(Map <String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", rTSDContractRegisterMapDAO.o2oAgencyInfo(inVar));
		return result;
	}
	public Map o2oAgencyTime(Map <String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", rTSDContractRegisterMapDAO.o2oAgencyTime(inVar));
		return result;
	}
	public int o2oAgencyStock(Map <String, Object> inVar) throws Exception {
		return rTSDContractRegisterMapDAO.o2oAgencyStock(inVar);
	}
	public int o2oAgencyStock2(Map <String, Object> inVar) throws Exception {
		return rTSDContractRegisterMapDAO.o2oAgencyStock2(inVar);
	}
	public int o2oAgencyStockTot(Map <String, Object> inVar) throws Exception {
		return rTSDContractRegisterMapDAO.o2oAgencyStockTot(inVar);
	}
	public String selectBeforeAfterDay(Map <String, Object> inVar) throws Exception {
		return rTSDContractRegisterMapDAO.selectBeforeAfterDay(inVar);
	}
	public Map listSendContract(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listSendContract", 	rTSDContractRegisterMapDAO.listSendContract(inVar));
		return result;
	}
	public String getIsDupOrder(Map<String, Object> inVar) throws Exception {
		return rTSDContractRegisterMapDAO.getIsDupOrder(inVar);
	}

	public void beforeOrderConfirm(Map <String, Object> inVar) throws Exception {
		
		int monthDelyAmt = 0;
		try{
			
			//채권매각고객확인
			inVar.put("cdGrpCd", "R082");
			inVar.put("cd", "DELY_DAY");
			String delyDay = commonService.getCodeName(inVar);
			
			inVar.put("delyDay", delyDay);			
			
			Map saleBondMap = rTREBondMngService.selectSaleBondList(inVar);
			List saleBondList = (List)saleBondMap.get("selectSaleBondList");
			if(saleBondList.size() > 0){
				throw new Exception("일시불 구매만 가능합니다.(채권 매각)");
			}
			
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
				}else{
					throw new Exception("일시불 구매만 가능합니다.(신용조회)[" + returnCode + "]");
				}
			}			
			
			//연체금액확인
			monthDelyAmt = rTREBondMngService.getMonthDelyAmt(inVar);
			if(monthDelyAmt > 0){
				throw new Exception("연체금액이 존재합니다.(1855-0100 문의)");
			}
			
			//나이제한확인
			String birth = String.valueOf(inVar.get("birth"));
			int birthYear = Integer.parseInt(birth.substring(0, 4));
			int birthMonth = Integer.parseInt(birth.substring(4, 6));
			int birthDay = Integer.parseInt(birth.substring(6, 8));
			
			Calendar current = Calendar.getInstance();
			int currentYear = current.get(Calendar.YEAR);
			int currentMonth = current.get(Calendar.MONTH) + 1;
			int currentDay = current.get(Calendar.DAY_OF_MONTH);
			
			int age = currentYear - birthYear;
			if(birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) age--;
			
			if(age < 19 || age >= 75){
				throw new Exception("일시불 구매만 가능합니다.(연령 제한)");
			}
			
			//O,M계약 취소 후 한달이내 재주문인 경우
			String orderCancYn = rTSDContractRegisterMapDAO.checkCancOrder(inVar);
			if(orderCancYn.equals("Y")){
				throw new Exception("최초 온라인 계약 고객은 온라인 렌탈 계약만 가능합니다.");
			}
			
		}catch(Exception e){
			throw new Exception(e.getMessage());
		}
		
	}

}

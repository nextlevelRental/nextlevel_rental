package egovframework.ntrms.kr.co.brn.sd.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.re.service.RTREBondMngService;
import egovframework.ntrms.kr.co.brn.sample.service.SampleService;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDContractRegisterMapDAO;
import egovframework.ntrms.kr.co.comm.util.WiderlabHttpConnection;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDContractRegisterService")
@SuppressWarnings("unchecked")
public class RTSDContractRegisterServiceImpl extends EgovAbstractServiceImpl implements RTSDContractRegisterService{
	protected Log logger = LogFactory.getLog(this.getClass());

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

	//	TEMPLATE_SEQ (페이싸인 템플릿 번호)
	//	1678776299950706193 개인 계약서
	//	1677487175997951663 사업자 계약서
	//	1715849025709267949 만족도조사
	//	1740622318620369995 주문등록
	//	1740617118511128007 고객등록
	//
	//	상기 템플릿 변동 사항 있을 시 하단 소스 체크
	//	PKG_RTSD0218
	//	application.properties(카프카 스프링부트)
	//	RTSDCustRegisterServiceImpl.java
	//	RTSDContractRegisterServiceImpl.java
	public Map<String, Object> contractTermsSend(Map<String, Object> inVar) throws Exception {
		String url = "api/v1/document/";
		String subject = "▣ 카카오톡 약관 내용 동의 ▣";
		String successCode = "";
		String returnMessage = "";
		String docSeq = "";
		String seq = "";

		// 와이더랩 HTTP 연결 객체 및 결과 저장 변수들
		WiderlabHttpConnection widerlabConn;
		List<Map<String, Object>> responseReceiversListMap;
		List<Map<String, Object>> senderDataListMap = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> receiversListMap = new ArrayList<Map<String, Object>>();
		Map<String, Object> receiversMap = new HashMap<String, Object>();
		Map<String, Object> requestBodyMap = new HashMap<String, Object>();
		Map<String, Object> requestMap = new HashMap<String, Object>();
		Map<String, Object> returnWiderlabSeq = new HashMap<String, Object>();
		Map<String, Object> responseReceiversMap;
		Map<String, Object> responseResult;
		Map<String, Object> returnResponse;
		Map<String, Object> senderDataMap;
		returnWiderlabSeq.put("docSeq", "");
		returnWiderlabSeq.put("seq", "");

		try {
			// 수신자 정보 설정
			String[] fieldIds	= {"text_6",		"text_7",		"text_8",		"text_9",		"text_10",		"text_11",		"text_12",		"text_13",		"text_15"};
			String[] values	= {"custNm",		"mobNo",		"modelNm",	"carNo",		"matNm",		"cntNm",		"periodNm",	"rentAmt",	"saleProdNm"};

			for (int i = 0; i < fieldIds.length; i++) {
				senderDataMap = new HashMap<String, Object>();
				senderDataMap.put("field_id", fieldIds[i]);
				senderDataMap.put("value", inVar.get(values[i]).toString());
				senderDataListMap.add(senderDataMap);
			}

			receiversMap.put("name", inVar.get("custNm").toString());
			receiversMap.put("phone", inVar.get("mobNo").toString());
			receiversMap.put("birth", inVar.get("birthDay").toString());
			receiversMap.put("sender_data", senderDataListMap);
			receiversListMap.add(receiversMap);

			// 요청 본문 설정
			requestBodyMap.put("vsubject", subject);
			requestBodyMap.put("template_seq", 1740622318620369995L); // 템플릿 시퀀스
			requestBodyMap.put("use_doc_repository", false);
			requestBodyMap.put("send_method", "K"); // 카카오톡
			requestBodyMap.put("vexpire_in", 168); // 유효시간 (시간 단위)
			requestBodyMap.put("qrcode_send", 0);
			requestBodyMap.put("is_reserved", false);
			requestBodyMap.put("send_seperate", false);
			requestBodyMap.put("need_verification", false);
			requestBodyMap.put("receivers", receiversListMap);

			// 요청 맵핑
			requestMap.put("url", url);
			requestMap.put("method", "PUT");

			// 와이더랩 HTTP 연결 및 요청 전송
			widerlabConn = new WiderlabHttpConnection();
			responseResult = widerlabConn.connectSend(requestMap, requestBodyMap);

			successCode = responseResult.get("successCode").toString();
			returnMessage = responseResult.get("returnMessage").toString();

			// 문서 생성 성공시
			if (successCode.equals("0")) {
				returnResponse = new Gson().fromJson(responseResult.get("returnResponse").toString(), Map.class);
				responseReceiversListMap = (List<Map<String, Object>>) returnResponse.get("receivers");
				responseReceiversMap = responseReceiversListMap.get(0);
				docSeq = returnResponse.get("doc_seq").toString();
				seq = responseReceiversMap.get("seq").toString();

				logger.debug("##########와이더랩 doc_seq : " + docSeq);
				logger.debug("##########와이더랩 seq : " + seq);

				// 요청 맵핑
				requestMap.put("url", url + docSeq);
				requestMap.put("method", "POST");

				// 와이더랩 HTTP 연결 및 요청 전송
				widerlabConn = new WiderlabHttpConnection();
				responseResult = widerlabConn.connectSend(requestMap, null);

				successCode = responseResult.get("successCode").toString();
				returnMessage = responseResult.get("returnMessage").toString();

				// 문서 발송 성공시
				if (successCode.equals("0")) {
					returnWiderlabSeq.put("docSeq", docSeq);
					returnWiderlabSeq.put("seq", seq);
				}
			}

			logger.debug("##########와이더랩 successCode : " + successCode);
			logger.debug("##########와이더랩 returnMessage : " + returnMessage);
		} catch (Exception e) {
			logger.debug("##########와이더랩 오류 : " + e.toString());
		} finally {
			// 로그 적재
			Map<String, Object> logMap = new HashMap<String, Object>();
			logMap.put("templateSeq", "1740622318620369995");
			logMap.put("receiverSeq", seq);
			logMap.put("docSeq", docSeq);
			logMap.put("sendCode", successCode);
			logMap.put("sendMessage", returnMessage);
			logMap.put("ordNo", "999999999999");
			logMap.put("custNo", "9999999999");
			logMap.put("custNm", inVar.get("custNm").toString());
			logMap.put("mobNo", inVar.get("mobNo").toString());
			logMap.put("birthDay", inVar.get("birthDay").toString());
			logMap.put("state", "SENT");
			logMap.put("regId", inVar.get("userId").toString());
			logMap.put("chgId", inVar.get("userId").toString());
			commonService.insertRtsd0218(logMap);
		}

		return returnWiderlabSeq;
	}

	public Map<String, Object> contractTermsSendCheck(Map<String, Object> inVar) throws Exception {
		String docSeq = inVar.get("docSeq").toString();
		String seq = inVar.get("seq").toString();
		String state = "";
		String successCode = "";;
		String returnMessage = "";;

		// 와이더랩 HTTP 연결 객체 및 결과 저장 변수들
		WiderlabHttpConnection widerlabConn;
		List<Map<String, Object>> responseReceiverStateListMap;
		Map<String, Object> requestMap = new HashMap<String, Object>();
		Map<String, Object> returnResult = new HashMap<String, Object>();
		Map<String, Object> responseReceiverStateMap;
		Map<String, Object> responseResult;
		Map<String, Object> returnResponse;

		try {
			// 요청 맵핑
			requestMap.put("url", "api/v1/receiver_state/" + docSeq + "/" + seq);
			requestMap.put("method", "GET");

			// 와이더랩 HTTP 연결 및 요청 전송
			widerlabConn = new WiderlabHttpConnection();
			responseResult = widerlabConn.connectCheck(requestMap, null);

			successCode = responseResult.get("successCode").toString();
			returnMessage = responseResult.get("returnMessage").toString();

			// 문서 조회 성공시
			if (successCode.equals("0")) {
				returnResponse = new Gson().fromJson(responseResult.get("returnResponse").toString(), Map.class);
				responseReceiverStateListMap = (List<Map<String, Object>>) returnResponse.get("receiver_state");
				responseReceiverStateMap = responseReceiverStateListMap.get(0);
				state = responseReceiverStateMap.get("state").toString();

				logger.debug("##########와이더랩 state : " + state);

				// 상태가 'COMPLETED'가 아닐 경우 처리
				if (!state.equals("COMPLETED")) {
					successCode = "1";
					returnMessage = "[" + state + "] : " + (getStateMessage(state));
				}
			}

			logger.debug("##########와이더랩 결과 코드 : " + successCode);
			logger.debug("##########와이더랩 결과 메시지 : " + returnMessage);

			returnResult.put("successCode", successCode);
			returnResult.put("returnMessage", returnMessage);
		} catch (Exception e) {
			logger.debug("##########와이더랩 오류 : " + e.toString());
			returnResult.put("successCode", "-1");
			returnResult.put("returnMessage", e.toString());
		} finally {
			// 로그 적재
			Map<String, Object> logMap = new HashMap<String, Object>();
			logMap.put("receiverSeq", seq);
			logMap.put("docSeq", docSeq);
			logMap.put("sendCode", successCode);
			logMap.put("sendMessage", returnMessage);
			logMap.put("state", state);
			logMap.put("chgId", inVar.get("userId").toString());
			commonService.updateRtsd0218(logMap);
		}

		return returnResult;
	}


	private String getStateMessage(String state) {
		switch (state) {
		case "TEMP":					return "임시보관";
		case "RESERVED":			return "예약 중";
		case "FAILED":				return "발송실패";
		case "WAIT":					return "발송준비";
		case "SENT":					return "발송완료";
		case "RECEIVED":			return "문서수신";
		case "READ":					return "문서열람";
		case "EXPIRED":				return "기한만료";
		case "SENT_EXPIRED":		return "발송 후 기한만료";
		case "RECEIVED_EXPIRED": return "수신 후 기한만료";
		case "READ_EXPIRED":		return "열람 후 기한만료";
		default:						return "상태 조회 불가";
		}
	}

}

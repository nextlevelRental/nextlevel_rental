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
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.comm.service.PopupCommonService;
import egovframework.ntrms.kr.co.brn.re.service.RTREBondMngService;
import egovframework.ntrms.kr.co.brn.sample.service.SampleService;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDContractRegisterMapDAO;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDCustRegisterMapDAO;
import egovframework.ntrms.kr.co.comm.util.WiderlabHttpConnection;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDCustRegisterService")
@SuppressWarnings("unchecked")
public class RTSDCustRegisterServiceImpl extends EgovAbstractServiceImpl implements RTSDCustRegisterService{
	protected Log logger = LogFactory.getLog(this.getClass());

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
	public Map<String, Object> infoPrvAgreeSend(Map<String, Object> inVar) throws Exception {
		String url = "api/v1/document/";
		String subject = "▣ 카카오톡 정보 제공 동의 ▣";
		String successCode = "";
		String returnMessage = "";
		String docSeq = "";
		String seq = "";

		// 와이더랩 HTTP 연결 객체 및 결과 저장 변수들
		WiderlabHttpConnection widerlabConn;
		List<Map<String, Object>> responseReceiversListMap;
		List<Map<String, Object>> receiversListMap = new ArrayList<Map<String, Object>>();
		Map<String, Object> receiversMap = new HashMap<String, Object>();
		Map<String, Object> requestBodyMap = new HashMap<String, Object>();
		Map<String, Object> requestMap = new HashMap<String, Object>();
		Map<String, Object> returnWiderlabSeq = new HashMap<String, Object>();
		Map<String, Object> responseReceiversMap;
		Map<String, Object> responseResult;
		Map<String, Object> returnResponse;
		returnWiderlabSeq.put("docSeq", "");
		returnWiderlabSeq.put("seq", "");

		try {
			// 수신자 정보 설정
			receiversMap.put("name", inVar.get("custNm").toString());
			receiversMap.put("phone", inVar.get("mobNo").toString());
			receiversMap.put("birth", inVar.get("birthDay").toString());
			receiversListMap.add(receiversMap);

			// 요청 본문 설정
			requestBodyMap.put("vsubject", subject);
			requestBodyMap.put("template_seq", 1740617118511128007L); // 템플릿 시퀀스
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
			logMap.put("templateSeq", "1740617118511128007");
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

	public Map<String, Object> infoPrvAgreeSendCheck(Map<String, Object> inVar) throws Exception {
		String docSeq = inVar.get("docSeq").toString();
		String seq = inVar.get("seq").toString();
		String state = "";
		String successCode = "";
		String returnMessage = "";

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

	@Transactional(timeout = 60)
	public void beforeCheckEmpInfo(Map<String, Object> inVar) throws Exception {
		int monthDelyAmt = 0;
		try {
			// 01. 나이제한확인
			String birth = String.valueOf(inVar.get("birthDay"));
			int birthYear = Integer.parseInt(birth.substring(0, 4));
			int birthMonth = Integer.parseInt(birth.substring(4, 6));
			int birthDay = Integer.parseInt(birth.substring(6, 8));

			Calendar current = Calendar.getInstance();
			int currentYear = current.get(Calendar.YEAR);
			int currentMonth = current.get(Calendar.MONTH) + 1;
			int currentDay = current.get(Calendar.DAY_OF_MONTH);

			int age = currentYear - birthYear;
			if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) age--;

			if (age < 19 || age >= 75) {
				throw new Exception("일시불 구매만 가능합니다.(연령 제한)");
			}

			// 02. 회원정보 체크
			String custNo = inVar.get("custNo").toString();
			if ("0".equals(custNo)) {
				Map custList = popupCommonService.listCustInfo(inVar);
				List listCustInfo = (List) custList.get("listCustInfo");
				if (listCustInfo.size() > 0) {
					Map custInfo = (Map) listCustInfo.get(0);
					custNo = custInfo.get("custNo").toString();
					inVar.put("custNo", custNo);
				}
			}

			String safekey = rTSDCustRegisterMapDAO.safeKeyConfirm(inVar);

			if (!"0".equals(safekey)) {
				// 03. 신용정보조회
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd", java.util.Locale.KOREA);
				String toDay = formatter.format(new java.util.Date());
				inVar.put("safekey", safekey);
				inVar.put("creDay", toDay);
				Map map = rTSDCustRegisterService.searchTodayNiceData(inVar);

				int trustLevel = 0;
				int cdLevel = 0;
				if (map != null) {
					inVar.put("cdGrpCd", "S048");
					inVar.put("useYn", "Y");
					Map result = commonService.listCommInfo(inVar);
					List listComm = (List) result.get("result");
					Map commonMap = (Map) listComm.get(0);

					trustLevel = Integer.parseInt(String.valueOf(map.get("crGrade")));
					cdLevel = Integer.parseInt(String.valueOf(commonMap.get("cd")));

					if (trustLevel < cdLevel) {
						throw new Exception("일시불 구매만 가능합니다.(신용조회)");
					}
				} else {
					// 신용조회
					Map niceTrustMap = sampleService.sendNiceTrustInfo(inVar);
					trustLevel = Integer.parseInt(String.valueOf(niceTrustMap.get("trustLevel")));
					cdLevel = Integer.parseInt(String.valueOf(niceTrustMap.get("cdLevel")));
					String returnCode = String.valueOf(niceTrustMap.get("returnCode"));
					if ("P000".equals(returnCode)) {
						if (trustLevel < cdLevel) {
							throw new Exception("일시불 구매만 가능합니다.(신용조회)");
						}
					} else {
						throw new Exception("일시불 구매만 가능합니다.(신용조회)[" + returnCode + "]");
					}
				}
			} else {
				throw new Exception("인증번호를 확인해주세요.");
			}

			if (!"0".equals(custNo)) {
				// 04. 채권매각확인
				inVar.put("cdGrpCd", "R082");
				inVar.put("cd", "DELY_DAY");
				String delyDay = commonService.getCodeName(inVar);
				inVar.put("delyDay", delyDay);

				Map saleBondMap = rTREBondMngService.selectSaleBondList(inVar);
				List saleBondList = (List) saleBondMap.get("selectSaleBondList");
				if (saleBondList.size() > 0) {
					throw new Exception("일시불 구매만 가능합니다.(채권 매각)");
				}

				// 05. 연체금액확인
				monthDelyAmt = rTREBondMngService.getMonthDelyAmt(inVar);
				if (monthDelyAmt > 0) {
					throw new Exception("연체금액이 존재합니다.(1855-0100 문의)");
				}

				// 06. 온라인계약 취소 후 한달이내 재주문인 경우
				String orderCancYn = rTSDContractRegisterMapDAO.checkCancOrder(inVar);
				if ("Y".equals(orderCancYn)) {
					throw new Exception("최초 온라인 계약 고객은 온라인 렌탈 계약만 가능합니다.");
				}
			}

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}
}

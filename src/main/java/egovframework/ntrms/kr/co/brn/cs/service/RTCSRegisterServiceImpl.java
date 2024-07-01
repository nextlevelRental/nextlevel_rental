/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCSRegisterServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;
import com.sun.org.apache.bcel.internal.generic.NEWARRAY;

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSRegisterMapDAO;
import egovframework.ntrms.kr.co.brn.cs.dao.RTCSResultMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSRegisterService")
@SuppressWarnings("unchecked")

public class RTCSRegisterServiceImpl extends EgovAbstractServiceImpl implements RTCSRegisterService {
	
	@Resource(name="rTCSRegisterMapDAO")
	RTCSRegisterMapDAO rTCSRegisterMapDAO;
	
	@Resource(name="rTCSResultMapDAO")
	RTCSResultMapDAO rTCSResultMapDAO;

	//목록조회
	public List<Map> getRegisterList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSRegisterMapDAO.getRegisterList(inVar, outDataset);
	}
	
	//목록상세조회
	public List<Map> getRegisterInfo(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSRegisterMapDAO.getRegisterInfo(inVar, outDataset);
	}
	
	//질문리스트
	public Map getListQuestion(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		
		Map resultMap = new HashMap();
		List li = rTCSRegisterMapDAO.getListQuestion(inVar, outDataset);
		
		String question01     = "";
		String question02     = "";
		String question03     = "";
		String question04     = "";
		String question05     = "";
		String question06     = "";
		String question07     = "";
		String question08     = "";
		String question09     = "";
		String question10     = "";
		
		List question01List     = new ArrayList();
		List question02List     = new ArrayList();
		List question03List     = new ArrayList();
		List question04List     = new ArrayList();
		List question05List     = new ArrayList();
		List question06List     = new ArrayList();
		List question07List     = new ArrayList();
		List question08List     = new ArrayList();
		List question09List     = new ArrayList();
		List question10List     = new ArrayList();
		
		List listQustAns = new ArrayList();
		
		Map pMap = null;
		if(li.size() > 0) {
			pMap = (Map)li.get(0);
		}
		if(pMap != null) {
			question01 = (String)pMap.get("question01");
			question02 = (String)pMap.get("question02");
			question03 = (String)pMap.get("question03");
			question04 = (String)pMap.get("question04");
			question05 = (String)pMap.get("question05");
			question06 = (String)pMap.get("question06");
			question07 = (String)pMap.get("question07");
			question08 = (String)pMap.get("question08");
			question09 = (String)pMap.get("question09");
			question10 = (String)pMap.get("question10");
		}
		inVar.put("answerNo", question01);
		
		question01List = rTCSRegisterMapDAO.getListAnswer(inVar, outDataset);
		inVar.remove("answerNo");
		inVar.put("answerNo", question02);
		
		question02List = rTCSRegisterMapDAO.getListAnswer(inVar, outDataset);
		inVar.remove("answerNo");
		inVar.put("answerNo", question03);

		question03List = rTCSRegisterMapDAO.getListAnswer(inVar, outDataset);
		inVar.remove("answerNo");
		inVar.put("answerNo", question04);

		question04List = rTCSRegisterMapDAO.getListAnswer(inVar, outDataset);
		inVar.remove("answerNo");
		inVar.put("answerNo", question05);

		question05List = rTCSRegisterMapDAO.getListAnswer(inVar, outDataset);
		inVar.remove("answerNo");
		inVar.put("answerNo", question06);

		question06List = rTCSRegisterMapDAO.getListAnswer(inVar, outDataset);
		inVar.remove("answerNo");
		inVar.put("answerNo", question07);

		question07List = rTCSRegisterMapDAO.getListAnswer(inVar, outDataset);
		inVar.remove("answerNo");
		inVar.put("answerNo", question08);

		question08List = rTCSRegisterMapDAO.getListAnswer(inVar, outDataset);
		
		inVar.remove("answerNo");
		inVar.put("answerNo", question09);
		question09List = rTCSRegisterMapDAO.getListAnswer(inVar, outDataset);
		
		inVar.remove("answerNo");
		inVar.put("answerNo", question10);
		question10List = rTCSRegisterMapDAO.getListAnswer(inVar, outDataset);

		inVar.remove("answerNo");
		inVar.put("callNo", inVar.get("callNo"));
		
		listQustAns = rTCSResultMapDAO.getQustAns(inVar, outDataset);
		
		resultMap.put("question01", question01List);
		resultMap.put("question02", question02List);
		resultMap.put("question03", question03List);
		resultMap.put("question04", question04List);
		resultMap.put("question05", question05List);
		resultMap.put("question06", question06List);
		resultMap.put("question07", question07List);
		resultMap.put("question08", question08List);
		resultMap.put("question09", question09List);
		resultMap.put("question10", question10List);
		resultMap.put("question", li);
		resultMap.put("qustAns", listQustAns);
		
		
		return resultMap;
	}
	
	//답변리스트
	public List<Map> getListAnswer(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSRegisterMapDAO.getListAnswer(inVar, outDataset);
	}
		
	/**
	 * 해피콜 상담등록
	 * 
	 * @param inDataset
	 * @param inVar
	 * @return Map
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-06-22	wjim		[20170621_01] '초기상태' 외의 경우 현재일자를 통화일자로 저장
	 */
	public Map saveRegisterInfo(Map<String, DataSetMap> inDataset, Map inVar) throws Exception {
		
		//계약정보 update
		DataSetMap inDsMap = new DataSetMap();
		Map paramMap  = new HashMap();
		//상태값을 신규생성상태로 세팅한다.
		paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
		paramMap.put("dvsn",  "U");
		paramMap.put("callNo", inVar.get("callNo"));
		paramMap.put("ordNo", inVar.get("ordNo"));
		paramMap.put("callDtl", inVar.get("callDtl"));
		paramMap.put("callStatus", inVar.get("callStatus"));
		paramMap.put("jobCnt", inVar.get("jobCnt"));
		
		Date now = new Date();
		SimpleDateFormat today = new SimpleDateFormat("yyyyMMdd"); //현재날짜 포멧
		
		// 통화상태(H002)에 따라 통화일자에 현재일자 저장
		// - '초기상태(I)'인 경우 현재일자 공란처리. 기타 현재일자 저장 [20170621_01]
		// - [20170621_01] 이전 : '통화완료(C)'의 경우에만 현재일자 저장
		if (inVar.get("callStatus").equals("I")) {			
			paramMap.put("callDay", "");
		} else {
			paramMap.put("callDay", today.format(now));
		}
		
		paramMap.put("regId", inVar.get("regId"));
		/*
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inDsMap.get(0).put("dvsn", "U");
		inDsMap.get(0).put(NexacroConstant.DATASET_ROW_TYPE, DataSet.ROW_TYPE_UPDATED);
		inDsMap.get(0).put("callNo", inVar.get("callNo"));
		inDsMap.get(0).put("ordNo", inVar.get("ordNo"));
		inDsMap.get(0).put("callDtl", inVar.get("callDtl"));
		inDsMap.get(0).put("callStatus", inVar.get("callStatus"));
		*/	
		Map custInfo = new HashMap();
		inDsMap.add(paramMap);
		custInfo.put("inDsMap", inDsMap);
		custInfo.put("sqlnamespace", "register.updateRegister");
		
		//질문 답변 insert
		DataSetMap inDsMap2 = (DataSetMap)inDataset.get("input2");
		inDsMap2.get(0).put("dvsn", "U");
		inDsMap2.get(0).put(NexacroConstant.DATASET_ROW_TYPE, DataSet.ROW_TYPE_INSERTED);
		
		Map questAns = new HashMap();
		questAns.put("inDsMap", inDsMap2);
		questAns.put("sqlnamespace", "register.insertIUD");
		
		//제조사 update insert
		DataSetMap custInfo2 = (DataSetMap)inDataset.get("input2");
		custInfo2.get(0).put("ordNo", inVar.get("ordNo"));
		Map custInfo2Map = new HashMap();
		custInfo2Map.put("inDsMap", custInfo2);
		custInfo2Map.put("sqlnamespace", "register.rtcs0120Register");
		
		List list = new ArrayList();
		list.add(custInfo);
		list.add(questAns);
		list.add(custInfo2Map);
		
		return rTCSRegisterMapDAO.saveRegisterInfo(inVar, list);
	}

	public List<Map> sRtcs0100ServiceHistory(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSRegisterMapDAO.sRtcs0100ServiceHistory(inVar, outDataset);
	}
}

/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTREPaymentServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibatis.common.logging.Log;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMNoticeMapDAO;
import egovframework.ntrms.kr.co.brn.re.dao.RTREPaymentMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREPaymentService")
@SuppressWarnings("unchecked")
public class RTREPaymentServiceImpl extends EgovAbstractServiceImpl implements RTREPaymentService {
	
	protected Log logger = com.ibatis.common.logging.LogFactory.getLog(this.getClass());	
	
	@Resource(name="rTCMNoticeMapDAO")
	RTCMNoticeMapDAO rTCMNoticeMapDAO;
	
	@Resource(name="rTREPaymentMapDAO")
	RTREPaymentMapDAO rTREPaymentMapDAO;

	//결제정보 리스트 조회
	public Map listPayInfo(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listPayInfo", 	rTREPaymentMapDAO.listPayInfo(inVar, outDataset));
		return result;
	}
	//결제정보변경이력 리스트 조회
	public Map listPaymentHist(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listPaymentHist", 	rTREPaymentMapDAO.listPaymentHist(inVar, outDataset));
		return result;
	}
	
	//데이타생성
	public Map savePaymentInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		/*************************
		 * 파일 그룹시퀀스 채번
		 *************************/
		String seq = "";		
		Map seqMap = (Map)rTCMNoticeMapDAO.selectImageSeq();
		seq = String.valueOf(seqMap.get("grpSeq"));
		
		String dvsn = (String)inVar.get("dvsn");		
		//프로그램코드 
		String prgmCd = (String)inVar.get("prgmCd");	
		
		/*************************
		 * 결제정보 변경정보 생성
		 *************************/		
		for(int i = 0; i<inDsMap.size(); i++) {
			inDsMap.get(i).put("dvsn", dvsn);
			inDsMap.get(i).put("fileGrpSeq", seq);
		}
		
		Map payMap = new HashMap();
		payMap.put("inDsMap", inDsMap);
		payMap.put("sqlnamespace", "payment.savePaymentInfo");
		
		/*************************
		 * 파일 정보생성
		 *************************/
		DataSetMap inDsMap2 = (DataSetMap)inDataset.get("userFile");
		for(int i = 0; i<inDsMap2.size(); i++) {
			inDsMap2.get(i).put("dvsn", dvsn);
			inDsMap2.get(i).put("fileGrpSeq", seq);
			inDsMap2.get(i).put("progid", prgmCd);
		}
		
		Map fileMap = new HashMap();
		fileMap.put("inDsMap", inDsMap2);
		fileMap.put("sqlnamespace", "file.insertFileInfo");		
		
		List list = new ArrayList();
		list.add(fileMap);
		list.add(payMap);

		Map result = rTREPaymentMapDAO.savePaymentInfo(inVar, list);

		return result;		
	}	
	//데이타삭제
	public Map delPaymentInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "payment.delPaymentInfo");
		

		Map result = rTREPaymentMapDAO.delPaymentInfo(inVar);
		return result;		
	}
	
	//계좌인증 정상정보 조회
	public Map listTodayCmsInfos(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listTodayCmsInfos", 	rTREPaymentMapDAO.listTodayCmsInfos(inVar, outDataset));
		return result;
	}
}

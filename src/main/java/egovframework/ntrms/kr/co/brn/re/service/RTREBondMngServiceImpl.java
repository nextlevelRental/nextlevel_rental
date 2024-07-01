/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTREBondMngServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 채권관리
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMNoticeMapDAO;
import egovframework.ntrms.kr.co.brn.re.dao.RTREBondMngMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREBondMngService")
@SuppressWarnings("unchecked")
public class RTREBondMngServiceImpl extends EgovAbstractServiceImpl implements RTREBondMngService {
	
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	@Resource(name="rTREBondMngMapDAO")
	RTREBondMngMapDAO rTREBondMngMapDAO;
	
	@Resource(name="rTCMNoticeMapDAO")
	RTCMNoticeMapDAO rTCMNoticeMapDAO;	

	//연체내역 조회
	public Map getArrearsList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = (Map)rTREBondMngMapDAO.getArrearsList(inVar, outDataset);
		return result;
	}
	
	//연체대상 집계내역 count
	public int delyAggregateCnt(Map<String, Object> inVar) throws Exception {
		return rTREBondMngMapDAO.delyAggregateCnt(inVar);
	}	
	
	//연체대상 집계
	public Map delyAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "bondMng.delyAggregate");

		Map result = rTREBondMngMapDAO.delyAggregate(inVar);
		return result;		
	}
	
	//채권관리 내역 count
	public int bondTargetAggregateCnt(Map<String, Object> inVar) throws Exception {
		return rTREBondMngMapDAO.bondTargetAggregateCnt(inVar);
	}
	
	//채권관리대상 집계
	public Map bondTargetAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "bondMng.bondTargetAggregate");
		
		Map result = rTREBondMngMapDAO.bondTargetAggregate(inVar);
		return result;		
	}	
	
	//채권계정내역 조회
	public Map getBondList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listBond", 	rTREBondMngMapDAO.getBondList(inVar, outDataset));
		return result;		
	}	
	
	//계약별내역 조회
	public Map getBondByOrdList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listBondByOrd", rTREBondMngMapDAO.getBondByOrdList(inVar, outDataset));
		return result;		
	}	
	
	//채권컨택내역 조회
	public Map getContactList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listContact", rTREBondMngMapDAO.getContactList(inVar, outDataset));
		return result;		
	}	
	
	//채권추심관리내역 등록/수정/삭제
	public Map saveContactInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		String attchFlSeq = (String)inVar.get("attchFlSeq");
		logger.debug("attchFlSeq : ====>" + attchFlSeq);
		
		/*************************
		 * 시퀀스 채번
		 *************************/
		String seq = "";
		if(attchFlSeq != null && !"".equals(attchFlSeq)) {
			seq = attchFlSeq;
		} else {
			Map seqMap = (Map)rTCMNoticeMapDAO.selectImageSeq();
			seq = String.valueOf(seqMap.get("grpSeq"));
		}
		
		/*************************
		 * 채권추심관리내역 정보생성
		 *************************/
		String dvsn = (String)inVar.get("dvsn");
		//프로그램코드 
		String prgmCd = (String)inVar.get("prgmCd");
		
		for(int i = 0; i<inDsMap.size(); i++) {
			inDsMap.get(i).put("dvsn", dvsn);
			inDsMap.get(i).put("attchFlSeq", seq);
		}
		
		Map contactMap = new HashMap();
		contactMap.put("inDsMap", inDsMap);
		contactMap.put("sqlnamespace", "bondMng.saveContactInfo");
		
		/*************************
		 * 파일 정보생성
		 *************************/
		DataSetMap inDsMap2 = (DataSetMap)inDataset.get("userFile");
		for(int i = 0; i<inDsMap2.size(); i++) {
			inDsMap2.get(i).put("dvsn", "I");
			inDsMap2.get(i).put("fileGrpSeq", seq);
			inDsMap2.get(i).put("progid", prgmCd);
		}
		Map fileMap = new HashMap();
		fileMap.put("inDsMap", inDsMap2);
		fileMap.put("sqlnamespace", "file.insertFileInfo");

		List list = new ArrayList();
		list.add(fileMap);
		list.add(contactMap);

		Map result = rTREBondMngMapDAO.saveContactInfo(inVar, list);
		return result;
	}	
	
	//파일정보 조회
	public Map getFileInfo(Map<String, Object> inVar, Map<String, DataSetMap> inDataset) throws Exception {
		int idx = 0;
		DataSetMap inDsMap2 = (DataSetMap)inDataset.get("input");
		Map map = rTCMNoticeMapDAO.selectFileList(inDsMap2.get(idx));
		return map;
	}
	
	//계약번호별 연체내역 조회
	public Map getArrearsResultList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = (Map)rTREBondMngMapDAO.getArrearsResultList(inVar, outDataset);
		return result;
	}
	//방문별 서비스내역 조회
	public Map visitorService(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = (Map)rTREBondMngMapDAO.visitorService(inVar, outDataset);
		return result;
	}
	
	public Map visitorService2(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = (Map)rTREBondMngMapDAO.visitorService2(inVar, outDataset);
		return result;
	}
	
	public Map saveVisitorService(Map<String, DataSetMap> inDataset, Map inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "bondMng.saveVisitorService");
		return rTREBondMngMapDAO.saveVisitorService(inVar);
	}
	//목록조회
	public Map listSusuInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	rTREBondMngMapDAO.listSusuInfo(inVar));
		return result;
	}
	//인센티브 조회
	public Map selectInsentiveList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map  result= new HashMap();
		result.put("selectInsentiveList", rTREBondMngMapDAO.selectInsentiveList(inVar, outDataset));
		return result;
	}
	//인센티브 저장
	public Map saveInsentive(Map<String, DataSetMap> inDataset, Map inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "bondMng.saveInsentive");
		return rTREBondMngMapDAO.saveInsentive(inVar);
	}
	//연체내역처리
	public Map processArrears(Map<String, DataSetMap> inDataset, Map inVar) throws Exception {
		String flag = (String)inVar.get("flag");
		if(flag.equals("backup")){
			return backupArrears(inDataset, inVar);
		}else{
			return rollbackArrears(inDataset, inVar);
		}
	}
	//연체내역백업
	public Map backupArrears(Map<String, DataSetMap> inDataset, Map inVar) throws Exception {
		inVar.put("sqlnamespace", "bondMng.backupArrears");
		return rTREBondMngMapDAO.backupArrears(inVar);
	}
	//연체내역롤백
	public Map rollbackArrears(Map<String, DataSetMap> inDataset, Map inVar) throws Exception {
		inVar.put("sqlnamespace", "bondMng.rollbackArrears");
		return rTREBondMngMapDAO.rollbackArrears(inVar);
	}
	
	//연체금액조회
	public int getMonthDelyAmt(Map<String, Object> inVar) throws Exception {
		return rTREBondMngMapDAO.getMonthDelyAmt(inVar);
	}
	
	//채권매각대상 조회
	public Map selectSaleBondList(Map<String, Object> inVar) throws Exception {
		Map  result= new HashMap();
		result.put("selectSaleBondList", rTREBondMngMapDAO.selectSaleBondList(inVar));
		return result;
	}
}

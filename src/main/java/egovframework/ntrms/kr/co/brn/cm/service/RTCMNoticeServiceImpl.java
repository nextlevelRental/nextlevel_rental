/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.LogFactory;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Service;

import com.ibatis.common.logging.Log;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMNoticeMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMUserMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.Test;
import egovframework.ntrms.kr.co.brn.comm.dao.CommonMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCMNoticeService")
@SuppressWarnings("unchecked")
public class RTCMNoticeServiceImpl extends EgovAbstractServiceImpl implements RTCMNoticeService {
	
	protected Log logger = com.ibatis.common.logging.LogFactory.getLog(this.getClass());	
	
	@Resource(name="rTCMNoticeMapDAO")
	RTCMNoticeMapDAO rTCMNoticeMapDAO;
	
	@Resource(name="commonMapDAO")
	CommonMapDAO commonMapDAO;

	
	//목록조회
	public Map listNoticeInfo(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listNoticeInfo", 	rTCMNoticeMapDAO.listNoticeInfo(inVar, outDataset));
		return result;
	}
	
	//데이타생성, 수정, 삭제
	public Map saveNoticeInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
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
		 * 공지사항 정보생성
		 *************************/
		String dvsn = (String)inVar.get("dvsn");
		//프로그램코드 
		String prgmCd = (String)inVar.get("prgmCd");
		
		
		for(int i = 0; i<inDsMap.size(); i++) {
			inDsMap.get(i).put("dvsn", dvsn);
			inDsMap.get(i).put("attchFlSeq", seq);
		}
		
		Map noticeMap = new HashMap();
		noticeMap.put("inDsMap", inDsMap);
		noticeMap.put("sqlnamespace", "notice.saveNoticeInfo");
		
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
		list.add(noticeMap);

		Map result = rTCMNoticeMapDAO.saveNoticeInfo(inVar, list);
		return result;
	}

	public Map setDetailNoticeInfo(Map<String, Object> inVar, Map<String, DataSetMap> inDataset) throws Exception {
		int idx = 0;
		//조회수 증가
		DataSetMap inDsMap2 = (DataSetMap)inDataset.get("input");
		for(int i = 0; i<inDsMap2.size(); i++) {
			inDsMap2.get(i);
		}
		
		inDsMap2.get(idx).put("regId", inVar.get("regId"));
		
		
		Map hit = (Map)rTCMNoticeMapDAO.updateHitCount(inDsMap2.get(idx));
		//파일정보 조회 
		Map map = rTCMNoticeMapDAO.selectFileList(inDsMap2.get(idx));
		return map;
	}
	
	//목록조회
	public Map fileInfo(Map<String, Object> inVar) throws Exception {
		rTCMNoticeMapDAO.fileInfo(inVar);
		return inVar;
	}

	public Map deleteNoticeInfo(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}

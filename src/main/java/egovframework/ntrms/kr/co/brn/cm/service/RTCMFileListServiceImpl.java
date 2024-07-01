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

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMFileListMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMNoticeMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMUserMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.Test;
import egovframework.ntrms.kr.co.brn.comm.dao.CommonMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCMFileListService")
@SuppressWarnings("unchecked")
public class RTCMFileListServiceImpl extends EgovAbstractServiceImpl implements RTCMFileListService {
	
	protected Log logger = com.ibatis.common.logging.LogFactory.getLog(this.getClass());	
	
	@Resource(name="rTCMFileListMapDAO")
	RTCMFileListMapDAO rTCMFileListMapDAO;
	
	//목록조회
	public List listFileInfo(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCMFileListMapDAO.listFileInfo(inVar, outDataset);
	}
	
	/*
	 * PoC 점수조회 (테스트용)
	 * @param inVar
	 * @param outDataset
	 * @return List
	 * @throws Exception
	 */
	public List listPocScore(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCMFileListMapDAO.listPocScore(inVar, outDataset);
	}
}

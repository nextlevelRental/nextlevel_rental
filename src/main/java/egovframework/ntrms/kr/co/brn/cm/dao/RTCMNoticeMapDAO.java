/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: SqlMapXPDAO.java
 * 3.Developer			: sian
 * 4.Development Date	: 2014.09.06
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cm.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@SuppressWarnings("unchecked")
@Repository("rTCMNoticeMapDAO")

public class RTCMNoticeMapDAO  extends RtcmAbstractDAO{
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/*
	 * 공지사항 목록조회
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> listNoticeInfo(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("notice.listNoticeInfo", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/*
	 * 공지사항 상세조회
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map setDetailNoticeInfo(Map map, Map <String, DataSetMap> inDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("notice.detailNoticeInfo", map);
		map.get("vcursor");
		return null;
	}
	
	/*
	 * 시퀀스생성(이미지 그룹정보)
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map selectImageSeq() throws NtRmsDaoException {
		Map map = new HashMap();
		getSqlMapClientTemplate().queryForObject("notice.selectImageSeq", map);
		return map;
	}
	
	/*
	 * 공지사항 + 파일정보 저장
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map saveNoticeInfo(Map inVar, List list)  throws NtRmsDaoException, Exception{
		Map result = null;
		try {
			result = executeDsMap(inVar, list);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	
	
	/*
	 * 조회수 증가
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map updateHitCount(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("notice.updateHitCount", map);
		return map;
		
	}
	
	/*
	 * 업로드 파일정보조회
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map selectFileList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("notice.selectFileList", map);
		return map;
	}
	
	/*
	 * 업로드 파일정보조회
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map fileInfo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("notice.selectFileOne", map);
		return map;
	}
	
	/*
	 * 공지사항 사용여부(삭제처리) 'N'
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map deleteNoticeInfo(Map inVar)  throws NtRmsDaoException, Exception{
		getSqlMapClientTemplate().queryForObject("notice.saveNoticeInfo", inVar);
		return inVar;
	}
}
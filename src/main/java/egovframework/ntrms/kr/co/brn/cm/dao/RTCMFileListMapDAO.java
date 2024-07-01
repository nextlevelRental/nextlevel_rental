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
@Repository("rTCMFileListMapDAO")

public class RTCMFileListMapDAO  extends RtcmAbstractDAO{
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/*
	 * 공지사항 목록조회
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> listFileInfo(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("upload.listFileInfo", map);
		List li = (List)map.get("vcursor");
		System.out.println("=================================");
		System.out.println(li);
		return li;
	}
	
	/*
	 * PoC 점수조회 (테스트용)
	 * @param map
	 * @param outDataset
	 * @return List
	 * @throws NtRmsDaoException
	 */
	public List<Map> listPocScore(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("poc.listPocScore", map);
		List li = (List)map.get("vcursor");
		
		return li;
	}
}
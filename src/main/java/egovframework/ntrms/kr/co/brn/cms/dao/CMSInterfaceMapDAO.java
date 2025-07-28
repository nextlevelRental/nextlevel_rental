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

package egovframework.ntrms.kr.co.brn.cms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@SuppressWarnings("unchecked")
@Repository("cMSInterfaceMapDAO")

public class CMSInterfaceMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	
	/***********************************
	 * CMS신용평가정보 저장 및 업데이트 처리
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public Map kftcCmsDocInfo(Map map) throws Exception {
		Map result = null;
		try {
			result = executeDsMap(map);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	/*
	 * 당일계좌번호등록여부조회
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map existsCmsInterface(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("cardReqDAO.existsCmsInterface", map);
		return map; 
	}
}
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

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rTCMMenuMapDAO")

public class RTCMMenuMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 트리메뉴 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> listTreeMenu(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("menu.listMenuTree", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/**
	 * 메쥬조회(그리드)
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */	
	public List<Map> listMenu(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("menu.listMenu", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/**
	 * 메뉴저장
	 * @param inVar
	 * @param list
	 * @return
	 * @throws NtRmsDaoException
	 * @throws Exception
	 */
	public Map saveMenuInfo(Map inVar)  throws NtRmsDaoException, Exception{
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	
	/**
	 * 메튜코드 중복확인
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public int checkMenuCdExists(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("menu.checkMenuCdExists", map);
		return (Integer)map.get("result");
	}	
	
}
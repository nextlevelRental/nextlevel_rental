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
@Repository("rTCMUserMapDAO")

public class RTCMUserMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/*
	 * 사용자목록 조회
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings("deprecation")
	public List<Map<String, Object>> listUserInfo(Map<String, Object> map, Map<String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("user.listUserInfo", map);
		List<Map<String, Object>> li = (List<Map<String, Object>>)map.get("vcursor");
		return li;
	}
	
	/*
	 * 아이디 중복확인
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public int checkIdExists(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("user.checkIdExists", map);
		return (Integer)map.get("result");
	}
	
	/*
	 * 사용자정보 저장
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map saveUserInfo(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	/*
	 * 사용자그룹정보 조회
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> userGrp(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("user.getUserGrp", map);
		List li = (List)map.get("vcursor2");
		return li;
	}

	public Map clearPwd(Map inVar) {
		getSqlMapClientTemplate().queryForObject("user.clearPwd", inVar);
		return inVar;
	}
}
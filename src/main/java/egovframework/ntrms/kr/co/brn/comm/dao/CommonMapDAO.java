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

package egovframework.ntrms.kr.co.brn.comm.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@SuppressWarnings("unchecked")
@Repository("commonMapDAO")

public class CommonMapDAO extends EgovAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	@Resource(name="sqlMapClient")
	public void initDAO(SqlMapClient sqlMapClient) throws NtRmsDaoException{
		setSqlMapClient(sqlMapClient);
	}
	
	@SuppressWarnings("deprecation")
	public SqlMapClientTemplate getSqlMapClientTemplateDAO() throws NtRmsDaoException{
		return this.getSqlMapClientTemplate();
	}
	
	/*
	 * 지서정보조회SQL
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> listCommInfo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("comm.listCommInfo", map);
		List li = (List)map.get("vcursor");
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
	public Map saveUserInfo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("user.saveUserInfo", map);
		return map;
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
	
	
	public void insertFileInfo(Map paramenterMap) {
		getSqlMapClientTemplate().queryForObject("file.insertFileInfo", paramenterMap);
	}
	
	public String getCodeName(Map map) {
		getSqlMapClientTemplate().queryForObject("comm.codeName", map);
		return (String)map.get("result");
	}
	
	public String getAgencyName(Map map) {
		getSqlMapClientTemplate().queryForObject("comm.agencyName", map);
		return (String)map.get("result");
	}
	
	public List<Map> listTireInfo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("comm.listTireInfo", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listTireDetailInfo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("comm.listTireDetailInfo", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listSellProduct(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("comm.listSellProduct", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public List<Map> listTireDetailInfo2(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("comm.listTireDetailInfo2", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public List<Map<String, Object>> listControlAuth(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("comm.listControlAuth", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public Map runQuery(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("comm.runQuery", map);
		return map;
	}
}
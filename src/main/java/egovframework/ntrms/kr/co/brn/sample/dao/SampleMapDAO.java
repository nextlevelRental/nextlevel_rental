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

package egovframework.ntrms.kr.co.brn.sample.dao;

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
@Repository("sampleMapDAO")

public class SampleMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	@Resource(name="sqlMapClient")
	public void initDAO(SqlMapClient sqlMapClient) throws NtRmsDaoException{
		setSqlMapClient(sqlMapClient);
	}
	
	@SuppressWarnings("deprecation")
	public SqlMapClientTemplate getSqlMapClientTemplateDAO() throws NtRmsDaoException{
		return this.getSqlMapClientTemplate();
	}
	
	public List<Map> getList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("sample.getUserList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveUserInfo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("sample.saveUserInfo", map);
		return map;
	}
	
	public void exampleArray(Map aryMap) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("sample.arrayInput", aryMap);
		System.out.println(aryMap);
	}

	public void createNiceTrustInfoMap(Map map) throws NtRmsDaoException {
		try {
			executeDsMap(map);
		}catch (Exception e) {
			e.printStackTrace();
		} 
	}
	public void createNiceBusinessInfo(Map map) throws NtRmsDaoException {
		try {
			executeDsMap(map);
		}catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	/************************************
	 * 법인신용평가 레벨의 사용여부조회
	 * @param inVar
	 * @return
	 * @throws NtRmsDaoException
	 */
	public String selectBusinessInfo(Map inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("cust.niceBisinessSearch", inVar);
		return (String)inVar.get("result");
	}
	
	//당일 법인신용평가 여부
	public List<Map> searchTodayBisData(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("cust.searchTodayBisData", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map kftcCmsDocInfo(Map map) throws Exception {
		Map result = null;
		try {
			result = executeDsMap(map);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
}
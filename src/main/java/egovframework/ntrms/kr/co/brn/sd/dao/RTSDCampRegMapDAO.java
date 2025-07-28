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

package egovframework.ntrms.kr.co.brn.sd.dao;

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
@Repository("rTSDCampRegMapDAO")

public class RTSDCampRegMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	@Resource(name="sqlMapClient")
	public void initDAO(SqlMapClient sqlMapClient) throws NtRmsDaoException{
		setSqlMapClient(sqlMapClient);
	}
	
	@SuppressWarnings("deprecation")
	public SqlMapClientTemplate getSqlMapClientTemplateDAO() throws NtRmsDaoException{
		return this.getSqlMapClientTemplate();
	}
	
	public List<Map> listProductInfo(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("campReg.listProduct2", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listCampRegInfo(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("campReg.listCampReg", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveCampRegData(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}

	//해당상품으로 등록된 계약 건수 count
	public int countRegInfo(Map<String, Object> inVar) {
		getSqlMapClientTemplate().queryForObject("campReg.countRegInfo", inVar);
		return (Integer)inVar.get("result");
	}
	
	//해당상품으로 등록된 계약 건수 count
	public int countNext(Map<String, Object> inVar) {
		getSqlMapClientTemplate().queryForObject("campReg.countNext", inVar);
		return (Integer)inVar.get("result");
	}
	
	//해당상품으로 등록된 계약 건수 count
	public int updateBeFore(Map<String, Object> inVar) {
		getSqlMapClientTemplate().queryForObject("campReg.countBeFore", inVar);
		int ii = Integer.parseInt(inVar.get("result") +"");
		
		return ii;
	}
}
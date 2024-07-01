/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTCSAdviceStatusMapDAO.java
 * 3.Developer			: jungsoo
 * 4.Development Date	: 2015.08.10
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.dao;

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
@Repository("rTCSAdviceStatusMapDAO")

public class RTCSAdviceStatusMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public List<Map> listAdvice(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("advice.listAdvice", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public List<Map> listmessage(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("advice.listmessage", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listmessage2(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("advice.listmessage", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	
	public List<Map> listProvisionalContract2(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("advice.listProvisionalContract2", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveAdvice(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	public Map saveAdviceCust(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public List<Map> AdvicelistInstall(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("advice.AdvicelistInstall", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	//정기점검 컨택목록조회
	public List<Map> selectAdviceCallList(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("advice.selectAdviceCallList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public List<Map> listcontractInfo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("advice.listcontractInfo", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	//정기점검 컨택목록조회
	public List<Map> AdviceCallList(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("advice.selectAdviceCallList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
}
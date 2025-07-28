package egovframework.ntrms.kr.co.brn.re.dao;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rTRECloseInterfaceDAO")
public class RTRECloseInterfaceDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);

	public List<Map> rTRECloseInterfaceList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTRECloseInterfaceDAO.rTRECloseInterfaceList", map);
		List rtnList = (List)map.get("vcursor");
		return rtnList;
	}
	
	public Map <String, Object> updateCloseInterfaceResult(Map map) throws NtRmsDaoException {
		Map <String, Object> rtnSqlMap = new HashMap();
		
		getSqlMapClientTemplate().queryForObject("rTRECloseInterfaceDAO.updateCloseIfResult", map);

		rtnSqlMap.put("sqlCode", map.get("sqlCode"));
		rtnSqlMap.put("errText", map.get("errText"));
		
		return rtnSqlMap;
	}
	
	public Map <String, Object> aggregateData(Map map) throws NtRmsDaoException {
		Map <String, Object> rtnSqlMap = new HashMap();
		
		String namespace = (String)map.get("namespace");
		getSqlMapClientTemplate().queryForObject(namespace, map);

		rtnSqlMap.put("totCnt", map.get("vTotCnt"));
		
		return rtnSqlMap;
	}
	
	public Map <String, Object> createEAIList(Map map) throws NtRmsDaoException {

		getSqlMapClientTemplate().queryForObject("rTRECloseInterfaceDAO.p_CreateRtre5500", map);
		return map;
	}
}

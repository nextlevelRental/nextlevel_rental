package egovframework.ntrms.kr.co.brn.re.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rTREClosePostingDAO")
public class RTREClosePostingDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);

	public List<Map> rTREClosePostingList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTREClosePostingDAO.rTREClosePostingList", map);
		List rtnList = (List)map.get("vcursor");
		return rtnList;
	}
	
	public Map <String, Object> aggregatePostingData(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTREClosePostingDAO.aggregatePostingData", map);
		return map;
	}
	
	public Map <String, Object> savePostingData(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTREClosePostingDAO.savePostingData", map);
		return map;
	}
	
	
	public Map <String, Object> updatePostInterfaceResult(Map map) throws NtRmsDaoException {
		Map <String, Object> rtnSqlMap = new HashMap();
		
		getSqlMapClientTemplate().queryForObject("rTREClosePostingDAO.updatePostIfResult", map);

		rtnSqlMap.put("sqlCode", map.get("sqlCode"));
		rtnSqlMap.put("errText", map.get("errText"));
		
		return rtnSqlMap;
	}
}

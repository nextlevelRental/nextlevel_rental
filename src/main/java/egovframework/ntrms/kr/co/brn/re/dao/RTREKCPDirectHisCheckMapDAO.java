package egovframework.ntrms.kr.co.brn.re.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rTREKCPDirectHisCheckMapDAO")

public class RTREKCPDirectHisCheckMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public List<Map> selectCheckSet(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTREKCPDirectHisCheckMapDAO.selectCheckSet", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map kcpDirectUploadFile(Map inVar)  throws NtRmsDaoException, Exception{	
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public Map resultUpdateRtre0044Check(Map inVar)  throws NtRmsDaoException, Exception{	
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public List<Map> selectSRtre0044(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTREKCPDirectHisCheckMapDAO.selectSRtre0044", map);
		List li = (List)map.get("vcursor");
		return li;
	}
}
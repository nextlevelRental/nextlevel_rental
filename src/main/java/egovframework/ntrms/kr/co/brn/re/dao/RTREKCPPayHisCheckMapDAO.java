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
@Repository("rTREKCPPayHisCheckMapDAO")

public class RTREKCPPayHisCheckMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public List<Map> selectCheckSet(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTREKCPPayHisCheckMapDAO.selectCheckSet", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map accApproveUploadFile(Map inVar)  throws NtRmsDaoException, Exception{	
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public Map resultUpdateRtre0043Check(Map inVar)  throws NtRmsDaoException, Exception{	
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public List<Map> selectSRtre0043(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTREKCPPayHisCheckMapDAO.selectSRtre0043", map);
		List li = (List)map.get("vcursor");
		return li;
	}
}
package egovframework.ntrms.kr.co.brn.cs.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rTCSServiceHistoryMapDAO")

public class RTCSServiceHistoryMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public List<Map> serviceHistoryList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSServiceHistory.serviceHistoryByDt", map);
		List li = (List)map.get("vcursor");
		return li;
	}	
		
	public Map saveRTCS0008(Map inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().update("rTCSServiceHistory.p_UpdateRtcs0008DlvcYn", inVar);
		return inVar;
	}
}
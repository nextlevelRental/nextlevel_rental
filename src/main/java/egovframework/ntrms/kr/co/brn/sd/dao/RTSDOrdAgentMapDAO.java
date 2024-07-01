package egovframework.ntrms.kr.co.brn.sd.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rTSDOrdAgentMapDAO")

public class RTSDOrdAgentMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);

	public List<Map> selectOrdAgentList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTSDOrdAgent.selectOrdAgentList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> selectOrdAgentOrderList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTSDOrdAgent.selectOrdAgentOrderList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> selectRTSDOrdAgentRegister(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTSDOrdAgent.selectRTSDOrdAgentRegister", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveRTSDOrdAgentRegister(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
	public int checkOrdAgent(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTSDOrdAgent.checkOrdAgent", map);
		return (Integer)map.get("result");
	}
}
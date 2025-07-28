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
@Repository("rTCSKeepHistoryMapDAO")

public class RTCSKeepHistoryMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public List<Map> selectRTCSKeepHistory(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSKeepHistory.p_sRtcs0203KeepHistory", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> pSRtcs0202UseAgencyWareh(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSKeepHistory.pSRtcs0202UseAgencyWareh", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> selectRTCSWarehAgencyRegister(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSWarehouse.p_sRtcs0202AgencyWareh", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveRtcs0203WinterIn(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
	public Map saveRtcs0203WinterOut(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
	public Map sRtcs0203FilePathName(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSKeepHistory.sRtcs0203FilePathName", map);
		return map;
	}
}
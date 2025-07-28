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
@Repository("rTCSWarehouseMapDAO")

public class RTCSWarehouseMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public int checkWarehCd(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSWarehouse.checkWarehCd", map);
		return (Integer)map.get("result");
	}
	
	public Map saveRTCSWarehouseRegister(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
	public List<Map> selectRTCSWarehouseRegister(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSWarehouse.p_sRtcs0200WareHouse", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> selectRTCSWarehouseUpdateList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSWarehouse.p_sRtcs0201WareHistory", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveRTCSWarehAgencyRegister(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
	public List<Map> selectRTCSWarehAgencyRegister(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSWarehouse.p_sRtcs0202AgencyWareh", map);
		List li = (List)map.get("vcursor");
		return li;
	}
}
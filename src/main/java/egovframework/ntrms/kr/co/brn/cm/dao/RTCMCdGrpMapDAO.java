package egovframework.ntrms.kr.co.brn.cm.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rTCMCdGrpMapDAO")

public class RTCMCdGrpMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public List<Map> listCdGrp(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("cdGrp.listCdGrp", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listCdGrpChild(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("cdGrp.listCdGrpChild", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public int cdGrpCdOverlapConfirm(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("cdGrp.cdGrpCdOverlapConfirm", map);
		return (Integer)map.get("result");
	}
	
	public Map saveCdGrp(Map inVar, List list) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar, list);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public int checkCd(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("cdGrp.checkCd", map);
		return (Integer)map.get("result");
	}
}

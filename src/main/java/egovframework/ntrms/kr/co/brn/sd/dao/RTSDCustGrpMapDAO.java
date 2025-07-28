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
@Repository("rTSDCustGrpMapDAO")

public class RTSDCustGrpMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);

	public Map grpNoCrate(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar) ;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Map> listGrpNo1(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("custGrp.listGrpNo1", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listGrpNo2(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("custGrp.listGrpNo2", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public String selectCustGrpCustNo(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("custGrp.selectCustGrpCustNo", map);
		return (String)map.get("result");
	}
	
	public Map saveCustGrp1(Map inVar, List list) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar, list) ;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}
	
	public Map saveCustGrp2(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar) ;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}
}

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
@Repository("rTCMHoliMapDAO")

public class RTCMHoliMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public List<Map> listHoli(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("holi.listHoli", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public int checkHDate(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("holi.checkHDate", map);
		return (Integer)map.get("result");
	}
	
	public Map saveHoli(Map inVar) throws NtRmsDaoException {
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

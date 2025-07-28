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
@Repository("rTREDrawDayRegisterDAO")
public class RTREDrawDayRegisterDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);

	public List<Map> rTREDrawDayList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTREDrawDayRegisterDAO.rTREDrawDayList", map);
		List rtnList = (List)map.get("vcursor");
		return rtnList;
	}
	
	@SuppressWarnings({ "rawtypes" })
	public Map rTREDrawDayRegist(Map inVar) throws NtRmsDaoException, Exception{
		Map result = null;
		try {
			result = executeDsMap(inVar);
			logger.debug("result >>>>>>>>>>> " + result);;
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
}

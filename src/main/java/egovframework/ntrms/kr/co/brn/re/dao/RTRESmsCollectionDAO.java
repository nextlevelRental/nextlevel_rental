package egovframework.ntrms.kr.co.brn.re.dao;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rTRESmsCollectionDAO")
public class RTRESmsCollectionDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);

	public List<Map> rTRESmsCollectionList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTRESmsCollectionDAO.rTRESmsCollectionList", map);
		List rtnList = (List)map.get("vcursor");
		return rtnList;
	}
}

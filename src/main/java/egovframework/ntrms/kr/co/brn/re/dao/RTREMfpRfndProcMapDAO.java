/************************************************************************************
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTREMfpRfndProcMapDAO.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.12.21
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings({ "unchecked", "deprecation" })
@Repository("rTREMfpRfndProcMapDAO")

public class RTREMfpRfndProcMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 중도완납환불대상내역조회
	 * @param	map
	 * @param	mapOutDSM
	 * @return	List<Map>
	 * @throws	NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<Map> retrieveMfpRfndTrgtList(Map map, Map<String, DataSetMap> mapOutDSM) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("mfpRfndTrgt.retrieveMfpRfndTrgtList", map);
		
		List li = (List)map.get("vcursor");
		
		return li;
	}
}
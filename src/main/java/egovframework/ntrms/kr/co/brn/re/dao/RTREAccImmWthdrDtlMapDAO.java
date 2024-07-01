/************************************************************************************
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTREAccImmWthdrDtlMapDAO.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.11.05
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

@SuppressWarnings("unchecked")
@Repository("rTREAccImmWthdrDtlMapDAO")

public class RTREAccImmWthdrDtlMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	@SuppressWarnings({ "deprecation", "rawtypes" })
	public List<Map> retrieveAccImmWthdrList(Map map, Map<String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("accImmWthdr.sRtre0210AccImmWthdrList", map);
		List li = (List)map.get("vcursor");
		
		return li;
	}
	
	@SuppressWarnings({ "deprecation", "rawtypes" })
	public List<Map> retrieveAccImmWthdrDtlList(Map map, Map<String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("accImmWthdr.sRtre0210AccImmWthdrDtlList", map);
		List li = (List)map.get("vcursor");
		
		return li;
	}
}
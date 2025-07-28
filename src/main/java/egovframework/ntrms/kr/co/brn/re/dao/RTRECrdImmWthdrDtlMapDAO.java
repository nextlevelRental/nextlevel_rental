/************************************************************************************
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTRECrdImmWthdrDtlMapDAO.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.11.06
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
@Repository("rTRECrdImmWthdrDtlMapDAO")

public class RTRECrdImmWthdrDtlMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	@SuppressWarnings({ "deprecation", "rawtypes" })
	public List<Map> retrieveCrdImmWthdrList(Map map, Map<String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("crdImmWthdr.sRtre0200CrdImmWthdrList", map);
		List li = (List)map.get("vcursor");
		
		return li;
	}
	
	@SuppressWarnings({ "deprecation", "rawtypes" })
	public List<Map> retrieveCrdImmWthdrDtlList(Map map, Map<String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("crdImmWthdr.sRtre0200CrdImmWthdrDtlList", map);
		List li = (List)map.get("vcursor");
		
		return li;
	}
}
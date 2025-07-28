/************************************************************************************
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTREVaccMangMapDAO.java
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
@Repository("rTREVaccMangMapDAO")

public class RTREVaccMangMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/* 가상계좌 현황 조회 */
	@SuppressWarnings({ "deprecation", "rawtypes" })
	public List<Map> retrieveVaccMangList(Map map, Map<String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("vaccMang.sRtre0220VaccMangList", map);
		List li = (List)map.get("vcursor");
		
		return li;
	}
	
	/* 기간만료계좌정리 */
	@SuppressWarnings("rawtypes")
	public Map prdExprArngm(Map inVar) throws NtRmsDaoException, Exception {
		Map result = null;
		
		try {
			result = executeDsMap(inVar);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
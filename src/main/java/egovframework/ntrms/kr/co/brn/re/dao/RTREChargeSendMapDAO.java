/************************************************************************************
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTREArrearsPaymentMapDAO.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.11.12
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.dao;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings({ "unchecked", "deprecation" })
@Repository("rTREChargeSendMapDAO")

public class RTREChargeSendMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 데이터 일괄 등록
	 * @param	map
	 * @param	outDataset
	 * @return	List<Map>
	 * @throws	NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public Map saveDatas(Map inVar) throws NtRmsDaoException, Exception{
		Map result = null;
		try {
			result = executeDsMap(inVar);
			logger.debug("result >>>>>>>>>>> " + result);;
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	/**
	 * 데이터 건당 등록
	 * @param	map
	 * @param	outDataset
	 * @return	List<Map>
	 * @throws	NtRmsDaoException
	 */
	public Map saveData(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject(map.get("sqlnamespace").toString(), map);
		return map;
	}
}
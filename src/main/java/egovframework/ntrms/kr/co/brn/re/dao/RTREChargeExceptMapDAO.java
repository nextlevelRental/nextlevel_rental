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

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings({ "unchecked", "deprecation" })
@Repository("rTREChargeExceptMapDAO")

public class RTREChargeExceptMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 청구중지대상등록
	 * @param	map
	 * @param	outDataset
	 * @return	List<Map>
	 * @throws	NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public Map saveChargeExcept(Map inVar) throws NtRmsDaoException, Exception{
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
	 * 청구중지대상조회
	 * @param	map
	 * @param	outDataset
	 * @return	List<Map>
	 * @throws	NtRmsDaoException
	 */
	public List<Map> listChargeExcept(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("chargeExcept.listChargeExcept", map);
		List rtnList = (List)map.get("vcursor");
		return rtnList;
	}
}
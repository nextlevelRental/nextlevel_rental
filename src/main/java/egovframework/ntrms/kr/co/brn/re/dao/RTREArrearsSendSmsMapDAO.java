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
@Repository("rTREArrearsSendSmsMapDAO")

public class RTREArrearsSendSmsMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 당월연체대상 집계
	 * @param	map
	 * @param	outDataset
	 * @return	List<Map>
	 * @throws	NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public Map arrSendAggregate(Map inVar) throws NtRmsDaoException, Exception{
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
	 * 당월연체집계 특정내역 삭제
	 * @param	map
	 * @param	outDataset
	 * @return	List<Map>
	 * @throws	NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public Map arrAggregateDelete(Map inVar) throws NtRmsDaoException, Exception{
		return (Map)getSqlMapClientTemplate().queryForObject("arrSendSms.arrAggregateDelete", inVar);
	}
	
	/**
	 * 당월연체대상 내역 count
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public int arrSendAggregateCnt(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("arrSendSms.arrSendAggregateCnt", map);
		return (Integer)map.get("result");
	}	
	
	/**
	 * 당월연체 SMS발송대상 집계
	 * @param	map
	 * @param	outDataset
	 * @return	List<Map>
	 * @throws	NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public Map arrSmsAggregate(Map inVar) throws NtRmsDaoException, Exception{
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
	 * 당월연체대상 SMS발송
	 * @param	map
	 * @param	outDataset
	 * @return	List<Map>
	 * @throws	NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public Map arrSendSms(Map inVar) throws NtRmsDaoException, Exception{
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
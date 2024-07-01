/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: SqlMapXPDAO.java
 * 3.Developer			: sian
 * 4.Development Date	: 2014.09.06
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History		 
*************************************************************************************/

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
@Repository("rTREPaymentMapDAO")

public class RTREPaymentMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 결제정보 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> listPayInfo(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("payment.sRtre0050List", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	/**
	 * 결제정보 이력 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> listPaymentHist(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("payment.sRtre0050", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/**
	 * 결제정보 변경등록
	 * @param inVar
	 * @param list
	 * @return
	 * @throws NtRmsDaoException
	 * @throws Exception
	 */
	public Map savePaymentInfo(Map inVar, List list)  throws NtRmsDaoException, Exception{
		Map result = null;
		try {
			result = executeDsMap(inVar, list);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}	
	
	/**
	 * 결제정보 삭제
	 * @param inVar
	 * @param list
	 * @return
	 * @throws NtRmsDaoException
	 * @throws Exception
	 */
	public Map delPaymentInfo(Map inVar)  throws NtRmsDaoException, Exception{
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}	
	
	/**
	 * 계좌인증 정상정보 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> listTodayCmsInfos(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("payment.sRtre0012TodayCmsInfos", map);
		List li = (List)map.get("vcursor");
		return li;
	}
}
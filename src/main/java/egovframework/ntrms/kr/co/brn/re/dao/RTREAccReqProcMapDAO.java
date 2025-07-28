/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTREAccReqProcMapDAO.java
 * 3.Developer			: sian
 * 4.Development Date	: 2014.09.06
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rTREAccReqProcMapDAO")

public class RTREAccReqProcMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 계좌신청일 조회
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public String getAccReqDate(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("accreqProc.getAccReqDate", map);
		return (String)map.get("result");
	}	
	
	/**
	 * 결제정보변경일 조회
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public String getPayChgDate(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("accreqProc.getPayChgDate", map);
		return (String)map.get("result");
	}	
	
	/**
	 * 계좌신청 처리대상 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map listaccReqTarget(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("accreqProc.listaccReqTarget", map);
		List li = (List)map.get("vcursor");
		
		logger.debug(li.size () + "#######################  결과 ################" + map);
		logger.debug(map.get("returnMessage") + "결과 메시지");
		
		Map mp = new HashMap();
		
		
		mp.put("msgMap", map);
		mp.put("listaccReqTarget", li);
		return mp;
	}

	/**
	 *  확인완료(전송처리 업무상태 업데이트)
	 * @param map
	 * @return
	 */
	public Map confirmProc(Map inVar) throws NtRmsDaoException, Exception{
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
	 * 집계
	 * @param map
	 * @return
	 */
	public Map setAggregate(Map inVar) throws NtRmsDaoException, Exception{
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
	 * 계좌신청 송신대상 내역 생성
	 * @param map
	 * @return
	 */
	public Map accReqMakeData(Map inVar)  throws NtRmsDaoException, Exception{		
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
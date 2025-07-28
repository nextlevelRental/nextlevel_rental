/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTREAccTRanProcMapDAO.java
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
@Repository("rTREAccTranProcMapDAO")

public class RTREAccTranProcMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 처리대상 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map listaccTranTarget(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("accTranProc.listaccTranTarget", map);
		List li = (List)map.get("vcursor");
		
		logger.debug(li.size () + "#######################  결과 ################" + map);
		logger.debug(map.get("returnMessage") + "결과 메시지");
		
		Map mp = new HashMap();
		
		
		mp.put("msgMap", map);
		mp.put("listaccTranTarget", li);
		return mp;
	}
	
	/**
	 * 집계
	 * @param map
	 * @return
	 */
	public Map tranAggregate(Map inVar) throws NtRmsDaoException, Exception{		
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
	 * 출금이체처리 송신대상 내역 생성
	 * @param map
	 * @return
	 */
	public Map accTranMakeData(Map inVar) throws NtRmsDaoException, Exception{		
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
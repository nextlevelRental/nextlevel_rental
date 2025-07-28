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
@Repository("rTREAccResultMapDAO")

public class RTREAccResultMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	//결과파일 반영조회
	public Map listaccResult(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("accResult.listaccResult", map);
		List li = (List)map.get("vcursor");
		
		logger.debug(li.size () + "#######################  결과 ################" + map);
		logger.debug(map.get("returnMessage") + "결과 메시지");
		
		Map mp = new HashMap();
		
		
		mp.put("msgMap", map);
		mp.put("listaccResult", li);
		return mp;
	}	
	//결과파일 반영
	public Map saveFileMakeData(Map inVar) throws NtRmsDaoException, Exception{
		Map result = null;
		try {
			result = executeDsMap(inVar);
			logger.debug("result >>>>>>>>>>> " + result);;
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	//계좌신청 결과반영(회사접수분)
	public Map accReqResultApplyA(Map inVar) throws NtRmsDaoException, Exception{
		Map result = null;
		try {
			result = executeDsMap(inVar);
			logger.debug("result >>>>>>>>>>> " + result);;
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}	
	//계좌신청 결과반영(은행접수분)
	public Map accReqResultApplyB(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
			logger.debug("result >>>>>>>>>>> " + result);;
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}	
	//계좌신청 결과반영(은행접수분) 파일생성
	public Map makeFileApplyB(Map inVar) throws NtRmsDaoException {
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
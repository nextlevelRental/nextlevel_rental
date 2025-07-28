/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTRECrdTRanProcMapDAO.java
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
@Repository("rTRECrdTranMapDAO")

public class RTRECrdTranMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 출금이체 조회(계약번호별 내역조회)
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getCrdTranOrdNoList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("Pkg_Rtre0080.sRtre0080OrdNoList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	/**
	 * 카드이체조회(카드사별 내역조회)
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getCrdTranCardList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("Pkg_Rtre0080.sRtre0080CardList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	/**
	 * 카드이체 처리 - STEP1 카드이체 대상집계
	 * @param map
	 * @return
	 */
	public Map crdTranAggregate(Map inVar) throws NtRmsDaoException, Exception{	
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
	 * 카드이체 처리 - STEP2 카드이체 대상조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map listCrdTranTarget(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("crdTran.listCrdTranTarget", map);
		List li = (List)map.get("vcursor");
		
		
		Map mp = new HashMap();
		
		mp.put("msgMap", map);
		mp.put("listCrdTranTarget", li);
		return mp;
	}	
	
	/**
	 * 결과파일반영
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map crdMakeFileData(Map inVar) throws NtRmsDaoException, Exception{	
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
	 * 카드이체수납처리
	 * @param map
	 * @return
	 */
	public Map crdTranReceipt(Map inVar) throws NtRmsDaoException, Exception{	
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
	 * 카드이체 파일생성
	 * @param map
	 * @return
	 */
	public Map crdTranMakeData(Map inVar) throws NtRmsDaoException, Exception{	
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
	 * 카드이체결과 반영완료여부
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map crdTranEnd(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("crdTran.crdTranEnd", map);
		return map;
	}
}
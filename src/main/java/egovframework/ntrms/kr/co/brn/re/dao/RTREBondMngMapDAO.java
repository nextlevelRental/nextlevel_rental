/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: SqlMapXPDAO.java
 * 3.Developer			: sian
 * 4.Development Date	: 2014.09.06
 * 5.Version			: 0.1
 * 6.Note				: 채권관리
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
@Repository("rTREBondMngMapDAO")

public class RTREBondMngMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 연체내역 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map getArrearsList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("bondMng.getArrearsList", map);
		List li = (List)map.get("vcursor");
		
		logger.debug(li.size () + "#######################  결과 ################" + map);
		logger.debug(map.get("returnMessage") + "결과 메시지");
		
		Map mp = new HashMap();
		
		
		mp.put("msgMap", map);
		mp.put("listArrears", li);
		return mp;
	}	
	
	/**
	 * 연체대상 집계내역 count
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public int delyAggregateCnt(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("bondMng.delyAggregateCnt", map);
		return (Integer)map.get("result");
	}	
	
	/**
	 * 연체대상 집계
	 * @param inVar
	 * @return
	 * @throws NtRmsDaoException
	 * @throws Exception
	 */
	public Map delyAggregate(Map inVar) throws NtRmsDaoException, Exception{
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
	 * 채권관리 내역 count
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public int bondTargetAggregateCnt(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("bondMng.bondTargetAggregateCnt", map);
		return (Integer)map.get("result");
	}	
	
	/**
	 * 채권관리대상 집계
	 * @param inVar
	 * @return
	 * @throws NtRmsDaoException
	 * @throws Exception
	 */
	public Map bondTargetAggregate(Map inVar) throws NtRmsDaoException, Exception{
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
	 * 채권계정내역 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getBondList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("bondMng.getBondList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}	
	
	/**
	 * 계약별내역 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getBondByOrdList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("bondMng.getBondByOrdList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}	
	
	/**
	 * 채권컨택내역 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getContactList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("bondMng.getContactList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}	
	
	/**
	 * 채권추심관리내역 등록/수정/삭제
	 * @param inVar
	 * @param list
	 * @return
	 * @throws NtRmsDaoException
	 * @throws Exception
	 */
	public Map saveContactInfo(Map inVar, List list)  throws NtRmsDaoException, Exception{
		Map result = null;
		try {
			result = executeDsMap(inVar, list);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}	
	
	/**
	 * 계약번호별 연체내역 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map getArrearsResultList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("bondMng.getArrearsResultList", map);
		List li = (List)map.get("vcursor");
		
		logger.debug(li.size () + "#######################  결과 ################" + map);
		logger.debug(map.get("returnMessage") + "결과 메시지");
		
		Map mp = new HashMap();
		
		mp.put("msgMap", map);
		mp.put("listArrearsResult", li);
		return mp;
	}
	
	/**
	 * 방문별 서비스내역 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map visitorService(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("bondMng.visitorService", map);
		List li = (List)map.get("vcursor");
		
		Map mp = new HashMap();
		
		mp.put("msgMap", map);
		mp.put("listvisitorService", li);
		return mp;
	}
	
	public Map visitorService2(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("bondMng.visitorService2", map);
		List li = (List)map.get("vcursor");
		
		Map mp = new HashMap();
		
		mp.put("msgMap", map);
		mp.put("listvisitorService2", li);
		return mp;
	}
	
	public Map saveVisitorService(Map map) throws NtRmsDaoException {
		Map result = null;
		try {
			result = super.executeDsMap(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public List<Map> listSusuInfo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("bondMng.listSusuInfo", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> selectInsentiveList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("bondMng.selectInsentiveList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveInsentive(Map map) throws NtRmsDaoException {
		Map result = null;
		try {
			result = super.executeDsMap(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public Map backupArrears(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().insert((String)map.get("sqlnamespace"), map);
		return map;
	}
	
	public Map rollbackArrears(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().insert((String)map.get("sqlnamespace"), map);
		return map;
	}
	
	public int getMonthDelyAmt(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("bondMng.monthDelyAmt", map);
		return (Integer)map.get("result");
	}	
	
	public List<Map> selectSaleBondList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("bondMng.selectSaleBondList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
}
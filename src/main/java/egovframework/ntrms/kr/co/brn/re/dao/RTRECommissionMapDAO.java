/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2015 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTRECommissionDAO.java
 * 3.Developer			: yyt
 * 4.Development Date	: 2015.11.24
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;


@SuppressWarnings({"unchecked", "rawtypes", "deprecation"})
@Repository("rtreCommissionMapDAO")

public class RTRECommissionMapDAO extends RtcmAbstractDAO{
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 판매수수료 기초집계 (대리점, 방판, 타이어뱅크)
	 * @param map
	 * @return
	 */
	public Map getRtreAgencyComm(Map inVar) throws NtRmsDaoException, Exception{
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
	 * 판매수수료 기초집계 (오픈몰)
	 * @param map
	 * @return
	 */
	public Map getRtreMallComm(Map inVar) throws NtRmsDaoException, Exception{
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
	 * 서비스수수료 기초집계
	 * @param map
	 * @return
	 */
	public Map getServiceChargeAggregate(Map inVar) throws NtRmsDaoException, Exception{
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
	 * 충당금 설정처리
	 * @param map
	 * @return
	 */
	public Map getAllowanceAggregate(Map inVar) throws NtRmsDaoException, Exception{
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
	 * 장착수수료 기초집계
	 * @param map
	 * @return
	 */
	public Map getInstallCommission(Map inVar) throws NtRmsDaoException, Exception{
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
	 * 수수료 이연처리
	 * @param map
	 * @return
	 */
	public Map getCommPostPone(Map inVar) throws NtRmsDaoException, Exception{
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
	 * 판매인별 수수료 내역집계
	 * @param map
	 * @return
	 */
	public Map getAgentCommission(Map inVar) throws NtRmsDaoException, Exception{
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
	 * 판매처별 수수료 현황
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getSaleCommissionList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("saleCommission.getSaleCommissionList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}	
	
	/**
	 * 충당금 적립 계약 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getAllowanceSavingContractList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("allowanceSavingContract.getAllowanceSavingContractList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}	
	
	/**
	 * 충당금 현황(검색내역)
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getAllowanceResultList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("allowanceResult.getAllowanceResultList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}	
	
	/**
	 * 충당금 현황(판매처별 세부내역)
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getAgencyResultList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("allowanceResult.getAgencyResultList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}
	
	/**
	 * 총당금 지급내역 조회
	 * 
	 * @version	1.0
	 * @param	map				조회조건 Map객체
	 * @param	outDataset		조회관련 Dataset
	 * @return	List			조회결과
	 * @throws	NtRmsDaoException
	 * 
	 * ------------------------------------------------------------
	 * Revision History
	 * ------------------------------------------------------------
	 * Ver		Date		Author		SR No			Description
	 * ------------------------------------------------------------
	 * 1.0		2017-11-23	wjim		20171117_02		신규생성		
	 */
	public List<Map> getAllowancePayList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("allowance.getPayList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	
	/**
	 * 총당금 지급내역 저장
	 * 
	 * @version	1.0
	 * @param	inVar			처리관련 Map객체
	 * @return	Map				처리결과
	 * @throws	NtRmsDaoException
	 * 
	 * ------------------------------------------------------------
	 * Revision History
	 * ------------------------------------------------------------
	 * Ver		Date		Author		SR No			Description
	 * ------------------------------------------------------------
	 * 1.0		2017-11-23	wjim		20171117_02		신규생성		
	 */
	public Map saveAllowancePayList(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
	/**
	 * 개별 수수료 내역 조회(실시간 실적조회)
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> listIndividualCommissionList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("individualCommission.listIndividualCommissionList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}	
	
	/**
	 * 개별 수수료 내역 조회(실적조회)
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getindividualCommissionList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("individualCommission.getIndividualCommissionList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}
	
	
	/**
	 * 방문점검수수료 기초집계 목록을 조회한다
	 * 
	 * @param	mapInVar
	 * @return	List
	 * @throws	NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-05-25	wjim		신규생성
	 */
	public List <Map> listRegularchkComm(Map <String, Object> mapInVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rtreCommissionMapDAO.listRegularchkComm", mapInVar);
		List listResult = (List)mapInVar.get("vcursor");
		return listResult;
	}
	
	/**
	 * 방문점검수수료 기초정보를 집계한다
	 * 
	 * @param	inVar
	 * @return	Map
	 * @throws	NtRmsDaoException
	 * @throws	Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-05-25	wjim		신규생성
	 */
	public Map regularchkCommAggregate(Map inVar) throws NtRmsDaoException, Exception {
		Map result = null;
		
		try {
			result = executeDsMap(inVar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 방문점검수수료 변경정보를 저장(등록)하고 수수료를 변경한다
	 * 
	 * @param	mapInDSM
	 * @param	mapInVar
	 * @return	Map
	 * @throws	NtRmsDaoException
	 * @throws	Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-05-25	wjim		신규생성
	 */
	public Map <String, Object> saveRegularchkComm(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws NtRmsDaoException, Exception {
		int nSuccess   = 0;
		Map<String, Object> mapRowSave = null;
		
		// TODO Auto-generated method stub
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	// Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				// 여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						// autoCommit의 설정 Commit
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap dsmModList = (DataSetMap)mapInDSM.get("ds_modList");
			
			if ( dsmModList.size() != 0 ) {
				// 작업순번 채번
				String jobSeq = "";
				getSqlMapClientTemplate().queryForObject("rtreCommissionMapDAO.getRegularchkCommJobseq", mapInVar);
				jobSeq = mapInVar.get("result") == null ? "" : (String)mapInVar.get("result");
				
				for ( int i = 0 ; i < dsmModList.size() ; i++ ) {
					mapRowSave = dsmModList.get(i);
					
					int rowType = ((Integer) mapRowSave.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					
					if ( rowType != DataSet.ROW_TYPE_NORMAL ) {
						
						if (rowType == DataSet.ROW_TYPE_INSERTED) {
							if (!mapRowSave.containsKey("dvsn")) mapRowSave.put("dvsn", "I");
						} else if (rowType == DataSet.ROW_TYPE_UPDATED) {
							if (!mapRowSave.containsKey("dvsn")) mapRowSave.put("dvsn", "U");
						}
						
						mapRowSave.put("jobSeq", jobSeq);
						mapRowSave.put("regId" , mapInVar.get("regId"));
						
						sqlMapClient.queryForObject("rtreCommissionMapDAO.saveRegularchkComm", mapRowSave);
						
						nSuccess = Integer.parseInt((mapRowSave.get("successCode") + ""));
						
						if (nSuccess < 0) {
							break;
						}
					}
				}
			}

			if( nSuccess == 0 ) {
				sqlMapClient.getCurrentConnection().commit();
				sqlMapClient.executeBatch();
				sqlMapClient.commitTransaction();
			} else {
				sqlMapClient.getCurrentConnection().rollback();
				sqlMapClient.executeBatch();
				sqlMapClient.commitTransaction();
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				sqlMapClient.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return mapRowSave;
	}
}

package egovframework.ntrms.kr.co.brn.sd.dao;

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

@SuppressWarnings("unchecked")
@Repository("rTSDArrivalAlarmListMapDAO")
public class RTSDArrivalAlarmListMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);

	public void startTransaction(){
		try {
			getSqlMapClientTemplate().getSqlMapClient().startTransaction();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void endTransaction(){
		try {
			getSqlMapClientTemplate().getSqlMapClient().getCurrentConnection().commit();
			getSqlMapClientTemplate().getSqlMapClient().commitTransaction();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * @author kstka
	 * @version 1.0
	 * @since 2021. 9. 13.
	 * 도착알람문자 집계
	 */
	public Map aggregateArrivalAlarmList(Map inVar) throws NtRmsDaoException, Exception{
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
	 * @author kstka
	 * @version 1.0
	 * @since 2021. 9. 13.
	 * 도착알람문자 발송
	 */
	public Map sendArrivalAlarmList(Map inVar) throws NtRmsDaoException, Exception{
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
	 * @author kstka
	 * @version 1.0
	 * @since 2021. 9. 13.
	 * 도착알람문자 집계내역 조회
	 */
	public List<Map> selectArrivalAlarmList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTSDArrivalAlarmList.p_sRTSD0420", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/**
	 * 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public Map <String, Object> saveArrivalAlarmList(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws NtRmsDaoException, Exception {
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
			
			DataSetMap dsmProvsnList = (DataSetMap)mapInDSM.get("ds_list");
			
			if ( dsmProvsnList.size() != 0 ) {
				for( int i = 0 ; i < dsmProvsnList.size() ; i++ ) {
					mapRowSave = dsmProvsnList.get(i);
					
					int rowType = ((Integer) mapRowSave.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					
					if ( rowType != DataSet.ROW_TYPE_NORMAL ) {
						
						if (rowType == DataSet.ROW_TYPE_INSERTED) {
							if (!mapRowSave.containsKey("dvsn")) mapRowSave.put("dvsn", "I");
						} else if (rowType == DataSet.ROW_TYPE_UPDATED) {
							if (!mapRowSave.containsKey("dvsn")) mapRowSave.put("dvsn", "U");
						} else if (rowType == DataSet.ROW_TYPE_DELETED) {
							if (!mapRowSave.containsKey("dvsn")) mapRowSave.put("dvsn", "D");
						}
						
						mapRowSave.put("regId", mapInVar.get("regId"));
						
						sqlMapClient.queryForObject("rTSDArrivalAlarmList.p_IUDRtsd0420", mapRowSave);
						
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
	
	
	/**
	 * @author kstka
	 * @version 1.0
	 * @since 2021. 9. 13.
	 * 도착알람문자 발송이력 조회
	 */
	public List<Map> selectArrivalAlarmHistList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTSDArrivalAlarmList.p_sRTSD0421", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/**
	 * @author kstka
	 * @version 1.0
	 * @since 2021. 10. 21.
	 * 도착알람문자 집계데이터 갱신
	 */
	public Map renewArrivalAlarmList(Map inVar) throws NtRmsDaoException, Exception{
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
	 * @author kstka
	 * @version 1.0
	 * @since 2022. 7. 01.
	 * 도착알람문자 발송이력(택배) 조회
	 */
	public List<Map<String, Object>> selectArrivalAlarmByLogisticsList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTSDArrivalAlarmList.p_sRTSD0420ByPost", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/*
	 * 택배사 코드 존재 여부
	 */
	public int getLogisticsCount(Map map) {
		getSqlMapClientTemplate().queryForObject("rTSDArrivalAlarmList.f_sRTSD0423Count", map);
		return (Integer)map.get("result");
	}
	
	/*
	 * 택배사 마스터 코드명 조회
	 */
	public String getLogisticsCodeName(Map map) {
		getSqlMapClientTemplate().queryForObject("rTSDArrivalAlarmList.codeName", map);
		return (String)map.get("result");
	}
	
	/*
	 * 택배사 마스터 코드 조회
	 */
	public String getLogisticsCode(Map map) {
		getSqlMapClientTemplate().queryForObject("rTSDArrivalAlarmList.code", map);
		return (String)map.get("result");
	}
	
	/*
	 * 택배사 마스터 코드 업데이트
	 */
	@SuppressWarnings("deprecation")
	public Map<String, Object> updateLogistics(Map<String, Object> map) throws NtRmsDaoException, Exception{
		super.getSqlMapClientTemplate().queryForObject("rTSDArrivalAlarmList.p_IUDRtsd0423", map);
		return map;
	}
	
	/*
	 * 택배사 상태 정보 업데이트
	 */
	@SuppressWarnings("deprecation")
	public Map<String, Object> updateLogisticsStatus(Map<String, Object> map) throws NtRmsDaoException, Exception{
		super.getSqlMapClientTemplate().queryForObject("rTSDArrivalAlarmList.p_IUDRtsd0420", map);
		return map;
	}
}

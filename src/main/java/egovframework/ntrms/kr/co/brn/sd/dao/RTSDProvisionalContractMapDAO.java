package egovframework.ntrms.kr.co.brn.sd.dao;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.nexacro.xapi.data.DataSet;
import com.nexacro.xapi.data.DataSetList;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rTSDProvisionalContractMapDAO")
public class RTSDProvisionalContractMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 가계약정보 목록을 조회한다
	 * 
	 * @param mapIn
	 * @return
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-01	wjim		신규생성
	 * 1.1		2019-07-25	wjim		[20190716_01] 조회조건에 따라 분기처리
	 */
	public Map <String, Object> listProvisionalContract(Map <String, Object> mapInVar) throws NtRmsDaoException {		
		String procedureId = new String();
		
		// 조회조건에 따라 해당 조회조건에 맞추어 튜닝된 조회 procedure로 분기 
		switch (mapInVar.get("tabIndex").toString()) {
			case "0":
				procedureId = "rTSDProvisionalContractMapDAO.listProvisionalContract";
				break;
			case "1":
				procedureId = "rTSDProvisionalContractMapDAO.listProvisionalContract2";
				break;
			case "2":
				procedureId = "rTSDProvisionalContractMapDAO.listProvisionalContract3";
				break;
			default:
				procedureId = "rTSDProvisionalContractMapDAO.listProvisionalContract";
				break;
		}
		
		getSqlMapClientTemplate().queryForObject(procedureId, mapInVar);

		return mapInVar;
	}	
	
	
	/**
	 * 가계약정보+상담정보 목록을 조회한다
	 * 
	 * @param mapIn
	 * @return
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-22	wjim		[20190716_01] 신규생성
	 */
	public Map <String, Object> listExcelProvisionalContract(Map <String, Object> mapInVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTSDProvisionalContractMapDAO.listExcelProvisionalContract", mapInVar);
		
		return mapInVar;
	}
	
	/**
	 * 가계약정보를 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws NtRmsDaoException
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-01	wjim		신규생성
	 */
	@SuppressWarnings("deprecation")
	public Map <String, Object> saveProvisionalContract(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws NtRmsDaoException, Exception {
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
			
			DataSetMap dsmProvsnList = (DataSetMap)mapInDSM.get("ds_provsnList");
			
			if ( dsmProvsnList.size() != 0 ) {
				for( int i = 0 ; i < dsmProvsnList.size() ; i++ ) {
					mapRowSave = dsmProvsnList.get(i);
					
					int rowType = ((Integer) mapRowSave.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					
					if ( rowType != DataSet.ROW_TYPE_NORMAL ) {
						
						if (rowType == DataSet.ROW_TYPE_INSERTED) {
							if (!mapRowSave.containsKey("dvsn")) mapRowSave.put("dvsn", "I");
						} else if (rowType == DataSet.ROW_TYPE_UPDATED) {
							if (!mapRowSave.containsKey("dvsn")) mapRowSave.put("dvsn", "U");
						}
						
						mapRowSave.put("regId", mapInVar.get("regId"));
						
						sqlMapClient.queryForObject("rTSDProvisionalContractMapDAO.saveProvisionalContract", mapRowSave);
						
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
	 * 가계약상담정보 목록을 조회한다
	 * 
	 * @param mapIn
	 * @return
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-02	wjim		신규생성
	 */
	public List <Map> listProvisionalContractContact(Map <String, Object> mapInVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTSDProvisionalContractMapDAO.listProvisionalContractContact", mapInVar);
		List listResult = (List)mapInVar.get("vcursor");
		return listResult;
	}
	
	/**
	 * 가계약상담정보를 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws NtRmsDaoException
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-02	wjim		신규생성
	 */
	@SuppressWarnings("deprecation")
	public Map <String, Object> saveProvisionalContractContact(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws NtRmsDaoException, Exception {
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
			
			DataSetMap dsmProvsnContactList = (DataSetMap)mapInDSM.get("ds_provsnContactList");
			
			if ( dsmProvsnContactList.size() != 0 ) {
				for( int i = 0 ; i < dsmProvsnContactList.size() ; i++ ) {
					mapRowSave = dsmProvsnContactList.get(i);
					
					int rowType = ((Integer) mapRowSave.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					
					if ( rowType != DataSet.ROW_TYPE_NORMAL ) {
						
						if (rowType == DataSet.ROW_TYPE_INSERTED) {
							if (!mapRowSave.containsKey("dvsn")) mapRowSave.put("dvsn", "I");
						} else if (rowType == DataSet.ROW_TYPE_UPDATED) {
							if (!mapRowSave.containsKey("dvsn")) mapRowSave.put("dvsn", "U");
						}
						
						mapRowSave.put("regId", mapInVar.get("regId"));
						
						sqlMapClient.queryForObject("rTSDProvisionalContractMapDAO.saveProvisionalContractContact", mapRowSave);
						
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
	 * 홈쇼핑 가계약 정보를 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws NtRmsDaoException
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-01	wjim		신규생성
	 */
	@SuppressWarnings("deprecation")
	public Map <String, Object> saveHomeProvisionalTemp(Map <String, Object> mapInVar) throws NtRmsDaoException, Exception {
		Map result = null;
		try {
			result = super.executeDsMap(mapInVar);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 홈쇼핑 가계약 정보를 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws NtRmsDaoException
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-01	wjim		신규생성
	 */
	@SuppressWarnings("deprecation")
	public Map <String, Object> saveHomeProvisionalContract(Map <String, Object> mapInVar) throws NtRmsDaoException, Exception {
		getSqlMapClientTemplate().queryForObject("rTSDProvisionalContractMapDAO.saveHomeProvisionalContract", mapInVar);		
		return mapInVar;
	}
	
	/**
	 * 아웃바운드 상담 배정 내역을 조회한다.
	 * 
	 * @param mapIn
	 * @return
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2023-07-18	kstka		신규생성
	 */
	public List <Map> selectOutboundAssignInfo(Map <String, Object> mapInVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTSDProvisionalContractMapDAO.selectOutboundAssignInfo", mapInVar);
		List listResult = (List)mapInVar.get("vcursor");
		return listResult;
	}
	
	/**
	 * 아웃바운드 상담 내역 분배 처리
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws NtRmsDaoException
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2023-07-19	kstka		신규생성
	 */
	@SuppressWarnings("deprecation")
	public Map <String, Object> aggregateOutboundListDivide(Map <String, Object> mapInVar) throws NtRmsDaoException, Exception {
		getSqlMapClientTemplate().queryForObject("rTSDProvisionalContractMapDAO.aggregateOutboundListDivide", mapInVar);		
		return mapInVar;
	}
	
	/**
	 * 아웃바운드 상담 내역 회수 처리
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws NtRmsDaoException
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2023-07-19	kstka		신규생성
	 */
	@SuppressWarnings("deprecation")
	public Map <String, Object> updateOutboundListRevoke(Map <String, Object> mapInVar) throws NtRmsDaoException, Exception {
		getSqlMapClientTemplate().queryForObject("rTSDProvisionalContractMapDAO.updateOutboundListRevoke", mapInVar);		
		return mapInVar;
	}

}

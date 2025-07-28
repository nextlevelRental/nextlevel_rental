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

package egovframework.ntrms.kr.co.brn.sd.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@SuppressWarnings("unchecked")
@Repository("rTSDReRentalMapDAO")

public class RTSDReRentalMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	@Resource(name="sqlMapClient")
	public void initDAO(SqlMapClient sqlMapClient) throws NtRmsDaoException{
		setSqlMapClient(sqlMapClient);
	}
	
	@SuppressWarnings("deprecation")
	public SqlMapClientTemplate getSqlMapClientTemplateDAO() throws NtRmsDaoException{
		return this.getSqlMapClientTemplate();
	}
	
	public List<Map> listReRental(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("reRental.sReRentalList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listReRentalForExcel(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("reRental.sReRentalListForExcel", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> rtsd0108OrdList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.sRtsd0108OrdList", map);
		List li = (List)map.get("vcursor");
		return li;
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
	public Map <String, Object> saveRerentalContract(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws NtRmsDaoException, Exception {
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
						
						sqlMapClient.queryForObject("reRental.saveRerentalContract", mapRowSave);
						
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
	 * 고객정보등록
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
	public Map <String, Object> updateCustInfo(Map <String, Object> mapInVar) throws NtRmsDaoException, Exception {
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
	 * 가계약정보등록
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws NtRmsDaoException
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2019-07-23	kstka		신규생성
	 */
	@SuppressWarnings("deprecation")
	public Map <String, Object> createRtsd0123(Map <String, Object> mapInVar) throws NtRmsDaoException, Exception {
		Map result = null;
		try {
			result = executeMap(mapInVar);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//단일 DataSet 처리
	public Map executeDsMap(Map inVar) throws NtRmsDaoException, Exception {
			Map map = null;
			// TODO Auto-generated method stub
			SqlMapClientTemplate sqlTemplate 	= getSqlMapClientTemplate();
			SqlMapClient sqlMapClient		 	= sqlTemplate.getSqlMapClient();
			
			sqlMapClient.startTransaction();   									 	//Transaction 시작
			sqlMapClient.getCurrentConnection().setAutoCommit(false);				//여기서 autoCommit설정을 변경해준다
			sqlMapClient.commitTransaction();               						//autoCommit의 설정 Commit
			int success = 0;
			try {
				sqlMapClient.startBatch();
				
				DataSetMap inDsMap = (DataSetMap)inVar.get("inDsMap");
				for(int i = 0; i<inDsMap.size(); i++) {
					map = inDsMap.get(i);
					map.put("regId", inVar.get("regId"));
					try{
						sqlMapClient.queryForObject((String)inVar.get("sqlnamespace"), map);
						success = Integer.parseInt((map.get("successCode") + ""));
					}catch(Exception e){
						success = -1;
						map.put("successCode", -1);
						map.put("returnMessage", "시스템관리자에게 문의바랍니다!.\n"+e+"");
					}
					
					if(success < 0) {
						break;
					}
				}
				
				
				if(success == 0) {
					sqlMapClient.getCurrentConnection().commit();
					sqlMapClient.executeBatch();
					sqlMapClient.commitTransaction();      
				} else {
					sqlMapClient.getCurrentConnection().rollback();
					sqlMapClient.executeBatch();
					sqlMapClient.commitTransaction();
				}
				//Transaction Commit!!
				//connection Commit!!
			
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
			return map;
		}
	
	//단일 DataSet 처리
		public Map executeMap(Map inVar) throws NtRmsDaoException, Exception {
				Map map = null;
				// TODO Auto-generated method stub
				SqlMapClientTemplate sqlTemplate 	= getSqlMapClientTemplate();
				SqlMapClient sqlMapClient		 	= sqlTemplate.getSqlMapClient();
				
				sqlMapClient.startTransaction();   									 	//Transaction 시작
				sqlMapClient.getCurrentConnection().setAutoCommit(false);				//여기서 autoCommit설정을 변경해준다
				sqlMapClient.commitTransaction();               						//autoCommit의 설정 Commit
				int success = 0;
				try {
					
					try{
						sqlMapClient.queryForObject((String)inVar.get("sqlnamespace"), inVar);
						map = inVar;
						success = Integer.parseInt((map.get("successCode") + ""));
					}catch(Exception e){
						success = -1;
						map.put("successCode", -1);
						map.put("returnMessage", "시스템관리자에게 문의바랍니다!.\n"+e+"");
					}
					
					if(success == 0) {
						sqlMapClient.getCurrentConnection().commit();
						sqlMapClient.commitTransaction();      
					} else {
						sqlMapClient.getCurrentConnection().rollback();
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
				return map;
			}
}
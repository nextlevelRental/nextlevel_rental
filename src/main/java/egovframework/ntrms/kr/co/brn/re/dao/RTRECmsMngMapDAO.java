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

import java.sql.SQLException;
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
@Repository("rTRECmsMngMapDAO")

public class RTRECmsMngMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	SqlMapClientTemplate sqlTemplate = null;
	SqlMapClient sqlMapClient		 = null;
	
	public void startTransaction() throws Exception{
		sqlTemplate = getSqlMapClientTemplate();
		sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	// Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				// 여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();
		
		sqlMapClient.startBatch();
	}
	
	public void commitTransaction() throws Exception{
		sqlMapClient.getCurrentConnection().commit();
		sqlMapClient.executeBatch();
		sqlMapClient.commitTransaction();
		sqlMapClient.endTransaction();
	}
	
	public void rollbackTransaction() throws Exception{
		sqlMapClient.getCurrentConnection().rollback();
		sqlMapClient.executeBatch();
		sqlMapClient.commitTransaction();
		sqlMapClient.endTransaction();
	}
	
	public Map <String, Object> saveDataset(String sqlMapNm, DataSetMap dsm) throws NtRmsDaoException, Exception {
		String result = "";
		String returnMessage = "";
		Map<String, Object> mapRowSave = null;
		
		// TODO Auto-generated method stub
//		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
//		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
//		
//		sqlMapClient.startTransaction();   									 	// Transaction 시작
//		sqlMapClient.getCurrentConnection().setAutoCommit(false);				// 여기서 autoCommit설정을 변경해준다
//		sqlMapClient.commitTransaction();               						// autoCommit의 설정 Commit
		
		try {
//			sqlMapClient.startBatch();
			
			if ( dsm.size() != 0 ) {
				for( int i = 0 ; i < dsm.size() ; i++ ) {
					mapRowSave = dsm.get(i);
					
					int rowType = ((Integer) mapRowSave.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					
					if ( rowType != DataSet.ROW_TYPE_NORMAL ) {
						
						if (rowType == DataSet.ROW_TYPE_INSERTED) {
							if (!mapRowSave.containsKey("dvsn")) mapRowSave.put("dvsn", "I");
						} else if (rowType == DataSet.ROW_TYPE_UPDATED) {
							if (!mapRowSave.containsKey("dvsn")) mapRowSave.put("dvsn", "U");
						}
						
						sqlMapClient.queryForObject(sqlMapNm, mapRowSave);
						
						result = (String)mapRowSave.get("errortext");
						returnMessage = (String)mapRowSave.get("returnMessage");
						
						if (returnMessage != null && result != null) {
							throw new Exception(returnMessage);
						}else if (result != null){
							throw new Exception(result);
						}
					}
				}
			}

//			if( result == null ) {
//				sqlMapClient.getCurrentConnection().commit();
//				sqlMapClient.executeBatch();
//				sqlMapClient.commitTransaction();
//			} else {
//				sqlMapClient.getCurrentConnection().rollback();
//				sqlMapClient.executeBatch();
//				sqlMapClient.commitTransaction();
//			}
			
		}catch (SQLException e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
//			try {
//				sqlMapClient.endTransaction();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
		}
		
		return mapRowSave;
	}
	
	public Map selectData(String sqlMapNm, Map<String, Object> inMap) throws SQLException{
		
		try{
			getSqlMapClientTemplate().queryForObject(sqlMapNm, inMap);
		}catch(Exception e){
			e.printStackTrace();
		}
		return inMap;
	}
}
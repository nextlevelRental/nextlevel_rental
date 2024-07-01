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
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@SuppressWarnings("unchecked")
@Repository("rTSDCarMasterRegisterMapDAO")

public class RTSDCarMasterRegisterMapDAO extends EgovAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	@Resource(name="sqlMapClient")
	public void initDAO(SqlMapClient sqlMapClient) throws NtRmsDaoException{
		setSqlMapClient(sqlMapClient);
	}
	
	@SuppressWarnings("deprecation")
	public SqlMapClientTemplate getSqlMapClientTemplateDAO() throws NtRmsDaoException{
		return this.getSqlMapClientTemplate();
	}
	
	public List<Map> sRtsd0001ModelSelect(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("carMasterRegister.sRtsd0001ModelSelect", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> sRtsd0001ModelByClassSelect(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("carMasterRegister.sRtsd0001ModelByClassSelect", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> sRtsd0001ContentsSelect(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("carMasterRegister.sRtsd0001ContentsSelect", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> carMasterSelect(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("carMasterRegister.carMasterSelect", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveRTSDCarMasterRegister(Map dsRtre0001Map, Map dsRtre0002Map, Map dsRtreUpdateMap, Map inVar) throws NtRmsDaoException, Exception {
		int success1 = 0;	//dsRtre0001Map       
		int success2 = 0;   //dsRtre0002Map
		int success3 = 0;   //dsRtre0002Map
		
		Map map  = null;	//return map
		
		Map map1 = null; 	//dsRtre0001Map
		Map map2 = null;	//dsRtre0002Map
		Map map3 = null;	
		
		// TODO Auto-generated method stub
		SqlMapClientTemplate sqlTemplate 	= getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 	= sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	//Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				//여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						//autoCommit의 설정 Commit
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap inDsRtre0001Map 		= (DataSetMap)dsRtre0001Map.get("dsRtre0001Map");
			DataSetMap inDsRtre0002Map 		= (DataSetMap)dsRtre0002Map.get("dsRtre0002Map");
			DataSetMap inDsRtreUpdateMap 	= (DataSetMap)dsRtreUpdateMap.get("dsRtreUpdateMap");
			
			if( inDsRtre0001Map.size() != 0 ){
				for( int i = 0 ; i < inDsRtre0001Map.size() ; i++ ) {
					map1 = inDsRtre0001Map.get(i);
					int rowType1 = ((Integer) map1.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					if( rowType1 != DataSet.ROW_TYPE_NORMAL ){
						if(rowType1 == DataSet.ROW_TYPE_INSERTED) {
							if(!map1.containsKey("dvsn")) map1.put("dvsn", "I");
						} else if(rowType1 == DataSet.ROW_TYPE_UPDATED) {
							if(!map1.containsKey("dvsn")) map1.put("dvsn", "U");
						} else if(rowType1 == DataSet.ROW_TYPE_DELETED) {
							if(!map1.containsKey("dvsn")) map1.put("dvsn", "D");
						}
						map1.put("regId", inVar.get("regId"));
						sqlMapClient.queryForObject((String)dsRtre0001Map.get("sqlnamespace"), map1);
						success1 = Integer.parseInt((map1.get("successCode") + ""));
						map = map1;
						if(success1 < 0){
							break;
						}
					}
				}
			}
			
			if( success1 == 0 && inDsRtre0002Map.size() != 0 ){
				for( int i = 0 ; i < inDsRtre0002Map.size() ; i++ ) {
					map2 = inDsRtre0002Map.get(i);
					int rowType2 = ((Integer) map2.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					if( rowType2 != DataSet.ROW_TYPE_NORMAL ){
						if(rowType2 == DataSet.ROW_TYPE_INSERTED) {
							if(!map2.containsKey("dvsn")) map2.put("dvsn", "I");
						} else if(rowType2 == DataSet.ROW_TYPE_UPDATED) {
							if(!map2.containsKey("dvsn")) map2.put("dvsn", "U");
						} else if(rowType2 == DataSet.ROW_TYPE_DELETED) {
							if(!map2.containsKey("dvsn")) map2.put("dvsn", "D");
						}
						map2.put("regId", inVar.get("regId"));
						sqlMapClient.queryForObject((String)dsRtre0002Map.get("sqlnamespace"), map2);
						success2 = Integer.parseInt((map2.get("successCode") + ""));
						map = map2;
						if(success2 < 0){
							break;
						}
					}
				}
			}

			if( success1 == 0 &&  success2 == 0 && inDsRtreUpdateMap.size() != 0 ){
				for( int i = 0 ; i < inDsRtreUpdateMap.size() ; i++ ) {
					map3 = inDsRtreUpdateMap.get(i);
					int rowType3 = ((Integer) map3.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					if( rowType3 != DataSet.ROW_TYPE_NORMAL ){
						if(rowType3 == DataSet.ROW_TYPE_INSERTED) {
							if(!map3.containsKey("dvsn")) map3.put("dvsn", "I");
						} else if(rowType3 == DataSet.ROW_TYPE_UPDATED) {
							if(!map3.containsKey("dvsn")) map3.put("dvsn", "U");
						} else if(rowType3 == DataSet.ROW_TYPE_DELETED) {
							if(!map3.containsKey("dvsn")) map3.put("dvsn", "D");
						}
						map3.put("regId", inVar.get("regId"));
						sqlMapClient.queryForObject((String)dsRtreUpdateMap.get("sqlnamespace"), map3);
						success3 = Integer.parseInt((map3.get("successCode") + ""));
						map = map3;
						if(success3 < 0){
							break;
						}
					}
				}
			}

			if( success1 == 0 && success2 == 0 && success3 == 0 ) {
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
		return map;
	}
}
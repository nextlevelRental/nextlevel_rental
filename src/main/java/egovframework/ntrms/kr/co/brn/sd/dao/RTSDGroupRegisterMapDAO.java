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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@SuppressWarnings("unchecked")
@Repository("rTSDGroupRegisterMapDAO")

public class RTSDGroupRegisterMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);

	
	public List<Map> listGroupInfo(Map inVar) throws Exception {
		getSqlMapClientTemplate().queryForObject("group.listGroupInfo", inVar);
		List li = (List)inVar.get("vcursor");
		return li;
	}
	
	
	public Map saveGroupInfo(Map inVar) throws Exception {
		Map result = null;
		try {
			result = executeDsMap(inVar);			
		}catch (Exception e) {
			e.printStackTrace();			
		}
		return result;
	}
	
	public Map cancelOrdInfo(Map inVar) throws Exception {
		Map result = null;
		try {
			result = executeDsMap(inVar);			
		}catch (Exception e) {
			e.printStackTrace();			
		}
		return result;
	}

	public Map cancelOrdInfo_All(Map inVar) throws Exception {
		Map result = null;
		try {
			result = executeDsMap(inVar);			
		}catch (Exception e) {
			e.printStackTrace();			
		}
		return result;
	}	
	
	public List<Map> listAddPackageInfo(Map inVar) throws Exception {
		getSqlMapClientTemplate().queryForObject("group.listAddPackageInfo", inVar);
		List li = (List)inVar.get("vcursor");
		return li;
	}
	
public Map cancelPackage(Map dsOrdNolistChkMap, Map dsOrdNolistChk00Map, Map inVar) throws NtRmsDaoException, Exception {
		
		int success1 = 0;	//inDsMapRtsd0100       
		int success2 = 0;   //inDsMapRtsd0104        
				
		Map map  = null;	//return map
		
		Map map1 = null; 	//inDsMapRtsd0100
		Map map2 = null;	//inDsMapRtsd0104
		
		String ordNo  = "";
		
		// TODO Auto-generated method stub
		SqlMapClientTemplate sqlTemplate 	= getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 	= sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	//Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				//여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						//autoCommit의 설정 Commit
		
		try {
			sqlMapClient.startBatch();

			DataSetMap inDsOrdNolistChk	= (DataSetMap)dsOrdNolistChkMap.get("dsOrdNolistChkMap");
			DataSetMap inDsOrdNolistChk00	= (DataSetMap)dsOrdNolistChk00Map.get("dsOrdNolistChk00Map");
			
			//RTSD0100고객정보
			if( inDsOrdNolistChk.size() != 0 ){				
				for( int i = 0 ; i < inDsOrdNolistChk.size() ; i++ ) {
				map1 = inDsOrdNolistChk.get(i);
				int rowType1 = ((Integer) map1.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
				
				System.out.println("1--------------------------------> "+rowType1);
				
					if( rowType1 != DataSet.ROW_TYPE_NORMAL ){
						map1.put("regId", inVar.get("regId"));
						sqlMapClient.queryForObject((String)dsOrdNolistChkMap.get("sqlnamespace"), map1);
						if(rowType1 == DataSet.ROW_TYPE_INSERTED) {
							if(!map1.containsKey("dvsn")) map1.put("dvsn", "I");
						} else if(rowType1 == DataSet.ROW_TYPE_UPDATED) {
							if(!map1.containsKey("dvsn")) map1.put("dvsn", "U");
						} else if(rowType1 == DataSet.ROW_TYPE_DELETED) {
							if(!map1.containsKey("dvsn")) map1.put("dvsn", "D");
						}
												
						success1 = Integer.parseInt((map1.get("successCode") + ""));
					}	
				}
				map = map1;
			}
			
			//RTSD0104 TABLE 계약정보 
			if( success1 == 0 ){
				
				if( inDsOrdNolistChk00.size() != 0 ){				
					for( int i = 0 ; i < inDsOrdNolistChk00.size() ; i++ ) {
				map2 = inDsOrdNolistChk00.get(i);
				int rowType2 = ((Integer) map2.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
		
				System.out.println("2--------------------------------> "+rowType2);
				if( rowType2 != DataSet.ROW_TYPE_NORMAL ){
					map2.put("regId", inVar.get("regId"));
					map2.put("pkgDcYn", inVar.get("pkgDcYn"));
					map2.put("restCnt", inVar.get("restCnt"));
					
					sqlMapClient.queryForObject((String)dsOrdNolistChk00Map.get("sqlnamespace"), map2);
					if(rowType2 == DataSet.ROW_TYPE_INSERTED) {
						if(!map2.containsKey("dvsn")) map2.put("dvsn", "I");
					} else if(rowType2 == DataSet.ROW_TYPE_UPDATED) {
						if(!map2.containsKey("dvsn")) map2.put("dvsn", "U");
					} else if(rowType2 == DataSet.ROW_TYPE_DELETED) {
						if(!map2.containsKey("dvsn")) map2.put("dvsn", "D");
					}
					
					success2 = Integer.parseInt((map2.get("successCode") + ""));
				}
			}
				
				map = map2;
			}
				// RTSD0106 TABLE 제품정보

			}	// RTSD0106 TABLE 계약상품정보

			if( success1 == 0 && success2 ==0 ){
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

	public Map cancelOrdNo2(Map dsOrdNolistChkMap, Map dsOrdNolistChk00Map, Map inVar) throws NtRmsDaoException, Exception {
		
		int success1 = 0;	//inDsMapRtsd0100       
		int success2 = 0;   //inDsMapRtsd0104        
		
		Map map  = null;	//return map
		
		Map map1 = null; 	//inDsMapRtsd0100
		Map map2 = null;	//inDsMapRtsd0104
		
		String ordNo  = "";
		
		// TODO Auto-generated method stub
		SqlMapClientTemplate sqlTemplate 	= getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 	= sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	//Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				//여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						//autoCommit의 설정 Commit
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap inDsOrdNolistChk	= (DataSetMap)dsOrdNolistChkMap.get("dsOrdNolistChkMap");
			DataSetMap inDsOrdNolistChk00	= (DataSetMap)dsOrdNolistChk00Map.get("dsOrdNolistChk00Map");
			
			//RTSD0100고객정보
			if( inDsOrdNolistChk.size() != 0 ){				
				for( int i = 0 ; i < inDsOrdNolistChk.size() ; i++ ) {
					map1 = inDsOrdNolistChk.get(i);
					int rowType1 = ((Integer) map1.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					
					if( rowType1 != DataSet.ROW_TYPE_NORMAL ){
						map1.put("regId", inVar.get("regId"));
						sqlMapClient.queryForObject((String)dsOrdNolistChkMap.get("sqlnamespace"), map1);
						
						success1 = Integer.parseInt((map1.get("successCode") + ""));
						
						if(success1 < 0){
							map = map1;
						}
					}	
				}
				map = map1;
			}
			
			//RTSD0104 TABLE 계약정보 
			if( success1 == 0 ){
				
				if( inDsOrdNolistChk00.size() != 0 ){				
					for( int i = 0 ; i < inDsOrdNolistChk00.size() ; i++ ) {
						map2 = inDsOrdNolistChk00.get(i);
						int rowType2 = ((Integer) map2.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();

						if( rowType2 != DataSet.ROW_TYPE_NORMAL ){
							map2.put("regId", inVar.get("regId"));
							map2.put("pkgDcYn", inVar.get("pkgDcYn"));
							map2.put("restCnt", inVar.get("restCnt"));
							
							sqlMapClient.queryForObject((String)dsOrdNolistChk00Map.get("sqlnamespace"), map2);
							
							success2 = Integer.parseInt((map2.get("successCode") + ""));
							
							if(success2 < 0){
								map = map2;
							}
						}
					}
					
					map = map2;
				}
				
			}
			
			if( success1 == 0 && success2 ==0 ){
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

	public String cancelPrice(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("group.cancelPrice", map);
	
		return (String)map.get("result");
	}
}
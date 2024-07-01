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
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@SuppressWarnings("unchecked")
@Repository("rTSDProductMapDAO")

public class RTSDProductMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);

	
	public List<Map> detailProductInfo(Map inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("product.detailProductInfo", inVar);
		List li = (List)inVar.get("vcursor");
		return li;
	}
	
	public Map saveProductInfo(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	/*public Map saveOrderNo(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}*/
	
public Map saveOrderNo(Map dsRtsd0100Map, Map inVar) throws NtRmsDaoException, Exception {
		
		int success1 = 0;	//inDsMapRtsd0100       
		int success2 = 0;	//inDsMapRtsd0100       
				
		Map map  = null;	//return map
		
		Map map1 = null; 	//inDsMapRtsd0100
		Map map2 = null; 	//inDsMapRtsd0100
		
		String ordNo  = "";
		
		// TODO Auto-generated method stub
		SqlMapClientTemplate sqlTemplate 	= getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 	= sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	//Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				//여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						//autoCommit의 설정 Commit
		
		try {
			sqlMapClient.startBatch();

			DataSetMap inDsMapRtsd0100	= (DataSetMap)dsRtsd0100Map.get("dsRtsd0100Map");
			

			if( inDsMapRtsd0100.size() != 0 ){
				
				for( int i = 0 ; i < inDsMapRtsd0100.size() ; i++ ) {
				map1 = inDsMapRtsd0100.get(i);
				int rowType1 = ((Integer) map1.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
				
				System.out.println("1--------------------------------> "+rowType1);
				
					if( rowType1 != DataSet.ROW_TYPE_NORMAL ){
						map1.put("regId", inVar.get("regId"));
						sqlMapClient.queryForObject((String)dsRtsd0100Map.get("sqlnamespace"), map1);
						
						if(rowType1 == DataSet.ROW_TYPE_INSERTED) {
							if(!map1.containsKey("dvsn")) map1.put("dvsn", "I");
						} else if(rowType1 == DataSet.ROW_TYPE_UPDATED) {
							if(!map1.containsKey("dvsn")) map1.put("dvsn", "U");
						} else if(rowType1 == DataSet.ROW_TYPE_DELETED) {
							if(!map1.containsKey("dvsn")) map1.put("dvsn", "D");
						}
						success1 = Integer.parseInt((map1.get("successCode") + ""));
						System.out.println(success1);
					}	
				}map=map1;
			}
			
			if( success1 == 0){
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
	
	
	public List<Map> TopMenuNoList(Map inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("product.TopMenuNoList", inVar);
		List li = (List)inVar.get("vcursor");
		return li;
	}	
	public List<Map> TopMenuNoList2(Map inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("product.TopMenuNoList2", inVar);
		List li = (List)inVar.get("vcursor");
		return li;
	}	
	public Map saveOrderNo2(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
}
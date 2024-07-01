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
import java.util.ArrayList;
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

@SuppressWarnings("unchecked")
@Repository("rTSDMemberOrderMapDAO")

public class RTSDMemberOrderMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	@Resource(name="sqlMapClient")
	public void initDAO(SqlMapClient sqlMapClient) throws NtRmsDaoException{
		setSqlMapClient(sqlMapClient);
	}
	
	public List<Map> listCommInfo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("comm.listCommInfo", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	
public Map saveMemberOrder(Map bankAndCardMap, Map dsRtsd0100Map, Map dsRtsd0104Map, Map dsRtsd0106Map, Map dsRtsd0013Map, Map inVar) throws NtRmsDaoException, Exception {
		
		
		int success1 = 0;	//inDsbankAndCard       
		int success2 = 0;   //inDsMapRtsd0100        
		int success3 = 0;   //inDsMapRtsd0104
		int success4 = 0;   //inDsMapRtsd0106          
		int success5 = 0;   //inDsMapRtsd0013          
		int success6 = 0;	//
				
		Map map  = null;	//return map
		
		Map map1 = null; 	//inDsbankAndCard
		Map map2 = null;	//inDsMapRtsd0104
		Map map3 = null;	//inDsMapRtsd0106
		Map map4 = null;	//inDsMapRtsd0013
		Map map6 = new HashMap();
		Map map7 = null;	//inDsMapRtsd0100 
		
		String accSeq = "";
		String crdSeq = "";
		String ordNo  = "";
		
		// TODO Auto-generated method stub
		SqlMapClientTemplate sqlTemplate 	= getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 	= sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	//Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				//여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						//autoCommit의 설정 Commit
		
		try {
			sqlMapClient.startBatch();

			DataSetMap inDsbankAndCard	= (DataSetMap)bankAndCardMap.get("bankAndCardMap");
			DataSetMap inDsMapRtsd0100	= (DataSetMap)dsRtsd0100Map.get("dsRtsd0100Map");
			DataSetMap inDsMapRtsd0104	= (DataSetMap)dsRtsd0104Map.get("dsRtsd0104Map");
			DataSetMap inDsMapRtsd0106	= (DataSetMap)dsRtsd0106Map.get("dsRtsd0106Map");
			DataSetMap inDsMapRtsd0013 	= (DataSetMap)dsRtsd0013Map.get("dsRtsd0013Map");
			
			map1 = inDsbankAndCard.get(0);
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
				sqlMapClient.queryForObject((String)bankAndCardMap.get("sqlnamespace"), map1);
				success1 = Integer.parseInt((map1.get("successCode") + ""));
				
				if(success1 < 0){
					map = map1;
				}
				
			}
			String sqlnamespace1=(String)bankAndCardMap.get("sqlnamespace");
			if( sqlnamespace1.equals("contact.saveBank") ){
				accSeq = (String) map1.get("accSeq");
			}else if( sqlnamespace1.equals("contact.saveCard") ){
				crdSeq = (String) map1.get("crdSeq");
			}
			
			
			//RTSD0104 TABLE
			if( success1 == 0 ){
				map7 = inDsMapRtsd0100.get(0);
				int rowType7 = ((Integer) map7.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
				if( rowType7 != DataSet.ROW_TYPE_NORMAL ){
					if(rowType7 == DataSet.ROW_TYPE_INSERTED) {
						if(!map7.containsKey("dvsn")) map7.put("dvsn", "I");
					} else if(rowType7 == DataSet.ROW_TYPE_UPDATED) {
						if(!map7.containsKey("dvsn")) map7.put("dvsn", "U");
//						sqlMapClient.queryForObject((String)dsRtsd0104Map.get("sqlHisnamespace"), map7);
					} else if(rowType7 == DataSet.ROW_TYPE_DELETED) {
						if(!map7.containsKey("dvsn")) map7.put("dvsn", "D");
					}
					map7.put("regId", inVar.get("regId"));
					if( !accSeq.equals("") ) map7.put("accSeq", accSeq);
					if( !crdSeq.equals("") ) map7.put("crdSeq", crdSeq);
					sqlMapClient.queryForObject((String)dsRtsd0100Map.get("sqlnamespace"), map7);
					success2 = Integer.parseInt((map7.get("successCode") + ""));
					
					if(success2 < 0){
						map = map7;
					}
				}
				
				
				if( success1 == 0 && success2 == 0){
					map2 = inDsMapRtsd0104.get(0);
					int rowType2 = ((Integer) map2.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					if( rowType2 != DataSet.ROW_TYPE_NORMAL ){
						if(rowType2 == DataSet.ROW_TYPE_INSERTED) {
							if(!map2.containsKey("dvsn")) map2.put("dvsn", "I");
						} else if(rowType2 == DataSet.ROW_TYPE_UPDATED) {
							if(!map2.containsKey("dvsn")) map2.put("dvsn", "U");
//							sqlMapClient.queryForObject((String)dsRtsd0104Map.get("sqlHisnamespace"), map2);
						} else if(rowType2 == DataSet.ROW_TYPE_DELETED) {
							if(!map2.containsKey("dvsn")) map2.put("dvsn", "D");
						}
						map2.put("regId", inVar.get("regId"));
						if( !accSeq.equals("") ) map2.put("accSeq", accSeq);
						if( !crdSeq.equals("") ) map2.put("crdSeq", crdSeq);
						map2.put("custNo",map7.get("custNo"));
						sqlMapClient.queryForObject((String)dsRtsd0104Map.get("sqlnamespace"), map2);
						success3 = Integer.parseInt((map2.get("successCode") + ""));
						
						if(success3 < 0){
							map = map2;
						}
					}

		
				
				// RTSD0106 TABLE 제품정보
					if( success1 == 0 && success2 == 0 && success3 == 0){
					int j = 1;
					
					
					for( int i = 0 ; i < inDsMapRtsd0106.size() ; i++ ) {
						map3 = inDsMapRtsd0106.get(i);
						
						map3.put("regId", inVar.get("regId"));
						int rowType3 = ((Integer) map3.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
						
						if( rowType3 != DataSet.ROW_TYPE_NORMAL ){													
							map3.put("seq", j);	

							if(j == 1){ // 첫번째 무조건 실행
								
								if(map2.get("dvsn").equals("I")){  // 104 dvsn 'I' 일때만 체크 	
									map6.put("custNo",map2.get("custNo"));
									map6.put("carNo", map2.get("carNo"));
									map6.put("matCd", map3.get("matCd"));
									map6.put("chanCd",map2.get("chanCd"));
									ordNo = f_sRtsd0104GetExistContract(map6);
									if( ordNo != null ){
										success6 = -2;
										break;
									}else{
										success6 = 0;
									}
									
								}	
								
								map3.put("ordNo", (String) map2.get("ordNo"));	
								sqlMapClient.queryForObject((String)dsRtsd0106Map.get("sqlnamespaceDel"), map3);
							}	
							if(rowType3 == DataSet.ROW_TYPE_INSERTED) {	
								map3.put("dvsn", "I");
								map3.put("ordNo", (String) map2.get("ordNo"));
								if(success6 == 0){
									sqlMapClient.queryForObject((String)dsRtsd0106Map.get("sqlnamespace"), map3);
									success4 = Integer.parseInt((map3.get("successCode") + ""));
									map = map3;
								}
							}else{
								map3.put("successCode", "0");
							}
							if(success4 < 0){
								map = map3;
								break;
							}
							j++;
						}else{
							map = map3;
						}
					}
					
					
					// RTSD0013 TABLE 프리미엄서비스
					if( success1 == 0 && success2 == 0 && success3 == 0 && success4 == 0 && success6 == 0){
					
						for( int i = 0 ; i < inDsMapRtsd0013.size() ; i++ ) {
							map4 = inDsMapRtsd0013.get(i);
							int rowType4 = ((Integer) map4.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
							if( rowType4 != DataSet.ROW_TYPE_NORMAL ){
								map4.put("regId", inVar.get("regId"));
								map4.put("ordNo", (String) map2.get("ordNo"));
								if( i == 0){
									sqlMapClient.queryForObject((String)dsRtsd0013Map.get("sqlnamespaceDel"), map4);
								}
								
								if(rowType4 == DataSet.ROW_TYPE_INSERTED) {
									if(!map4.containsKey("dvsn")) map4.put("dvsn", "I");
									sqlMapClient.queryForObject((String)dsRtsd0013Map.get("sqlnamespace"), map4);
								}else{
									map4.put("successCode", "0"); 
								} 				
								success5 = Integer.parseInt((map4.get("successCode") + ""));
								
								map = map4;
								if(success5 < 0){
									map = map4;
									break;
								}
							}else{
								map = map4;
							}
						}
					}	// RTSD0013 TABLE 프리미엄서비스 end
					
				} // RTSD0106 TABLE 계약상품정보 end 

			}	// RTSD0106 TABLE 계약상품정보
			
		}
			
			
			if( success1 == 0 && success2 == 0 && success3 == 0 && success4 == 0 && success5==0 && success6 ==0 ){
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
	
	public String f_sRtsd0104GetExistContract(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.f_sRtsd0104GetExistContract", map);
		return (String)map.get("result");
	}
	
	public List<Map> listAddSelProduct2(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.listAddSelProduct2", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public String getcheckOrdNo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.getcheckOrdNo", map);
		return (String)map.get("result");
	}

}
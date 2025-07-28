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
@Repository("rTSDDirectOrderMapDAO")

public class RTSDDirectOrderMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	@Resource(name="sqlMapClient")
	public void initDAO(SqlMapClient sqlMapClient) throws NtRmsDaoException{
		setSqlMapClient(sqlMapClient);
	}
	
	public List<Map> directseqOrdNo(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTSDDirectOrderMapDAO.directseqOrdNo", map);
		List li = (List)map.get("vcursor");
		return li;
	}
public Map saveDirectOrder(Map dsRtsd0100Map, Map dsRtsd0104Map, Map dsRtsd0106Map, Map dsRtsd0013Map, Map dsRtsd0041Map,  Map dsRtsd0401Map, Map inVar) throws NtRmsDaoException, Exception {
		
		int success1 = 0;	//inDsMapRtsd0100       
		int success2 = 0;   //inDsMapRtsd0104        
		int success3 = 0;   //inDsMapRtsd0106
		int success4 = 0;   //inDsMapRtsd0013          
		int success6 = 0;	//inDsMapRtsd0041
		int success7 = 0;	//inDsMapRtsd0401
				
		Map map  = null;	//return map
		
		Map map1 = null; 	//inDsMapRtsd0100
		Map map2 = null;	//inDsMapRtsd0104
		Map map3 = null;	//inDsMapRtsd0106
		Map map4 = null;	//inDsMapRtsd0013
		Map map6 = new HashMap();
		Map map7 = null;	//inDsMapRtsd0041 
		Map map8 = null;	//inDsMapRtsd0401
		
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
			DataSetMap inDsMapRtsd0104	= (DataSetMap)dsRtsd0104Map.get("dsRtsd0104Map");
			DataSetMap inDsMapRtsd0106	= (DataSetMap)dsRtsd0106Map.get("dsRtsd0106Map");
			DataSetMap inDsMapRtsd0013 	= (DataSetMap)dsRtsd0013Map.get("dsRtsd0013Map" );
			DataSetMap inDsMapRtsd0041 	= (DataSetMap)dsRtsd0041Map.get("dsRtsd0041Map");
			DataSetMap inDsMapRtsd0401 	= (DataSetMap)dsRtsd0401Map.get("dsRtsd0401Map"); // [20181122_01]
			
			//RTSD0100고객정보
			if( inDsMapRtsd0100.size() != 0 ){
				
				for( int i = 0 ; i < inDsMapRtsd0100.size() ; i++ ) {
				map1 = inDsMapRtsd0100.get(i);
				int rowType1 = ((Integer) map1.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
				
				System.out.println("1--------------------------------> "+rowType1);
				
					if( rowType1 != DataSet.ROW_TYPE_NORMAL ){
						if(rowType1 == DataSet.ROW_TYPE_INSERTED) {
							if(!map1.containsKey("dvsn")) map1.put("dvsn", "I");
						} else if(rowType1 == DataSet.ROW_TYPE_UPDATED) {
							if(!map1.containsKey("dvsn")) map1.put("dvsn", "U");
						} else if(rowType1 == DataSet.ROW_TYPE_DELETED) {
							if(!map1.containsKey("dvsn")) map1.put("dvsn", "D");
						}
						
						map1.put("regId", inVar.get("regId"));
						sqlMapClient.queryForObject((String)dsRtsd0100Map.get("sqlnamespace"), map1);
						success1 = Integer.parseInt((map1.get("successCode") + ""));
					}	
				}
			}
			
			//RTSD0104 TABLE 계약정보 
			if( success1 == 0 ){
				
				map2 = inDsMapRtsd0104.get(0);
				int rowType2 = ((Integer) map2.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
		
				System.out.println("2--------------------------------> "+rowType2);
				if( rowType2 != DataSet.ROW_TYPE_NORMAL ){
					if(rowType2 == DataSet.ROW_TYPE_INSERTED) {
						if(!map2.containsKey("dvsn")) map2.put("dvsn", "I");
					} else if(rowType2 == DataSet.ROW_TYPE_UPDATED) {
						if(!map2.containsKey("dvsn")) map2.put("dvsn", "U");
					} else if(rowType2 == DataSet.ROW_TYPE_DELETED) {
						if(!map2.containsKey("dvsn")) map2.put("dvsn", "D");
					}
					
					map2.put("regId", inVar.get("regId"));
					map2.put("custNo",map1.get("custNo"));
					sqlMapClient.queryForObject((String)dsRtsd0104Map.get("sqlnamespace"), map2);
					success2 = Integer.parseInt((map2.get("successCode") + ""));
					System.out.println(map2.get("ordNo"));
				}
				
				map = map2;
				
				// RTSD0106 TABLE 제품정보
				if( success1 == 0 && success2 == 0 ){
					int j = 1;
					System.out.println("inDsMapRtsd0106.size()  : " +  inDsMapRtsd0106.size());
					
					for( int i = 0 ; i < inDsMapRtsd0106.size() ; i++ ) {
						map3 = inDsMapRtsd0106.get(i);
						
						map3.put("regId", inVar.get("regId"));
						int rowType3 = ((Integer) map3.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
						
						if(map2.size() > 0 && rowType3 != DataSet.ROW_TYPE_NORMAL ){													
							map3.put("seq", j);	

							if(j == 1){ // 첫번째 무조건 실행
								System.out.println("---------------------------------------"+map2.get("dvsn"));
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
									System.out.println("===============================================");
									System.out.println("success6 : " + success6);
									System.out.println("custNo   : " + map6.get("custNo"));
									System.out.println("carNo    : " + map6.get("carNo"));
									System.out.println("matCd    : " + map6.get("matCd"));
									System.out.println("chanCd   : " + map6.get("chanCd"));
									System.out.println("===============================================");
								}	
								
								map3.put("ordNo", (String) map2.get("ordNo"));	
								System.out.println("success6666666:"+(String) map2.get("ordNo"));
								sqlMapClient.queryForObject((String)dsRtsd0106Map.get("sqlnamespaceDel"), map3);
								System.out.println("1-1---------------------------------------------");
								/*sqlMapClient.queryForObject((String)dsRtsd0106Map.get("sqlnamespaceSaleDel"), map3);*/
								System.out.println("1-2---------------------------------------------");	
							}	
							if(rowType3 == DataSet.ROW_TYPE_INSERTED) {	
								map3.put("dvsn", "I");
								map3.put("ordNo", (String) map2.get("ordNo"));
								if(success6 == 0){
									System.out.println("2-1--------------------------------------------");
									sqlMapClient.queryForObject((String)dsRtsd0106Map.get("sqlnamespace"), map3);
									System.out.println("2-2--------------------------------------------");
									success3 = Integer.parseInt((map3.get("successCode") + ""));
		
									System.out.println("2-2-------------------------------------------- " + success3);									
								}
							}else{
								map3.put("successCode", "0");
							}
							if(success3 < 0){
								map = map3;
								break;
							}
							j++;
						}else{
							map = map3;
						}
					}
					
					
					// RTSD0013 TABLE 프리미엄서비스
					if( success1 == 0 && success2 == 0 && success3 == 0 && success6 == 0){
					
						for( int i = 0 ; i < inDsMapRtsd0013.size() ; i++ ) {
							map4 = inDsMapRtsd0013.get(i);
							int rowType4 = ((Integer) map4.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
							if( rowType4 != DataSet.ROW_TYPE_NORMAL ){
								map4.put("regId", inVar.get("regId"));
								map4.put("ordNo", (String) map2.get("ordNo"));
								if( i == 0){
									System.out.println(i + "전체삭제" + map4.get("prsNm"));
									sqlMapClient.queryForObject((String)dsRtsd0013Map.get("sqlnamespaceDel"), map4);
								}
								
								if(rowType4 == DataSet.ROW_TYPE_INSERTED) {
									if(!map4.containsKey("dvsn")) map4.put("dvsn", "I");
									System.out.println(i + "저장" + map4.get("prsNm"));
									sqlMapClient.queryForObject((String)dsRtsd0013Map.get("sqlnamespace"), map4);
								}else{
									map4.put("successCode", "0"); 
								} 				
								
								System.out.println(i + "map4.get(successCode) : " + map4.get("successCode"));
								success4 = Integer.parseInt((map4.get("successCode") + ""));
								
								map = map4;
								if(success4 < 0){
									map = map4;
									break;
								}
							}else{
								map = map4;
							}
						}
						// RTSD0041 TABLE 부가서비스
						if( success1 == 0 && success2 == 0 && success3 == 0 && success6 == 0 && success4 == 0){
							int k = 1; // SEQ 순번
							int periodCd = Integer.parseInt(inVar.get("periodCd")==null?"0":inVar.get("periodCd").toString());
							int monAmt = 0;
									
							for( int i = 0 ; i < inDsMapRtsd0041.size(); i++ ) {
								
								map6 = inDsMapRtsd0041.get(i);
								int rowType6 = ((Integer) map6.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
								
								if( rowType6 != DataSet.ROW_TYPE_NORMAL ){
									map6.put("regId", inVar.get("regId"));
									map6.put("ordNo", (String) map2.get("ordNo"));
									System.out.println("ordNo : " + (String) map2.get("ordNo"));
									if(i == 0){
										System.out.println(i + "전체삭제");
										sqlMapClient.queryForObject((String)dsRtsd0041Map.get("sqlnamespaceDel"), map6);
									}

									if(rowType6 == DataSet.ROW_TYPE_INSERTED) {
										if(!map6.containsKey("dvsn")) map6.put("dvsn", "I");
										
										// 월렌탈료 계산
										if(map6.get("dcYn").equals("Y")){
											monAmt = Integer.parseInt(map6.get("actAmt").toString())/periodCd; 
											map6.put("monAmt", monAmt);
										}else{
											map6.put("monAmt", 0);
										}

										map6.put("seq", k);
										sqlMapClient.queryForObject((String)dsRtsd0041Map.get("sqlnamespace"), map6);
									}else{
										System.out.println(i + "삭제" );
										map6.put("successCode", "0");
									}
				
									success6 = Integer.parseInt((map6.get("successCode") + ""));
									map = map6;
									if(success6 < 0){
										map = map6;
										break;
									}
									k++;
								}else{
									map = map6;
								}
							}
							
						}	// RTSD0041 TABLE 부가서비스 end
						
					}	// RTSD0013 TABLE 프리미엄서비스 end
					

					//RTSD0401 TABLE
					if ( success1 == 0 && success2 == 0 && success3 == 0 && success6 == 0) {
						for( int iiii = 0 ; iiii < inDsMapRtsd0401.size() ; iiii++ ) {
							map8 = inDsMapRtsd0401.get(iiii);
							
							int rowType8 = ((Integer) map8.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
							
							if ( rowType8 != DataSet.ROW_TYPE_NORMAL ) {
								
								if(rowType8 == DataSet.ROW_TYPE_INSERTED) {
									if(!map8.containsKey("dvsn")) map8.put("dvsn", "I");
								} else if(rowType8 == DataSet.ROW_TYPE_UPDATED) {
									if(!map8.containsKey("dvsn")) map8.put("dvsn", "U");
								} else if(rowType8 == DataSet.ROW_TYPE_DELETED) {
									if(!map8.containsKey("dvsn")) map8.put("dvsn", "D");
								}
								
								
								map8.put("ordNo"  , (String) map2.get("ordNo"));
								map8.put("reqDay" , (String) map2.get("procDay"));
								map8.put("procDay", (String) map2.get("procDay"));
								map8.put("regId"  , inVar.get("regId"));
								
								sqlMapClient.queryForObject((String)dsRtsd0401Map.get("sqlnamespace"), map8);
								success7 = Integer.parseInt((map8.get("successCode") + ""));
								map = map8;
								
								if(success7 < 0){
									map = map8;
									break;
								}
							}else{
								map = map8;
							}
						}
					}

				} // RTSD0106 TABLE 계약상품정보 end 

			}	// RTSD0106 TABLE 계약상품정보

			if( success1 == 0 && success2 == 0 && success3 == 0 && success6 == 0 && success4 == 0 && success7 == 0 ){
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
	
	public List<Map> listAddSelProduct3(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.listAddSelProduct3", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	
public Map saveDirectOrder2(Map dsRtsd0104Map, Map dsRtsd0106Map, Map dsRtsd0013Map, Map dsRtsd0041Map, Map inVar) throws NtRmsDaoException, Exception {
		
		int success1 = 0;	//inDsMapRtsd0100       
		int success2 = 0;   //inDsMapRtsd0104        
		int success3 = 0;   //inDsMapRtsd0106
		int success4 = 0;   //inDsMapRtsd0013          
		int success6 = 0;	//inDsMapRtsd0041
				
		Map map  = null;	//return map
		
		Map map1 = null; 	//inDsMapRtsd0100
		Map map2 = null;	//inDsMapRtsd0104
		Map map3 = null;	//inDsMapRtsd0106
		Map map4 = null;	//inDsMapRtsd0013
		Map map6 = new HashMap();
		Map map7 = null;	//inDsMapRtsd0041 
		
		String ordNo  = "";
		
		// TODO Auto-generated method stub
		SqlMapClientTemplate sqlTemplate 	= getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 	= sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	//Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				//여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						//autoCommit의 설정 Commit
		
		try {
			sqlMapClient.startBatch();

			DataSetMap inDsMapRtsd0104	= (DataSetMap)dsRtsd0104Map.get("dsRtsd0104Map");
			DataSetMap inDsMapRtsd0106	= (DataSetMap)dsRtsd0106Map.get("dsRtsd0106Map");
			DataSetMap inDsMapRtsd0013 	= (DataSetMap)dsRtsd0013Map.get("dsRtsd0013Map" );
			DataSetMap inDsMapRtsd0041 	= (DataSetMap)dsRtsd0041Map.get("dsRtsd0041Map");
			
			//RTSD0104 TABLE 계약정보 
				
				map2 = inDsMapRtsd0104.get(0);
				int rowType2 = ((Integer) map2.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
		
				System.out.println("2--------------------------------> "+rowType2);
				if( rowType2 != DataSet.ROW_TYPE_NORMAL ){
					if(rowType2 == DataSet.ROW_TYPE_INSERTED) {
						if(!map2.containsKey("dvsn")) map2.put("dvsn", "I");
					} else if(rowType2 == DataSet.ROW_TYPE_UPDATED) {
						if(!map2.containsKey("dvsn")) map2.put("dvsn", "U");
					} else if(rowType2 == DataSet.ROW_TYPE_DELETED) {
						if(!map2.containsKey("dvsn")) map2.put("dvsn", "D");
					}
					
					map2.put("regId", inVar.get("regId"));
					sqlMapClient.queryForObject((String)dsRtsd0104Map.get("sqlnamespace"), map2);
					success1 = Integer.parseInt((map2.get("successCode") + ""));
					System.out.println(map2.get("ordNo"));
				}
				
				map = map2;
				
				// RTSD0106 TABLE 제품정보
				if( success1 == 0  ){
					int j = 1;
					System.out.println("inDsMapRtsd0106.size()  : " +  inDsMapRtsd0106.size());
					
					for( int i = 0 ; i < inDsMapRtsd0106.size() ; i++ ) {
						map3 = inDsMapRtsd0106.get(i);
						
						map3.put("regId", inVar.get("regId"));
						int rowType3 = ((Integer) map3.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
						
						if(map2.size() > 0 && rowType3 != DataSet.ROW_TYPE_NORMAL ){													
							map3.put("seq", j);	

							if(j == 1){ // 첫번째 무조건 실행
								System.out.println("---------------------------------------"+map2.get("dvsn"));
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
									System.out.println("===============================================");
									System.out.println("success6 : " + success6);
									System.out.println("custNo   : " + map6.get("custNo"));
									System.out.println("carNo    : " + map6.get("carNo"));
									System.out.println("matCd    : " + map6.get("matCd"));
									System.out.println("chanCd   : " + map6.get("chanCd"));
									System.out.println("===============================================");
								}	
								
								map3.put("ordNo", (String) map2.get("ordNo"));	
								System.out.println("success6666666:"+(String) map2.get("ordNo"));
								sqlMapClient.queryForObject((String)dsRtsd0106Map.get("sqlnamespaceDel"), map3);
								System.out.println("1-1---------------------------------------------");
								/*sqlMapClient.queryForObject((String)dsRtsd0106Map.get("sqlnamespaceSaleDel"), map3);*/
								System.out.println("1-2---------------------------------------------");	
							}	
							if(rowType3 == DataSet.ROW_TYPE_INSERTED) {	
								map3.put("dvsn", "I");
								map3.put("ordNo", (String) map2.get("ordNo"));
								if(success6 == 0){
									System.out.println("2-1--------------------------------------------");
									sqlMapClient.queryForObject((String)dsRtsd0106Map.get("sqlnamespace"), map3);
									System.out.println("2-2--------------------------------------------");
									success3 = Integer.parseInt((map3.get("successCode") + ""));
		
									System.out.println("2-2-------------------------------------------- " + success3);									
								}
							}else{
								map3.put("successCode", "0");
							}
							if(success3 < 0){
								map = map3;
								break;
							}
							j++;
						}else{
							map = map3;
						}
					}
					
					
					// RTSD0013 TABLE 프리미엄서비스
					if( success1 == 0 && success2 == 0 && success3 == 0 && success6 == 0){
					
						for( int i = 0 ; i < inDsMapRtsd0013.size() ; i++ ) {
							map4 = inDsMapRtsd0013.get(i);
							int rowType4 = ((Integer) map4.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
							if( rowType4 != DataSet.ROW_TYPE_NORMAL ){
								map4.put("regId", inVar.get("regId"));
								map4.put("ordNo", (String) map2.get("ordNo"));
								if( i == 0){
									System.out.println(i + "전체삭제" + map4.get("prsNm"));
									sqlMapClient.queryForObject((String)dsRtsd0013Map.get("sqlnamespaceDel"), map4);
								}
								
								if(rowType4 == DataSet.ROW_TYPE_INSERTED) {
									if(!map4.containsKey("dvsn")) map4.put("dvsn", "I");
									System.out.println(i + "저장" + map4.get("prsNm"));
									sqlMapClient.queryForObject((String)dsRtsd0013Map.get("sqlnamespace"), map4);
								}else{
									map4.put("successCode", "0"); 
								} 				
								
								System.out.println(i + "map4.get(successCode) : " + map4.get("successCode"));
								success4 = Integer.parseInt((map4.get("successCode") + ""));
								
								map = map4;
								if(success4 < 0){
									map = map4;
									break;
								}
							}else{
								map = map4;
							}
						}
						// RTSD0041 TABLE 부가서비스
						if( success1 == 0 && success2 == 0 && success3 == 0 && success6 == 0 && success4 == 0){
							int k = 1; // SEQ 순번
							int periodCd = Integer.parseInt(inVar.get("periodCd")==null?"0":inVar.get("periodCd").toString());
							int monAmt = 0;
									
							for( int i = 0 ; i < inDsMapRtsd0041.size(); i++ ) {
								
								map6 = inDsMapRtsd0041.get(i);
								int rowType6 = ((Integer) map6.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
								
								if( rowType6 != DataSet.ROW_TYPE_NORMAL ){
									map6.put("regId", inVar.get("regId"));
									map6.put("ordNo", (String) map2.get("ordNo"));
									System.out.println("ordNo : " + (String) map2.get("ordNo"));
									if(i == 0){
										System.out.println(i + "전체삭제");
										sqlMapClient.queryForObject((String)dsRtsd0041Map.get("sqlnamespaceDel"), map6);
									}

									if(rowType6 == DataSet.ROW_TYPE_INSERTED) {
										if(!map6.containsKey("dvsn")) map6.put("dvsn", "I");
										
										// 월렌탈료 계산
										if(map6.get("dcYn").equals("Y")){
											monAmt = Integer.parseInt(map6.get("actAmt").toString())/periodCd; 
											map6.put("monAmt", monAmt);
										}else{
											map6.put("monAmt", 0);
										}

										map6.put("seq", k);
										sqlMapClient.queryForObject((String)dsRtsd0041Map.get("sqlnamespace"), map6);
									}else{
										System.out.println(i + "삭제" );
										map6.put("successCode", "0");
									}
				
									success6 = Integer.parseInt((map6.get("successCode") + ""));
									map = map6;
									if(success6 < 0){
										map = map6;
										break;
									}
									k++;
								}else{
									map = map6;
								}
							}
							
						}	// RTSD0041 TABLE 부가서비스 end
						
					}	// RTSD0013 TABLE 프리미엄서비스 end
					
				} // RTSD0106 TABLE 계약상품정보 end 

				// RTSD0106 TABLE 계약상품정보

			if( success1 == 0 && success2 == 0 && success3 == 0 && success6 == 0 && success4 == 0 ){
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
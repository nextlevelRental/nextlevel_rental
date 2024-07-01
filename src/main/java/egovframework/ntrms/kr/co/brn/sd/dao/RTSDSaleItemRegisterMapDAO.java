/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTSDSaleItemRegisterMapDAO.java
 * 3.Developer			: ura04
 * 4.Development Date	: 2018.10.17
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History		 
*************************************************************************************/

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

@Repository("rTSDSaleItemRegisterMapDAO")

public class RTSDSaleItemRegisterMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	
	public List<Map> saleItemList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("saleItem.saleItemList", map);
		List li = (List)map.get("vcursor");
		return li;
	}

	public List<Map> saleTirePatternList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("saleItem.saleTirePatternList", map);
		List li = (List)map.get("vcursor");
		return li;
	}

	public List<Map> saleSaleProdList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("saleItem.salePrdtInfoList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public  List<Map> salePrimServiceList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("saleItem.salePrimServiceList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> saleRegAmtList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("saleItem.saleRegAmtList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> saleExemptionList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("saleItem.saleExemptionList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> saleRegAmtInfo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("saleItem.saleRegAmtInfo", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> saleSrvDtlList(Map map) throws NtRmsDaoException {
//		getSqlMapClientTemplate().queryForObject("saleItem.saleSrvDtlList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> saleSrvSetList(Map map) throws NtRmsDaoException {
//		getSqlMapClientTemplate().queryForObject("saleItem.saleSrvSetList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> saleSrvSetDtlList(Map map) throws NtRmsDaoException {
//		getSqlMapClientTemplate().queryForObject("saleItem.saleSrvSetDtlList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveSaleItemInfo(Map dsSaleItemListMap, Map dsTirePattenListMap, Map dsSaleProdListMap, Map dsSaleSeviceListMap, Map dsRegAmtMgntMap, Map dsExemptionMap, Map dsChnDtlMap, Map inVar) throws NtRmsDaoException, Exception {
		int success1 		= 0;	//dsSaleItemListMap
		int success2 		= 0;   	//dsTirePattenListMap
		int success3 		= 0;   	//dsSaleProdListMap
		int success4 		= 0;   	//dsSaleSeviceListMap
		int success5		= 0; 	//dsRegAmtMgntMap
		int success6		= 0; 	//dsExemptionMap
		int success7		= 0;	//dsChnDtlMap
		int success8		= 0;	//dsChnDtlMap, delete
		
		Map map				= null;	//return map
		
		Map delMap  		= null;
		Map delSaleProdMap  = null;
		Map delPrimSvcMap  	= null;
		Map map1    		= null; //dsSaleItemListMap
		Map map2    		= null;	//dsTirePattenListMap
		Map map3    		= null;	//dsSaleProdListMap
		Map map4    		= null;	//dsSaleSeviceListMap
		Map map5    		= null;	//dsRegAmtMgntMap
		Map map6			= null; //dsExemptionMap
		Map map7			= null; //dsChnDtlMap
		Map map8			= null; //dsSaleServiceDtlMap
		
		
		// TODO Auto-generated method stub
		SqlMapClientTemplate sqlTemplate 	= getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 	= sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	//Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				//여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						//autoCommit의 설정 Commit
		try {
			sqlMapClient.startBatch();
			
			DataSetMap inDsRtre0001Map 		= (DataSetMap)dsSaleItemListMap.get("dsSaleItemListMap");
			DataSetMap inDsRtre0002Map 		= (DataSetMap)dsTirePattenListMap.get("dsTirePattenListMap");
			DataSetMap inDsRtre0003Map 		= (DataSetMap)dsSaleProdListMap.get("dsSaleProdListMap");
			DataSetMap inDsRtre0004Map 		= (DataSetMap)dsSaleSeviceListMap.get("dsSaleSeviceListMap");
			DataSetMap inDsRtre0005Map 		= (DataSetMap)dsRegAmtMgntMap.get("dsRegAmtMgntMap");
			DataSetMap inDsRtre0006Map		= (DataSetMap)dsExemptionMap.get("dsExemptionMap");
			DataSetMap inDsRtre0007Map		= (DataSetMap)dsChnDtlMap.get("dsChnDtlMap");
			
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
						sqlMapClient.queryForObject((String)dsSaleItemListMap.get("sqlnamespace"), map1);
						success1 = Integer.parseInt((map1.get("successCode") + ""));
						map = map1;
						if(success1 < 0){
							break;
						}
					}
				}
			}
			
			if( success1 == 0 && inDsRtre0002Map.size() != 0 ){
				/*delMap = inDsRtre0002Map.get(0);
				getSqlMapClientTemplate().queryForObject("saleItem.deleteSalePrdtInfo", delMap);*/
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
						sqlMapClient.queryForObject((String)dsTirePattenListMap.get("sqlnamespace"), map2);
						success2 = Integer.parseInt((map2.get("successCode") + ""));
						map = map2;
						if(success2 < 0){
							break;
						}
					}
				}
			}
			
			if( success1 == 0 &&  success2 == 0 && inDsRtre0003Map.size() != 0 ){
				/*delSaleProdMap = inDsRtre0003Map.get(0);
				getSqlMapClientTemplate().queryForObject("saleItem.deleteSalePrdtInfo", delSaleProdMap);*/
				for( int i = 0 ; i < inDsRtre0003Map.size() ; i++ ) {
					map3 = inDsRtre0003Map.get(i);
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
						sqlMapClient.queryForObject((String)dsSaleProdListMap.get("sqlnamespace"), map3);
						success3 = Integer.parseInt((map3.get("successCode") + ""));
						map = map3;
						if(success3 < 0){
							break;
						}
					}
				}
			}
			
			if( success1 == 0 && success2 == 0 && success3 == 0 && inDsRtre0004Map.size() != 0 ){
				/*delPrimSvcMap = inDsRtre0004Map.get(0);
				getSqlMapClientTemplate().queryForObject("saleItem.deletePrimSvc", delPrimSvcMap);*/
				for( int i = 0 ; i < inDsRtre0004Map.size() ; i++ ) {
					map4 = inDsRtre0004Map.get(i);
					int rowType4 = ((Integer) map4.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					if( rowType4 != DataSet.ROW_TYPE_NORMAL ){
						
						if( i == 0){
							System.out.println(i + "전체삭제" + map4.get("prsNm"));
							sqlMapClient.queryForObject((String)dsSaleSeviceListMap.get("sqlnamespaceDel"), map4);
						}
						if(rowType4 == DataSet.ROW_TYPE_INSERTED) {
							if(!map4.containsKey("dvsn")) map4.put("dvsn", "I");
							System.out.println(i + "저장" + map4.get("prsNm"));
							map4.put("regId", inVar.get("regId"));
							sqlMapClient.queryForObject((String)dsSaleSeviceListMap.get("sqlnamespace"), map4);

						} else{
							map4.put("successCode", "0"); 
						}
						//System.out.println("successCode : " + map4.get("successCode").toString());
						System.out.println(i + "map4.get(successCode) : " + map4.get("successCode"));
						success4 = Integer.parseInt((map4.get("successCode") + ""));
						map = map4;
						if(success4 < 0){
							break;
						}
					}
				}
			}
			
			if( success1 == 0 && success2 == 0 && success3 == 0 && success4 == 0 && inDsRtre0005Map.size() != 0 ){
				for( int i = 0 ; i < inDsRtre0005Map.size() ; i++ ) {
					map5 = inDsRtre0005Map.get(i);
					int rowType5 = ((Integer) map5.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					if( rowType5 != DataSet.ROW_TYPE_NORMAL ){
						if(rowType5 == DataSet.ROW_TYPE_INSERTED) {
							if(!map5.containsKey("dvsn")) map5.put("dvsn", "I");
						} else if(rowType5 == DataSet.ROW_TYPE_UPDATED) {
							if(!map5.containsKey("dvsn")) map5.put("dvsn", "U");
						} else if(rowType5 == DataSet.ROW_TYPE_DELETED) {
							if(!map5.containsKey("dvsn")) map5.put("dvsn", "D");
						}
						map5.put("regId", inVar.get("regId"));
						sqlMapClient.queryForObject((String)dsRegAmtMgntMap.get("sqlnamespace"), map5);
						success5 = Integer.parseInt((map5.get("successCode") + ""));
						map = map5;
						if(success5 < 0){
							break;
						}
					}
				}
			}
			
			if( success1 == 0 && success2 == 0 && success3 == 0 && success4 == 0 && success5 == 0 && inDsRtre0006Map.size() != 0 ){
				for( int i = 0 ; i < inDsRtre0006Map.size() ; i++ ) {
					map6 = inDsRtre0006Map.get(i);
					int rowType6 = ((Integer) map6.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					if ( i == 0) {
						sqlMapClient.queryForObject((String)dsExemptionMap.get("sqlnamespaceDel"), map6);
					}
					String valChk = "";
					if( rowType6 != DataSet.ROW_TYPE_NORMAL ){
						System.out.println("rowType6:"+rowType6);
						System.out.println("DataSet.ROW_TYPE_INSERTED:"+DataSet.ROW_TYPE_INSERTED);
						
						if(rowType6 == DataSet.ROW_TYPE_INSERTED) {
							if(!map6.containsKey("dvsn")) map6.put("dvsn", "I");
							valChk = "Y";
						} else {
							valChk = "N";
							map6.put("successCode", "0");
						} 
						map6.put("regId", inVar.get("regId"));
						System.out.println("valChk:"+valChk);
						if(valChk != null && valChk.equals("Y")) {
							sqlMapClient.queryForObject((String)dsExemptionMap.get("sqlnamespace"), map6);
						}
						success6 = Integer.parseInt((map6.get("successCode") + ""));
						map = map6;
						if(success6 < 0){
							break;
						}
					} else{
						map = map6;
					}
				}
			}

			
			
			if( success1 == 0 && success2 == 0 && success3 == 0 && success4 == 0 && success5 == 0  && success6 == 0 && inDsRtre0007Map.size() != 0 ){
				for( int i = 0 ; i < inDsRtre0007Map.size() ; i++ ) {
					map7 = inDsRtre0007Map.get(i);

					if( i == 0){
						sqlMapClient.queryForObject((String)dsChnDtlMap.get("sqlnamespaceDel"), map7);
					}					
					
					map7.put("regId", inVar.get("regId"));
					sqlMapClient.queryForObject((String)dsChnDtlMap.get("sqlnamespace"), map7);
					success7 = Integer.parseInt((map7.get("successCode") + ""));
					map = map7;
					if(success7 < 0){
						break;
					}
				}				
			}
			

			if( success1 == 0 && success2 == 0 && success3 == 0 && success4 == 0 && success5 == 0 && success6 == 0 && success7 == 0 && success8 == 0) {
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
	
	public String maxSaleCd(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("saleItem.maxSaleCd", map);
		return (String)map.get("result");
	}

	//패턴제외상품
	public Map saveTireDetail(Map dssaveTireDetailMap, Map inVar) throws NtRmsDaoException, Exception {
			
		int success1 		= 0;	//dsSaleItemListMap       
		Map map     		= null;	//return map
		
		Map delMap  		= null;
		Map delSaleProdMap  = null;
		Map delPrimSvcMap  	= null;
		Map map1    		= null; //dssaveTireDetailMap
			
		// TODO Auto-generated method stub
		SqlMapClientTemplate sqlTemplate 	= getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 	= sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	//Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				//여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						//autoCommit의 설정 Commit
		try {
			sqlMapClient.startBatch();
			
			DataSetMap inDsRtre0001Map 		= (DataSetMap)dssaveTireDetailMap.get("dssaveTireDetailMap");
			System.out.println(inDsRtre0001Map);
			
			if( inDsRtre0001Map.size() != 0 ){
				for( int i = 0 ; i < inDsRtre0001Map.size() ; i++ ) {
					map1 = inDsRtre0001Map.get(i);
					int rowType1 = ((Integer) map1.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					if( rowType1 != DataSet.ROW_TYPE_NORMAL ){
						
						if( i == 0){
							System.out.println(i + "전체삭제" + map1.get("prsNm"));
							sqlMapClient.queryForObject((String)dssaveTireDetailMap.get("sqlnamespaceDel"), map1);
						}
						if(rowType1 == DataSet.ROW_TYPE_INSERTED) {
							if(!map1.containsKey("dvsn")) map1.put("dvsn", "I");
							System.out.println(i + "저장" + map1.get("prsNm"));
							map1.put("regId", inVar.get("regId"));
							sqlMapClient.queryForObject((String)dssaveTireDetailMap.get("sqlnamespace"), map1);
						} else{
							map1.put("successCode", "0"); 
						}
						success1 = Integer.parseInt((map1.get("successCode") + ""));
						map = map1;
						if(success1 < 0){
							break;
						}
					}
				}
			}
			if( success1 == 0) {
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
		

	/*public Map saveTireDetail2(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	public List<Map> saveTireDetail3(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("saleItem.saveTireDetail3", map);
		List li = (List)map.get("vcursor");
		return li;
		}*/

	//[추가] 채널목록 조회
	public List<Map> saleChnList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("saleItem.saleChannelTree", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	//기존 채널 조회
	public List<Map> saleExistingChnList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("saleItem.saleExistingChannelTree", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	//[추가] 이벤트
	public List<Map> saleChnDtl(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("saleItem.saleChannelDtl", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	//기존제외 조회
	public List<Map> exclusiveList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("saleItem.exclusiveList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	//필터조회
	public List<Map> saleChannelFilter(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("saleItem.saleChannelFilter", map);
		List li = (List)map.get("vcursor");
		return li;
	}

}
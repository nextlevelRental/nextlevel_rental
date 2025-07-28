package egovframework.ntrms.kr.co.exec.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.comm.util.RentalToOmsDataUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

public abstract class RtcmAbstractDAO extends EgovAbstractDAO {
Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	


	@Resource(name="sqlMapClient")
	public void initDAO(SqlMapClient sqlMapClient) throws NtRmsDaoException{
		setSqlMapClient(sqlMapClient);
	}
	
	@SuppressWarnings("deprecation")
	public SqlMapClientTemplate getSqlMapClientTemplateDAO() throws NtRmsDaoException{
		return this.getSqlMapClientTemplate();
	}
	
	//단일 DataSet 처리
	public Map _executeDsMap(Map inVar) throws NtRmsDaoException, Exception {
		Map map = null;
		Map map2 = null;
		// TODO Auto-generated method stub
		SqlMapClientTemplate sqlTemplate 	= getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 	= sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	//Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				//여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						//autoCommit의 설정 Commit
		int success = 0;
		int success1 = 0;
		int success2 = 0;
		
		Object rtnCode = null;
		Object rtnMsg = null;
		try {
			sqlMapClient.startBatch();
			
			DataSetMap inDsMap = (DataSetMap)inVar.get("inDsMap");
			DataSetMap inDsMap1 = (DataSetMap)inVar.get("inDsMap1");
			for(int i = 0; i<inDsMap.size(); i++) {
				map = inDsMap.get(i);
				int rowType = ((Integer) map.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
				if(rowType == DataSet.ROW_TYPE_INSERTED) {
					if(!map.containsKey("dvsn")) map.put("dvsn", "I");
				} else if(rowType == DataSet.ROW_TYPE_UPDATED) {
					if(!map.containsKey("dvsn")) map.put("dvsn", "U");
				} else if(rowType == DataSet.ROW_TYPE_DELETED) {
					if(!map.containsKey("dvsn")) map.put("dvsn", "D");
				}
				map.put("regId", inVar.get("regId"));
				try{
					sqlMapClient.queryForObject((String)inVar.get("sqlnamespace"), map);
					success = Integer.parseInt((map.get("successCode") + ""));
					
					//OMS연계
					if(success == 0){
						rowType = ((Integer) inDsMap1.get(0).get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
						//거점인 경우만 연계 (데이터 수정인 경우는 인터페이스 안함)
						if(inDsMap1.get(0).get("o2oYn").equals("Y") && rowType == DataSet.ROW_TYPE_INSERTED){
						
							RentalToOmsDataUtil rentalToOms = null;
							Map map1 = null;
							try{
								rentalToOms = new RentalToOmsDataUtil();
								//순번저장(서비스의 경우)
								if(map.containsKey("dlvrSeq")){
									inDsMap1.get(0).put("rentIfReqSn", map.get("dlvrSeq").toString());
								}
								inDsMap1.get(0).put("server_key", inVar.get("server_key"));
								map1 = rentalToOms.rentalToOmsData(inVar.get("host").toString(), inDsMap1.get(0));
								
								
								//결과값 세팅
								rtnCode = (map1.get("rtnCode") == null || map1.get("rtnCode") == "" ? "0" : map1.get("rtnCode").toString());
								rtnMsg = (map1.get("rtnMsg") == null || map1.get("rtnMsg") == "" ? "결과값이 존재하지 않습니다." : map1.get("rtnMsg").toString());
								
								inDsMap1.get(0).put("rtnCode", rtnCode);
								inDsMap1.get(0).put("rtnMsg", rtnMsg);
								map.put("rtsd0213", inDsMap1.get(0));
								success1 = Integer.parseInt(rtnCode.toString());
								if(success1 == 0){
									map.put("omsOrdNo", map1.get("ordNo"));
									map.put("ordNo", inDsMap1.get(0).get("rentIfCntrNo"));
									map.put("tmsOrderId", map1.get("orderId"));
									map.put("instTm", null);
									map.put("procDay", null);
									map.put("omsOrderNo", map1.get("ordNo"));
									map.put("paramStr", map1.get("paramStr"));
									map.put("returnStr", map1.get("returnStr"));

									sqlMapClient.queryForObject("rTCSZeroRep.p_UpdateRtcs0010TmsOrderId", map);
									success2 = Integer.parseInt((map.get("successCode") + ""));
									
								}else{
									map.put("successCode",  rtnCode);
									map.put("returnMessage", rtnMsg);
								}
							}catch(Exception e){
								success1 = -1;
								map.put("successCode", -1);
								map.put("returnMessage", "[OMS]시스템관리자에게 문의바랍니다!.\n"+e+"");
							}
							
//							//연계 이력 저장
//							Map<String, Object> parameterMap = new HashMap();
//							Map<String, Object> paramMap = inDsSendOmsMap.get(0);
//							parameterMap.put("dvsn", "I");
//							parameterMap.put("col01", paramMap.get("rentIfCntrNo"));
//							parameterMap.put("col02", paramMap.get("ordDe"));
//							parameterMap.put("col03", paramMap.get("saleTyCd"));
//							parameterMap.put("col04", paramMap.get("rentIfReqSn"));
//							parameterMap.put("col05", paramMap.get("rentIfBfistSeCd"));
//							parameterMap.put("col06", paramMap.get("custNm"));
//							parameterMap.put("col07", paramMap.get("carNo"));
//							parameterMap.put("col08", paramMap.get("iplMobNo"));
//							parameterMap.put("col09", paramMap.get("iplTelNo"));
//							parameterMap.put("col10", paramMap.get("istBpCd"));
//							parameterMap.put("col11", paramMap.get("itemCd"));
//							parameterMap.put("col12", paramMap.get("ordQy"));
//							parameterMap.put("col13", paramMap.get("dlvTyDtlCd"));
//							parameterMap.put("col14", paramMap.get("istReqDe"));
//							parameterMap.put("col15", paramMap.get("pickupZip"));
//							parameterMap.put("col16", paramMap.get("pickupBassAddr"));
//							parameterMap.put("col17", paramMap.get("pickupDtlAddr"));
//							parameterMap.put("col18", paramMap.get("iplZip"));
//							parameterMap.put("col19", paramMap.get("iplAddr"));
//							parameterMap.put("col20", paramMap.get("iplDtlAddr"));
//							parameterMap.put("col21", paramMap.get("regUsrId"));
//							parameterMap.put("col22", paramMap.get("ordRsn"));
//							parameterMap.put("col23", paramMap.get("opertSts"));
//							parameterMap.put("col24", paramMap.get("opertDe"));
//							parameterMap.put("col25", paramMap.get("drgMil"));
//							parameterMap.put("col26", map1.get("rtnCode"));
//							parameterMap.put("col27", map1.get("rtnMsg"));
//							parameterMap.put("col28", map1.get("ordNo"));
//							parameterMap.put("col29", "");
//							parameterMap.put("col30", "");
//							
//							try{
//								sqlMapClient.queryForObject("comm.insertOmsIFLog", parameterMap);
//							}catch(Exception e){
//								e.printStackTrace();
//							}
						}
					}
				}catch(Exception e){
					success = -1;
					map.put("successCode", -1);
					map.put("returnMessage", "시스템관리자에게 문의바랍니다!.\n"+e+"");
				}
				
				if(success < 0) {
					inDsMap1.get(0).put("rtnCode", -1);
					inDsMap1.get(0).put("rtnMsg", map.get("returnMessage"));
					map.put("rtsd0213", inDsMap1.get(0));
					break;
				}else if(success1 < 0){
					break;
				}
				
			}
						
			if(success == 0 && success1 == 0 && success2 == 0) {
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
				int rowType = ((Integer) map.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
				if(rowType == DataSet.ROW_TYPE_INSERTED) {
					if(!map.containsKey("dvsn")) map.put("dvsn", "I");
				} else if(rowType == DataSet.ROW_TYPE_UPDATED) {
					if(!map.containsKey("dvsn")) map.put("dvsn", "U");
				} else if(rowType == DataSet.ROW_TYPE_DELETED) {
					if(!map.containsKey("dvsn")) map.put("dvsn", "D");
				}
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
	
	//다중 DataSet처리
	public Map executeDsMap(Map inVar, List list) throws NtRmsDaoException, Exception {
		
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

			for(int i = 0; i<list.size(); i++) {
				Map dsMap = (Map)list.get(i);
				DataSetMap inDsMap 	= (DataSetMap)dsMap.get("inDsMap");
				String sqlMapName 	= (String)dsMap.get("sqlnamespace");
				for(int j = 0; j<inDsMap.size(); j++) {
					map = inDsMap.get(j);
					int rowType = ((Integer) map.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					if(rowType == DataSet.ROW_TYPE_INSERTED) {
						if(!map.containsKey("dvsn")) map.put("dvsn", "I");
					} else if(rowType == DataSet.ROW_TYPE_UPDATED) {
						if(!map.containsKey("dvsn")) map.put("dvsn", "U");
					} else if(rowType == DataSet.ROW_TYPE_DELETED) {
						if(!map.containsKey("dvsn")) map.put("dvsn", "D");
					}
					map.put("regId", (String)inVar.get("regId"));
					try{
						sqlMapClient.queryForObject(sqlMapName, map);
						success = Integer.parseInt((map.get("successCode") + ""));
					}catch(Exception e){
						success = -1;
						map.put("successCode", -1);
						map.put("returnMessage", "시스템관리자에게 문의바랍니다!.\n"+e);
					}
					if(success < 0) {
						break;
					}
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
		
		}catch (SQLException e) {
			e.printStackTrace();

		} finally {
			try {
				sqlMapClient.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return map;
	}

}

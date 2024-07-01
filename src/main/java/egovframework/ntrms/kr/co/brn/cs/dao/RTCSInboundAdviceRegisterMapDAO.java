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

package egovframework.ntrms.kr.co.brn.cs.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cs.dao.EAI.SMSControl;
import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rTCSInboundAdviceRegisterMapDAO")

public class RTCSInboundAdviceRegisterMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	//EAI SystemID 설정(SMS공통)
	//private static String 	SYSTEMID = "LIVE";
	//EAI InterfaceID 설정(SMS공통)
	//private static String 	INTERFACEID = "NTRMS/NTRMS_101";
	
	
	public List<Map> sRtcs0103Region(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("inboundAdviceRegister.sRtcs0103Region", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> sRtcs0103City(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("inboundAdviceRegister.sRtcs0103City", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> sRtcs0102Ctf(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("inboundAdviceRegister.sRtcs0102Ctf", map);
		List li = (List)map.get("vcursor");
		return li;
	}

	
	public List<Map> sRtcs0102Obf(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("inboundAdviceRegister.sRtcs0102Obf", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> sRtcs0102Ibf(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException, Exception {
		getSqlMapClientTemplate().queryForObject("inboundAdviceRegister.sRtcs0102Ibf", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveRTCSInboundAdviceRegister(Map inVar) throws NtRmsDaoException, Exception {
		Map map1 = null;
		int success1 = 0;
		int success2 = 0;
		
		// TODO Auto-generated method stub
		SqlMapClientTemplate sqlTemplate 	= getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 	= sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	//Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				//여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						//autoCommit의 설정 Commit
		
		try {
			sqlMapClient.startBatch();

			DataSetMap inDsbankAndCard	= (DataSetMap)inVar.get("inDsMap");
			map1 = inDsbankAndCard.get(0);
			int rowType = ((Integer) map1.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
			if( rowType != DataSet.ROW_TYPE_NORMAL ){
				if(rowType == DataSet.ROW_TYPE_INSERTED) {
					if(!map1.containsKey("dvsn")) map1.put("dvsn", "I");
				} else if(rowType == DataSet.ROW_TYPE_UPDATED) {
					if(!map1.containsKey("dvsn")) map1.put("dvsn", "U");
				} else if(rowType == DataSet.ROW_TYPE_DELETED) {
					if(!map1.containsKey("dvsn")) map1.put("dvsn", "D");
				}
				map1.put("regId", inVar.get("regId"));
				sqlMapClient.queryForObject((String)inVar.get("sqlnamespace"), map1);
				success1 = Integer.parseInt((map1.get("successCode") + ""));
			}
			
			//저장 후 EAI 통신을 한다.
			if( success1 == 0 ) {
				sqlMapClient.getCurrentConnection().commit();
				sqlMapClient.executeBatch();
				sqlMapClient.commitTransaction();
			} else {
				sqlMapClient.getCurrentConnection().rollback();
				sqlMapClient.executeBatch();
				sqlMapClient.commitTransaction();
			}
			
			Map resultEAImap = null;
			String oFlag  	= "";
			String oMesg	= "";
			String oClaimNo	= "";
 			if( success1 == 0 ){
				if( map1.get("callNo") 		!= null && map1.get("ordNo") 	!= null && map1.get("custNm") 	!= null &&
					//map1.get("callDtl1") 	!= null && map1.get("callDtl2")	!= null && map1.get("callDtl3") != null &&
					map1.get("carNo") 		!= null && map1.get("recvDay") 	!= null && map1.get("recvTm") 	!= null &&
					map1.get("smsTx") 		!= null && map1.get("regionNo") != null && map1.get("cityNo") 	!= null &&
					map1.get("regId") 		!= null && map1.get("telNo") 	!= null && map1.get("recvTp").equals("I1") &&
					map1.get("chanCd")      != null
				){
					String telNo = (String)map1.get("telNo");
					
					if(telNo.length() == 10){
						map1.put("callDtl1", telNo.substring(0,3));
						map1.put("callDtl2", telNo.substring(3,6));
						map1.put("callDtl3", telNo.substring(6,10));				
					}else{
						map1.put("callDtl1", telNo.substring(0,3));
						map1.put("callDtl2", telNo.substring(3,7));
						map1.put("callDtl3", telNo.substring(7,11));
					}
					
					SMSControl sMSControl = new SMSControl();
					resultEAImap = sMSControl.sendEAI(map1);
				
					if( resultEAImap != null ){
						oFlag = (String)resultEAImap.get("oFlag");
						oMesg = (String)resultEAImap.get("oMesg");
						oClaimNo = (String)resultEAImap.get("oClaimNo");
						if( oFlag.equals("S") ){
							map1.remove("dvsn");
							map1.put("dvsn", "U");
							map1.put("claimNo", oClaimNo);
							sqlMapClient.queryForObject("inboundAdviceRegister.saveRTCSInboundAdviceRegister", map1);
							success2 = Integer.parseInt((map1.get("successCode") + ""));
						}else{
							success2 = -1;
							map1.remove("successCode");
							map1.remove("returnMessage");
							map1.put("successCode", "-1");
							map1.put("returnMessage", "QMS 연동실패로 상담내역이 전송되지 않았습니다.\n("+resultEAImap.get("oMesg")+")");
							logger.debug("QMS통신 실패:::::::::::::::::::::::::::::::::");
							logger.debug("EAI FAIL oFlag 	: " + oFlag);
							logger.debug("EAI FAIL oMesg 	: " + oMesg);
							logger.debug("EAI FAIL oClaimNo : " + oClaimNo);
							logger.debug("QMS통신 실패:::::::::::::::::::::::::::::::::");
						}
					}else{
						success2 = -1;
						map1.remove("successCode");
						map1.remove("returnMessage");
						map1.put("successCode", "-1");
						map1.put("returnMessage", "QMS 연동실패로 상담내역이 전송되지 않았습니다.\n("+resultEAImap.get("oMesg")+")");
						logger.debug("QMS통신 실패:::::::::::::::::::::::::::::::::");
						logger.debug("EAI FAIL oFlag 	: " + oFlag);
						logger.debug("EAI FAIL oMesg 	: " + oMesg);
						logger.debug("EAI FAIL oClaimNo : " + oClaimNo);
						logger.debug("QMS통신 실패:::::::::::::::::::::::::::::::::");
					}
				}
				if( success2 == 0 ) {
					sqlMapClient.getCurrentConnection().commit();
					sqlMapClient.executeBatch();
					sqlMapClient.commitTransaction();
				} else {
					sqlMapClient.getCurrentConnection().rollback();
					sqlMapClient.executeBatch();
					sqlMapClient.commitTransaction();
				}
			}
		}catch (Exception e) {
			map1.remove("successCode");
			map1.remove("returnMessage");
			map1.put("successCode", "-1");
			map1.put("returnMessage", "QMS 연동실패로 상담내역이 전송되지 않았습니다.");
			logger.debug("QMS통신 실패_RTCSInboundAdviceRegisterMapDAO.java:::::::::::::::::::::::::::::::::");
			logger.debug(e);
			logger.debug("QMS통신 실패_RTCSInboundAdviceRegisterMapDAO.java:::::::::::::::::::::::::::::::::");
			e.printStackTrace();
		} finally {
			try {
				sqlMapClient.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return map1;
	}

	public String selectSysdate(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("inboundAdviceRegister.selectSysdate", map);
		return (String)map.get("result");
	}
	
	public Map qusUpdateRTCSInboundAdviceRegister(Map inVar) throws NtRmsDaoException, Exception {
		Map map1 = null;
		int success1 = 0;
		
		// TODO Auto-generated method stub
		SqlMapClientTemplate sqlTemplate 	= getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 	= sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	//Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				//여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						//autoCommit의 설정 Commit
		
		try {
			sqlMapClient.startBatch();
			DataSetMap inDsMap	= (DataSetMap)inVar.get("inDsMap");
			map1 = inDsMap.get(0);
			Map resultEAImap = null;
			String oFlag  	= "";
			String oMesg	= "";
			String oClaimNo	= "";
			if( map1.get("callNo") 		!= null && map1.get("ordNo") 	!= null && map1.get("custNm") 	!= null &&
				map1.get("carNo") 		!= null && map1.get("recvDay") 	!= null && map1.get("recvTm") 	!= null &&
				map1.get("smsTx") 		!= null && map1.get("regionNo") != null && map1.get("cityNo") 	!= null &&
				map1.get("regId") 		!= null && map1.get("telNo") 	!= null && map1.get("recvTp").equals("I1") &&
				map1.get("chanCd") 		!= null 
			){
				String telNo = (String)map1.get("telNo");

				if(telNo.length() == 10){
					map1.put("callDtl1", telNo.substring(0,3));
					map1.put("callDtl2", telNo.substring(3,6));
					map1.put("callDtl3", telNo.substring(6,10));				
				}else{
					map1.put("callDtl1", telNo.substring(0,3));
					map1.put("callDtl2", telNo.substring(3,7));
					map1.put("callDtl3", telNo.substring(7,11));
				}
				
				SMSControl sMSControl = new SMSControl();
				resultEAImap = sMSControl.sendEAI(map1);
			
				if( resultEAImap != null ){
					oFlag = (String)resultEAImap.get("oFlag");
					oMesg = (String)resultEAImap.get("oMesg");
					oClaimNo = (String)resultEAImap.get("oClaimNo");
					if( oFlag.equals("S") ){
						map1.remove("dvsn");
						map1.put("dvsn", "U");
						map1.put("claimNo", oClaimNo);
						sqlMapClient.queryForObject("inboundAdviceRegister.saveRTCSInboundAdviceRegister", map1);
						success1 = Integer.parseInt((map1.get("successCode") + ""));
					}else{
						success1 = -1;
						map1.remove("successCode");
						map1.remove("returnMessage");
						map1.put("successCode", "-1");
						map1.put("returnMessage", "QMS 연동실패로 상담내역이 전송되지 않았습니다.\n("+resultEAImap.get("oMesg")+")");
						logger.debug("QMS통신 실패:::::::::::::::::::::::::::::::::");
						logger.debug("EAI FAIL oFlag 	: " + oFlag);
						logger.debug("EAI FAIL oMesg 	: " + oMesg);
						logger.debug("EAI FAIL oClaimNo : " + oClaimNo);
						logger.debug("QMS통신 실패:::::::::::::::::::::::::::::::::");
					}
				}else{
					success1 = -1;
					map1.remove("successCode");
					map1.remove("returnMessage");
					map1.put("successCode", "-1");
					map1.put("returnMessage", "QMS 연동실패로 상담내역이 전송되지 않았습니다.\n("+resultEAImap.get("oMesg")+")");
					logger.debug("QMS통신 실패:::::::::::::::::::::::::::::::::");
					logger.debug("EAI FAIL oFlag 	: " + oFlag);
					logger.debug("EAI FAIL oMesg 	: " + oMesg);
					logger.debug("EAI FAIL oClaimNo : " + oClaimNo);
					logger.debug("QMS통신 실패:::::::::::::::::::::::::::::::::");
				}
			}
			
			if( success1 == 0 ) {
				sqlMapClient.getCurrentConnection().commit();
				sqlMapClient.executeBatch();
				sqlMapClient.commitTransaction();
			} else {
				sqlMapClient.getCurrentConnection().rollback();
				sqlMapClient.executeBatch();
				sqlMapClient.commitTransaction();
			}
		}catch (Exception e) {
			map1.remove("successCode");
			map1.remove("returnMessage");
			map1.put("successCode", "-1");
			map1.put("returnMessage", "QMS 연동실패로 상담내역이 전송되지 않았습니다.");
			logger.debug("QMS통신 실패_RTCSInboundAdviceRegisterMapDAO.java:::::::::::::::::::::::::::::::::");
			logger.debug(e);
			logger.debug("QMS통신 실패_RTCSInboundAdviceRegisterMapDAO.java:::::::::::::::::::::::::::::::::");
			e.printStackTrace();
		} finally {
			try {
				sqlMapClient.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return map1;
	}
}
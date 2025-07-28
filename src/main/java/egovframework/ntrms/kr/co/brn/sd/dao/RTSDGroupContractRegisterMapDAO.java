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
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@SuppressWarnings("unchecked")
@Repository("rTSDGroupContractRegisterMapDAO")

public class RTSDGroupContractRegisterMapDAO extends EgovAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);

	/**
	 * 계약접수 정보를 저장한다
	 * @param bankAndCardMap
	 * @param dsRtsd0104Map
	 * @return Map
	 * @throws NtRmsDaoException, Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.1		2017-09-09	wjim		[20170906_01] SMS발송 기능 제외
	 * 									- DB Package(Pkg_Rtsd0104.p_IUDRtsd0104)로 기능 이관
	 */
	public Map saveGroupContractRegister(Map bankAndCardMap, Map dsRtsd0104Map, Map dsRtsd0106Map, Map dsRtsd0013Map, Map dsRtsd0014Map, Map dsRtsd0205Map, Map dsRtsd0041Map,  Map dsRtsd0401Map, Map inVar) throws NtRmsDaoException, Exception {
		
		int success1 = 0;	//inDsbankAndCard       
		int success2 = 0;   //inDsMapRtsd0104        
		int success3 = 0;   //inDsMapRtsd0106
		int success4 = 0;   //inDsMapRtsd0013          
		int success5 = 0;   //inDsMapRtsd0014
		int success6 = 0;
		int success7 = 0;   //inDsMapRtsd0041
		int success8 = 0;	//inDsMapRtsd0401
		
		Map map  = null;	//return map
		
		Map map1 = null; 	//inDsbankAndCard
		Map map2 = null;	//inDsMapRtsd0104
		Map map3 = null;	//inDsMapRtsd0106
		Map map4 = null;	//inDsMapRtsd0013
		Map map5 = null;	//inDsMapRtsd0014
		Map map6 = new HashMap();
		Map map7 = null;	//inDsMapRtsd0041 
		Map map8 = null;	//inDsMapRtsd0401
		
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
			DataSetMap inDsMapRtsd0104	= (DataSetMap)dsRtsd0104Map.get("dsRtsd0104Map");
			DataSetMap inDsMapRtsd0013 	= (DataSetMap)dsRtsd0013Map.get("dsRtsd0013Map");
			DataSetMap inDsMapRtsd0041 	= (DataSetMap)dsRtsd0041Map.get("dsRtsd0041Map");
			DataSetMap inDsMapRtsd0106	= (DataSetMap)dsRtsd0106Map.get("dsRtsd0106Map");
			DataSetMap inDsMapRtsd0401 	= (DataSetMap)dsRtsd0401Map.get("dsRtsd0401Map"); // [20181122_01]
			
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
			
			//RTSD0104 TABLE 계약정보 
			if( success1 == 0 ){
				map2 = inDsMapRtsd0104.get(0);
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
					if( !accSeq.equals("") ) map2.put("accSeq", accSeq);
					if( !crdSeq.equals("") ) map2.put("crdSeq", crdSeq);
					sqlMapClient.queryForObject((String)dsRtsd0104Map.get("sqlnamespace"), map2);
					success2 = Integer.parseInt((map2.get("successCode") + ""));
					
					if(success2 < 0){
						map = map2;
					}
					
				}
				
				// RTSD0106 TABLE 계약상품정보
				if( success1 == 0 && success2 == 0 ){
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
									System.out.println("===============================================");
									System.out.println("success6 : " + success6);
									System.out.println("custNo   : " + map6.get("custNo"));
									System.out.println("carNo    : " + map6.get("carNo"));
									System.out.println("matCd    : " + map6.get("matCd"));
									System.out.println("chanCd   : " + map6.get("chanCd"));
									System.out.println("===============================================");
								}	
								
								map3.put("ordNo", (String) map2.get("ordNo"));	

								sqlMapClient.queryForObject((String)dsRtsd0106Map.get("sqlnamespaceDel"), map3);
								//sqlMapClient.queryForObject((String)dsRtsd0106Map.get("sqlnamespaceSaleDel"), map3);								
							}	
							if(rowType3 == DataSet.ROW_TYPE_INSERTED) {	
								map3.put("dvsn", "I");
								map3.put("ordNo", (String) map2.get("ordNo"));
								if(success6 == 0){
									sqlMapClient.queryForObject((String)dsRtsd0106Map.get("sqlnamespace"), map3);
									success3 = Integer.parseInt((map3.get("successCode") + ""));								
									map = map3;
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
									sqlMapClient.queryForObject((String)dsRtsd0013Map.get("sqlnamespaceDel"), map4);
								}
								
								if(rowType4 == DataSet.ROW_TYPE_INSERTED) {
									if(!map4.containsKey("dvsn")) map4.put("dvsn", "I");
									sqlMapClient.queryForObject((String)dsRtsd0013Map.get("sqlnamespace"), map4);
								}else{
									map4.put("successCode", "0"); 
								} 				

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
								
								map7 = inDsMapRtsd0041.get(i);
								int rowType7 = ((Integer) map7.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
								
								if( rowType7 != DataSet.ROW_TYPE_NORMAL ){
									map7.put("regId", inVar.get("regId"));
									map7.put("ordNo", (String) map2.get("ordNo"));
	
									if(i == 0){
										sqlMapClient.queryForObject((String)dsRtsd0041Map.get("sqlnamespaceDel"), map7);
									}

									if(rowType7 == DataSet.ROW_TYPE_INSERTED) {
										if(!map7.containsKey("dvsn")) map7.put("dvsn", "I");
										
										// 월렌탈료 계산
										if(map7.get("dcYn").equals("Y")){
											monAmt = Integer.parseInt(map7.get("actAmt").toString())/periodCd; 
											map7.put("monAmt", monAmt);
										}else{
											map7.put("monAmt", 0);
										}

										map7.put("seq", k);
										sqlMapClient.queryForObject((String)dsRtsd0041Map.get("sqlnamespace"), map7);
									}else{
										map7.put("successCode", "0");
									}
				
									success7 = Integer.parseInt((map7.get("successCode") + ""));
									map = map7;
									if(success7 < 0){
										map = map7;
										break;
									}
									k++;
								}else{
									map = map7;
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
									if(!map6.containsKey("dvsn")) map8.put("dvsn", "D");
								}
								
								
								map8.put("ordNo"  , (String) map2.get("ordNo"));
								map8.put("reqDay" , (String) map2.get("procDay"));
								map8.put("procDay", (String) map2.get("procDay"));
								map8.put("regId"  , inVar.get("regId"));
								
								sqlMapClient.queryForObject((String)dsRtsd0401Map.get("sqlnamespace"), map8);
								success8 = Integer.parseInt((map8.get("successCode") + ""));
								map = map8;
								
								if(success8 < 0){
									map = map8;
									break;
								}
							}else{
								map = map8;
							}
						}
					}	// RTSD0401 TABLE 방문장착 대리점

					
				} // RTSD0106 TABLE 계약상품정보 end 

			}	// RTSD0106 TABLE 계약상품정보
			

			if( success1 == 0 && success2 == 0 && success3 == 0 && success6 == 0 && success4 == 0 && success7 == 0 && success8 == 0){
				sqlMapClient.getCurrentConnection().commit();
				sqlMapClient.executeBatch();
				sqlMapClient.commitTransaction();
			} else {
				sqlMapClient.getCurrentConnection().rollback();
				sqlMapClient.executeBatch();
				sqlMapClient.commitTransaction();
			}
				

			
			
			if( success6 == -2 ){
				map = new HashMap();
				map.put("ordNo", ordNo);
				map.put("successCode", success6);
				map.put("returnMessage","기존 접수된 계약이 존재하므로 신규 계약 저장이 불가합니다.("+ordNo+")");
				//map.put("returnMessage", "고객번호("+map6.get("custNo")+")\n"+"주문번호("+ordNo+")\n차량번호("+map6.get("carNo")+")\n상품번호("+map6.get("matCd")+")\n로 등록된 주문이 있습니다.");
			}
			
			// 완료 후 SMS 전송
			// - [20170906_01] 로 주석처리
			/*
			if(dsRtsd0205Map.get("chanCd").equals("03") || dsRtsd0205Map.get("chanCd").equals("04")){
				Map smsMap = inDsMapRtsd0205.get(0);
				
				smsMap.put("reservedFg",   "I");
				smsMap.put("reservedDttm", "00000000000000");
				smsMap.put("rcvPhnId",     dsRtsd0205Map.get("mobNo"));
				smsMap.put("sndPhnId",     "18550100");
				smsMap.put("sndMsg",       dsRtsd0205Map.get("smsMsg"));
				smsMap.put("etcChar1",     "S003");
				smsMap.put("etcChar2",     "주문완료");
				smsMap.put("regId",        inVar.get("regId"));
				smsMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
				smsMap.put("dvsn", 			"I");
				sqlMapClient.queryForObject((String)dsRtsd0205Map.get("sqlnamespace"), smsMap);
				success7 = Integer.parseInt((smsMap.get("successCode") + ""));
			}	
			*/

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
	
	public List<Map> getUserChanCdList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("custGrp.userChanCdList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public String getregiAmtRt(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contact.regiAmtRt", map);
		return (String)map.get("result");
	}
		
	public Map setRegiAmtPay(Map inVar) throws NtRmsDaoException, Exception {

		Map hmap = new HashMap();
		// TODO Auto-generated method stub
		SqlMapClientTemplate sqlTemplate 	= getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 	= sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	//Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				//여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						//autoCommit의 설정 Commit
		int success = 0;

		try {
			
			hmap.put("regId", (String)inVar.get("regId"));
			hmap.put("ordNo", (String)inVar.get("ordNo"));
			
			sqlMapClient.queryForObject("contact.regiAmtPay", hmap);
			success = Integer.parseInt((hmap.get("successCode") + ""));
	
									
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return hmap;
	}
}

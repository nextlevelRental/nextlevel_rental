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
import egovframework.ntrms.kr.co.comm.util.RentalToOmsDataUtil;
import egovframework.ntrms.kr.co.comm.util.RentalToOmsDataUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@SuppressWarnings("unchecked")
@Repository("rTSDContractRegisterMapDAO")

public class RTSDContractRegisterMapDAO extends EgovAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	@Resource(name="sqlMapClient")
	public void initDAO(SqlMapClient sqlMapClient) throws NtRmsDaoException{
		setSqlMapClient(sqlMapClient);
	}
	
	@SuppressWarnings("deprecation")
	public SqlMapClientTemplate getSqlMapClientTemplateDAO() throws NtRmsDaoException{
		return this.getSqlMapClientTemplate();
	}
	
	public List<Map> listRtsd0104(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.listRtsd0104", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listRtsd0106(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.listRtsd0106", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listRtsd0013(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.listRtsd0013", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listRtsd0014(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.listRtsd0014", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> applyRtsd0014(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.applyRtsd0014", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listRateAmt(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.listRateAmt", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveRental2Oms(Map<String, Object> map){
		getSqlMapClientTemplate().queryForObject("comm.insertOmsIFLog", map);
		return map;
	}
	
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
public Map saveContractRegister(Map bankAndCardMap, Map dsRtsd0104Map, Map dsRtsd0106Map, Map dsRtsd0013Map, Map dsRtsd0014Map, Map dsRtsd0205Map, Map dsRtsd0041Map,  Map dsRtsd0401Map, Map dsRtsd0213Map, Map inVar) throws NtRmsDaoException, Exception {
		
		int success1 = 0;	//inDsbankAndCard       
		int success2 = 0;   //inDsMapRtsd0104        
		int success3 = 0;   //inDsMapRtsd0106
		int success4 = 0;   //inDsMapRtsd0013          
		int success5 = 0;   //inDsMapRtsd0014
		int success6 = 0;
		int success7 = 0;
		int success8 = 0;	//inDsMapRtsd0041
		int success9 = 0;	//inDsMapRtsd0401
		int success10 = 0;	
		int success11 = 0;
		int success12 = 0;
		
		Map map  = null;	//return map
		
		Map map1 = null; 	//inDsbankAndCard
		Map map2 = null;	//inDsMapRtsd0104
		Map map3 = null;	//inDsMapRtsd0106
		Map map4 = null;	//inDsMapRtsd0013
		Map map5 = null;	//inDsMapRtsd0014
		Map map6 = new HashMap();
		Map map7 = null;	//inDsMapRtsd0041
		Map map8 = null;	//inDsMapRtsd0401
		Map map9 = new HashMap();
		Map map10 = null;
		Map map11 = null;
		Map map12 = null;
		
		String accSeq = "";
		String crdSeq = "";
		String ordNo  = "";
		
		Object rtnCode = null;
		Object rtnMsg = null;
		
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
			DataSetMap inDsMapRtsd0106	= (DataSetMap)dsRtsd0106Map.get("dsRtsd0106Map");
			DataSetMap inDsMapRtsd0013 	= (DataSetMap)dsRtsd0013Map.get("dsRtsd0013Map");
			DataSetMap inDsMapRtsd0014 	= (DataSetMap)dsRtsd0014Map.get("dsRtsd0014Map");
			DataSetMap inDsMapRtsd0205 	= (DataSetMap)dsRtsd0205Map.get("dsRtsd0205Map"); // 2016-7-28 add
			DataSetMap inDsMapRtsd0041 	= (DataSetMap)dsRtsd0041Map.get("dsRtsd0041Map"); // 2018-11-07 add
			DataSetMap inDsMapRtsd0401 	= (DataSetMap)dsRtsd0401Map.get("dsRtsd0401Map"); // [20181122_01]
			DataSetMap inDsMapRtsd0213  = (DataSetMap)dsRtsd0213Map.get("dsRtsd0213Map"); //20191205
			
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
				map2 = inDsMapRtsd0104.get(0);
				int rowType2 = ((Integer) map2.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
				if( rowType2 != DataSet.ROW_TYPE_NORMAL ){
					if(rowType2 == DataSet.ROW_TYPE_INSERTED) {
						if(!map2.containsKey("dvsn")) map2.put("dvsn", "I");
					} else if(rowType2 == DataSet.ROW_TYPE_UPDATED) {
						if(!map2.containsKey("dvsn")) map2.put("dvsn", "U");
//						sqlMapClient.queryForObject((String)dsRtsd0104Map.get("sqlHisnamespace"), map2);
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
				
				//RTSD0106 TABLE
				if( success1 == 0 && success2 == 0 ){
					int j = 1;
					System.out.println("inDsMapRtsd0106.size()  : " +  inDsMapRtsd0106.size());
					
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
								System.out.println("success6666666:"+(String) map2.get("ordNo"));
								sqlMapClient.queryForObject((String)dsRtsd0106Map.get("sqlnamespaceDel"), map3);
								System.out.println("1-1---------------------------------------------");
								//sqlMapClient.queryForObject((String)dsRtsd0106Map.get("sqlnamespaceSaleDel"), map3);
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
									map = map3;
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
					
					//RTSD0013 TABLE
					if( success1 == 0 && success2 == 0 && success3 == 0 && success6 == 0){
						for( int ii = 0 ; ii < inDsMapRtsd0013.size() ; ii++ ) {
							map4 = inDsMapRtsd0013.get(ii);
							int rowType4 = ((Integer) map4.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
							System.out.println("rowType4:"+rowType4);
							System.out.println("ROW_TYPE_NORMAL:"+DataSet.ROW_TYPE_NORMAL);
							map4.put("regId", inVar.get("regId"));
							map4.put("ordNo", (String) map2.get("ordNo"));
							System.out.println("ordNo:"+(String) map2.get("ordNo"));
							if( ii == 0){
								System.out.println("delllllll");
								sqlMapClient.queryForObject((String)dsRtsd0013Map.get("sqlnamespaceDel"), map4);
							}
							if( rowType4 != DataSet.ROW_TYPE_NORMAL ){
							 	System.out.println("DataSet.ROW_TYPE_INSERTED:"+DataSet.ROW_TYPE_INSERTED);
								if(rowType4 == DataSet.ROW_TYPE_INSERTED) {
									if(!map4.containsKey("dvsn")) map4.put("dvsn", "I");
								} else if(rowType4 == DataSet.ROW_TYPE_UPDATED) {
									if(!map4.containsKey("dvsn")) map4.put("dvsn", "U");
								} else if(rowType4 == DataSet.ROW_TYPE_DELETED) {
									if(!map4.containsKey("dvsn")) map4.put("dvsn", "D");
								}
								
								System.out.println("aaaaaaaaaaaaaa");
								sqlMapClient.queryForObject((String)dsRtsd0013Map.get("sqlnamespace"), map4);
								System.out.println("bbbbbbbbbbbbbb");
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
					}
					
					//RTSD0014 TABLE
					/*if( success1 == 0 && success2 == 0 && success3 == 0 && success4 == 0 && success6 == 0){
						for( int iii = 0 ; iii < inDsMapRtsd0014.size() ; iii++ ) {
							map5 = inDsMapRtsd0014.get(iii);
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
								map5.put("ordNo", (String) map2.get("ordNo"));
								if( iii == 0){
									sqlMapClient.queryForObject((String)dsRtsd0014Map.get("sqlnamespaceDel"), map5);
								}
								sqlMapClient.queryForObject((String)dsRtsd0014Map.get("sqlnamespace"), map5);
								success5 = Integer.parseInt((map5.get("successCode") + ""));
								map = map5;
								if(success5 < 0){
									map = map5;
									break;
								}
							}else{
								map = map5;
							}
						}
					}*/
					System.out.println("success1:"+success1);
					System.out.println("success2:"+success2);
					System.out.println("success3:"+success3);
					System.out.println("success4:"+success4);
					System.out.println("success6:"+success6);
					System.out.println("ordNo : " + (String) map2.get("ordNo"));
					//RTSD0041 TABLE
					if( success1 == 0 && success2 == 0 && success3 == 0 && success6 == 0){
						System.out.println("aa:"+inDsMapRtsd0041.size());
						for( int iii = 0 ; iii < inDsMapRtsd0041.size() ; iii++ ) {
							map7 = inDsMapRtsd0041.get(iii);
							int rowType7 = ((Integer) map7.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
							System.out.println("rowType7:"+rowType7);
							System.out.println("ROW_TYPE_NORMAL:"+DataSet.ROW_TYPE_NORMAL);
							System.out.println("DataSet.ROW_TYPE_INSERTED:"+DataSet.ROW_TYPE_INSERTED);
							System.out.println("DataSet.ROW_TYPE_UPDATED:"+DataSet.ROW_TYPE_UPDATED);
							System.out.println("DataSet.ROW_TYPE_DELETED:"+DataSet.ROW_TYPE_DELETED);
							
							if( rowType7 != DataSet.ROW_TYPE_NORMAL ){
								if(rowType7 == DataSet.ROW_TYPE_INSERTED) {
									System.out.println("dvsn:"+map7.containsKey("dvsn"));
									if(!map7.containsKey("dvsn")) map7.put("dvsn", "I");
								} else if(rowType7 == DataSet.ROW_TYPE_UPDATED) {
									if(!map7.containsKey("dvsn")) map7.put("dvsn", "U");
								} else if(rowType7 == DataSet.ROW_TYPE_DELETED) {
									if(!map7.containsKey("dvsn")) map7.put("dvsn", "D");
								}
								map7.put("regId", inVar.get("regId"));
								map7.put("ordNo", (String) map2.get("ordNo"));
								map7.put("seq", iii+1);
								System.out.println("ordNo : " + (String) map2.get("ordNo"));
								
								if( iii == 0){
									sqlMapClient.queryForObject((String)dsRtsd0041Map.get("sqlnamespaceDel"), map7);
								}
								sqlMapClient.queryForObject((String)dsRtsd0041Map.get("sqlnamespace"), map7);
								success8 = Integer.parseInt((map7.get("successCode") + ""));
								map = map7;
								if(success8 < 0){
									map = map7;
									break;
								}
							}else{
								map = map7;
							}
						}
					}

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
								success9 = Integer.parseInt((map8.get("successCode") + ""));
								map = map8;
								
								if(success9 < 0){
									map = map8;
									break;
								}
							}else{
								map = map8;
							}
						}
					}
					
					
					// 렌탈료 체크
					if ( success1 == 0 && success2 == 0 && success3 == 0 && success6 == 0) {
						
						map9.put("ordNo", (String) map2.get("ordNo"));
						sqlMapClient.queryForObject("contact.rentAmtChk", map9);
						success10 = Integer.parseInt((map9.get("successCode") + ""));
	
						if(success10 < 0){
							map = map9;
						}						
					}
					
					//OMS연계
					//==========================================================================================
					if(success1 == 0 && success2 == 0 && success3 == 0 && success6 == 0 && success10 == 0){
						//거점인 경우만 연계
						if(inDsMapRtsd0213.get(0).get("o2oYn").equals("Y")){
							
							RentalToOmsDataUtil rentalToOms = null;
							try{
								rentalToOms = new RentalToOmsDataUtil();
								inDsMapRtsd0213.get(0).put("rentIfCntrNo", map2.get("ordNo")); //주문번호
								inDsMapRtsd0213.get(0).put("server_key", inVar.get("server_key")); //서버키
								map10 = rentalToOms.rentalToOmsData(inVar.get("host").toString(), inDsMapRtsd0213.get(0));
								
								rtnCode = (map10.get("rtnCode") == null || map10.get("rtnCode") == "" ? "0" : map10.get("rtnCode").toString());
								rtnMsg = (map10.get("rtnMsg") == null || map10.get("rtnMsg") == "" ? "결과값이 존재하지 않습니다." : map10.get("rtnMsg").toString());
								inDsMapRtsd0213.get(0).put("rtnCode", rtnCode);
								inDsMapRtsd0213.get(0).put("rtnMsg", rtnMsg);
								
								map.put("rtsd0213", inDsMapRtsd0213.get(0));
								map.put("paramStr", map10.get("paramStr"));
								map.put("returnStr", map10.get("returnStr"));
								success11 = Integer.parseInt(rtnCode.toString());
								if(success11 == 0){
									map.put("oOrdNo", map10.get("ordNo"));
									map.put("ordNo", map2.get("ordNo"));
									map.put("tmsOrderId", map10.get("orderId"));
									map.put("instTm", null);
									map.put("procDay", null);
									//20201216 kstka 주소정보 추가
									map.put("inst1PosCd", null);
									map.put("inst1Addr1", null);
									map.put("inst1Addr2", null);
									map.put("inst2PosCd", null);
									map.put("inst2Addr1", null);
									map.put("inst2Addr2", null);
									
									map.put("omsOrderNo", map10.get("ordNo"));
									
									sqlMapClient.queryForObject("contract.p_UpdateRtsd0104TmsOrderId", map);
									success12 = Integer.parseInt((map.get("successCode") + ""));
									
									//20200619 kstka 문자발송
									try{
										map12 = new HashMap();
										map12.put("omsOrderNo", map.get("omsOrderNo"));
										map12.put("regId", map.get("regId"));
										map12.put("tmplCd", inDsMapRtsd0213.get(0).get("tmplCd"));
										
										sqlMapClient.queryForObject("contract.p_sExif0004O2OSendSms", map12);
									}catch(Exception e){										
									}
									
								}
								
							}catch(Exception e){
								success11 = -2;
								map.put("successCode", -1);
								map.put("returnMessage", "[OMS]시스템관리자에게 문의바랍니다!.\n"+e.getMessage()+"");
							}
							
						}
					}
					//==========================================================================================
				}else{
					map = map2;
				}
			}else{
				map = map1;
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
			success7 = 0; // [[20170906_01]
			
			if(success11 == -1){
				inDsMapRtsd0213.get(0).put("rtnCode", rtnCode);
				inDsMapRtsd0213.get(0).put("rtnMsg", rtnMsg);
				
				map.put("successCode", Integer.parseInt(rtnCode.toString()));
				map.put("returnMessage",rtnMsg.toString());
			}else if(success11 == -2){
				inDsMapRtsd0213.get(0).put("rtnCode", rtnCode);
				inDsMapRtsd0213.get(0).put("rtnMsg", rtnMsg);
				
				map.put("successCode", -1);
				map.put("returnMessage", map.get("returnMessage"));
			}
			
			if( success1 == 0 && success2 == 0 && success3 == 0 && success4 == 0 && success6 == 0 && success8 == 0 && success9 == 0 && success11 == 0 && success12 == 0){
//			if( success4 == 0){
				sqlMapClient.getCurrentConnection().commit();
				sqlMapClient.executeBatch();
				sqlMapClient.commitTransaction();
			} else {
				sqlMapClient.getCurrentConnection().rollback();
				sqlMapClient.executeBatch();
				sqlMapClient.commitTransaction();
			}
			System.out.println("map1:"+map1);
			System.out.println("map2:"+map2);
			System.out.println("map4:"+map4);
			System.out.println("map5:"+map5);
			System.out.println("success4:"+success4);
			System.out.println("map:"+map);
			System.out.println("success10" + success10);
			System.out.println("success12" + success12);
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
	
	public int selectRtsd0108SaleCdCount(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("contract.selectRtsd0108SaleCdCount", map);
		return (Integer)map.get("result");
	}
	
	public String selectSalesmanTel(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.selectSalesmanTel", map);
		return (String)map.get("result");
	}
	
	public String selectFirstDay(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.selectFirstDay", map);
		return (String)map.get("result");
	}
	
	public String selectFirstDayByTerm(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.selectFirstDayByTerm", map);
		return (String)map.get("result");
	}
	
	public String f_sRtsd0104GetExistContract(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.f_sRtsd0104GetExistContract", map);
		return (String)map.get("result");
	}
	
	public String sRtsd0104ChanCd(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("contract.sRtsd0104ChanCd", map);
		return (String)map.get("result");
	}
	
	public List<Map> sRtsd0113UserGrp(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.sRtsd0113UserGrp", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listAddProduct(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.listAddProduct", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public List<Map> listGrpAdd(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.listGrpAdd", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> cntPrdPymInfoList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.cntPrdPymInfoList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listAddSelProduct(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.listAddSelProduct", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> prmmSrvcOrdList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.prmmSrvcOrdList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listPrdInfo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.listPrdInfo", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public List<Map> combosetPettern(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.combosetPettern", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public List<Map> combosetStan(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.combosetStan", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public String wheelQty(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.wheelQty", map);
		return (String)map.get("result");
	}
	public String wheelQtyLt(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.wheelQtyLt", map);
		return (String)map.get("result");
	}
	public Map tmsSchedule(Map map){
		
		Map result = null;
		Map result2 = null;
		
		RentalToOmsDataUtil rentalToOms = null;
		try{
			rentalToOms = new RentalToOmsDataUtil();
			result2 = rentalToOms.rentalToOmsData(map.get("host").toString(), map);
			System.out.println("=============================");
			System.out.println(result2);
			System.out.println("=============================");
			//System.out.println("result20::" + result2);
			if(!result2.get("rtnCode").equals("-1")){
				//System.out.println("result21::" + result2);
				result = rentalToOms.resultScheduleData(result2, map.get("orderType").toString());
			}else{
				//System.out.println("result22::" + result2);
				result = result2;
			}
		}catch(Exception e){
			e.getStackTrace();
		}
		return result;
	}
	public String o2oAgencyYn(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.o2oAgencyYn", map);
		return (String)map.get("result");
	}
	public List<Map> o2oAgencyInfo(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.o2oAgencyInfo", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public List<Map> o2oAgencyTime(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.o2oAgencyTime", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public int o2oAgencyStock(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.o2oAgencyStock", map);
		return (int)map.get("result");
	}
	public int o2oAgencyStock2(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.o2oAgencyStock2", map);
		return (int)map.get("result");
	}
	public int o2oAgencyStockTot(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.o2oAgencyStockTot", map);
		return (int)map.get("result");
	}
	public String selectBeforeAfterDay(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.selectBeforeAfterDay", map);
		return (String)map.get("result");
	}
	
	public List<Map> listSendContract(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.listSendContract", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public String getIsDupOrder(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("contract.getIsDupOrder", map);
		return (String)map.get("result");
	}
	
	public String checkCancOrder(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("contract.checkCancOrder", map);
		return (String)map.get("result");
	}
	
}

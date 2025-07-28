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
@Repository("rTSDB2BContractRegisterMapDAO")

public class RTSDB2BContractRegisterMapDAO extends EgovAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	@Resource(name="sqlMapClient")
	public void initDAO(SqlMapClient sqlMapClient) throws NtRmsDaoException{
		setSqlMapClient(sqlMapClient);
	}
	
	@SuppressWarnings("deprecation")
	public SqlMapClientTemplate getSqlMapClientTemplateDAO() throws NtRmsDaoException{
		return this.getSqlMapClientTemplate();
	}
	
	public Map saveB2BContractRegister(Map dsRtsd0104Map, Map dsRtsd0106Map, Map dsRtsd0013Map, Map dsRtsd0014Map, Map dsRtsd0205Map, Map inVar) throws NtRmsDaoException, Exception {
		
		int success1 = 0;	//inDsbankAndCard       
		int success2 = 0;   //inDsMapRtsd0104        
		int success3 = 0;   //inDsMapRtsd0106
		int success4 = 0;   //inDsMapRtsd0013          
		int success5 = 0;   //inDsMapRtsd0014
		int success6 = 0;
		int success7 = 0;
		
		Map map  = null;	//return map
		
		Map map1 = null; 	//inDsbankAndCard
		Map map2 = null;	//inDsMapRtsd0104
		Map map3 = null;	//inDsMapRtsd0106
		Map map4 = null;	//inDsMapRtsd0013
		Map map5 = null;	//inDsMapRtsd0014
		Map map6 = new HashMap();
		
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

			DataSetMap inDsMapRtsd0104	= (DataSetMap)dsRtsd0104Map.get("dsRtsd0104Map");
			DataSetMap inDsMapRtsd0106	= (DataSetMap)dsRtsd0106Map.get("dsRtsd0106Map");
			DataSetMap inDsMapRtsd0013 	= (DataSetMap)dsRtsd0013Map.get("dsRtsd0013Map");
			DataSetMap inDsMapRtsd0014 	= (DataSetMap)dsRtsd0014Map.get("dsRtsd0014Map");
			DataSetMap inDsMapRtsd0205 	= (DataSetMap)dsRtsd0205Map.get("dsRtsd0205Map"); // 2016-7-28 add
			
			//RTSD0104 TABLE
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
				}
				
				//RTSD0106 TABLE
				if( success1 == 0 && success2 == 0 ){
					for( int i = 0 ; i < inDsMapRtsd0106.size() ; i++ ) {
						map3 = inDsMapRtsd0106.get(i);
						int rowType3 = ((Integer) map3.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
						if( rowType3 != DataSet.ROW_TYPE_NORMAL ){
							if(rowType3 == DataSet.ROW_TYPE_INSERTED) {
								if(!map3.containsKey("dvsn")){
									map3.put("dvsn", "I");
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
									logger.debug("===============================================");
									logger.debug("success6 : " + success6);
									logger.debug("custNo   : " + map6.get("custNo"));
									logger.debug("carNo    : " + map6.get("carNo"));
									logger.debug("matCd    : " + map6.get("matCd"));
									logger.debug("chanCd   : " + map6.get("chanCd"));
									logger.debug("===============================================");
								}
							} else if(rowType3 == DataSet.ROW_TYPE_UPDATED) {
								if(!map3.containsKey("dvsn")) map3.put("dvsn", "U");
							} else if(rowType3 == DataSet.ROW_TYPE_DELETED) {
								if(!map3.containsKey("dvsn")) map3.put("dvsn", "D");
							}
							
							if(success6 == 0){
								map3.put("regId", inVar.get("regId"));
								map3.put("ordNo", (String) map2.get("ordNo"));
								sqlMapClient.queryForObject((String)dsRtsd0106Map.get("sqlnamespace"), map3);
								success3 = Integer.parseInt((map3.get("successCode") + ""));
								if(success3 < 0){
									map = map3;
									break;
								}
							}
						}
					}
					
					//RTSD0013 TABLE
					if( success1 == 0 && success2 == 0 && success3 == 0 && success6 == 0){
						for( int ii = 0 ; ii < inDsMapRtsd0013.size() ; ii++ ) {
							map4 = inDsMapRtsd0013.get(ii);
							int rowType4 = ((Integer) map4.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
							if( rowType4 != DataSet.ROW_TYPE_NORMAL ){
								if(rowType4 == DataSet.ROW_TYPE_INSERTED) {
									if(!map4.containsKey("dvsn")) map4.put("dvsn", "I");
								} else if(rowType4 == DataSet.ROW_TYPE_UPDATED) {
									if(!map4.containsKey("dvsn")) map4.put("dvsn", "U");
								} else if(rowType4 == DataSet.ROW_TYPE_DELETED) {
									if(!map4.containsKey("dvsn")) map4.put("dvsn", "D");
								}
								map4.put("regId", inVar.get("regId"));
								map4.put("ordNo", (String) map2.get("ordNo"));
								if( ii == 0){
									sqlMapClient.queryForObject((String)dsRtsd0013Map.get("sqlnamespaceDel"), map4);
								}
								sqlMapClient.queryForObject((String)dsRtsd0013Map.get("sqlnamespace"), map4);
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
					if( success1 == 0 && success2 == 0 && success3 == 0 && success4 == 0 && success6 == 0){
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
					}
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
			
			//완료 후 SMS 전송
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
			
			if( success1 == 0 && success2 == 0 && success3 == 0 && success4 == 0 && success5 == 0 && success6 == 0 && success7 == 0 ){
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
}

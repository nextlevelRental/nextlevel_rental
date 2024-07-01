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

@SuppressWarnings("unchecked")
@Repository("rTSDCustRegisterMapDAO")

public class RTSDCustRegisterMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public String safeKeyConfirm(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("cust.safeKeyConfirm", map);
		return (String)map.get("result");
	}
	
	public String countSafeKey(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("cust.countSafeKey", map);
		return (String)map.get("result");
	}
	
	public Map saveSafeKey(Map<String, Object>  inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public int checkBuslNo(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("cust.checkBuslNo", map);
		return (Integer)map.get("result");
	}
	
	public Map saveCustRegister(Map dsRtsd0100Map, Map dsRtsd0110Map, Map onlineMap, Map onlineUpdateMap, Map inVar) throws NtRmsDaoException, Exception {
		
		Map map   = null;	//return map
		Map map1  = null;	//return map
		Map map2  = null;	//return map
		Map map3  = null;	//return map
		Map map4  = null;	//return map
		
		int success1 = 0;
		int success2 = 0;
		int success3 = 0;
		int success4 = 0;
		
		// TODO Auto-generated method stub
		SqlMapClientTemplate sqlTemplate 	= getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 	= sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	//Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				//여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						//autoCommit의 설정 Commit
		
		try {
			sqlMapClient.startBatch();

			DataSetMap inDsRtsd0100		= (DataSetMap)dsRtsd0100Map.get("inDsMap1");
			DataSetMap inDsRtsd0110		= (DataSetMap)dsRtsd0110Map.get("inDsMap2");
			DataSetMap inDsOnline		= (DataSetMap)onlineMap.get("inDsMap3");
			DataSetMap inDsOnlineUpdate	= (DataSetMap)onlineUpdateMap.get("inDsMap4");
			
			map1 = inDsRtsd0100.get(0);
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
				sqlMapClient.queryForObject((String)dsRtsd0100Map.get("sqlnamespace"), map1);
				success1 = Integer.parseInt((map1.get("successCode") + ""));
			}
			
			if(success1 == 0){
				if( inDsRtsd0110.size() != 0 ){
					map2 = inDsRtsd0110.get(0);
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
						map2.put("custNo", map1.get("custNo"));
						sqlMapClient.queryForObject((String)dsRtsd0110Map.get("sqlnamespace"), map2);
						success2 = Integer.parseInt((map2.get("successCode") + ""));
					}
				}
				
				if(success2 == 0){
					if( inDsOnline.size() != 0  ){
						map3 = inDsOnline.get(0);
						if( map3.size() != 0 ){
							sqlMapClient.queryForObject((String)onlineMap.get("sqlnamespace"), map3);
							success3 = Integer.parseInt((map3.get("successCode") + ""));
						}
					}else if( inDsOnlineUpdate.size() != 0 ){
						map4 = inDsOnlineUpdate.get(0);
						if( map4.size() != 0 ){
							sqlMapClient.queryForObject((String)onlineUpdateMap.get("sqlnamespace"), map4);
							success4 = Integer.parseInt((map4.get("successCode") + ""));
						}
					}
				}
			}
			
			if( map1 != null ){
				map = map1;
			}
			if( map2 != null ){
				map = map2;
			}
			if( inDsOnline.size() != 0 ){
				map3.remove("custNo");
				map3.put("custNo", map1.get("custNo"));
				map = map3;
			}
			
			if( success1 == -1 ){
				map.put("successCode", map1.get("successCode"));
				map.put("returnMessage", map1.get("returnMessage"));
			}
			if( success2 == -1 ){
				map.put("successCode", map2.get("successCode"));
				map.put("returnMessage", map2.get("returnMessage"));
			}
			if( success3 == -1 ){
				map.put("successCode", map3.get("successCode"));
				map.put("returnMessage", map3.get("returnMessage"));
			}
			
			if( success1 == 0 && success2 == 0 && success3 == 0 && success4 == 0 ) {
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
	
	public List<Map> getaccList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("cust.listAcc", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveAccData(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public List<Map> getcardList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("cust.listCard", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveCardData(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public Map createIRSafeKey(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public List<Map> selectRtsd0110(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.selectRtsd0110", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> selectRtsd0111(Map map, Map <String, DataSetMap> outDataset) throws Exception {
		getSqlMapClientTemplate().queryForObject("contract.selectRtsd0111", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> selectRtsd0111_2(Map map, Map <String, DataSetMap> outDataset) throws Exception {
		getSqlMapClientTemplate().queryForObject("contract.selectRtsd0111_2", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map createNiceTrust(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public Map searchTodayNiceData(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("cust.searchTodayNiceData", map);
		List li = (List)map.get("vcursor");
		if(li.size() > 0) {
			return (Map)li.get(0);
		} else  {
			return null;
		}
	}
	
	
	public Map createNice0202(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public String onlineEnterdupe(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("cust.onlineEnterdupe", map);
		return (String)map.get("result");
	}
	
	public int onlineDupe(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("cust.onlineDupe", map);
		return (Integer)map.get("result");
	}

	public Map insertRtsd0110(Map dsRtsd0110Map, Map inVar) throws NtRmsDaoException, Exception {
		Map map   = null;	//return map
		Map map2  = null;	//return map
		
		int success2 = 0;
		
		// TODO Auto-generated method stub
		SqlMapClientTemplate sqlTemplate 	= getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 	= sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	//Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				//여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						//autoCommit의 설정 Commit
		
		try {
			sqlMapClient.startBatch();
			DataSetMap inDsRtsd0110		= (DataSetMap)dsRtsd0110Map.get("inDsMap2");
			
			if( inDsRtsd0110.size() != 0 ){
				map2 = inDsRtsd0110.get(0);
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
					sqlMapClient.queryForObject((String)dsRtsd0110Map.get("sqlnamespace"), map2);
					success2 = Integer.parseInt((map2.get("successCode") + ""));
				}
			}
			
			if( inDsRtsd0110.size() != 0 ){
				map = map2;
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
	
	public Map saveSmsMsg(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}	
	
	//재렌탈 여부 조회
	public List<Map> getReRentalInfo(Map <String, DataSetMap> inDataset, Map<String, Object> inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("cust.p_sReRentalInfo", inVar);
		List li = (List)inVar.get("vcursor");
		return li;
	}
}

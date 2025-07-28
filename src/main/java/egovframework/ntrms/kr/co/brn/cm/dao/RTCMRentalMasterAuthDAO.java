package egovframework.ntrms.kr.co.brn.cm.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@Repository("rTCMRentalMasterAuthDAO")
public class RTCMRentalMasterAuthDAO extends RtcmAbstractDAO {
	
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * <pre>
	 * 공통코드 렌탈 사용자명, 렌탈 사용자 ID를 콤보박스 사용을 위해 조회
	 * </pre>
	 * @param paramMap
	 * @return List<Map>
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
	public List<Map> getCommonCodeRtlMasterComboList(Map<String, Object> paramMap) throws NtRmsDaoException {
		
		getSqlMapClientTemplate().queryForObject("rtlMasterInfo.RtlMasterCBList", paramMap);
		List<Map> resultList = (List<Map>)paramMap.get("vcursor");
		
		return resultList;
	}
	
	/**
	 * <pre>
	 * 공통코드 렌탈지사, 렌탈지점을 콤보박스 사용을 위해 조회
	 * </pre>
	 * @param paramMap
	 * @return List<Map>
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
	public List<Map> getCommonCodeRtlMasterHoboComboList(Map<String, Object> paramMap) throws NtRmsDaoException {
		
		getSqlMapClientTemplate().queryForObject("rtlMasterInfo.RtlMasterHoBoList", paramMap);
		List<Map> resultList = (List<Map>)paramMap.get("vcursor");
		
		return resultList;
	}
	
	/**
	 * <pre>
	 * 렌탈마스터 ID, 렌탈마스터명을 조회한다.
	 * 	렌탈 마스터 명 Like 검색
	 * 	렌탈 마스터 ID 검색
	 * </pre>
	 * @param paramMap
	 * @return List<Map>
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
	public List<Map> getRtlMasterList(Map<String, Object> paramMap) throws NtRmsDaoException {
		
		getSqlMapClientTemplate().queryForObject("rtlMasterInfo.RtlMasterList", paramMap);
		List<Map> resultList = (List<Map>)paramMap.get("vcursor");
		
		return resultList;
	}
	
	/**
	 * <pre>
	 * 렌탈 지사, 렌탈 지점을 조회한다.
	 * 	렌탈 지사 코드와 렌탈 지점 코드로 조회할 수 있다.
	 * 	렌탈 지사 Like 검색
	 * 	렌탈 지점 Like 검색
	 * @param paramMap
	 * @return
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
	public List<Map> getRtlHOBOList(Map<String, Object> paramMap) throws NtRmsDaoException {
		
		getSqlMapClientTemplate().queryForObject("rtlMasterInfo.RtlHOBOList", paramMap);
		List<Map> resultList = (List<Map>)paramMap.get("vcursor");
		
		return resultList;
	}
	
	/**
	 * <pre>
	 * 렌탈마스터정보를 조회한다.
	 * 	렌탈마스터 ID
	 * 	렌탈마스터명 Like 검색
	 * @param paramMap
	 * @return
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
	public List<Map> getRentalMasterInfo(Map<String, Object> paramMap) throws NtRmsDaoException {
		
		getSqlMapClientTemplate().queryForObject("rtlMasterInfo.p_Rtcm0112", paramMap);
		List<Map> resultList = (List<Map>)paramMap.get("vcursor");
		
		return resultList;
	}
	
	/**
	 * <pre>
	 * 렌탈마스터정보를 조회한다.
	 * 	렌탈마스터 ID
	 * 	렌탈마스터명 Like 검색
	 * @param paramMap
	 * @return
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
	public Map<String, Object> saveRentalMasterInfo(Map<String, Object> inVar, Map<String, DataSetMap> inDataSet) throws NtRmsDaoException {
		Map map = null;
		try {

			getSqlMapClient().startTransaction();
			
			//기존 내역 삭제
			inVar.put("dvsn", "D");
			getSqlMapClient().queryForObject("rtlMasterInfo.p_IUDRtcm0112", inVar);
			
			DataSetMap dsAuth = (DataSetMap)inDataSet.get("dsAuth");
			for(int i=0; i<dsAuth.size(); i++){
				map = dsAuth.get(i);
				int rowType = ((Integer) map.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
				if(rowType == DataSet.ROW_TYPE_INSERTED){
					if(!map.containsKey("dvsn")) map.put("dvsn", "I");
				}else if(rowType == DataSet.ROW_TYPE_UPDATED){
					if(!map.containsKey("dvsn")) map.put("dvsn", "U");
				}else if(rowType == DataSet.ROW_TYPE_DELETED) {
					if(!map.containsKey("dvsn")) map.put("dvsn", "D");
				}
				
				getSqlMapClient().queryForObject("rtlMasterInfo.p_IUDRtcm0112", map);
			}
			
			getSqlMapClient().commitTransaction();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				getSqlMapClient().endTransaction();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		return map;
	}
	
	/**
	 * <pre>
	 * 렌탈마스터정보를 삭제한다.
	 * 	렌탈마스터 ID
	 * 	렌탈마스터명 Like 검색
	 * @param paramMap
	 * @return
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
	public Map<String, Object> deleteRentalMasterInfo(Map<String, Object> inVar, Map<String, DataSetMap> inDataSet) throws NtRmsDaoException {
		
		try{
			
			//기존 내역 삭제
			inVar.put("dvsn", "D");
			getSqlMapClientTemplate().queryForObject("rtlMasterInfo.p_IUDRtcm0112", inVar);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return inVar;
	}
	
	/**
	 * <pre>
	 * 렌탈마스터 마스터 정보 등록
	 * 	렌탈마스터 ID
	 * 	렌탈마스터명 Like 검색
	 * @param paramMap
	 * @return
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
	public Map<String, Object> saveRentalMaster(Map<String, Object> inVar, Map<String, DataSetMap> inDataSet) throws NtRmsDaoException {
		Map map = null;
		try {

			getSqlMapClient().startTransaction();
			
			DataSetMap dsList = (DataSetMap)inDataSet.get("ds_list");
			for(int i=0; i<dsList.size(); i++){
				map = dsList.get(i);
				int rowType = ((Integer) map.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
				if(rowType == DataSet.ROW_TYPE_INSERTED){
					if(!map.containsKey("dvsn")) map.put("dvsn", "I");
				}else if(rowType == DataSet.ROW_TYPE_UPDATED){
					if(!map.containsKey("dvsn")) map.put("dvsn", "U");
				}else if(rowType == DataSet.ROW_TYPE_DELETED) {
					if(!map.containsKey("dvsn")) map.put("dvsn", "D");
				}
				
				getSqlMapClient().queryForObject("rtlMasterInfo.p_IUDRtcm0111", map);
			}
			
			getSqlMapClient().commitTransaction();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				getSqlMapClient().endTransaction();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		return map;
	}
	
	/**
	 * <pre>
	 * 렌탈마스터정보를 조회한다.
	 * 	렌탈마스터 ID
	 * 	렌탈마스터명 Like 검색
	 * @param paramMap
	 * @return
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
	public List<Map> listRentalMaster(Map<String, Object> paramMap) throws NtRmsDaoException {
		
		getSqlMapClientTemplate().queryForObject("rtlMasterInfo.p_Rtcm0111", paramMap);
		List<Map> resultList = (List<Map>)paramMap.get("vcursor");
		
		return resultList;
	}
}

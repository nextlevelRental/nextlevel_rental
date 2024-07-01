/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTCSRegularCheckDAO.java
 * 3.Developer			: jungsoo
 * 4.Development Date	: 2015.08.10
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.event.RowHandler;
import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@SuppressWarnings("unchecked")
@Repository("rTCSRegularCheckDAO")

public class RTCSRegularCheckDAO extends EgovAbstractDAO {
	Logger logger = Logger.getLogger(RTCSRegularCheckDAO.class);
	
	@Resource(name="sqlMapClient")
	public void initDAO(SqlMapClient sqlMapClient) throws Exception{
		setSqlMapClient(sqlMapClient);
	}
	
	@SuppressWarnings("deprecation")
	public SqlMapClientTemplate getSqlMapClientTemplateDAO() throws Exception{
		return this.getSqlMapClientTemplate();
	}
	
	//점검 작업목록조회
	public List<Map> selectWorkList(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("regularcheck.selectWorkList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	//정보변경항목 조회
	public List<Map> infoChange(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("regularcheck.infoChange", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	//정보변경항목 저장
	public Map saveReqularCheck(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("regularcheck.infoChangeUpdate", map);
		return map;
	}
	
	//우편번호별 MRCd 조회
	public String getMrCd(Map map) throws Exception {
		String mrCd = "";
		getSqlMapClientTemplate().queryForObject("regularcheck.getMrCd", map);
		mrCd = map.get("result") == null ? "" : (String)map.get("result");
		return mrCd;
	}
	
	//처리결과 목록조회
	public List<Map> infoResult(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("regularcheck.infoResult", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	//처리결과 저장처리
	public Map saveInfoResult(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("regularcheck.saveInfoResult", map);
		return map;
	}
	
	//서비스이력 목록조회
	public List<Map> serviceHistory(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("regularcheck.serviceHistory", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> selectUserInfo(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("regularcheck.selectUserInfo", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	//정기점검 컨택목록조회
	public List<Map> selectCallList(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("regularcheck.selectCallList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/**
	 * 정기점검 컨택정보 목록을 조회한다
	 * 
	 * @param mapInVar
	 * @return List
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-03-27	wjim		신규생성
	 */
	public List <Map> listContact(Map <String, Object> mapInVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("regularcheck.selectContactList", mapInVar);
		List listResult = (List)mapInVar.get("vcursor");
		return listResult;
	}
	
	/**
	 * 정기점검 컨택정보 엑셀 다운로드용 목록을 조회한다
	 * 
	 * @param mapInVar
	 * @return List
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-03-29	wjim		신규생성
	 */
	public List <Map> listExcelContact(Map <String, Object> mapInVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("regularcheck.selectCallExcelList", mapInVar);
		List listResult = (List)mapInVar.get("vcursor");
		return listResult;
	}
	
	/**
	 * 정기점검 컨택정보를 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return Map
	 * @throws NtRmsDaoException
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-03-27	wjim		신규생성
	 */
	@SuppressWarnings("deprecation")
	public Map <String, Object> saveContact(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws NtRmsDaoException, Exception {
		int nSuccess   = 0;
		Map<String, Object> mapRowSave = null;
		
		// TODO Auto-generated method stub
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	// Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				// 여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						// autoCommit의 설정 Commit
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap dsmContactList = (DataSetMap)mapInDSM.get("ds_contactList");
			
			if ( dsmContactList.size() != 0 ) {
				for( int i = 0 ; i < dsmContactList.size() ; i++ ) {
					mapRowSave = dsmContactList.get(i);
					
					int rowType = ((Integer) mapRowSave.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					
					if ( rowType != DataSet.ROW_TYPE_NORMAL ) {
						
						if (rowType == DataSet.ROW_TYPE_INSERTED) {
							if (!mapRowSave.containsKey("dvsn")) mapRowSave.put("dvsn", "I");
						} else if (rowType == DataSet.ROW_TYPE_UPDATED) {
							if (!mapRowSave.containsKey("dvsn")) mapRowSave.put("dvsn", "U");
						}
						
						mapRowSave.put("regId", mapInVar.get("regId"));
						
						sqlMapClient.queryForObject("regularcheck.saveContact", mapRowSave);
						
						nSuccess = Integer.parseInt((mapRowSave.get("successCode") + ""));
						
						if (nSuccess < 0) {
							break;
						}
					}
				}
			}

			if( nSuccess == 0 ) {
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
		
		return mapRowSave;
	}
	
	/**
	 * 정기점검 컨택 변경사항을 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return Map
	 * @throws NtRmsDaoException
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-03-27	wjim		신규생성
	 */
	public Map saveContactChange(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("regularcheck.saveContactChange", map);
		return map;
	}
	
	/**
	 * 주소(빌딩코드)별 담당 로디안 정보를 조회한다
	 * 
	 * @param mapInVar
	 * @return List
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-03-28	wjim		신규생성
	 */
	public List <Map> selectBldMr(Map <String, Object> mapInVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("regularcheck.selectBldMr", mapInVar);
		List listResult = (List)mapInVar.get("vcursor");
		return listResult;
	}
	
	/**
	 * 시군구별 담당 로디안 정보를 조회한다
	 * 
	 * @param mapInVar
	 * @return List
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-04-04	wjim		신규생성
	 */
	public List <Map> selectAddr1Mr(Map <String, Object> mapInVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("regularcheck.selectAddr1Mr", mapInVar);
		List listResult = (List)mapInVar.get("vcursor");
		return listResult;
	}
	
	/**
	 * 월별 로디안별 방문점검 컨택 완료건수를 조회한다
	 * 
	 * @param mapInVar
	 * @return List
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-04-06	wjim		신규생성
	 */
	public List <Map> selectMrMonDecideCnt(Map <String, Object> mapInVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("regularcheck.selectMrMonDecideCnt", mapInVar);
		List listResult = (List)mapInVar.get("vcursor");
		return listResult;
	}
	
	/**
	 * 일자별 로디안별 방문점검 컨택 완료건을 조회한다
	 * 
	 * @param mapInVar
	 * @return List
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-04-06	wjim		신규생성
	 */
	public List <Map> selectMrDayDecide(Map <String, Object> mapInVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("regularcheck.selectMrDayDecide", mapInVar);
		List listResult = (List)mapInVar.get("vcursor");
		return listResult;
	}
	
	/**
	 * 정기점검 거부철회정보를 조회한다
	 * 
	 * @param mapInVar
	 * @return List
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-07-26	wjim		[20170726_01] 신규생성
	 */
	public List <Map> selectDenyList(Map <String, Object> mapInVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("regularcheck.selectDenyList", mapInVar);
		List listResult = (List)mapInVar.get("vcursor");
		return listResult;
	}
	
	/**
	 * 정기점검 거부를 등록한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return Map
	 * @throws NtRmsDaoException
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-07-26	wjim		[20170726_01] 신규생성
	 */
	public Map saveDeny(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("regularcheck.saveDeny", map);
		return map;
	}
	
	/**
	 * 정기점검 거부철회를 등록한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return Map
	 * @throws NtRmsDaoException
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-07-26	wjim		[20170726_01] 신규생성
	 */
	public Map saveWithdraw(Map map) throws Exception {
		getSqlMapClientTemplate().queryForObject("regularcheck.saveWithdraw", map);
		return map;
	}
	
	public Map saveRollBack(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("regularcheck.saveRollBack", map); 
		return map;
	}
	
	/**
	 * 정기점검 컨택정보 엑셀 다운로드용 목록을 조회한다
	 * 
	 * @param mapInVar
	 * @return List
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-03-29	wjim		신규생성
	 */
	public void exportExcelTest(Map <String, Object> mapInVar, RowHandler handler) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryWithRowHandler("regularcheck.selectCallExcelList", mapInVar, handler);
		return;
	}
	
	/**
	 * 홈쇼핑 가계약 정보를 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws NtRmsDaoException
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-01	wjim		신규생성
	 */
	@SuppressWarnings("deprecation")
	public Map <String, Object> saveVisitChangeTemp(Map <String, Object> mapInVar) throws NtRmsDaoException, Exception {

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
				
				DataSetMap inDsMap = (DataSetMap)mapInVar.get("inDsMap");
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
					map.put("regId", mapInVar.get("regId"));
					try{
						sqlMapClient.queryForObject((String)mapInVar.get("sqlnamespace"), map);
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
	
	public Map saveChangeVisitSchedule(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("regularcheck.saveChangeVisitSchedule", map); 
		return map;
	}
}
package egovframework.ntrms.kr.co.brn.re.dao;

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

@SuppressWarnings({ "unchecked", "deprecation" })
@Repository("rtreCollectionMoneyMapDAO")

public class RTRECollectionMoneyMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 수금내역 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<Map> getCollectionMoneyList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("collectionMoney.getCollectionMoneyList", map);
		List li = (List)map.get("vcursor");
		return li;
	}	
	
	
	/**
	 * 청구내역 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<Map> getBillingRecordList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("collectionMoney.getBillingRecordList", map);
		List li = (List)map.get("vcursor");
		return li;
	}	
	
	/**
	 * 수납관리 팝업용 청구/수납내역 조회
	 * @param map
	 * @param outDataset
	 * @return List
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<Map> getCollectForReq(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("collectionMoney.getCollectForReq", map);
		List li = (List)map.get("vcursor");
		return li;
	}	
	
	/**
	 * 수납내역 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<Map> getReceiptList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("collectionMoney.getReceiptList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/**
	 * 수납 취소내역 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<Map> getCancelReceiptList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("collectionMoney.getCancelReceiptList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/**
	 * 수납 내역 취소
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings("rawtypes")
	public Map cancelReceipt(Map inVar) {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	/**
	 * 수납 취소내역 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<Map> getCancelExOContractList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("collectionMoney.getCancelExOContractList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/**
	 * 수납 내역 취소
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws SQLException 
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings("rawtypes")
	public Map cancelExOContract(Map inVar) throws NtRmsDaoException, Exception {
//		Map result = null;
//		try {
//			result = executeDsMap(inVar);
//		}catch (Exception e) {
//			e.printStackTrace();
//		} 
//		return result;
		int nSuccess = 0;
		Map<String, Object> mapRowSave = null;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();							/* Transaction 시작			*/
		sqlMapClient.getCurrentConnection().setAutoCommit(false);	/* autoCommit 설정 변경		*/
		sqlMapClient.commitTransaction();							/* autoCommit의 설정 Commit	*/
		
		try {
			sqlMapClient.startBatch();
			mapRowSave = inVar;
			
			sqlMapClient.queryForObject("collectionMoney.cancelExOContract", mapRowSave);
			
			nSuccess = Integer.parseInt((mapRowSave.get("successCode") + ""));
			
			if(nSuccess == 0) {
				sqlMapClient.getCurrentConnection().commit();
				sqlMapClient.executeBatch();
				sqlMapClient.commitTransaction();
			} else {
				sqlMapClient.getCurrentConnection().rollback();
				sqlMapClient.executeBatch();
				sqlMapClient.commitTransaction();
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				sqlMapClient.endTransaction();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return mapRowSave;
	}
	
	/**
	 * 취소시퀀스
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public int getRecSeq(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("collectionMoney.getRecvSeq", map);
		return (Integer)map.get("result");
	}
	
	/**
	 * 가상계좌 내역을 조회한다
	 * 
	 * @param map
	 * @param outDataset
	 * @return List
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-10-20	wjim		신규생성
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<Map> getVaList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("collectionMoney.getVaList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/**
	 * 가상계좌 세부내역을 조회한다(PG결제 - 가상계좌)
	 * 
	 * @param map
	 * @param outDataset
	 * @return List
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-10-20	wjim		신규생성
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<Map> getVaDetail0141List(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("collectionMoney.getVaDetail0141List", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/**
	 * 가상계좌 세부내역을 조회한다(세틀뱅크 고정형 가상계좌)
	 * 
	 * @param map
	 * @param outDataset
	 * @return List
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-10-20	wjim		신규생성
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<Map> getVaDetail0221List(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("collectionMoney.getVaDetail0221List", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/**
	 * 가상계좌 (세부)내역을 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return Map
	 * @throws NtRmsDaoException
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-10-10	wjim		신규생성
	 */
	@SuppressWarnings({ "rawtypes" })
	public Map <String, Object> saveVaccount(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws NtRmsDaoException, Exception {
		Map mapResult = null;						//최종적으로 반환할 저장결과
		
		Map<String, Object> mapMasterRow = null;
		Map<String, Object> mapDetailRow = null;
		
		int nOkMaster = 0;							//가상게좌 메인내역 저장 성공여부
		int nOkDetail = 0;							//가상게좌 세부내역 저장 성공여부
		
		// Transaction 을 하나로 묶기위한 처리
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	// Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				// 여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						// autoCommit의 설정 Commit
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap dsmMaster = (DataSetMap)mapInDSM.get("ds_vaMain");
			DataSetMap dsmDetail = (DataSetMap)mapInDSM.get("ds_listCollectReq");
			
			////////////////////////////////////
			// 1. 가상계좌 메인내역 저장 진행 //
			////////////////////////////////////
			
			// 가상계좌 메인내역은 row 1개만 있다는 전제하에 수행
			mapMasterRow = dsmMaster.get(0);
			mapResult = mapMasterRow;
			// 가상계좌 메인내역 저장에 필요한 파라미터 세팅
			mapMasterRow.put("regId" , mapInVar.get("regId"));	//생성자			
			// 가상계좌 메인내역 저장
			sqlMapClient.queryForObject("collectionMoney.saveVa", mapMasterRow);
			// 저장결과 확인
			nOkMaster = Integer.parseInt((mapMasterRow.get("successCode") + ""));
						
			////////////////////////////////////
			// 2. 가상계좌 세부내역 저장 진행 //
			////////////////////////////////////
			if (nOkMaster == 0 && dsmDetail.size() != 0) {
				for (int i = 0 ; i < dsmDetail.size() ; i++) {
					mapDetailRow = dsmDetail.get(i);
					mapResult = mapDetailRow;
					
					int rowType = ((Integer) mapDetailRow.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					
					if (rowType != DataSet.ROW_TYPE_NORMAL) {
						// insert / update 결정
						if (rowType == DataSet.ROW_TYPE_INSERTED) {
							if (!mapDetailRow.containsKey("dvsn")) mapDetailRow.put("dvsn", "I");
						} else if (rowType == DataSet.ROW_TYPE_UPDATED) {
							if (!mapDetailRow.containsKey("dvsn")) mapDetailRow.put("dvsn", "U");
						}
						
						// 가상게좌 상세내역 저장에 필요한 파라미터 세팅
						mapDetailRow.put("rvaDay", mapMasterRow.get("rvaDay"));	//요청일자
						mapDetailRow.put("rvaSeq", mapMasterRow.get("rvaSeq"));	//요청일련번호
						mapDetailRow.put("tordNo", mapMasterRow.get("tordNo"));	//통합청구계약번호
						mapDetailRow.put("regId" , mapInVar.get("regId"));		//생성자
						
						// 가상계좌 상세내역 저장
						sqlMapClient.queryForObject("collectionMoney.saveVaDetail", mapDetailRow);
						// 저장결과 확인
						nOkDetail = Integer.parseInt((mapDetailRow.get("successCode") + ""));
						// 한 row라도 저장 오류가 발생하면 exit
						if (nOkDetail < 0) {							
							break;
						}
					}
				}
			}

			// 메인, 상세내역 모두 저장 성공시에만 commit
			if (nOkMaster == 0 && nOkDetail == 0) {
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
		
		return mapResult;
	}
	
	/**
	 * 가상계좌 연체내역을 조회한다
	 * 
	 * @param map
	 * @param outDataset
	 * @return List
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2018-01-05	wjim		[20180104_01] 신규생성
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> getVaOrdDelyList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("collectionMoney.getVaOrdDelyList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
}

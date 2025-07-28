/************************************************************************************
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTREPaymentCommMapDAO.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.12.10
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings({ "unchecked", "deprecation" })
@Repository("rTREPaymentCommMapDAO")

public class RTREPaymentCommMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 카드즉시출금결제 저장
	 * @param	mapInDSM
	 * @param	mapInVar
	 * @return	Map
	 * @throws	NtRmsDaoException
	 * @throws	Exception
	 */
	@SuppressWarnings("rawtypes")
	public Map<String, Object> saveCrdImmWthdrPayment(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws NtRmsDaoException, Exception {
		String viewId		 = (String)mapInVar.get("viewId");
		
		int nMstSuccess		   = 0;
		int nDtlSuccess		   = 0;
		int nCrdSuccess		   = 0;
		int nSuccessPrtClear   = 0;
		int nRcrdSuccess	   = 0;
		int nSuccessSchdlMst   = 0;
		int nSuccessSchdlDtl   = 0;
		int nPrpt0109Success   = 0;
		int nInsert0109Success = 0;
		int nSuccessCnclSave   = 0;
		int nSuccessMidList	   = 0;
		
		Map mapResult						= null;
		Map<String, Object> mapSave			= null;
		Map<String, Object> mapRowSave		= null;
		Map<String, Object> mapCrdSave		= null;
		Map<String, Object> mapPrtClearSave	= null;
		Map<String, Object> mapRcrdSave		= null;
		Map<String, Object> mapSchdMstSave	= null;
		Map<String, Object> mapSchdDtlSave	= null;
		Map<String, Object> mapPreSave		= null;
		Map<String, Object> mapCursor		= null;
		Map<String, Object> mapCnclSave		= null;
		Map<String, Object> mapMidList		= null;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();							/* Transaction 시작			*/
		sqlMapClient.getCurrentConnection().setAutoCommit(false);	/* autoCommit 설정 변경		*/
		sqlMapClient.commitTransaction();							/* autoCommit의 설정 Commit	*/
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap dsCrdImmWthdrMst	= (DataSetMap)mapInDSM.get("ds_crdImmWthdrMst");
			DataSetMap dsCrdImmWthdrDtl	= (DataSetMap)mapInDSM.get("ds_crdImmWthdrDtl");
			DataSetMap dsCrdInfo		= (DataSetMap)mapInDSM.get("ds_crdInfo");
			
			if(dsCrdImmWthdrMst.size() > 0) {
				/* 수납일련번호 채번 */
				Integer rcrdSeq = 0;
				Integer recvSeq = 0;
				
				getSqlMapClientTemplate().queryForObject("paymentComm.get0200RcrdSeq", mapInVar);
				rcrdSeq = (Integer)(mapInVar.get("rcrdSeq") == null ? "" : mapInVar.get("rcrdSeq"));
				
				/* 수납거래번호 없으면 채번 */
				if(dsCrdImmWthdrMst.get(0).get("recvSeq") == null || "".equals(dsCrdImmWthdrMst.get(0).get("recvSeq"))) {
					getSqlMapClientTemplate().queryForObject("paymentComm.get0041RecvSeq", mapInVar);
					recvSeq = (Integer)(mapInVar.get("recvSeq") == null ? "" : mapInVar.get("recvSeq"));
				}
				
				if("prePayment".equals(viewId)) {
					DataSetMap dsPymntSchdlMstList = (DataSetMap)mapInDSM.get("ds_pymntSchdlMstList");
					DataSetMap dsPymntSchdlDtlList = (DataSetMap)mapInDSM.get("ds_pymntSchdlDtlList");
					
					if(dsPymntSchdlDtlList.size() > 0) {
						/* 선납할인 저장 */
						
						/* 선납요청일련번호 채번 */
						Integer prptSeq = 0;
						
						getSqlMapClientTemplate().queryForObject("prePayment.get0160PrptSeq", mapInVar);
						prptSeq = (Integer)(mapInVar.get("prptSeq") == null ? "" : mapInVar.get("prptSeq"));
						
						mapSchdMstSave = dsPymntSchdlMstList.get(0);
						mapResult	   = mapSchdMstSave;
						
						mapSchdMstSave.put("prptSeq", prptSeq);
						
						/* 가상계좌 제외 */
						if(!"P5".equals(mapSchdMstSave.get("recpPay"))) {
							mapSchdMstSave.put("recvSeq", recvSeq);
						}
						
						mapSchdMstSave.put("regId", mapInVar.get("regId"));
						
						sqlMapClient.queryForObject("prePayment.savePrePaymentMst", mapSchdMstSave);
						nSuccessSchdlMst = Integer.parseInt((mapSchdMstSave.get("successCode") + ""));
						
						for(int i = 0; i < dsPymntSchdlDtlList.size(); i++) {
							mapSchdDtlSave = dsPymntSchdlDtlList.get(i);
							mapResult	   = mapSchdDtlSave;
							
							mapSchdDtlSave.put("prptSeq", prptSeq);
							mapSchdDtlSave.put("regId",	  mapInVar.get("regId"));
							
							/* 선납내역 상세 저장 */
							sqlMapClient.queryForObject("prePayment.savePrePaymentDtl", mapSchdDtlSave);
							nSuccessSchdlDtl = Integer.parseInt((mapSchdDtlSave.get("successCode") + ""));
							
							if(nSuccessSchdlDtl < 0) {
								break;
							}
							
							mapPreSave = dsPymntSchdlDtlList.get(i);
							mapResult = mapPreSave;
							
							mapPreSave.put("prptSeq", mapInVar.get("prptSeq"));
							
							/* 선납 Update Data 조회 */
							sqlMapClient.queryForObject("prePayment.prePymntUpdateList", mapPreSave);
							
							List li = (List)mapPreSave.get("vcursor");
							mapCursor = (Map<String, Object>)li.get(0);
							mapCursor.put("regId", mapInVar.get("regId"));
							
							/* 선납매출 Update */
							sqlMapClient.queryForObject("prePaymentDtl.salesPrpt0109", mapCursor);
							nPrpt0109Success = Integer.parseInt((mapCursor.get("successCode") + ""));
							
							/* 청구스케쥴 Insert */
							sqlMapClient.queryForObject("prePaymentDtl.insertRtsd0109", mapCursor);
							nInsert0109Success = Integer.parseInt((mapCursor.get("successCode") + ""));
							
							if(nPrpt0109Success < 0 || nInsert0109Success < 0) {
								break;
							}
						}
					}
				} else if("middleFullPayment".equals(viewId)) {
					/* 중도완납 저장 */
					DataSetMap dsPymntSchdlAmt = (DataSetMap)mapInDSM.get("ds_pymntSchdlAmt");
					
					if(dsPymntSchdlAmt.size() > 0) {
						mapCnclSave	= dsPymntSchdlAmt.get(0);
						mapResult	= mapCnclSave;
						
						mapCnclSave.put("regId", mapInVar.get("regId"));
						
						sqlMapClient.queryForObject("middleFullPayment.saveMiddleFullPayment", mapCnclSave);
						nSuccessCnclSave = Integer.parseInt((mapCnclSave.get("successCode") + ""));
						
						/* 중도완납순번 채번 */
						Integer mfpSeq = 0;
						getSqlMapClientTemplate().queryForObject("middleFullPayment.get0230MfpSeq", mapInVar);
						mfpSeq = (Integer)(mapInVar.get("mfpSeq") == null ? "" : mapInVar.get("mfpSeq"));
						
						mapMidList	= dsPymntSchdlAmt.get(0);
						mapResult	= mapMidList;
						
						mapMidList.put("mfpSeq",  mfpSeq);
						mapMidList.put("recvSeq", recvSeq);
						mapMidList.put("regId",	  mapInVar.get("regId"));
						
						sqlMapClient.queryForObject("middleFullPayment.saveMidFullPymntList", mapMidList);
						nSuccessMidList = Integer.parseInt((mapMidList.get("successCode") + ""));
					}
				}
				
				mapSave	  = dsCrdImmWthdrMst.get(0);
				mapResult = mapSave;
				mapSave.put("rcrdSeq", rcrdSeq);
				mapSave.put("recvSeq", recvSeq);
				mapSave.put("regId", mapInVar.get("regId"));
				
				sqlMapClient.queryForObject("paymentComm.saveCrdImmWthdrMst", mapSave);
				nMstSuccess = Integer.parseInt((mapSave.get("successCode") + ""));
				
				if(dsCrdImmWthdrDtl != null && dsCrdImmWthdrDtl.size() > 0) {
					for(int i = 0; i < dsCrdImmWthdrDtl.size(); i++) {
						mapRowSave = dsCrdImmWthdrDtl.get(i);
						mapResult  = mapRowSave;
						
						mapRowSave.put("rcrdSeq", rcrdSeq);
						mapRowSave.put("custNo",  mapSave.get("custNo"));
						mapRowSave.put("tordNo",  mapSave.get("tordNo"));
						mapRowSave.put("zfbdt",	  mapRowSave.get("zfbDay"));
						mapRowSave.put("regId",	  mapInVar.get("regId"));
						
						sqlMapClient.queryForObject("paymentComm.saveCrdImmWthdrDtl", mapRowSave);
						nDtlSuccess = Integer.parseInt((mapRowSave.get("successCode") + ""));
						
						if(nDtlSuccess < 0) {
							break;
						}
					}
				}
				
				mapCrdSave = dsCrdInfo.get(0);
				mapResult  = mapCrdSave;
				
				mapCrdSave.put("regId", mapInVar.get("regId"));
				
				sqlMapClient.queryForObject("paymentComm.saveCrdImmWthdrCrd", mapCrdSave);
				nCrdSuccess = Integer.parseInt((mapCrdSave.get("successCode") + ""));
				
				mapRcrdSave	= dsCrdImmWthdrMst.get(0);
				mapResult	= mapRcrdSave;
				
				sqlMapClient.queryForObject("paymentComm.createRcrdReceive", mapRcrdSave);
				nRcrdSuccess = Integer.parseInt((mapRcrdSave.get("successCode") + ""));
				
				if("middleFullPayment".equals(viewId)) {
					mapPrtClearSave	= dsCrdImmWthdrMst.get(0);
					mapResult		= mapPrtClearSave;
					
					mapPrtClearSave.put("regId", mapInVar.get("regId"));
					mapPrtClearSave.put("ordNo", mapPrtClearSave.get("tordNo"));
					
					sqlMapClient.queryForObject("middleFullPayment.getSeq0035", mapPrtClearSave);
					
					List li = (List)mapPrtClearSave.get("vcursor");
					
					if(li.size() > 0) {
						Map<String, Object> liMap = (Map<String, Object>)li.get(0);
						mapPrtClearSave.put("rcrdDay", liMap.get("rcrdDay"));
						mapPrtClearSave.put("recvSeq", liMap.get("recvSeq"));
						mapPrtClearSave.put("ritmSeq", liMap.get("ritmSeq"));
						mapPrtClearSave.put("type",	   "A");
						
						sqlMapClient.queryForObject("middleFullPayment.crdPartClear", mapPrtClearSave);
						nSuccessPrtClear = Integer.parseInt((mapPrtClearSave.get("successCode") + ""));
					}
				}
			}
			
			if(	  nMstSuccess		 == 0
			   && nDtlSuccess		 == 0
			   && nCrdSuccess		 == 0
			   && nSuccessPrtClear	 == 0
			   && nRcrdSuccess		 == 0
			   && nSuccessSchdlMst	 == 0
			   && nSuccessSchdlDtl	 == 0
			   && nPrpt0109Success	 == 0
			   && nInsert0109Success == 0
			   && nSuccessCnclSave	 == 0
			   && nSuccessMidList	 == 0
			  ) {
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
		
		return mapResult;
	}
	
	/**
	 * 카드즉시출금결제이력 저장
	 * @param	mapInDSM
	 * @param	mapInVar
	 * @return	Map
	 * @throws	NtRmsDaoException
	 * @throws	Exception
	 */
	public Map<String, Object> saveCardPaymentHst(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws NtRmsDaoException, Exception {
		int nSuccess = 0;
		Map<String, Object> mapRowSave = null;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();							/* Transaction 시작			*/
		sqlMapClient.getCurrentConnection().setAutoCommit(false);	/* autoCommit 설정 변경		*/
		sqlMapClient.commitTransaction();							/* autoCommit의 설정 Commit	*/
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap dsCardPaymentHst = (DataSetMap)mapInDSM.get("ds_cardPaymentHst");
			
			if(dsCardPaymentHst.size() > 0) {
				/* 수납일련번호 채번 */
				Integer rcrdSeq = 0;
				getSqlMapClientTemplate().queryForObject("paymentComm.get0200HstRcrdSeq", mapInVar);
				rcrdSeq = (Integer)(mapInVar.get("rcrdSeq") == null ? "" : mapInVar.get("rcrdSeq"));
				
				for(int i = 0; i < dsCardPaymentHst.size(); i++) {
					mapRowSave = dsCardPaymentHst.get(i);
					
					mapRowSave.put("rcrdSeq", rcrdSeq);
					mapRowSave.put("regId",	  mapInVar.get("regId"));
					
					sqlMapClient.queryForObject("paymentComm.saveCardPaymentHst", mapRowSave);
					
					nSuccess = Integer.parseInt((mapRowSave.get("successCode") + ""));
					
					if(nSuccess < 0) {
						break;
					}
				}
			}
			
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
	 * 카드즉시출금취소 저장
	 * @param	mapInDSM
	 * @param	mapInVar
	 * @return	Map
	 * @throws	NtRmsDaoException
	 * @throws	Exception
	 */
	@SuppressWarnings("rawtypes")
	public Map<String, Object> saveCrdImmWthdrCancel(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws NtRmsDaoException, Exception {
		String viewId = (String)mapInVar.get("viewId");
		
		int nMstSuccess		   = 0;
		int nRcrdSuccess	   = 0;
		int nExOCSuccess	   = 0;
		int nPrpt0160Success   = 0;
		int nPrpt0109Success   = 0;
		int nInsert0109Success = 0;
		
		Map mapResult						= null;
		Map<String, Object> mapSave			= null;
		Map<String, Object> mapExOCSave		= null;
		Map<String, Object> mapPrpt0160Save	= null;
		Map<String, Object> mapPreSave		= null;
		Map<String, Object> mapRowSave		= null;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();							/* Transaction 시작			*/
		sqlMapClient.getCurrentConnection().setAutoCommit(false);	/* autoCommit 설정 변경		*/
		sqlMapClient.commitTransaction();							/* autoCommit의 설정 Commit	*/
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap dsCrdImmWthdrMst	= (DataSetMap)mapInDSM.get("ds_crdImmWthdrMst");
			
			if(dsCrdImmWthdrMst.size() > 0) {
				mapSave	  = dsCrdImmWthdrMst.get(0);
				mapResult = mapSave;
				
				if("prePayment".equals(viewId) || "middleFullPayment".equals(viewId)) {
					/* 선납할인 / 중도완납 */
					mapExOCSave = mapInVar;
					mapResult = mapExOCSave;
					
					sqlMapClient.queryForObject("collectionMoney.cancelExOContract", mapInVar);
					nExOCSuccess = Integer.parseInt((mapExOCSave.get("successCode") + ""));
					
					mapSave.put("recvSeq", mapInVar.get("recvSeq"));
				}
				
				if(mapInVar.get("cncRseq") == null) {
					Integer cncRseq = 0;
					getSqlMapClientTemplate().queryForObject("paymentComm.getCncRSeq", mapSave);
					cncRseq = (Integer)(mapSave.get("cncRseq") == null ? "" : mapSave.get("cncRseq"));
					mapSave.put("cncRseq", cncRseq);
				} else {
					mapSave.put("cncRseq", mapInVar.get("cncRseq"));
				}
				
				mapSave.put("chgId",   mapInVar.get("regId"));
				mapSave.put("regId",   mapInVar.get("regId"));
				
				sqlMapClient.queryForObject("paymentComm.saveCrdImmWthdrCancel", mapSave);
				nMstSuccess = Integer.parseInt((mapSave.get("successCode") + ""));
				
				if("prePayment".equals(viewId)) {
					/* 선납할인 */
					mapPrpt0160Save = dsCrdImmWthdrMst.get(0);
					mapResult = mapPrpt0160Save;
					
					mapPrpt0160Save.put("prptSeq", mapInVar.get("prptSeq"));
					mapPrpt0160Save.put("regId", mapInVar.get("regId"));
					
					sqlMapClient.queryForObject("prePaymentDtl.cancelPrpt0160", mapPrpt0160Save);
					nPrpt0160Success = Integer.parseInt((mapPrpt0160Save.get("successCode") + ""));
					
					mapPreSave = dsCrdImmWthdrMst.get(0);
					mapPreSave.put("prptSeq", mapInVar.get("prptSeq"));
					
					/* 선납 취소 Update Data 조회 */
					sqlMapClient.queryForObject("prePaymentDtl.prePymntCancelList", mapPreSave);
					
					List li = (List)mapPreSave.get("vcursor");
					int cnt = 0;
					
					for(int i = 0; i < li.size(); i++) {
						mapRowSave = (Map<String, Object>)li.get(i);
						cnt = Integer.parseInt(mapRowSave.get("schdSeqI").toString()) + i;
						mapRowSave.put("schdSeqI", cnt);
						mapRowSave.put("regId", mapInVar.get("regId"));
						
						/* 선납매출 Update */
						sqlMapClient.queryForObject("prePaymentDtl.salesPrpt0109", mapRowSave);
						nPrpt0109Success = Integer.parseInt((mapRowSave.get("successCode") + ""));
						
						/* 청구스케쥴 Insert */
						sqlMapClient.queryForObject("prePaymentDtl.insertRtsd0109", mapRowSave);
						nInsert0109Success = Integer.parseInt((mapRowSave.get("successCode") + ""));
						
						if(nPrpt0109Success < 0 || nInsert0109Success < 0) {
							break;
						}
					}
				}
				
				if(!"Y".equals(mapSave.get("refundYn"))) {
					sqlMapClient.queryForObject("paymentComm.createRcrdReceive", mapSave);
					nRcrdSuccess = Integer.parseInt((mapSave.get("successCode") + ""));
				}
			}
			
			if(	  nMstSuccess		 == 0
			   && nRcrdSuccess		 == 0
			   && nExOCSuccess		 == 0
			   && nPrpt0160Success	 == 0
			   && nPrpt0109Success	 == 0
			   && nInsert0109Success == 0
			  ) {
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
		
		return mapResult;
	}
	
	/**
	 * 카드즉시출금취소이력 저장
	 * @param	mapInDSM
	 * @param	mapInVar
	 * @return	Map
	 * @throws	NtRmsDaoException
	 * @throws	Exception
	 */
	public Map<String, Object> saveCardCancelHst(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws NtRmsDaoException, Exception {
		int nSuccess = 0;
		Map<String, Object> mapRowSave = null;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();							/* Transaction 시작			*/
		sqlMapClient.getCurrentConnection().setAutoCommit(false);	/* autoCommit 설정 변경		*/
		sqlMapClient.commitTransaction();							/* autoCommit의 설정 Commit	*/
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap dsCardCancelHst = (DataSetMap)mapInDSM.get("ds_cardCancelHst");
			
			if(dsCardCancelHst.size() > 0) {
				/* 거래취소순번 채번 */
				Integer cncSeq = 0;
				String tno = (String)dsCardCancelHst.get(0).get("tno");
				mapInVar.put("tno", tno);
				
				getSqlMapClientTemplate().queryForObject("paymentComm.get0200HstCncSeq", mapInVar);
				cncSeq = (Integer)(mapInVar.get("cncSeq") == null ? "" : mapInVar.get("cncSeq"));
				
				mapRowSave = dsCardCancelHst.get(0);
				
				mapRowSave.put("cncSeq", cncSeq);
				mapRowSave.put("regId",	 mapInVar.get("regId"));
				
				sqlMapClient.queryForObject("paymentComm.saveCardCancelHst", mapRowSave);
				
				nSuccess = Integer.parseInt((mapRowSave.get("successCode") + ""));
			}
			
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
	 * 계좌즉시출금결제 저장
	 * @param	mapInDSM
	 * @param	mapInVar
	 * @return	Map
	 * @throws	NtRmsDaoException
	 * @throws	Exception
	 */
	@SuppressWarnings("rawtypes")
	public Map<String, Object> saveAccImmWthdrPayment(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws NtRmsDaoException, Exception {
		String viewId = (String)mapInVar.get("viewId");
		
		int nMstSuccess		   = 0;
		int nDtlSuccess		   = 0;
		int nAccSuccess		   = 0;
		int nSuccessPrtClear   = 0;
		int nRactSuccess	   = 0;
		int nSuccessSchdlMst   = 0;
		int nSuccessSchdlDtl   = 0;
		int nPrpt0109Success   = 0;
		int nInsert0109Success = 0;
		int nSuccessCnclSave   = 0;
		int nSuccessMidList	   = 0;
		
		Map mapResult						= null;
		Map<String, Object> mapSave			= null;
		Map<String, Object> mapRowSave		= null;
		Map<String, Object> mapAccSave		= null;
		Map<String, Object> mapPrtClearSave	= null;
		Map<String, Object> mapRactSave		= null;
		Map<String, Object> mapSchdMstSave	= null;
		Map<String, Object> mapSchdDtlSave	= null;
		Map<String, Object> mapPreSave		= null;
		Map<String, Object> mapCursor		= null;
		Map<String, Object> mapCnclSave		= null;
		Map<String, Object> mapMidList		= null;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();							/* Transaction 시작			*/
		sqlMapClient.getCurrentConnection().setAutoCommit(false);	/* autoCommit 설정 변경		*/
		sqlMapClient.commitTransaction();							/* autoCommit의 설정 Commit	*/
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap dsAccImmWthdrMst	= (DataSetMap)mapInDSM.get("ds_accImmWthdrMst");
			DataSetMap dsAccImmWthdrDtl	= (DataSetMap)mapInDSM.get("ds_accImmWthdrDtl");
			DataSetMap dsAccInfo		= (DataSetMap)mapInDSM.get("ds_accInfo");
			
			if(dsAccImmWthdrMst.size() > 0) {
				/* 수납일련번호 채번 */
				Integer ractSeq = 0;
				Integer recvSeq = 0;
				
				getSqlMapClientTemplate().queryForObject("paymentComm.get0210RactSeq", mapInVar);
				ractSeq = (Integer)(mapInVar.get("ractSeq") == null ? "" : mapInVar.get("ractSeq"));
				
				/* 수납거래번호 없으면 채번 */
				if(dsAccImmWthdrMst.get(0).get("recvSeq") == null || "".equals(dsAccImmWthdrMst.get(0).get("recvSeq"))) {
					getSqlMapClientTemplate().queryForObject("paymentComm.get0041RecvSeq", mapInVar);
					recvSeq = (Integer)(mapInVar.get("recvSeq") == null ? "" : mapInVar.get("recvSeq"));
				}
				
				if("prePayment".equals(viewId)) {
					DataSetMap dsPymntSchdlMstList = (DataSetMap)mapInDSM.get("ds_pymntSchdlMstList");
					DataSetMap dsPymntSchdlDtlList = (DataSetMap)mapInDSM.get("ds_pymntSchdlDtlList");
					
					if(dsPymntSchdlDtlList.size() > 0) {
						/* 선납할인 저장 */
						
						/* 선납요청일련번호 채번 */
						Integer prptSeq = 0;
						
						getSqlMapClientTemplate().queryForObject("prePayment.get0160PrptSeq", mapInVar);
						prptSeq = (Integer)(mapInVar.get("prptSeq") == null ? "" : mapInVar.get("prptSeq"));
						
						mapSchdMstSave = dsPymntSchdlMstList.get(0);
						mapResult	   = mapSchdMstSave;
						
						mapSchdMstSave.put("prptSeq", prptSeq);
						
						/* 가상계좌 제외 */
						if(!"P5".equals(mapSchdMstSave.get("recpPay"))) {
							mapSchdMstSave.put("recvSeq", recvSeq);
						}
						
						mapSchdMstSave.put("regId", mapInVar.get("regId"));
						
						sqlMapClient.queryForObject("prePayment.savePrePaymentMst", mapSchdMstSave);
						nMstSuccess = Integer.parseInt((mapSchdMstSave.get("successCode") + ""));
						
						for(int i = 0; i < dsPymntSchdlDtlList.size(); i++) {
							mapSchdDtlSave = dsPymntSchdlDtlList.get(i);
							mapResult	   = mapSchdDtlSave;
							
							mapSchdDtlSave.put("prptSeq", prptSeq);
							mapSchdDtlSave.put("regId",	  mapInVar.get("regId"));
							
							sqlMapClient.queryForObject("prePayment.savePrePaymentDtl", mapSchdDtlSave);
							nSuccessSchdlDtl = Integer.parseInt((mapSchdDtlSave.get("successCode") + ""));
							
							if(nSuccessSchdlDtl < 0) {
								break;
							}
							
							mapPreSave = dsPymntSchdlDtlList.get(i);
							mapResult = mapPreSave;
							
							mapPreSave.put("prptSeq", mapInVar.get("prptSeq"));
							
							/* 선납 Update Data 조회 */
							sqlMapClient.queryForObject("prePayment.prePymntUpdateList", mapPreSave);
							
							List li = (List)mapPreSave.get("vcursor");
							mapCursor = (Map<String, Object>)li.get(0);
							mapCursor.put("regId", mapInVar.get("regId"));
							
							/* 선납매출 Update */
							sqlMapClient.queryForObject("prePaymentDtl.salesPrpt0109", mapCursor);
							nPrpt0109Success = Integer.parseInt((mapCursor.get("successCode") + ""));
							
							/* 청구스케쥴 Insert */
							sqlMapClient.queryForObject("prePaymentDtl.insertRtsd0109", mapCursor);
							nInsert0109Success = Integer.parseInt((mapCursor.get("successCode") + ""));
							
							if(nPrpt0109Success < 0 || nInsert0109Success < 0) {
								break;
							}
						}
					}
				} else if("middleFullPayment".equals(viewId)) {
					/* 중도완납 저장 */
					DataSetMap dsPymntSchdlAmt = (DataSetMap)mapInDSM.get("ds_pymntSchdlAmt");
					
					if(dsPymntSchdlAmt.size() > 0) {
						mapCnclSave	= dsPymntSchdlAmt.get(0);
						mapResult	= mapCnclSave;
						
						mapCnclSave.put("regId", mapInVar.get("regId"));
						
						sqlMapClient.queryForObject("middleFullPayment.saveMiddleFullPayment", mapCnclSave);
						nSuccessCnclSave = Integer.parseInt((mapCnclSave.get("successCode") + ""));
						
						/* 중도완납순번 채번 */
						Integer mfpSeq = 0;
						getSqlMapClientTemplate().queryForObject("middleFullPayment.get0230MfpSeq", mapInVar);
						mfpSeq = (Integer)(mapInVar.get("mfpSeq") == null ? "" : mapInVar.get("mfpSeq"));
						
						mapMidList	= dsPymntSchdlAmt.get(0);
						mapResult	= mapMidList;
						
						mapMidList.put("mfpSeq",  mfpSeq);
						mapMidList.put("recvSeq", recvSeq);
						mapMidList.put("regId",	  mapInVar.get("regId"));
						
						sqlMapClient.queryForObject("middleFullPayment.saveMidFullPymntList", mapMidList);
						nSuccessMidList = Integer.parseInt((mapMidList.get("successCode") + ""));
					}
				}
				
				mapSave	  = dsAccImmWthdrMst.get(0);
				mapResult = mapSave;
				
				mapSave.put("ractSeq", ractSeq);
				mapSave.put("recvSeq", recvSeq);
				mapSave.put("regId", mapInVar.get("regId"));
				
				Integer pOidSeq = 0;
				
				getSqlMapClientTemplate().queryForObject("paymentComm.get0210POidSeq", mapSave);
				pOidSeq = (Integer)(mapSave.get("pOidSeq") == null ? "" : mapSave.get("pOidSeq"));
				mapSave.put("pOidSeq", pOidSeq);
				
				sqlMapClient.queryForObject("paymentComm.saveAccImmWthdrMst", mapSave);
				nMstSuccess = Integer.parseInt((mapSave.get("successCode") + ""));
				
				if(dsAccImmWthdrDtl != null && dsAccImmWthdrDtl.size() > 0) {
					for(int i = 0; i < dsAccImmWthdrDtl.size(); i++) {
						mapRowSave = dsAccImmWthdrDtl.get(i);
						mapResult  = mapRowSave;
						
						mapRowSave.put("ractSeq", ractSeq);
						mapRowSave.put("custNo",  mapSave.get("custNo"));
						mapRowSave.put("tordNo",  mapSave.get("tordNo"));
						mapRowSave.put("zfbdt",	  mapRowSave.get("zfbDay"));
						mapRowSave.put("regId",	  mapInVar.get("regId"));
						
						sqlMapClient.queryForObject("paymentComm.saveAccImmWthdrDtl", mapRowSave);
						nDtlSuccess = Integer.parseInt((mapRowSave.get("successCode") + ""));
						
						if(nDtlSuccess < 0) {
							break;
						}
					}
				}
				
				mapAccSave = dsAccInfo.get(0);
				mapResult  = mapAccSave;
				
				mapAccSave.put("regId", mapInVar.get("regId"));
				
				sqlMapClient.queryForObject("paymentComm.saveAccImmWthdrAcc", mapAccSave);
				nAccSuccess = Integer.parseInt((mapAccSave.get("successCode") + ""));
				
				mapRactSave	= dsAccImmWthdrMst.get(0);
				mapResult	= mapRactSave;
				
				sqlMapClient.queryForObject("paymentComm.createRactReceive", mapRactSave);
				nRactSuccess = Integer.parseInt((mapRactSave.get("successCode") + ""));
				
				if("middleFullPayment".equals(viewId)) {
					mapPrtClearSave	= dsAccImmWthdrMst.get(0);
					mapResult		= mapPrtClearSave;
					
					mapPrtClearSave.put("regId", mapInVar.get("regId"));
					mapPrtClearSave.put("ordNo", mapPrtClearSave.get("tordNo"));
					
					sqlMapClient.queryForObject("middleFullPayment.getSeq0035", mapPrtClearSave);
					
					List li = (List)mapPrtClearSave.get("vcursor");
					
					if(li.size() > 0) {
						Map<String, Object> liMap = (Map<String, Object>)li.get(0);
						mapPrtClearSave.put("rcrdDay", liMap.get("rcrdDay"));
						mapPrtClearSave.put("recvSeq", liMap.get("recvSeq"));
						mapPrtClearSave.put("ritmSeq", liMap.get("ritmSeq"));
						mapPrtClearSave.put("type",	   "A");
						
						sqlMapClient.queryForObject("middleFullPayment.accPartClear", mapPrtClearSave);
						nSuccessPrtClear = Integer.parseInt((mapPrtClearSave.get("successCode") + ""));
					}
				}
			}
			
			if(	  nMstSuccess		 == 0
			   && nDtlSuccess		 == 0
			   && nAccSuccess		 == 0
			   && nSuccessPrtClear	 == 0
			   && nRactSuccess		 == 0
			   && nSuccessSchdlMst	 == 0
			   && nSuccessSchdlDtl	 == 0
			   && nPrpt0109Success	 == 0
			   && nInsert0109Success == 0
			   && nSuccessCnclSave	 == 0
			   && nSuccessMidList	 == 0
			  ) {
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
		
		return mapResult;
	}
	
	/**
	 * 계좌즉시출금결제이력 저장
	 * @param	mapInDSM
	 * @param	mapInVar
	 * @return	Map
	 * @throws	NtRmsDaoException
	 * @throws	Exception
	 */
	public Map<String, Object> saveAccImmWthdrPaymentHst(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws NtRmsDaoException, Exception {
		int nSuccess = 0;
		
		Map<String, Object> mapSave = null;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();							/* Transaction 시작			*/
		sqlMapClient.getCurrentConnection().setAutoCommit(false);	/* autoCommit 설정 변경		*/
		sqlMapClient.commitTransaction();							/* autoCommit의 설정 Commit	*/
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap dsAccPaymentHst = (DataSetMap)mapInDSM.get("ds_accPaymentHst");
			
			if(dsAccPaymentHst.size() > 0) {
				/* 수납일련번호 채번 */
				Integer reqSeq = 0;
				mapSave = dsAccPaymentHst.get(0);
				
				getSqlMapClientTemplate().queryForObject("paymentComm.get0210HstReqSeq", mapSave);
				reqSeq = (Integer)(mapSave.get("reqSeq") == null ? "" : mapSave.get("reqSeq"));
				
				mapSave.put("reqSeq", reqSeq);
				mapSave.put("regId",  mapInVar.get("regId"));
				
				sqlMapClient.queryForObject("paymentComm.saveAccPaymentHst", mapSave);
				nSuccess = Integer.parseInt((mapSave.get("successCode") + ""));
			}
			
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
		
		return mapSave;
	}
	
	/**
	 * 계좌즉시출금취소 저장
	 * @param	mapInDSM
	 * @param	mapInVar
	 * @return	Map
	 * @throws	NtRmsDaoException
	 * @throws	Exception
	 */
	@SuppressWarnings("rawtypes")
	public Map<String, Object> saveAccImmWthdrCancel(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws NtRmsDaoException, Exception {
		String viewId = (String)mapInVar.get("viewId");
		
		int nMstSuccess		   = 0;
		int nRactSuccess	   = 0;
		int nExOCSuccess	   = 0;
		int nPrpt0160Success   = 0;
		int nPreSuccess		   = 0;
		int nPrpt0109Success   = 0;
		int nInsert0109Success = 0;
		
		Map mapResult						= null;
		Map<String, Object> mapSave			= null;
		Map<String, Object> mapExOCSave		= null;
		Map<String, Object> mapPrpt0160Save	= null;
		Map<String, Object> mapPreSave		= null;
		Map<String, Object> mapRowSave		= null;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();							/* Transaction 시작			*/
		sqlMapClient.getCurrentConnection().setAutoCommit(false);	/* autoCommit 설정 변경		*/
		sqlMapClient.commitTransaction();							/* autoCommit의 설정 Commit	*/
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap dsAccImmWthdrMst	= (DataSetMap)mapInDSM.get("ds_accImmWthdrMst");
			
			if(dsAccImmWthdrMst.size() > 0) {
				mapSave	  = dsAccImmWthdrMst.get(0);
				mapResult = mapSave;
				
				if("prePayment".equals(viewId) || "middleFullPayment".equals(viewId)) {
					/* 선납할인 / 중도완납 */
					mapExOCSave = mapInVar;
					mapResult = mapExOCSave;
					
					sqlMapClient.queryForObject("collectionMoney.cancelExOContract", mapInVar);
					nExOCSuccess = Integer.parseInt((mapExOCSave.get("successCode") + ""));
					
					mapSave.put("recvSeq", mapInVar.get("recvSeq"));
					
				}
				
				if(mapInVar.get("cncRseq") == null) {
					Integer cncRseq = 0;
					getSqlMapClientTemplate().queryForObject("paymentComm.getCncRSeq", mapSave);
					cncRseq = (Integer)(mapSave.get("cncRseq") == null ? "" : mapSave.get("cncRseq"));
					mapSave.put("cncRseq", cncRseq);
				} else {
					mapSave.put("cncRseq", mapInVar.get("cncRseq"));
				}
				
				mapSave.put("chgId", mapInVar.get("regId"));
				mapSave.put("regId", mapInVar.get("regId"));
				
				sqlMapClient.queryForObject("paymentComm.saveAccImmWthdrCancel", mapSave);
				nMstSuccess = Integer.parseInt((mapSave.get("successCode") + ""));
				
				if("prePayment".equals(viewId)) {
					/* 선납할인 */
					mapPrpt0160Save = dsAccImmWthdrMst.get(0);
					mapResult = mapPrpt0160Save;
					
					mapPrpt0160Save.put("prptSeq", mapInVar.get("prptSeq"));
					mapPrpt0160Save.put("regId", mapInVar.get("regId"));
					
					sqlMapClient.queryForObject("prePaymentDtl.cancelPrpt0160", mapPrpt0160Save);
					nPrpt0160Success = Integer.parseInt((mapPrpt0160Save.get("successCode") + ""));
					
					mapPreSave = dsAccImmWthdrMst.get(0);
					mapResult = mapPreSave;
					
					mapPreSave.put("prptSeq", mapInVar.get("prptSeq"));
					
					sqlMapClient.queryForObject("prePaymentDtl.prePymntCancelList", mapPreSave);
					nPreSuccess = Integer.parseInt((mapPreSave.get("successCode") + ""));
					
					List li = (List)mapPreSave.get("vcursor");
					int cnt = 0;
					
					for(int i = 0; i < li.size(); i++) {
						mapRowSave = (Map<String, Object>)li.get(i);
						cnt = Integer.parseInt(mapRowSave.get("schdSeqI").toString()) + i;
						mapRowSave.put("schdSeqI", cnt);
						mapRowSave.put("regId", mapInVar.get("regId"));
						
						sqlMapClient.queryForObject("prePaymentDtl.salesPrpt0109", mapRowSave);
						nPrpt0109Success = Integer.parseInt((mapRowSave.get("successCode") + ""));
						
						sqlMapClient.queryForObject("prePaymentDtl.insertRtsd0109", mapRowSave);
						nInsert0109Success = Integer.parseInt((mapRowSave.get("successCode") + ""));
						
						if(nPrpt0109Success < 0 || nInsert0109Success < 0) {
							break;
						}
					}
				}
				
				if(!"Y".equals(mapSave.get("refundYn"))) {
					sqlMapClient.queryForObject("paymentComm.createRactReceive", mapSave);
					nRactSuccess = Integer.parseInt((mapSave.get("successCode") + ""));
				}
			}
			
			if(	  nMstSuccess		 == 0
			   && nRactSuccess		 == 0
			   && nExOCSuccess		 == 0
			   && nPrpt0160Success	 == 0
			   && nPreSuccess		 == 0
			   && nPrpt0109Success	 == 0
			   && nInsert0109Success == 0
			  ) {
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
		
		return mapResult;
	}
	
	/**
	 * 계좌즉시출금취소이력 저장
	 * @param	mapInDSM
	 * @param	mapInVar
	 * @return	Map
	 * @throws	NtRmsDaoException
	 * @throws	Exception
	 */
	public Map<String, Object> saveAccCancelHst(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws NtRmsDaoException, Exception {
		int nSuccess = 0;
		
		Map<String, Object> mapSave = null;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();							/* Transaction 시작			*/
		sqlMapClient.getCurrentConnection().setAutoCommit(false);	/* autoCommit 설정 변경		*/
		sqlMapClient.commitTransaction();							/* autoCommit의 설정 Commit	*/
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap dsAccCancelHst = (DataSetMap)mapInDSM.get("ds_accCancelHst");
			
			if(dsAccCancelHst.size() > 0) {
				/* 거래취소번호 채번 */
				Integer cncSeq = 0;
				String tno = (String)dsAccCancelHst.get(0).get("tno");
				mapInVar.put("tno", tno);
				
				getSqlMapClientTemplate().queryForObject("paymentComm.get0210HstCncSeq", mapInVar);
				cncSeq = (Integer)(mapInVar.get("cncSeq") == null ? "" : mapInVar.get("cncSeq"));
				
				mapSave = dsAccCancelHst.get(0);
				
				mapSave.put("cncSeq", cncSeq);
				mapSave.put("regId",  mapInVar.get("regId"));
				
				sqlMapClient.queryForObject("paymentComm.saveAccCancelHst", mapSave);
				
				nSuccess = Integer.parseInt((mapSave.get("successCode") + ""));
			}
			
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
		
		return mapSave;
	}
	
	/**
	 * 카드선수납처리
	 * @param	mapInDSM
	 * @param	mapInVar
	 * @return	Map
	 * @throws	NtRmsDaoException
	 * @throws	Exception
	 */
	@SuppressWarnings("rawtypes")
	public Map<String, Object> crdPartClear(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws NtRmsDaoException, Exception {
		int nSuccessPrtClear = 0;
		
		Map mapResult				   = null;
		Map<String, Object> mapSave	   = null;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();							/* Transaction 시작			*/
		sqlMapClient.getCurrentConnection().setAutoCommit(false);	/* autoCommit 설정 변경		*/
		sqlMapClient.commitTransaction();							/* autoCommit의 설정 Commit	*/
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap dsCrdImmWthdrMst	= (DataSetMap)mapInDSM.get("ds_crdImmWthdrMst");
			
			if(dsCrdImmWthdrMst.size() > 0) {
				mapSave	= dsCrdImmWthdrMst.get(0);
				mapResult	= mapSave;
				
				mapSave.put("regId", mapInVar.get("regId"));
				mapSave.put("ordNo", mapSave.get("tordNo"));
				
				sqlMapClient.queryForObject("middleFullPayment.getSeq0035", mapSave);
				
				List li = (List)mapSave.get("vcursor");
				
				if(li.size() > 0) {
					Map<String, Object> liMap = (Map<String, Object>)li.get(0);
					mapSave.put("rcrdDay", liMap.get("rcrdDay"));
					mapSave.put("recvSeq", liMap.get("recvSeq"));
					mapSave.put("ritmSeq", liMap.get("ritmSeq"));
					mapSave.put("type",	   "A");
					
					sqlMapClient.queryForObject("middleFullPayment.crdPartClear", mapSave);
					nSuccessPrtClear = Integer.parseInt((mapSave.get("successCode") + ""));
				}
			}
			
			if( nSuccessPrtClear == 0) {
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
		
		return mapResult;
	}
	
	/**
	 * 계좌선수납처리
	 * @param	mapInDSM
	 * @param	mapInVar
	 * @return	Map
	 * @throws	NtRmsDaoException
	 * @throws	Exception
	 */
	@SuppressWarnings("rawtypes")
	public Map<String, Object> accPartClear(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws NtRmsDaoException, Exception {
		int nSuccessPrtClear = 0;
		
		Map mapResult				   = null;
		Map<String, Object> mapSave	   = null;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();							/* Transaction 시작			*/
		sqlMapClient.getCurrentConnection().setAutoCommit(false);	/* autoCommit 설정 변경		*/
		sqlMapClient.commitTransaction();							/* autoCommit의 설정 Commit	*/
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap dsAccImmWthdrMst	= (DataSetMap)mapInDSM.get("ds_accImmWthdrMst");
			
			if(dsAccImmWthdrMst.size() > 0) {
				mapSave	= dsAccImmWthdrMst.get(0);
				mapResult	= mapSave;
				
				mapSave.put("regId", mapInVar.get("regId"));
				mapSave.put("ordNo", mapSave.get("tordNo"));
				
				sqlMapClient.queryForObject("middleFullPayment.getSeq0035", mapSave);
				
				List li = (List)mapSave.get("vcursor");
				
				if(li.size() > 0) {
					Map<String, Object> liMap = (Map<String, Object>)li.get(0);
					mapSave.put("ractDay", liMap.get("ractDay"));
					mapSave.put("recvSeq", liMap.get("recvSeq"));
					mapSave.put("ritmSeq", liMap.get("ritmSeq"));
					mapSave.put("type",	   "A");
					
					sqlMapClient.queryForObject("middleFullPayment.accPartClear", mapSave);
					nSuccessPrtClear = Integer.parseInt((mapSave.get("successCode") + ""));
				}
			}
			
			if( nSuccessPrtClear == 0) {
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
		
		return mapResult;
	}
	
	/**
	 * 가상계좌발급
	 * @param	mapInDSM
	 * @param	mapInVar
	 * @return	Map
	 * @throws	NtRmsDaoException
	 * @throws	Exception
	 */
	@SuppressWarnings("rawtypes")
	public Map<String, Object> vaccIssued(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws NtRmsDaoException, Exception {
		String viewId = (String)mapInVar.get("viewId");
		
		int nMstSuccess		   = 0;
		int nDtlSuccess		   = 0;
		int nVaccSuccess	   = 0;
		int nSuccessSchdlMst   = 0;
		int nSuccessSchdlDtl   = 0;
		int nPrpt0109Success   = 0;
		int nInsert0109Success = 0;
		
		Map mapResult					   = null;
		Map<String, Object> mapSave		   = null;
		Map<String, Object> mapRowSave	   = null;
		Map<String, Object> vaccMapSave	   = null;
		Map<String, Object> mapSchdMstSave = null;
		Map<String, Object> mapSchdDtlSave = null;
		Map<String, Object> mapPreSave	   = null;
		Map<String, Object> mapCursor	   = null;
		
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();							/* Transaction 시작			*/
		sqlMapClient.getCurrentConnection().setAutoCommit(false);	/* autoCommit 설정 변경		*/
		sqlMapClient.commitTransaction();							/* autoCommit의 설정 Commit	*/
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap vaccMst = (DataSetMap)mapInDSM.get("ds_vaccMst");
			DataSetMap dtlList = (DataSetMap)mapInDSM.get("ds_unpaidList");
			
			if(vaccMst.size() > 0) {
				/* 요청일련번호 채번 */
				Integer rvaSeq	= 0;
				
				getSqlMapClientTemplate().queryForObject("paymentComm.get0220RvaSeq", mapInVar);
				rvaSeq = (Integer)(mapInVar.get("rvaSeq") == null ? "" : mapInVar.get("rvaSeq"));
				
				if("prePayment".equals(viewId)) {
					DataSetMap dsPymntSchdlMstList = (DataSetMap)mapInDSM.get("ds_pymntSchdlMstList");
					DataSetMap dsPymntSchdlDtlList = (DataSetMap)mapInDSM.get("ds_pymntSchdlDtlList");
					
					if(dsPymntSchdlDtlList.size() > 0) {
						/* 선납할인 저장 */
						
						/* 선납요청일련번호 채번 */
						Integer prptSeq = 0;
						
						getSqlMapClientTemplate().queryForObject("prePayment.get0160PrptSeq", mapInVar);
						prptSeq = (Integer)(mapInVar.get("prptSeq") == null ? "" : mapInVar.get("prptSeq"));
						
						mapSchdMstSave = dsPymntSchdlMstList.get(0);
						mapResult	   = mapSchdMstSave;
						
						mapSchdMstSave.put("prptSeq", prptSeq);
						
						mapSchdMstSave.put("regId", mapInVar.get("regId"));
						
						sqlMapClient.queryForObject("prePayment.savePrePaymentMst", mapSchdMstSave);
						nSuccessSchdlMst = Integer.parseInt((mapSchdMstSave.get("successCode") + ""));
						
						for(int i = 0; i < dsPymntSchdlDtlList.size(); i++) {
							mapSchdDtlSave = dsPymntSchdlDtlList.get(i);
							mapResult	   = mapSchdDtlSave;
							
							mapSchdDtlSave.put("prptSeq", prptSeq);
							mapSchdDtlSave.put("regId",	  mapInVar.get("regId"));
							
							sqlMapClient.queryForObject("prePayment.savePrePaymentDtl", mapSchdDtlSave);
							nSuccessSchdlDtl = Integer.parseInt((mapSchdDtlSave.get("successCode") + ""));
							
							if(nSuccessSchdlDtl < 0) {
								break;
							}
							
							/* 가상계좌 제외 */
							if(!"P5".equals(mapSchdMstSave.get("recpPay"))) {
								mapPreSave = dsPymntSchdlDtlList.get(i);
								mapResult = mapPreSave;
								
								mapPreSave.put("prptSeq", mapInVar.get("prptSeq"));
								
								/* 선납 Update Data 조회 */
								sqlMapClient.queryForObject("prePayment.prePymntUpdateList", mapPreSave);
								
								List li = (List)mapPreSave.get("vcursor");
								mapCursor = (Map<String, Object>)li.get(0);
								mapCursor.put("regId", mapInVar.get("regId"));
								
								/* 선납매출 Update */
								sqlMapClient.queryForObject("prePaymentDtl.salesPrpt0109", mapCursor);
								nPrpt0109Success = Integer.parseInt((mapCursor.get("successCode") + ""));
								
								/* 청구스케쥴 Insert */
								sqlMapClient.queryForObject("prePaymentDtl.insertRtsd0109", mapCursor);
								nInsert0109Success = Integer.parseInt((mapCursor.get("successCode") + ""));
								
								if(nPrpt0109Success < 0 || nInsert0109Success < 0) {
									break;
								}
							}
						}
					}
				}
				
				mapSave	  = vaccMst.get(0);
				mapResult = mapSave;
				
				/* 가상계좌번호 추출 */
				String acctNo = "";
				getSqlMapClientTemplate().queryForObject("paymentComm.get0220AcctNo", mapSave);
				acctNo = (String)(mapSave.get("acctNo") == null ? "" : mapSave.get("acctNo"));
				
				mapSave.put("rvaSeq", rvaSeq);
				mapSave.put("acctNo", acctNo);
				mapSave.put("regId",  mapInVar.get("regId"));
				
				sqlMapClient.queryForObject("paymentComm.vaccIssuedMst", mapSave);
				nMstSuccess = Integer.parseInt((mapSave.get("successCode") + "")); 
				
				for(int i = 0; i < dtlList.size(); i++) {
					mapRowSave = dtlList.get(i);
					mapResult  = mapRowSave;
					
					mapRowSave.put("rvaSeq", rvaSeq);
					mapRowSave.put("custNo", mapSave.get("custNo"));
					mapRowSave.put("tordNo", mapSave.get("tordNo"));
					mapRowSave.put("zfbdt",	 mapRowSave.get("zfbDay"));
					mapRowSave.put("regId",	 mapInVar.get("regId"));
					
					sqlMapClient.queryForObject("paymentComm.vaccIssuedDtl", mapRowSave);
					nDtlSuccess = Integer.parseInt((mapRowSave.get("successCode") + ""));
					
					if(nDtlSuccess < 0) {
						break;
					}
				}
				
				vaccMapSave	= mapInVar;
				mapResult	= vaccMapSave;
				
				vaccMapSave.put("bankCd",  mapSave.get("bankCd"));		/* 은행코드		*/
				vaccMapSave.put("acctNo",  acctNo);						/* 가상계좌번호		*/
				vaccMapSave.put("cmfNm",   mapSave.get("dpsNm"));		/* 입금자명		*/
				vaccMapSave.put("trAmt",   mapSave.get("rvaAmt"));		/* 총거래금액		*/
				vaccMapSave.put("trendIl", mapSave.get("expiryAcc"));	/* 입금가능만료일	*/
				vaccMapSave.put("regId",   mapSave.get("regId"));
				
				sqlMapClient.queryForObject("paymentComm.vaccIssued", vaccMapSave);
				nVaccSuccess = Integer.parseInt((vaccMapSave.get("successCode") + ""));
			}
			
			if(	  nMstSuccess	   == 0
			   && nDtlSuccess	   == 0
			   && nVaccSuccess	   == 0
			   && nSuccessSchdlMst == 0
			   && nSuccessSchdlDtl == 0
			   && nPrpt0109Success	 == 0
			   && nInsert0109Success == 0
			  ) {
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
		
		return mapResult;
	}
}
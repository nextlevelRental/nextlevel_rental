package egovframework.ntrms.kr.co.brn.sd.dao;

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

@Repository("rTSDClaimMgmtMapDAO")

public class RTSDClaimMgmtMapDAO extends RtcmAbstractDAO{
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
//	클레임관리 조회
	public List<Map> claimMgmtList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("claimMgmt.List", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
//	클레임관리 고객 조회
	public List<Map> claimMgmtAddList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("claimMgmt.addList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	
//	클레임관리 IUD
	@SuppressWarnings({ "rawtypes" })
	public Map <String, Object> claimMgmtSave(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws NtRmsDaoException, Exception {
		Map mapResult = null;						//최종적으로 반환할 저장결과
		
		Map<String, Object> mapMasterRow = null;
		Map<String, Object> mapDetailRow = null;
		
		int nOkMaster = 0;							
		
		
		// Transaction 을 하나로 묶기위한 처리
		SqlMapClientTemplate sqlTemplate = getSqlMapClientTemplate();
		SqlMapClient sqlMapClient		 = sqlTemplate.getSqlMapClient();
		
		sqlMapClient.startTransaction();   									 	// Transaction 시작
		sqlMapClient.getCurrentConnection().setAutoCommit(false);				// 여기서 autoCommit설정을 변경해준다
		sqlMapClient.commitTransaction();               						// autoCommit의 설정 Commit
		
		try {
			sqlMapClient.startBatch();
			
			DataSetMap dsmMaster = (DataSetMap)mapInDSM.get("ds_claimtList");
			
			////////////////////////////////////
			//클레임관리 저장 진행 //
			////////////////////////////////////
			

			mapMasterRow = dsmMaster.get(0);
			mapResult = mapMasterRow;
						
		

			if (nOkMaster == 0 && dsmMaster.size() != 0) {
				for (int i = 0 ; i < dsmMaster.size() ; i++) {
					mapDetailRow = dsmMaster.get(i);
					mapResult = mapDetailRow;
					
					int rowType = ((Integer) mapDetailRow.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					
					if (rowType != DataSet.ROW_TYPE_NORMAL) {
						// insert / update 결정
						if (rowType == DataSet.ROW_TYPE_INSERTED) {
							if (!mapDetailRow.containsKey("dvsn")) mapDetailRow.put("dvsn", "I");
						} else if (rowType == DataSet.ROW_TYPE_UPDATED) {
							if (!mapDetailRow.containsKey("dvsn")) mapDetailRow.put("dvsn", "U");
						}
						
						// 클레임관리 저장에 필요한 파라미터 세팅
						mapDetailRow.put("regId" , mapInVar.get("regId"));		//생성자
						
						// 클레임관리 저장
						sqlMapClient.queryForObject("claimMgmt.Save", mapDetailRow);
						// 저장결과 확인
						nOkMaster = Integer.parseInt((mapDetailRow.get("successCode") + ""));
						// 한 row라도 저장 오류가 발생하면 exit
						if (nOkMaster < 0) {							
							break;
						}
					}
				}
			}

			// 저장 성공시에만 commit
			if (nOkMaster == 0) {
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
	
}

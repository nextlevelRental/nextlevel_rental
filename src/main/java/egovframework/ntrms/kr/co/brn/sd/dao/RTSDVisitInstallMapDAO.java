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

@SuppressWarnings("unchecked")
@Repository("rTSDVisitInstallMapDAO")
public class RTSDVisitInstallMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 방문장착정보 목록을 조회한다
	 * 
	 * @param mapInVar
	 * @return List
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2018-12-01	wjim		[20181122_01] 신규생성
	 */
	public List <Map> listVisitInstall(Map <String, Object> mapInVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTSDVisitInstallMapDAO.listVisitInstall", mapInVar);
		List listResult = (List)mapInVar.get("vcursor");
		return listResult;
	}
	
	/**
	 * 방문장착정보를 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws NtRmsDaoException
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2018-12-01	wjim		[20181122_01] 신규생성
	 */
	@SuppressWarnings("deprecation")
	public Map <String, Object> saveVisitInstall(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws NtRmsDaoException, Exception {
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
			
			DataSetMap dsmVisitList = (DataSetMap)mapInDSM.get("ds_visitList");
			
			if ( dsmVisitList.size() != 0 ) {
				for( int i = 0 ; i < dsmVisitList.size() ; i++ ) {
					mapRowSave = dsmVisitList.get(i);
					
					int rowType = ((Integer) mapRowSave.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
					
					if ( rowType != DataSet.ROW_TYPE_NORMAL ) {
						
						if (rowType == DataSet.ROW_TYPE_INSERTED) {
							if (!mapRowSave.containsKey("dvsn")) mapRowSave.put("dvsn", "I");
						} else if (rowType == DataSet.ROW_TYPE_UPDATED) {
							if (!mapRowSave.containsKey("dvsn")) mapRowSave.put("dvsn", "U");
						}
						
						mapRowSave.put("regId", mapInVar.get("regId"));
						
						sqlMapClient.queryForObject("rTSDVisitInstallMapDAO.saveVisitInstall", mapRowSave);
						
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
	 * 방문장착 이력정보 목록을 조회한다
	 * 
	 * @param mapInVar
	 * @return List
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2018-12-03	wjim		[20181122_01] 신규생성
	 */
	public List <Map> listVisitInstallLog(Map <String, Object> mapInVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTSDVisitInstallMapDAO.listVisitInstalLog", mapInVar);
		List listResult = (List)mapInVar.get("vcursor");
		return listResult;
	}
	
}

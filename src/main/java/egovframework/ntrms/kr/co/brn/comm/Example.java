package egovframework.ntrms.kr.co.brn.comm;

import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

public abstract class Example extends EgovAbstractDAO {
Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	


	@Resource(name="sqlMapClient")
	public void initDAO(SqlMapClient sqlMapClient) throws NtRmsDaoException{
		setSqlMapClient(sqlMapClient);
	}
	
	@SuppressWarnings("deprecation")
	public SqlMapClientTemplate getSqlMapClientTemplateDAO() throws NtRmsDaoException{
		return this.getSqlMapClientTemplate();
	}
	
	public Map executeDsMap(Map map2) throws NtRmsDaoException, Exception {
		
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
			
			DataSetMap inDsMap = (DataSetMap)map2.get("inDsMap");
			
			for(int i = 0; i<inDsMap.size(); i++) {
				map = inDsMap.get(i);
				int rowType = ((Integer) map.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
				if(rowType == DataSet.ROW_TYPE_INSERTED) {
					map.put("dvsn", "I");
					System.out.println(map);
				} else if(rowType == DataSet.ROW_TYPE_UPDATED) {
					map.put("dvsn", "U");
					System.out.println(map);
				} else if(rowType == DataSet.ROW_TYPE_DELETED) {
					map.put("dvsn", "D");
					System.out.println(map);
				}
				map.put("regId", map2.get("regId"));
				
				sqlMapClient.queryForObject((String)map2.get("sqlnamespace"), map);
				System.out.println(map.get("successCode"));
				success = Integer.parseInt((map.get("successCode") + ""));
				
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

}

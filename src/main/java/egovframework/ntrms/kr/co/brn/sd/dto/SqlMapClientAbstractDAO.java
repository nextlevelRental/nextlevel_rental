package egovframework.ntrms.kr.co.brn.sd.dto;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

public abstract class SqlMapClientAbstractDAO extends  EgovAbstractDAO {
	
	@Resource(name="sqlMapClient")
	public void initDAO(SqlMapClient sqlMapClient) throws NtRmsDaoException{
		setSqlMapClient(sqlMapClient);
	}
	
	@SuppressWarnings("deprecation")
	public SqlMapClientTemplate getSqlMapClientTemplateDAO() throws NtRmsDaoException{
		return this.getSqlMapClientTemplate();
	}
	
	public SqlMapClient getSqlMapClientDAO() throws NtRmsDaoException{
		return this.getSqlMapClientTemplate().getSqlMapClient();
	}
	
	public void startTransaction(boolean autoCommit) throws SQLException{
		this.getSqlMapClientTemplate().getSqlMapClient().startTransaction();   									 	//Transaction 시작
		this.getSqlMapClientTemplate().getSqlMapClient().getCurrentConnection().setAutoCommit(autoCommit);				//여기서 autoCommit설정을 변경해준다
		this.getSqlMapClientTemplate().getSqlMapClient().commitTransaction();
	}
	
	public void startBatch() throws SQLException{
		this.getSqlMapClientTemplate().getSqlMapClient().startBatch();
	}
	
	public void endTransaction() throws SQLException{
		this.getSqlMapClientTemplate().getSqlMapClient().getCurrentConnection().commit();
		this.getSqlMapClientTemplate().getSqlMapClient().executeBatch();
		this.getSqlMapClientTemplate().getSqlMapClient().commitTransaction();
	}
	
	public void rollbackTransaction() throws SQLException{
		this.getSqlMapClientTemplate().getSqlMapClient().getCurrentConnection().rollback();
		this.getSqlMapClientTemplate().getSqlMapClient().executeBatch();
		this.getSqlMapClientTemplate().getSqlMapClient().commitTransaction();
	}
}

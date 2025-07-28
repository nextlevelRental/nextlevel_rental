/**
 * 
 */
package egovframework.ntrms.kr.co.exec.handler.service.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.event.RowHandler;

/**
 * @author 강신규
 *
 */
@Repository
@SuppressWarnings("deprecation")
public class DaoBase extends SqlMapClientDaoSupport {
	
	@Resource(name = "sqlMapClient")
	public void setSuperSqlMapClient(SqlMapClient sqlMapClient) {
		super.setSqlMapClient(sqlMapClient);
	}
	
	public <T> T execute(SqlMapClientCallback<T> action) throws DataAccessException {
		return getSqlMapClientTemplate().execute(action);
	}
	
	public Object queryForObject(String statementName) throws DataAccessException {
		return getSqlMapClientTemplate().queryForObject(statementName);
	}

	public Object queryForObject(final String statementName, final Object parameterObject)
			throws DataAccessException {
		return getSqlMapClientTemplate().queryForObject(statementName, parameterObject);
	}
	
	public Object queryForObject(
			final String statementName, final Object parameterObject, final Object resultObject)
			throws DataAccessException {
		return getSqlMapClientTemplate().queryForObject(statementName, parameterObject, resultObject);
	}
	
	public List queryForList(String statementName) throws DataAccessException {
		return getSqlMapClientTemplate().queryForList(statementName);
	}
	
	public List queryForList(final String statementName, final Object parameterObject)
			throws DataAccessException {
		return getSqlMapClientTemplate().queryForList(statementName, parameterObject);
	}
	
	public List queryForList(String statementName, int skipResults, int maxResults)
			throws DataAccessException {
		return getSqlMapClientTemplate().queryForList(statementName, skipResults, maxResults);
	}
	
	public List queryForList(
			final String statementName, final Object parameterObject, final int skipResults, final int maxResults)
			throws DataAccessException {
		return getSqlMapClientTemplate().queryForList(statementName, parameterObject, skipResults, maxResults);
	}
	
	public void queryWithRowHandler(String statementName, RowHandler rowHandler)
			throws DataAccessException {
		getSqlMapClientTemplate().queryWithRowHandler(statementName, rowHandler);
	}
	
	public void queryWithRowHandler(
			final String statementName, final Object parameterObject, final RowHandler rowHandler)
			throws DataAccessException {
		getSqlMapClientTemplate().queryWithRowHandler(statementName, parameterObject, rowHandler);
		
	}
	
	public Map queryForMap(
			final String statementName, final Object parameterObject, final String keyProperty)
			throws DataAccessException {
		return getSqlMapClientTemplate().queryForMap(statementName, parameterObject, keyProperty);
	}
	
	public Map queryForMap(
			final String statementName, final Object parameterObject, final String keyProperty, final String valueProperty)
			throws DataAccessException {
		return getSqlMapClientTemplate().queryForMap(statementName, parameterObject, keyProperty, valueProperty);
	}
	
	public Object insert(String statementName) throws DataAccessException {
		return getSqlMapClientTemplate().insert(statementName);
	}
	
	public Object insert(final String statementName, final Object parameterObject)
			throws DataAccessException {
		return getSqlMapClientTemplate().insert(statementName, parameterObject);
	}
	
	public int update(String statementName) throws DataAccessException {
		return getSqlMapClientTemplate().update(statementName);
	}

	public int update(final String statementName, final Object parameterObject)
			throws DataAccessException {
		return getSqlMapClientTemplate().update(statementName, parameterObject);
	}

	public void update(String statementName, Object parameterObject, int requiredRowsAffected)
			throws DataAccessException {
		getSqlMapClientTemplate().update(statementName, parameterObject, requiredRowsAffected);
	}

	public int delete(String statementName) throws DataAccessException {
		return getSqlMapClientTemplate().delete(statementName);
	}

	public int delete(final String statementName, final Object parameterObject)
			throws DataAccessException {
		return getSqlMapClientTemplate().delete(statementName, parameterObject);
	}

	public void delete(String statementName, Object parameterObject, int requiredRowsAffected)
			throws DataAccessException {
		getSqlMapClientTemplate().delete(statementName, parameterObject, requiredRowsAffected);
	}
}
	

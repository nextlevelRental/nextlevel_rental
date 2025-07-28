package egovframework.ntrms.kr.co.exec.handler.service;

import java.text.MessageFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientCallback;

import com.ibatis.sqlmap.client.event.RowHandler;

import egovframework.ntrms.kr.co.exec.handler.service.dao.DaoBase;

/**
 * 
 * 
 * @author 강신규
 * @since 2018. 12. 23. 오후 4:33:14
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2018. 12. 23. / 강신규 : 최초생성
 * </pre>
 */
public abstract class ServiceDaoBase extends ServiceBase {
	protected DaoBase DEFAULT_DAO;
	protected final String ERR_MESSAGE_PATTERN = "[{0}]의 서비스를 상속받아 사용하려면 반드시 [{1}]를 상속받은 Dao를 init()함수에서 지정해야 합니다.";
    
	@PostConstruct
	public void initBase() {
		this.init();
		if (DEFAULT_DAO == null) {
			throw new RuntimeException(MessageFormat.format(ERR_MESSAGE_PATTERN, this.getClass().getSimpleName(), DaoBase.class.getSimpleName()));
		}
	}
	
	/**
     * 상속받은 Service클래스에서는 반드시 init()에서 DEFAULT_DAO를 지정해야 합니다.
     * 
     * @메소드 : init
     * @작성자 : 강신규
     * @작성일 : 2018.12.21
     * 
     */
    public abstract void init();
    
    public DaoBase getDEFAULT_DAO() {
        return DEFAULT_DAO;
    }

    public <T> T execute(SqlMapClientCallback<T> action) throws DataAccessException {
		return getDEFAULT_DAO().execute(action);
	}
	
	public Object queryForObject(String statementName) throws DataAccessException {
		return getDEFAULT_DAO().queryForObject(statementName);
	}

	public Object queryForObject(final String statementName, final Object parameterObject)
			throws DataAccessException {
		return getDEFAULT_DAO().queryForObject(statementName, parameterObject);
	}
	
	public Object queryForObject(
			final String statementName, final Object parameterObject, final Object resultObject)
			throws DataAccessException {
		return getDEFAULT_DAO().queryForObject(statementName, parameterObject, resultObject);
	}
	
	public List queryForList(String statementName) throws DataAccessException {
		return getDEFAULT_DAO().queryForList(statementName);
	}
	
	public List queryForList(final String statementName, final Object parameterObject)
			throws DataAccessException {
		return getDEFAULT_DAO().queryForList(statementName, parameterObject);
	}
	
	public List queryForList(String statementName, int skipResults, int maxResults)
			throws DataAccessException {
		return getDEFAULT_DAO().queryForList(statementName, skipResults, maxResults);
	}
	
	public List queryForList(
			final String statementName, final Object parameterObject, final int skipResults, final int maxResults)
			throws DataAccessException {
		return getDEFAULT_DAO().queryForList(statementName, parameterObject, skipResults, maxResults);
	}
	
	public void queryWithRowHandler(String statementName, RowHandler rowHandler)
			throws DataAccessException {
		getDEFAULT_DAO().queryWithRowHandler(statementName, rowHandler);
	}
	
	public void queryWithRowHandler(
			final String statementName, final Object parameterObject, final RowHandler rowHandler)
			throws DataAccessException {
		getDEFAULT_DAO().queryWithRowHandler(statementName, parameterObject, rowHandler);
		
	}
	
	public Map queryForMap(
			final String statementName, final Object parameterObject, final String keyProperty)
			throws DataAccessException {
		return getDEFAULT_DAO().queryForMap(statementName, parameterObject, keyProperty);
	}
	
	public Map queryForMap(
			final String statementName, final Object parameterObject, final String keyProperty, final String valueProperty)
			throws DataAccessException {
		return getDEFAULT_DAO().queryForMap(statementName, parameterObject, keyProperty, valueProperty);
	}
	
	public Object insert(String statementName) throws DataAccessException {
		return getDEFAULT_DAO().insert(statementName);
	}
	
	public Object insert(final String statementName, final Object parameterObject)
			throws DataAccessException {
		return getDEFAULT_DAO().insert(statementName, parameterObject);
	}
	
	public int update(String statementName) throws DataAccessException {
		return getDEFAULT_DAO().update(statementName);
	}

	public int update(final String statementName, final Object parameterObject)
			throws DataAccessException {
		return getDEFAULT_DAO().update(statementName, parameterObject);
	}

	public void update(String statementName, Object parameterObject, int requiredRowsAffected)
			throws DataAccessException {
		getDEFAULT_DAO().update(statementName, parameterObject, requiredRowsAffected);
	}

	public int delete(String statementName) throws DataAccessException {
		return getDEFAULT_DAO().delete(statementName);
	}

	public int delete(final String statementName, final Object parameterObject)
			throws DataAccessException {
		return getDEFAULT_DAO().delete(statementName, parameterObject);
	}

	public void delete(String statementName, Object parameterObject, int requiredRowsAffected)
			throws DataAccessException {
		getDEFAULT_DAO().delete(statementName, parameterObject, requiredRowsAffected);
	}
}

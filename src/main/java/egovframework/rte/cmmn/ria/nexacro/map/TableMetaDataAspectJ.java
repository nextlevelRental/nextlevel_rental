package egovframework.rte.cmmn.ria.nexacro.map;

import static com.google.common.base.CaseFormat.LOWER_CAMEL;
import static com.google.common.base.CaseFormat.UPPER_UNDERSCORE;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.engine.mapping.statement.RowHandlerCallback;
import com.ibatis.sqlmap.engine.scope.StatementScope;
import com.nexacro.xapi.data.DataSet;

import egovframework.rte.cmmn.ria.nexacro.Context;
import egovframework.rte.cmmn.ria.nexacro.ConvertDataType;

/**
 * AspectJ를 이용하여 Table에서 DataSet의 Column 정보를 설정한다.
 *
 */
//@Aspect
public class TableMetaDataAspectJ {
	
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public TableMetaDataAspectJ() {
		if( logger.isDebugEnabled()) {
			logger.debug("=========================================================================================");
			logger.debug("============================== call ibatis AspectJ library ==============================");
			logger.debug("=========================================================================================");
		}
	}
	
	//@Pointcut("execution(* com.ibatis..handleResults(..))")
	//@Before("execution(* com.nexa.common.service.XPServiceImpl.getList(..))")
	//@Before("execution(* com.ibatis..*.handleResults(..))")
	//@Pointcut("execution(com.ibatis.sqlmap.engine.execution.SqlExecutor.executeQuery(..))")
	//@Before("within(org.springframework.orm.ibatis.support.SqlMapClientDaoSupport)")
    public void handleResults() {
		if( logger.isDebugEnabled()) {
			logger.debug("===============================================================================================");
			logger.debug("========== call handleResults()");
			logger.debug("===============================================================================================");
		}		
	}
	
	//@Before("handleResults()")
    public void beforeHandleGetList() {
		
		try {
			
			if( logger.isDebugEnabled()) {
				logger.debug("===============================================================================================");
				logger.debug("========== EXECUTE SQL QUERY ID:");
				logger.debug("===============================================================================================");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
    }
    
    //@Before("handleResults() && args(statementScope, rs, skipResults, maxResults, callback)")
    public void beforeHandleResults(StatementScope statementScope, ResultSet rs, int skipResults, int maxResults, RowHandlerCallback callback) {
    	ResultSetMetaData metaData = null;
    	
    	try {
    		metaData = rs.getMetaData();
    		DataSet dataset = new DataSet();
    		for (int i = 0; i < metaData.getColumnCount(); i++) { 
    			String columnName = metaData.getColumnName(i+1);
    			int    columnType = metaData.getColumnType(i+1);
    			String userscoreStr = UPPER_UNDERSCORE.to(LOWER_CAMEL ,columnName);
    			dataset.addColumn(userscoreStr, ConvertDataType.getPlatformDataTypeFromSqlType(columnType));
    		}
    		
    		if( logger.isDebugEnabled()) {
    			logger.debug("===============================================================================================");
    			logger.debug("========== EXECUTE SQL QUERY ID:"+statementScope.getStatement().getId());
    			logger.debug("===============================================================================================");
    		}
    		
    		Context.local.set(dataset);
    		
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}	
    	
    }
}

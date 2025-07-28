package egovframework.ntrms.kr.co.comm.ibatis;

import java.sql.Array;
import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.jdbc.support.nativejdbc.CommonsDbcpNativeJdbcExtractor;

import com.ibatis.sqlmap.client.extensions.ParameterSetter;
import com.ibatis.sqlmap.client.extensions.ResultGetter;
import com.ibatis.sqlmap.client.extensions.TypeHandlerCallback;

import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;

public class ArrayTypeHandler implements TypeHandlerCallback {

	@Override
	public void setParameter(ParameterSetter setter, Object parameter) throws SQLException {
		
		String[] strArr = (String[]) parameter;
		
		CommonsDbcpNativeJdbcExtractor commonsDbcpNativeJdbcExtractor = new CommonsDbcpNativeJdbcExtractor();
		
		Connection conn = commonsDbcpNativeJdbcExtractor.getNativeConnection(setter.getPreparedStatement().getConnection());
		ArrayDescriptor stringArrayDescriptor = ArrayDescriptor.createDescriptor("NXRADMIN.VARCHAR_ARR", conn);
		ARRAY valArray;
		try {
			valArray = new ARRAY(stringArrayDescriptor, conn, strArr);
		} catch (SQLException e) {
		   throw e;
		}
		
		setter.setArray(valArray);
		
	}

	@Override
	public Object getResult(ResultGetter getter) throws SQLException {
		
		Array arr = getter.getArray();
		if (arr == null){
			return null;
		}
		else{
		   return (String[]) arr.getArray();
		}
	}

	@Override
	public Object valueOf(String s) {
		
		String[] r = new String[1];
		r[0] = s;
		return r;
	}
}

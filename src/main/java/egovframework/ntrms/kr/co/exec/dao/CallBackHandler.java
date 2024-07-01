package egovframework.ntrms.kr.co.exec.dao;

import java.sql.Array;
import java.sql.Connection;
import java.sql.SQLException;

import oracle.jdbc.OracleTypes;
import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;

import com.ibatis.sqlmap.client.extensions.ParameterSetter;
import com.ibatis.sqlmap.client.extensions.ResultGetter;
import com.ibatis.sqlmap.client.extensions.TypeHandlerCallback;
import com.ibatis.sqlmap.engine.type.JdbcTypeRegistry;
import com.ibatis.sqlmap.engine.type.TypeHandler;

public class CallBackHandler implements TypeHandlerCallback{
	static {
		JdbcTypeRegistry.setType("VARSTRING",  OracleTypes.ARRAY);
	}
	public void setParameter(ParameterSetter setter, Object parameter) throws SQLException {
		String[] strArr =(String[])parameter;
		setter.getPreparedStatement().getConnection();
		Connection conn = setter.getPreparedStatement().getConnection();
		
		ArrayDescriptor stringArrayDescriptor = ArrayDescriptor.createDescriptor("VARSTRING", conn);
		ARRAY  valArray;
		try {
			valArray = new ARRAY(stringArrayDescriptor, conn, strArr);
		}catch(SQLException e) {
			throw e;
		}
		setter.setArray(valArray);
	}
	
	public Object getResult(ResultGetter getter) throws SQLException {
		Array arr = getter.getArray();
		if(arr == null ) {
			return null;
		} else {
			return (String[]) arr.getArray();
		}
	}
	
	public Object valueOf(String args) {
		String[] r = new String[1];
		r[0] = args;
		return r;
	}

}

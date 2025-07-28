package egovframework.rte.cmmn.ria.nexacro;

import java.math.BigDecimal;
import java.util.Date;

import com.nexacro.xapi.data.DataTypes;

public class ConvertDataType {
	public static int getPlatformDataType(Object obj) {
		if (obj == null) return DataTypes.STRING;
		Class clz = obj.getClass();
		return getPlatformDataType(clz);
	}
	
	public static int getPlatformDataType(Class clz){
		int dataType = DataTypes.STRING;
		if (clz == null) return dataType;
		String typeName = clz.getName();
		if (typeName.equals(String.class.getName())) {
			dataType = DataTypes.STRING;
		} else if (typeName.equals(Integer.class.getName())) {
			dataType = DataTypes.INT;
		} else if (typeName.equals(Boolean.class.getName())) {
			dataType = DataTypes.INT;
		} else if (typeName.equals(BigDecimal.class.getName())) {
			dataType = DataTypes.BIG_DECIMAL;
		} else if (typeName.equals(Long.class.getName())) {
			dataType = DataTypes.BIG_DECIMAL;
		} else if (typeName.equals(Double.class.getName())) {
			dataType = DataTypes.FLOAT;
		} else if (typeName.equals(Date.class.getName())) {
			dataType = DataTypes.DATE_TIME;
		} else if (typeName.equals(Byte[].class.getName())) {
			dataType = DataTypes.BLOB;
		}

		return dataType;
	}
	
	public static String getDataType(Object obj){
		if (obj == null) return String.class.getName();
		Class clz = obj.getClass();
		
		if (clz == null) return String.class.getName();
		String typeName = clz.getName();
		
		return typeName;
	}
	
	public static int getPlatformDataTypeFromSqlType(int type){
		int dataType = DataTypes.STRING;
		switch (type) {
		case java.sql.Types.VARCHAR:
		case java.sql.Types.CHAR:
			dataType = DataTypes.STRING;
			break;
		case java.sql.Types.BIGINT:
			dataType = DataTypes.LONG;
			break;
		case java.sql.Types.DECIMAL:
			dataType = DataTypes.LONG;
			break;
			
		case java.sql.Types.TINYINT:
		case java.sql.Types.SMALLINT:
		case java.sql.Types.INTEGER:
			dataType = DataTypes.INT;
			break;
		
		case java.sql.Types.NUMERIC:
			dataType = DataTypes.LONG;
			break;
		
		case java.sql.Types.BOOLEAN:
		case java.sql.Types.BIT:
			dataType = DataTypes.BOOLEAN;
			break;
		
		case java.sql.Types.TIME:
			dataType = DataTypes.TIME;
			break;
		case java.sql.Types.TIMESTAMP:
			dataType = DataTypes.DATE_TIME;
			break;
		case java.sql.Types.DATE:
			dataType = DataTypes.DATE;
			break;
			
		case java.sql.Types.DOUBLE:
		case java.sql.Types.FLOAT:
			dataType = DataTypes.FLOAT;
			break;
		case java.sql.Types.BINARY:
			dataType = DataTypes.BLOB;
			break;
		/*
		case java.sql.Types.BLOB:
		case java.sql.Types.CLOB:
			dataType = DataTypes.BLOB;
			break;
		*/	
		default:
			dataType = DataTypes.STRING;
			break;
		}		

		return dataType;
		
	}	
}

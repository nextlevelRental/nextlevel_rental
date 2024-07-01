package egovframework.ntrms.kr.co.ext.excel;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.CharArrayWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;

import com.nexacro.xapi.data.ColumnHeader;
import com.nexacro.xapi.data.DataSet;
import com.nexacro.xapi.data.DataTypes;
import com.nexacro.xapi.data.Variable;
import com.nexacro.xapi.data.VariableList;
import com.nexacro.xapi.util.StringUtils;

/*
 * SSV Dataset을 데이터셋 읽기
 * 
 */
public class SsvDeserializer {
	/* Get actual class name to be printed on */
	static Logger log = Logger.getLogger(SsvDeserializer.class.getName());
	
	/* Record 구분자 */
	private char rs = (char) 0x1e;
	/* Unit 구분자 */
	private char us = (char) 0x1f;
	
	/* 읽은 문자들을 저장하는 버퍼 */
	private CharArrayWriter buffer;
	
	private DataSet ds = null;
	private VariableList varList = null;
	
	public SsvDeserializer() {
	}
	
	public void readData(String data, String datasetName) {
		String line = null;
		this.setDs(null);
		
//        //use ByteArrayInputStream to get the bytes of the String and convert them to InputStream.
//        InputStream inputStream = new ByteArrayInputStream(data.getBytes(Charset.forName("UTF-8")));
//        Reader is=new InputStreamReader(inputStream);
//        
//        SeperatorRS reader = new SeperatorRS(is, rs);
		
		//위와 같이 사용시 한글깨짐 및 getBytes() 사용으로 인한 성능저하 발생...
		StringBuilder buffer = new StringBuilder();
		buffer.append(data);
		BufferedReader br = new BufferedReader(new StringReader(buffer.toString()));
		SeperatorRS reader = new SeperatorRS(br, rs);
        
		try {
			while (true) {
				line = reader.readLine();

				if (line == null) {
					break;
				} else if (isDataSetHeader(line)) {
					//readDataSet(reader, line, datasetName);
					//readDataSet(line, datasetName);
					readDataSet(reader, line, datasetName);
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}


	
	
	//private void readDataSet(BufferedReader reader, String header, String datasetName) throws IOException {
	//private void readDataSet(String line, String datasetName) throws IOException {
	private void readDataSet(SeperatorRS reader, String header, String datasetName) throws IOException {
		//int index = header.indexOf(':');
		//String name = header.substring(index + 1);

		DataSet ds = new DataSet(datasetName);

		boolean isStoreDataChanges = ds.isStoreDataChanges();
		boolean isCheckingSetterDataIndex = ds.isCheckingSetterDataIndex();

		if (isStoreDataChanges) {
			ds.stopStoreDataChanges();
		}
		if (isCheckingSetterDataIndex) {
			ds.setCheckingSetterDataIndex(false);
		}
		
		String line = null;


		while (true) {
			line = reader.readLine();

			if (line == null || line.length() == 0) {
				break;
			}

			if (isConstantColumnHeader(line)) {
				readConstantColumnHeader(line, ds);
			} else if (isDefaultColumnHeader(line)) {
				readDefaultColumnHeader(line, ds);
			} else {
				readDataRow(line, ds);
			}
		}

		if (isStoreDataChanges) {
			ds.startStoreDataChanges(true);
		}
		if (isCheckingSetterDataIndex) {
			ds.setCheckingSetterDataIndex(true);
		}

		this.setDs(ds);
	}

	
	

	private void readVariable(SeperatorRS reader, String str) {
		List list = split(str, us);
		Iterator iter = list.iterator();

		while (iter.hasNext()) {
			String varStr = (String) iter.next();
			int index = varStr.indexOf('=');

			if (index > 0) {
				String header = varStr.substring(0, index);
				String value = varStr.substring(index + 1);

				int typeIndex = header.indexOf(':');

				if (typeIndex > 0) {
					String name = header.substring(0, typeIndex);
					String typeStr = header.substring(typeIndex + 1);

					int sizeStartIndex = typeStr.indexOf('(');
					int sizeEndIndex = typeStr.indexOf(')', sizeStartIndex + 1);

					if (sizeStartIndex > 0 && sizeEndIndex > 0) {
						String dataTypeStr = typeStr.substring(0, sizeStartIndex);

						int dataType = getDataType(dataTypeStr);


						Variable var = new Variable(name, dataType, value);

						varList.add(var);
					} else {
						String dataTypeStr = typeStr;

						int dataType = getDataType(dataTypeStr);

						Variable var = new Variable(name, dataType, value);

						varList.add(var);
					}
				} else {
					String name = header;
					int dataType = DataTypes.STRING;

					Variable var = new Variable(name, dataType, value);

					varList.add(var);
				}
			}
		}
	}	
	
	
	private void readConstantColumnHeader(String str, DataSet ds) {
		List list = split(str, us);
		Iterator iter = list.iterator();

		while (iter.hasNext()) {
			String columnStr = (String) iter.next();
			int index = columnStr.indexOf('=');

			if (index > 0) {
				String header = columnStr.substring(0, index);
				String value = columnStr.substring(index + 1);

				int typeIndex = header.indexOf(':');

				if (typeIndex > 0) {
					String name = header.substring(0, typeIndex);
					String typeStr = header.substring(typeIndex + 1);

					int sizeStartIndex = typeStr.indexOf('(');
					int sizeEndIndex = typeStr.indexOf(')', sizeStartIndex + 1);

					if (sizeStartIndex > 0 && sizeEndIndex > 0) {
						String dataTypeStr = typeStr.substring(0, sizeStartIndex);
						String dataSizeStr = typeStr.substring(sizeStartIndex + 1, sizeEndIndex);

						int dataType = getDataType(dataTypeStr);
						int dataSize = StringUtils.toInt(dataSizeStr, DataTypes.getDefaultSize(dataType));

						ds.addConstantColumn(name, dataType, dataSize, value);
					} else {
						String dataTypeStr = typeStr;

						int dataType = getDataType(dataTypeStr);

						ds.addConstantColumn(name, dataType, value);
					}
				} else {
					String name = header;
					int dataType = DataTypes.STRING;

					ds.addConstantColumn(name, dataType, value);
				}
			}
		}
	}

	private void readDefaultColumnHeader(String str, DataSet ds) {
		List list = split(str, us);
		Iterator iter = list.iterator();
		iter.next();

		for (int i = 0; iter.hasNext(); i++) {
			String header = (String) iter.next();
			int typeIndex = header.indexOf(':');

			if (typeIndex > 0) {
				String name = header.substring(0, typeIndex);
				String typeStr = header.substring(typeIndex + 1);

				int sizeStartIndex = typeStr.indexOf('(');
				int sizeEndIndex = typeStr.indexOf(')', sizeStartIndex + 1);

				if (sizeStartIndex > 0 && sizeEndIndex > 0) {
					String dataTypeStr = typeStr.substring(0, sizeStartIndex);
					String dataSizeStr = typeStr.substring(sizeStartIndex + 1, sizeEndIndex);

					int dataType = getDataType(dataTypeStr);
					int dataSize = StringUtils.toInt(dataSizeStr, DataTypes.getDefaultSize(dataType));

					ds.insertColumn(i, new ColumnHeader(name, dataType, dataSize));
				} else {
					String dataTypeStr = typeStr;

					int dataType = getDataType(dataTypeStr);

					ds.insertColumn(i, new ColumnHeader(name, dataType));
				}
			} else {
				String name = header;
				int dataType = DataTypes.STRING;

				ds.insertColumn(i, new ColumnHeader(name, dataType));
			}
		}
	}

	private void readDataRow(String str, DataSet ds) {
		log.debug("readDataRow \n " +  str);
		List list = split(str, us);
		Iterator iter = list.iterator();

		String rowType = (String) iter.next();

		if (rowType.length() == 1) {
			char ch = rowType.charAt(0);

			if (ch == 'O') {
				int rowIndex = ds.getRowCount() - 1;
				int columnCount = ds.getColumnCount();

				for (int i = 0; (iter.hasNext() && i < columnCount); i++) {
					Object value = iter.next();

					ds.setSavedData(rowIndex, i, value);
				}
			} else if (ch == 'N' || ch == 'I' || ch == 'U' || ch == 'D') {
				int rowIndex = ds.newRow();
				int columnCount = ds.getColumnCount();

				for (int i = 0; (iter.hasNext() && i < columnCount); i++) {
					Object value = iter.next();

					ds.set(rowIndex, i, value);
					log.debug("row="+rowIndex + ", i=" + i + ", value=" + value );
				}

				if (ch == 'N') {
					ds.setRowType(rowIndex, DataSet.ROW_TYPE_NORMAL);
				} else if (ch == 'I') {
					ds.setRowType(rowIndex, DataSet.ROW_TYPE_INSERTED);
				} else if (ch == 'U') {
					ds.setRowType(rowIndex, DataSet.ROW_TYPE_UPDATED);
				} else if (ch == 'D') {
					ds.setRowType(rowIndex, DataSet.ROW_TYPE_DELETED);
				}
			}
		} else {
				int rowCount = ds.getRowCount();

				log.warn("Invalid SSV row type: rowType=" + rowType + ", rowCount=" + rowCount);
				log.warn("Invalid SSV row type: str=" + str);
		}
	}

	private boolean isConstantColumnHeader(String str) {
		return (str.startsWith("_Const_"));
	}

	private boolean isDefaultColumnHeader(String str) {
		return (str.startsWith("_RowType_"));
	}

	private boolean isDataSetHeader(String str) {
		return (str.startsWith("Dataset:"));
	}

	/* 헤더(header)를 읽는다. */
	private byte[] readHeader(InputStream in) throws IOException {
		ByteArrayOutputStream out = new ByteArrayOutputStream();

		while (true) {
			int ch = in.read();

			out.write(ch);

			if (ch == -1) {
				break;
			} else if (ch == rs) {
				break;
			}
		}

		out.close();

		return out.toByteArray();
	}

	/* 헤더(header)를 읽는다. */
	private char[] readHeader(Reader in) throws IOException {
		CharArrayWriter out = new CharArrayWriter();

		while (true) {
			int ch = in.read();

			out.write(ch);

			if (ch == -1) {
				break;
			} else if (ch == rs) {
				break;
			}
		}

		out.close();

		return out.toCharArray();
	}

	/* 문자셋(charset)을 검색한다. */
	private String findEncoding(byte[] header) {
		return findEncoding(new String(header));
	}

	/* 문자셋(charset)을 검색한다. */
	private String findEncoding(char[] header) {
		return findEncoding(new String(header));
	}

	/* 문자셋(charset)을 검색한다. */
	private String findEncoding(String header) {
		String prefix = "SSV:";
		int index = header.indexOf(prefix);

		if (index == 0) {
			int begin = index + prefix.length();
			int end = header.length();
			String encoding = header.substring(begin, end).trim();

			if (encoding.length() > 0) {
				return encoding;
			}
		}

		return null;
	}

	private List split(String str, char ch) {
		int start = 0;
		List list = new ArrayList();

		while (true) {
			int index = str.indexOf(ch, start);

			if (index == -1) {
				list.add(str.substring(start));
				break;
			} else {
				int end = index;
				list.add(str.substring(start, end));
				start = end + 1;
			}
		}

		return list;
	}

	private int getDataType(String str) {
		if ("binary".equalsIgnoreCase(str)) {
			return DataTypes.BLOB;
		} else if ("float".equalsIgnoreCase(str)) {
			return DataTypes.DOUBLE;
		} else {
			return DataTypes.toIntType(str);
		}
	}

	public void setDs(DataSet ds) {
		this.ds = ds;
	}

	public DataSet getDs() {
		return ds;
	}	
}

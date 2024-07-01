package egovframework.ntrms.kr.co.brn.jco;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.sap.conn.jco.JCoField;
import com.sap.conn.jco.JCoFieldIterator;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoStructure;
import com.sap.conn.jco.JCoTable;

/**
 * 넥센타이어 SAP 과의 연동관리.
 *
 */
public class JCoManager {
	/** 호출할 함수명 */
	private String						functionName	= null;
	/** <INPUT> 의 하위 엘리먼트들 */
	private Map<String,Object>			inputParams		= null;
	/** <OUTPUT> 의 하위 엘리먼트들 */
	private JCoParameterList			outputList		= null;
	/** <TABLES> -> <INTAB> -> <item> 목록 */
	private List<Map<String,Object>>	paramList		= null;
	/** <TABLES> -> <OUTTAB> */
	private JCoTable					outputTable		= null;
	/** 로거 */
	//private static Logger				logger			= Logger.getLogger(JCoManager.class);
	private Map<String,Object>		returnTable		= null;

	/******************************
	 * 생성자.
	 * @param functionName
	 * @param inputParams
	 *****************************/
	public JCoManager(String functionName, Map<String,Object> inputParams) throws Exception {
		this(functionName, inputParams, null);
	}

	/*****************************
	 * 생성자.
	 * @param functionName
	 * @param inputParams
	 *****************************/
	public JCoManager(String functionName, Map<String,Object> inputParams, List<Map<String,Object>> paramList) throws Exception {
		this.functionName	= functionName;
		this.inputParams	= inputParams;
		this.paramList		= paramList;
		this.returnTable = new HashMap<String,Object>();
		execute();
	}
	
	/******************************
	 * 실행.
	 *****************************/
	private void execute() throws Exception {
		
		try {
			long begin = System.currentTimeMillis();
			System.out.println("=========================================================");
			System.out.println("==== FUNCTION NAME  => " + functionName);
			System.out.println("=========================================================");

			// 접속
			ConnectionToNexen connect = new ConnectionToNexen();
			JCoFunction function = connect.getFunction(this.functionName);
			
			// 전달값 세팅
			setValues(function);
			System.out.println("connect.execute(function) : "+begin);
			
			// function 실행
			connect.execute(function);
			
			System.out.println("### sap interface 소요시간 ===> " + (System.currentTimeMillis()-begin) + " elapsed...");
			System.out.println("\n" + function.toXML());
			
			// 결과
			this.outputList		= function.getExportParameterList();
			JCoParameterList tableList	= function.getTableParameterList();
			
			if( tableList != null ) {
				this.outputTable = tableList.getTable("OUTTAB");

				/*for(int i = 0; i<this.outputTable.getNumRows(); i++) {
					this.outputTable.setRow(i);
					System.out.println(this.outputTable.getString("BSTKD"));
					System.out.println(this.outputTable.getString("VBELN"));
					System.out.println(this.outputTable.getString("VBELN_D"));
					System.out.println(this.outputTable.getString("ZSTATUS"));
				}*/
			}
			
			JCoStructure returnE	= this.outputList.getStructure("RETURN");
			JCoField jcoField = null;
			if(returnE != null){
				JCoFieldIterator iter = returnE.getFieldIterator();
				while(iter.hasNextField()){
					jcoField = iter.nextField();
					this.returnTable.put(jcoField.getName(), jcoField.getString());
				}
			}
			
		}
		catch( Exception e ) {
			System.out.println("RFC 호출 Exception발생 : " + e.getMessage());
			throw e;
		}
	}
	
	/******************************
	 * 전달값 세팅.
	 * @param function
	 *****************************/
	private void setValues(JCoFunction function) {
		
		// <INPUT>
		if( this.inputParams != null ) {
			for( Iterator<String> it = this.inputParams.keySet().iterator();  it.hasNext(); ) {
				String key = it.next();
				System.out.println("setValues inputParams ==> key : " + key + " ::::: " + this.inputParams.get(key));
				System.out.println("setValues inputParams ==> toXML : " + function.getImportParameterList().toXML());
				function.getImportParameterList().setValue(key, this.inputParams.get(key));
			}
		}
		
		// <INTAB>
		
		int paramListCount = paramList == null ? 0 : paramList.size();
		
		if( paramListCount > 0 ) {
			JCoTable inputTable = function.getTableParameterList().getTable("INTTAB");

			for( int ii=0;  ii<paramListCount;  ii++ ) {
				inputTable.appendRow();

				Map<String,Object> m = paramList.get(ii);
				for( Iterator<String> it = m.keySet().iterator();  it.hasNext(); ) {
					String key = it.next();
					System.out.println("setValues inputTable ==> key : "+key+" ::::: "+m.get(key));
					inputTable.setValue(key,	m.get(key));
				}
			}
		}
	}
	
	
	/**********************************************************
	 * <OUTPUT> 하위의 엘리먼트 값 반환.
	 * @param name <OUTPUT> 하위 엘리먼트 이름
	 * @return	해당 엘리먼트 값
	 *********************************************************/
	public String getOutput(String name) {
		if( this.outputList == null ) {
			return null;
		}
		return this.outputList.getString(name);
	}
	
	/******************************
	 * 출력테이블 반환.
	 * @return	결과테이블
	 *****************************/
	public JCoTable getOutputTable() {
		return this.outputTable;
	}

	/******************************
	 * 테스트용 메소드.
	 * @return	맵으로 구성된 리스트
	 *****************************/
	public List<Map<String,String>> getListForTest() {
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();

		if( this.outputTable.isEmpty() ) {
			return list;
		}
		
		do {
			Map<String,String> m = new HashMap<String,String>();
			for( JCoField field : this.outputTable ) {
				m.put(field.getName(), field.getString());
			}
			list.add(m);
		} while( this.outputTable.nextRow() );

		return list;
	}
	
	public Map<String,Object> getReturn() {
		return this.returnTable;
	}
}

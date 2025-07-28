package egovframework.ntrms.kr.co.comm.util;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import com.nexacro.xapi.data.DataSet;

import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

public class DataSetMapHelper {

	private DataSetMap dataSetMap;
	private List<Map> dataSetRows;
	
	private int rowType;
	
	public DataSetMapHelper(DataSetMap dataSetMap){
		this.dataSetMap = dataSetMap;
		this.dataSetRows = dataSetMap.getRowMaps();
	}
	
	public int getDataSetMapSize(){
		return this.dataSetMap.size();
	}
	
	public boolean isEmpy(){
		return getRowMaps().isEmpty();
	}
	
	private int getRowType(int index){
		return this.rowType = ((Integer) getRowMaps().get(index).get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
	}
	
	private List<Map> getRowMaps(){
		
		if(this.dataSetRows.size() == 0){
			return Collections.emptyList();
		}
		return Collections.unmodifiableList(this.dataSetRows);
	}

	public <T> T getRowData(int index, Object col){
		return (T)getRowMaps().get(index).get(col);
	}
	
	public boolean isUpdate(int index){
		return checkRowType(index, DataSet.ROW_TYPE_UPDATED);
	}
	
	public boolean isInsert(int index){
		return checkRowType(index, DataSet.ROW_TYPE_INSERTED);
	}
	
	public boolean isDelete(int index){
		return checkRowType(index, DataSet.ROW_TYPE_DELETED);
	}
	
	private boolean checkRowType(int index, int type){
		
		this.rowType = getRowType(index);
		if(this.rowType == type){
			return true;
		}
		return false;
	}
	
	public boolean isTrue(int index, Object col){
		
		Object data = (Object)getRowData(index, col);
		if(String.valueOf(data).equals("Y")){
			return true;
		}
		return false;
	}
}

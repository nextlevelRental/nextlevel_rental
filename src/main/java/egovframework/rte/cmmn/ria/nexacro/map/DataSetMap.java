package egovframework.rte.cmmn.ria.nexacro.map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;

import com.nexacro.xapi.data.DataSet;

import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;

public class DataSetMap {
	List <Map> rowMaps;
	
	public DataSetMap(){
		rowMaps = new ArrayList<Map>();
	}
	
	public Map get(int index){
		return rowMaps.get(index);
	}
	
	public void add(Map elem){
		rowMaps.add(elem);
	}
	
	public int size(){
		return rowMaps.size();
	}
	
	public Object[] toArray(){
		return rowMaps.toArray();
	}
	
	public void setRowMaps(List<Map> list){
		rowMaps = list;
	}
	
	public List <Map> getRowMaps(){
		return rowMaps;
	}
	
	public Object getMapValue(int listIndex, Object key){
		return get(listIndex).get(key);
	}
	
	public Set getKeySet(int listIndex){
		return get(listIndex).keySet();
	}
	
	/**
	 * DataSet을 DataSetMap으로 변경한다.
	 * @param ds 변경할 DataSet
	 */
	public void convertDataSet2DataSetMap(DataSet ds) {
		Map <String, Object> map = null;
		for ( int j = 0; j < ds.getRowCount(); j ++ ){		//Dataset의 record 반복
			map = new HashMap<String, Object>();
			for (int k = 0; k < ds.getColumnCount(); k++) {
				Object obj = ds.getObject(j, k);
				if (obj != null){
					//System.out.println("key ="+ds.getColumn(k).getName()+" value="+ds.getObject(j, k));
					map.put(ds.getColumn(k).getName(), ds.getObject(j, k));
				}/*else {
					System.out.println("data is null~!!!!!!!!!!!!!!!!!!!!!!!!!");
				}*/
				
			}
			int rowType1 = ds.getRowType(j);
			map.put(NexacroConstant.DATASET_ROW_TYPE,new Integer(rowType1));
			rowMaps.add(map);
		}
		
		//System.out.println("             delete="+ds.getRemovedRowCount());
		int removeRowCount = ds.getRemovedRowCount();
		for (int i = 0; i < removeRowCount; i++) {
			map = new HashMap<String, Object>();
			map.put(NexacroConstant.DATASET_ROW_TYPE, new Integer(DataSet.ROW_TYPE_DELETED));
			for (int j = 0; j < ds.getColumnCount(); j++) {
				map.put(ds.getColumn(j).getName(), StringUtils.stripToEmpty(ds.getRemovedStringData(i, j)));
			}
			rowMaps.add(map);
		}
	}
	
	/**
	 * DataSet을 DataSetMap으로 변경한다.
	 * @param ds 변경할 DataSet
	 */
	public void convertDataSet2DataSetMap(DataSet ds, Map mapUserInfo, Map mapPageInfo) {
		Map <String, Object> map = null;
		for ( int j = 0; j < ds.getRowCount(); j ++ ){		//Dataset의 record 반복
			map = new HashMap<String, Object>();
			for (int k = 0; k < ds.getColumnCount(); k++) {
				Object obj = ds.getObject(j, k);
				if (obj != null){
					//System.out.println("key ="+ds.getColumn(k).getName()+" value="+ds.getObject(j, k));
					map.put(ds.getColumn(k).getName(), ds.getObject(j, k));
				}/*else {
					System.out.println("data is null~!!!!!!!!!!!!!!!!!!!!!!!!!");
				}*/
			}
			
			int rowType1 = ds.getRowType(j);
			map.put(NexacroConstant.DATASET_ROW_TYPE,new Integer(rowType1));
			
			map.put(NexacroConstant.SESSION_USER_MAP_NAME, mapUserInfo);
			map.put(NexacroConstant.PAGING_MAP_NAME, mapPageInfo);
			
			rowMaps.add(map);
		}
		
		//System.out.println("             delete="+ds.getRemovedRowCount());
		int removeRowCount = ds.getRemovedRowCount();
		for (int i = 0; i < removeRowCount; i++) {
			map = new HashMap<String, Object>();
			map.put(NexacroConstant.DATASET_ROW_TYPE, new Integer(DataSet.ROW_TYPE_DELETED));
			
			map.put(NexacroConstant.SESSION_USER_MAP_NAME, mapUserInfo);
			map.put(NexacroConstant.PAGING_MAP_NAME, mapPageInfo);
			
			for (int j = 0; j < ds.getColumnCount(); j++) {
				map.put(ds.getColumn(j).getName(), StringUtils.stripToEmpty(ds.getRemovedStringData(i, j)));
			}
			rowMaps.add(map);
		}
	}
	
}
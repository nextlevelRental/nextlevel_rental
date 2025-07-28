package egovframework.rte.cmmn.ria.nexacro.vo;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import org.apache.commons.lang.StringUtils;

import com.ibatis.common.beans.ClassInfo;
import com.nexacro.xapi.data.DataSet;
import com.nexacro.xapi.data.DataSetList;
import com.nexacro.xapi.data.PlatformData;
import com.nexacro.xapi.data.VariableList;

import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;

/**
 * XPlatform 과 통신 자료 구조(VO를 이용하는 DTO 클래스)
 * @author 이근태(yimoc@tobesoft.com)
 * 
 */
public class NexacroObjectDTO implements Serializable {
	private static final long serialVersionUID = 122554256929227668L;

	private List<Object> transInfo; 						// transaction 정보를 가지는  Dataset정보
	private Map<String, Object> inVariableMap;				// request 된 Variable정보
	private Map<String, Object> outVariableMap;				// response할 Variable 정보

	private Map<String, List<Object>> inDataSetMap;			//Request 된 DataSets 정보 <DataSetName, dataSet > 
	private Map<String, Object> outDataSetMap;		//Respose 할 DataSets 정보 <DataSetName, dataSet >

	public void setVariableMap(VariableList vList) {
		inVariableMap = new HashMap<String, Object>();
		for (int i = 0; i < vList.size(); i++) {
			inVariableMap.put(vList.get(i).getName(), vList.get(i).getObject());
		}
	}

	/**
	 * Dataset 중에 Transaction 정보를 가진 DataSet을 DataSetObject 정보로 바꾼다.
	 * 
	 * @param dsList
	 * @param datasetName
	 */
	public void setTranInfoMap(DataSetList dsList) {
		DataSet dsTransInfo = dsList.get(NexacroConstant.TRAN_INFO_DATASET_NAME);
		if (dsTransInfo != null){
			transInfo = convertDataSet2ListObject(dsTransInfo,"egovframework.rte.cmmn.ria.xplatform.vo.XPlatformTransactionVO");
		}
	}
	
	/**
	 * n개의 input DataSet을 Map에 넣는다.
	 *    Map의 key 값은 input DataSet이름이 들어가며 value는 DataSetObject(List)객체가 들어간다. 
	 *    DataSetObject 객체는 Object(class member= DataSet.column명, member value=DataSet.rowvalue)를 가진다.
	 * 
	 * @param dsList
	 */
	public void setInDataSetMap(DataSetList dsList) {
		inDataSetMap = new HashMap();
		for (int i = 0; i < transInfo.size(); i++) {
			NexacroTransactionVO tranVO = (NexacroTransactionVO) transInfo.get(i); 		//transaction Info DataSet에서 
			String datasetName = tranVO.getStrInDataset();
			String voName = tranVO.getStrInVOClass();
		
			DataSet dataset = dsList.get(datasetName);
			List<Object> objectList = convertDataSet2ListObject(dataset,voName);
			if (objectList != null)
				inDataSetMap.put(datasetName, objectList);
		}
		
	}
	
	public List<Object> getTransInfo() {
		return transInfo;
	}

	public Map<String, Object> getInVariableMap() {
		return inVariableMap;
	}

	public Map<String, List<Object>> getInDataSetMap() {
		return inDataSetMap;
	}

	public Map<String, Object> getOutDataSetMap() {
		if (outDataSetMap == null)
			outDataSetMap = new HashMap();
		return outDataSetMap;
	}
	
	public Map<String, Object> getOutVariableMap() {
		if (outVariableMap == null)
			outVariableMap = new HashMap();
		return outVariableMap;
	}

	/**
	 * DataSet을  List <Object> 형태로 컨버팅한다.
	 * @param dataset
	 * @param voName
	 */
	public List<Object> convertDataSet2ListObject(DataSet dataset, String voName) {
		if (dataset == null) return null;
		List<Object> rowObjects = new ArrayList<Object>();
		// Noraml, Insert, update
		// System.out.println("row count ="+dataset.getRowCount());
		for (int j = 0; j < dataset.getRowCount(); j++) {
			// System.out.println("noraml "+j);
			Object obj = DataSetVOMapping.getVOFromDataSetRow(voName, dataset,
					j, 0);
			// row type 세팅
			if (obj instanceof RowType) {
				int rowType = dataset.getRowType(j);
				((RowType) obj).setRowType(rowType);
			}
			if (obj != null)
				rowObjects.add(obj);
		}
		// Delete
		// System.out.println("delete count ="+dataset.getRemovedRowCount());
		for (int i = 0; i < dataset.getRemovedRowCount(); i++) {
			//System.out.println("delete "+i);
			Object obj = DataSetVOMapping.getVOFromDataSetRow(voName, dataset,
					i, 1);
			if (obj instanceof RowType) {
				((RowType) obj).setRowType(DataSet.ROW_TYPE_DELETED);
			}
			if (obj != null)
				rowObjects.add(obj);
		}
		return rowObjects;
	}

	/*

	private void printMap(Map<String, String> map) {
		Set<String> keySet = map.keySet();
		Iterator<String> iter = keySet.iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			String value = map.get(key);
			System.out.println("{" + key + " , " + value + "}");
		}
	}*/

}

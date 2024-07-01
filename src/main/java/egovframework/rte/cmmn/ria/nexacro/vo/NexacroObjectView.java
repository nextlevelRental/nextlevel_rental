package egovframework.rte.cmmn.ria.nexacro.vo;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import com.nexacro.xapi.data.DataSet;
import com.nexacro.xapi.data.DataSetList;
import com.nexacro.xapi.data.PlatformData;
import com.nexacro.xapi.data.Variable;
import com.nexacro.xapi.data.VariableList;
import com.nexacro.xapi.tx.HttpPlatformResponse;
import com.nexacro.xapi.tx.PlatformType;

import egovframework.rte.cmmn.ria.nexacro.ConvertDataType;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;

/**
 * Object 형태의 DTO 들을 XPlatform Data에 맞게 변경하는 View
 * 
 * @author 이근태(yimoc@tobesoft.com)
 * 
 */
public class NexacroObjectView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		this.logger.debug("XPlatformView.renderMergedOutPutModel() start%%%");
		PlatformData platformData = new PlatformData();
		VariableList outVariableList = new VariableList();
		DataSetList outDatasetList = new DataSetList();

		setResult(model, outVariableList);
		setOutVariableMap(model, outVariableList);
		setOutDataSetMap(model, outDatasetList);

		platformData.setVariableList(outVariableList);
		platformData.setDataSetList(outDatasetList);

		this.logger.debug(platformData.saveXml());

		HttpPlatformResponse hPlatformRsp = new HttpPlatformResponse(response);
		hPlatformRsp.setCharset(PlatformType.DEFAULT_CHAR_SET);
		hPlatformRsp.setData(platformData);
		hPlatformRsp.sendData();
	}

	/**
	 * 결과 값을 세팅한다.
	 * 
	 * @param model
	 * @param variabeList
	 */
	private void setResult(Map<String, Object> model, VariableList variabeList) {
		variabeList.add(NexacroConstant.ERROR_CODE,
				(String) model.get(NexacroConstant.ERROR_CODE));
		variabeList.add(NexacroConstant.ERROR_MSG,
				(String) model.get(NexacroConstant.ERROR_MSG));
	}
	
	/**
	 * 
	 * @param model
	 * @param variabeList
	 */
	public void setOutVariableMap(Map<String, Object> model, VariableList variabeList) {
		Map<String, Object> map = (Map<String, Object>) model .get(NexacroConstant.OUT_VARIABLES_ATT_NAME);

		if (map == null)
			return;
		Set<String> keySet = map.keySet();
		Iterator<String> iter = keySet.iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			Object value = map.get(key);
			Variable var = makeVariable(key, value);
			variabeList.add(var);
		}
	}

	protected Variable makeVariable(String name, Object value) {
		Variable var = new Variable(name);
		int dataType = ConvertDataType.getPlatformDataType(value);
		var.setType(dataType);
		var.set(value);
		return var;
	}

	/*
	 * 
	 */
	public void setOutDataSetMap(Map<String, Object> model, DataSetList dataSetList) {
		// 여러개의 Datast으로 이루어져있다.
		Map <String, List<Object>> map = (Map <String, List<Object>>) model.get(NexacroConstant.OUT_DATASET_ATT_NAME);
		List<Object> transInfo = (List<Object>) map.get(NexacroConstant.TRAN_INFO_DATASET_NAME);
		
		if (map == null || transInfo == null ){
			System.out.println("null is return");
			return;
		}
		for (int i = 0; i < transInfo.size(); i++) {
			NexacroTransactionVO mappingVO = (NexacroTransactionVO) transInfo.get(i);
			String datasetName = mappingVO.getStrOutDataset();				
			String voName = mappingVO.getStrOutVOClass();
			/*System.out.println("datasetName="+datasetName);
			System.out.println("voName="+voName);*/
			
			List<Object> obj = map.get(datasetName);				//Dataset이름으로 Object 가져오기
			DataSet ds = new DataSet(datasetName);
			
			convertObject2DataSet( ds, obj, voName);
			dataSetList.add(ds);
		}				
	}
	
	/**
	 * List 형태의 Object 정보를 이용하여 하나의 Dataset의 데이터를 세팅한다.
	 * 
	 * @param datasetInfo
	 * @param ds
	 */
	public void convertObject2DataSet(DataSet ds, List<Object> obj, String voClass) {
		int rowIndex = 0;

		DataSetVOMapping.makeDataSetColumn(voClass, ds);
		for (int i = 0; i < obj.size(); i++) {
			rowIndex = ds.newRow();
			Object data = obj.get(i);
			DataSetVOMapping.setDataSetRowFromVO(data, voClass, ds, i);
		}
	}
	
	
}

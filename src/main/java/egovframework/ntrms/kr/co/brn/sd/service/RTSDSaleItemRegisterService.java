/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTSDSaleItemRegisterService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")

public interface RTSDSaleItemRegisterService {
	List<Map> saleItemList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	List<Map> saleTirePatternList(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception;
	List<Map> saleSaleProdList(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception;
	List<Map> salePrimServiceList(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception;
	List<Map> saleRegAmtList(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception;
	List<Map> saleChnList(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception;	
	List<Map> saleExistingChnList(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception;
	List<Map> saleChnDtl(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception;
	List<Map> exclusiveList(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception;
	List<Map> saleChannelFilter(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception;
	List<Map> saleExemptiontList(Map<String, Object> invar, Map <String, DataSetMap> outDatast) throws Exception;
	Map listSaleRegAmtInfo(Map<String, Object> inVar) throws Exception;
	Map saveSaleItemInfo(Map<String, DataSetMap> inDataset, Map inVar) throws Exception;
	String maxSaleCd(Map<String, Object> inVar) throws Exception;
	Map saveTireDetail(Map<String, DataSetMap> inDataset, Map inVar) throws Exception;
	List<Map> saleSrvDtlList(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception;
	List<Map> saleSrvSetList(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception;
	List<Map> saleSrvSetDtlList(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception;
	/*Map saveTireDetail2(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	Map saveTireDetail3(Map<String, Object> inVar) throws Exception;*/
	
	
}

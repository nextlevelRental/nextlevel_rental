/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTSDSaleItemRegisterServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDSaleItemRegisterMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDSaleItemRegisterService")
public class RTSDSaleItemRegisterServiceImpl extends EgovAbstractServiceImpl implements RTSDSaleItemRegisterService {
	
	
	@Resource(name="rTSDSaleItemRegisterMapDAO")
	RTSDSaleItemRegisterMapDAO rTSDSaleItemRegisterMapDAO;

	//판매상품 목록조회
	public List<Map> saleItemList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTSDSaleItemRegisterMapDAO.saleItemList(inVar, outDataset);
	}

	//데이타생성, 수정, 삭제
	public Map saveSaleItemInfo(Map<String, DataSetMap> inDataset, Map inVar)
		throws Exception {
		DataSetMap dsSaleItemList 	= (DataSetMap)inDataset.get("dsSaleItemList");
		DataSetMap dsTirePattenList = (DataSetMap)inDataset.get("dsTirePattenList");
		DataSetMap dsSaleProdList 	= (DataSetMap)inDataset.get("dsSaleProdList");
		DataSetMap dsRegAmtMgnt		= (DataSetMap)inDataset.get("dsRegAmtMgnt");
		DataSetMap dsSeviceCd 		= (DataSetMap)inDataset.get("dsSeviceCd");
		DataSetMap dsExemption 		= (DataSetMap)inDataset.get("dsExemption");
		DataSetMap dsChnDtl			= (DataSetMap)inDataset.get("ds_chnDtl");
		DataSetMap dsServiceDtl			= (DataSetMap)inDataset.get("dsSeviceCdDtl");

		
		//판매상품
		Map dsSaleItemListMap = new HashMap();
		dsSaleItemListMap.put("dsSaleItemListMap", dsSaleItemList);
		dsSaleItemListMap.put("sqlnamespace", "saleItem.insertSaleItem");
		
		//판매주제품(타이어)
		Map dsTirePattenListMap = new HashMap();
		dsTirePattenListMap.put("dsTirePattenListMap", dsTirePattenList);
		dsTirePattenListMap.put("sqlnamespace", "saleItem.insertSalePattern");
		
		//판매부가제품(결합상품)
		Map dsSaleProdListMap = new HashMap();
		dsSaleProdListMap.put("dsSaleProdListMap", dsSaleProdList);
		dsSaleProdListMap.put("sqlnamespace", "saleItem.insertSalePrdtInfo");
		
		//등록비관리
		Map dsRegAmtMgntMap = new HashMap();
		dsRegAmtMgntMap.put("dsRegAmtMgntMap", dsRegAmtMgnt);
		dsRegAmtMgntMap.put("sqlnamespace", "saleItem.insertSaleRegAmt");
		
		//프리미엄서비스
		Map dsSaleSeviceListMap = new HashMap();
		dsSaleSeviceListMap.put("dsSaleSeviceListMap", dsSeviceCd);
		dsSaleSeviceListMap.put("sqlnamespaceDel", "saleItem.DeletePrimService");
		dsSaleSeviceListMap.put("sqlnamespace", "saleItem.insertSalePrimService");
		
		//면제회차
		Map dsExemptionMap = new HashMap();
		dsExemptionMap.put("dsExemptionMap", dsExemption);
		dsExemptionMap.put("sqlnamespaceDel", "saleItem.deleteSaleExemption");
		dsExemptionMap.put("sqlnamespace", "saleItem.insertSaleExemption");
		
		//채널구분
		Map dsChnDtlMap = new HashMap();
		dsChnDtlMap.put("dsChnDtlMap", dsChnDtl);
		dsChnDtlMap.put("sqlnamespaceDel", "saleItem.f_DeleteRtsd0045");
		dsChnDtlMap.put("sqlnamespace", "saleItem.saveSaleChnDtl");
		
		
		return rTSDSaleItemRegisterMapDAO.saveSaleItemInfo(dsSaleItemListMap, dsTirePattenListMap, dsSaleProdListMap, dsSaleSeviceListMap, dsRegAmtMgntMap, dsExemptionMap, dsChnDtlMap, inVar);
		
	}
	
	//추가버튼 클릭 시 판매코드 채번
	public String maxSaleCd(Map<String, Object> inVar) throws Exception {
		return rTSDSaleItemRegisterMapDAO.maxSaleCd(inVar);
	}
	
	//판매주제품(타이어)목록조회
	public List<Map> saleTirePatternList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTSDSaleItemRegisterMapDAO.saleTirePatternList(inVar, outDataset);
	}
	
	//판매부가제품(결합상품) 조회
	public List<Map> saleSaleProdList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTSDSaleItemRegisterMapDAO.saleSaleProdList(inVar, outDataset);
	}
	
	//프리미엄서비스 조회
	public List<Map> salePrimServiceList(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTSDSaleItemRegisterMapDAO.salePrimServiceList(invar, outDataset);
	}
	
	//등록비관리
	public List<Map> saleRegAmtList(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTSDSaleItemRegisterMapDAO.saleRegAmtList(invar, outDataset);
	}

	//[추가] 채널목록
	public List<Map> saleChnList(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTSDSaleItemRegisterMapDAO.saleChnList(invar, outDataset);
	}	

	//기존 채널정보
	public List<Map> saleExistingChnList(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTSDSaleItemRegisterMapDAO.saleExistingChnList(invar, outDataset);
	}	
	
	//[추가] 채널상세
	public List<Map> saleChnDtl(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTSDSaleItemRegisterMapDAO.saleChnDtl(invar, outDataset);
	}
	
	//기존제외 조회
	public List<Map> exclusiveList(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTSDSaleItemRegisterMapDAO.exclusiveList(invar, outDataset);
	}	

	//필터조회
	public List<Map> saleChannelFilter(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTSDSaleItemRegisterMapDAO.saleChannelFilter(invar, outDataset);
	}	
	
	//면제회차
	public List<Map> saleExemptiontList(Map<String, Object> invar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTSDSaleItemRegisterMapDAO.saleExemptionList(invar, outDataset);
	}
	
	//등록비조회
	public Map listSaleRegAmtInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	rTSDSaleItemRegisterMapDAO.saleRegAmtInfo(inVar));
		return result;
	}

	//패턴제외상품
	
	public Map saveTireDetail(Map<String, DataSetMap> inDataset, Map inVar) throws Exception {
		DataSetMap dssaveTireDetail = (DataSetMap)inDataset.get("dssaveTireDetail");
		//프리미엄서비스
		Map dssaveTireDetailMap = new HashMap();
		dssaveTireDetailMap.put("dssaveTireDetailMap", dssaveTireDetail);
		dssaveTireDetailMap.put("sqlnamespaceDel", "saleItem.DeleteTireDetail");
		dssaveTireDetailMap.put("sqlnamespace", "saleItem.saveTireDetail");
		return rTSDSaleItemRegisterMapDAO.saveTireDetail(dssaveTireDetailMap, inVar);
	}
	
	@Override
	public List<Map> saleSrvSetList(Map<String, Object> invar, Map<String, DataSetMap> outDataset) throws Exception {
		// TODO Auto-generated method stub
		return rTSDSaleItemRegisterMapDAO.saleSrvSetList(invar);
	}

	@Override
	public List<Map> saleSrvSetDtlList(Map<String, Object> invar, Map<String, DataSetMap> outDataset) throws Exception {
		// TODO Auto-generated method stub
		return rTSDSaleItemRegisterMapDAO.saleSrvSetDtlList(invar);
	}

	@Override
	public List<Map> saleSrvDtlList(Map<String, Object> invar, Map<String, DataSetMap> outDataset) throws Exception {
		// TODO Auto-generated method stub
		return rTSDSaleItemRegisterMapDAO.saleSrvDtlList(invar);
	}
		
	/*//패턴제외상품2
	public Map saveTireDetail2(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "saleItem.saveTireDetail2");
		return rTSDSaleItemRegisterMapDAO.saveTireDetail2(inVar);
	}
	//타이어정보 조회
	public Map saveTireDetail3(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	rTSDSaleItemRegisterMapDAO.saveTireDetail3(inVar));
		return result;
	}
*/
}

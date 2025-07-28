/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTSDSaleRegisterServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDSaleRegisterMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDSaleRegisterService")
public class RTSDSaleRegisterServiceImpl extends EgovAbstractServiceImpl implements RTSDSaleRegisterService {
	
	
	@Resource(name="rTSDSaleRegisterMapDAO")
	RTSDSaleRegisterMapDAO rTSDSaleRegisterMapDAO;

	//목록조회
	public List<Map> saleList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTSDSaleRegisterMapDAO.saleList(inVar, outDataset);
	}

	//데이타생성, 수정, 삭제
	public Map saveSaleInfo(Map<String, DataSetMap> inDataset, Map inVar)
		throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "sale.insertSale");
		return rTSDSaleRegisterMapDAO.saveSaleInfo(inVar);
		
	}
	
	
}

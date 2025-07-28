package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDBillModifyMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rtsdBillModifyService")
@SuppressWarnings("unchecked")
public class RTSDBillModifyServiceImpl extends EgovAbstractServiceImpl implements RTSDBillModifyService {
    
	@Resource(name="rtsdBillMapDAO")
	RTSDBillModifyMapDAO rtsdBillMapDAO;
	
	//계산서 정보 List
	public Map listBillInfo(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("billList", rtsdBillMapDAO.listBillInfo(inVar, outDataset));
		return result;
	}
    
	//발행여부 저장
	public Map saveBillData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "bill.saveBillData");
		Map result = rtsdBillMapDAO.saveBillData(inVar);
		return result;	
	}

}

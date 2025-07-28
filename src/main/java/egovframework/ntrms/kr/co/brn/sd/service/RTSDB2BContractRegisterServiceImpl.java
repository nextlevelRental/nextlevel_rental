package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDB2BContractRegisterMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDB2BContractRegisterService")
@SuppressWarnings("unchecked")
public class RTSDB2BContractRegisterServiceImpl extends EgovAbstractServiceImpl implements RTSDB2BContractRegisterService{
	@Resource(name="rTSDB2BContractRegisterMapDAO")
	RTSDB2BContractRegisterMapDAO rTSDB2BContractRegisterMapDAO;
	
	@SuppressWarnings("rawtypes")
	public Map saveB2BContractRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		
		DataSetMap dsRtsd0104 = (DataSetMap)inDataset.get("dsRtsd0104");
		Map dsRtsd0104Map = new HashMap();
		dsRtsd0104Map.put("dsRtsd0104Map", dsRtsd0104);
		dsRtsd0104Map.put("sqlnamespace", "contact.dsRtsd0104");
		
		DataSetMap dsRtsd0106 = (DataSetMap)inDataset.get("dsRtsd0106");
		Map dsRtsd0106Map = new HashMap();
		dsRtsd0106Map.put("dsRtsd0106Map", dsRtsd0106);
		dsRtsd0106Map.put("sqlnamespace", "contact.dsRtsd0106");
		
		DataSetMap dsRtsd0013 = (DataSetMap)inDataset.get("dsRtsd0013");
		Map dsRtsd0013Map = new HashMap();
		dsRtsd0013Map.put("dsRtsd0013Map", dsRtsd0013);
		dsRtsd0013Map.put("sqlnamespaceDel", "contact.f_DeleteRtsd0013");
		dsRtsd0013Map.put("sqlnamespace", "contact.dsRtsd0013");
		
		DataSetMap dsRtsd0014 = (DataSetMap)inDataset.get("dsRtsd0014");
		Map dsRtsd0014Map = new HashMap();
		dsRtsd0014Map.put("dsRtsd0014Map", dsRtsd0014);
		dsRtsd0014Map.put("sqlnamespaceDel", "contact.f_DeleteRtsd0014");
		dsRtsd0014Map.put("sqlnamespace", "contact.dsRtsd0014");
		
		// 2016-07-28 이영근, 문자메시지 발송 추가
		DataSetMap dsRtsd0205 = (DataSetMap)inDataset.get("dsRtsd0205");
		Map dsRtsd0205Map = new HashMap();
		dsRtsd0205Map.put("dsRtsd0205Map", dsRtsd0205);
		dsRtsd0205Map.put("mobNo", dsRtsd0205.getMapValue(0, "mobNo"));
		dsRtsd0205Map.put("smsMsg", dsRtsd0205.getMapValue(0, "smsMsg"));
		dsRtsd0205Map.put("chanCd", dsRtsd0205.getMapValue(0, "chanCd"));
		dsRtsd0205Map.put("sqlnamespace", "cust.saveSmsMsg");		
		
		return rTSDB2BContractRegisterMapDAO.saveB2BContractRegister(dsRtsd0104Map, dsRtsd0106Map, dsRtsd0013Map, dsRtsd0014Map, dsRtsd0205Map, inVar);		
	}
}

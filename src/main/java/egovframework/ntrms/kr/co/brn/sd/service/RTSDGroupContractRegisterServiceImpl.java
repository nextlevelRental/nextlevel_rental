package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDGroupContractRegisterMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDGroupContractRegisterService")
@SuppressWarnings("unchecked")
public class RTSDGroupContractRegisterServiceImpl extends EgovAbstractServiceImpl implements RTSDGroupContractRegisterService{
	@Resource(name="rTSDGroupContractRegisterMapDAO")
	RTSDGroupContractRegisterMapDAO rTSDGroupContractRegisterMapDAO;
	

	
	public Map saveGroupContractRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap bank = (DataSetMap)inDataset.get("dsRtre0010");
		DataSetMap card = (DataSetMap)inDataset.get("dsRtre0020");
		
		Map bankAndCardMap = new HashMap();
		if( bank.size() != 0 ){
			bankAndCardMap.put("bankAndCardMap", bank);
			bankAndCardMap.put("sqlnamespace", "contact.saveBank");
		}else if( card.size() != 0 ){
			bankAndCardMap.put("bankAndCardMap", card);
			bankAndCardMap.put("sqlnamespace", "contact.saveCard");
		}
		
		
		DataSetMap dsRtsd0104 = (DataSetMap)inDataset.get("dsRtsd0104");
		Map dsRtsd0104Map = new HashMap();
		dsRtsd0104Map.put("dsRtsd0104Map", dsRtsd0104);
		dsRtsd0104Map.put("sqlnamespace", "contact.dsRtsd0104");
		
		DataSetMap dsRtsd0106 = (DataSetMap)inDataset.get("dsRtsd0106");
		Map dsRtsd0106Map = new HashMap();
		dsRtsd0106Map.put("dsRtsd0106Map", dsRtsd0106);
		dsRtsd0106Map.put("sqlnamespaceDel", "contact.f_DeleteRtsd0106New");
		dsRtsd0106Map.put("sqlnamespaceSaleDel", "contact.f_DeleteRtsd0040");
		dsRtsd0106Map.put("sqlnamespace", "contact.dsRtsd0106New");
		
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
		
		DataSetMap dsRtsd0041 = (DataSetMap)inDataset.get("dsRtsd0041");
		Map dsRtsd0041Map = new HashMap();
		dsRtsd0041Map.put("dsRtsd0041Map", dsRtsd0041);
		dsRtsd0041Map.put("sqlnamespaceDel", "contact.f_DeleteRtsd0041");
		dsRtsd0041Map.put("sqlnamespace", "contact.dsRtsd0041");
		
		// 2016-07-28 이영근, 문자메시지 발송 추가
		DataSetMap dsRtsd0205 = (DataSetMap)inDataset.get("dsRtsd0205");
		Map dsRtsd0205Map = new HashMap();
		dsRtsd0205Map.put("dsRtsd0205Map", dsRtsd0205);
		dsRtsd0205Map.put("mobNo", dsRtsd0205.getMapValue(0, "mobNo"));
		dsRtsd0205Map.put("smsMsg", dsRtsd0205.getMapValue(0, "smsMsg"));
		dsRtsd0205Map.put("chanCd", dsRtsd0205.getMapValue(0, "chanCd"));
		dsRtsd0205Map.put("sqlnamespace", "cust.saveSmsMsg");		

		// [20181122_01] 방문장착 추가
		DataSetMap dsRtsd0401 = (DataSetMap)inDataset.get("dsRtsd0401");
		Map dsRtsd0401Map = new HashMap();
		dsRtsd0401Map.put("dsRtsd0401Map", dsRtsd0401);
		dsRtsd0401Map.put("sqlnamespace", "contact.dsRtsd0401");
		
		return rTSDGroupContractRegisterMapDAO.saveGroupContractRegister(bankAndCardMap, dsRtsd0104Map, dsRtsd0106Map, dsRtsd0013Map, dsRtsd0014Map, dsRtsd0205Map, dsRtsd0041Map, dsRtsd0401Map, inVar);		
	}

	public Map getUserChanCdList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("userChanCdList",	rTSDGroupContractRegisterMapDAO.getUserChanCdList(inVar));
		return result;
	}
	
	public String getregiAmtRt(Map<String, Object> inVar) throws Exception {
		return rTSDGroupContractRegisterMapDAO.getregiAmtRt(inVar);
	}
	
	
	public Map setRegiAmtPay(Map<String, Object> inVar) throws Exception {
		return rTSDGroupContractRegisterMapDAO.setRegiAmtPay(inVar);
	}
	
}


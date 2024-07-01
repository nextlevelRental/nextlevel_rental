package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDContractStatusMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDContractStatusService")
@SuppressWarnings("unchecked")
public class RTSDContractStatusServiceImpl extends EgovAbstractServiceImpl implements RTSDContractStatusService{
	@Resource(name="rTSDContractStatusMapDAO")
	RTSDContractStatusMapDAO rTSDContractStatusMapDAO;
	
	public Map listStatus(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listStatus", rTSDContractStatusMapDAO.listStatus(inVar, outDataset));
		return result;
	}
	
	public Map listInstall(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listInstall", rTSDContractStatusMapDAO.listInstall(inVar, outDataset));
		return result;
	}
	
	public Map listPay(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listPay", rTSDContractStatusMapDAO.listPay(inVar, outDataset));
		return result;
	}
	
	public Map listDiscount(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listDiscount", rTSDContractStatusMapDAO.listDiscount(inVar, outDataset));
		return result;
	}
	
	public Map listAgree(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listAgree", rTSDContractStatusMapDAO.listAgree(inVar, outDataset));
		return result;
	}
	
	public Map listPreminum(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listPreminum", rTSDContractStatusMapDAO.listPreminum(inVar, outDataset));
		return result;
	}
	
	public Map listSeller(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listSeller", rTSDContractStatusMapDAO.listSeller(inVar, outDataset));
		return result;
	}
	
	public Map listEleSig(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listEleSig", rTSDContractStatusMapDAO.listEleSig(inVar, outDataset));
		return result;
	}
	
	public Map getOrgInfoList(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("orgInfoList", rTSDContractStatusMapDAO.getOrgInfoList(inVar));
		return result;
	}
	
	public Map saveOrdCancel(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		DataSetMap inDsMap1 = (DataSetMap)inDataset.get("input1");
		inVar.put("inDsMap", inDsMap);
		inVar.put("inDsMap1", inDsMap1);
		inVar.put("sqlnamespace", "contractStatus.p_Rtsd0104statupdate");
		return rTSDContractStatusMapDAO.saveOrdCancel(inVar);
	}
	
	public Map rtsd0104AgencyUpdate(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "contractStatus.rtsd0104AgencyUpdate");
		return rTSDContractStatusMapDAO.rtsd0104AgencyUpdate(inVar);
	}
	
	public Map pIUDRtsd0118(Map<String, Object> inVar) throws Exception {
		return rTSDContractStatusMapDAO.pIUDRtsd0118(inVar);
	}
	
	public int s082Cnt(Map<String, Object> inVar) throws Exception {
		int result = 0;
		result = rTSDContractStatusMapDAO.s082Cnt(inVar);
		return result;
	}
	
	public String codeName(Map<String, Object> inVar) throws Exception {
		String result = "";
		result = rTSDContractStatusMapDAO.codeName(inVar);
		return result;
	}
	
	public Map signHistory(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("signHistory", rTSDContractStatusMapDAO.signHistory(inVar, outDataset));
		return result;
	}
	
	public Map saveRTCOMMCarInfoUpdate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "contractStatus.saveRTCOMMCarInfoUpdate");
		return rTSDContractStatusMapDAO.saveRTCOMMCarInfoUpdate(inVar);
	}

	public Map saveRTCOMMOrdDelete(Map<String, Object> inVar) throws Exception {
		return rTSDContractStatusMapDAO.saveRTCOMMOrdDelete(inVar);
	}
	
	public Map saveRTCOMMSvcDelete(Map<String, Object> inVar) throws Exception {
		return rTSDContractStatusMapDAO.saveRTCOMMSvcDelete(inVar);
	}
	
	public Map saveRTRE100Update(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		//gubun이 0:backup, 1:rollback
		String gubun = (String)inDsMap.getMapValue(0, "gubun");
		if(gubun == "0"){
			inVar.put("sqlnamespace", "contractStatus.saveRTRE100BackUp");
		}else{
			inVar.put("sqlnamespace", "contractStatus.saveRTRE100RollBack");
		}
		
		return rTSDContractStatusMapDAO.saveRTRE100Update(inVar);
	}
	
	public Map saveServiceB00006(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		return rTSDContractStatusMapDAO.saveServiceB00006(inVar);
	}
	
	public String sRtcs0204WriteYn(Map<String, Object> inVar) throws Exception {
		String result = rTSDContractStatusMapDAO.sRtcs0204WriteYn(inVar);
		return result;
	}
	public Map AdviceStatus(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("AdviceStatus", rTSDContractStatusMapDAO.AdviceStatus(inVar, outDataset));
		return result;
	}
	public Map saveRtsd0213(Map <String, Object> inVar) throws Exception {
		return rTSDContractStatusMapDAO.saveRental2Oms(inVar);		
	}
	public Map addNewService(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "contact.dsRtsd0013");
		return rTSDContractStatusMapDAO.addNewService(inVar);
	}
	public Map addServCnt0(Map<String, Object> inVar) throws Exception {
		return rTSDContractStatusMapDAO.addServCnt0(inVar);
	}
	public Map listEndContract(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listEndContract", 	rTSDContractStatusMapDAO.listEndContract(inVar));
		return result;
	}
	public Map listCancContract(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("listCancContract", 	rTSDContractStatusMapDAO.listCancContract(inVar));
		return result;
	}
}

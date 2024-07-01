package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDCustRegisterMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDCustRegisterService")
@SuppressWarnings("unchecked")
public class RTSDCustRegisterServiceImpl extends EgovAbstractServiceImpl implements RTSDCustRegisterService{
	@Resource(name="rTSDCustRegisterMapDAO")
	RTSDCustRegisterMapDAO rTSDCustRegisterMapDAO;
	
	public String safeKeyConfirm(Map<String, Object> inVar) throws Exception {
		return rTSDCustRegisterMapDAO.safeKeyConfirm(inVar);
	}
	
	public String countSafeKey(Map<String, Object> inVar) throws Exception {
		return rTSDCustRegisterMapDAO.countSafeKey(inVar);
	}
	
	public Map saveSafeKey(Map <String, Object> inVar) throws Exception {
		return rTSDCustRegisterMapDAO.saveSafeKey(inVar);
	}
	
	public int checkBuslNo(Map<String, Object> inVar) throws Exception {
		return rTSDCustRegisterMapDAO.checkBuslNo(inVar);
	}
	
	public Map saveCustRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {
		DataSetMap inDsMap1 = (DataSetMap)inDataset.get("input1");
		Map dsRtsd0100Map = new HashMap();
		dsRtsd0100Map.put("inDsMap1", inDsMap1);
		dsRtsd0100Map.put("sqlnamespace", "cust.saveRtsd0100");
		
		DataSetMap inDsMap2 = (DataSetMap)inDataset.get("input2");
		Map dsRtsd0110Map = new HashMap();
		dsRtsd0110Map.put("inDsMap2", inDsMap2);
		dsRtsd0110Map.put("sqlnamespace", "cust.saveRtsd0110");
		
		DataSetMap inDsMap3 = (DataSetMap)inDataset.get("input3");
		Map onlineMap = new HashMap();
		onlineMap.put("inDsMap3", inDsMap3);
		onlineMap.put("sqlnamespace", "cust.saveOnline");
		
		DataSetMap inDsMap4 = (DataSetMap)inDataset.get("input4");
		Map onlineUpdateMap = new HashMap();
		onlineUpdateMap.put("inDsMap4", inDsMap4);
		onlineUpdateMap.put("sqlnamespace", "cust.updateOnline");
		
		Map result = rTSDCustRegisterMapDAO.saveCustRegister(dsRtsd0100Map, dsRtsd0110Map, onlineMap, onlineUpdateMap, inVar);
		return result;		
	}
	
	//계좌 select
	public Map getaccList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("accList", 	rTSDCustRegisterMapDAO.getaccList(inVar, outDataset));
		return result;		
	}
	
	//계좌 데이타생성, 수정, 삭제
	public Map saveAccData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar)
		throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		for(int i = 0; i<inDsMap.size(); i++) {
			Map map = inDsMap.get(i);
			map.put("regId", inVar.get("regId"));
			int rowType = ((Integer) map.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
			if(rowType == DataSet.ROW_TYPE_INSERTED) {
				map.put("dvsn", "I");
			} else if(rowType == DataSet.ROW_TYPE_UPDATED) {
				map.put("dvsn", "U");
			} else if(rowType == DataSet.ROW_TYPE_DELETED) {
				map.put("dvsn", "D");
			}
		}
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "cust.saveDataSetBank");
		return rTSDCustRegisterMapDAO.saveAccData(inVar);
		
	}
	
	//카드 select
	public Map getcardList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("cardList", 	rTSDCustRegisterMapDAO.getcardList(inVar, outDataset));
		return result;		
	}
	
	//카드 데이타생성, 수정, 삭제
	public Map saveCardData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar)
		throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		for(int i = 0; i<inDsMap.size(); i++) {
			Map map = inDsMap.get(i);
			map.put("regId", inVar.get("regId"));
			
		}
		inVar.put("inDsMap", inDsMap);
		inVar.put("sqlnamespace", "cust.saveDataSetCard");
		return rTSDCustRegisterMapDAO.saveCardData(inVar);
		
	}

	public Map selectRtsd0110(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("selectRtsd0110", 	rTSDCustRegisterMapDAO.selectRtsd0110(inVar, outDataset));
		return result;
	}
	
	public Map selectRtsd0111(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("selectRtsd0111", 	rTSDCustRegisterMapDAO.selectRtsd0111(inVar, outDataset));
		return result;
	}
	
	public Map selectRtsd0111_2(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("selectRtsd0111_2", 	rTSDCustRegisterMapDAO.selectRtsd0111_2(inVar, outDataset));
		return result;
	}
	
	//IR SafeKey 전문내용저장처리
	public Map createIRSafeKey(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		rTSDCustRegisterMapDAO.createIRSafeKey(inVar);
		return inVar;
	}
	//Nice 신용정보 전문내용저장처리
	public Map createNiceTrust(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		rTSDCustRegisterMapDAO.createNiceTrust(inVar);
		return inVar;
	}

	//Nice 신용정보 당일저장건 여부조회(SafeKey + 생성일)
	public Map searchTodayNiceData(Map<String, Object> inVar) throws Exception {
		return rTSDCustRegisterMapDAO.searchTodayNiceData(inVar);
	}
	
	//Nice 신용정보 전문내용저장처리
	public Map createNice0202(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		rTSDCustRegisterMapDAO.createNice0202(inVar);
		return inVar;
	}
	
	public String onlineEnterdupe(Map<String, Object> inVar) throws Exception {
		return rTSDCustRegisterMapDAO.onlineEnterdupe(inVar);
	}
	
	public int onlineDupe(Map<String, Object> inVar) throws Exception {
		return rTSDCustRegisterMapDAO.onlineDupe(inVar);
	}
	
	public Map insertRtsd0110(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception {		
		DataSetMap inDsMap2 = (DataSetMap)inDataset.get("input2");
		Map dsRtsd0110Map = new HashMap();
		dsRtsd0110Map.put("inDsMap2", inDsMap2);
		dsRtsd0110Map.put("sqlnamespace", "cust.saveRtsd0110");
		
		Map result = rTSDCustRegisterMapDAO.insertRtsd0110(dsRtsd0110Map, inVar);
		return result;		
	}
	
	/*
	 * SMS메세지 저장
	 * @param map
	 * @return
	 * @throws NtRmsDaoException
	 */
	public Map saveSmsMsg(Map<String, Object> inVar) throws Exception {	
		return rTSDCustRegisterMapDAO.saveSmsMsg(inVar);		
	}
	
	//재렌탈기준조회
	public List<Map> getReRentalInfo(Map <String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		return rTSDCustRegisterMapDAO.getReRentalInfo(inDataset, inVar);
	}
}



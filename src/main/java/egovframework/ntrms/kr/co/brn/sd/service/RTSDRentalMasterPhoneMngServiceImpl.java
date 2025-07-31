/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import com.nexacro.xapi.data.DataSet;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDRentalMasterPhoneMngMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("rtsdRentalMasterPhoneMngService")
@SuppressWarnings("unchecked")
public class RTSDRentalMasterPhoneMngServiceImpl extends EgovAbstractServiceImpl implements RTSDRentalMasterPhoneMngService {
	
	@Resource(name="rtsdRentalMasterPhoneMngMapDAO")
	RTSDRentalMasterPhoneMngMapDAO rtsdRentalMasterPhoneMngMapDAO;

	/**
	 * 2차인증 사용자 목록조회
	 */
	public Map listRentalAuthPhoneInfo(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listUserInfo", rtsdRentalMasterPhoneMngMapDAO.listRentalAuthPhoneInfo(inVar, outDataset));
		return  result;
	}

	/**
	 * 2차인증 사용자 저장
	 */
	public Map saveRentalAuthPhone (Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap1 = (DataSetMap)inDataset.get("input2");
		Map areaMap = new HashMap();
		for(int i = 0; i<inDsMap1.size(); i++) {
			areaMap = inDsMap1.get(i);
			int rowType = ((Integer) areaMap.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
			if(rowType == DataSet.ROW_TYPE_INSERTED) {
				areaMap.put("dvsn", "I");
			} else if(rowType == DataSet.ROW_TYPE_UPDATED) {
				areaMap.put("dvsn", "U");
			} else if(rowType == DataSet.ROW_TYPE_DELETED) {
				areaMap.put("dvsn", "D");
			}
		}
		areaMap.put("inDsMap", inDsMap1);
		areaMap.put("sqlnamespace", "rentalMasterPhoneMng.saveRentalAuthPhone");

		List list = new ArrayList();
		list.add(areaMap);

		return rtsdRentalMasterPhoneMngMapDAO.saveRentalAuthPhone (inVar, list);
	}
}

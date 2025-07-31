/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTSDRentalMasterPhoneMngService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

import java.util.Map;

@SuppressWarnings("unchecked")
 
public interface RTSDRentalMasterPhoneMngService {
	/**
	 * 2차인증 사용자 목록조회
	 */
	Map listRentalAuthPhoneInfo(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;

	/**
	 * 2차인증 사용자 저장
	 */
	Map saveRentalAuthPhone(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
}
 
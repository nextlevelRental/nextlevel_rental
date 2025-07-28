/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTCSResultService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@SuppressWarnings("unchecked")

public interface RTCSRegularCheckService {
	List<Map> selectWorkList(Map<String, Object> inVar) throws Exception;
	List<Map> infoChange(Map<String, Object> inVar) throws Exception;
	Map saveReqularCheck(Map <String, DataSetMap> inDataset) throws Exception;
	String getMrCd(Map<String, Object> inVar) throws Exception;
	List<Map> infoResult(Map<String, Object> inVar) throws Exception;
	Map saveInfoResult(Map <String, DataSetMap> inDataset) throws Exception;
	List<Map> serviceHistory(Map<String, Object> inVar) throws Exception;
	List<Map> selectUserInfo(Map<String, Object> inVar) throws Exception;
	List<Map> selectCallList(Map<String, Object> inVar) throws Exception;
	Map <String, Object> listContact(Map <String, Object> mapInVar) throws Exception;	
	Map <String, Object> listExcelContact(Map <String, Object> mapInVar) throws Exception;
	Map <String, Object> saveContact(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
	Map saveContactChange(Map <String, DataSetMap> inDataset) throws Exception;
	Map <String, Object> selectBldMr(Map <String, Object> mapInVar) throws Exception;
	Map <String, Object> selectAddr1Mr(Map <String, Object> mapInVar) throws Exception;
	Map <String, Object> selectMrMonDecideCnt(Map <String, Object> mapInVar) throws Exception;
	Map <String, Object> selectMrDayDecide(Map <String, Object> mapInVar) throws Exception;
	Map <String, Object> selectDenyList(Map <String, Object> mapInVar) throws Exception;
	Map saveDeny(Map <String, DataSetMap> inDataset, Map<String, Object> mapInVar) throws Exception;
	Map saveWithdraw(Map <String, DataSetMap> inDataset, Map<String, Object> mapInVar) throws Exception;
	Map saveRollBack(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
//	void excelExportTest(Map<String, Object> inVar) throws Exception;
	Map <String, Object> saveVisitChangeTemp(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception;
	Map <String, Object> saveChangeVisitSchedule(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception;
}

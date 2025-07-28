/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTCMUserService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;


@SuppressWarnings("unchecked")

public interface RTCSInboundAdviceRegisterService {
	Map sRtcs0103Region(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map sRtcs0103City(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map sRtcs0102Ctf(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map sRtcs0102Obf(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map sRtcs0102Ibf(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	Map saveRTCSInboundAdviceRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
	String selectSysdate(Map<String, Object> inVar) throws Exception;
	Map qusUpdateRTCSInboundAdviceRegister(Map<String, DataSetMap> inDataset, Map <String, Object> inVar) throws Exception;
}

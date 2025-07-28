/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREAccReqProcService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface RTRECmsMngService {
	Map getRtsd0109(Map param) throws Exception;
	Map insertRtre0030(DataSetMap dsm) throws Exception;
	Map insertRtre0031(DataSetMap dsm) throws Exception;
	Map insertRtre0040(DataSetMap dsm) throws Exception;
	Map updateRtsd0109(DataSetMap dsm) throws Exception;
	Map saveCmsProc(Map<String, DataSetMap> inMap) throws Exception;
}

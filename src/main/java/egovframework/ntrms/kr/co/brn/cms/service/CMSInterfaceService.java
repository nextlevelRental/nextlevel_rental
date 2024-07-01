/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTCMUserService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cms.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface CMSInterfaceService {
	//금융결제원 계좌번호 유효성체크
	Map kftcCmsDocInfo(Map<String, Object> inVar) throws Exception;
	Map existsCmsInterface(Map<String, Object> inVar) throws Exception;
}

/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: XPService.java
 * 3.Developer			: sian
 * 4.Development Date	: 2014.09.06
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sample.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("unchecked")
public interface SampleService {
	List<Map> getList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	void exampleSaveDaset(Map<String, DataSetMap> inDataset) throws Exception;
	void exampleArray(Map<String, DataSetMap> inDataset) throws Exception;
	
	//개인신용평가 조회후처리
	void createNiceTrustInfoMap(Map <String, Object> inVar)  throws Exception;
	//법인 신용평가 조회후처리
	void createNiceBusinessInfo(Map <String, Object> inVar)  throws Exception;
	//법인신용조회결과사용여부조회
	String selectBusinessInfo(Map<String, Object> inVar) throws Exception;
	//당일법인신용평가 조회여부
	List<Map> searchTodayBisData(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	//금융결제원 계좌번호 유효성체크
	Map kftcCmsDocInfo(Map<String, Object> inVar) throws Exception;
	//Nice신용조회 전문 조회 처리
	Map sendNiceTrustInfo(Map<String, Object> inVar) throws Exception;
}

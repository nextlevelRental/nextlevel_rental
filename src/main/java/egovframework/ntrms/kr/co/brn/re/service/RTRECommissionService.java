/************************************************************************************
 * 
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTRECommissionService.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.Map;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@SuppressWarnings("rawtypes")
public interface RTRECommissionService {
	/* 판매수수료 기초집계(대리점, 방판, 타이어뱅크) */
	Map rtreAgencyComm(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	/* 판매수수료 기초집계(오픈몰) */
	Map rtreMallComm(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	/* 서비스수수료 기초집계 */
	Map serviceChargeAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	/* 충당금 설정처리 */
	Map allowanceAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	/* 장착수수료 기초집계 */
	Map installCommission(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	/* 수수료 이연처리 */
	Map commPostPone(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	/* 판매인별 수수료 내역집계 */
	Map agentCommission(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	/* 판매처별 수수료 현황 */
	Map saleCommissionList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	/* 충당금 적립 계약 조회 */
	Map allowanceSavingContractList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	/* 충당금 현황(검색내역) */
	Map allowanceResultList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	/* 충당금 현황(판매처별 세부내역) */
	Map getAgencyResultList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	/* 충당금 지급내역 조회 [20171117_02] */
	Map getAllowancePayList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	/* 충당금 지급내역 저장 [20171117_02] */
	Map saveAllowancePayList(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception;
	/* 개별 수수료 내역 조회(실시간 실적조회) */
	Map individualCommissionList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	/* 개별 수수료 내역 조회(실적조회) */
	Map getindividualCommissionList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception;
	/* 방문점검수수료 기초집계 목록을 조회한다 */
	Map <String, Object> listRegularchkComm(Map <String, Object> mapInVar) throws Exception;
	/* 방문점검수수료 기초정보를 집계한다 */
	Map <String, Object> regularchkCommAggregate(Map<String, Object> inVar) throws Exception;
	/* 방문점검수수료 변경정보를 저장(등록)하고 수수료를 변경한다 */
	Map <String, Object> saveRegularchkComm(Map<String, DataSetMap> mapInDSM, Map<String, Object> mapInVar) throws Exception;
}
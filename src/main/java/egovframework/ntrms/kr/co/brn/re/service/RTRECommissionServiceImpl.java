/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTRECommissionServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.brn.re.dao.RTRECommissionMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rtreCommissionService")
@SuppressWarnings({"rawtypes", "unchecked"})
public class RTRECommissionServiceImpl extends EgovAbstractServiceImpl implements RTRECommissionService {
	@Resource(name="rtreCommissionMapDAO")
	RTRECommissionMapDAO rtreCommissionMapDAO;
	
	/* 판매수수료 기초집계(대리점, 방판, 타이어뱅크) */
	public Map rtreAgencyComm(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "rtreCommissionMapDAO.rtreAgencyComm");
		Map result = (Map)rtreCommissionMapDAO.getRtreAgencyComm(inVar);
		return result;
	}
	
	/* 판매수수료 기초집계(오픈몰) */
	public Map rtreMallComm(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "rtreCommissionMapDAO.rtreMallComm");
		Map result = (Map)rtreCommissionMapDAO.getRtreMallComm(inVar);
		return result;
	}
	
	/* 서비스수수료 기초집계 */
	public Map serviceChargeAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "rtreCommissionMapDAO.serviceChargeAggregate");
		Map result = (Map)rtreCommissionMapDAO.getServiceChargeAggregate(inVar);
		return result;
	}
	
	/* 충당금 설정처리 */
	public Map allowanceAggregate(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "rtreCommissionMapDAO.allowanceAggregate");
		Map result = (Map) rtreCommissionMapDAO.getAllowanceAggregate(inVar);
		return result;
	}
	
	/* 장착수수료 기초집계 */
	public Map installCommission(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "rtreCommissionMapDAO.installCommission");
		Map result = (Map) rtreCommissionMapDAO.getInstallCommission(inVar);
		return result;
	}
	
	/* 수수료 이연처리 */
	public Map commPostPone(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "rtreCommissionMapDAO.commPostPone");
		Map result = (Map) rtreCommissionMapDAO.getCommPostPone(inVar);
		return result;
	}
	
	/* 판매인별 수수료 내역집계 */
	public Map agentCommission(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		inVar.put("sqlnamespace", "rtreCommissionMapDAO.agentCommission");
		Map result = (Map) rtreCommissionMapDAO.getAgentCommission(inVar);
		return result;
	}
	
	/* 판매처별 수수료 현황 */
	public Map saleCommissionList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listsaleCommission", rtreCommissionMapDAO.getSaleCommissionList(inVar, outDataset));
		return result;
	}
	
	/* 충당금 적립 계약 조회 */
	public Map allowanceSavingContractList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listallowanceSavingContract", rtreCommissionMapDAO.getAllowanceSavingContractList(inVar, outDataset));
		return result;
	}
	
	/* 충당금 현황(검색내역) */
	public Map allowanceResultList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listallowanceResult", rtreCommissionMapDAO.getAllowanceResultList(inVar, outDataset));
		return result;
	}
	
	/* 충당금 현황(판매처별 세부내역) */
	public Map getAgencyResultList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listagencyResult", rtreCommissionMapDAO.getAgencyResultList(inVar, outDataset));
		return result;
	}
	
	/**
	 * 총당금 지급내역 조회
	 * 
	 * @version	1.0
	 * @param	inVar			조회조건 Map객체
	 * @param	outDataset		조회관련 Dataset
	 * @return	Map				조회결과
	 * @throws	Exception
	 * 
	 * ------------------------------------------------------------
	 * Revision History
	 * ------------------------------------------------------------
	 * Ver		Date		Author		SR No			Description
	 * ------------------------------------------------------------
	 * 1.0		2017-11-23	wjim		20171117_02		신규생성		
	 */
	public Map getAllowancePayList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listAllowancePay", rtreCommissionMapDAO.getAllowancePayList(inVar, outDataset));
		return result;
	}
	
	/**
	 * 총당금 지급내역 저장
	 * 
	 * @version	1.0
	 * @param	inDataset		처리대상 Dataset
	 * @param	inVar			처리대상 Map객체
	 * @return	Map				처리결과
	 * @throws	Exception
	 * 
	 * ------------------------------------------------------------
	 * Revision History
	 * ------------------------------------------------------------
	 * Ver		Date		Author		SR No			Description
	 * ------------------------------------------------------------
	 * 1.0		2017-11-23	wjim		20171117_02		신규생성		
	 */
	public Map saveAllowancePayList(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		inVar.put("inDsMap", inDsMap);		
		inVar.put("sqlnamespace", "allowance.savePayList");
		
		Map result = (Map) rtreCommissionMapDAO.saveAllowancePayList(inVar);
		return result;
	}
	
	/* 개별 수수료 내역 조회(실시간 실적조회) */
	public Map individualCommissionList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listIndividualCommissionList", rtreCommissionMapDAO.listIndividualCommissionList(inVar, outDataset));
		return result;
	}
	
	/* 개별 수수료 내역 조회(실적조회) */
	public Map getindividualCommissionList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("getIndividualCommissionList", rtreCommissionMapDAO.getindividualCommissionList(inVar, outDataset));
		return result;
	}
	
	/**
	 * 방문점검수수료 기초집계 목록을 조회한다
	 * 
	 * @param	mapInVar
	 * @return	Map
	 * @throws	Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-05-25	wjim		신규생성
	 */
	public Map <String, Object> listRegularchkComm(Map <String, Object> mapInVar) throws Exception {
		Map <String, Object> mapResult = new HashMap <String, Object> ();
		mapResult.put("listRegularchkComm", rtreCommissionMapDAO.listRegularchkComm(mapInVar));
		return mapResult;
	}
	
	/**
	 * 방문점검수수료 기초정보를 집계한다
	 * 
	 * @param	mapInVar
	 * @return	Map
	 * @throws	Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-05-25	wjim		신규생성
	 */
	public Map <String, Object> regularchkCommAggregate(Map<String, Object> mapInVar) throws Exception {
		mapInVar.put("sqlnamespace", "rtreCommissionMapDAO.regularchkCommAggregate");
		Map result = (Map)rtreCommissionMapDAO.regularchkCommAggregate(mapInVar);
		return result;
	}
	
	/**
	 * 방문점검수수료 변경정보를 저장(등록)하고 수수료를 변경한다
	 * 
	 * @param	mapInDSM
	 * @param	mapInVar
	 * @return	Map
	 * @throws	Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-05-25	wjim		신규생성
	 */
	public Map <String, Object> saveRegularchkComm(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception {
		return rtreCommissionMapDAO.saveRegularchkComm(mapInDSM, mapInVar);
	}
}
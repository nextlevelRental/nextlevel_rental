package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.exec.handler.service.ServiceDaoBase;
import egovframework.ntrms.kr.co.exec.handler.service.dao.ComDao;
import egovframework.ntrms.kr.co.exec.model.ReturnType;
import egovframework.ntrms.kr.co.exec.model.ReturnTypeFactory;

/**
 * 추가 집계처리 비즈니스
 * 
 * @author 강신규
 * @since 2019. 1. 2. 오후 4:31:35
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2019. 1. 2. / 강신규 : 최초생성
 * </pre>
 */
@Service
public class RTREExtendCommissionService extends ServiceDaoBase {
	@Resource
	private ComDao comDao;
	
	/**
	 * 
	 * 
	 * @author 강신규
	 * @since 2019. 1. 2. 오후 4:31:35
	 * 
	 */
	@Override
	public void init() {
		this.DEFAULT_DAO = comDao;
	}
	
	/**
	 * 인센티브 기초집계
	 * 
	 * @author 강신규
	 * @since 2019. 1. 9. 오후 1:24:05
	 * @param slcmYm
	 * @param regId
	 * @return
	 */
	public ReturnType<?> calculateIncentive(String slcmYm, String regId) {
		return innerCalculate("rtreExtendCommission.incentiveAgg", slcmYm, regId);
	}
	
	/**
	 * 인센티브 2차집계 및 장려금 집계
	 * 
	 * @author 강신규
	 * @since 2019. 1. 9. 오후 1:24:09
	 * @param slcmYm
	 * @param regId
	 * @return
	 */
	public ReturnType<?> calculateSbs(String slcmYm, String regId) {
		return innerCalculate("rtreExtendCommission.sbsAgg", slcmYm, regId);
	}
	
	/**
	 * <pre>
	 * 조견표를 이용한
	 * 인센티브, 장려금 등 추가 집계
	 * </pre>
	 * @author 강신규
	 * @since 2019. 1. 17. 오후 1:30:23
	 * @param queryId
	 * @param slcmYm
	 * @param regId
	 * @return
	 */
	private ReturnType<?> innerCalculate(String queryId, String slcmYm, String regId) {
		Map<String, Object> map = new HashMap<>();
		map.put("slcmYm", slcmYm);
		map.put("regId",  regId);
		
		this.queryForObject(queryId, map);
		
		return ReturnTypeFactory.createReturnType().setOutVar(map).validateIfThrow();
	}
	
	/**
	 * <pre>
	 * 방문점검 수수료(기존패키지에서 쿼리만 수정함.)
	 * 
	 * 추가 조견표를 이용한 자동 집계
	 * </pre>
	 * @author 강신규
	 * @since 2019. 1. 9. 오후 1:16:16
	 * @param slcmYm
	 * @param regId
	 * @return
	 */
	public ReturnType<?> calculateVisitFees(String slcmYm, String regId) {
		Map<String, Object> map = new HashMap<>();
		map.put("slcmYm", slcmYm);
		map.put("regId", regId);
		
		this.queryForObject("rtreCommissionMapDAO.regularchkCommAggregateNew", map);
		
		return ReturnTypeFactory.createReturnType().setOutVar( map ).validateIfThrow();
	}
	
	/**
	 * 인센티브 기초집계 조회
	 * 
	 * @author 노창호
	 * @since 2019. 1. 18. 오후 1:10:15
	 * @param xpDto
	 * @param model
	 * @return List
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> retrieveIncBasAggrList(Map<String, Object> mapInVar) {
		this.queryForObject("rtreExtendCommission.retrieveIncBasAggrList", mapInVar);
		
		return (List<Map>)mapInVar.get("vcursor");
	}
	
	/**
	 * 인센티브 / 장려금 판매집계 조회
	 * 
	 * @author 노창호
	 * @since 2019. 1. 18. 오후 1:38:33
	 * @param xpDto
	 * @param model
	 * @return List
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> retrieveIncSbsSlsAggrList(Map<String, Object> mapInVar) {
		this.queryForObject("rtreExtendCommission.retrieveIncSbsSlsAggrList", mapInVar);
		
		return (List<Map>)mapInVar.get("vcursor");
	}
	
	/**
	 * 집계수행이력 조회
	 * 
	 * @author 노창호
	 * @since 2019. 1. 22. 오후 5:57:00
	 * @param xpDto
	 * @param model
	 * @return List
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> retrieveAggrExecHstList(Map<String, Object> mapInVar) {
		this.queryForObject("rtreExtendCommission.retrieveAggrExecHstList", mapInVar);
		
		return (List<Map>)mapInVar.get("vcursor");
	}
}
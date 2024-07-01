package egovframework.ntrms.kr.co.brn.re.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.MapUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.re.service.RTREExtendCommissionService;
import egovframework.ntrms.kr.co.exec.handler.controller.ControllerBase;
import egovframework.ntrms.kr.co.exec.model.ReturnType;
import egovframework.ntrms.kr.co.exec.model.ReturnTypeFactory;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

/**
 * 추가된 집계관련 서비스 호출 컨트롤러
 * 
 * @author 강신규
 * @since 2019. 1. 9. 오후 1:26:33
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2019. 1. 9. / 강신규 : 최초생성
 * </pre>
 */
@Controller("/ntrms/re/")
public class RTREExtendCommissionController extends ControllerBase {
	@Resource
	private RTREExtendCommissionService commissionService;
	
	/**
	 * 인센티브 기초집계 확장로직
	 * 
	 * @author 강신규
	 * @since 2019. 1. 17. 오후 1:51:28
	 * @param dto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("aggregateIncentive.do")
	public ModelAndView aggregateIncentive(NexacroMapDTO dto, Model model) throws Exception {
		ReturnType<?> returnType = null;
		
		try {
			Map<String, Object> mapInVar = dto.getInVariableMap();
			
			String slcmYm = MapUtils.getString(mapInVar, "slcmYm", "");
			String regId  = this.getCurrentUser().getUserId();
			
			returnType = this.commissionService.calculateIncentive(slcmYm, regId);
		} catch(Exception e) {
			returnType = ReturnTypeFactory.createReturnType(e);
		}
		
		return returnType.output();
	}
	
	/**
	 * 인센티브 2차집계 및 장려금 집계
	 * 
	 * @author 강신규
	 * @since 2019. 1. 17. 오후 1:52:19
	 * @param dto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("aggregateSbs.do")
	public ModelAndView aggregateSbs(NexacroMapDTO dto, Model model) throws Exception {
		ReturnType<?> returnType = null;
		
		try {
			Map<String, Object> mapInVar = dto.getInVariableMap();
			
			String slcmYm = MapUtils.getString(mapInVar, "slcmYm", "");
			String regId  = this.getCurrentUser().getUserId();
			
			returnType = this.commissionService.calculateSbs(slcmYm, regId);
		} catch(Exception e) {
			returnType = ReturnTypeFactory.createReturnType(e);
		}
		
		return returnType.output();
	}
	
	/**
	 * 방문점검 수수료 확장로직
	 * 
	 * @author 강신규
	 * @since 2019. 1. 11. 오전 9:43:09
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("aggregateVisitFee.do")
	public ModelAndView aggregateVisitFee(NexacroMapDTO xpDto, Model model) throws Exception {
		ReturnType<?> returnType = null;
		
		try {
			Map<String, Object> mapInVar = xpDto.getInVariableMap();
			
			String slcmYm = MapUtils.getString(mapInVar, "slcmYm", "");
			String regId  = this.getCurrentUser().getUserId();
			
			returnType = commissionService.calculateVisitFees(slcmYm, regId);
		} catch(Exception e) {
			returnType = ReturnTypeFactory.createReturnType(e);
		}
		
		return returnType.output();
	}
	
	/**
	 * 인센티브 기초집계 조회
	 * 
	 * @author 노창호
	 * @since 2019. 1. 18. 오후 1:10:15
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping("retrieveIncBasAggrList.do")
	public ModelAndView retrieveIncBasAggrList(NexacroMapDTO xpDto, Model model) throws Exception {
		ReturnType<?> returnType = null;
		
		try {
			Map<String, Object> mapInVar	  = xpDto.getInVariableMap();
			Map<String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			String regId  = this.getCurrentUser().getUserId();
			mapInVar.put("regId", regId);
			
			List<Map> incBasAggrList = commissionService.retrieveIncBasAggrList(mapInVar);
			
			DataSetMap dsm = new DataSetMap();
			dsm.setRowMaps(incBasAggrList);
			mapOutDSM.put("dsIncBasAggrList", dsm);
			
			returnType = ReturnTypeFactory.createReturnType().setOutDS(mapOutDSM);
		} catch(Exception e) {
			returnType = ReturnTypeFactory.createReturnType(e);
		}
		
		return returnType.output();
	}
	
	/**
	 * 인센티브 / 장려금 판매집계 조회
	 * 
	 * @author 노창호
	 * @since 2019. 1. 18. 오후 1:10:15
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping("retrieveIncSbsSlsAggrList.do")
	public ModelAndView retrieveIncSbsSlsAggrList(NexacroMapDTO xpDto, Model model) throws Exception {
		ReturnType<?> returnType = null;
		
		try {
			Map<String, Object> mapInVar	  = xpDto.getInVariableMap();
			Map<String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			String regId  = this.getCurrentUser().getUserId();
			mapInVar.put("regId", regId);
			
			List<Map> incSbsSlsAggrList = commissionService.retrieveIncSbsSlsAggrList(mapInVar);
			
			DataSetMap dsm = new DataSetMap();
			dsm.setRowMaps(incSbsSlsAggrList);
			mapOutDSM.put("dsIncSbsSlsAggrList", dsm);
			
			returnType = ReturnTypeFactory.createReturnType().setOutDS(mapOutDSM);
		} catch(Exception e) {
			returnType = ReturnTypeFactory.createReturnType(e);
		}
		
		return returnType.output();
	}
	
	/**
	 * 집계수행이력 조회
	 * 
	 * @author 노창호
	 * @since 2019. 1. 22. 오후 5:55:10
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("retrieveAggrExecHstList.do")
	public ModelAndView retrieveAggrExecHstList(NexacroMapDTO xpDto, Model model) throws Exception {
		ReturnType<?> returnType = null;
		
		try {
			Map<String, Object> mapInVar	  = xpDto.getInVariableMap();
			Map<String, DataSetMap> mapOutDSM = xpDto.getOutDataSetMap();
			
			List<Map> incSbsSlsAggrList = commissionService.retrieveAggrExecHstList(mapInVar);
			
			DataSetMap dsm = new DataSetMap();
			dsm.setRowMaps(incSbsSlsAggrList);
			mapOutDSM.put("dsAggrExecHstList", dsm);
			
			returnType = ReturnTypeFactory.createReturnType().setOutDS(mapOutDSM);
		} catch(Exception e) {
			returnType = ReturnTypeFactory.createReturnType(e);
		}
		
		return returnType.output();
	}
}
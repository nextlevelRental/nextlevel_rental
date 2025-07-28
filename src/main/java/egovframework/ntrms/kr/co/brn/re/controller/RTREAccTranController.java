/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTREAccTranController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.re.service.RTREAccTranService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREAccTranController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTREAccTranService")
	RTREAccTranService rTREAccTranService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	/**
	 * 공통코드 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getAccTranCommCode.do") 
	public ModelAndView getCodeInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map map = new HashMap();
			map.put("cd","");
			map.put("cdNm","전체");
			
			//출금상태 코드
			inVar.put("cdGrpCd", "R022");
			inVar.put("useYn", "Y");
			
			Map mapR022 = commonService.listCommInfo(inVar);
			List listR022 = (List)mapR022.get("result");		
			
			//전체항목 추가
			listR022.add(0, map);
			DataSetMap dsR022Maps = new DataSetMap();
			dsR022Maps.setRowMaps(listR022);
			outDataset.put("outputR022",	dsR022Maps);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/**
	 * 출금이체조회(계약번호별 내역조회)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getAccTranOrdNoList.do") 
	public ModelAndView getAccTranOrdNoList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map result = rTREAccTranService.getAccTranOrdNoList(inVar, outDataset);
			
			List li= (List)result.get("accTranOrdNoList");
			
			DataSetMap accDsMap = new DataSetMap();
		
			accDsMap.setRowMaps(li);

			outDataset.put("output",	accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}	
	
	/**
	 * 출금이체조회(은행별 내역조회)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getAccTranBankList.do") 
	public ModelAndView getAccTranBankList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map result = rTREAccTranService.getAccTranBankList(inVar, outDataset);
			
			List li= (List)result.get("accTranBankList");
			
			DataSetMap accDsMap = new DataSetMap();
			
			accDsMap.setRowMaps(li);
			
			outDataset.put("output",	accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}	
	
}

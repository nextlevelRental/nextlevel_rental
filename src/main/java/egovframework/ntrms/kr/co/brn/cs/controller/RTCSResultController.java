/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCSResultController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.cs.service.RTCSResultService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTCSResultController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTCSResultService")
	RTCSResultService rTCSResultService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@RequestMapping("/ntrms/cs/initResult.do") 
	public ModelAndView initResult(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			
			//상담유형 코드
			inVar.put("cdGrpCd", "H001");
			inVar.put("useYn", "Y");
			
			Map jobTp = commonService.listCommInfo(inVar);
			List jobTpResult		= (List)jobTp.get("result");	
		
			//통화상태 코드 
			inVar.put("cdGrpCd", "H002");
			inVar.put("useYn", "Y");
			
			Map callStatus = commonService.listCommInfo(inVar); 
			List callStatusResult		= (List)callStatus.get("result");	
			
			DataSetMap codeDsMap = new DataSetMap();
			DataSetMap codeDsMap2 = new DataSetMap();
			
			codeDsMap.setRowMaps(jobTpResult);
			codeDsMap2.setRowMaps(callStatusResult);

			outDataset.put("output", codeDsMap);
			outDataset.put("output2", codeDsMap2);
			
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

	@RequestMapping("/ntrms/cs/resultList.do") 
	public ModelAndView resultList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			//DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			//Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			//Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			List li = rTCSResultService.getResultList(inVar, outDataset);
			DataSetMap outDsMap = new DataSetMap();
			outDsMap.setRowMaps(li);
			outDataset.put("output", outDsMap);
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
	
	
	
	//답변
		@RequestMapping("/ntrms/cs/questionInfo2.do") 
		public ModelAndView questionInfo2(NexacroMapDTO xpDto, Model model) throws Exception {
			
			ModelAndView mav = new ModelAndView("nexacroMapView");
			
			try
			{
				Map <String, Object> inVar 			= xpDto.getInVariableMap();
				Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
				
				
				//질문, 답변정보
				List li = rTCSResultService.getListQustAns(inVar, outDataset);
				
				DataSetMap outDsMap = new DataSetMap();
				outDsMap.setRowMaps(li);
				outDataset.put("output", outDsMap);
				
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

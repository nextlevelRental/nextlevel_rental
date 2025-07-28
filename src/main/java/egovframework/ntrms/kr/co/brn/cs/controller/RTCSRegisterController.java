/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCSRegisterController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.controller;

import java.util.HashMap;
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
import egovframework.ntrms.kr.co.brn.cs.service.RTCSRegisterService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTCSRegisterController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTCSRegisterService")
	RTCSRegisterService rTCSRegisterService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@RequestMapping("/ntrms/cs/initRegister.do") 
	public ModelAndView initRegister(NexacroMapDTO xpDto, Model model) throws Exception {
		
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

			//단면폭
			inVar.put("cdGrpCd", "S006");
			inVar.put("useYn", "Y");
			
			Map widthDrop = commonService.listCommInfo(inVar); 
			List widthDropResult		= (List)widthDrop.get("result");
			
			//편평비 			
			inVar.put("cdGrpCd", "S007");
			inVar.put("useYn", "Y");
			
			Map ratioDrop = commonService.listCommInfo(inVar); 
			List ratioDropResult		= (List)ratioDrop.get("result");	
			
			//인치			
			inVar.put("cdGrpCd", "S008");
			inVar.put("useYn", "Y");
			
			Map inchDrop = commonService.listCommInfo(inVar); 
			List inchDropResult		= (List)inchDrop.get("result");				

			//제조사		
			inVar.put("cdGrpCd", "S078");
			inVar.put("useYn", "Y");
			
			Map manufactureDrop = commonService.listCommInfo(inVar); 
			List manufactureDropResult		= (List)manufactureDrop.get("result");			
							
			DataSetMap codeDsMap = new DataSetMap();
			DataSetMap codeDsMap2 = new DataSetMap();
			DataSetMap codeDsMap3 = new DataSetMap();
			DataSetMap codeDsMap4 = new DataSetMap();
			DataSetMap codeDsMap5 = new DataSetMap();			
			DataSetMap codeDsMap6 = new DataSetMap();		
			
			codeDsMap.setRowMaps(jobTpResult);
			codeDsMap2.setRowMaps(callStatusResult);
			codeDsMap3.setRowMaps(widthDropResult);
			codeDsMap4.setRowMaps(ratioDropResult);
			codeDsMap5.setRowMaps(inchDropResult);	
			codeDsMap6.setRowMaps(manufactureDropResult);			
			
			outDataset.put("output", codeDsMap);
			outDataset.put("output2", codeDsMap2);
			outDataset.put("output3", codeDsMap3);			
			outDataset.put("output4", codeDsMap4);	
			outDataset.put("output5", codeDsMap5);			
			outDataset.put("output6", codeDsMap6);			
			
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

	@RequestMapping("/ntrms/cs/initRegister2.do") 
	public ModelAndView initRegister2(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			

			//단면폭
			inVar.put("cdGrpCd", "S006");
			inVar.put("useYn", "Y");
			
			Map widthDrop = commonService.listCommInfo(inVar); 
			List widthDropResult		= (List)widthDrop.get("result");
			
			//편평비 			
			inVar.put("cdGrpCd", "S007");
			inVar.put("useYn", "Y");
			
			Map ratioDrop = commonService.listCommInfo(inVar); 
			List ratioDropResult		= (List)ratioDrop.get("result");	
			
			//인치			
			inVar.put("cdGrpCd", "S008");
			inVar.put("useYn", "Y");
			
			Map inchDrop = commonService.listCommInfo(inVar); 
			List inchDropResult		= (List)inchDrop.get("result");				

			//제조사		
			inVar.put("cdGrpCd", "S078");
			inVar.put("useYn", "Y");
			
			Map manufactureDrop = commonService.listCommInfo(inVar); 
			List manufactureDropResult		= (List)manufactureDrop.get("result");			
							

			DataSetMap codeDsMap3 = new DataSetMap();
			DataSetMap codeDsMap4 = new DataSetMap();
			DataSetMap codeDsMap5 = new DataSetMap();			
			DataSetMap codeDsMap6 = new DataSetMap();		
			
			codeDsMap3.setRowMaps(widthDropResult);
			codeDsMap4.setRowMaps(ratioDropResult);
			codeDsMap5.setRowMaps(inchDropResult);	
			codeDsMap6.setRowMaps(manufactureDropResult);			
			
			outDataset.put("output3", codeDsMap3);			
			outDataset.put("output4", codeDsMap4);	
			outDataset.put("output5", codeDsMap5);			
			outDataset.put("output6", codeDsMap6);			
			
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
	
	@RequestMapping("/ntrms/cs/registerList.do") 
	public ModelAndView registerList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		try
		{
			//DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			//Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			//Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			inVar.put("regId", loginInfo.get("userId"));
			List li = rTCSRegisterService.getRegisterList(inVar, outDataset);
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
	
	//계약정보
	@RequestMapping("/ntrms/cs/registerInfo.do") 
	public ModelAndView registerInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			//DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			//Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			//Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			//계약정보
			List li = rTCSRegisterService.getRegisterInfo(inVar, outDataset);
			DataSetMap outDsMap = new DataSetMap();
			outDsMap.setRowMaps(li);
			outDataset.put("output", outDsMap);
			
			//질문
//			List li2 = rTCSRegisterService.getListQuestion(inVar, outDataset);
//			DataSetMap outDsMap2 = new DataSetMap();
//			outDsMap.setRowMaps(li2);
//			outDataset.put("output2", outDsMap2);
			
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
	@RequestMapping("/ntrms/cs/questionInfo.do") 
	public ModelAndView questionInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			//질문정보
			Map<String, List> map = rTCSRegisterService.getListQuestion(inVar, outDataset);
			
//			map.get("question01") ;
//			map.get("question02") ;
//			map.get("question03") ;
//			map.get("question04") ;
//			map.get("question05") ;
//			map.get("question06") ;
//			map.get("question07") ;
//			map.get("question08") ;
//			map.get("question09") ;
//			map.get("question10") ;
			
			DataSetMap outDsMap = new DataSetMap();
			
			DataSetMap outDsMap1 = new DataSetMap();
			DataSetMap outDsMap2 = new DataSetMap();
			DataSetMap outDsMap3 = new DataSetMap();
			DataSetMap outDsMap4 = new DataSetMap();
			DataSetMap outDsMap5 = new DataSetMap();
			DataSetMap outDsMap6 = new DataSetMap();
			DataSetMap outDsMap7 = new DataSetMap();
			DataSetMap outDsMap8 = new DataSetMap();
			DataSetMap outDsMap9 = new DataSetMap();
			DataSetMap outDsMap10 = new DataSetMap();
			DataSetMap outDsMap11 = new DataSetMap();
			
			//질문
			outDsMap.setRowMaps (map.get("question"));
			
			//답
			outDsMap1.setRowMaps (map.get("question01"));
			outDsMap2.setRowMaps (map.get("question02"));
			outDsMap3.setRowMaps (map.get("question03"));
			outDsMap4.setRowMaps (map.get("question04"));
			outDsMap5.setRowMaps (map.get("question05"));
			outDsMap6.setRowMaps (map.get("question06"));
			outDsMap7.setRowMaps (map.get("question07"));
			outDsMap8.setRowMaps (map.get("question08"));
			outDsMap9.setRowMaps (map.get("question09"));
			outDsMap10.setRowMaps(map.get("question10"));
			
			//답변 상세
			outDsMap11.setRowMaps(map.get("qustAns"));
			
			
			outDataset.put("output", outDsMap);
			outDataset.put("output1", outDsMap1);
			outDataset.put("output2", outDsMap2);
			outDataset.put("output3", outDsMap3);
			outDataset.put("output4", outDsMap4);
			outDataset.put("output5", outDsMap5);
			outDataset.put("output6", outDsMap6);
			outDataset.put("output7", outDsMap7);
			outDataset.put("output8", outDsMap8);
			outDataset.put("output9", outDsMap9);
			outDataset.put("output10", outDsMap10);
			
			outDataset.put("output11", outDsMap11);
			
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
	
	
	
	
	@RequestMapping("/ntrms/cs/registerSaveDaset.do") 
	public ModelAndView registerSaveDaset(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		try
		{
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			
			Map result = null;
			result =  rTCSRegisterService.saveRegisterInfo(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/ntrms/cs/sRtcs0100ServiceHistory.do") 
	public ModelAndView sRtcs0100ServiceHistory(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			List li = rTCSRegisterService.sRtcs0100ServiceHistory(inVar, outDataset);
			DataSetMap serviceHistory = new DataSetMap();
			serviceHistory.setRowMaps(li);
			outDataset.put("serviceHistory", serviceHistory);
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

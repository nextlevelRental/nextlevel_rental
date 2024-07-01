/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMUserController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.controller;

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
import egovframework.ntrms.kr.co.brn.sd.service.RTSDClaimService;
import egovframework.ntrms.kr.co.exec.handler.controller.ControllerBase;
import egovframework.ntrms.kr.co.exec.model.ReturnType;
import egovframework.ntrms.kr.co.exec.model.ReturnTypeFactory;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDClaimController extends ControllerBase {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rTSDClaimService")
	RTSDClaimService rTCMClaimService;
	
	@RequestMapping("/rtms/sd/claimController.do") 
	public ModelAndView claimController(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			//DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			//Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			//Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			//콤보에 선택항목 추가
			Map map = new HashMap();
			map.put("cd","");
			map.put("cdNm","전체");
			
			//스케줄 상태 코드
			inVar.put("cdGrpCd", "S040");
			inVar.put("useYn", "Y");
			
			Map sd = commonService.listCommInfo(inVar);
			
			//청구 구분 코드 
			inVar.put("cdGrpCd", "R007");
			inVar.put("useYn", "Y");
			
			Map claim = commonService.listCommInfo(inVar);
			
			
			List li1 =(List)sd.get("result");	
			List li2 = (List)claim.get("result");
			
			//선택항목 추가
			li1.add(0, map);
			li2.add(0, map);
			
			DataSetMap outDsMap = new DataSetMap();
			DataSetMap outDsMap2 = new DataSetMap();
			
			outDsMap.setRowMaps(li1);
			outDsMap2.setRowMaps(li2);
			
			outDataset.put("output", outDsMap);
			outDataset.put("output2", outDsMap2);
			
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
	
	@RequestMapping("/rtms/sd/claimList.do") 
	public ModelAndView claimList(NexacroMapDTO xpDto, Model model) throws Exception {
	    ReturnType<?> returnType = null;
	    
	    try {
            Map<String, Object> inVar = xpDto.getInVariableMap();
            Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

            Map Clist = rTCMClaimService.getClaimList( addUserInfo( inVar ), outDataset );

            List li = ( List ) Clist.get( "result" );

            DataSetMap outDsMap = new DataSetMap();

            outDsMap.setRowMaps( li );

            outDataset.put( "output", outDsMap );
            
            returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
        }
        catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }
	    
	    return returnType.output();
	}
	
//	@RequestMapping("/rtms/sd/claimList.do") 
//	public ModelAndView claimList(NexacroMapDTO xpDto, Model model) throws Exception {
//		
//		ModelAndView mav = new ModelAndView("nexacroMapView");
//		
//		try
//		{
//			//DataSetMap tranInfo 				= xpDto.getTranInfoMap();
//			Map <String, Object> inVar 			= xpDto.getInVariableMap();
//			//Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
//			//Map <String, Object> outVar 		= xpDto.getOutVariableMap();
//			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
//			
//			Map Clist = rTCMClaimService.getClaimList(inVar, outDataset);
//			
//			List li =(List)Clist.get("result");
//			
//			DataSetMap outDsMap = new DataSetMap();
//			
//			outDsMap.setRowMaps(li);
//			
//			outDataset.put("output", outDsMap);
//			
//			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
//			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
//			
//			mav.addObject(NexacroConstant.ERROR_CODE, "0");
//			mav.addObject(NexacroConstant.ERROR_MSG, "");
//		
//		} catch ( Exception e ) {
//			e.printStackTrace();
//			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
//			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
//		}
//		return mav;
//	}
	
}

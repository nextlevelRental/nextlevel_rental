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
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDAgencyResultService;
import egovframework.ntrms.kr.co.exec.handler.controller.ControllerBase;
import egovframework.ntrms.kr.co.exec.model.ReturnType;
import egovframework.ntrms.kr.co.exec.model.ReturnTypeFactory;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDAgencyResultController extends ControllerBase {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rTSDAgencyResultService")
	RTSDAgencyResultService rTSDAgencyResultService;
	
	@RequestMapping("/rtms/sd/initRTSDAgencyResult.do") 
	public ModelAndView initRTSDAgencyResult(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S030");
			inVar.put("useYn", "Y");
			Map dsChanCd = commonService.listCommInfo(inVar);
			List listDsChanCd = (List)dsChanCd.get("result");	
			DataSetMap mapDsChanCd = new DataSetMap();
			mapDsChanCd.setRowMaps(listDsChanCd);
			outDataset.put("mapDsChanCd", mapDsChanCd);
			
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
	
	
	@RequestMapping("/rtms/sd/selectRTSDAgencyResult.do") 
    public ModelAndView selectRTSDAgencyResult(NexacroMapDTO xpDto, Model model) throws Exception {
        ReturnType<?> returnType = null;
        
        try {
            Map<String, Object> inVar = xpDto.getInVariableMap();
            Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

            Map result = rTSDAgencyResultService.selectRTSDAgencyResult( this.addUserInfo( inVar ), outDataset );

            List selectRTSDAgencyResult = ( List ) result.get( "selectRTSDAgencyResult" );

            DataSetMap selectRTSDAgencyResultMap = new DataSetMap();
            selectRTSDAgencyResultMap.setRowMaps( selectRTSDAgencyResult );

            outDataset.put( "selectRTSDAgencyResultMap", selectRTSDAgencyResultMap );

            returnType = ReturnTypeFactory.createReturnType().setOutDS( outDataset );
        }
        catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }
        
        return returnType.output();
    }
	
//	@RequestMapping("/rtms/sd/selectRTSDAgencyResult.do") 
//	public ModelAndView selectRTSDAgencyResult(NexacroMapDTO xpDto, Model model) throws Exception {
//		ModelAndView mav = new ModelAndView("nexacroMapView");
//		try
//		{
//			Map <String, Object> inVar 			= xpDto.getInVariableMap();
//			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
//			
//			Map result = rTSDAgencyResultService.selectRTSDAgencyResult(inVar, outDataset);
//			
//			List selectRTSDAgencyResult = (List)result.get("selectRTSDAgencyResult");
//			
//			DataSetMap selectRTSDAgencyResultMap = new DataSetMap();
//			selectRTSDAgencyResultMap.setRowMaps(selectRTSDAgencyResult);
//			
//			outDataset.put("selectRTSDAgencyResultMap", selectRTSDAgencyResultMap);
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

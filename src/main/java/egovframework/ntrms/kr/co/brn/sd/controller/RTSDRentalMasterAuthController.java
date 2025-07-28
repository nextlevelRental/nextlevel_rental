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

import org.apache.commons.collections.MapUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.sd.service.RTSDRentalMasterAuthServiceImpl;
import egovframework.ntrms.kr.co.exec.handler.controller.ControllerBase;
import egovframework.ntrms.kr.co.exec.model.ReturnType;
import egovframework.ntrms.kr.co.exec.model.ReturnTypeFactory;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDRentalMasterAuthController extends ControllerBase {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTSDRentalMasterAuthService")
	RTSDRentalMasterAuthServiceImpl rTSDRentalMasterAuthService;
		
//	/************************************
//	 * 렌탈MASTER 조회
//	 * @param xpDto
//	 * @param model
//	 * @return
//	 * @throws Exception
//	 ************************************/
	@RequestMapping("/rtms/sd/listRentalAuthMstInfo.do")
	public ModelAndView listRentalAuthMstInfo(NexacroMapDTO xpDto, Model model) throws Exception {
	    ReturnType<?> returnType = null;
        
        try {
            Map<String, Object> inVar = xpDto.getInVariableMap();
            Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

            Map paramMap = new HashMap();
            paramMap.put( "userNm", inVar.get( "userNm" ) );

            List planInfo = rTSDRentalMasterAuthService.listRentalAuthMstInfo( paramMap );
            DataSetMap dsResult = new DataSetMap();
            dsResult.setRowMaps( planInfo );

            outDataset.put( "ds_output", dsResult );
            returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
        }
        catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType(e);
        }
        
        return returnType.output();
	}
	
//	public ModelAndView listRentalAuthMstInfo(NexacroMapDTO xpDto, Model model) throws Exception {
//		ModelAndView mav = new ModelAndView("nexacroMapView");
//		try {
//			Map <String, Object> inVar 			= xpDto.getInVariableMap();
//			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();			
//			
//			logger.debug("===================================================");
//			logger.debug(inVar);
//			logger.debug("===================================================");
//			
//			Map paramMap = new HashMap();
//			paramMap.put("userNm",inVar.get("userNm"));
//			
//			Map result = rTSDRentalMasterAuthService.listRentalAuthMstInfo(paramMap);
//			List planInfo = (List)result.get("listRentalAuthMstInfo");
//			DataSetMap dsResult = new DataSetMap();
//			dsResult.setRowMaps(planInfo);
//			
//			outDataset.put("ds_output", dsResult);
//			
//			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
//			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
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
//
//	/************************************
//	 * 렌탈지사/지점 조회
//	 * @param xpDto
//	 * @param model
//	 * @return
//	 * @throws Exception
//	 ************************************/
	@RequestMapping("/rtms/sd/listRentalAuthDtlInfo.do")
	public ModelAndView listRentalAuthDtlInfo(NexacroMapDTO xpDto, Model model) throws Exception {
	    ReturnType<?> returnType = null;
	    
	    try {
            Map<String, Object> inVar = xpDto.getInVariableMap();
            Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

            Map paramMap = new HashMap();
            paramMap.put( "userId", inVar.get( "userId" ) );
            paramMap.put( "cdNm", inVar.get( "cdNm" ) );

            List planInfo = rTSDRentalMasterAuthService.listRentalAuthDtlInfo( paramMap );
            DataSetMap dsResult = new DataSetMap();
            dsResult.setRowMaps( planInfo );

            outDataset.put( "ds_output", dsResult );

	        returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
        }
        catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType(e);
        }
	    
	    return returnType.output();
	}
	
//	public ModelAndView listRentalAuthDtlInfo(NexacroMapDTO xpDto, Model model) throws Exception {
//		ModelAndView mav = new ModelAndView("nexacroMapView");
//		try {
//			Map <String, Object> inVar 			= xpDto.getInVariableMap();
//			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();			
//
//			Map paramMap = new HashMap();
//			paramMap.put("userId",   inVar.get("userId"));
//			paramMap.put("cdNm",      inVar.get("cdNm"));
//			
//			Map result = rTSDRentalMasterAuthService.listRentalAuthDtlInfo(paramMap);
//			List planInfo = (List)result.get("listRentalAuthDtlInfo");
//			DataSetMap dsResult = new DataSetMap();
//			dsResult.setRowMaps(planInfo);
//			
//			outDataset.put("ds_output", dsResult);
//			
//			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
//			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
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
//	
//	/************************************
//	 * 렌탈마스터 권한 저장
//	 * @param xpDto
//	 * @param model
//	 * @return
//	 * @throws Exception
//	 ************************************/
	@RequestMapping("/rtms/sd/saveRentalMstAuth.do")	
	public ModelAndView saveRentalMstAuth(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
	    ReturnType<?> returnType = null;
	    
	    try {
            
            Map<String, Object> inVar = xpDto.getInVariableMap();
            Map<String, DataSetMap> inDataset = xpDto.getInDataSetMap();
	        
            String mstId = MapUtils.getString( inVar, "rntMstId", "" );
            DataSetMap dsAuth = inDataset.get( "dsAuth" );
            
            Map result = rTSDRentalMasterAuthService.saveRentalMstAuth( this.getCurrentUser(), mstId, dsAuth );
            
	        returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
        }
        catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }
	    
	    return returnType.output();
	}
//		Map loginInfo = (Map) req.getSession().getAttribute("User");
//		
//		ModelAndView mav = new ModelAndView("nexacroMapView");
//		
//		try
//		{
//			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
//			Map <String, Object> inVar 			= xpDto.getInVariableMap();
//			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
//			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
//
//			inVar.put("regId", loginInfo.get("userId"));
//			
//			Map result =  rTSDRentalMasterAuthService.saveRentalMstAuth(inDataset, inVar);
//			
//			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
//			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
//
//			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
//			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));		
//		
//		} catch ( Exception e ) {
//			e.printStackTrace();
//			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
//			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
//		}
//		return mav;	
//	
//	}	
	
	
}

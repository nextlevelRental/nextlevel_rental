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
import egovframework.ntrms.kr.co.brn.sd.service.RTSDOrderService;
import egovframework.ntrms.kr.co.exec.handler.controller.ControllerBase;
import egovframework.ntrms.kr.co.exec.model.ReturnType;
import egovframework.ntrms.kr.co.exec.model.ReturnTypeFactory;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDOrderController extends ControllerBase {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rTSDOrderService")
	RTSDOrderService rTCMOrderService;
	
	
	@RequestMapping("/trms/sd/orderInit.do") 
	public ModelAndView orderInit(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		
		
		String id = (String) loginInfo.get("userId"); //사용자 ID
		String nm = (String) loginInfo.get("userNm"); //사용자 NM
		String grp = (String) loginInfo.get("userGrp"); //사용자 그룹
		
		
		try
		{
			//DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			//Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			//Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("userId", 	id);
			paramMap.put("userNm",  nm);
			paramMap.put("userGrp", grp);
			
			dsm.add(paramMap);
			outDataset.put("output", dsm);
			
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
	
	@RequestMapping("/rtms/sd/OrderList.do") 
    public ModelAndView OrderList(NexacroMapDTO xpDto, Model model) throws Exception {
        
	    ReturnType<?> returnType = null;
	    
        try {
            Map<String, Object> inVar = xpDto.getInVariableMap();
            Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

            Map Clist = rTCMOrderService.getOrderList( this.addUserInfo( inVar ), outDataset );

            List li = ( List ) Clist.get( "result" );

            DataSetMap outDsMap = new DataSetMap();

            outDsMap.setRowMaps( li );

            outDataset.put( "output", outDsMap );

            returnType = ReturnTypeFactory.createReturnType().setOutDS( outDataset );
        }
        catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }

        return returnType.output();
    }
	
	
//	@RequestMapping("/rtms/sd/OrderList.do") 
//	public ModelAndView OrderList(NexacroMapDTO xpDto, Model model) throws Exception {
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
//			Map Clist = rTCMOrderService.getOrderList(inVar, outDataset);
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

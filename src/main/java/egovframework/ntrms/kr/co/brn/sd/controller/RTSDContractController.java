/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMUserController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import egovframework.ntrms.kr.co.brn.cm.service.RTCMProRegService;
import egovframework.ntrms.kr.co.brn.cm.service.RTCMUserService;
import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDClaimService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDContractService;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.ntrms.kr.co.exec.handler.controller.ControllerBase;
import egovframework.ntrms.kr.co.exec.model.ReturnType;
import egovframework.ntrms.kr.co.exec.model.ReturnTypeFactory;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDContractController extends ControllerBase {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rTSDContractService")
	RTSDContractService rTSDContractService;
	
	@RequestMapping("/rtms/sd/comboInfo.do") 
	public ModelAndView comboInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			//콤보에 선택항목 추가
			Map map = new HashMap();
			map.put("cd","");
			map.put("cdNm","전체");
			
			//스케줄 상태 코드
			inVar.put("cdGrpCd", "S032");
			inVar.put("useYn", "Y");
			
			Map cStatus = commonService.listCommInfo(inVar);
			
			List li =(List)cStatus.get("result");	
			
			
			//선택항목 추가
			li.add(0, map);
			
			DataSetMap status = new DataSetMap();
			
			status.setRowMaps(li);
			outDataset.put("status", status);
			
			
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
	
	
	@RequestMapping("/rtms/sd/listContract.do") 
    public ModelAndView listContract(NexacroMapDTO xpDto, Model model) throws Exception {
	    ReturnType<?> returnType = null;
        
        try
        {
            Map <String, Object> inVar          = xpDto.getInVariableMap();
            Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
            
            //스케줄 상태 코드
            inVar.put("cdGrpCd", "S032");
            inVar.put("useYn", "Y");
            
            Map cStatus = commonService.listCommInfo( inVar );
            
            Map result = rTSDContractService.listContractInfo(addUserInfo( inVar ), outDataset);
            
            List contractInfo = (List)result.get("contractList");
            List li =(List)cStatus.get("result");   
    
            DataSetMap dscontractInfo = new DataSetMap();
            DataSetMap status = new DataSetMap();
            
            
            dscontractInfo.setRowMaps(contractInfo);
            status.setRowMaps(li);
            
            outDataset.put("contractInfo", dscontractInfo);
            outDataset.put("status", status);
            
            returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
        } catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }
        
        return returnType.output();
    }
	
	
//	@RequestMapping("/rtms/sd/listContract.do") 
//	public ModelAndView listContract(NexacroMapDTO xpDto, Model model) throws Exception {
//		
//		ModelAndView mav = new ModelAndView("nexacroMapView");
//		
//		try
//		{
//			Map <String, Object> inVar 			= xpDto.getInVariableMap();
//			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
//			
//
//			
//			//스케줄 상태 코드
//			inVar.put("cdGrpCd", "S032");
//			inVar.put("useYn", "Y");
//			
//			Map cStatus = commonService.listCommInfo(inVar);
//			
//			Map result = rTSDContractService.listContractInfo(inVar, outDataset);
//			
//			List contractInfo = (List)result.get("contractList");
//			List li =(List)cStatus.get("result");	
//	
//			DataSetMap dscontractInfo = new DataSetMap();
//			DataSetMap status = new DataSetMap();
//			
//			
//			dscontractInfo.setRowMaps(contractInfo);
//			status.setRowMaps(li);
//			
//			outDataset.put("contractInfo", dscontractInfo);
//			outDataset.put("status", status);
//			
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
	
	@RequestMapping("/rtms/sd/listContractDetail.do") 
	public ModelAndView listContractDetail(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			//스케줄 상태 코드
			
			Map result = rTSDContractService.listContractDetail(inVar, outDataset);
			
			List contractInfo = (List)result.get("contractListDetail");
			
			
			DataSetMap dscontractInfo = new DataSetMap();
		
			
			
			dscontractInfo.setRowMaps(contractInfo);
			
			outDataset.put("contractDetail", dscontractInfo);
		
			
			
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

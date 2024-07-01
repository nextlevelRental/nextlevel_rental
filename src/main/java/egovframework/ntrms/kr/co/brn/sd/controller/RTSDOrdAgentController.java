package egovframework.ntrms.kr.co.brn.sd.controller;

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
import egovframework.ntrms.kr.co.brn.sd.service.RTSDOrdAgentService;
import egovframework.ntrms.kr.co.exec.handler.controller.ControllerBase;
import egovframework.ntrms.kr.co.exec.model.ReturnType;
import egovframework.ntrms.kr.co.exec.model.ReturnTypeFactory;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDOrdAgentController extends ControllerBase {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rTSDOrdAgentService")
	RTSDOrdAgentService rTSDOrdAgentService;
	
	@RequestMapping("/rtms/sd/selectOrdAgentList.do") 
    public ModelAndView selectOrdAgentList(NexacroMapDTO xpDto, Model model) throws Exception {
        ReturnType<?> returnType = null;
        
        try{
            Map <String, Object> inVar          = xpDto.getInVariableMap();
            Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
            
            Map result = rTSDOrdAgentService.selectOrdAgentList( addUserInfo( inVar ), outDataset);
            List selectOrdAgentList = (List)result.get("selectOrdAgentList");
            DataSetMap selectOrdAgentListMap = new DataSetMap();
            selectOrdAgentListMap.setRowMaps(selectOrdAgentList);
            outDataset.put("selectOrdAgentListMap", selectOrdAgentListMap);
            
            returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
        } catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }

        return returnType.output();
    }
	
//	@RequestMapping("/rtms/sd/selectOrdAgentList.do") 
//	public ModelAndView selectOrdAgentList(NexacroMapDTO xpDto, Model model) throws Exception {
//		ModelAndView mav = new ModelAndView("nexacroMapView");
//		try{
//			Map <String, Object> inVar 			= xpDto.getInVariableMap();
//			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
//			
//			Map result = rTSDOrdAgentService.selectOrdAgentList(inVar, outDataset);
//			List selectOrdAgentList = (List)result.get("selectOrdAgentList");
//			DataSetMap selectOrdAgentListMap = new DataSetMap();
//			selectOrdAgentListMap.setRowMaps(selectOrdAgentList);
//			outDataset.put("selectOrdAgentListMap", selectOrdAgentListMap);
//			
//			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
//			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
//			mav.addObject(NexacroConstant.ERROR_CODE, "0");
//			mav.addObject(NexacroConstant.ERROR_MSG, "");
//		} catch ( Exception e ) {
//			e.printStackTrace();
//			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
//			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
//		}
//		return mav;
//	}
	
	@RequestMapping("/rtms/sd/selectOrdAgentOrderList.do") 
	public ModelAndView selectOrdAgentOrderList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDOrdAgentService.selectOrdAgentOrderList(inVar, outDataset);
			List selectOrdAgentOrderList = (List)result.get("selectOrdAgentOrderList");
			DataSetMap selectOrdAgentOrderListMap = new DataSetMap();
			selectOrdAgentOrderListMap.setRowMaps(selectOrdAgentOrderList);
			outDataset.put("selectOrdAgentOrderListMap", selectOrdAgentOrderListMap);
			
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
	 * <pre>
	 * 판매인주문리스트 New Version
	 *     - client 검색 옵션 추가 (렌탈지사, 렌탈지점)
	 * </pre>
	 * 
	 * @author 강신규
	 * @since 2019. 2. 12. 오후 2:58:24
	 * 
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/selectOrdAgentOrderListNew.do") 
    public ModelAndView selectOrdAgentOrderListNew(NexacroMapDTO xpDto, Model model) throws Exception {
	    
	    ReturnType<?> returnType = null;
	    
        try{
            Map <String, Object> inVar          = xpDto.getInVariableMap();
            Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
            
            List selectOrdAgentOrderList = rTSDOrdAgentService.selectOrdAgentOrderListNew( addUserInfo( inVar ) );
            
            DataSetMap selectOrdAgentOrderListMap = new DataSetMap();
            selectOrdAgentOrderListMap.setRowMaps(selectOrdAgentOrderList);
            outDataset.put("selectOrdAgentOrderListMap", selectOrdAgentOrderListMap);
            
            returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
        } catch ( Exception e ) {
            logger.error( e.getMessage(), e );
            returnType = ReturnTypeFactory.createReturnType( e );
        }
        
        return returnType.output();
    }
	
	@RequestMapping("/rtms/sd/initRTSDOrdAgentRegister.do") 
	public ModelAndView initRTSDOrdAgentRegister(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "C004");
			inVar.put("useYn", "Y");
			Map dsUseYn = commonService.listCommInfo(inVar);
			List listDsUseYn = (List)dsUseYn.get("result");	
			DataSetMap mapDsUseYn = new DataSetMap();
			DataSetMap mapDsUseYn2 = new DataSetMap();
			mapDsUseYn.setRowMaps(listDsUseYn);
			mapDsUseYn2.setRowMaps(listDsUseYn);
			outDataset.put("mapDsUseYn", mapDsUseYn);
			outDataset.put("mapDsUseYn2", mapDsUseYn2);
			
			inVar.put("cdGrpCd", "S030");
			inVar.put("useYn", "Y");
			Map dsChanCd = commonService.listCommInfo(inVar);
			List listDsChanCd = (List)dsChanCd.get("result");	
			DataSetMap mapDsChanCd = new DataSetMap();
			mapDsChanCd.setRowMaps(listDsChanCd);
			outDataset.put("mapDsChanCd", mapDsChanCd);
			
			inVar.put("cdGrpCd", "S079");
			inVar.put("useYn", "Y");
			Map dsTaxRqCd = commonService.listCommInfo(inVar);
			List listDsTaxRqCd = (List)dsTaxRqCd.get("result");	
			DataSetMap mapDsTaxRqCd = new DataSetMap();
			mapDsTaxRqCd.setRowMaps(listDsTaxRqCd);
			outDataset.put("mapDsTaxRqCd", mapDsTaxRqCd);
			
			// 2016-04-15 이영근, 채널 대분류,중분류 가져옴
			inVar.put("cdGrpCd", "S090");
			inVar.put("useYn", "Y");
			Map dsChanLclsCd = commonService.listCommInfo(inVar);
			List listDsChanLclsCd = (List)dsChanLclsCd.get("result");	
			DataSetMap mapDsChanLclsCd = new DataSetMap();
			mapDsChanLclsCd.setRowMaps(listDsChanLclsCd);
			outDataset.put("mapDsChanLclsCd", mapDsChanLclsCd);
			
			inVar.put("cdGrpCd", "S091");
			inVar.put("useYn", "Y");
			Map dsChanMclsCd = commonService.listCommInfo(inVar);
			List listDsChanMclsCd = (List)dsChanMclsCd.get("result");	
			DataSetMap mapDsChanMclsCd = new DataSetMap();
			mapDsChanMclsCd.setRowMaps(listDsChanMclsCd);
			outDataset.put("mapDsChanMclsCd", mapDsChanMclsCd);			
			
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
	
	@RequestMapping("/rtms/sd/selectRTSDOrdAgentRegister.do") 
	public ModelAndView selectRTSDOrdAgentRegister(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDOrdAgentService.selectRTSDOrdAgentRegister(inVar, outDataset);
			List selectRTSDOrdAgentRegister = (List)result.get("selectRTSDOrdAgentRegister");
			DataSetMap mapRtsd0113 = new DataSetMap();
			mapRtsd0113.setRowMaps(selectRTSDOrdAgentRegister);
			outDataset.put("mapRtsd0113", mapRtsd0113);
			
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
	
	@RequestMapping("/rtms/sd/saveRTSDOrdAgentRegister.do") 
	public ModelAndView saveRTSDOrdAgentRegister(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTSDOrdAgentService.saveRTSDOrdAgentRegister(inDataset, inVar);
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/sd/checkOrdAgent.do") 
	public ModelAndView checkOrdAgent(NexacroMapDTO xpDto) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			int idx = (int)rTSDOrdAgentService.checkOrdAgent(inVar);
			outVal.put("cntOrdAgent", idx);
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
}

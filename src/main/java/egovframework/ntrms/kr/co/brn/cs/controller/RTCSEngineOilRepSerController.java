package egovframework.ntrms.kr.co.brn.cs.controller;

import java.util.ArrayList;
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
import egovframework.ntrms.kr.co.brn.cs.service.RTCSEngineOilRepSerService;
import egovframework.ntrms.kr.co.brn.sd.service.RTSDCustRegisterService;
import egovframework.ntrms.kr.co.comm.util.CommonUtil;
import egovframework.ntrms.kr.co.exec.handler.controller.ControllerBase;
import egovframework.ntrms.kr.co.exec.model.ReturnType;
import egovframework.ntrms.kr.co.exec.model.ReturnTypeFactory;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class RTCSEngineOilRepSerController extends ControllerBase {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTCSEngineOilRepSerService")
	RTCSEngineOilRepSerService rTCSEngineOilRepSerService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name="rTSDCustRegisterService")
	RTSDCustRegisterService rTSDCustRegisterService;	
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@RequestMapping("/rtms/cs/intiRTCSEngineOilRepSer.do") 
	public ModelAndView intiRTCSEngineOilRepSer(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "C019");
			inVar.put("useYn", "Y");
			Map dsC019 = commonService.listCommInfo(inVar);
			List listDsC019 = (List)dsC019.get("result");
			DataSetMap mapDsC019 = new DataSetMap();
			mapDsC019.setRowMaps(listDsC019);
			outDataset.put("mapDsC019",  mapDsC019);
			
			inVar.put("cdGrpCd", "C020");
			inVar.put("useYn", "Y");
			Map dsC020 = commonService.listCommInfo(inVar);
			List listDsC020 = (List)dsC020.get("result");
			DataSetMap mapDsC020 = new DataSetMap();
			mapDsC020.setRowMaps(listDsC020);
			outDataset.put("mapDsC020",  mapDsC020);
			
			inVar.put("cdGrpCd", "C021");
			inVar.put("useYn", "Y");
			Map dsC021 = commonService.listCommInfo(inVar);
			List listDsC021 = (List)dsC021.get("result");
			DataSetMap mapDsC021 = new DataSetMap();
			mapDsC021.setRowMaps(listDsC021);
			outDataset.put("mapDsC021",  mapDsC021);
			
			inVar.put("cdGrpCd", "C022");
			inVar.put("useYn", "Y");
			Map dsC022 = commonService.listCommInfo(inVar);
			List listDsC022 = (List)dsC022.get("result");
			DataSetMap mapDsC022 = new DataSetMap();
			mapDsC022.setRowMaps(listDsC022);
			outDataset.put("mapDsC022",  mapDsC022);
			
			inVar.put("cdGrpCd", "C023");
			inVar.put("useYn", "Y");
			Map dsC023 = commonService.listCommInfo(inVar);
			List listDsC023 = (List)dsC023.get("result");
			DataSetMap mapDsC023 = new DataSetMap();
			mapDsC023.setRowMaps(listDsC023);
			outDataset.put("mapDsC023",  mapDsC023);
			
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
	
	
	
	@RequestMapping("/rtms/cs/selectServrqDay.do") 
	public ModelAndView selectFirstDay(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			String selectServrqDay = (String)rTCSEngineOilRepSerService.selectServrqDay(inVar);
			String selectServrqDay_2 = (String)rTCSEngineOilRepSerService.selectServrqDayByTerm(inVar);
			outVal.put("selectServrqDay", selectServrqDay);
			outVal.put("selectServrqDay_2", selectServrqDay_2);
			
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
	
	@RequestMapping("/rtms/cs/selectEngineOilServrqDay.do") 
	public ModelAndView selectEngineOilServrqDay(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			String selectServrqDay = (String)rTCSEngineOilRepSerService.selectEngineOilServrqDay(inVar);
			outVal.put("selectServrqDay", selectServrqDay);
			
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
	
	@RequestMapping("/rtms/cs/selectRTCSEngineOilRepSer.do") 
	public ModelAndView selectRTCSEngineOilRepSer(NexacroMapDTO xpDto) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map result = rTCSEngineOilRepSerService.selectRTCSEngineOilRepSer(inVar, outDataset);
			List listRtcs0009 = (List)result.get("pSRtcs0009SelectOrderList");
			DataSetMap mapDsList = new DataSetMap();
			mapDsList.setRowMaps(listRtcs0009);
			outDataset.put("mapDsList", mapDsList);
			
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
	
	
	
	@RequestMapping("/rtms/cs/saveRTCSEngineOilRepSer.do") 
	public ModelAndView saveRTCSWarehouseRegister(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, Object> inVar2			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTCSEngineOilRepSerService.saveRTCSEngineOilRepSer(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
			
			//2016-08-16 이영근, 완료 후 SMS 전송   - 프로시저에서 발송되므로 해당 SMS발송건은 제외 처리함(2019.01.18)
			//System.out.println("successCode:"+result.get("successCode"));
//			if(String.valueOf(result.get("successCode")).equals("0")){
//				DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
//				String smsMsg = (String) inDsMap.getMapValue(0, "smsMsg");
//				String hpNo   = (String) inDsMap.getMapValue(0, "mobNo");
//				
//				Map smsMap = new HashMap();
//				smsMap.put("reservedFg",   "I");
//				smsMap.put("reservedDttm", "00000000000000");
//				smsMap.put("rcvPhnId",     hpNo);
//				smsMap.put("sndPhnId",     "18550100");
//				smsMap.put("sndMsg",       smsMsg);
//				smsMap.put("etcChar1",     "S007");
//				smsMap.put("etcChar2",     "엔진오일신청");
//				smsMap.put("regId",        inVar.get("regId"));
//				
//				try {
//					DataSetMap dsm = new DataSetMap();
//					//상태값을 신규생성상태로 세팅한다.
//					smsMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
//					smsMap.put("dvsn", 					"I");
//					dsm.add(smsMap);
//					
//					inVar2.put("inDsMap", dsm);
//					inVar2.put("sqlnamespace", "cust.saveSmsMsg");				
//					Map rtnMap = rTSDCustRegisterService.saveSmsMsg(inVar2);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
			
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	
	
	@RequestMapping("/rtms/cs/saveRTCSEngineOilInvMan.do") 
	public ModelAndView saveRTCSEngineOilInvMan(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			inVar.put("regId", loginInfo.get("userId"));
//			inVar.put("host", propertiesService.getString("oms.send.host") + inDataset.get("input1").get(0).get("sendURL").toString());
			Map result = rTCSEngineOilRepSerService.saveRTCSEngineOilInvMan(inDataset, inVar);
			
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
	
	
	
	/**
	 * 엔진오일 교체 서비스 내역 조회(공통코드)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/cs/getengineOilChangeServiceCommCode.do") 
	public ModelAndView getindividualCommissionCommCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			Map map = new HashMap();
			map.put("cd", " ");
			map.put("cdNm","전체");
			
			inVar.put("cdGrpCd", "C019");
			inVar.put("useYn", "Y");
			
			Map mapC019 = commonService.listCommInfo(inVar);
			List listC019 = (List)mapC019.get("result");
			listC019.add(0, map);
			DataSetMap dsC019Maps = new DataSetMap();
			dsC019Maps.setRowMaps(listC019);
			outDataset.put("outputC019",	dsC019Maps);	
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
    /**
	 * 엔진오일 교체 서비스 내역 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
    @RequestMapping( "/nrtms/cs/engineOilChangeServiceList.do" )
    public ModelAndView engineOilChangeServiceList( NexacroMapDTO xpDto, Model model, HttpServletRequest req ) throws Exception {
        ReturnType<?> returnType = null;

        try {
            Map<String, Object> inVar = xpDto.getInVariableMap();
            Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
            Map result = rTCSEngineOilRepSerService.engineOilChangeServiceList( addUserInfo( inVar ), outDataset );

            List list = ( List ) result.get( "engineOilChangeServiceList" );

            DataSetMap accDsMap = new DataSetMap();
            accDsMap.setRowMaps( list );
            outDataset.put( "output", accDsMap );

            returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
        }
        catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }

        return returnType.output();
    }
	
	
//	@RequestMapping("/nrtms/cs/engineOilChangeServiceList.do") 
//	public ModelAndView engineOilChangeServiceList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
//		ModelAndView mav = new ModelAndView("nexacroMapView");
//		
//		try{
//			Map <String, Object> inVar 			= xpDto.getInVariableMap();
//			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
//			Map result = rTCSEngineOilRepSerService.engineOilChangeServiceList(inVar, outDataset);
//			
//			List list	= (List)result.get("engineOilChangeServiceList");
//			
//			DataSetMap accDsMap = new DataSetMap();
//			accDsMap.setRowMaps(list);
//			outDataset.put("output", accDsMap);
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
	/**
	 * 엔진오일 교체 서비스 내역 조회(집계)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/nrtms/cs/engineOilChangeServiceExcelDown.do") 
	public ModelAndView engineOilChangeServiceExcelDown(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn"		, "I");
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTCSEngineOilRepSerService.engineOilChangeServiceExcelDown(inDataset, inVar);
			
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
	/**
	 * 엔진오일 교체 서비스 내역 조회(다운로드 대상조회)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/nrtms/cs/engineOilChangeServiceDownList.do") 
	public ModelAndView engineOilChangeServiceDownList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map result = rTCSEngineOilRepSerService.engineOilChangeServiceDownList(inVar, outDataset);
			
			List list	= (List)result.get("engineOilChangeServiceDownList");
			
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(list);
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
	
	@RequestMapping("/rtms/cs/selectRTCSZeroService.do") 
	public ModelAndView selectRTCSZeroService(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTCSEngineOilRepSerService.selectRTCSZeroServiceList(inVar, outDataset); 
			List listRtcs0010 = (List)result.get("pSRtcs0010SelectOrderList");
			DataSetMap mapDsList = new DataSetMap();
			mapDsList.setRowMaps(listRtcs0010);
			outDataset.put("mapDsList", mapDsList);
			
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
	@RequestMapping("/rtms/cs/intiRTCSZeroSerivce.do") 
	public ModelAndView intiRTCSZeroSerivce(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();

			inVar.put("cdGrpCd", "S089");
			inVar.put("useYn", "Y");
			Map dsS089 = commonService.listCommInfo(inVar);
			List listDsS089 = (List)dsS089.get("result");
			DataSetMap mapDsS089 = new DataSetMap();
			mapDsS089.setRowMaps(listDsS089);
			outDataset.put("mapDsS089",  mapDsS089);			
	
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
	@RequestMapping("/rtms/cs/saveRTCSZeroRepSer.do") 
	public ModelAndView saveRTCSZeroRegister(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, Object> inVar2			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			inVar.put("regId", loginInfo.get("userId"));
			inVar.put("host", propertiesService.getString("oms.send.host") + inDataset.get("input1").get(0).get("sendURL").toString());
			inVar.put("server_key", propertiesService.getString("oms.send.key"));
			
			//ITEM은 다건이 포함될 수 있어서 LIST형태로 생성
			List items = new ArrayList();
			for(int i=0; i<inDataset.get("ds_tmsItem").size(); i++){
				items.add(inDataset.get("ds_tmsItem").get(i));
				
				//세션정보삭제 - json형태로 만들기 위해 속도 이슈				
				((Map)items.get(i)).remove("USER");
				((Map)items.get(i)).remove("PAGE");
			}
			((DataSetMap)inDataset.get("input1")).get(0).put("itemList", items);
			
			//세션정보 삭제 - 속도 이슈
			((DataSetMap)inDataset.get("input1")).getRowMaps().get(0).remove("USER");
			((DataSetMap)inDataset.get("input1")).getRowMaps().get(0).remove("PAGE");
			Map result = rTCSEngineOilRepSerService.saveRTCSZeroRepSer(inDataset, inVar);
			
			
			//거점인 경우
			DataSetMap dsRtsd0213 = (DataSetMap) inDataset.get("input1");
			String o2oYn = dsRtsd0213.get(0).get("o2oYn").toString();
			if(o2oYn.equals("Y")){
				
				//연계 이력 저장
				Map<String, Object> parameterMap = (Map<String, Object>)dsRtsd0213.get(0);
				Map<String, Object> paramMap = (Map<String, Object>) result.get("rtsd0213");
				//인터페이스에 대한 에러인경우에만 로그 저장
				if(paramMap != null){
//					parameterMap.put("dvsn", "I");
//					parameterMap.put("col01", paramMap.get("rentIfCntrNo"));
//					parameterMap.put("col02", paramMap.get("ordDe"));
//					parameterMap.put("col03", paramMap.get("saleTyCd"));
//					parameterMap.put("col04", paramMap.get("rentIfReqSn"));
//					parameterMap.put("col05", paramMap.get("rentIfBfistSeCd"));
//					parameterMap.put("col06", URLDecoder.decode((String)paramMap.get("custNm")));
//					parameterMap.put("col07", URLDecoder.decode((String)paramMap.get("carNo")));
//					parameterMap.put("col08", paramMap.get("iplMobNo"));
//					parameterMap.put("col09", paramMap.get("iplTelNo"));
//					parameterMap.put("col10", paramMap.get("istBpCd"));
//					parameterMap.put("col11", paramMap.get("itemCd"));
//					parameterMap.put("col12", paramMap.get("ordQy"));
//					parameterMap.put("col13", paramMap.get("dlvTyDtlCd"));
//					parameterMap.put("col14", paramMap.get("istReqDe"));
//					parameterMap.put("col15", paramMap.get("pickupZip"));
//					parameterMap.put("col16", URLDecoder.decode((String)paramMap.get("pickupBassAddr")));
//					parameterMap.put("col17", URLDecoder.decode((String)paramMap.get("pickupDtlAddr")));
//					parameterMap.put("col18", paramMap.get("iplZip"));
//					parameterMap.put("col19", URLDecoder.decode((String)paramMap.get("iplAddr")));
//					parameterMap.put("col20", URLDecoder.decode((String)paramMap.get("iplDtlAddr")));
//					parameterMap.put("col21", paramMap.get("regUsrId"));
//					parameterMap.put("col22", paramMap.get("ordRsn"));
//					parameterMap.put("col23", paramMap.get("opertSts"));
//					parameterMap.put("col24", paramMap.get("opertDe"));
//					parameterMap.put("col25", paramMap.get("drgMil"));
//					parameterMap.put("col26", paramMap.get("rtnCode"));
//					parameterMap.put("col27", paramMap.get("rtnMsg"));
//					parameterMap.put("col28", paramMap.get("ordNo"));
//					parameterMap.put("col29", paramMap.get("tmsOrderId"));
//					parameterMap.put("col30", "");
//					parameterMap.put("col31", result.get("paramStr"));
//					parameterMap.put("col32", result.get("returnStr"));
					
					parameterMap.put("dvsn", "I");
					parameterMap.put("custNo", CommonUtil.isNull(paramMap.get("custNo")));
					parameterMap.put("sendUrl",CommonUtil.isNull(paramMap.get("sendURL")));
					parameterMap.put("sendFlag", CommonUtil.isNull(paramMap.get("rentIfBfistSeCd")));
					parameterMap.put("regId", CommonUtil.isNull(paramMap.get("regId")));
					parameterMap.put("inputData", CommonUtil.isNull(result.get("paramStr")));
					parameterMap.put("outputData", CommonUtil.isNull(result.get("returnStr")));
					parameterMap.put("resultCode", CommonUtil.isNull(result.get("successCode")));
					parameterMap.put("resultMsg", CommonUtil.isNull(result.get("returnMessage")));
					
					try{
						rTCSEngineOilRepSerService.saveRTSD0213(inDataset, inVar);
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			}
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode") + "");
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
			
			//완료 후 SMS 전송  - 프로시저에서 발송되므로 해당 SMS발송건은 제외 처리함(2019.01.18)
//			if(String.valueOf(result.get("successCode")).equals("0")){			
//				DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
//				String smsMsg = (String) inDsMap.getMapValue(0, "smsMsg");
//				String hpNo   = (String) inDsMap.getMapValue(0, "mobNo");
//				
//				Map smsMap = new HashMap();
//				smsMap.put("reservedFg",   "I");
//				smsMap.put("reservedDttm", "00000000000000");
//				smsMap.put("rcvPhnId",     hpNo);
//				smsMap.put("sndPhnId",     "18550100");
//				smsMap.put("sndMsg",       smsMsg);
//				smsMap.put("etcChar1",     "S010");
//				smsMap.put("etcChar2",     "걱정제로신청");
//				smsMap.put("regId",        inVar.get("regId"));
//				
//				try {
//					DataSetMap dsm = new DataSetMap();
//					//상태값을 신규생성상태로 세팅한다.
//					smsMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
//					smsMap.put("dvsn", 					"I");
//					dsm.add(smsMap);
//					
//					inVar2.put("inDsMap", dsm);
//					inVar2.put("sqlnamespace", "cust.saveSmsMsg");				
//					Map rtnMap = rTSDCustRegisterService.saveSmsMsg(inVar2);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
			
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}

	/**
	 * 걱정제로 서비스 내역 조회(공통코드)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/cs/geteZeroServiceCommCode.do") 
	public ModelAndView geteZeroServiceCommCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			Map map = new HashMap();
			map.put("cd", " ");
			map.put("cdNm","전체");
			
			inVar.put("cdGrpCd", "C024");
			inVar.put("useYn", "Y");
			
			Map mapC024 = commonService.listCommInfo(inVar);
			List listC024 = (List)mapC024.get("result");
			listC024.add(0, map);
			DataSetMap dsC024Maps = new DataSetMap();
			dsC024Maps.setRowMaps(listC024);
			outDataset.put("outputC024",	dsC024Maps);	
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}	

    /**
     * 걱정제로 신청 서비스 내역 조회
     * @param xpDto
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping( "/nrtms/cs/zeroChangeServiceList.do" )
    public ModelAndView zeroChangeServiceList( NexacroMapDTO xpDto, Model model, HttpServletRequest req ) throws Exception {
        ReturnType<?> returnType = null;

        try {
            Map<String, Object> inVar = xpDto.getInVariableMap();
            Map<String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
            Map result = rTCSEngineOilRepSerService.zeroChangeServiceList( addUserInfo( inVar ), outDataset );

            List list = ( List ) result.get( "zeroChangeServiceList" );

            DataSetMap accDsMap = new DataSetMap();
            accDsMap.setRowMaps( list );
            outDataset.put( "output", accDsMap );
            
            returnType = ReturnTypeFactory.createReturnType().setOut( xpDto );
        }
        catch ( Exception e ) {
            returnType = ReturnTypeFactory.createReturnType( e );
        }

        return returnType.output();
    }
//		@RequestMapping("/nrtms/cs/zeroChangeServiceList.do") 
//		public ModelAndView zeroChangeServiceList(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
//			ModelAndView mav = new ModelAndView("nexacroMapView");
//			
//			try{
//				Map <String, Object> inVar 			= xpDto.getInVariableMap();
//				Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
//				Map result = rTCSEngineOilRepSerService.zeroChangeServiceList(inVar, outDataset);
//				
//				List list	= (List)result.get("zeroChangeServiceList");
//				
//				DataSetMap accDsMap = new DataSetMap();
//				accDsMap.setRowMaps(list);
//				outDataset.put("output", accDsMap);
//				
//				mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
//				mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
//				mav.addObject(NexacroConstant.ERROR_CODE, "0");
//				mav.addObject(NexacroConstant.ERROR_MSG, "");
//		
//			} catch ( Exception e ) {
//				e.printStackTrace();
//				mav.addObject(NexacroConstant.ERROR_CODE, "-1");
//				mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
//			}
//			return mav;
//		}	
}

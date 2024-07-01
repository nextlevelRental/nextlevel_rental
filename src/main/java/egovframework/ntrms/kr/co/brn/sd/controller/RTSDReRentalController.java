/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMUserController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

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
import egovframework.ntrms.kr.co.brn.sd.service.RTSDReRentalService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTSDReRentalController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	
	
	@Resource(name="rTSDReRentalService")
	RTSDReRentalService rTSDReRentalService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@RequestMapping("/rtms/sd/listReRental.do") 
	public ModelAndView listReRental(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDReRentalService.listReRental(inVar, outDataset);
			
			List reRentalInfo = (List)result.get("reRentalList");
			DataSetMap dsReRentalInfo = new DataSetMap();
			dsReRentalInfo.setRowMaps(reRentalInfo);
			outDataset.put("reRentalList", dsReRentalInfo);
			
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
	
	@RequestMapping("/rtms/sd/listReRentalForExcel.do") 
	public ModelAndView listReRentalForExcel(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTSDReRentalService.listReRentalForExcel(inVar, outDataset);
			
			List reRentalInfo = (List)result.get("reRentalListForExcel");
			DataSetMap dsReRentalInfo = new DataSetMap();
			dsReRentalInfo.setRowMaps(reRentalInfo);
			outDataset.put("reRentalListForExcel", dsReRentalInfo);
			
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
	
	@RequestMapping("/rtms/sd/rtsd0108OrdList.do") 
	public ModelAndView rtsd0108OrdList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			//스케줄 상태 코드
			
			Map result = rTSDReRentalService.rtsd0108OrdList(inVar, outDataset);
			
			List rtsd0108OrdList = (List)result.get("rtsd0108OrdList");
			DataSetMap dsResult = new DataSetMap();
			dsResult.setRowMaps(rtsd0108OrdList);
			outDataset.put("dsResult", dsResult);
			
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
	
	@RequestMapping("/rtms/sd/initRTSDReRental.do") 
	public ModelAndView initRTCOMMPricePop(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S030");
			inVar.put("useYn", "Y");
			Map dsResult1 = commonService.listCommInfo(inVar);
			inVar.put("cdGrpCd", "S103");
			inVar.put("useYn", "Y");
			Map dsResult2 = commonService.listCommInfo(inVar);
			inVar.put("cdGrpCd", "S104");
			inVar.put("useYn", "Y");
			Map dsResult3 = commonService.listCommInfo(inVar);
			inVar.put("cdGrpCd", "S043");
			inVar.put("useYn", "Y");
			Map dsResult4 = commonService.listCommInfo(inVar);
			
			List listComm1	= (List)dsResult1.get("result");	
			List listComm2	= (List)dsResult2.get("result");
			List listComm3	= (List)dsResult3.get("result");
			List listComm4	= (List)dsResult4.get("result");
			DataSetMap codeDsMap1 = new DataSetMap();
			DataSetMap codeDsMap2 = new DataSetMap();
			DataSetMap codeDsMap3 = new DataSetMap();
			DataSetMap codeDsMap4 = new DataSetMap();
			codeDsMap1.setRowMaps(listComm1);
			codeDsMap2.setRowMaps(listComm2);
			codeDsMap3.setRowMaps(listComm3);
			codeDsMap4.setRowMaps(listComm4);
			outDataset.put("output1",	codeDsMap1);
			outDataset.put("output2",	codeDsMap2);
			outDataset.put("output3",	codeDsMap3);
			outDataset.put("output4",	codeDsMap4);
			
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
	 * 가계약정보를 저장(등록, 수정)한다
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-01	wjim		신규생성 
	 */
	@RequestMapping("rtms/sd/saveRerentalContract.do")
	public ModelAndView saveRerentalContract(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map)req.getSession().getAttribute("User");		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			Map <String, Object>     mapInVar	= xpDto.getInVariableMap();
			Map <String, DataSetMap> mapInDSM   = xpDto.getInDataSetMap();
			
			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map <String, Object> mapResult = rTSDReRentalService.saveRerentalContract(mapInDSM, mapInVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , mapResult.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG             , mapResult.get("returnMessage"));		
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 고객정보 업데이트
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-12-22	kstka		신규생성 
	 */
	@RequestMapping("/rtms/sd/updateCustInfo.do")
	public ModelAndView updateCustInfo(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map)req.getSession().getAttribute("User");		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();      
			Map <String, Object>     mapInVar	= xpDto.getInVariableMap();

			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map <String, Object> mapResult = rTSDReRentalService.updateCustInfo(mapInVar, inDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , mapResult.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG             , mapResult.get("returnMessage"));		
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
	
	/**
	 * 가계약정보 업데이트
	 * 
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2019-07-23	kstka		신규생성 
	 */
	@RequestMapping("/rtms/sd/createRtsd0123.do")
	public ModelAndView createRtsd0123(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map)req.getSession().getAttribute("User");		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();      
			Map <String, Object>     mapInVar	= xpDto.getInVariableMap();

			mapInVar.put("regId", loginInfo.get("userId"));
						
			Map <String, Object> mapResult = rTSDReRentalService.createRtsd0123(mapInVar, inDataset);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME  , xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE            , mapResult.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG             , mapResult.get("returnMessage"));		
		
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE            , "-1");
			mav.addObject(NexacroConstant.ERROR_MSG             , e.toString());
		}
		
		return mav;
	}
}

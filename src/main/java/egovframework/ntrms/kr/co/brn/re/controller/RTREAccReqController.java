/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTREAccReqController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.controller;

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
import egovframework.ntrms.kr.co.brn.re.service.RTREAccReqService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREAccReqController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTREAccReqService")
	RTREAccReqService rTREAccReqService;
	
	@Resource(name="commonService")
	CommonService commonService;
	

	/**
	 * 공통코드 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getAccReqCode.do") 
	public ModelAndView getCodeInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map map = new HashMap();
			map.put("cd","");
			map.put("cdNm","전체");
			
			//신청구분 구분코드
			inVar.put("cdGrpCd", "R011");
			inVar.put("useYn", "Y");

			Map mapR011 = commonService.listCommInfo(inVar);
			List listR011 = (List)mapR011.get("result");	
			DataSetMap dsR011Maps = new DataSetMap();
			
			//전체항목 추가
			listR011.add(0, map);
			dsR011Maps.setRowMaps(listR011);
			outDataset.put("outputR011",	dsR011Maps);
			
			
			//계좌신청구분 구분코드
			inVar.put("cdGrpCd", "R015");
			inVar.put("useYn", "Y");

			Map mapR015 = commonService.listCommInfo(inVar);
			List listR015 = (List)mapR015.get("result");	
			DataSetMap dsR015Maps = new DataSetMap();
			
			//전체항목 추가
			listR015.add(0, map);
			dsR015Maps.setRowMaps(listR015);
			outDataset.put("outputR015",	dsR015Maps);			
			
			//신청상태코드
			inVar.put("cdGrpCd", "R009");
			inVar.put("useYn", "Y");
			
			Map mapR009 = commonService.listCommInfo(inVar);
			List listR009 = (List)mapR009.get("result");		
			
			DataSetMap dsR009Maps = new DataSetMap();
			//전체항목 추가			
			listR009.add(0, map);			
			dsR009Maps.setRowMaps(listR009);
			outDataset.put("outputR009",	dsR009Maps);	
			
			//오류내용코드
			inVar.put("cdGrpCd", "R003");
			inVar.put("useYn", "Y");
			
			Map mapR003 = commonService.listCommInfo(inVar);
			List listR003 = (List)mapR003.get("result");		
			
			DataSetMap dsR003Maps = new DataSetMap();
			dsR003Maps.setRowMaps(listR003);
			outDataset.put("outputR003",	dsR003Maps);
			
			//계좌신청발생구분코드
			inVar.put("cdGrpCd", "R010");
			inVar.put("useYn", "Y");
			
			Map mapR010 = commonService.listCommInfo(inVar);
			List listR010 = (List)mapR010.get("result");		
			
			DataSetMap dsR010Maps = new DataSetMap();
			dsR010Maps.setRowMaps(listR010);
			outDataset.put("outputR010",	dsR010Maps);			
			
			//은행코드
			inVar.put("cdGrpCd", "R001");
			inVar.put("useYn", "Y");
			
			Map mapR001 = commonService.listCommInfo(inVar);
			List listR001 = (List)mapR001.get("result");		
			
			DataSetMap dsR001Maps = new DataSetMap();
			dsR001Maps.setRowMaps(listR001);
			outDataset.put("outputR001",	dsR001Maps);			
			
			//결제일코드(CMS)
			inVar.put("cdGrpCd", "R005");
			inVar.put("useYn", "Y");
			
			Map mapR005 = commonService.listCommInfo(inVar);
			List listR005 = (List)mapR005.get("result");		
			
			DataSetMap dsR005Maps = new DataSetMap();
			dsR005Maps.setRowMaps(listR005);
			outDataset.put("outputR005",	dsR005Maps);
			
			//파일위치코드
			inVar.put("cdGrpCd", "R016");
			inVar.put("useYn", "Y");
			
			Map mapR016 = commonService.listCommInfo(inVar);
			List listR016 = (List)mapR016.get("result");		
			logger.debug("listR016>>>>>>>>>>>>>>>>" + listR016);
			DataSetMap dsR016Maps = new DataSetMap();
			dsR016Maps.setRowMaps(listR016);
			outDataset.put("outputR016",	dsR016Maps);			
			
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
	 * 계좌신청 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/listAccReq.do") 
	public ModelAndView listAccReq(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTREAccReqService.listAccReq(inVar, outDataset);
			
			List listAccReq	= (List)result.get("listAccReq");

			DataSetMap accDsMap = new DataSetMap();
		
			accDsMap.setRowMaps(listAccReq);

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
}

/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTREPaymentController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.controller;

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

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.re.service.RTREPaymentService;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTREPaymentController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTREPaymentService")
	RTREPaymentService rTREPaymentService;
	
	@Resource(name="commonService")
	CommonService commonService;
	

	/**
	 * 공통코드 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getCodeInfo.do") 
	public ModelAndView getCodeInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map map = new HashMap();
			map.put("cd","");
			map.put("cdNm","선택");
			
			//고객유형 구분코드
			inVar.put("cdGrpCd", "S024");
			inVar.put("useYn", "Y");

			Map mapS024 = commonService.listCommInfo(inVar);
			List listS024 = (List)mapS024.get("result");		
			//선택항목 추가
			listS024.add(0, map);				
			DataSetMap dsS024Maps = new DataSetMap();
			dsS024Maps.setRowMaps(listS024);
			outDataset.put("outputS024",	dsS024Maps);
			
			//결제방법코드
			inVar.put("cdGrpCd", "R004");
			inVar.put("useYn", "Y");
			
			Map mapR004 = commonService.listCommInfo(inVar);
			List listR004 = (List)mapR004.get("result");		
			//선택항목 추가
			listR004.add(0, map);		
			DataSetMap dsR004Maps = new DataSetMap();
			dsR004Maps.setRowMaps(listR004);
			outDataset.put("outputR004",	dsR004Maps);	
			
			//결제일코드(CMS)
			inVar.put("cdGrpCd", "R005");
			inVar.put("useYn", "Y");
			
			Map mapR005 = commonService.listCommInfo(inVar);
			List listR005 = (List)mapR005.get("result");		
			//선택항목 추가
			listR005.add(0, map);			
			DataSetMap dsR005Maps = new DataSetMap();
			dsR005Maps.setRowMaps(listR005);
			outDataset.put("outputR005",	dsR005Maps);
			
			//결제일코드(카드이체)
			inVar.put("cdGrpCd", "R006");
			inVar.put("useYn", "Y");
			
			Map mapR006 = commonService.listCommInfo(inVar);
			List listR006 = (List)mapR006.get("result");		
			//선택항목 추가
			listR006.add(0, map);				
			DataSetMap dsR006Maps = new DataSetMap();
			dsR006Maps.setRowMaps(listR006);
			outDataset.put("outputR006",	dsR006Maps);			
			
			//은행코드
			inVar.put("cdGrpCd", "R001");
			inVar.put("useYn", "Y");
			
			Map mapR001 = commonService.listCommInfo(inVar);
			List listR001 = (List)mapR001.get("result");		
			//선택항목 추가
			listR001.add(0, map);				
			DataSetMap dsR001Maps = new DataSetMap();
			dsR001Maps.setRowMaps(listR001);
			outDataset.put("outputR001",	dsR001Maps);			
			
			//카드사코드
			inVar.put("cdGrpCd", "R002");
			inVar.put("useYn", "Y");
			
			Map mapR002 = commonService.listCommInfo(inVar);
			List listR002 = (List)mapR002.get("result");		
			//선택항목 추가
			listR002.add(0, map);				
			DataSetMap dsR002Maps = new DataSetMap();
			dsR002Maps.setRowMaps(listR002);
			outDataset.put("outputR002",	dsR002Maps);
			
			// 2016-06-14 신용조회 방법 추가
			inVar.put("cdGrpCd", "S034");
			inVar.put("useYn", "Y");
			Map dsCertification = commonService.listCommInfo(inVar);	
			List listDsCertification= (List)dsCertification.get("result");
			DataSetMap mapDsCertification 	= new DataSetMap();
			mapDsCertification.setRowMaps(listDsCertification);
			outDataset.put("mapDsCertification",mapDsCertification);			
			
			
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
	 * 결제정보조회 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/listPayInfo.do") 
	public ModelAndView listResult(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTREPaymentService.listPayInfo(inVar, outDataset);
			
			List listPayInfo	= (List)result.get("listPayInfo");

			DataSetMap accDsMap = new DataSetMap();
		
			accDsMap.setRowMaps(listPayInfo);

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
	
	/**
	 * 결제정보 변경이력 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/listPaymentHist.do") 
	public ModelAndView listPaymentHist(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTREPaymentService.listPaymentHist(inVar, outDataset);
			
			List listPaymentHist	= (List)result.get("listPaymentHist");

			DataSetMap accDsMap = new DataSetMap();
		
			accDsMap.setRowMaps(listPaymentHist);

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
	
	/**
	 * 결제정보 저장
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/savePaymentInfo.do") 
	public ModelAndView savePaymentInfo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			
			for(int i=0; i<inDsMap.size();i++){
				Map map = inDsMap.get(i);
				map.put("rpcDay", sdf.format(today));
				map.put("rpcUid", loginInfo.get("userId"));
				map.put("userId", loginInfo.get("userId"));
			}
			
			inVar.put("inDsMap", inDsMap);
			
			Map result =  rTREPaymentService.savePaymentInfo(inDataset, inVar);
			
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
	 * 결제정보 삭제
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/delPaymentInfo.do") 
	public ModelAndView delPaymentInfo(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		

			Map result =  rTREPaymentService.delPaymentInfo(inDataset, inVar);
			
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
	 * 당일 계좌인증 정상정보 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/listTodayCmsInfos.do") 
	public ModelAndView listTodayCmsInfos(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTREPaymentService.listTodayCmsInfos(inVar, outDataset);
			
			List listTodayCmsInfos	= (List)result.get("listTodayCmsInfos");

			DataSetMap accDsMap = new DataSetMap();
		
			accDsMap.setRowMaps(listTodayCmsInfos);

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

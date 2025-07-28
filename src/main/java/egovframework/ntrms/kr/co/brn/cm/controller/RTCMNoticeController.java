/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMUserController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cm.controller;

import java.io.File;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;









import egovframework.ntrms.kr.co.brn.cm.dao.RTCMNoticeMapDAO;
import egovframework.ntrms.kr.co.brn.cm.service.RTCMNoticeService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

@Controller
public class RTCMNoticeController {

	protected Log logger = LogFactory.getLog(this.getClass());	
	@Resource(name="rTCMNoticeService")
	RTCMNoticeService rTCMNoticeService;
	
	@RequestMapping("/ntrms/cm/listNoticeInfo.do") 
	public ModelAndView listNoticeInfo(NexacroMapDTO xpDto) throws Exception {
	
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = rTCMNoticeService.listNoticeInfo(inVar, outDataset);
			
			List listUserInfo	= (List)result.get("listNoticeInfo");

			//공지사항 목록조회
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(listUserInfo);
			
			outDataset.put("listNotice",	userDsMap);
			
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
	
	
	/*
	 * 첨부파일 목록 및 조회수증가 처리
	 */
	@RequestMapping("/ntrms/cm/setDetailNoticeInfo.do") 
	public ModelAndView setDetailNoticeInfo(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
	
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTCMNoticeService.setDetailNoticeInfo(inVar, inDataset);
			
			List detail	= (List)result.get("vcursor");

			//공지사항 목록조회
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(detail);
			
			outDataset.put("listFile",	userDsMap);
			
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
	
	@RequestMapping("/ntrms/cm/saveNoticeInfo.do") 
	public ModelAndView saveNoticeInfo(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));

			Map result = rTCMNoticeService.saveNoticeInfo(inDataset, inVar);
			
			
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
	
	// 파일생성
	@RequestMapping("/ntrms/cm/fileDownLoad.do")
	public ModelAndView createFile(NexacroMapDTO xpDto, HttpServletRequest req) {
		ModelAndView model = null;
		Map fileMap = null;
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");	
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("fileSeq", req.getParameter("fileSeq"));	
			
			Map result 		= rTCMNoticeService.fileInfo(inVar);
			List resultList = (List)result.get("vcursor");
			String tmpPath 	= (String)((Map)resultList.get(0)).get("filePath");
			String fileName = (String)((Map)resultList.get(0)).get("fileLnm");
			String org_fileName = (String)((Map)resultList.get(0)).get("filePnm");
			String filePath = req.getSession().getServletContext().getRealPath(tmpPath);
			
			
			
			
			try {
				File file = new File(filePath + "/" + fileName);
				
				if(!file.exists()) {
					model = new ModelAndView("error/error");
					Map errMap = new HashMap();
					errMap.put("retMsg", "파일을 읽는중 오류가 발생되었습니다.");
					errMap.put("retCd", -1);
					model.addObject("result", errMap);

				} else {
					fileMap = new HashMap<String, Object>();
					fileMap.put("file_data", file);
					fileMap.put("file_ori_nm", org_fileName);
					fileMap.put("deleteYn", "N");
					// 파일 객체 생성
					model = new ModelAndView("file", "downloadFile", fileMap);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				//model = new ModelAndView("nexacroMapView");
				//throw new Exception("파일을 읽는중 오류가 발생되었습니다.");
				model.addObject(NexacroConstant.ERROR_CODE, "-1");
				model.addObject(NexacroConstant.ERROR_MSG, "파일을 읽는중 오류가 발생되었습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addObject(NexacroConstant.ERROR_CODE, "-1");
			model.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return model;
	}
	
}

/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTRECmsTranResultController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.nexacro.xapi.data.ColumnHeader;
import com.nexacro.xapi.data.DataSet;
import com.nexacro.xapi.data.DataTypes;
import com.nexacro.xapi.data.PlatformData;
import com.nexacro.xapi.data.VariableList;
import com.nexacro.xapi.tx.HttpPlatformResponse;

import egovframework.ntrms.kr.co.brn.re.service.RTRECmsTranResultService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class RTRECmsTranResultController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTRECmsTranResultService")
	RTRECmsTranResultService rTRECmsTranResultService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "multipartResolver")
	CommonsMultipartResolver multipartResolver;
	
	/**
	 * CMS수납처리
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/cmsTranReceipt.do") 
	public ModelAndView setAggregate(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			DataSetMap dsm = new DataSetMap();
			Map paramMap = new HashMap();
			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
			paramMap.put("dvsn", 		"I");
			paramMap.put("rcmsDay",  	(String)inVar.get("rcmsDay"));				//출금이체일

			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);					
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result =  rTRECmsTranResultService.cmsTranReceipt(inDataset, inVar);
			
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
	 * 결과파일 반영
	 * @param xpDto
	 * @param request
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/ntrms/re/cmsTranResultFileUpload.do")
	public void cmsTranResultFileUpload(NexacroMapDTO xpDto, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		PlatformData resData = new PlatformData();
		VariableList resVarList = resData.getVariableList();		
		DataSet ds = new DataSet("ds_output");
		
		String 	rqstDay = request.getParameter("rqstDay");
		String 	fileNm  = request.getParameter("fileNm");
		String 	fileTp  = request.getParameter("fileTp");
		String 	acrqFg  = request.getParameter("acrqFg");
		
		Map loginInfo = (Map) request.getSession().getAttribute("User");	
		DataSetMap tranInfo 				= xpDto.getTranInfoMap();
		Map <String, Object> inVar 			= xpDto.getInVariableMap();
		Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
		Map <String, Object> outVar 		= xpDto.getOutVariableMap();
		Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
		
		ds.addColumn(new ColumnHeader("fileid", 	DataTypes.STRING));
		ds.addColumn(new ColumnHeader("filename", 	DataTypes.STRING));
		ds.addColumn(new ColumnHeader("fileTp", 	DataTypes.STRING));
		ds.addColumn(new ColumnHeader("filesize", 	DataTypes.INT));
		ds.addColumn(new ColumnHeader("savepath", 	DataTypes.STRING));
		ds.addColumn(new ColumnHeader("acrqFg", 	DataTypes.STRING));
		ds.addColumn(new ColumnHeader(NexacroConstant.ERROR_CODE, 	DataTypes.STRING));
		ds.addColumn(new ColumnHeader(NexacroConstant.ERROR_MSG, 	DataTypes.STRING));

		InputStream is = null;
		Map result =   null;	
		Map map	= null;
		int success = 0;		
		
		try {
			String contextRealPath = request.getSession().getServletContext().getRealPath("/");
			String strUploadPath = propertiesService.getString("global.fileupload.path");
			logger.debug("================================================================");
			
			// 한글 파일명 처리를 위한 설정
			request.setCharacterEncoding("utf-8");
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator fileIter = multiRequest.getFileNames();
			
			// 파라미터 정보 수집
			Enumeration e = multiRequest.getParameterNames();
			logger.debug("================================================================");
			while(e.hasMoreElements()) {
				String paramV = (String)e.nextElement();		
				logger.debug("paramName : " + paramV + ", paramValue : " + multiRequest.getParameter(paramV));
			}
			logger.debug("================================================================");
			
			while (fileIter.hasNext()) {
				MultipartFile mFile = multiRequest.getFile((String) fileIter.next());

				logger.debug("============================[ File Name ]===============================");
				logger.debug(mFile.getName() + ":" + mFile.getOriginalFilename());
				logger.debug("====================================================================");
				
				UUID uuid = UUID.randomUUID();					//저장될 물리적 파일명
				String fileName = mFile.getOriginalFilename();		//원본파일명
				int j = -1;
				String fileExt = "";
				String tmpName = "";
				if ((j = fileName.indexOf(".")) != -1) {					//파일확장자
					fileExt = fileName.substring(j);
				}
				tmpName = uuid.toString() + fileExt;					//저장될 파일명 + 확장자
				
				logger.debug("####################################");
				logger.debug("FileNames : " + mFile.getName());
				logger.debug("####################################");

				//파일내용을 읽은후 처리한다.
				StringWriter writer = new StringWriter();
				IOUtils.copy(mFile.getInputStream(), writer, "euc-kr");
				String theString = writer.toString();
				
				logger.debug("====================================================");
				logger.debug(theString);
				logger.debug("====================================================");
				
				if (mFile.getSize() > 0) {
					
					DataSetMap dsm = new DataSetMap();
					Map paramMap = new HashMap();
					paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
					paramMap.put("dvsn", 		"I");
					paramMap.put("rqstDay",  	rqstDay);				//요청일자
					paramMap.put("fileNm", 		fileNm);				//파일명	
					paramMap.put("fileTp", 		fileTp);				//파일송수신 구분
					paramMap.put("fileData", 	theString);				//파일데이터  
					paramMap.put("acrqFg", 		acrqFg);				//작업구분
					paramMap.put("regId", 		loginInfo.get("userId"));		//등록자 ID		

					dsm.add(paramMap);
					inVar.put("inDsMap",  dsm);					

					inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
					
					//결과파일 반영데이터 생성
					result =  rTRECmsTranResultService.makeFileData(inDataset, inVar);

					logger.debug("successCode >>>> " + result.get("successCode"));
					
					success = Integer.parseInt((result.get("successCode") + ""));
					
					InputStream stream = null;
					OutputStream bos = null;
					stream = mFile.getInputStream();
					File cFile = new File(contextRealPath + strUploadPath);
					if (!cFile.isDirectory()) cFile.mkdir();
					bos = new FileOutputStream(contextRealPath + strUploadPath + "/" + tmpName);

					int bytesRead = 0;
					byte[] buffer = new byte[1024 * 1024];

					while ((bytesRead = stream.read(buffer, 0, 	 1024 * 1024)) != -1) {
						bos.write(buffer, 0, bytesRead);
					}
					
					int row = ds.newRow();
					ds.set(row, "fileid", 		tmpName);
					ds.set(row, "filename", 	fileName);
					ds.set(row, "fileTp", 		fileTp);
					ds.set(row, "filesize", 	mFile.getSize());
					ds.set(row, "savepath",     strUploadPath);
					ds.set(row, "acrqFg",       acrqFg);
					ds.set(row, NexacroConstant.ERROR_CODE, result.get("successCode"));
					ds.set(row, NexacroConstant.ERROR_MSG, result.get("returnMessage"));
				}
			}
			resData.addDataSet(ds);
			resVarList.add(NexacroConstant.ERROR_CODE, result.get("successCode"));
			//resVarList.add("ErrorMsg", savePath+"/"+fileName);
			resVarList.add(NexacroConstant.ERROR_MSG, result.get("returnMessage"));			
			logger.debug(resData.saveXml());
			HttpPlatformResponse res = new HttpPlatformResponse(response);
			res.setData(resData);
			res.sendData();
			
		} catch (Exception e) {
			e.printStackTrace();
			resVarList.add(NexacroConstant.ERROR_CODE, "-1");
			resVarList.add(NexacroConstant.ERROR_MSG,  e.toString());		
		}
	}	
	
	/**
	 * CMS이체완료여부 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/cmsTranEnd.do") 
	public ModelAndView getCmsTranEnd(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map result = rTRECmsTranResultService.cmsTranEnd(inVar, outDataset);
			outVal.put("cmsTranEnd", (String)result.get("result"));
			
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

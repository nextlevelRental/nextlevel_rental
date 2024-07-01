/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTRECrdTranController.java
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
import java.text.SimpleDateFormat;
import java.util.Date;
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

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.re.service.RTRECrdTranService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class RTRECrdTranController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTRECrdTranService")
	RTRECrdTranService rTRECrdTranService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "multipartResolver")
	CommonsMultipartResolver multipartResolver;	
	
	/**
	 * 공통코드 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getCrdTranCommCode.do") 
	public ModelAndView getCodeInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map map = new HashMap();
			map.put("cd","");
			map.put("cdNm","전체");
			
			//출금상태 코드
			inVar.put("cdGrpCd", "R022");
			inVar.put("useYn", "Y");
			
			Map mapR022 = commonService.listCommInfo(inVar);
			List listR022 = (List)mapR022.get("result");		
			
			//전체항목 추가
			listR022.add(0, map);
			DataSetMap dsR022Maps = new DataSetMap();
			dsR022Maps.setRowMaps(listR022);
			outDataset.put("outputR022",	dsR022Maps);
			
			//카드이체결제일 코드
			inVar.put("cdGrpCd", "R006");
			inVar.put("useYn", "Y");
			
			Map mapR006 = commonService.listCommInfo(inVar);			
			List listR006 = (List)mapR006.get("result");		
			
			DataSetMap dsR006Maps = new DataSetMap();
			dsR006Maps.setRowMaps(listR006);
			outDataset.put("outputR006",	dsR006Maps);
			
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("HH");

			outVal.put("toDay", sdf.format(today)); //현재일자
			outVal.put("toHour", sdf2.format(today)); //현재시간			
			
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
	 * 카드이체조회(계약번호별 내역조회)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getCrdTranOrdNoList.do") 
	public ModelAndView getCrdTranOrdNoList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map result = rTRECrdTranService.getCrdTranOrdNoList(inVar, outDataset);
			
			List li= (List)result.get("crdTranOrdNoList");
			
			DataSetMap crdDsMap = new DataSetMap();
		
			crdDsMap.setRowMaps(li);

			outDataset.put("output",	crdDsMap);
			
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
	 * 카드이체조회(카드사별 내역조회)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getCrdTranCardList.do") 
	public ModelAndView getCrdTranCardList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map result = rTRECrdTranService.getCrdTranCardList(inVar, outDataset);
			
			List li= (List)result.get("crdTranCardList");
			
			DataSetMap crdDsMap = new DataSetMap();
			
			crdDsMap.setRowMaps(li);
			
			outDataset.put("output",	crdDsMap);
			
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
	 * 카드이체 대상집계
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/crdTranAggregate.do") 
	public ModelAndView crdTranAggregate(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
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
			paramMap.put("dvsn"		, "I");
			paramMap.put("rqstDay"	, (String)inVar.get("rqstDay"));	//카드이체청구일
			paramMap.put("stdexDd"	, (String)inVar.get("stdexDd"));	//결제일청구기준데이터
			paramMap.put("pydmaYn"	, (String)inVar.get("pydmaYn"));	//제외건존재여부
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);			
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result =  rTRECrdTranService.crdTranAggregate(inDataset, inVar);
			
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
	 * 카드이체대상 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getCrdTranTargetList.do") 
	public ModelAndView getCrdTranTargetList(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map result = rTRECrdTranService.getCrdTranTargetList(inVar, outDataset);
			
			List li= (List)result.get("listCrdTranTarget");
			
			Map map	= (Map)result.get("msgMap");
			logger.debug("map>>>>>>>>>>>>>>>" +map);
			logger.debug("map.get(successCode) >>> "+ map.get("successCode"));

			outVal.put("returnMsg", map.get("returnMessage"));
			outVal.put("returnCode", (BigDecimal) map.get("successCode"));
			DataSetMap crdDsMap = new DataSetMap();
		
			crdDsMap.setRowMaps(li);

			outDataset.put("output",	crdDsMap);
			
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
	 * 	카드이체수납처리
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/crdTranReceipt.do") 
	public ModelAndView crdTranReceipt(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
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
			paramMap.put("dvsn"		, "I");
			paramMap.put("rcrdDay"	, (String)inVar.get("rcrdDay"));	//카드이체청구일
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);					
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
			
			Map result =  rTRECrdTranService.crdTranReceipt(inDataset, inVar);
			
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
	 * 카드이체 처리 파일 생성
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/crdTranMakeData.do") 
	public ModelAndView crdTranMakeData(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
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
			paramMap.put("dvsn"		, "I");
			paramMap.put("rqstDay"	, (String)inVar.get("rqstDay"));	//카드이체청구일
			paramMap.put("fileNm"	, (String)inVar.get("fileNm"));		//파일명
			paramMap.put("fileTp"	, (String)inVar.get("fileTp"));		//송수신파일구분	
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);			
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		

			Map result =  rTRECrdTranService.crdTranMakeData(inDataset, inVar);
			
			List list = (List)result.get("vcursor");
			
			DataSetMap outDsMap = new DataSetMap();
			outDsMap.setRowMaps(list);
			outDataset.put("output",	outDsMap);
			outVar.put("crlfYn", result.get("crlfYn"));					
			
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
	 * 카드이체 결과파일 반영
	 * @param xpDto
	 * @param request
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/ntrms/re/crdTranResultFileUpload.do")
	public void crdTranResultFileUpload(NexacroMapDTO xpDto, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

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
				
				//logger.debug("====================================================");
				//logger.debug(theString);
				//logger.debug("====================================================");
				
				if (mFile.getSize() > 0) {
					
					DataSetMap dsm = new DataSetMap();
					Map paramMap = new HashMap();
					paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
					paramMap.put("dvsn", 		"I");
					paramMap.put("rqstDay",  	rqstDay);				//요청일자
					paramMap.put("fileNm", 		fileNm);				//파일명	
					paramMap.put("fileTp", 		fileTp);				//파일송수신구분
					paramMap.put("fileData", 	theString);				//파일데이터  
					paramMap.put("acrqFg", 		acrqFg);				//작업구분
					paramMap.put("regId", 		loginInfo.get("userId"));		//등록자 ID		

					dsm.add(paramMap);
					inVar.put("inDsMap",  dsm);
					
					inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		
					
					//결과파일 반영데이터 생성
					result =  rTRECrdTranService.crdMakeFileData(inDataset, inVar);
					
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
	 * 카드이체완료여부 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/crdTranEnd.do") 
	public ModelAndView getCrdTranEnd(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map result = rTRECrdTranService.crdTranEnd(inVar, outDataset);
			outVal.put("crdTranEnd", (String)result.get("result"));
			
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
	 * access token 획득
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/getAccessToken.do") 
	public ModelAndView getAccessToken(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			//export서버 주소
			String rootUrl = propertiesService.getString("exports.interface.root.url");
			String subUrl = propertiesService.getString("exports.interface.init.url");
			
			//파라미터 세팅			
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("userId", loginInfo.get("userId"));
			paramMap.put("timeout", 300000);
			paramMap.put("unChkTimout", "N");
			paramMap.put("method", "POST");
			
			//신규 exports서버에서 token을 받아온다
			Map result =  rTRECrdTranService.getAccessToken(rootUrl + subUrl, paramMap);		
			
			DataSetMap resultDs = new DataSetMap();
			resultDs.add(result);
			outDataset.put("output",	resultDs);
			
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
	 * 파일생성
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/exportFile.do") 
	public ModelAndView exportFile(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			
			//export서버 주소
			String rootUrl = propertiesService.getString("exports.interface.root.url");
			String subUrl = propertiesService.getString("exports.interface.export.url");
			
			String accessToken = req.getHeader("Authorization");
			
			//파라미터 세팅			
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("userId", loginInfo.get("userId"));
			paramMap.put("timeout", 10000);
			paramMap.put("unChkTimout", "Y");
			paramMap.put("token", accessToken);
			paramMap.put("method", "POST");
			
			paramMap.put("fileTp", inVar.get("fileTp"));
			paramMap.put("rqstDay", inVar.get("rqstDay"));
			paramMap.put("fileNm", inVar.get("fileNm"));
			paramMap.put("crlfYn", inVar.get("crlfYn"));
			paramMap.put("delYn", inVar.get("delYn"));
			paramMap.put("gubun", inVar.get("gubun"));
			paramMap.put("rowSeq", inVar.get("rowSeq"));
			
			//신규 exports서버에서 token을 받아온다
			Map result =  rTRECrdTranService.exportFile(rootUrl + subUrl, paramMap);		
			
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
	 * 파일 업로드 (KCP)
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/uploadKCP.do") 
	public ModelAndView uploadKCP(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			
			//export서버 주소
			String rootUrl = propertiesService.getString("exports.interface.root.url");
			String subUrl = propertiesService.getString("exports.interface.upload.url");
			
			String accessToken = req.getHeader("Authorization");
			
			//파라미터 세팅			
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("userId", loginInfo.get("userId"));
			paramMap.put("timeout", 10000);
			paramMap.put("unChkTimout", "Y");
			paramMap.put("token", accessToken);
			paramMap.put("method", "POST");
			
			paramMap.put("kcpFlag", inVar.get("kcpFlag"));
			paramMap.put("kcpReqType", inVar.get("kcpReqType"));
			paramMap.put("kcpReqDate", inVar.get("kcpReqDate"));
			paramMap.put("fileNm", inVar.get("fileNm"));
			
			//신규 exports서버에서 token을 받아온다
			Map result =  rTRECrdTranService.upanddownKCP(rootUrl + subUrl, paramMap);		
			
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
	 * 파일 다운로드 (KCP)
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/downloadKCP.do") 
	public ModelAndView downloadKCP(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			
			//export서버 주소
			String rootUrl = propertiesService.getString("exports.interface.root.url");
			String subUrl = propertiesService.getString("exports.interface.download.url");
			
			String accessToken = req.getHeader("Authorization");
			
			//파라미터 세팅			
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("userId", loginInfo.get("userId"));
			paramMap.put("timeout", 10000);
			paramMap.put("unChkTimout", "Y");
			paramMap.put("token", accessToken);
			paramMap.put("method", "POST");
			
			paramMap.put("kcpFlag", inVar.get("kcpFlag"));
			paramMap.put("kcpReqType", inVar.get("kcpReqType"));
			paramMap.put("kcpReqDate", inVar.get("kcpReqDate"));
			paramMap.put("fileNm", inVar.get("fileNm"));
			
			//신규 exports서버에서 token을 받아온다
			Map result =  rTRECrdTranService.upanddownKCP(rootUrl + subUrl, paramMap);		
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));			
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
}

/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTRECashReceiptMngController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.controller;

import java.io.File;
import java.io.FileInputStream;
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
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
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
import egovframework.ntrms.kr.co.brn.re.service.RTRECashReceiptMngService;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class RTRECashReceiptMngController {
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTRECashReceiptMngService")
	RTRECashReceiptMngService rTRECashReceiptMngService;
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "multipartResolver")
	CommonsMultipartResolver multipartResolver;

	@RequestMapping("/ntrms/re/getCashReceiptCommCode.do") 
	public ModelAndView getCashReceiptCommCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map map = new HashMap();
			map.put("cd","");
			map.put("cdNm","전체");
			
			inVar.put("cdGrpCd", "R016");
			inVar.put("useYn", "Y");
			
			Map mapR016 = commonService.listCommInfo(inVar);
			List listR016 = (List)mapR016.get("result");
			DataSetMap dsR016Maps = new DataSetMap();
			dsR016Maps.setRowMaps(listR016);
			outDataset.put("outputR016",	dsR016Maps);	
			
			inVar.put("cdGrpCd", "R033");
			inVar.put("useYn", "Y");
			
			Map mapR033 = commonService.listCommInfo(inVar);
			List listR033 = (List)mapR033.get("result");
			listR033.add(0, map);
			DataSetMap dsR033Maps = new DataSetMap();
			dsR033Maps.setRowMaps(listR033);
			outDataset.put("outputR033",	dsR033Maps);	
			
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
	
	@RequestMapping("/ntrms/re/getCashReceiptDate.do") 
	public ModelAndView getCashReceiptDate(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("HH");
			
			outVal.put("prevLastDate" , DateUtil.getPrevLastDate());	//전월말일
			outVal.put("prevFirstDate", DateUtil.getPrevFirstDate());	//전월1일
			outVal.put("toDay", sdf.format(today)); 					//현재일자
			outVal.put("toHour", sdf2.format(today)); 					//현재시간
			
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


	@RequestMapping("/ntrms/re/getCashReceiptTargetList.do") 
	public ModelAndView getCashReceiptTargetList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map result = rTRECashReceiptMngService.getCashReceiptTargetList(inVar, outDataset);
			List li= (List)result.get("listCashReceiptTarget");
			Map map	= (Map)result.get("msgMap");
			outVal.put("returnMsg", map.get("returnMessage"));
			outVal.put("returnCode", (BigDecimal) map.get("successCode"));
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(li);
			outDataset.put("output", accDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
		}catch ( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}	
	
	@RequestMapping("/ntrms/re/cashReceiptAggregate.do") 
	public ModelAndView cashReceiptAggregate(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
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
			paramMap.put("cashDay"	, (String)inVar.get("cashDay"));	//발행일
			paramMap.put("recvSDay" , (String)inVar.get("recvSDay"));	//수납기간 시작일자
			paramMap.put("recvEDay"	, (String)inVar.get("recvEDay"));	//수납기간 종료일자
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			inVar.put("regId", loginInfo.get("userId"));  				//등록자 ID		
			
			Map result =  rTRECashReceiptMngService.cashReceiptAggregate(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		}catch ( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}		


	@RequestMapping("/ntrms/re/cashReceiptMakeData.do") 
	public ModelAndView cashReceiptMakeData(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
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
			
			paramMap.put("rcrdDay"	, (String)inVar.get("rcrdDay"));	//발행일
			paramMap.put("fileNm" 	, (String)inVar.get("fileNm"));		//파일명
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			
			inVar.put("regId", loginInfo.get("userId"));

			Map result =  rTRECashReceiptMngService.cashReceiptMakeData(inDataset, inVar);
			List list = (List)result.get("vcursor");
			
			DataSetMap outDsMap = new DataSetMap();
			outDsMap.setRowMaps(list);
			outVar.put("crlfYn", result.get("crlfYn"));
			outDataset.put("output",	outDsMap);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));
		}catch ( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}	
	
	/**
	 * 현금영수증 반영
	 * @param xpDto
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/re/cashReceiptProc.do") 
	public ModelAndView cashReceiptProc(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		
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
			
			paramMap.put("cashDay"	, (String)inVar.get("cashDay"));	//발행일
			dsm.add(paramMap);
			inVar.put("inDsMap",  dsm);
			
			inVar.put("regId", loginInfo.get("userId"));  //등록자 ID		

			Map result =  rTRECashReceiptMngService.cashReceiptProc(inDataset, inVar);
			
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


	@RequestMapping(value = "/ntrms/re/cashReceiptResultFileUpload.do")
	public void cashReceiptResultFileUpload(NexacroMapDTO xpDto, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		PlatformData resData = new PlatformData();
		VariableList resVarList = resData.getVariableList();		
		DataSet ds = new DataSet("ds_output");

		String 	rqstDay = request.getParameter("rqstDay");	//발행일
		String 	fileNm  = request.getParameter("fileNm");	//파일명
		String 	fileTp  = request.getParameter("fileTp");	//파일송수신구분
		
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
		ds.addColumn(new ColumnHeader(NexacroConstant.ERROR_CODE, 	DataTypes.STRING));
		ds.addColumn(new ColumnHeader(NexacroConstant.ERROR_MSG, 	DataTypes.STRING));

		InputStream is = null;
		Map result =   null;	
		Map map	= null;
		List li = null;		
		int success = 0;		
		
		StringBuffer excelStr = new StringBuffer();
		
		try {
			String contextRealPath = request.getSession().getServletContext().getRealPath("/");
			String strUploadPath = propertiesService.getString("global.excelupload.path");
			request.setCharacterEncoding("utf-8");
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator fileIter = multiRequest.getFileNames();
			
			Enumeration e = multiRequest.getParameterNames();
			while(e.hasMoreElements()) {
				String paramV = (String)e.nextElement();		
				logger.debug("paramName : " + paramV + ", paramValue : " + multiRequest.getParameter(paramV));
			}
			
			while (fileIter.hasNext()) {
				MultipartFile mFile = multiRequest.getFile((String) fileIter.next());
				UUID uuid = UUID.randomUUID();						//저장될 물리적 파일명
				String fileName = mFile.getOriginalFilename();		//원본파일명
				int j = -1;
				String fileExt = "";
				String tmpName = "";
				if ( (j = fileName.indexOf(".")) != -1 ) {			//파일확장자
					fileExt = fileName.substring(j);
				}
				tmpName = uuid.toString() + fileExt;				//저장될 파일명 + 확장자
				
				if (mFile.getSize() > 0) {
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
					
					File excelfile = new File(contextRealPath + strUploadPath + "/" + tmpName);
					POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(contextRealPath + strUploadPath + "/" + tmpName));                 
			       	
					HSSFWorkbook workbook = new HSSFWorkbook(fs);
			       	int sheetNum = workbook.getNumberOfSheets();
			       	HSSFSheet sheet = workbook.getSheetAt(0);
			       	int rows = sheet.getPhysicalNumberOfRows();
			       	
			       	
			       	for (int i = 0; i < rows; i++) { 	
			       		HSSFRow iRow = sheet.getRow(i);
			       		if (iRow != null){
			       			int cells = iRow.getPhysicalNumberOfCells();
			       			for(int k = 0; k<cells; k++) {
			       				HSSFCell cell  = iRow.getCell((short)k);
			       				if(cell != null) {
			       					excelStr.append(cell.toString() + (k ==cells - 1 ?  "" : "|"));
			       				}
			       			}
			       		}
			       		excelStr.append(";");
			       	}
			       	
					DataSetMap dsm = new DataSetMap();
					Map paramMap = new HashMap();
					paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
					paramMap.put("dvsn", 		"I");
					paramMap.put("rqstDay",  	rqstDay);					//요청일
					paramMap.put("fileTp",  	fileTp);					//파일송수신구분
					paramMap.put("fileNm", 		fileNm);					//파일명	
					paramMap.put("fileData", 	excelStr.toString());		//파일데이터  
					paramMap.put("regId", 		loginInfo.get("userId"));	

					dsm.add(paramMap);
					inVar.put("inDsMap",  dsm);
					inVar.put("regId", loginInfo.get("userId"));

					result =  rTRECashReceiptMngService.cashReceiptResultFileUpload(inDataset, inVar);
					li = (List)result.get("vcursor");
					success = Integer.parseInt((result.get("successCode") + ""));
					
					int row = ds.newRow();
					ds.set(row, "fileid", 		tmpName);
					ds.set(row, "filename", 	fileName);
					ds.set(row, "filesize", 	mFile.getSize());
					ds.set(row, "savepath",     strUploadPath);
					ds.set(row, NexacroConstant.ERROR_CODE, result.get("successCode"));
					ds.set(row, NexacroConstant.ERROR_MSG, result.get("returnMessage"));
				}
			}
			resData.addDataSet(ds);
			resVarList.add(NexacroConstant.ERROR_CODE, result.get("successCode"));
			resVarList.add(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
			HttpPlatformResponse res = new HttpPlatformResponse(response);
			res.setData(resData);
			res.sendData();
		} catch (Exception e) {
			e.printStackTrace();
			resVarList.add(NexacroConstant.ERROR_CODE, "-1");
			resVarList.add(NexacroConstant.ERROR_MSG,  e.toString());		
		}
		
	}	
	
	@RequestMapping("/ntrms/re/getCashReceiptList.do") 
	public ModelAndView getCashReceiptList(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();			
			
			Map result = rTRECashReceiptMngService.getCashReceiptList(inVar, outDataset);
			List li= (List)result.get("listCashReceipt");
			Map map	= (Map)result.get("msgMap");
			
			outVal.put("returnMsg", map.get("returnMessage"));
			outVal.put("returnCode", (BigDecimal) map.get("successCode"));
			DataSetMap accDsMap = new DataSetMap();
			accDsMap.setRowMaps(li);
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
	
	@RequestMapping("/ntrms/re/cashReceiptsRegister.do") 
	public ModelAndView cashReceiptsRegister(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = null;
		try{
			Map loginInfo = (Map) req.getSession().getAttribute("User");	
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTRECashReceiptMngService.cashReceiptsRegister(inVar, outDataset);
			
			logger.debug("[Start]RTRECashReceiptMngController==================================");
			logger.debug("작업구분(C:발행,D:취소) 		: "+(String)result.get("jobGb"));			
			logger.debug("수납거래번호 					: "+result.get("recvSeq")+"");			
			logger.debug("등록자 ID 					: "+(String)result.get("regId"));		
			logger.debug("현금영수증 발행 일련번호 		: "+result.get("cashSeq")+"");				
			logger.debug("현금영수증 이력번호 			: "+result.get("cashIseq")+"");				
			logger.debug("주문구분번호 					: "+(String)result.get("ordrIdxx"));		
			logger.debug("상품명 						: "+(String)result.get("goodNm"));	
			logger.debug("주문자명 						: "+(String)result.get("buyrNm"));	
			logger.debug("주문자 전화번호 				: "+(String)result.get("buyrTel"));			
			logger.debug("요청 종류 					: "+(String)result.get("reqTx"));		
			logger.debug("사업장 구분 					: "+(String)result.get("coType"));		
			logger.debug("과세/면세 구분 				: "+(String)result.get("CtaxType"));		
			logger.debug("발행 사업자번호 				: "+(String)result.get("ctaxNo"));			
			logger.debug("상호			 				: "+(String)result.get("coNm"));			
			logger.debug("대표자명						: "+(String)result.get("cownerNm"));	
			logger.debug("사업장 주소 					: "+(String)result.get("coAdd"));	
			logger.debug("사업장 대표 연락처 			: "+(String)result.get("coTel"));		
			logger.debug("원 거래시각 					: "+(String)result.get("tradTm"));			
			logger.debug("발행용도 						: "+(String)result.get("trCode"));		
			logger.debug("신분확인 ID					: "+(String)result.get("idInfo"));	
			logger.debug("거래금액 총 합				: "+(String)result.get("amtTot"));		
			logger.debug("공급가액 						: "+(String)result.get("amtSup"));			
			logger.debug("봉사료 						: "+(String)result.get("amtSvc"));	
			logger.debug("부가가치세					: "+(String)result.get("amtTax"));	
			logger.debug("변경 타입 					: "+(String)result.get("modType"));			
			logger.debug("변경요청 거래번호 구분 		: "+(String)result.get("modGb"));		
			logger.debug("변경요청 거래번호 			: "+(String)result.get("modVal"));			
			logger.debug("변경요청 금액					: "+(String)result.get("modMny"));			
			logger.debug("변경처리 이전 금액 			: "+(String)result.get("remMny"));			
			logger.debug("successCode 					: "+result.get("successCode")+"");			
			logger.debug("returnMessage 				: "+(String)result.get("returnMessage"));
			logger.debug("errorText 					: "+(String)result.get("errorText"));
		    logger.debug("[END]RTRECashReceiptMngController==================================");
		    
			int inertFlag = Integer.parseInt((result.get("successCode") + ""));
			result.put("regId", loginInfo.get("userId"));
			if( inertFlag == 0 ){
				mav = new ModelAndView("interface/cash/cash/pp_cli_hub");
			}else{
				mav = new ModelAndView("nexacroMapView");
			}
			
			mav.addObject("result", result);
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/ntrms/re/cashReceiptsRegisterOut.do") 
	public ModelAndView cashReceiptsRegisterOut(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");;
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTRECashReceiptMngService.cashReceiptsRegisterOut(inDataset, inVar);

			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
}

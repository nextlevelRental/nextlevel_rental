package egovframework.ntrms.kr.co.brn.re.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.servlet.ModelAndView;

import com.nexacro.xapi.data.ColumnHeader;
import com.nexacro.xapi.data.DataSet;
import com.nexacro.xapi.data.DataTypes;
import com.nexacro.xapi.data.PlatformData;
import com.nexacro.xapi.data.VariableList;
import com.nexacro.xapi.tx.HttpPlatformResponse;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.re.service.RTREKCPDirectHisCheckService;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class RTREKCPDirectHisCheckController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTREKCPDirectHisCheckService")
	RTREKCPDirectHisCheckService rTREKCPDirectHisCheckService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name="commonService")
	CommonService commonService;
	
	
	
	
	@RequestMapping("/rtms/re/checkSetRtre0044.do") 
	public ModelAndView selectCheckSet(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map result = rTREKCPDirectHisCheckService.selectCheckSet(inVar, outDataset);
			List selectCheckSet = (List)result.get("selectCheckSet");
			DataSetMap selectCheckSetMap = new DataSetMap();
			selectCheckSetMap.setRowMaps(selectCheckSet);
			outDataset.put("selectCheckSetMap", selectCheckSetMap);
			
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
	
	
	
	@RequestMapping("/rtms/re/initRTREKCPDirectHisCheck.do") 
	public ModelAndView initRTREKCPDirectHisCheck(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "R050");
			inVar.put("useYn", "Y");
			Map dsDupGb = commonService.listCommInfo(inVar);
			List listDsDupGb = (List)dsDupGb.get("result");	
			DataSetMap mapDsDupGb = new DataSetMap();
			mapDsDupGb.setRowMaps(listDsDupGb);
			outDataset.put("mapDsDupGb", mapDsDupGb);
			
			inVar.put("cdGrpCd", "R019");
			inVar.put("useYn", "Y");
			Map dsPayDivision = commonService.listCommInfo(inVar);
			List listDsPayDivision = (List)dsPayDivision.get("result");	
			DataSetMap mapDsPayDivision = new DataSetMap();
			mapDsPayDivision.setRowMaps(listDsPayDivision);
			outDataset.put("mapDsPayDivision", mapDsPayDivision);
			
			inVar.put("cdGrpCd", "R049");
			inVar.put("useYn", "Y");
			Map dsCheckYn = commonService.listCommInfo(inVar);
			List listDsCheckYn = (List)dsCheckYn.get("result");	
			DataSetMap mapDsCheckYn = new DataSetMap();
			mapDsCheckYn.setRowMaps(listDsCheckYn);
			outDataset.put("mapDsCheckYn", mapDsCheckYn);
			
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
	
	
	
	@RequestMapping(value = "ntrms/re/kcpDirectUploadFile.do")
	public void kcpDirectUploadFile(NexacroMapDTO xpDto, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		DataSetMap tranInfo = xpDto.getTranInfoMap();
		Map <String, Object> inVar = xpDto.getInVariableMap();
		Map <String, Object> inVarUpdate = xpDto.getInVariableMap();
		Map <String, DataSetMap> inDataset = xpDto.getInDataSetMap();
		Map <String, Object> outVar = xpDto.getOutVariableMap();
		Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
		PlatformData resData = new PlatformData();
		VariableList resVarList = resData.getVariableList();
		DataSet ds = new DataSet("ds_output");
		Map result = null;
		Map resultUpdateRtre0044Check = null;
		List tmpNameList = new ArrayList();
		
		ds.addColumn(new ColumnHeader(NexacroConstant.ERROR_CODE, 	DataTypes.STRING));
		ds.addColumn(new ColumnHeader(NexacroConstant.ERROR_MSG, 	DataTypes.STRING));
		
		request.setCharacterEncoding("utf-8");
		
		Map loginInfo = (Map) request.getSession().getAttribute("User");	
		String checkDay = request.getParameter("checkDay");	//체크일자
		String checkSet = request.getParameter("checkSet");	//체크회차
		String dupGb = request.getParameter("dupGb");		//거래번호 중복건 처리 방법
		String recpPay = request.getParameter("recpPay");	//결제방법
		
		try{
			String contextRealPath = request.getSession().getServletContext().getRealPath("/");
			String strUploadPath = propertiesService.getString("global.excelKcpUpload.path");
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator fileIter = multiRequest.getFileNames();
			Enumeration e = multiRequest.getParameterNames();
			
			while( e.hasMoreElements() ){
				String paramV = (String)e.nextElement();
			}
			
			while( fileIter.hasNext() ){
				MultipartFile mFile = multiRequest.getFile((String) fileIter.next());
				UUID uuid = UUID.randomUUID();		  //저장될 물리적 파일명
				String fileName = mFile.getOriginalFilename();//원본파일명
				
				int j = -1;
				String fileExt = "";
				String tmpName = "";
				
				if( (j = fileName.indexOf(".")) != -1 ){//파일확장자
					fileExt = fileName.substring(j);
				}
				tmpName = uuid.toString() + fileExt;	//저장될 파일명 + 확장자
				tmpNameList.add(tmpName);
				
				if (mFile.getSize() > 0) {
					InputStream stream 	= null;
					OutputStream bos = null;
					stream = mFile.getInputStream();
					File cFile = new File(contextRealPath + strUploadPath);
					if (!cFile.isDirectory()){
						cFile.mkdir();
					}
					bos = new FileOutputStream(contextRealPath + strUploadPath + "/" + tmpName);
					int bytesRead = 0;
					byte[] buffer = new byte[1024 * 1024];

					while ((bytesRead = stream.read(buffer, 0, 	 1024 * 1024)) != -1) {
						bos.write(buffer, 0, bytesRead);
					}
				}
			}
			
			DataSetMap dsm = new DataSetMap();
			List<Map> listData = new ArrayList();
			
			for( int i = 0 ; i < tmpNameList.size() ; i++){
				POIFSFileSystem fs 		= new POIFSFileSystem(new FileInputStream(contextRealPath + strUploadPath + "/" + tmpNameList.get(i)));
				HSSFWorkbook workbook 	= new HSSFWorkbook(fs);
		       	HSSFSheet sheet 		= workbook.getSheetAt(0);
		       	int rows 				= sheet.getPhysicalNumberOfRows();
		       	int lastRow 			= rows - 1;
		       	for( int r = 1 ; r < rows ; r++ ){										 //첫번째 행은 패스 -> r=1 부터시작
		       		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		       		HSSFRow row = sheet.getRow(r);
		       		if( (row != null) && (r != lastRow) ){
		       			for( short c = 0; c < 33; c++ ){								 //계좌승인 셀 갯수 -> 33개
		       				HSSFCell cell = row.getCell(c);
		       				if(cell != null){
		       					if( c == 3 ){	paramMap.put("appDay",format(cell));	}//승인일자
		       					if( c == 4 ){	paramMap.put("ordNo",format(cell));		}//주문번호
		       					if( c == 5 ){	paramMap.put("custNm",format(cell));	}//주문자
		       					if( c == 8 ){	paramMap.put("cardcomNm",format(cell));	}//카드종류
		       					if( c == 14 ){	paramMap.put("appAmt",format(cell));	}//거래금액
		       					if( c == 22 ){	paramMap.put("tno",format(cell));		}//거래번호
		       					if( c == 24 ){	paramMap.put("appDesc",format(cell));	}//거래구분
		       					//if( c == 24 ){	paramMap.put("cncAmt",format(cell));	}//취소금액
		       					if( c == 26 ){	paramMap.put("cncpAmt",format(cell));	}//취소가능금액
		       					if( c == 29 ){	paramMap.put("cncDay",format(cell));	}//취소일자
		       					if( c == 30 ){	paramMap.put("pcncDay",format(cell));	}//부분취소일자
		       				}
		       			}
		       			paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  DataSet.ROW_TYPE_INSERTED);
			       		paramMap.put("dvsn","I");
			       		paramMap.put("checkDay",checkDay);
			       		paramMap.put("checkSet",checkSet);
			       		paramMap.put("dupGb",dupGb);
			       		paramMap.put("recpPay",recpPay);
			       		listData.add(paramMap);
		       		}
		       	}
			}
			dsm.setRowMaps(listData);
			inVar.put("inDsMap", dsm);
			inVar.put("regId", loginInfo.get("userId"));
			result = rTREKCPDirectHisCheckService.kcpDirectUploadFile(inDataset, inVar);
			
			int successCode = Integer.parseInt((result.get("successCode") + ""));
			if( successCode == 0 ){
				DataSetMap dsmUpdate = new DataSetMap();
				Map paramMap = new HashMap();
				paramMap.put(NexacroConstant.DATASET_ROW_TYPE,  1);
				paramMap.put("checkDay", checkDay);
				paramMap.put("checkSet", checkSet);
				paramMap.put("jobGb", "N");
				dsmUpdate.add(paramMap);
				inVarUpdate.put("inDsMap", dsmUpdate);
				inVarUpdate.put("regId", loginInfo.get("userId"));
				resultUpdateRtre0044Check = rTREKCPDirectHisCheckService.resultUpdateRtre0044Check(inDataset, inVarUpdate);
				
				resVarList.add(NexacroConstant.ERROR_CODE, resultUpdateRtre0044Check.get("successCode"));
				resVarList.add(NexacroConstant.ERROR_MSG, resultUpdateRtre0044Check.get("returnMessage"));
			}else{
				resVarList.add(NexacroConstant.ERROR_CODE, 0+"");
				resVarList.add(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));		
			}
			
			HttpPlatformResponse res = new HttpPlatformResponse(response);
			res.setData(resData);
			res.sendData();
		} catch (Exception e) {
			e.printStackTrace();
			resVarList.add(NexacroConstant.ERROR_CODE, "-1");
			resVarList.add(NexacroConstant.ERROR_MSG,  e.toString());
		}
	}
	
	public String format(HSSFCell cell){
		String returnValue = null;
		switch(cell.getCellType()){       //셀의 type에 대해 체크하고 type을 설정해준다.
			case HSSFCell.CELL_TYPE_FORMULA: 	returnValue = ""+cell.getCellFormula();	 			break;
			case HSSFCell.CELL_TYPE_NUMERIC: 	returnValue = ""+(int)cell.getNumericCellValue();	break;
			case HSSFCell.CELL_TYPE_STRING: 	returnValue = ""+cell.getStringCellValue(); 		break;
			case HSSFCell.CELL_TYPE_BLANK: 		returnValue = ""; 									break;
			case HSSFCell.CELL_TYPE_BOOLEAN: 	returnValue = ""+cell.getBooleanCellValue(); 		break;
			case HSSFCell.CELL_TYPE_ERROR: 		returnValue = ""+cell.getErrorCellValue(); 			break;
			default: returnValue = "";
		}
		return returnValue;
	}
	
	@RequestMapping("rtms/re/saveVerRtre0044.do") 
	public ModelAndView saveVerRtre0044(NexacroMapDTO xpDto, Model model, HttpServletRequest req) throws Exception {
		Map loginInfo = (Map) req.getSession().getAttribute("User");
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result =  rTREKCPDirectHisCheckService.saveVerProcess(inDataset, inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode")+"");
			mav.addObject(NexacroConstant.ERROR_MSG,  result.get("returnMessage"));		
		
		}catch( Exception e ){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/rtms/re/selectSRtre0044.do") 
	public ModelAndView selectSRtre0044(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map result = rTREKCPDirectHisCheckService.selectSRtre0044(inVar, outDataset);
			List selectSRtre0044 = (List)result.get("selectSRtre0044");
			DataSetMap selectSRtre0044Map = new DataSetMap();
			selectSRtre0044Map.setRowMaps(selectSRtre0044);
			outDataset.put("selectSRtre0044Map", selectSRtre0044Map);
			
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
}
package egovframework.ntrms.kr.co.brn.cs.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.StringWriter;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tobesoft.xplatform.data.ColumnHeader;
import com.tobesoft.xplatform.data.DataSet;
import com.tobesoft.xplatform.data.DataTypes;
import com.tobesoft.xplatform.data.PlatformData;
import com.tobesoft.xplatform.data.VariableList;
import com.tobesoft.xplatform.tx.HttpPlatformResponse;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.brn.cs.service.RTCSSafeSerService;
import egovframework.ntrms.kr.co.comm.util.ZipFileUtil;
import egovframework.ntrms.kr.co.exec.handler.controller.ControllerBase;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.cmmn.utils.StringUtil;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class RTCSSafeSerController extends ControllerBase {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="rTCSSafeSerService")
	RTCSSafeSerService rTCSSafeSerService;
	
	@Resource(name="commonService")
	CommonService commonService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@RequestMapping("/rtms/cs/intiRTCSSafeSerivce.do") 
	public ModelAndView intiRTCSEngineOilRepSer(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("cdGrpCd", "S044");
			inVar.put("useYn", "Y");
			Map dsS044 = commonService.listCommInfo(inVar);
			List listDsS044 = (List)dsS044.get("result");
			DataSetMap mapDsS044 = new DataSetMap();
			mapDsS044.setRowMaps(listDsS044);
			outDataset.put("mapDsS044",  mapDsS044);
			
			inVar.put("cdGrpCd", "S305");
			inVar.put("useYn", "Y");
			Map dsS305 = commonService.listCommInfo(inVar);
			List listDsS305 = (List)dsS305.get("result");
			DataSetMap mapDsS305 = new DataSetMap();
			mapDsS305.setRowMaps(listDsS305);
			outDataset.put("mapDsS305",  mapDsS305);
			
			inVar.put("cdGrpCd", "S030");
			inVar.put("useYn", "Y");
			Map dsS030 = commonService.listCommInfo(inVar);
			List listDsS030 = (List)dsS030.get("result");
			DataSetMap mapDsS030 = new DataSetMap();
			mapDsS030.setRowMaps(listDsS030);
			outDataset.put("mapDsS030",  mapDsS030);
			
			inVar.put("cdGrpCd", "C035");
			inVar.put("useYn", "Y");
			Map dsC035 = commonService.listCommInfo(inVar);
			List listDsC035 = (List)dsC035.get("result");
			DataSetMap mapDsC035 = new DataSetMap();
			mapDsC035.setRowMaps(listDsC035);
			outDataset.put("mapDsC035",  mapDsC035);
			
			inVar.put("cdGrpCd", "C036");
			inVar.put("useYn", "Y");
			Map dsC036 = commonService.listCommInfo(inVar);
			List listDsC036 = (List)dsC036.get("result");
			DataSetMap mapDsC036 = new DataSetMap();
			mapDsC036.setRowMaps(listDsC036);
			outDataset.put("mapDsC036",  mapDsC036);
			
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
	
	@RequestMapping("rtms/cs/selectRTCSSafeServiceApply.do") 
	public ModelAndView selectRTCSSafeServiceApply(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTCSSafeSerService.selectRTCSSafeServiceApply(inVar, outDataset);
			List applyList = (List)result.get("safeServiceApplyList");
			DataSetMap mapDsList = new DataSetMap();
			mapDsList.setRowMaps(applyList);
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
	
	@RequestMapping("rtms/cs/selectRTCSSafeImgList.do") 
	public ModelAndView selectRTCSSafeImgList(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTCSSafeSerService.selectRTCSSafeImgList(inVar, outDataset);
			List imgList = (List)result.get("safeServiceImgList");
			DataSetMap mapDsList = new DataSetMap();
			mapDsList.setRowMaps(imgList);
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
	
	@RequestMapping("/ntrms/cs/safeServiceFileDown.do")
	public ModelAndView safeServiceFileDown(NexacroMapDTO xpDto, HttpServletRequest req) {
		ModelAndView model = null;
		Map fileMap = null;
		try {
			Map loginInfo = (Map) req.getSession().getAttribute("User");
			if( !loginInfo.get("userId").equals(null) ){
				DataSetMap 					tranInfo 	= xpDto.getTranInfoMap();
				Map <String, Object> 		inVar 		= xpDto.getInVariableMap();
				Map <String, DataSetMap> 	inDataset 	= xpDto.getInDataSetMap();
				Map <String, Object> 		outVar 		= xpDto.getOutVariableMap();
				Map <String, DataSetMap> 	outDataset  = xpDto.getOutDataSetMap();
				
				String ordNo 	= req.getParameter("ordNo");
				String dlvrType 	= req.getParameter("dlvrType");
				String servCd 	= req.getParameter("servCd");
				String servSeq 	= req.getParameter("servSeq");
				
				inVar.put("ordNo", 		ordNo);
				inVar.put("dlvrType", 	dlvrType);
				inVar.put("servCd", 		servCd);
				inVar.put("servSeq", 	servSeq);
				
				Map result = rTCSSafeSerService.selectRTCSSafeImgList(inVar, outDataset);
				List imgList = (List)result.get("safeServiceImgList");
				
				String[] datas = new String[imgList.size()];
				Map data = null;
				try{
					for(int i =0; i<imgList.size(); i++){
						data = (Map)imgList.get(i);
						datas[i] = data.get("filePath").toString() + "\\" + data.get("fileName").toString();
					}
					
					ZipFileUtil zip = new ZipFileUtil();
					zip.createZipFile(datas, "output.zip", "C:\\temp\\");
					
					File file = new File("C:\\temp\\output.zip");
					
					fileMap = new HashMap<String, Object>();
					fileMap.put("file_data", file);
					fileMap.put("file_ori_nm", "output.zip");
					fileMap.put("deleteYn", "N");
					
					model = new ModelAndView("file", "downloadFile", fileMap);
					
				}catch(Exception e){
					e.printStackTrace();
					logger.error("**********서식조회 오류_2**********");
					model = new ModelAndView("error/error");
					Map errMap = new HashMap();
					errMap.put("retMsg", "파일을 읽는중 오류가 발생되었습니다.");
					errMap.put("retCd", -1);
					model.addObject("result", errMap);
				}
			}else{
				logger.error("**********서식조회 오류_3**********");
				model = new ModelAndView("error/error");
				Map errMap = new HashMap();
				errMap.put("retMsg", "사용자 정보가 없습니다.");
				errMap.put("retCd", -1);
			}
		}catch(Exception e){
			e.printStackTrace();
			logger.error("**********서식조회 오류_4**********");
			model = new ModelAndView("error/error");
			Map errMap = new HashMap();
			errMap.put("retMsg", "서식조회 오류가 발생되었습니다..");
			errMap.put("retCd", -1);
			model.addObject("result", errMap);
		}
		return model;
	}
	
	@RequestMapping("/rtms/cs/saveRTCSSafeApply.do") 
	public ModelAndView saveRTCSSafeApply(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
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
			Map result = rTCSSafeSerService.saveRTCSSafeApply(inDataset, inVar);
			
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
	
	@RequestMapping("/rtms/cs/resetRTCSSafeOne.do") 
	public ModelAndView resetRTCSSafeOne(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			DataSetMap tranInfo 				= xpDto.getTranInfoMap();
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTCSSafeSerService.resetRTCSSafeOne(inDataset, inVar);
			
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
	
	@RequestMapping("rtms/cs/selectRTCSSafeServiceRegister.do") 
	public ModelAndView selectRTCSSafeServiceRegister(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTCSSafeSerService.selectRTCSSafeServiceRegister(inVar, outDataset);
			List applyList = (List)result.get("safeServiceRegisterList");
			DataSetMap mapDsList = new DataSetMap();
			mapDsList.setRowMaps(applyList);
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
	
	@RequestMapping("/rtms/cs/saveRTCSSafeRegister.do") 
	public ModelAndView saveRTCSSafeRegister(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
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
			Map result = rTCSSafeSerService.saveRTCSSafeRegister(inDataset, inVar);
			
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
	
	@RequestMapping(value = "/ntrms/cs/safeServiceFileUpload.do")
	public void uploadTest(NexacroMapDTO xpDto, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		PlatformData resData = new PlatformData();
		VariableList resVarList = resData.getVariableList();
		
		DataSet ds = new DataSet("ds_output");

		ds.addColumn(new ColumnHeader("FILE_ID", 				DataTypes.STRING));
		ds.addColumn(new ColumnHeader("FILE_NAME", 		DataTypes.STRING));
		ds.addColumn(new ColumnHeader("FILE_SIZE", 			DataTypes.INT));
		ds.addColumn(new ColumnHeader("FILE_SAVENM", 	DataTypes.STRING));
		InputStream is = null;
		
		try {
			String ordNo 	= request.getParameter("ordNo");
			String dlvrType = request.getParameter("dlvrType");
			String servCd 	= request.getParameter("servCd");
			String dlvrSeq 	= request.getParameter("dlvrSeq");
			
			String toDay = sdf.format(cal.getTime());
			String contextRealPath = request.getSession().getServletContext().getRealPath("/");
			String strUploadPath = "D:\\TEMP\\" + toDay;
			System.out.println("================================================================");
			
			// 한글 파일명 처리를 위한 설정
			request.setCharacterEncoding("utf-8");
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator fileIter = multiRequest.getFileNames();
			//List<MultipartFile> list = multiRequest.getFiles("upfile0");
			
			// 파라미터 정보 수집
			Enumeration e = multiRequest.getParameterNames();
			System.out.println("================================================================");
			while(e.hasMoreElements()) {
				String paramV = (String)e.nextElement();		
				System.out.println("paramName : " + paramV + ", paramValue : " + multiRequest.getParameter(paramV));
			}
			System.out.println("================================================================");
			
			StringBuilder sb = null;		
			int idx = 0;
			//for(int i=0; i<list.size(); i++) {
			while(fileIter.hasNext()){
				
				idx++;
				
				sb = new StringBuilder();
				sb.append(ordNo);
				sb.append("_");
				sb.append(dlvrType);
				sb.append("_");
				sb.append(servCd);
				sb.append("_");
				sb.append(dlvrSeq);
				sb.append("_");
				sb.append(idx);
				
				//MultipartFile mFile = list.get(i);
				MultipartFile mFile = multiRequest.getFile((String)fileIter.next());

				System.out.println("============================[ File Name ]===============================");
				System.out.println(mFile.getName() + ":" + mFile.getOriginalFilename());
				System.out.println("====================================================================");
				
				UUID uuid = UUID.randomUUID();					//저장될 물리적 파일명
				String fileName = mFile.getOriginalFilename();		//원본파일명
				int j = -1;
				String fileExt = "";
				String tmpName = "";
				if ((j = fileName.indexOf(".")) != -1) {					//파일확장자
					fileExt = fileName.substring(j);
				}
				tmpName = uuid + fileExt;					//저장될 파일명 + 확장자
				
				logger.debug("####################################");
				logger.debug("FileNames : " + mFile.getName());
				logger.debug("####################################");

				//파일내용을 읽은후 처리한다.
				StringWriter writer = new StringWriter();
				IOUtils.copy(mFile.getInputStream(), writer, "euc-kr");
				String theString = writer.toString();
				
//				System.out.println("====================================================");
//				System.out.println(theString);
//				System.out.println("====================================================");
				
				if (mFile.getSize() > 0) {
					InputStream stream = null;
					OutputStream bos = null;
					stream = mFile.getInputStream();
					File cFile = new File(strUploadPath);
					if (!cFile.isDirectory()) cFile.mkdir();
					bos = new FileOutputStream(strUploadPath + "/" + tmpName);

					int bytesRead = 0;
					byte[] buffer = new byte[1024 * 1024];

					while ((bytesRead = stream.read(buffer, 0, 	 1024 * 1024)) != -1) {
						bos.write(buffer, 0, bytesRead);
					}
					
					stream.close();
					bos.close();
					
					int row = ds.newRow();
					ds.set(row, "FILE_ID", 			tmpName);
					ds.set(row, "FILE_NAME", 		fileName);
					ds.set(row, "FILE_SIZE", 		mFile.getSize());
					ds.set(row, "FILE_SAVENM", 	strUploadPath);
				}
			}
			resData.addDataSet(ds);
			logger.debug(resData.saveXml());
			resVarList.add("ErrorCode", 200);
			resVarList.add("ErrorMsg", "업로드완료되었습니다.");
			
			HttpPlatformResponse res = new HttpPlatformResponse(response);
			res.setData(resData);
			res.sendData();
			
		} catch (Exception e) {
			resVarList.add("ErrorCode", 500);
			resVarList.add("ErrorMsg", e);
		}
	}
	
	/**
	 * 마모파손보증 서비스 내역 조회(공통코드)
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ntrms/cs/getSafeServiceCommCode.do") 
	public ModelAndView getSafeServiceCommCode(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			Map map = new HashMap();
			map.put("cd", " ");
			map.put("cdNm","전체");
			
			inVar.put("cdGrpCd", "C035");
			inVar.put("useYn", "Y");
			
			Map mapC035 = commonService.listCommInfo(inVar);
			List listC035 = (List)mapC035.get("result");
			listC035.add(0, map);
			DataSetMap dsC035Maps = new DataSetMap();
			dsC035Maps.setRowMaps(listC035);
			outDataset.put("outputC035",	dsC035Maps);	
			
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
	
	@RequestMapping("/ntrms/cs/selectRTCSSafeServiceList.do") 
	public ModelAndView selectRTCSSafeServiceList(NexacroMapDTO xpDto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map loginInfo = (Map)req.getSession().getAttribute("User");
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			inVar.put("regId", loginInfo.get("userId"));
			Map result = rTCSSafeSerService.selectRTCSSafeServiceList(inVar, outDataset);
			List serviceList = (List)result.get("safeServiceList");
			DataSetMap mapDsList = new DataSetMap();
			mapDsList.setRowMaps(serviceList);
			outDataset.put("output", mapDsList);
			
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
	
	@RequestMapping("/ntrms/cs/getJoinRate.do") 
	public ModelAndView getJoinRate(NexacroMapDTO xpDto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			Map <String, Object> outVal			= xpDto.getOutVariableMap();
			
			String joinRate = (String)rTCSSafeSerService.getJoinRate(inVar);
			outVal.put("joinRate", joinRate);
			
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
	
	@RequestMapping("/ntrms/cs/moveToLocalFile.do")
	public ModelAndView moveToLocalFile(NexacroMapDTO xpDto, Model model, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("nexacroMapView");
		try{
			Map loginInfo = (Map)request.getSession().getAttribute("User");
			Map<String, Object> inVar = xpDto.getInVariableMap();
			Map <String, DataSetMap> 	outDataset  = xpDto.getOutDataSetMap();
			
			ServletContext servletContext = request.getSession().getServletContext();
			String targetPath = "D:\\NTRMS\\ATTATCH\\TEMP" + File.separator + loginInfo.get("userId");	// 변경주의
			
			Map result = rTCSSafeSerService.selectRTCSSafeImgList(inVar, outDataset);
			List imgList = (List)result.get("safeServiceImgList");
			
			//이미지 was내 폴더로 이동
			rTCSSafeSerService.moveToLocalFile(imgList, targetPath);
			
			mav.addObject(NexacroConstant.ERROR_CODE, "0");
			mav.addObject(NexacroConstant.ERROR_MSG, "");
			
		}catch(Exception e){
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/getWarrantyImage.do")
	public void getWarrantyImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String fileName = StringUtil.nvl(request.getParameter("fileName"));
		String userId = StringUtil.nvl(request.getParameter("userId"));
		
		// 20241211 정보보호조치
		if (fileName.contains("..")) {
			// throw new IOException("##########경로 역추적 방지##########");
			logger.debug("##########경로 역추적 방지##########");
			return;
		}
		
        StringBuilder sb = new StringBuilder("file:///D:/NTRMS/ATTATCH/TEMP/" + userId + "/");
        sb.append(fileName);
        // 파일 이름을 더해
        
        URL fileUrl = new URL(sb.toString());
        // file URL을 생성하고 
        
        IOUtils.copy(fileUrl.openStream(), response.getOutputStream());
        // IOUtils.copy는 input에서 output으로 encoding 맞춰서 복사하는 메소드다
        // openStream으로 fileUrl의 통로( 입력 스트림 )를 열고 response의 outputStream에 복사하면 끝
	}
}


/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMUserController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.comm.controller;

import java.io.File;
import java.net.URLDecoder;
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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.brn.comm.service.CommonService;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.nexacro.xapi.data.ColumnHeader;
import com.nexacro.xapi.data.DataSet;
import com.nexacro.xapi.data.DataTypes;
import com.nexacro.xapi.data.PlatformData;
import com.nexacro.xapi.data.VariableList;
import com.nexacro.xapi.tx.HttpPlatformResponse;

@Controller
public class CommonController {
	
	protected Log logger = LogFactory.getLog(this.getClass());	

	@Resource(name="commonService")
	CommonService commonService;
	
	/*******************************
	 * 지사정보 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/listCommInfo.do") 
	public ModelAndView listCommInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = commonService.listCommInfo(inVar);
			List listComm	= (List)result.get("result");
			
			//사용자정보조회
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(listComm);

			outDataset.put((String)inVar.get("nodeNm"),	userDsMap);
			
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
	
	
	/*******************************
	 * 파일업로드 처리
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/fileUploadController.do") 
	public ModelAndView fileUploadController(NexacroMapDTO xpDto, HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try {
			
			
			PlatformData resData = new PlatformData();
			VariableList resVarList = resData.getVariableList();
			
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			
			System.out.println(isMultipart + "####################################");
			
			String userAgent = request.getHeader("User-Agent");
			boolean isIOS = false;
			userAgent = userAgent.toLowerCase();
			System.out.println("userAgent=" + userAgent);
			if(userAgent.indexOf("macintosh") > -1 || userAgent.indexOf("iphone") > -1 || userAgent.indexOf("ipad") > -1) {
				isIOS = true;
			}
			
			if (isMultipart)  {
				String contextRealPath = request.getSession().getServletContext().getRealPath("/");
				String path = request.getParameter("path");
				String savePath = contextRealPath + path;
				System.out.println("---> savePath:"+savePath);
				
				// Create a factory for disk-based file items
				DiskFileItemFactory factory = new DiskFileItemFactory();
				// Sets the size threshold beyond which files are written directly to disk
				factory.setSizeThreshold(4096);
				// Create a new file upload handler
				ServletFileUpload upload = new ServletFileUpload(factory);
				// Specifies the character encoding to be used when reading the headers of individual part
				upload.setHeaderEncoding("utf-8");
				// Set overall request size constraint
				upload.setSizeMax(50000 * 1024 * 1024); 
				// Sets the maximum allowed size of a single uploaded file
				upload.setFileSizeMax(50000 * 1024 * 1024); 
				
				
				try  {
					File filePath = new File(savePath); 
					if (!filePath.exists()) {
						filePath.mkdirs();
					}
					
					// Sets the directory used to temporarily store files that are larger than the configured size threshold
					factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
					
					// Parse the request
					List items = upload.parseRequest(request);
					
					System.out.println(items.size() + "#####################################");
					
					Iterator iter = items.iterator();
					DataSet ds = new DataSet("ds_output");
					ds.addColumn(new ColumnHeader("fileid", DataTypes.STRING));
					ds.addColumn(new ColumnHeader("fileimg", DataTypes.STRING));
					ds.addColumn(new ColumnHeader("filename", DataTypes.STRING));
					ds.addColumn(new ColumnHeader("filesize", DataTypes.INT));
					ds.addColumn(new ColumnHeader("tranfilesize", DataTypes.INT));
					ds.addColumn(new ColumnHeader("prog", DataTypes.INT));
					
					
					while (iter.hasNext()) {
						FileItem item = (FileItem) iter.next();
						
						if (item.isFormField()) {
							String name = item.getFieldName();
							String encoding = upload.getHeaderEncoding();
		                    String value = item.getString(encoding);

			    			//input dataset 확인
		                    //String value = item.getString();
			    			System.out.println("name:" + name + "   value:" + value);
			    			
			    			if(name == "inputDatasets") {
			    				//TODO
			    				//문자열(xml or ssv)을 Dataset으로 변환 후 업무로직에 사용할 것.
			    				continue;
			    			}
		    			
		    				if (value == null || value.equals("")){
								continue;
		    				} else {
								File f = new File(savePath + File.separator, value);
								
								if (f.exists()) {
									//System.out.println("f==>"+f);
									f.delete();
								}
							}
						} else {
							// filename on the client
							String fieldName = item.getFieldName();
							String fileName = item.getName();
							long fileSize = item.getSize();
							System.out.println(">>>>> fileName:"+fileName + "   fieldName:" + fieldName + "   fileSize:" + fileSize);
							if (fileName == null || fileName.equals("")) {
								continue;
							} else {
								fileName = FilenameUtils.getName(fileName);
								
								//iOS 6.0버그(이미지선택시 image.jpg로만 반환하는 버그대응용. 20150312)
								if(isIOS && fileName.equalsIgnoreCase("image.jpg")){
									Date today = new Date();
									SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HHmmssSSS");
									fileName = "image." +   sdf.format(today)  + ".jpg";
								}
						        
								File uploadedFile = new File(filePath + File.separator, fileName);
								
								item.write(uploadedFile);
								item.delete();
								
								int row = ds.newRow();
								ds.set(row, "fileid", fieldName);
								ds.set(row, "filename", fileName);
								ds.set(row, "filesize", fileSize);
								ds.set(row, "prog", 0);
								
							}
						}
					}
					resData.addDataSet(ds);
					resVarList.add("ErrorCode", 0);
					resVarList.add("ErrorMsg", "SUCC");

				} catch (FileUploadException e)  {
					resVarList.add("ErrorCode", -1);
					resVarList.add("ErrorMsg", e);
					e.printStackTrace();
				} catch (Exception e) {
					resVarList.add("ErrorCode", -1);
					resVarList.add("ErrorMsg", e);
					e.printStackTrace();
				}
				
				
			} else {
				resVarList.add("ErrorCode", -1);
				resVarList.add("ErrorMsg", "Invalid Request");
			}

		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}
	
	/*******************************
	 * 오늘 날짜 가져오기
	 * @param xpDto
	 * @param model
	 * @return mav
	 * @throws Exception
	 */
	@RequestMapping("/rtms/comm/getToday.do") 
	public ModelAndView getToday(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			//DataSetMap tranInfo 				= xpDto.getTranInfoMap();
//			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			//Map <String, DataSetMap> inDataset 	= xpDto.getInDataSetMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
//			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Date today = new Date();
			SimpleDateFormat dateType = new SimpleDateFormat("yyyyMMdd");
			
			outVar.put("toDay", dateType.format(today));
			outVar.put("afterDay", DateUtil.addMonths(dateType.format(today), 2));
			
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
	
	/*******************************
	 * 지사, 지점 코드 가져오기
	 * @param xpDto
	 * @param model
	 * @return mav
	 * @throws Exception
	 */
	@RequestMapping("/rtms/comm/getCodeName.do") 
	public ModelAndView getCodeName(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			
			String codeName = commonService.getCodeName(inVar);
				
			outVar.put("codeName", codeName);
		
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
	
	
	/*******************************
	 * 대리점 코드 가져오기
	 * @param xpDto
	 * @param model
	 * @return mav
	 * @throws Exception
	 */
	@RequestMapping("/rtms/comm/getAgencyName.do") 
	public ModelAndView getAgencyName(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, Object> outVar 		= xpDto.getOutVariableMap();
			
			String agencyName = commonService.getAgencyName(inVar);
				
			outVar.put("agencyName", agencyName);
		
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
	
	/*******************************
	 * 타이어정보 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/listTireInfo.do") 
	public ModelAndView listTireInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = commonService.listTireInfo(inVar);
			
			List listTire	= (List)result.get("result");
			
			//사용자정보조회
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(listTire);

			outDataset.put((String)inVar.get("nodeNm"),	userDsMap);
			
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
	
	/*******************************
	 * 타이어정보 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/listTireDetailInfo.do") 
	public ModelAndView listTireDetailInfo(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = commonService.listTireDetailInfo(inVar);
			
			List listTireDetailInfo	= (List)result.get("result");
			
			//사용자정보조회
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(listTireDetailInfo);
			
			outDataset.put((String)inVar.get("nodeNm"),	userDsMap);
			
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
	
	/***********
	 * 판매상품조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/sellProduct.do") 
	public ModelAndView sellProduct(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
						
			Map result = commonService.listSellProduct(inVar);
			
			List listSellProduct	= (List)result.get("result");
			
			//사용자정보조회
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(listSellProduct);
			
			outDataset.put((String)inVar.get("nodeNm"),	userDsMap);
			
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
	
	/*******************************
	 * 타이어정보 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/sd/listTireDetailInfo2.do") 
	public ModelAndView listTireDetailInfo2(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map result = commonService.listTireDetailInfo2(inVar);
			
			List listTireDetailInfo2	= (List)result.get("result");
			
			//사용자정보조회
			DataSetMap userDsMap = new DataSetMap();
			userDsMap.setRowMaps(listTireDetailInfo2);
			
			outDataset.put((String)inVar.get("nodeNm"),	userDsMap);
			
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
	
	/*******************************
	 * 컨트롤 사용여부 조회
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rtms/cm/listControlAuth.do") 
	public ModelAndView listControlAuth(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			Map<String, Object> result = commonService.listControlAuth(inVar);
			
			List<Map> listControlAuth	= (List<Map>)result.get("result");
			
			//컨트롤 사용여부 조회
			DataSetMap controlAuthDsMap = new DataSetMap();
			controlAuthDsMap.setRowMaps(listControlAuth);
			
			outDataset.put("output",	controlAuthDsMap);
			
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
	
	/*******************************
	 * 쿼리실행
	 * @param xpDto
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/runQuery.do") 
	public ModelAndView runQuery(NexacroMapDTO xpDto, Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView("nexacroMapView");
		
		try
		{
			Map <String, Object> inVar 			= xpDto.getInVariableMap();
			Map <String, DataSetMap> outDataset = xpDto.getOutDataSetMap();
			
			String strQuery = inVar.get("strQuery").toString();
			strQuery = URLDecoder.decode(strQuery);
			strQuery = strQuery.replace("&nbsp;", "");
			inVar.put("strQuery", strQuery);
			
			Map result = commonService.runQuery(inVar);
			
			mav.addObject(NexacroConstant.OUT_VARIABLES_ATT_NAME, 	xpDto.getOutVariableMap());
			mav.addObject(NexacroConstant.OUT_DATASET_ATT_NAME, 	xpDto.getOutDataSetMap());
			
			mav.addObject(NexacroConstant.ERROR_CODE, result.get("successCode").toString());
			mav.addObject(NexacroConstant.ERROR_MSG, result.get("returnMessage"));
			
		} catch ( Exception e ) {
			e.printStackTrace();
			mav.addObject(NexacroConstant.ERROR_CODE, "-1");
			mav.addObject(NexacroConstant.ERROR_MSG, e.toString());
		}
		return mav;
	}	
}

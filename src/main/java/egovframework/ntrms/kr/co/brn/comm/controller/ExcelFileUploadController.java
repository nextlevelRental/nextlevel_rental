/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMUserController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
 *************************************************************************************/

package egovframework.ntrms.kr.co.brn.comm.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.nexacro.xapi.data.ColumnHeader;
import com.nexacro.xapi.data.DataSet;
import com.nexacro.xapi.data.DataTypes;
import com.nexacro.xapi.data.PlatformData;
import com.nexacro.xapi.data.VariableList;
import com.nexacro.xapi.tx.HttpPlatformResponse;

import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;


@Controller
public class ExcelFileUploadController {

	protected Log logger = LogFactory.getLog(this.getClass());

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "multipartResolver")
	CommonsMultipartResolver multipartResolver;


	@RequestMapping(value = "ntrms/comm/excelUploadFileController.do")
	public void uploadFileController(NexacroMapDTO xpDto, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		StringBuffer excelStr = new StringBuffer();
		PlatformData resData = new PlatformData();
		VariableList resVarList = resData.getVariableList();
		
		DataSet ds = new DataSet("ds_output");

		ds.addColumn(new ColumnHeader("fileid", 		DataTypes.STRING));
		ds.addColumn(new ColumnHeader("filename", 		DataTypes.STRING));
		ds.addColumn(new ColumnHeader("filesize", 		DataTypes.INT));
		ds.addColumn(new ColumnHeader("savepath", 		DataTypes.STRING));
		ds.addColumn(new ColumnHeader("excelString", 	DataTypes.STRING));
		int row = 0;
		try {
			
			String contextRealPath = request.getSession().getServletContext().getRealPath("/");
			String strUploadPath = propertiesService.getString("global.excelupload.path");

			// 한글 파일명 처리를 위한 설정
			request.setCharacterEncoding("utf-8");
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator fileIter = multiRequest.getFileNames();

			while (fileIter.hasNext()) {
				
				MultipartFile mFile = multiRequest.getFile((String) fileIter.next());
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
					
					row = ds.newRow();
					ds.set(row, "fileid", 		tmpName);
					ds.set(row, "filename", 	fileName);
					ds.set(row, "filesize", 	mFile.getSize());
					ds.set(row, "savepath", 	strUploadPath);
					
					
					//업로드된 Excel파일을 읽는다.
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

			       					logger.debug("=======================================");
			       					logger.debug(cell.toString());
			       					logger.debug("=======================================");
			       					
			       					excelStr.append(cell.toString() + (k ==cells - 1 ?  "" : "|"));
			       				}
			       			}
			       		}
			       		excelStr.append(";");
			       	}
				}
			}
			logger.debug(excelStr.toString());
			ds.set(row, "excelString", 	excelStr.toString());
			resData.addDataSet(ds);
			logger.debug(resData.saveXml());
			
			resVarList.add("ErrorCode", 200);
			resVarList.add("ErrorMsg", excelStr.toString());
			
			HttpPlatformResponse res = new HttpPlatformResponse(response);
			res.setData(resData);
			res.sendData();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
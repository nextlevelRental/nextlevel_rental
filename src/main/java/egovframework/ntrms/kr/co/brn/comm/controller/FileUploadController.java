/************************************************************************************
 * 1.Program  			: Common DataSet Controller
 * 2.File Name			: RTCMUserController.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
 *************************************************************************************/

package egovframework.ntrms.kr.co.brn.comm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ntrms.kr.co.comm.util.CommonUtil;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
import egovframework.rte.fdl.property.EgovPropertyService;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.io.FilenameUtils;

import com.nexacro.xapi.data.ColumnHeader;
import com.nexacro.xapi.data.DataSet;
import com.nexacro.xapi.data.DataTypes;
import com.nexacro.xapi.data.PlatformData;
import com.nexacro.xapi.data.VariableList;
import com.nexacro.xapi.tx.HttpPlatformRequest;
import com.nexacro.xapi.tx.HttpPlatformResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.*;
import java.text.SimpleDateFormat;

@Controller
public class FileUploadController {

	protected Log logger = LogFactory.getLog(this.getClass());

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "multipartResolver")
	CommonsMultipartResolver multipartResolver;

	@RequestMapping(value = "ntrms/comm/uploadFileController.do")
	public void uploadFileController(NexacroMapDTO xpDto, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		PlatformData resData = new PlatformData();
		DataSet ds = new DataSet("ds_output");

		ds.addColumn(new ColumnHeader("fileid", 			DataTypes.STRING));
		ds.addColumn(new ColumnHeader("filename", 	DataTypes.STRING));
		ds.addColumn(new ColumnHeader("filesize", 		DataTypes.INT));
		ds.addColumn(new ColumnHeader("savepath", 	DataTypes.STRING));
		
		try {
			String contextRealPath = request.getSession().getServletContext().getRealPath("/");
			String strUploadPath = propertiesService.getString("global.fileupload.path");

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
					
					int row = ds.newRow();
					ds.set(row, "fileid", 		tmpName);
					ds.set(row, "filename", 	fileName);
					ds.set(row, "filesize", 	mFile.getSize());
					ds.set(row, "savepath", strUploadPath);
				}
			}
			resData.addDataSet(ds);
			logger.debug(resData.saveXml());
			HttpPlatformResponse res = new HttpPlatformResponse(response);
			res.setData(resData);
			res.sendData();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
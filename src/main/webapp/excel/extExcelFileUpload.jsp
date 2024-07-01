<%/*
			Licensed under the Apache License, Version 2.0 (the "License");
			you may not use this file except in compliance with the License.
			You may obtain a copy of the License at

			   http://www.apache.org/licenses/LICENSE-2.0

			Unless required by applicable law or agreed to in writing, software
			distributed under the License is distributed on an "AS IS" BASIS,
			WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
			See the License for the specific language governing permissions and
			limitations under the License.
			 */%>
 
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!-- Apache Commons : http://commons.apache.org/  --> 
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileUploadException"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.io.FilenameUtils"%>

<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>

<!-- nexacro -->
<%@ page import="com.nexacro.xapi.data.ColumnHeader"%>
<%@ page import="com.nexacro.xapi.data.DataSet"%>
<%@ page import="com.nexacro.xapi.data.DataTypes"%>
<%@ page import="com.nexacro.xapi.data.PlatformData"%>
<%@ page import="com.nexacro.xapi.data.VariableList"%>
<%@ page import="com.nexacro.xapi.tx.PlatformType"%>
<%@ page import="com.nexacro.xapi.tx.HttpPlatformResponse"%>
<%@ page import="com.nexacro.xapi.tx.PlatformException"%>
<%@ page import="com.nexacro.xapi.tx.HttpPlatformRequest"%>

<%-- <%@ page import="tutorial.nexacro.ext.excel.ExcelReader" %> --%>
<%@ page import="egovframework.ntrms.kr.co.ext.excel.ExcelReaderWithSAX" %>
<%-- <%@ page import="tutorial.nexacro.ext.excel.ExcelTest" %>
<%@ page import="tutorial.nexacro.ext.excel.XlsxFileReader" %>
<%@ page import="tutorial.nexacro.ext.excel.TextFileReader" %> --%>

<%
	PlatformData resData = new PlatformData();
	VariableList resVarList = resData.getVariableList();

	//Check that we have a file upload request
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	String excelData = "";
	String reciveDataType = "";
	if (isMultipart) {
		String contextRealPath = request.getSession().getServletContext().getRealPath("/");
		String path = request.getParameter("path");
		String charset = request.getParameter("charset");
		reciveDataType = request.getParameter("reciveDataType");
		String savePath = contextRealPath + path;
		System.out.println("---> reciveDataType=" + reciveDataType + ", savePath:" + savePath);

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

		try {
			File filePath = new File(savePath);
			if (!filePath.exists()) {
				filePath.mkdirs();
			}

			// Sets the directory used to temporarily store files that are larger than the configured size threshold
			factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
			//System.out.println("---> getRepository:"+factory.getRepository());

			// Parse the request
			List items = upload.parseRequest(request);
			Iterator iter = items.iterator();

// 			DataSet ds = new DataSet("ds_output");
// 			ds.addColumn(new ColumnHeader("excelData", DataTypes.STRING));
// 			ds.addColumn(new ColumnHeader("fileid", DataTypes.STRING));
// 			ds.addColumn(new ColumnHeader("fileimg", DataTypes.STRING));
// 			ds.addColumn(new ColumnHeader("filename", DataTypes.STRING));
// 			ds.addColumn(new ColumnHeader("filesize", DataTypes.INT));
// 			ds.addColumn(new ColumnHeader("tranfilesize", DataTypes.INT));
// 			ds.addColumn(new ColumnHeader("prog", DataTypes.INT));

			// Parse the request
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();

				if (item.isFormField()) {
					String name = item.getFieldName();
					String encoding = upload.getHeaderEncoding();
					String value = item.getString(encoding);

					//input dataset 확인
					//String value = item.getString();
					System.out.println("\n @@form field > name:" + name + "   value:" + value);

					if (name == "inputDatasets") {
						//TODO
						//문자열(xml or ssv)을 Dataset으로 변환 후 업무로직에 사용할 것.
						continue;
					}

					if (value == null || value.equals("")) {
						continue;
					} else {
						File f = new File(savePath + File.separator, value);

						if (f.exists()) {
							//System.out.println("f==>"+f);
							f.delete();
						}
					}
				} else // Process a file upload
				{
					// filename on the client
					String fieldName = item.getFieldName();
					String fileName = item.getName();
					long fileSize = item.getSize();
					//System.out.println(">>>>> fileName:"+fileName + "   fieldName:" + fieldName + "   fileSize:" + fileSize);

					if (fileName == null || fileName.equals("")) {
						continue;
					} else {
						fileName = FilenameUtils.getName(fileName);
						String fileExtension = FilenameUtils.getExtension(fileName);
						System.out.println("\n @@ file upload > --->fileName:" + fileName + ",fileExtension=" + fileExtension);

						//File uploadedFile = new File(filePath + File.separator + fileName);
						File uploadedFile = new File(filePath + File.separator, fileName);
						//System.out.println(uploadedFile.getAbsolutePath());

						item.write(uploadedFile);

						//excel
						if (fileExtension.equalsIgnoreCase("xlsx")) {
							//ExcelReader reader = new ExcelReader(uploadedFile);

							//XSSF and SAX
							//ExcelReaderWithSAX readerX = new ExcelReaderWithSAX(filePath + File.separator + fileName);
							//XlsxFileReader readerX = new XlsxFileReader(uploadedFile);

							//ExcelTest readerX = new ExcelTest(uploadedFile);
							ExcelReaderWithSAX readerX = new ExcelReaderWithSAX(uploadedFile);
							//excelData = readerX.getDataSet();
							readerX.getDataSet(resData);
 
							//ExcelReader reader = new ExcelReader(uploadedFile);
							//excelData = reader.getDataSet();

							item.delete();
							uploadedFile.delete();
							//System.out.println("file delete >>>> " + isDeleted);

// 							int row = ds.newRow();
// 							ds.set(row, "data", excelData);
// 							ds.set(row, "fileid", fieldName);
// 							ds.set(row, "filename", fileName);
// 							ds.set(row, "filesize", fileSize);
// 							ds.set(row, "prog", 0);
							
// 							if (reciveDataType.equalsIgnoreCase("xml")) {
// 								resData.addDataSet(ds);
// 							}

						} else if (fileExtension.equalsIgnoreCase("txt") || fileExtension.equalsIgnoreCase("cvs")) {

							/* 							TextFileReader reader = new TextFileReader();
							 //System.out.println("\n\n>>>> charset="+charset);
							 String data = reader.getDataSet(filePath + File.separator + fileName, charset);
							
							 int row = ds.newRow();
							 ds.set(row, "excelData", data);
							 ds.set(row, "fileid", fieldName);
							 ds.set(row, "filename", fileName);
							 ds.set(row, "filesize", fileSize);
							 ds.set(row, "prog", 0);	 */

							/* TextFileReader reader = new TextFileReader(); */
							////System.out.println("\n\n>>>> charset="+charset);
							/* reader.getDataSet(filePath + File.separator + fileName, charset, resData); */
 
							item.delete();
							uploadedFile.delete();
						}
					}
				}
			}



			resVarList.add("ErrorCode", 0);
			resVarList.add("ErrorMsg", "SUCC");
		} catch (FileUploadException e) {
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

	//HttpPlatformResponse res = new HttpPlatformResponse(response);
	//res.setData(resData);
	//res.sendData();
	
	HttpPlatformResponse res = null;
	if (reciveDataType.equalsIgnoreCase("xml")) {
		res = new HttpPlatformResponse(response);
		
	} else { //ssv
		res = new HttpPlatformResponse(response, PlatformType.CONTENT_TYPE_SSV, "UTF-8");
	}

	res.setData(resData);
	res.sendData();

	out.clear();
	out = pageContext.pushBody();
%>

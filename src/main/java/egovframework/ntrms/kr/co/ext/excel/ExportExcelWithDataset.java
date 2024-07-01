package egovframework.ntrms.kr.co.ext.excel;

/*
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

// Apache POI : http://poi.apache.org 
import java.awt.Color;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFCreationHelper;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xssf.usermodel.extensions.XSSFCellBorder;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.nexacro.xapi.data.DataSet;
import com.nexacro.xapi.data.DataSetList;
import com.nexacro.xapi.data.PlatformData;
import com.nexacro.xapi.data.VariableList;
import com.nexacro.xapi.tx.HttpPlatformRequest;

/**
 * 그리드 format정보와 displayText를 이용한 excel Export.
 * 
 * @author EcoSystem of TOBESOFT
 * 
 */
public class ExportExcelWithDataset {
	/* Get actual class name to be printed on */
	static Logger log = Logger.getLogger(ExportExcelWithDataset.class.getName());

	private String fileName = "";

	/**
	 * @return the fileName
	 */
	public String getFileName() {
		return fileName;
	}

	JSONObject sheetInfo, rowsInfo, columnBoxInfo, boxesInfo, contentsInfo;
	JSONArray arrayRows, arrayColumnBoxes, arrayBoxes, arrayContents;
	String sheetName, type, gridName, formatId, formatStr;

	String rowAdjustValue = "0.749999999999996";
	XSSFColor defaultBoderColor = null;
	XSSFColor defaultBoderColor2 = null;
	XSSFColor defaultBoderColor3 = null;
	XSSFColor defaultBoderColor4 = null;
	
	short border_thin = CellStyle.BORDER_THIN;

	// 디버깅 처리 내용 및 방법 보완(log4j, 예외처리)
	HashMap<String, XSSFFont> hmFont = new HashMap<String, XSSFFont>();
	HashMap<String, XSSFCellStyle> hmCellStyle = new HashMap<String, XSSFCellStyle>();

	HashMap<String, XSSFColor> hmXSSFColor = new HashMap<String, XSSFColor>();
	HashMap<String, CellProperty> hmCellPropertyData = new HashMap<String, CellProperty>();
	HashMap<String, ArrayList> hmCellInfo = new HashMap<String, ArrayList>();

	HashMap<String, Double> hmRowHeight = new HashMap<String, Double>();

	// 컬럼의 폭을 해당 컬럼의 최대 사이즈로 맞추기 위한 용도.
	HashMap<Integer, Integer> hmMaxColumnWidth = new HashMap<Integer, Integer>();
	HashMap<Integer, Integer> hmResizeColumn = new HashMap<Integer, Integer>();

	// 이미지 재사용 용도
	HashMap<String, Integer> hmPicture = new HashMap<String, Integer>();

	// XPLTFORM mask 처리용 객체
	MaskFormat maskFormat = new MaskFormat("string");
	MaskFormat maskFormatForDate = new MaskFormat("date");

	XSSFWorkbook wb = new XSSFWorkbook();
	XSSFCreationHelper helper = wb.getCreationHelper();

	DataSetList dataSetList;

	/**
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @throws Exception
	 */
	public ExportExcelWithDataset(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		defaultBoderColor = hexToXSSFColor("#191919");
		defaultBoderColor2 = hexToXSSFColor("#FF0066");
		defaultBoderColor3 = hexToXSSFColor("#0066FF");
		defaultBoderColor4 = hexToXSSFColor("#00CC00");
		//defaultBoderColor  = defaultBoderColor2;
		// HttpServletRequest를 이용하여 HttpPlatformRequest 생성
		HttpPlatformRequest req = new HttpPlatformRequest(request);
		
		// 데이터 수신
		req.receiveData();

		// 수신받은 데이터 획득
		PlatformData reqData = req.getData();
		VariableList reqVarList = reqData.getVariableList();
		
		String datasetName = reqVarList.getString("workbookDatasetName");
		
		DataSet exportDs = reqData.getDataSet(datasetName);
		String datasetNameList = exportDs.getString(0, "datasetList");
		String workbook = exportDs.getString(0, "workbook");
		String xmlData = exportDs.getString(0, "xmlData");

//		log.debug("\n >>> datasetList. > " + datasetNameList);
//		log.debug("\n\n >>> workbook. > " + workbook);
//		log.debug("\n\n >>> xmlData. > " + xmlData);

		// String datasetNameList = request.getParameter("datasetList");
		// log.debug(" >>> datasetList. > " + datasetNameList);
		// String workbook = request.getParameter("workbook");
		// String xmlData = request.getParameter("xmlData");

		String[] nameList = datasetNameList.split("<SeperatoR>");
		String[] xmlDataList = xmlData.split("<SeperatoR>");

		int nameCount = nameList.length;
		int xmlDataCount = xmlDataList.length;

		log.debug("nameCount=" + nameCount + ", xmlDataCount=" + xmlDataCount);

		if (nameCount != xmlDataCount) {
			throw new Exception(
					"datasetList와 xmlData의 건수가 일치하지 않습니다. 확인하시기 바랍니다.");
		}

		dataSetList = new DataSetList();

		// xml -> dataset 변환 후 dataSetList에 추가
		for (int i = 0; i < nameCount; i++) {
			System.out.println("[" + i + "] datasetName=" + nameList[i]);
			DataSet ds = new DataSet(nameList[i]);
			// System.out.println("[" + i + "] xmlDataList="+ xmlDataList[i]);
			ds.loadXml(xmlDataList[i]);

			dataSetList.add(ds);
		}

		long rowsOffsetRow, offsetColumn, boxOffsetRow;

		try {
			Object obj = JSONValue.parseWithException(workbook);
			JSONObject jsonObject = (JSONObject) obj;

			convertCellPropertyData(jsonObject);

			fileName = (String) jsonObject.get("fileName");

			JSONArray arraySheets = (JSONArray) jsonObject.get("sheets");

			// sheets 정보
			System.out.println("\n==  sheets 정보 ==");
			int sheetsCount = arraySheets.size();
			int rowsCount, columnBoxesCount, boxesCount;
			int sheetLastColumn = 0;
			for (int i = 0; i < sheetsCount; i++) {
				ArrayList<TextRow> sheetTextRowList = new ArrayList<TextRow>();

				sheetInfo = (JSONObject) arraySheets.get(i);
				sheetName = (String) sheetInfo.get("sheetName");

				System.out.println(i + "번, sheetName =" + sheetName);

				XSSFSheet sheet = wb.createSheet(sheetName);
				arrayRows = (JSONArray) sheetInfo.get("rows");
				rowsCount = arrayRows.size();

				// rows 정보
				int rowTop = 0, rowRight = 0, rowMaxRight = 0, prevRowBottom = 0; // 이전
																					// row
																					// bottom

				for (int rowJ = 0; rowJ < rowsCount; rowJ++) {
					rowsInfo = (JSONObject) arrayRows.get(rowJ);
					rowsOffsetRow = (Long) rowsInfo.get("offsetRow");

					System.out.println("===== " + i + "번  sheet,  row=" + rowJ
							+ ", rowsOffsetRow =" + rowsOffsetRow);

					arrayColumnBoxes = (JSONArray) rowsInfo.get("columnBoxes");

					if (rowJ == 0) {
						rowTop = (int) rowsOffsetRow;

					} else {
						rowTop = (int) (prevRowBottom + rowsOffsetRow);

					}

					columnBoxesCount = arrayColumnBoxes.size();

					// columnBoxes 정보
					int columnBoxLeft = 0, columnBoxTop = rowTop, prevColumnBoxRight = 0, columnBoxMaxRight = 0, columnBoxMaxBottom = 0;

					ArrayList<TextRow> columnBoxTextRowList = new ArrayList<TextRow>();
					for (int cbJ = 0; cbJ < columnBoxesCount; cbJ++) {
						columnBoxInfo = (JSONObject) arrayColumnBoxes.get(cbJ);
						offsetColumn = (Long) columnBoxInfo.get("offsetColumn");

						if (cbJ == 0) {
							columnBoxLeft = (int) offsetColumn;

						} else {
							columnBoxLeft = (int) (prevColumnBoxRight
									+ offsetColumn + 1);

						}

						arrayBoxes = (JSONArray) columnBoxInfo.get("boxes");
						boxesCount = arrayBoxes.size();

						// boxes 정보
						int boxTop = 0, boxRight = 0, boxLeft = columnBoxLeft, boxMaxRight = 0, boxMaxBottom = 0, gridVerticalSize = 0; // head
																																		// +
						for (int boxJ = 0; boxJ < boxesCount; boxJ++) {
							boxesInfo = (JSONObject) arrayBoxes.get(boxJ);
							type = (String) boxesInfo.get("type");
							type = type.toLowerCase();

							boxOffsetRow = (Long) boxesInfo.get("offsetRow");

							if (boxJ == 0) {
								boxTop = (int) (columnBoxTop + boxOffsetRow);
							} else {
								boxTop += boxOffsetRow;
							}

							arrayContents = (JSONArray) boxesInfo
									.get("contents");

							if (type.equals("textrow") || type.equals("label")) {
								XSSFRow bandRow = sheet.getRow((int) boxTop);

								if (bandRow == null) {
									bandRow = sheet.createRow((int) boxTop);
								}

								boxRight = 0;
								boxTop++;

								TextRow textRow = new TextRow(type,
										arrayContents);
								textRow.setBandRow(bandRow);
								textRow.setStartCol(boxLeft);

								columnBoxTextRowList.add(textRow);

							} else if (type.equals("grid")) {
								formatStr = (String) arrayContents.get(0);

								Object formatObj = JSONValue
										.parseWithException(formatStr);
								JSONObject jsonFormat = (JSONObject) formatObj;

								System.out.println("createBox 호출");

								HashMap<String, Integer> hmPosition = createBox(
										sheet, jsonFormat, boxLeft, boxTop);

								boxRight = hmPosition.get("boxRight");

								if (boxMaxRight < boxRight) {
									boxMaxRight = boxRight;
								}

								boxTop = hmPosition.get("boxBottom") + 1;
							}

							boxMaxBottom = boxTop;

						} // box loop

						prevColumnBoxRight = boxMaxRight;

						if (boxMaxRight > columnBoxMaxRight)
							columnBoxMaxRight = boxMaxRight;

						if (boxMaxBottom > columnBoxMaxBottom)
							columnBoxMaxBottom = boxMaxBottom;

						// textRow의 right column index 설정 및 sheetTextRowList에
						// 추가.
						if (columnBoxTextRowList.size() > 0) {
							setColumnBoxMaxRightToTextRow(columnBoxTextRowList,
									columnBoxMaxRight);
							sheetTextRowList.addAll(columnBoxTextRowList);

							columnBoxTextRowList = new ArrayList<TextRow>();
						}

					} // columnBox loop

					rowRight = columnBoxMaxRight;
					prevRowBottom = columnBoxMaxBottom;

					if (columnBoxMaxRight > rowMaxRight)
						rowMaxRight = columnBoxMaxRight;

				} // row loop

				if (rowMaxRight > sheetLastColumn)
					sheetLastColumn = rowMaxRight;

				setTextRow(sheet, sheetLastColumn, sheetTextRowList);

				checkMaxColumnWidth(sheet);

				// 초기화
				sheetLastColumn = 0;
				hmMaxColumnWidth = new HashMap<Integer, Integer>();
				hmResizeColumn = new HashMap<Integer, Integer>();

				//엑셀 눈금자 숨기기
				sheet.setDisplayGridlines(false);
				
			} // sheet loop


			
			// Write the output to response
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment; filename="
					+ fileName);
			ServletOutputStream outputStream = response.getOutputStream();
			wb.write(outputStream);
			//outputStream.flush();
			//outputStream.close();
			
			System.out.println("===>   completed.   fileName =" + fileName);			

			/*
			FileOutputStream fileOut = new FileOutputStream("C:/DEV/project/src/poi/WebContent/temp_repository/" + fileName);
			wb.write(fileOut);
			
			System.out.println("===>   completed.   fileName =" + fileName);
          
			
			// 송신할 데이터 생성
			PlatformData resData = new PlatformData();
			VariableList resVarList = resData.getVariableList();
			
			//Url 반환용 dataset
			DataSet sendDs = new DataSet("ds_receiveData");			
			
			// DataSet에 열(column) 추가
			sendDs.addColumn(new ColumnHeader("excelUrl", DataTypes.STRING, 255));			
			int row = sendDs.newRow();
			
			// 추가된 행(row)의 데이터 설정
			//http://172.10.10.56:7001/poi/temp_repository/workbook_vertical.xlsx
			String excelUrl = "http://172.10.10.56:7001/poi/temp_repository/" + fileName;
			sendDs.set(row, "excelUrl", excelUrl);			
			
			
			// 정상 수행
			resData.addDataSet(sendDs);
			resVarList.add("ERROR_CODE", 200);			
			
			// HttpServletResponse를 이용하여 HttpPlatformResponse 생성
			HttpPlatformResponse res = new HttpPlatformResponse(response);
			res.setData(resData);			
			
			// 데이터 송신
			res.sendData();            
			
			
			return;
			*/
			
			//			// Write the output to response
//			response.setContentType("application/vnd.ms-excel");
//			response.setHeader("Content-Disposition", "attachment; filename="
//					+ fileName);
//			ServletOutputStream outputStream = response.getOutputStream();
//			wb.write(outputStream);
//
//			System.out.println("===>   completed.   fileName =" + fileName);

		} catch (Exception e) {
			System.out.println("Caught an: " + e.getClass().getName());
			System.out.println("Message: " + e.getMessage());
			System.out.println("Stacktrace follows............");
			e.printStackTrace();
			System.out.println("===>   fail.   fileName =" + fileName);
			throw e;

		} finally {

		}

	}

	/**
	 * cellPropertyData를 hashMap에 담는다.
	 * 
	 * @param jsonObject
	 */
	public void convertCellPropertyData(JSONObject jsonObject) {
		System.out
				.println("\n■ convertCellPropertyData. body에 표시할 cell property 추출");

		JSONArray cellPropertyData = (JSONArray) jsonObject
				.get("cellPropertyData");

		// 각 그리드별 displayText가 []에 담겨져 있다.
		int dataArrayCount = cellPropertyData.size();
		long fontSize;
		String key, fontFace, fontType;
		JSONObject eachData, jsonFont;
		JSONArray value, rowArrayValue;
		CellProperty cellProperty;

		for (int i = 0; i < dataArrayCount; i++) {
			eachData = (JSONObject) cellPropertyData.get(i);
			key = (String) eachData.get("key");

			cellProperty = new CellProperty();
			cellProperty.setDisplayType((String) eachData.get("displayType"));

			// font 정보.
			jsonFont = (JSONObject) eachData.get("font");
			fontFace = (String) jsonFont.get("face");
			fontSize = (Long) jsonFont.get("size");
			fontType = (String) jsonFont.get("type");

			cellProperty.setFont(fontFace, fontSize, fontType);
			cellProperty.setColor((String) eachData.get("color"));
			cellProperty.setBackground((String) eachData.get("background"));
			cellProperty.setAlign((String) eachData.get("hAlign"),
					(String) eachData.get("vAlign"));

//			 System.out.println("key="+key + ", displayType=" + ((String) eachData.get("displayType")));
//			 System.out.println("jsonFont="+jsonFont);
////			 System.out.println("fontFace="+fontFace);
////			 System.out.println("fontSize="+fontSize);
//			 System.out.println("color="+eachData.get("color"));
//			 System.out.println("hAlign="+eachData.get("hAlign"));
//			 System.out.println("mask="+eachData.get("mask"));

			cellProperty.setMask((String) eachData.get("mask"));
			cellProperty.setLine((String) eachData.get("line"));

			hmCellPropertyData.put(key, cellProperty);
		}
	}

	/**
	 * ColumnBox에 포함되는 textRow 객체에 textRow의 right column index로 사용되는
	 * columnBoxMaxRight를 설정한다.
	 * 
	 * @param textRowList
	 * @param columnBoxMaxRight
	 */
	public void setColumnBoxMaxRightToTextRow(ArrayList<TextRow> textRowList,
			int columnBoxMaxRight) {
		int size = textRowList.size();
		TextRow textRow;

		for (int i = 0; i < size; i++) {
			textRow = textRowList.get(i);
			textRow.setColumnBoxMaxRight(columnBoxMaxRight);
		}
	}

	/**
	 * textRow 설정. type이 textRow 이면 해당 시트의 firstColumn ~ lastColumn까지 merge시킨다.
	 * 
	 * @param sheet
	 * @param sheetLastColumn
	 * @param textRowList
	 * @throws IOException
	 */
	public void setTextRow(XSSFSheet sheet, int sheetLastColumn,
			ArrayList<TextRow> textRowList) throws IOException {
		int count = textRowList.size();
		CellStyle cellStyle;
		Font font;
		Row bandRow;
		Cell bandCell;

		TextRow textRow;
		float textRowFontAdjustValue = 4;
		int excelRowIndex, startCol;
		int lastColumn = sheetLastColumn;
		String type;

		for (int i = 0; i < count; i++) {
			textRow = textRowList.get(i);

			font = getFont(textRow.fontFace, textRow.fontSize,
					textRow.fontType, textRow.fontColor);
			short fontHeightInPoints = font.getFontHeightInPoints();

			cellStyle = getCellStyle("STRING", textRow.halign, textRow.valign,
					textRow.fontFace + textRow.fontSize + textRow.fontType,
					font, textRow.fontColor, textRow.background, "", "", false);

			
			bandRow = textRow.bandRow;
			bandRow.setHeightInPoints((float) fontHeightInPoints
					+ textRowFontAdjustValue);

			// Create a cell
			startCol = textRow.startCol;
			bandCell = bandRow.createCell(startCol);
			type = textRow.type;
			setCellValue(bandCell, "string", textRow.text, cellStyle, null);
			bandCell.setCellStyle(cellStyle);
			
			
			
			

			
			
			excelRowIndex = bandRow.getRowNum();
			if (type.equalsIgnoreCase("textRow")) {

			} else if (type.equalsIgnoreCase("label")) {
				lastColumn = textRow.columnBoxMaxRight;
			}

			// merge 시킬 영역설정
			CellRangeAddress region = new CellRangeAddress(excelRowIndex,
					(int) excelRowIndex, (int) startCol, (int) lastColumn);

			// poi cell에 value를 설정할 때 displayType에 따라 cellType을 설정한다.
			setCellStyleBeforeMerge(sheet, region, cellStyle);

			// merge 실행
			sheet.addMergedRegion(region);

		}

	}

	/**
	 * 엑셀로 export시킬 box를 생성한다.
	 * 
	 * @param sheet
	 * @param format
	 *            그리드 format정보
	 * @param boxLeft
	 * @param boxTop
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Integer> createBox(XSSFSheet sheet,
			JSONObject format, long boxLeft, long boxTop) throws Exception {
		System.out.println("■ createBox.  그리드 format 추출 후 cell 생성.");

		long size;
		String band;
		JSONObject rows;
		String bindDatasetId = (String) format.get("dataUid");
		String gridName = (String) format.get("gridName");
		String formatId = (String) format.get("formatId");
		boolean exportExpr = (Boolean) format.get("exportExpr");

		String exportSvcID = (String) format.get("exportSvcID");
		String propertyDatasetId = (String) format.get("propertyDatasetId");

		JSONArray arrayColumns = (JSONArray) format.get("columns");
		JSONArray arrayRows = (JSONArray) format.get("rows");
		JSONArray arrayHeadBand = (JSONArray) format.get("headBand");
		JSONArray arrayBodyBand = (JSONArray) format.get("bodyBand");
		JSONArray arraySummBand = (JSONArray) format.get("summBand");

		// rows 정보 추출
		ArrayList<Long> headBandSizeList = new ArrayList<Long>();
		ArrayList<Long> bodyBandSizeList = new ArrayList<Long>();
		ArrayList<Long> summBandSizeList = new ArrayList<Long>();

		int count = arrayRows.size();

		try {

			for (int i = 0; i < count; i++) {
				rows = (JSONObject) arrayRows.get(i);

				size = (Long) rows.get("size");
				band = (String) rows.get("band");

				if (band.equals("head")) {
					headBandSizeList.add(size);

				} else if (band.equals("body")) {
					bodyBandSizeList.add(size);

				} else if (band.equals("summ")) {
					summBandSizeList.add(size);
				}
			}

		} catch (Exception e) {
			throw e;
		}

		int startRow = (int) boxTop, startCol = (int) boxLeft;

		int dataRowCount = 0;
		int headRowCount = 0, bodyRowCount = 0, summRowCount = 0;

		try {

			// headBand 처리
			ArrayList headBandInfo = getBandInfo(headBandSizeList,arrayHeadBand);
			headRowCount = createStaticBand(sheet, startRow, startCol,
					headBandSizeList, headBandInfo, "head");

			startRow += headRowCount;

			// bodyBand 처리
			ArrayList bodyBandInfo = getBandInfo(bodyBandSizeList,
					arrayBodyBand);

			DataSet dataset;
			// expr 미적용
			if (exportExpr == false) {

				if (!exportSvcID.equals("")) {
					JSONArray arraySvcArg = (JSONArray) format
							.get("exportSvcArg");
					int argCount = arraySvcArg.size();
					ArrayList argList = new ArrayList();

					for (int k = 0; k < argCount; k++) {
						System.out.println("k=" + k + ", value="
								+ arraySvcArg.get(k));
						argList.add(arraySvcArg.get(k));
					}

					System.out.println("sampleDataset 호출 exportSvcID="
							+ exportSvcID);

					// 샘플에서는 서비스호출을 SampleDataset 생성으로 대체한다.
					SampleDataset sampleDataset = new SampleDataset(
							exportSvcID, argList);
					dataset = sampleDataset.getDataset();

				} else {
					dataset = dataSetList.get(bindDatasetId);
					if (dataset == null) {
						throw new Exception("dataUid: " + bindDatasetId
								+ "에 해당하는 Dataset이 존재하지 않습니다"
								+ ". input Dataset을 확인하시기 바랍니다.");
					}

				}

				dataRowCount = createDynamicBandWithDataset(dataset, sheet,
						startRow, startCol, bodyBandSizeList, bodyBandInfo,
						arrayColumns, format, summBandSizeList.size());

				// expr 적용
			} else if (exportExpr == true) {
				dataset = dataSetList.get(bindDatasetId);
				DataSet propertyDataset = dataSetList.get(propertyDatasetId);

				if (dataset == null) {
					throw new Exception("bindDatasetId: " + bindDatasetId
							+ "에 해당하는 Dataset이 존재하지 않습니다"
							+ ". input Dataset을 확인하시기 바랍니다.");
				}

				if (propertyDataset == null) {
					throw new Exception("propertyDatasetId: "
							+ propertyDatasetId + "에 해당하는 Dataset이 존재하지 않습니다"
							+ ". input Dataset을 확인하시기 바랍니다.");
				}

				dataRowCount = createDynamicBandWithExpr(dataset, sheet,
						startRow, startCol, bodyBandSizeList, bodyBandInfo,
						arrayColumns, format, propertyDataset,
						summBandSizeList.size(), arrayBodyBand.size());

			}

			bodyRowCount = (bodyBandSizeList.size() * dataRowCount);
			// summBand 처리
			startRow += bodyRowCount;
			ArrayList summBandInfo = getBandInfo(summBandSizeList,
					arraySummBand);

			summRowCount = createStaticBand(sheet, startRow, startCol,
					summBandSizeList, summBandInfo, "summ");

		} catch (Exception e) {
			throw e;
		}

		HashMap<String, Integer> hmPosition = new HashMap<String, Integer>();
		hmPosition.put("boxRight", (int) (boxLeft + arrayColumns.size() - 1));
		hmPosition.put("boxBottom", (int) (boxTop
				+ (headRowCount + bodyRowCount + summRowCount) - 1));

		return hmPosition;
	}

	/**
	 * band가 multiple row인 경우를 처리하기 위해 ArrayList에 각 Row별 cell 정보를 객체로 변환한다. 즉,
	 * 밴드별 셀정보를 객체로 반환!!
	 * 
	 * @param bandSizeList
	 *            grid format string에 <Rows>에 대한 정보를 가진 객체
	 * @param arrayBand
	 *            grid format string에 <Band>에 대한 정보를 가진 객체.head, body, summ이 올 수
	 *            있다.
	 * @return ArrayList<ArrayList<GridCellInfo>>
	 */
	public ArrayList getBandInfo(ArrayList bandSizeList, JSONArray arrayBand) {

		ArrayList<ArrayList> bandInfoList = new ArrayList<ArrayList>();

		int count = bandSizeList.size();
		int bandCount = arrayBand.size();

		long cellIndex, row, rowspan, col, colspan, fontSize, suppress;
		String key, text, displayType, fontFace, fontType, mask;
		String suppressAlign;
		String color, background, hAlign, vAlign, faceSizeType, bindColumn;

		for (int i = 0; i < count; i++) {
			ArrayList<GridCellInfo> cellInfoList = new ArrayList<GridCellInfo>();
			JSONObject band, jsonFont;
			GridCellInfo cellInfo;

			for (int j = 0; j < bandCount; j++) {
				band = (JSONObject) arrayBand.get(j);
				row = (Long) band.get("row");

				
				if (row != i) continue;

				cellIndex = (Long) band.get("cellIndex");
				rowspan = (Long) band.get("rowspan");
				col = (Long) band.get("col");
				colspan = (Long) band.get("colspan");
				text = (String) band.get("text");
				key = (String) band.get("key");
				bindColumn = (String) band.get("bindColumn");
				suppress = (Long) band.get("suppress");
				suppressAlign = (String) band.get("suppressAlign");

				cellInfo = new GridCellInfo(cellIndex, row, rowspan, col,
						colspan);
				cellInfo.setText(text);
				cellInfo.setKey(key);
				cellInfo.setBindColumn(bindColumn);
				cellInfo.setSuppress(suppress);
				cellInfo.setSuppressAlign(suppressAlign);

				cellInfoList.add(cellInfo);
			}

			bandInfoList.add(cellInfoList);
		}

		return bandInfoList;
	}

	/**
	 * head/ summ band와 같은 반복되지 않은 밴드를 생성한다.
	 * 
	 * @param sheet
	 *            XSSFSheet
	 * @param startRow
	 *            시작 row
	 * @param startCol
	 *            시작 coloumn
	 * @param bandSizeList
	 *            band 사이즈 정보
	 * @param bandCellInfoByRow
	 *            row별 cell 정보
	 * @return 생성된 row count
	 * @throws IOException
	 */
	public int createStaticBand(XSSFSheet sheet, int startRow, int startCol,
			ArrayList<Long> bandSizeList, ArrayList<ArrayList> bandCellInfoByRow, String bandType)
			throws IOException {

		XSSFRow bandRow;
		XSSFCell bandCell;
		XSSFFont font;
		XSSFCellStyle cellStyle, cloneStyle;

		long cellIndex, row, rowspan, col, colspan, fontSize;
		String key, text, displayType, fontFace, fontType, mask;
		String color, background, hAlign, vAlign;

		System.out.println("  ■ createStaticBand. Head 또는 Summ Band startRow="
				+ startRow + ", startCol=" + startCol);

		ArrayList bandInfo;

		int bandCount = bandCellInfoByRow.size();
		int bandRowCount = bandSizeList.size();
		int excelRowIndex = startRow;
		int excelColumnIndex = 0;

		CellProperty cellProperty;

		int lastBand = bandCount - 1;
		long maxCol = 0;
		String sizeValue, line;
		// head row 개수만큼 반복
		for (int i = 0; i < bandCount; i++) {
			bandInfo = bandCellInfoByRow.get(i);
			int cellCount = bandInfo.size();
			GridCellInfo cellInfo;

			sizeValue = bandSizeList.get(i) + "";

			bandRow = sheet.getRow(excelRowIndex);

			// row 존재유무 파악
			if (bandRow == null) {
				bandRow = sheet.createRow(excelRowIndex);
			}

			bandRow.setHeightInPoints((float) getExcelRowHeight(sizeValue));
			
			int lastCell = cellCount - 1;
			
			// cell index 개수만큼 반복
			for (int j = 0; j < cellCount; j++) {
				cellInfo = (GridCellInfo) bandInfo.get(j);
				row = cellInfo.getRow();
				rowspan = cellInfo.getRowspan();
				col = cellInfo.getCol();
				colspan = cellInfo.getColspan();
				cellIndex = cellInfo.getCellIndex();
				text = cellInfo.getText();
				key = cellInfo.getKey();

				//System.out.println("  ==> cellIndex="+cellIndex + ", col="+ col + ", maxCol="+maxCol);
				if(maxCol < col) {
					maxCol = col; 
				}
				
				
				cellProperty = hmCellPropertyData.get(key);

				mask = cellProperty.getMask();
				line = cellProperty.getLine();

				displayType = cellProperty.getDisplayType();
				color = cellProperty.getColor();
				background = cellProperty.getBackground();
				hAlign = cellProperty.gethAlign();
				vAlign = cellProperty.getvAlign();

				fontFace = cellProperty.getFontFace();
				fontSize = cellProperty.getFontSize();
				fontType = cellProperty.getFontType();

				font = getFont(fontFace, fontSize, fontType, color);

				cellStyle = getCellStyle(displayType, hAlign, vAlign, fontFace
						+ fontSize + fontType, font, color, background, mask,
						line, true);

				cloneStyle = (XSSFCellStyle) cellStyle.clone();
				
				
				// 그리드 테두리 처리를 위한 cell border 처리
				if (rowspan - 1 == lastBand) { //마지막 band row
					//System.out.println("AA row="+row + ",cellIndex="+cellIndex);
					
					if(bandType.equals("summ")) {
						cloneStyle.setBorderBottom(border_thin);
						cloneStyle.setBottomBorderColor(defaultBoderColor);
					}
					
					if(j == 0) { //마지막 band row의 첫번째 cell
						cloneStyle.setBorderLeft(border_thin);
						cloneStyle.setLeftBorderColor(defaultBoderColor);
						
					} else if(j == lastCell) { //마지막 band row의 마지막 cell
						cloneStyle.setBorderRight(border_thin);
						cloneStyle.setRightBorderColor(defaultBoderColor);					
					}
					
					if (i == 0 && bandType.equals("head")) { // row 첫번째 cell
						cloneStyle.setBorderTop(border_thin);
						cloneStyle.setTopBorderColor(defaultBoderColor);							
					}
					
				} else {
					//System.out.println("BB row="+row + ",cellIndex="+cellIndex);
					
					// 그리드 테두리 처리를 위한 첫번째 cell과 마지막 cell border 처리
					if (i == 0) { // row 첫번째
						if(bandType.equals("head")) {
							cloneStyle.setBorderTop(border_thin);
							cloneStyle.setTopBorderColor(defaultBoderColor);							
						}
						
						if(j == 0) { // row 첫번째 ,  cell 첫번째
							cloneStyle.setBorderLeft(border_thin);
							cloneStyle.setLeftBorderColor(defaultBoderColor);
							
						} else if(j == lastCell) { // row 첫번째, cell 마지막
							cloneStyle.setBorderRight(border_thin);
							cloneStyle.setRightBorderColor(defaultBoderColor);
						}						

					} else if(j == lastCell) { //마지막 cell
						
						if(col == maxCol) { //우측 마지막 컬럼.
							cloneStyle.setBorderRight(border_thin);
							cloneStyle.setRightBorderColor(defaultBoderColor);
						}
						
						if(i == lastBand && bandType.equals("summ")) { //마지막 band row
							cloneStyle.setBorderBottom(border_thin);
							cloneStyle.setBottomBorderColor(defaultBoderColor);					
						}
						
					} else if(row == lastBand && bandType.equals("summ")) { //마지막 band row
						cloneStyle.setBorderBottom(border_thin);
						cloneStyle.setBottomBorderColor(defaultBoderColor);
						
					} else if(col == 0) { //첫번째 컬럼
						cloneStyle.setBorderLeft(border_thin);
						cloneStyle.setLeftBorderColor(defaultBoderColor);						
					}
				}
				
				cellStyle = cloneStyle;
				
				excelColumnIndex = (int) (startCol + col);

				// Create a cell
				bandCell = bandRow.createCell((int) excelColumnIndex);
				bandCell.setCellStyle(cellStyle);

				if (!text.equals(""))
					setCellValue(bandCell, displayType, text, cellStyle, mask);

				if (rowspan > 1 || colspan > 1) {

					// merge 시킬 영역설정
					CellRangeAddress region = new CellRangeAddress(
							excelRowIndex, (int) (excelRowIndex + rowspan - 1),
							(int) excelColumnIndex, (int) (excelColumnIndex
									+ colspan - 1));
					// merge 대상이 되는 cell을 생성한다.
					setCellStyleBeforeMerge(sheet, region, cellStyle);
					// merge 실행
					sheet.addMergedRegion(region);

				}

			}

			excelRowIndex++;

		}

		return bandRowCount;
	}

	/**
	 * body band와 같은 반복되는 밴드를 생성한다.
	 * 
	 * @param dataset
	 *            밴드에 적용될 dataset
	 * @param sheet
	 *            XSSFSheet
	 * @param startRow
	 *            시작 row
	 * @param startCol
	 *            시작 coloumn
	 * @param dataRowCount
	 *            전체 Data의 row count
	 * @param bandSizeList
	 *            band 사이즈 정보
	 * @param bodyBandInfo
	 *            그리드 format string의 <Band>에 해당하는 정보. format에 지정된 값을 반복해서 사용한다.
	 * @param arrayColumns
	 *            그리드 format string의 <Columns>에 해당하는 정보
	 * @return 생성된 row count
	 * @throws Exception
	 */
	public int createDynamicBandWithDataset(DataSet dataset, XSSFSheet sheet,
			int startRow, int startCol, ArrayList<Long> bandSizeList,
			ArrayList<ArrayList> bodyBandInfo, JSONArray arrayColumns,
			JSONObject format, int summBandCount) throws Exception {

		XSSFRow bandRow, prevRow;
		XSSFCell currentCell, prevCell;
		XSSFFont font;
		XSSFCellStyle cellStyle;

		System.out
				.println("  ■ createDynamicBandWithDataset. body 영역생성. startRow="
						+ startRow + ", startCol=" + startCol);

		long cellIndex, row, rowspan, col, colspan, fontSize;
		String key, text, displayType, fontFace, fontType, mask = "";
		String color, background, hAlign, vAlign, line;

		// suppress 처리용
		JSONObject tempSuppressInfo;
		long suppress;
		String bindColumn, suppressAlign;
		JSONArray suppressInfo = (JSONArray) format.get("suppressInfo");
		String suppresslevel = (String) format.get("suppresslevel");

		int count = suppressInfo.size();
		HashMap<Long, String> hmSuppressBindColumn = new HashMap<Long, String>();
		for (int i = 0; i < count; i++) {
			tempSuppressInfo = (JSONObject) suppressInfo.get(i);

			suppress = (Long) tempSuppressInfo.get("suppress");
			bindColumn = (String) tempSuppressInfo.get("bindColumn");
			hmSuppressBindColumn.put(suppress, bindColumn);
		}

		int bandCount = bodyBandInfo.size();

		ArrayList bandInfo;

		int excelRowIndex = startRow;
		int excelColumnIndex = 0;
		int dataRowCount = 0;

		CellProperty cellProperty;
		String sizeValue;

		try {

			//XSSFColor defaultBoderColor = null;

			//short border_thin = CellStyle.BORDER_THIN;
			short border_none = CellStyle.BORDER_NONE;

			dataRowCount = dataset.getRowCount();

			// suppress 처리용
			String prevText = null;
			int lastRow = dataRowCount - 1;

			// 데이터셋 row count만큼 반복
			for (int i = 0; i < dataRowCount; i++) {

				// 그리드 포맷의 band row 개수만큼 반복
				for (int j = 0; j < bandCount; j++) {
					bandInfo = bodyBandInfo.get(j);
					int cellCount = bandInfo.size();
					GridCellInfo cellInfo;

					sizeValue = bandSizeList.get(j) + "";

					bandRow = sheet.getRow(excelRowIndex);

					// row 존재유무 파악
					if (bandRow == null) {
						bandRow = sheet.createRow(excelRowIndex);
					}

					bandRow.setHeightInPoints((float) getExcelRowHeight(sizeValue));

					long columnWidth;
					XSSFCellStyle cloneStyle = null;

					// cell index 개수만큼 반복
					for (int k = 0; k < cellCount; k++) {
						cellInfo = (GridCellInfo) bandInfo.get(k);
						row = cellInfo.getRow();
						rowspan = cellInfo.getRowspan();
						col = cellInfo.getCol();
						colspan = cellInfo.getColspan();
						cellIndex = cellInfo.getCellIndex();
						key = cellInfo.getKey();
						bindColumn = cellInfo.getBindColumn();
						suppress = cellInfo.getSuppress();
						suppressAlign = cellInfo.getSuppressAlign();

						cellProperty = hmCellPropertyData.get(key);

						mask = cellProperty.getMask();
						line = cellProperty.getLine();
						displayType = cellProperty.getDisplayType();
						color = cellProperty.getColor();
						background = cellProperty.getBackground();
						hAlign = cellProperty.gethAlign();
						vAlign = cellProperty.getvAlign();

						fontFace = cellProperty.getFontFace();
						fontSize = cellProperty.getFontSize();
						fontType = cellProperty.getFontType();

						font = getFont(fontFace, fontSize, fontType, color);

						cellStyle = getCellStyle(displayType, hAlign, vAlign,
								fontFace + fontSize + fontType, font, color,
								background, mask, line, true);

						cloneStyle = (XSSFCellStyle) cellStyle.clone();

						// 그리드 테두리 처리를 위한 첫번째 cell과 마지막 cell border 처리
						if (k == 0) { // row 첫번째 cell
							if (i == 0)
								defaultBoderColor = cellStyle
										.getBorderColor(XSSFCellBorder.BorderSide.LEFT);

							cloneStyle.setBorderLeft(border_thin);

						} else if (k == (cellCount - 1)) { // row 마지막 cell
							cloneStyle.setBorderRight(border_thin);

						}

						if (i == lastRow) {
							if (summBandCount == 0) {
								cloneStyle.setBorderBottom(border_thin);
								cloneStyle
										.setBottomBorderColor(defaultBoderColor);

							} else {
								cloneStyle.setBorderBottom(border_none);

							}
						}

						cellStyle = cloneStyle;

						excelColumnIndex = (int) (startCol + col);

						// Create a cell
						currentCell = bandRow
								.createCell((int) excelColumnIndex);
						currentCell.setCellStyle(cellStyle);

						// column width 설정(첫 row에만 실행)
						if (i == 0) {
							JSONObject jsonWidth = (JSONObject) arrayColumns
									.get((int) col);
							columnWidth = (Long) jsonWidth.get("size");
							int columnIndex = currentCell.getColumnIndex();
							int width = (int) (32 * columnWidth);
							sheet.setColumnWidth(columnIndex, width); // 32 =
																		// 1px

							setMaxColumnWidth(columnIndex, width);
						}

						// bind되지 않은 컬럼 존재시 처리
						if (bindColumn.equals("")) {
							text = "";
						} else {
							text = dataset.getString(i, bindColumn);

							// suppress 처리(border 포함)
							if (suppress > 0) {
								if (i > 0) {
									prevText = dataset.getString(i - 1,
											bindColumn);

									prevRow = sheet.getRow(excelRowIndex - 1);
									prevCell = prevRow
											.getCell((int) excelColumnIndex);

									if (suppresslevel.equals("sameskip")
											|| suppresslevel
													.equals("allcompare")) {
										setSameskipSuppress(currentCell,
												prevCell, cellStyle, dataset,
												i, suppresslevel, suppress,
												suppressAlign, text, prevText,
												hmSuppressBindColumn,
												displayType, mask, sheet,
												excelRowIndex, (int) cellIndex);

									} else if (suppresslevel.equals("allskip")) {
										setAllskipSuppress(currentCell,
												prevCell, cellStyle, text,
												prevText, displayType, mask);

									} else {
										// 지원되지 않는 타입입니다.
										throw new Exception(
												"그리드 속성 중 suppresslevel="
														+ suppresslevel + "은"
														+ "지원하지 않는 속성입니다.");

									}

								} else if (i == 0) {
									setCellValue(currentCell, displayType,
											text, cellStyle, mask);
								}

							} else {
								setCellValue(currentCell, displayType, text,
										cellStyle, mask);
							}

						}

						// merge cell 처리
						if (rowspan > 1 || colspan > 1) {
							// merge 시킬 영역설정
							CellRangeAddress region = new CellRangeAddress(
									excelRowIndex, (int) (excelRowIndex
											+ rowspan - 1),
									(int) excelColumnIndex,
									(int) (excelColumnIndex + colspan - 1));

							// merge 대상이 되는 cell을 생성한다.
							setCellStyleBeforeMerge(sheet, region, cellStyle);
							// merge 실행
							sheet.addMergedRegion(region);

						}
					}

					excelRowIndex++;

				}
			}

		} catch (Exception e) {
			throw e;
		}

		return dataRowCount;
	}

	/**
	 * suppress 가능여부 확인
	 * 
	 * @param dataset
	 * @param rowIndex
	 * @param suppress
	 * @param hmSuppressBindColumn
	 * @return suppress 가능여부
	 */
	public boolean isPossibleToSuppress(DataSet dataset, int rowIndex,
			long suppress, HashMap<Long, String> hmSuppressBindColumn) {

		if (suppress == 1)
			return true;

		// suppress 상위레벨 컬럼명 추출
		String suppressBindColumn = hmSuppressBindColumn.get(suppress - 1);
		String upperLevelPrevText = dataset.getString(rowIndex - 1,
				suppressBindColumn);
		String upperLevelText = dataset.getString(rowIndex, suppressBindColumn);

		// suppress 처리
		if (upperLevelPrevText.equals(upperLevelText)) {
			if (suppress == 1) {
				return true;
			} else {
				// 상위레벨 suppress 검사
				return isPossibleToSuppress(dataset, rowIndex, suppress - 1,
						hmSuppressBindColumn);
			}

		} else {
			return false;
		}

	}

	/**
	 * expr을 적용한 body band를 생성한다.
	 * 
	 * @param dataset
	 * @param sheet
	 *            XSSFSheet
	 * @param startRow
	 *            시작 row
	 * @param startCol
	 *            시작 coloumn
	 * @param bandSizeList
	 *            사이즈 정보
	 * @param bodyBandInfo
	 *            그리드 format string의 <Band>에 해당하는 정보.
	 * @param arrayColumns
	 *            그리드 format string의 <Columns>에 해당하는 정보
	 * @param format
	 *            그리드 format
	 * @param propertyDataset
	 * @param summBandCount
	 * @return
	 * @throws Exception
	 */
	public int createDynamicBandWithExpr(DataSet dataset, XSSFSheet sheet,
			int startRow, int startCol, ArrayList<Long> bandSizeList,
			ArrayList<ArrayList> bodyBandInfo, JSONArray arrayColumns,
			JSONObject format, DataSet propertyDataset, int summBandCount, int bandSize)
			throws Exception {

		XSSFRow bandRow, prevRow;
		XSSFCell currentCell, prevCell;
		XSSFFont font;
		XSSFCellStyle cellStyle;

		long cellIndex, row, rowspan, col, colspan, fontSize;
		String key, text, displayType, fontFace, fontType, mask = "";
		String color, background, hAlign, vAlign, line;

		// suppress 처리용
		JSONObject tempSuppressInfo;
		long suppress;
		String bindColumn, suppressAlign;
		JSONArray suppressInfo = (JSONArray) format.get("suppressInfo");
		String suppresslevel = (String) format.get("suppresslevel");

		int count = suppressInfo.size();
		HashMap<Long, String> hmSuppressBindColumn = new HashMap<Long, String>();
		for (int i = 0; i < count; i++) {
			tempSuppressInfo = (JSONObject) suppressInfo.get(i);

			suppress = (Long) tempSuppressInfo.get("suppress");
			bindColumn = (String) tempSuppressInfo.get("bindColumn");
			hmSuppressBindColumn.put(suppress, bindColumn);
		}

		int bandCount = bodyBandInfo.size();

		ArrayList bandInfo;

//		System.out
//				.println("  ■ [Expr] ■  createDynamicBandWithExpr. body 영역생성(Data 포함).  startRow="
//						+ startRow + ", startCol=" + startCol);

		int excelRowIndex = startRow;
		int excelColumnIndex = 0;
		int dataRowCount = 0;

		CellProperty tempCellProperty;
		String sizeValue;

		try {

			//short border_thin = CellStyle.BORDER_THIN;
			short border_none = CellStyle.BORDER_NONE;

			dataRowCount = dataset.getRowCount();

			//System.out.println("saveXML=\n" + dataset.saveXml());
			//CreationHelper createHelper = wb.getCreationHelper();
			
			// suppress 처리용
			String prevText = null;
			int lastRow = dataRowCount - 1;
			for (int i = 0; i < dataRowCount; i++) {
				// band row 갯수만큼 반복

				int lastBand = bandCount - 1;
				for (int j = 0; j < bandCount; j++) {
					bandInfo = bodyBandInfo.get(j);
					int cellCount = bandInfo.size();
					GridCellInfo cellInfo;

					sizeValue = bandSizeList.get(j) + "";

					bandRow = sheet.getRow(excelRowIndex);

					// row 존재유무 파악
					if (bandRow == null) {
						bandRow = sheet.createRow(excelRowIndex);
					}

					bandRow.setHeightInPoints((float) getExcelRowHeight(sizeValue));

					long columnWidth;
					XSSFCellStyle cloneStyle = null;

					
					//System.out.println("     dataRowCount=" + dataRowCount + ", bandCount="+ bandCount  + ",cellCount="+cellCount);
					
					// cell index 갯수만큼 반복
					for (int k = 0; k < cellCount; k++) {
					//for (int k = 0; k < bandSize; k++) {
					
						cellInfo = (GridCellInfo) bandInfo.get(k);
						
						row = cellInfo.getRow();
						rowspan = cellInfo.getRowspan();
						col = cellInfo.getCol();
						colspan = cellInfo.getColspan();
						cellIndex = cellInfo.getCellIndex();
						suppress = cellInfo.getSuppress();
						suppressAlign = cellInfo.getSuppressAlign();

						//key = propertyDataset.getString(i, k);
						key = propertyDataset.getString(i, (int) cellIndex);

						tempCellProperty = hmCellPropertyData.get(key);

						mask = tempCellProperty.getMask();
						line = tempCellProperty.getLine();
						displayType = tempCellProperty.getDisplayType();
						color = tempCellProperty.getColor();
						background = tempCellProperty.getBackground();
						hAlign = tempCellProperty.gethAlign();
						vAlign = tempCellProperty.getvAlign();

						fontFace = tempCellProperty.getFontFace();
						fontSize = tempCellProperty.getFontSize();
						fontType = tempCellProperty.getFontType();

						font = getFont(fontFace, fontSize, fontType, color);
						
						//System.out.println("     데이터 row i=" + i + ", 밴드row j="+ j  + ",cellIndex ="+cellIndex + ",displayType ="+displayType +  ",cell index k="+k + ", key="+key);

						// Expr 사용시에는 mask를 별도로 지정하지 않는다.
						cellStyle = getCellStyle(displayType, hAlign, vAlign,
								fontFace + fontSize + fontType, font, color,
								background, "", line, true);

						cloneStyle = (XSSFCellStyle) cellStyle.clone();

						// 그리드 테두리 처리를 위한 첫번째 cell과 마지막 cell border 처리
						if(cellIndex == 0) { // row 첫번째 cell
							//System.out.println("보더처리 row 첫번째 cell");
							cloneStyle.setBorderLeft(border_thin);
							cloneStyle.setLeftBorderColor(defaultBoderColor);

						} else if (k == (cellCount - 1)) { // row 마지막 cell
							cloneStyle.setBorderRight(border_thin);
							cloneStyle.setRightBorderColor(defaultBoderColor);
						}

						if (i == lastRow) {
							
							if(j == lastBand || cellIndex == 0){
								if (summBandCount == 0) {
									cloneStyle.setBorderBottom(border_thin);
									cloneStyle.setBottomBorderColor(defaultBoderColor);

								}								
							}
								
 
//							else {
//								cloneStyle.setBorderBottom(border_none);
//								cloneStyle.setBottomBorderColor(defaultBoderColor);
//
//							}
						}

						cellStyle = cloneStyle;
						
//						//format 적용해보기
//						if(cellIndex==4){
//							cellStyle.setDataFormat(createHelper.createDataFormat().getFormat("₩__##,##0.##"));
//
//						}
						
						
						excelColumnIndex = (int) (startCol + col);

						// Create a cell
						currentCell = bandRow.createCell((int) excelColumnIndex);
						currentCell.setCellStyle(cellStyle);

						
						
						// column width 설정
						if (i == 0) {
							JSONObject jsonWidth = (JSONObject) arrayColumns
									.get((int) col);
							columnWidth = (Long) jsonWidth.get("size");
							int columnIndex = currentCell.getColumnIndex();
							int width = (int) (32 * columnWidth);
							sheet.setColumnWidth(columnIndex, width); // 32 = 1px

							setMaxColumnWidth(columnIndex, width);

						}

						text = dataset.getString(i, (int) cellIndex);
						
						//System.out.println("   ■■■ " + i +" ,text=" + text);
						
						// suppress 처리(border 포함)
						if (suppress > 0) {
							if (i > 0) {
								prevText = dataset.getString(i - 1,
										(int) cellIndex);

								prevRow = sheet.getRow(excelRowIndex - 1);
								prevCell = prevRow
										.getCell((int) excelColumnIndex);

								if (suppresslevel.equals("sameskip")
										|| suppresslevel.equals("allcompare")) {
									setSameskipSuppress(currentCell, prevCell,
											cellStyle, dataset, i,
											suppresslevel, suppress,
											suppressAlign, text, prevText,
											hmSuppressBindColumn, displayType,
											mask, sheet, excelRowIndex,
											(int) cellIndex);

								} else if (suppresslevel.equals("allskip")) {
									setAllskipSuppress(currentCell, prevCell,
											cellStyle, text, prevText,
											displayType, mask);
								} else {
									// 지원되지 않는 타입입니다.
									throw new Exception(
											"그리드 속성 중 suppresslevel="
													+ suppresslevel + "은"
													+ "지원하지 않는 속성입니다.");

								}

							} else if (i == 0) {
								setCellValue(currentCell, displayType, text,
										cellStyle, mask);
							}

						} else {
							setCellValue(currentCell, displayType, text,
									cellStyle, mask);
						}

						// merge cell 처리
						if (rowspan > 1 || colspan > 1) {
							// System.out.println(" ● 머지처리");

							// merge 시킬 영역설정
							CellRangeAddress region = new CellRangeAddress(
									excelRowIndex, (int) (excelRowIndex
											+ rowspan - 1),
									(int) excelColumnIndex,
									(int) (excelColumnIndex + colspan - 1));

							// merge 대상이 되는 cell을 생성한다.
							setCellStyleBeforeMerge(sheet, region, cellStyle);
							// merge 실행
							sheet.addMergedRegion(region);

						}
					}

					excelRowIndex++;

				}
			}

		} catch (Exception e) {
			throw e;
		}

		return dataRowCount;
	}

	/**
	 * suppresslevel이 "sameskip" 또는 "allcompare"인 경우. text 및 border 처리
	 * 
	 * @param currentCell
	 *            현재 cell
	 * @param prevCell
	 *            이전 row의 cell
	 * @param cellStyle
	 *            cell style
	 * @param dataset
	 *            XPLATFORM DataSet
	 * @param currRow
	 *            text를 가져올 dataset rowposition
	 * @param suppresslevel
	 *            Grid suppresslevel 속성값
	 * @param suppress
	 *            Grid > cell suppress 속성값
	 * @param suppressAlign
	 *            Grid > cell suppressalign 속성값
	 * @param currentText
	 *            현재 text
	 * @param prevText
	 *            이전 row의 text
	 * @param hmSuppressBindColumn
	 *            suppress가 설정된 bind column 정보
	 * @param displayType
	 *            Grid > cell displaytype 속성값
	 * @param mask
	 *            Grid > cell mask 속성값
	 * @param sheet
	 * @param excelRowIndex
	 * @param cellIndex
	 * @throws IOException
	 */
	public void setSameskipSuppress(XSSFCell currentCell, XSSFCell prevCell,
			XSSFCellStyle cellStyle, DataSet dataset, int currRow,
			String suppresslevel, long suppress, String suppressAlign,
			String currentText, String prevText,
			HashMap<Long, String> hmSuppressBindColumn, String displayType,
			String mask, XSSFSheet sheet, int excelRowIndex, int cellIndex)
			throws IOException {

		boolean bSuppress = false; // suppress 처리여부

		if (!prevText.equals(currentText)) {
			setCellValue(currentCell, displayType, currentText, cellStyle, mask);

			// excel에서 middle,over는 middle과 같다.
			if (suppressAlign.equals("middle")
					|| suppressAlign.equals("middle,over")) {
				bSuppress = isPossibleToSuppress(dataset, currRow, suppress,
						hmSuppressBindColumn);

				if (bSuppress) {
					setSuppressAlignMiddle(sheet, dataset, currRow, cellIndex,
							prevText, excelRowIndex, prevCell.getColumnIndex());
				}
			}

		} else if (prevText.equals(currentText)) {

			bSuppress = false;
			if (suppress > 1) {
				bSuppress = isPossibleToSuppress(dataset, currRow, suppress,
						hmSuppressBindColumn);

				if (bSuppress) {
					setBorderNoneToCell(prevCell, currentCell);

				} else {
					setCellValue(currentCell, displayType, currentText,
							cellStyle, mask);
				}

				// 1레벨 suppress 처리
			} else {
				setBorderNoneToCell(prevCell, currentCell);
			}

			// 마지막 row일 경우 변경된 text가 없어도 suppressalign middle 강제처리로 가운데 정렬.
			if ((currRow + 1 == dataset.getRowCount())
					&& (suppressAlign.equals("middle") || suppressAlign
							.equals("middle,over"))) {
				bSuppress = isPossibleToSuppress(dataset, currRow, suppress,
						hmSuppressBindColumn);

				if (bSuppress) {
					setSuppressAlignMiddle(sheet, dataset, currRow, cellIndex,
							prevText, excelRowIndex, prevCell.getColumnIndex());
				}

			}

		}

	}

	/**
	 * suppress 처리시 border 처리 이전셀의 하단, 현재셀의 상단 border를 없앤다.
	 * 
	 * @param prevCell
	 *            이전 sheet cell
	 * @param currentCell
	 *            현재 sheet cell
	 */
	public void setBorderNoneToCell(XSSFCell prevCell, XSSFCell currentCell) {
		XSSFCellStyle cloneStyle;
		cloneStyle = (XSSFCellStyle) prevCell.getCellStyle().clone();
		cloneStyle.setBorderBottom(CellStyle.BORDER_NONE);
		prevCell.setCellStyle(cloneStyle);

		cloneStyle = (XSSFCellStyle) currentCell.getCellStyle().clone();
		cloneStyle.setBorderTop(CellStyle.BORDER_NONE);
		currentCell.setCellStyle(cloneStyle);
	}

	/**
	 * suppressAlign middle 처리
	 * 
	 * @param sheet
	 * @param dataset
	 * @param datasetRowIndex
	 * @param cellIndex
	 * @param prevText
	 * @param excelRowIndex
	 * @param excelColumnIndex
	 */
	public void setSuppressAlignMiddle(XSSFSheet sheet, DataSet dataset,
			int datasetRowIndex, int cellIndex, String prevText,
			int excelRowIndex, int excelColumnIndex) {

		int startRowIndex = excelRowIndex;
		int endRowIndex = excelRowIndex - 1;

		int startColumnIndex = excelColumnIndex;
		int endColumnIndex = excelColumnIndex;
		int rowIndex = datasetRowIndex - 1;

		String upperText = "";
		for (; rowIndex > -1; rowIndex--) {
			upperText = dataset.getString(rowIndex, cellIndex);

			if (prevText.equals(upperText)) {
				startRowIndex--;
			} else {
				break;
			}
		}

		// merge 시킬 영역설정
		CellRangeAddress region = new CellRangeAddress(startRowIndex,
				endRowIndex, startColumnIndex, endColumnIndex);
		// merge 실행
		sheet.addMergedRegion(region);

	}

	/**
	 * suppresslevel이 "allskip"인 경우. text 및 border 처리
	 * 
	 * @param currentCell
	 *            현재 cell
	 * @param prevCell
	 *            이전 row의 cell
	 * @param cellStyle
	 *            cell style
	 * @param currentText
	 *            현재 text
	 * @param prevText
	 *            이전 row의 text
	 * @param displayType
	 *            Grid > cell displaytype 속성값
	 * @param mask
	 *            Grid > cell mask 속성값
	 * @throws IOException
	 */
	public void setAllskipSuppress(XSSFCell currentCell, XSSFCell prevCell,
			XSSFCellStyle cellStyle, String currentText, String prevText,
			String displayType, String mask) throws IOException {

		XSSFCellStyle cloneStyle;

		if (!prevText.equals(currentText)) {
			setCellValue(currentCell, displayType, currentText, cellStyle, mask);

		} else {
			// 이전셀의 하단, 현재셀의 상단 border를 없앤다.
			setBorderNoneToCell(prevCell, currentCell);
		}

	}

	/**
	 * 시트생성이 완료 되면 컬럼의 폭을 해당 컬럼의 최대 사이즈로 맞추기 위해 컬럼인덱스에 최대사이즈를 보관한다.
	 * 
	 * @param columnIndex
	 * @param width
	 */
	public void setMaxColumnWidth(int columnIndex, int width) {
		if (hmMaxColumnWidth.containsKey(columnIndex)) {

			int maxWidth = hmMaxColumnWidth.get(columnIndex);

			if (width > maxWidth) {
				hmMaxColumnWidth.put(columnIndex, width);

				// 큰 값이 들어왔을 경우에는 제거.
				if (hmResizeColumn.containsKey(columnIndex))
					hmResizeColumn.remove(columnIndex);

			} else if (width < maxWidth) {
				// 추후에 컬럼폭을 갱신할 컬럼 index만 보관후 처리한다.
				hmResizeColumn.put(columnIndex, columnIndex);
			}

		} else {
			hmMaxColumnWidth.put(columnIndex, width);
		}
	}

	/**
	 * 컬럼의 폭을 해당 컬럼의 최대 사이즈로 맞춘다.
	 * 
	 * @param sheet
	 */
	public void checkMaxColumnWidth(XSSFSheet sheet) {
		int size = hmResizeColumn.size();
		if (size == 0)
			return;

		int index = 0;
		int value, width;

		for (Integer key : hmResizeColumn.keySet()) {
			value = hmResizeColumn.get(key);
			width = hmMaxColumnWidth.get(value);
			sheet.setColumnWidth(value, width);
		}

	}

	/**
	 * poi cell에 value를 설정할 때 displayType에 따라 cellType을 설정한다.
	 * 
	 * @param bandCell
	 * @param displayType
	 * @param text
	 * @param cellStyle
	 * @param mask
	 * @throws IOException
	 */
	public void setCellValue(Cell bandCell, String displayType,
			String text, CellStyle cellStyle, String mask)
			throws IOException { // throws IOException{
		displayType = displayType.toLowerCase();
		XSSFDataFormat dataFormat = wb.createDataFormat();

		displayType = displayType.toLowerCase();
		
		if (displayType.equals("int") || displayType.equals("float") || displayType.equals("number")) {
			text = text.replace(",", "");

			double L = Double.parseDouble(text);
			bandCell.setCellValue(L);
			bandCell.setCellType(Cell.CELL_TYPE_NUMERIC);

			if (mask != null && !mask.isEmpty()) {
				cellStyle.setDataFormat(dataFormat.getFormat(mask));
				
			} 
//			else if(!displayType.equals("float")) {
//				cellStyle.setDataFormat(dataFormat.getFormat("#,##0"));
//			}
			
			

		} else if (displayType.equals("bigdecimal")) {
			// TODO 검증필요
			bandCell.setCellValue(new BigDecimal(text).doubleValue());
			bandCell.setCellType(Cell.CELL_TYPE_NUMERIC);

			if (mask != null && !mask.isEmpty())
				cellStyle.setDataFormat(dataFormat.getFormat(mask));

		} else if ((mask != null && !mask.isEmpty())
				&& (displayType.equals("date")
						|| displayType.equals("datetime") || displayType
						.equals("time"))) {
			bandCell.setCellValue(text);
			bandCell.setCellType(Cell.CELL_TYPE_STRING);

			mask = mask.replace("hh", "HH"); // XPLATFORM 12시간 표시형식을 DATE 24시간
												// 표시형식으로 변환

			String maskedText = maskFormatForDate.getMaskFormatString(text,
					mask, "");
			if (!maskedText.equals(""))
				bandCell.setCellValue(maskedText);

		} else if (displayType.equals("image")) {

			if (text != null && text.indexOf("http://") > -1) {
				int pictureIdx = -1;

				if (hmPicture.containsKey(text)) {
					pictureIdx = hmPicture.get(text);

				} else {
					// 확장자에 따른 picture format 정의
					String[] expandedPath = text.split("\\.");
					String extension = expandedPath[expandedPath.length - 1];

					int pictureFormat = extension.equalsIgnoreCase("png") ? Workbook.PICTURE_TYPE_PNG
							: Workbook.PICTURE_TYPE_JPEG;

					InputStream is = new URL(text).openStream();
					byte[] bytes = IOUtils.toByteArray(is);
					pictureIdx = wb.addPicture(bytes, pictureFormat);
					is.close();

					// 재사용을 위한 보관
					hmPicture.put(text, pictureIdx);
				}

				Sheet sheet = bandCell.getSheet();

				// Create the drawing patriarch. This is the top level container
				// for all shapes.
				// sheet에 1개만 생성됨.
				Drawing drawing = sheet.createDrawingPatriarch();

				// A client anchor is attached to an excel worksheet.
				// It anchors against top-left and bottom-right cells.
				XSSFClientAnchor anchor = helper.createClientAnchor();
				anchor.setCol1(bandCell.getColumnIndex());
				anchor.setRow1(bandCell.getRowIndex());

				Picture pict = drawing.createPicture(anchor, pictureIdx);

				// Reset the image to the original size.
				pict.resize();
			}

		} else {
			bandCell.setCellValue(text);
			bandCell.setCellType(Cell.CELL_TYPE_STRING);

			if (mask != null && !mask.isEmpty()) {
				String maskedText = maskFormat.getMaskFormatString(text, mask,
						"");
				if (!maskedText.equals(""))
					bandCell.setCellValue(maskedText);

			}
		}
	}

	/**
	 * font face/ size/ type에 해당하는 Font 객체를 반환한다. 생성된 폰트는 재사용을 위해 hashMap에 보관한다.
	 * workbook에서 폰트객체의 최대허용 갯수는 32767 이다.
	 * 
	 * @param face
	 *            폰트명
	 * @param size
	 *            폰트사이즈
	 * @param type
	 *            폰트타입(bold italic underline strikeout)
	 * @param fontColor
	 *            폰트색
	 * @return XSSFFont
	 */
	public XSSFFont getFont(String face, Long size, String type,
			String fontColor) {
		String faceSizeType = face + size.toString() + type + fontColor;

		if (hmFont.containsKey(faceSizeType)) {
			return hmFont.get(faceSizeType);

		} else {
			XSSFFont font = wb.createFont();
			font.setFontName(face);
			font.setFontHeightInPoints(size.shortValue());

			if (type.length() != 0) {
				if (type.indexOf("bold") > -1)
					font.setBoldweight(font.BOLDWEIGHT_BOLD);

				if (type.indexOf("italic") > -1)
					font.setItalic(true);

				if (type.indexOf("underline") > -1)
					font.setUnderline(font.U_SINGLE);

				if (type.indexOf("strikeout") > -1)
					font.setStrikeout(true);

			}

			hmFont.put(faceSizeType, font);

			return font;
		}

	}

	/**
	 * 주어진 arguments에 해당하는 CellStyle 객체를 반환한다. CellStyle 객체는 재사용된다.
	 * 
	 * @param displayType
	 * @param hAlign
	 * @param vAlign
	 * @param faceSizeType
	 * @param font
	 * @param fontColor
	 * @param backgroundColor
	 * @param mask
	 * @param line
	 * @param isSetBorder
	 * @return XSSFCellStyle
	 */
	public XSSFCellStyle getCellStyle(String displayType, String hAlign,
			String vAlign, String faceSizeType, Font font,
			String fontColor, String backgroundColor, String mask, String line,
			boolean isSetBorder) {

		String key = hAlign + vAlign + faceSizeType + fontColor
				+ backgroundColor + mask + line;

		//System.out.println("\n  ■ getCellStyle");
		//System.out.println("key=" + key);
		

		if (hmCellStyle.containsKey(key)) {
			//System.out.println("존재 key= " + key + " ,hAlign=" + hAlign + " ,vAlign=" + vAlign);
			return hmCellStyle.get(key);

		} else {
			//System.out.println("*없음 key= " + key + " ,hAlign=" + hAlign + " ,vAlign=" + vAlign);
			XSSFCellStyle cellStyle = wb.createCellStyle();

			if (fontColor.indexOf("#") > -1) {
				Color convertColor = hexToColorObject(fontColor);

				XSSFColor xssfColor = new XSSFColor(convertColor);
				font.setColor(xssfColor.getIndexed());

			} else {

				// 검정색으로 지정
				fontColor = "#000000";
				Color convertColor = hexToColorObject(fontColor);
				XSSFColor xssfColor = new XSSFColor(convertColor);
				font.setColor(xssfColor.getIndexed());

				// TODO 색상으로 처리해야 할 경우 참고.
				// http://stackoverflow.com/questions/3772098/how-does-java-awt-color-getcolorstring-colorname-work

			}

			cellStyle.setFont(font);

			if (hAlign == null)
				hAlign = "center";

			if (vAlign == null)
				vAlign = "middle";

			// horizontal align
			if (hAlign.equals("left")) {
				cellStyle.setAlignment((short) 1);

			} else if (hAlign.equals("center")) {
				cellStyle.setAlignment((short) 2);

			} else if (hAlign.equals("right")) {
				cellStyle.setAlignment((short) 3);
			}

			// vertical align
			if (vAlign.equals("top")) {
				cellStyle.setVerticalAlignment((short) 0);

			} else if (vAlign.equals("middle")) {
				cellStyle.setVerticalAlignment((short) 1);

			} else if (vAlign.equals("bottom")) {
				cellStyle.setVerticalAlignment((short) 2);
			}

			if (isSetBorder) {
				short borderType = CellStyle.BORDER_THIN;
				short borderNoneType = CellStyle.BORDER_NONE;
				short applyBoderType, applyBoderType1, applyBoderType2, applyBoderType3;

				if (line.equals("")) {
					cellStyle.setBorderRight(borderType);
					cellStyle.setBorderLeft(borderType);
					cellStyle.setBorderTop(borderType);
					cellStyle.setBorderBottom(borderType);

				} else {
					ArrayList lineWidth = new ArrayList();
					ArrayList lineColor = new ArrayList();

					//System.out.println("line=" + line);

					String[] lineBorder = line.split(",");

					int len = lineBorder.length;
					for (int i = 0; i < len; i++) {

						String[] eachLine = lineBorder[i].split("_");

						lineWidth.add(eachLine[0]);
						lineColor.add(eachLine[2]);
					}

					int lineWidthSize = lineWidth.size();

					// 1회 입력: 전체 border에 공통 적용
					if (lineWidthSize == 1) {
						// top
						applyBoderType = getApplyBoderType(
								(String) lineWidth.get(0), borderType,
								borderNoneType);

						setBorderToCellStyle(cellStyle, applyBoderType,
								applyBoderType, applyBoderType, applyBoderType);

						XSSFColor xssfColor = hexToXSSFColor((String) lineColor
								.get(0));
						setBorderColorToCellStyle(cellStyle, xssfColor,
								xssfColor, xssfColor, xssfColor);

						// 2회 입력: 수평, 수직을 각각 적용
					} else if (lineWidthSize == 2) {
						// 수평 : top & bottom
						applyBoderType = getApplyBoderType(
								(String) lineWidth.get(0), borderType,
								borderNoneType);

						// 수직 : right & left
						applyBoderType1 = getApplyBoderType(
								(String) lineWidth.get(1), borderType,
								borderNoneType);

						setBorderToCellStyle(cellStyle, applyBoderType,
								applyBoderType1, applyBoderType,
								applyBoderType1);

						XSSFColor xssfColor = hexToXSSFColor((String) lineColor
								.get(0));
						XSSFColor xssfColor1 = hexToXSSFColor((String) lineColor
								.get(1));
						setBorderColorToCellStyle(cellStyle, xssfColor,
								xssfColor1, xssfColor, xssfColor1);

						// 3회 입력: top, left & right, bottom
					} else if (lineWidthSize == 3) {
						// top
						applyBoderType = getApplyBoderType(
								(String) lineWidth.get(0), borderType,
								borderNoneType);

						// right & left
						applyBoderType1 = getApplyBoderType(
								(String) lineWidth.get(1), borderType,
								borderNoneType);

						// bottom
						applyBoderType2 = getApplyBoderType(
								(String) lineWidth.get(2), borderType,
								borderNoneType);

						setBorderToCellStyle(cellStyle, applyBoderType,
								applyBoderType1, applyBoderType2,
								applyBoderType1);

						XSSFColor xssfColor = hexToXSSFColor((String) lineColor
								.get(0));
						XSSFColor xssfColor1 = hexToXSSFColor((String) lineColor
								.get(1));
						XSSFColor xssfColor2 = hexToXSSFColor((String) lineColor
								.get(2));

						setBorderColorToCellStyle(cellStyle, xssfColor,
								xssfColor1, xssfColor2, xssfColor1);

						// 4회 입력: 각각 top, right, bottom, left 항목에 적용
					} else if (lineWidthSize == 4) {
						// top
						applyBoderType = getApplyBoderType(
								(String) lineWidth.get(0), borderType,
								borderNoneType);

						// right
						applyBoderType1 = getApplyBoderType(
								(String) lineWidth.get(1), borderType,
								borderNoneType);

						// bottom
						applyBoderType2 = getApplyBoderType(
								(String) lineWidth.get(2), borderType,
								borderNoneType);

						// left
						applyBoderType3 = getApplyBoderType(
								(String) lineWidth.get(3), borderType,
								borderNoneType);

						setBorderToCellStyle(cellStyle, applyBoderType,
								applyBoderType1, applyBoderType2,
								applyBoderType3);

						XSSFColor xssfColor = hexToXSSFColor((String) lineColor
								.get(0));
						XSSFColor xssfColor1 = hexToXSSFColor((String) lineColor
								.get(1));
						XSSFColor xssfColor2 = hexToXSSFColor((String) lineColor
								.get(2));
						XSSFColor xssfColor3 = hexToXSSFColor((String) lineColor
								.get(3));

						setBorderColorToCellStyle(cellStyle, xssfColor,
								xssfColor1, xssfColor2, xssfColor3);

					}

				}
			}

			cellStyle.setWrapText(true); // Setting this flag to true make all
											// content visible whithin a cell by
											// displaying it on multiple lines

			if (backgroundColor.indexOf("#") > -1) {
				Color convertColorBg = hexToColorObject(backgroundColor);
				XSSFColor xssfBackgroundColor = new XSSFColor(convertColorBg);
				cellStyle.setFillForegroundColor(xssfBackgroundColor);
				cellStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);

			} else {
				// 흰색으로 지정
				backgroundColor = "#FFFFFF";
				Color convertColorBg = hexToColorObject(backgroundColor);
				XSSFColor xssfBackgroundColor = new XSSFColor(convertColorBg);
				cellStyle.setFillForegroundColor(xssfBackgroundColor);
				cellStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);

			}

			hmCellStyle.put(key, cellStyle);

			return cellStyle;
		}

	}

	/**
	 * border width에 따른 type 반환. [주의] 현재는 border 유무만 처리.
	 * 
	 * @param width
	 * @param borderType
	 * @param borderNoneType
	 * @return border 적용 또는 미적용 타입
	 */
	public short getApplyBoderType(String width, short borderType,
			short borderNoneType) {

		if (width.equals("0")) {
			return borderNoneType;
		} else {
			return borderType;
		}
	}

	/**
	 * hex 컬러값으로 java.awt.Color 객체로 변환 후 반환한다.
	 * 
	 * @param hexColor
	 *            e.g. "#FFFFFF"
	 * @return java.awt.Color 객체
	 */
	public static Color hexToColorObject(String hexColor) {
		// white를 poi의 Color로 변환시 검정색으로 표시됨. 255 -> 0으로 되는 것 같음.
		// 마찬가지로 black은 0 -> 255.
		// 이를 방지하기 위해 Blue값을 1개씩 조절.(255,255,254) 또는 (0,0,1)와 동일.
		hexColor = hexColor.substring(0, 7); // alpha 값 존재시 제거용도. e.g #FFFFFFFF
		if (hexColor.equalsIgnoreCase("#FFFFFF")) {
			hexColor = "#FFFFFE";
		} else if (hexColor.equalsIgnoreCase("#000000")) {
			hexColor = "#000001";
		}

		try {
			return new Color(Integer.valueOf(hexColor.substring(1, 3), 16),
					Integer.valueOf(hexColor.substring(3, 5), 16),
					Integer.valueOf(hexColor.substring(5, 7), 16));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			System.out.println("\n\n▨hexColor=" + hexColor);
			throw e;
		}
	}

	/**
	 * hex 컬러값에 해당하는 XSSFColor 객체 반환.
	 * 
	 * @param hexColor
	 *            e.g. "#FFFFFF"
	 * @return XSSFColor
	 */
	public XSSFColor hexToXSSFColor(String hexColor) {
		if (hmXSSFColor.containsKey(hexColor)) {
			return hmXSSFColor.get(hexColor);

		} else {
			Color convertColor = hexToColorObject(hexColor);
			XSSFColor xssfColor = new XSSFColor(convertColor);

			hmXSSFColor.put(hexColor, xssfColor);
			return xssfColor;
		}
	}

	/**
	 * color를 cellStyle boder에 적용한다.
	 * 
	 * @param cellStyle
	 * @param topColor
	 * @param rightColor
	 * @param bottomColor
	 * @param leftColor
	 */
	public void setBorderColorToCellStyle(XSSFCellStyle cellStyle,
			XSSFColor topColor, XSSFColor rightColor, XSSFColor bottomColor,
			XSSFColor leftColor) {

		cellStyle.setTopBorderColor(topColor);
		cellStyle.setRightBorderColor(rightColor);
		cellStyle.setBottomBorderColor(bottomColor);
		cellStyle.setLeftBorderColor(leftColor);
	}

	/**
	 * border를 cellStyle에 적용한다.
	 * 
	 * @param cellStyle
	 * @param topBorder
	 * @param rightBorder
	 * @param bottomBorder
	 * @param leftBorder
	 */
	public void setBorderToCellStyle(XSSFCellStyle cellStyle, short topBorder,
			short rightBorder, short bottomBorder, short leftBorder) {

		cellStyle.setBorderTop(topBorder);
		cellStyle.setBorderRight(rightBorder);
		cellStyle.setBorderBottom(bottomBorder);
		cellStyle.setBorderLeft(leftBorder);
	}

	/**
	 * merge 대상이 되는 cell을 생성한다. merge 시킬 곳에 style( e.g. border)을 적용하려면 먼저 해당
	 * cell에 style을 적용하고 merge를 시켜야 한다.
	 * 
	 * @param sheet
	 *            대상 sheet
	 * @param region
	 *            체크영역
	 * @param cellStyle
	 *            영역에 적용할 cellStyle
	 */
	private void setCellStyleBeforeMerge(XSSFSheet sheet,
			CellRangeAddress region, CellStyle cellStyle) {

		int lastRow = region.getLastRow();
		for (int rowNum = region.getFirstRow(); rowNum <= lastRow; rowNum++) {
			XSSFRow row = sheet.getRow(rowNum);

			if (row == null) {
				row = sheet.createRow(rowNum);
			} else {
				// System.out.println("row 존재: "+rowNum);
			}

			int lastColumn = region.getLastColumn();
			for (int colNum = region.getFirstColumn(); colNum <= lastColumn; colNum++) {

				XSSFCell currentCell = row.getCell(colNum);

				if (currentCell == null) {
					currentCell = row.createCell(colNum);
				} else {
					// System.out.println("   cell 존재: "+rowNum+":"+colNum);
				}

				currentCell.setCellStyle(cellStyle);
			}
		}

	}

	/**
	 * 그리드 row size를 엑셀 row size로 변환한다.
	 * 
	 * @param first
	 * @param second
	 * @return 엑셀 row height
	 */
	public double getExcelRowHeight(String size) {
		if (hmRowHeight.containsKey(size)) {
			return hmRowHeight.get(size);

		} else {
			double convertValue;
			BigDecimal height, adjustValue, result;

			height = new BigDecimal(size);
			adjustValue = new BigDecimal(rowAdjustValue);
			result = height.multiply(adjustValue);

			// 소수점 2자리까지 사용
			convertValue = Math.round(result.doubleValue() * 100) / 100.0;
			hmRowHeight.put(size, convertValue);

			return convertValue;
		}

	}

}

package egovframework.ntrms.kr.co.ext.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.exceptions.OpenXML4JException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.eventusermodel.XSSFReader;
import org.apache.poi.xssf.model.SharedStringsTable;
import org.apache.poi.xssf.usermodel.XSSFRichTextString;
import org.xml.sax.Attributes;
import org.xml.sax.ContentHandler;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.DefaultHandler;
import org.xml.sax.helpers.XMLReaderFactory;

import com.nexacro.xapi.data.ColumnHeader;
import com.nexacro.xapi.data.DataSet;
import com.nexacro.xapi.data.DataTypes;
import com.nexacro.xapi.data.PlatformData;

public class ExcelReaderWithSAX {
	ArrayList<DataSet> dataSetList = new ArrayList<DataSet>();
	final private XSSFReader reader;
	static Logger log = Logger.getLogger(ExcelReaderWithSAX.class.getName());
	
	public ExcelReaderWithSAX(File excelFile)
	throws IOException, OpenXML4JException, SAXException {
		FileInputStream fis = new FileInputStream(excelFile);
		OPCPackage pkg = OPCPackage.open(fis);
		reader = new XSSFReader(pkg);
		this.readSheet();
	}
	
	public void readSheet() throws IOException, InvalidFormatException {
		XSSFReader.SheetIterator it = (XSSFReader.SheetIterator) reader.getSheetsData();
		
		int index = 1;
		while(it.hasNext()){
			InputStream stream = it.next();
			String sheetName = it.getSheetName();
			stream.close();

			log.debug("\n\t === Start Sheet === [index=" + index + "]: " + sheetName);
			
			DataSet ds = new DataSet("ds_excel_" + (index - 1));
			ds.addConstantColumn("sheetName", DataTypes.STRING,(short)256, sheetName);  
			SheetRowCallBack callback = new SheetRowCallBack();
			callback.setDataset(ds);
			
			try {
				this.processOneSheet(reader, index, ds, callback);
				convertSheetToDataSet(callback, ds);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			dataSetList.add(ds);
			
			log.debug("\t === End Sheet === [index=" + index + "]: " + sheetName);

			index++;
		}		
		
		
	}
	
	
	//public String getDataSet() {
	public void getDataSet(PlatformData resData) {
		int datasetCount = dataSetList.size();
		String data = "";
		DataSet ds;
		
		for(int i=0; i<datasetCount; i++ ) {
            ds = dataSetList.get(i);
            resData.addDataSet(ds);
		}

	}
	
	
	/*
	 * Sheet data를 dataset으로 변환
	 */
	public void convertSheetToDataSet(SheetRowCallBack callback, DataSet ds) {
		int columnCount = callback.getMaxColumnCount();
		
		//log.debug("convertSheetToDataSet > columnCount="+columnCount);
		
		if(columnCount < 1) {
			//log.debug(ds.saveXml());
			return;
		}
		
		createColumn(ds, columnCount);
		
		callback.convertDataToDataset(ds);
		//log.debug(ds.saveXml());
	}
	
	/*
	 * Dataset Column 생성
	 */
	private void createColumn(DataSet ds, int columnCount) {
		int colType = DataTypes.STRING;
		for(int i=0; i<columnCount; i++) {
			ds.addColumn(new ColumnHeader("Column" + i, colType));
		}
	}
	
	public void processOneSheet(XSSFReader reader, int index, DataSet ds, SheetRowCallBack callback) throws Exception {
		SharedStringsTable sst = reader.getSharedStringsTable();

		XMLReader parser = fetchSheetParser(sst, ds, callback);

		// rId2 found by processing the Workbook
		// Seems to either be rId# or rSheet#
		InputStream sheet2 = reader.getSheet("rId" + index);
		InputSource sheetSource = new InputSource(sheet2);
		parser.parse(sheetSource);
		sheet2.close();
	}
	
	public XMLReader fetchSheetParser(SharedStringsTable sst, DataSet ds, SheetRowCallBack callback) throws SAXException {
		XMLReader parser =
			XMLReaderFactory.createXMLReader(
					"org.apache.xerces.parsers.SAXParser"
			);
		ContentHandler handler = new SheetHandler(sst, ds, callback);
		parser.setContentHandler(handler);
		return parser;
	}	

	/** 
	 * See org.xml.sax.helpers.DefaultHandler javadocs 
	 */
	private static class SheetHandler extends DefaultHandler {
		static private enum CellType {
			non, num, staticText, sharedText
		};
		
		final private SharedStringsTable sst;
		final private DataSet ds;
		private SheetRowCallBack callback;
		private int currentIndex = -1;
		private int columnCount = 0;
		private ArrayList<Object> values;
		
		private String lastContents;
		private CellType cellType;
		//private int thisColumn = -1;

		
		private SheetHandler(SharedStringsTable sst, DataSet ds, SheetRowCallBack callback) {
			this.sst = sst;
			this.ds = ds;
			this.callback = callback;
			values = new ArrayList<Object>();
		}
		
		public void startElement(String uri, String localName, String name,
				Attributes attributes) throws SAXException {
			
//		    System.out.println("Start element: local name: " + localName + " qname: " 
//                    + name + " uri: "+uri);
//		    int attrCount = attributes.getLength();
//		    if(attrCount>0) {
//		    	System.out.println("\n\tAttributes:"); 
//		    	for(int i = 0 ; i<attrCount ; i++) {
//		    		System.out.println("  Name : " + attributes.getQName(i)); 
//		    		System.out.println("  Type : " + attributes.getType(i)); 
//		    		System.out.println("  Value: " + attributes.getValue(i)); 
//		    	}
//		    }

			
			//System.out.print("startElement  localName="+ localName +",localName="+ name );
			if("row".equals(name)) {
				//System.out.println("\tstartElement Start Row");
				this.currentIndex = -1;
			}
			// c => cell
			else if("c".equals(name)) {
				
				// Figure out if the value is an index in the SST
				String type = attributes.getValue("t");
				if (type == null) {
					cellType = CellType.num;
				} else if (type.equals("s")) {
					cellType = CellType.sharedText;
				} else if (type.equals("str")) {
					cellType = CellType.staticText;
				} else {
					cellType = CellType.non;
				}
				
				columnCount++;
				currentIndex++;
				values.add(currentIndex, "");					
			}
			// Clear contents cache
			lastContents = "";
		}
		
		public void endElement(String uri, String localName, String name)
				throws SAXException {
			if("row".equals(name)) {
				//System.out.println("\tendElement End Row callback 호출");
				this.currentIndex = -1;
				
				callback.setMaxColumnCount(columnCount);
				callback.handleRow(values);
				
				columnCount = 0;
				
				values.clear();
				return;		
				
			} else if (name.equals("c")) {
				cellType = CellType.non;
				return;
			} else if (name.equals("v")) {

				String val = null;

				// Process the last contents as required.
				// Do now, as characters() may be called more than once
				if (cellType == CellType.sharedText) {
					int idx;
					idx = Integer.parseInt(lastContents);
					val = new XSSFRichTextString(sst.getEntryAt(idx))
							.toString();
				} else if (cellType == CellType.staticText
						|| cellType == CellType.num) {
					val = lastContents;
				}

				// v => contents of a cell
				// Output after we've seen the string contents
				if (val != null) {
					values.remove(currentIndex);
					values.add(currentIndex, val);
					
					//System.out.println("value=" + val);
				}
			}			
		}

		public void characters(char[] ch, int start, int length)
				throws SAXException {
			
			//System.out.println("\t\tcharacters: " + new String(ch, start, length));
			lastContents += new String(ch, start, length);
			
		}
		
        /**
         * Converts an Excel column name like "C" to a zero-based index.
         *
         * @param name
         * @return Index corresponding to the specified name
         */
        private int nameToColumn(String name) {
            int column = -1;
            for (int i = 0; i < name.length(); ++i) {
                int c = name.charAt(i);
                column = (column + 1) * 26 + c - 'A';
            }
            return column;
        }		
	}	
	
}

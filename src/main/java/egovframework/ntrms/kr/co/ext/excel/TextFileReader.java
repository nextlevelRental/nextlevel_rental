package egovframework.ntrms.kr.co.ext.excel;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

//Apache POI : http://poi.apache.org 
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;


//nexacro
import com.nexacro.xapi.data.ColumnHeader;
import com.nexacro.xapi.data.DataSet;
import com.nexacro.xapi.data.DataTypes;
import com.nexacro.xapi.data.PlatformData;

public class TextFileReader {

    public TextFileReader() throws FileNotFoundException {

    }
    
    //public String getDataSet(String filePath, String charset) {
    public void getDataSet(String filePath, String charset, PlatformData resData) {
    	//System.out.println("수신된 filePath= " + filePath);
    	
    	if(charset == null || charset.equals("")) charset = "UTF8";
    	
    	BufferedReader br = null;
    	String line = "";
    	//String splitBy = "\t"; //",";
    	String xml = "";
    	
    	DataSet ds = new DataSet("ds_output");
    	int columnIndex = 0;
    	int nRowIdx = -1;
    	ds.addColumn(new ColumnHeader("data", DataTypes.STRING));
    	
    	try {
    		br = new BufferedReader(new InputStreamReader(
                    new FileInputStream(filePath), charset));
        	
    		while ((line = br.readLine()) != null) {
    			nRowIdx = ds.newRow();
    			ds.set(nRowIdx, columnIndex, line);
    			System.out.println(nRowIdx + " : " + line);
    		        // use comma as separator
    			//String[] data = line.split(splitBy);
     
    			//System.out.println("가= " + data[0] + " , 나=" + data[1]);
    		}            
            
    		resData.addDataSet(ds);
//    		if(reciveDataType.equalsIgnoreCase("xml")){
//        		xml = ds.saveXml();
//        		//return xml;
//    			
//    		} else { //ssv
//    			resData.addDataSet(ds);
//    			//return "";
//    		}
    		
    		
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage(), e);
        }    	
    }
	
	
}

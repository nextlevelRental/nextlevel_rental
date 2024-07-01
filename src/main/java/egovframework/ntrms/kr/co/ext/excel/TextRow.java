package egovframework.ntrms.kr.co.ext.excel;

/*
Copyright [2013] [EcoSystem of TOBESOFT]

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


import java.util.ArrayList;

import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.hssf.record.*;
import org.apache.poi.hssf.model.*;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;

//json-simple
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;

/**
 * textRow와 label 처리용 class
 * @author EcoSystem of TOBESOFT
 *
 */
public class TextRow {
	String fontFace, fontType = ""
			, fontColor = "#000000"
			, background = "#FFFFFF"
			, halign = "center", valign = "middle";
	String text, type;
	
	long fontSize, lineCount = 0;
	Row  bandRow;
    int startCol, columnBoxMaxRight = 0;
	int contentsSize;
    
    
	/**
	 * @param type "textRow" 또는 "label"
	 * @param contents json > box > contents
	 */
	public TextRow(String type, JSONArray contents) {
		contentsSize = contents.size();
		
		this.type = type;
		this.text = (String)contents.get(0);
		JSONObject jsonFont = (JSONObject)contents.get(1);
		this.fontFace = (String) jsonFont.get("face");
		this.fontSize = (Long) jsonFont.get("size");
		String fontType = (String) jsonFont.get("type");
		
		if(jsonFont.get("lineCount") != null) {
			
			Long tempLineCount = (Long) jsonFont.get("lineCount");
			this.lineCount = tempLineCount;
			
			//System.out.println(" >>>> TextRow 설정 > text="+this.text + ", tempLineCount="+tempLineCount);
		}
		else {
			//System.out.println("TextRow 설정  count 없음." +this.text);
		}		
		
		if(fontType != null && fontColor.length() > 0) this.fontType = fontType;
		
		
		if(contentsSize == 2) return;
		
		String fontColor = (String)contents.get(2);
		if(fontColor != null && fontColor.length() > 0) this.fontColor = fontColor; 
		
		
		if(contentsSize == 3) return;
		
		String background = (String)contents.get(3);
		if(background != null  && fontColor.length() > 0) this.background = background; 
		
		
		if(contentsSize == 4) return;
		
		String halign = (String)contents.get(4);
		if(halign != null  && halign.length() > 0) this.halign = halign; 		
		
		if(contentsSize == 5) return;
		
		String valign = (String)contents.get(5);
		if(valign != null  && valign.length() > 0) this.valign = valign; 			
		
	}
	
    public void setBandRow(Row bandRow2) {
		this.bandRow = bandRow2;
	}

	public void setStartCol(int startCol) {
		this.startCol = startCol;
	}
	
    public void setColumnBoxMaxRight(int columnBoxMaxRight) {
		this.columnBoxMaxRight = columnBoxMaxRight;
	}	

}

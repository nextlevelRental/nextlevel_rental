(function()
{
    return function()
    {
        if (!this._is_form)
            return;
        
        this.on_create = function()
        {
            // Declare Reference
            var obj = null;
            
            if (Form == this.constructor) {
                this.set_name("ExcelImportStep3");
                this.set_classname("ExcelImportStep3");
                this.set_titletext("step3: column mappings");
                this._setFormPosition(0,0,500,600);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_allData", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_mapping", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"exclude\" type=\"INT\" size=\"1\"/><Column id=\"gridHeadText\" type=\"STRING\" size=\"256\"/><Column id=\"col\" type=\"STRING\" size=\"256\"/><Column id=\"bindColumn\" type=\"STRING\" size=\"256\"/><Column id=\"columnSize\" type=\"INT\" size=\"4\"/><Column id=\"excelColumnIndex\" type=\"STRING\" size=\"256\"/><Column id=\"excelColumnName\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_excelColumn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_preview", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_allTextFile", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "20", "24", "140", "26", null, null, this);
            obj.set_taborder("0");
            obj.set_text("1. column mappings");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "20", "328", "140", "26", null, null, this);
            obj.set_taborder("1");
            obj.set_text("2. data preview");
            this.addChild(obj.name, obj);

            obj = new Button("btn_apply", "absolute", "129", "328", "110", "26", null, null, this);
            obj.set_taborder("2");
            obj.set_text("Apply mapping");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_headerRow", "absolute", "245", "330", "200", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("A first row is a header row.");
            obj.set_value("true");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_mapping", "absolute", "20", "52", "460", "236", null, null, this);
            obj.set_taborder("4");
            obj.set_binddataset("ds_mapping");
            obj.set_autofittype("col");
            obj.set_autoenter("select");
            obj.set_autoupdatetype("comboselect");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"180\"/><Column size=\"180\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"Exclusion\"/><Cell col=\"1\" text=\"Grid head\"/><Cell col=\"2\" text=\"Excel head\"/></Band><Band id=\"body\" style=\"cellline:1 solid #808080ff ;\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" style=\"align:center middle;\" text=\"bind:exclude\"/><Cell col=\"1\" style=\"padding:0 0 0 2;background:EXPR((exclude==1)?'darkgray':'');background2:EXPR((exclude==1)?'darkgray':'');\" text=\"bind:gridHeadText\"/><Cell col=\"2\" displaytype=\"combo\" edittype=\"combo\" style=\"align:left middle;padding:0 0 0 2;background:EXPR((exclude==1)?'darkgray':'');background2:EXPR((exclude==1)?'darkgray':'');\" text=\"bind:excelColumnIndex\" combodataset=\"ds_excelColumn\" combocodecol=\"code\" combodatacol=\"data\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_preview", "absolute", "20", "364", "460", "180", null, null, this);
            obj.set_taborder("5");
            obj.set_binddataset("ds_preview");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell style=\"align:left middle;padding:0 0 0 4;font:bold 9 Dotum;\" text=\"Grid head\"/><Cell row=\"1\" style=\"align:left middle;padding:0 0 0 4;font:bold 9 Dotum;\" text=\"Excel head\"/></Band><Band id=\"body\" style=\"cellline:1 solid #808080;\"><Cell text=\"Data\" suppress=\"1\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_prev", "absolute", "272", "553", "60", "30", null, null, this);
            obj.set_taborder("6");
            obj.set_text("Back");
            this.addChild(obj.name, obj);

            obj = new Button("btn_finish", "absolute", "346", "553", "60", "30", null, null, this);
            obj.set_taborder("7");
            obj.set_text("Finish");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_cancel", "absolute", "420", "552", "60", "30", null, null, this);
            obj.set_taborder("8");
            obj.set_text("Cancel");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 500, 600, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("ExcelImportStep3");
            		p.set_titletext("step3: column mappings");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ExcelImportStep3.xfdl", function() {

        

        

        
        this.initFormats = "";    //grid format Init. valiable.
        this.previewFormats = ""; //preview grid format.
        this.fileType = "";

        this.headTextList;

        //initForm()에서 전달받은 Dataset.
        // import된 데이터 정보를 가지고 있다.
        this.previewDataset;

        
        this.ExcelImportStep3_onload = function(obj,e)
        {
        	var ownFrame = this.getOwnerFrame();
        	var mainForm = ownFrame.form;
        	var dsSelectedData = mainForm.div_step2.dsSelectedData;

        	this.fileType = mainForm.div_step2.fileType;
        	
        	this.initForm(dsSelectedData);
        	
        }

        
        //init. form 
        this.initForm = function(previewDataset)
        {

        
        	this.btn_finish.set_enable(false);	
        	
        	this.previewDataset = previewDataset;
        	this.setTitleText();
        	this.setPreviewFormats();
        	this.setInitFormats();
        	
        	this.ds_mapping.set_enableevent(false);
        	
        	this.clearDataset();
        	this.setMappingColumn();
        	
        	this.ds_mapping.set_enableevent(true);
        }

        this.clearDataset = function()
        {
        	this.ds_excelColumn.clearData();
        	this.ds_mapping.clearData();
        	this.ds_preview.clear();
        }

        this.setTitleText = function()
        {
        	var ownFrame = this.getOwnerFrame();
        	ownFrame.set_showcascadetitletext(false);
        	ownFrame.set_titletext("Step 3 of 3: Column mappings");	
        }

        
        this.setPreviewFormats = function()
        {
        	var previewFormats = "";
        	previewFormats += "<Formats>";
        	previewFormats += "<Format id='default'>";
        	previewFormats += "  <Columns>";
        	previewFormats += "    <Column size='100' />";
        	previewFormats += "  </Columns>";
        	previewFormats += "  <Rows>";
        	previewFormats += "    <Row size='24' band='head' />";
        	previewFormats += "    <Row size='24' band='head' />";
        	previewFormats += "    <Row size='24' />";
        	previewFormats += "  </Rows>";
        	previewFormats += "  <Band id='head'>";
        	previewFormats += "    <Cell style='align:left&#32;middle;padding:0&#32;0&#32;0&#32;4;font:bold&#32;9&#32;Dotum;' text='Grid&#32;head'/>";
        	previewFormats += "    <Cell row='1' style='align:left&#32;middle;padding:0&#32;0&#32;0&#32;4;font:bold&#32;9&#32;Dotum;' text='Excel&#32;head'/>";
        	previewFormats += "  </Band>";
        	previewFormats += "  <Band id='body' style='cellline:1 solid #808080;'>";
        	previewFormats += "    <Cell text='Data' suppress='1'/>";
        	previewFormats += "  </Band>";
        	previewFormats += "</Format>";
        	previewFormats += "</Formats>";

        	this.previewFormats = previewFormats;
        }

        
        this.setInitFormats = function()
        {
        	var initFormats = "";
        	initFormats += "<Formats>";
        	initFormats += "<Format id='default'>";
        	initFormats += "</Format>";
        	initFormats += "</Formats>";

        	this.initFormats = initFormats;
        }

        /**
         * 컬럼매칭용 그리드 생성
         */
        this.setMappingColumn = function()
        {
        	var headTextList = this.getHeadTextList();
        	this.headTextList = headTextList;
        	
        	var bindColumnInfo = this.getBodyBindColumnInfo();
        	var textInfo, col, bindColumn;
        	var grid = this.parent.targetGrid;
        	var headTextLen = headTextList.length;
        	var dsMapping = this.ds_mapping;
        	var dsExcelColumn = this.ds_excelColumn;
        	
        	for(var i=0; i < headTextLen; i++)
        	{
        		textInfo = headTextList[i];
        		col = textInfo.col;
        		bindColumn = bindColumnInfo[col];
        		textInfo["bindColumn"] = bindColumn;
        		textInfo["columnSize"] = grid.getRealColSize(i);
        	}

        	
        	var row;
        	
        	var mappingGrid = this.grd_mapping;
        	mappingGrid.set_enableevent(false);
        	mappingGrid.set_enableredraw(false);
        	
        	var headInfo;
        	for(var i = 0; i < headTextLen; i++)
        	{
        		headInfo = headTextList[i];
        		row = dsMapping.addRow();
        		dsMapping.setColumn(row, "exclude", 0);
        		dsMapping.setColumn(row, "gridHeadText", headInfo.text);
        		dsMapping.setColumn(row, "col", headInfo.col);
        		dsMapping.setColumn(row, "bindColumn", headInfo.bindColumn);
        		dsMapping.setColumn(row, "columnSize", headInfo.columnSize);
        		dsMapping.setColumn(row, "excelColumnIndex", "-1");
        		
        	}	
        	
        	dsExcelColumn.addRow();
        	dsExcelColumn.setColumn(0, "code", "-1");
        	dsExcelColumn.setColumn(0, "data", "Unmatched");
        	
        	var previewDataset = this.previewDataset;
        	var sheetCount = previewDataset.getColCount();
        	var excelColumn;
        	var findRow = 0;

        	for(var i = 0; i < sheetCount; i++)
        	{
        		excelColumn = previewDataset.getColumn(0, i);
        		
        		row = dsExcelColumn.addRow();
        		dsExcelColumn.setColumn(row, "code", i);
        		dsExcelColumn.setColumn(row, "data", excelColumn.trim());
        		
        		findRow = dsMapping.findRow("gridHeadText", excelColumn);
        		
        		if(findRow > -1) dsMapping.setColumn(findRow, "excelColumnIndex", i);
        	}		

        	dsMapping.set_rowposition(-1);
        	
        	mappingGrid.set_enableevent(true);
        	mappingGrid.set_enableredraw(true);	
        	
        }

        
        /**
         * body 밴드 컬럼에 일치되는 head text 정보를 반환한다.
         * head가 multi row일 경우,
         *   body정보를 나타내는 마지막 row의 text만 추출한다. 
         * @return {array.<{number, string}>} column별 head text
         */
        this.getHeadTextList = function()
        {
        	var band = "head";
        	var grid = this.parent.targetGrid;
        	var cellCount = grid.getCellCount(band);
        	
        	if(cellCount == 0) return 0;

        	var col = 0;
        	var textInfo = {};
        	var textList = [];
        	var text;
        	for (var i = 0; i < cellCount; i++) 
        	{
        		col  = grid.getCellProperty(band, i,"col");
        		text = grid.getCellProperty(band, i,"text");
        		textInfo[col] = text;
        	}
        	
        	
        	//head값을 col 값의 내림차순에 따라 정렬한다.
        	for(var name in textInfo)
        	{
        		textList.push({col:name, text: textInfo[name]});
        	}
        	
        	textList = textList.sort(this.sortAsc);
        	
        	return textList;
        }

        
        /**
         * body 밴드의 cellIndex별 bind column 정보를 반환한다.
         * @return {object} bind column 목록
         */
        this.getBodyBindColumnInfo = function()
        {
        	//body의 bindColumn정보를 추출한다.
        	var band = "body";
        	var grid = this.parent.targetGrid;
        	var bodyCellCount = grid.getCellCount(band);
        	var tempText;
        	var bindColumnInfo = {};
        	for (var i = 0; i < bodyCellCount; i++) 
        	{
        		tempText = grid.getCellProperty(band, i, "text");
        		bindColumn = "";
        		
        		if(tempText && (tempText.indexOf("bind:") > -1) ) 
        		{
        			bindColumn = tempText.replace("bind:","");
        		}
        		
        		bindColumnInfo[i] = bindColumn; 
            }
            
            return bindColumnInfo;
        }

        
        /**
         * sort 내림차순 정렬함수
         */
        this.sortAsc = function(l,r) 
        {
          if ( l.col < r.col ) return -1;
          if ( l.col > r.col ) return 1;
          return 0;
        }

        

        //컬럼매칭 미리보기
        this.btn_apply_onclick = function(obj,e)
        {
        	var dsMapping = this.ds_mapping;
        	var grdPreview = this.grd_preview;
        	var dsPreview = this.ds_preview;

        	
        	grdPreview.set_formats(this.initFormats);
        	grdPreview.set_formats(this.previewFormats);
        	
        	
        	var rowCount = dsMapping.rowcount;
        	var isExclude = 0;
        	
        	dsPreview.clear();
        	
        	grdPreview.set_enableevent(false);
        	grdPreview.set_enableredraw(false);
        	
        	var columnName;
        	var copyColumnInfo = "";
        	for(var i = 0; i < rowCount; i++)
        	{
        		if(dsMapping.getColumn(i, "exclude")) continue;
        		if(dsMapping.getColumn(i, "excelColumnIndex") == "-1") continue;
        		
        		columnName = this.setGridPreiview(i);
        		dsMapping.setColumn(i, "excelColumnName", columnName);
        		
        		if(copyColumnInfo.length == 0)
        		{
        			copyColumnInfo = columnName + "="+ columnName;
        		}
        		else
        		{
        			copyColumnInfo += "," + columnName + "="+ columnName;
        		}
        		
        	}
        	
        	if(copyColumnInfo.length == 0)
        	{
        		alert("Matching column,please.");
        		return;
        	}
        	
        	this.setPreviewData(copyColumnInfo);

        	grdPreview.set_enableevent(true);
        	grdPreview.set_enableredraw(true);	
        	
        	dsPreview.set_rowposition(0);
        	this.btn_finish.set_enable(true);	
        }

        
        //미리보기
        this.setGridPreiview = function(rowIndex)
        {
        	var dsMapping = this.ds_mapping;
        	var grdMapping = this.grd_mapping;
        	var grdPreview = this.grd_preview;
        	var gridHeadText = dsMapping.getColumn(rowIndex, "gridHeadText");
        	var columnSize = dsMapping.getColumn(rowIndex, "columnSize");
        	var excelColumnText = grdMapping.getCellText(rowIndex,2);
        	var excelColumnIndex = dsMapping.getColumn(rowIndex, "excelColumnIndex");
        	var columnInfo = this.previewDataset.getColumnInfo(nexacro.toNumber(excelColumnIndex));
        	var columnName = columnInfo.name;

        	var cellIndex = grdPreview.appendContentsCol("body");
        	
        	grdPreview.setFormatColProperty(cellIndex, "size", columnSize);
        	grdPreview.setCellProperty("Head", cellIndex, "text", gridHeadText);
        	
        	var cellIndex2 = grdPreview.getCellCount("Head") - 1;
        	if(this.chk_headerRow.value)
        	{
        		grdPreview.setCellProperty("Head", cellIndex2, "text", excelColumnText);
        	}
            else
            {
        		grdPreview.setCellProperty("Head", cellIndex2, "text", "컬럼명 없음");
            }
        	
        	this.ds_preview.addColumn(columnName, "string");
        	
        	grdPreview.setCellProperty("body", cellIndex, "text", "bind:" + columnName);
        	return columnName;
        	
        }

        //미리보기 data 생성
        this.setPreviewData = function(copyColumnInfo)
        {
         	var dataset = this.previewDataset;
         	var dsPreview = this.ds_preview;
         	var rowCount = dataset.rowcount;	
        	var rowIndex = 0;
        	var i = 0;
        	
        	if(this.chk_headerRow.value)
        	{
        		i = 1;
        	}
        	
         	for(; i < rowCount; i++)
         	{
        		rowIndex = dsPreview.addRow();
        		dsPreview.copyRow(rowIndex, dataset, i, copyColumnInfo);
         	}
        }

        //finish
        this.btn_finish_onclick = function(obj,e)
        {
        	if(this.grd_preview.getCellCount("body") < 2) 
        	{
        	    alert("Matching column,please.");
        		return;
        	}
        	
        	var copyColumnInfo;
        	var targetDataset = this.parent.targetDataset;
        	
        	targetDataset.set_enableevent(false);
        	targetDataset.clearData();
        	
         	var dataset;
        	dataset = this.previewDataset;
        	copyColumnInfo = this.getCopyColumnInfo();
        	
        	var rowCount = dataset.rowcount;	
        	var rowIndex = 0;
        	var i = 0;
        	
        	if(this.chk_headerRow.value)
        	{
        		i = 1;
        	}
        	
        	for(; i < rowCount; i++)
        	{
        		rowIndex = targetDataset.addRow();
        		targetDataset.copyRow(rowIndex, dataset, i, copyColumnInfo);
        	}
         	
         	targetDataset.rowposition = 0;
         	
         	targetDataset.set_enableevent(true);
         	this.parent.close();		
        }

        /**

         * dataset copyRow를 위한 컬럼정보를 반환한다.
         * @return {string} copyRow를 위한 컬럼정보
         *                  ex) ToColumnID=FromColumnID
         */
        this.getCopyColumnInfo = function()
        {	
        	var dsMapping = this.ds_mapping;
        	var rowCount = dsMapping.rowcount;
        	var columnName;
        	var copyColumnInfo = "";
        	for(var i = 0; i < rowCount; i++)
        	{
        		if(dsMapping.getColumn(i, "exclude")) continue;
        		if(dsMapping.getColumn(i, "excelColumnIndex") == "-1") continue;
        		
        		columnName = dsMapping.getColumn(i, "bindColumn") + " = " + dsMapping.getColumn(i, "excelColumnName");
        		
        		if(copyColumnInfo.length == 0)
        		{
        			copyColumnInfo = columnName;
        		}
        		else
        		{
        			copyColumnInfo += "," + columnName;
        		}
        	}
        	
        	return copyColumnInfo;

        }

        
        this.ds_mapping_oncolumnchanged = function(obj,e)
        {
        	this.btn_finish.set_enable(false);	
        }

        this.btn_cancel_onclick = function(obj,e)
        {
        	this.parent.close();
        }

        this.btn_prev_onclick = function(obj,e)
        {
        	var ownFrame = this.getOwnerFrame();
        	var mainForm = ownFrame.form;
        	
        	mainForm.div_step3.set_visible(false);
        	
        	this.clearDataset();
        	this.grd_preview.set_formats(this.initFormats);
        	
        	mainForm.div_step2.set_visible(true);	
        	mainForm.div_step2.setTitleText();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_mapping.addEventHandler("oncolumnchanged", this.ds_mapping_oncolumnchanged, this);
            this.addEventHandler("onload", this.ExcelImportStep3_onload, this);
            this.btn_apply.addEventHandler("onclick", this.btn_apply_onclick, this);
            this.btn_prev.addEventHandler("onclick", this.btn_prev_onclick, this);
            this.btn_finish.addEventHandler("onclick", this.btn_finish_onclick, this);
            this.btn_cancel.addEventHandler("onclick", this.btn_cancel_onclick, this);

        };

        this.loadIncludeScript("ExcelImportStep3.xfdl");

       
    };
}
)();

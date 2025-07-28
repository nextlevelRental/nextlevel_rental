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
                this.set_name("TextImportStep2");
                this.set_classname("TextImportStep2");
                this.set_titletext("step2: preview data");
                this._setFormPosition(0,0,500,600);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_textFile", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_dataPreview", this);
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
            obj = new Static("Static00", "absolute", "20", "24", "160", "26", null, null, this);
            obj.set_taborder("0");
            obj.set_text("1. start import at row: ");
            this.addChild(obj.name, obj);

            obj = new Spin("spn_startRow", "absolute", "186", "26", "50", "20", null, null, this);
            obj.set_taborder("1");
            obj.set_value("1");
            obj.set_type("normal");
            obj.set_max("10");
            obj.set_min("1");
            obj.style.set_buttonsize("17");
            this.addChild(obj.name, obj);

            obj = new GroupBox("GroupBox00", "absolute", "20", "112", "460", "45", null, null, this);
            obj.set_text("Delimiters");
            obj.set_taborder("2");
            obj.style.set_titlepadding("0 3 0 3");
            obj.style.set_border("1 solid #c0c0c0ff");
            obj.style.set_color("lightcoral");
            obj.style.set_font("bold 10 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "20", "80", "120", "26", null, null, this);
            obj.set_taborder("3");
            obj.set_text("2. Data Preview");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_dataPreview", "absolute", "20", "172", "460", "372", null, null, this);
            obj.set_taborder("4");
            obj.set_binddataset("ds_dataPreview");
            obj._setContents("<Formats></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_prev", "absolute", "272", "553", "60", "30", null, null, this);
            obj.set_taborder("5");
            obj.set_text("Back");
            this.addChild(obj.name, obj);

            obj = new Button("btn_next", "absolute", "346", "553", "60", "30", null, null, this);
            obj.set_taborder("6");
            obj.set_text("Next");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_cancel", "absolute", "420", "552", "60", "30", null, null, this);
            obj.set_taborder("7");
            obj.set_text("Cancel");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_seperatorTab", "absolute", "28", "130", "50", "20", null, null, this);
            obj.set_taborder("8");
            obj.set_text("Tab");
            obj.style.set_buttonsize("15");
            obj.set_value("false");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_seperatorSpace", "absolute", "91", "130", "68", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("Space");
            obj.style.set_buttonsize("15");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_seperatorComma", "absolute", "172", "130", "70", "20", null, null, this);
            obj.set_taborder("10");
            obj.set_text("Comma");
            obj.style.set_buttonsize("15");
            obj.set_value("true");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_seperatorSemicolon", "absolute", "255", "130", "88", "20", null, null, this);
            obj.set_taborder("11");
            obj.set_text("Semicolon");
            obj.style.set_buttonsize("15");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_seperatorEtc", "absolute", "356", "130", "62", "20", null, null, this);
            obj.set_taborder("12");
            obj.set_text("Other:");
            obj.style.set_buttonsize("15");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_etc", "absolute", "424", "130", "46", "20", null, null, this);
            obj.set_taborder("13");
            obj.set_maxlength("1");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 500, 600, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("TextImportStep2");
            		p.set_titletext("step2: preview data");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("TextImportStep2.xfdl", function() {

        
        this.isFirstDataPreview = true;
        this.cellLine = "";
        this.dsSelectedData = "";
        this.fileType = "txt";

        this.TextImportStep2_onload = function(obj,e)
        {
        	this.cellLine = this.parent.cellLine;
        	this.initForm();	
        }

        
        //init. form 
        this.initForm = function()
        {
        	this.setTitleText();
        	
        	this.setDataPreview(["comma"]);
        	
        	this.parent.setDisplayLoadingImage(false);
        	
        	
        }

        
        this.setTitleText = function()
        {
        	var ownFrame = this.getOwnerFrame();
        	ownFrame.set_showcascadetitletext(false);
        	ownFrame.set_titletext("Step 2 of 3: Preview data");
        }

        
        /**
         * 구분자에 해당하는 data를 그리드에 표시한다.
         * @param {array.<string>} types 구분자 type 문자열 배열.
         *                        예) 탭: "tab", 컴마: "comma", 공백: "space". 
         */
        this.setDataPreview = function(types)
        {
        	var columnCount = this.getDataColumnCount(types);
        	var dataset = this.ds_dataPreview;
        	
        	this.grd_dataPreview.set_enableevent(false);
        	this.grd_dataPreview.set_enableredraw(false);	
        	dataset.set_enableevent(false);
        	
        	this.addColumnToDataset(dataset, columnCount);
         	this.setSplitData(dataset, columnCount, types);
         	this.createGridFormat(columnCount);
         	
         	dataset.set_rowposition(-1);
         	
        	this.grd_dataPreview.set_enableevent(true);
        	this.grd_dataPreview.set_enableredraw(true);	
        	dataset.set_enableevent(true);

        	this.isFirstDataPreview = false;
        	
        // 	trace(dataset.saveXML());
        // 	trace(this.grd_dataPreview.formats);
        	this.btn_next.set_enable(true);
         	
        }

        
        /**
         * 구분자로 분리된 data의 최대 컬럼count를 반환한다.
         * [주의사항] 미리보기용 데이터를 기준으로 계산하기 때문에
         *             구분자로 나뉜 데이터 컬럼개수에 오차가 발생할 수 있다.
         * @param {array.<string>} types 구분자 type 문자열 배열.
         *                        예) 탭: "tab", 컴마: "comma", 공백: "space".
         * @return {number} 구분자로 분리된 최대 column 개수
         */
        this.getDataColumnCount = function(types)
        {
        	var typeLength = types.length;
        	var textDataset = this.ds_textFile;
        	if(this.isFirstDataPreview)
        	{
        		var ownFrame = this.getOwnerFrame();
        		var mainForm = ownFrame.form;
        		var tempDataset = mainForm.div_step1.ds_dataPreview;
        		//trace("tempDataset >>> " + tempDataset.saveXML())
        		
        		textDataset.copyData(tempDataset);	
        		mainForm.div_step1.removeFile(0);
        	}

        	//trace(textDataset.saveXML());
        	
        	var rowCount = textDataset.rowcount;
        	var convertType = this.getConvertType(types);
        	var convertTypeLength = convertType.length;
        	var data, dataArray;
        	var startRow = this.spn_startRow.value - 1;
        	
        	
        	var maxSplitCount = 0;
        	for(var i = startRow; i < rowCount; i++)
        	{
        		data = textDataset.getColumn(i, "data");
        		dataArray = "";
        		//trace("\n\n======== convertTypeLength="+convertTypeLength);
        		
        		if(convertTypeLength == 0)
        		{
        			dataArray = [data];
        		}
        		else
        		{
        			for(var j = 0; j < convertTypeLength; j++)
        			{
        				if(j==0)
        				{
        					dataArray = data.split(convertType[j]);
        				}
        				else
        				{
        					dataArray = this.splitDataDetail(dataArray, convertType[j]);
        				}
        			}		
        		}
        		
        		if(maxSplitCount < dataArray.length) maxSplitCount = dataArray.length;
        		
        	}

        	return maxSplitCount;
        }

        
        /**
         * 입력받은 구분자 문자열을 실제 치환값으로 반환한다.
         * @param {array.<string>} types 구분자 type 문자열 배열.
         *                        예) 탭: "tab", 컴마: "comma", 공백: "space".
         * @return {array.<string>} 실제 치환 문자열의 배열.
         */
        this.getConvertType = function(types)
        {
        	var convertType = [];
        	var tempType;
        	var typeLength = types.length;
        	
        	for(var i = 0; i < typeLength; i++)
        	{
        		tempType = types[i].toLowerCase();
        		
        		if(tempType == "tab")
        		{
        			convertType.push("	");
        		}
        		else if(tempType == "comma")
        		{
        			convertType.push(",");
        		}
        		else if(tempType == "space")
        		{
        			convertType.push(" ");
        		}
        		else if(tempType == "semicolon")
        		{
        			convertType.push(";");
        		}
        		else
        		{
        			convertType.push(tempType);
        		}
        		
        	}
        	
        	return convertType;
        }

        
        /**
         * 문자열 배열의 Data를 구분자로 분리한 문자열 배열의 반환한다.
         * @param {array.<string>} dataArray 한 row의 컬럼값들에 해당하는 
         *                         문자열 배열.
         * @param {string} seperator 문자열 분할에 사용될 구분자.
         */
        this.splitDataDetail = function(dataArray,seperator)
        {
        	var dataLength = dataArray.length;
        	var extractionString;
        	var tempArray = [];
        	var tempData;
        	var result;
        	for(var i = 0; i < dataLength; i++)
        	{
        		tempData = dataArray[i];
        		extractionString = tempData.split(seperator);
        		tempArray = tempArray.concat(extractionString);
        	}
        	
        	return tempArray;
        }

        
        /**
         * dataset에 컬럼개수만큼 컬럼을 추가한다.
         * @param {dataset} dataset 컬럼이 추가될 dataset. 
         * @param {number} columnCount dataset에 추가될 컬럼 개수. 
         */
        this.addColumnToDataset = function(dataset,columnCount)
        {
        	dataset.clear();
        	for(var i = 0; i < columnCount; i++)
        	{
        		dataset.addColumn("col_" + i, "string");
        	}
        }

        /**
         * dataset 컬럼에 문자열 배열값을 입력한다.
         * @param {dataset} dataset target dataset.
         * @param {number} columnCount dataset에 추가될 컬럼 개수. 
         * @param {array.<string>} types 구분자 type 문자열 배열.
         *                        예) 탭: "tab", 컴마: "comma", 공백: "space". 
         */
        this.setSplitData = function(dataset,columnCount,types,textDataset)
        {
        	var typeLength = types.length;
        	
        	if(Eco.isEmpty(textDataset)) textDataset = this.ds_textFile;
        	
        	var rowCount = textDataset.rowcount;
        	var convertType = this.getConvertType(types);
        	var convertTypeLength = convertType.length;
        	
        	var data, dataArray;
        	var startRow = this.spn_startRow.value - 1;
        	
        	for(var i = startRow; i < rowCount; i++)
        	{
        		data = textDataset.getColumn(i, "data");
        		dataArray = "";
        		//trace("\n\n======== convertTypeLength="+convertTypeLength);
        		
        		if(convertTypeLength == 0)
        		{
        			dataArray = [data];
        		}
        		else
        		{
        			for(var j = 0; j < convertTypeLength; j++)
        			{
        				if(j==0)
        				{
        					dataArray = data.split(convertType[j]);
        				}
        				else
        				{
        					dataArray = this.splitDataDetail(dataArray, convertType[j]);
        				}
        			}		
        		}
        		
        		this.setDataToColumn(dataset, dataArray, columnCount);
        	}
        }

        

        /**
         * 문자열 배열을 데이터 미리보기 dataset에 값을 반영한다.
         * @param {dataset} dataset target dataset. 
         * @param {array.<string>} dataArray 한 row의 컬럼값들에 해당하는 
         *                         문자열 배열.
         * @param {number} columnCount target dataset column count.
         */
        this.setDataToColumn = function(dataset,dataArray,columnCount)
        {
        	var dataLength = dataArray.length;
        	var rowIndex = dataset.addRow();
        	
        	for(var i = 0; i < columnCount; i++)
        	{
        		dataset.setColumn(rowIndex, i , dataArray[i]);
        	}
        	
        }

        
        /**
         * 미리보기용 dataset을 보여줄 Grid format 생성
         * @param {dataset} dataset 컬럼이 추가될 dataset. 
         * @param {number} columnCount dataset에 추가될 컬럼 개수. 
         */
        this.createGridFormat = function(columnCount)
        {
        	this.grd_dataPreview.createFormat();
        	this.grd_dataPreview.deleteContentsRow("head", 0);
        	this.grd_dataPreview.setBandProperty("body", "cellline", this.cellLine);
        }

        
        /**
         * 2단계에서 사용되는 dataset을 초기화 한다.
         */
        this.clearData = function()
        {
        	this.ds_textFile.clear();
        	this.ds_dataPreview.clear();
        }

        

        /**
         * 선택된 구분자 값들을 배열로 반환한다.
         * @return {array.<string>} 선택된 구분자 배열.
         */
        this.getSeparatorValues = function()
        {
        	var separator = [this.chk_seperatorTab, this.chk_seperatorSpace
        	                 , this.chk_seperatorComma, this.chk_seperatorSemicolon
        	                 , this.chk_seperatorEtc];
        	                 
        	var count = separator.length;
        	var separatorValue = [];
        	var XComp;
        	var type = "";
        	
        	for(var i = 0; i <count; i++)
        	{
        		XComp = separator[i];
        		if(XComp.value)
        		{
        			type = XComp.name;
        			type = type.replace("chk_seperator", "");
        			
        			if(type == "Etc")
        			{
        				type = this.edt_etc.value;
        			}
        			
        			
        			separatorValue.push(type);		
        		}
        	}
        	
        	return separatorValue;
        }

        

        this.btn_cancel_onclick = function(obj,e)
        {
        	this.parent.close();
        }

        this.btn_prev_onclick = function(obj,e)
        {
        	this.clearData();

        	var ownFrame = this.getOwnerFrame();
        	var mainForm = ownFrame.form;
        	
        	mainForm.div_step1.setTitleText();
        	mainForm.div_step1.set_visible(true);
        	mainForm.div_step2.set_visible(false);	
        }

        

        
        this.separator_onchanged = function(obj,e)
        {
        	if(obj === this.chk_seperatorEtc && this.chk_seperatorEtc.value)
        	{
        		if(Eco.isEmpty(this.edt_etc.value)) return;
        	}
        	
        	var separatorValue= this.getSeparatorValues();
            this.setDataPreview(separatorValue);	
        }

        this.edt_etc_ontextchanged = function(obj,e)
        {
        	if(this.chk_seperatorEtc.value && !Eco.isEmpty(obj.value))
        	{
        		var event = new nexacro.CheckBoxChangeEventInfo();
        		this.separator_onchanged(this.chk_seperatorEtc, event);
        	}	
        }

        this.btn_next_onclick = function(obj,e)
        {
        	this.dsSelectedData = this.ds_dataPreview;
        	var ownFrame = this.getOwnerFrame();
        	var mainForm = ownFrame.form;
        	
        	mainForm.div_step1.set_visible(false);
        	mainForm.div_step2.set_visible(false);
        	mainForm.div_step3.set_url("");
        	mainForm.div_step3.set_url("Example::ExcelImportStep3.xfdl");
        	mainForm.div_step3.set_visible(true);	
        }

        this.spn_startRow_ontextchanged = function(obj,e)
        {
        	var separatorValue= this.getSeparatorValues();
            this.setDataPreview(separatorValue);	
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.TextImportStep2_onload, this);
            this.spn_startRow.addEventHandler("ontextchanged", this.spn_startRow_ontextchanged, this);
            this.btn_prev.addEventHandler("onclick", this.btn_prev_onclick, this);
            this.btn_next.addEventHandler("onclick", this.btn_next_onclick, this);
            this.btn_cancel.addEventHandler("onclick", this.btn_cancel_onclick, this);
            this.chk_seperatorTab.addEventHandler("onchanged", this.separator_onchanged, this);
            this.chk_seperatorSpace.addEventHandler("onchanged", this.separator_onchanged, this);
            this.chk_seperatorComma.addEventHandler("onchanged", this.separator_onchanged, this);
            this.chk_seperatorSemicolon.addEventHandler("onchanged", this.separator_onchanged, this);
            this.chk_seperatorEtc.addEventHandler("onchanged", this.separator_onchanged, this);
            this.edt_etc.addEventHandler("ontextchanged", this.edt_etc_ontextchanged, this);

        };

        this.loadIncludeScript("TextImportStep2.xfdl");

       
    };
}
)();

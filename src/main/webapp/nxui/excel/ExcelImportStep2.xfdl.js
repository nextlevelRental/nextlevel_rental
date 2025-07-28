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
                this.set_name("ExcelImportStep2");
                this.set_classname("ExcelImportStep2");
                this.set_titletext("step2: select sheet.");
                this._setFormPosition(0,0,500,600);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_sheetList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"INT\" size=\"5\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_sheetData", this);
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
            obj = new ListBox("lst_sheets", "absolute", "150", "24", "330", "100", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_innerdataset("@ds_sheetList");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");

            obj = new Static("Static00", "absolute", "20", "24", "120", "26", null, null, this);
            obj.set_taborder("1");
            obj.set_text("1. select sheet.");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "20", "152", "200", "26", null, null, this);
            obj.set_taborder("2");
            obj.set_text("2. display selected sheet data.");
            this.addChild(obj.name, obj);

            obj = new Button("btn_displayData", "absolute", "225", "152", "110", "26", null, null, this);
            obj.set_taborder("3");
            obj.set_text("display data");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_dataPreview", "absolute", "20", "204", "460", "340", null, null, this);
            obj.set_taborder("4");
            obj.set_binddataset("ds_sheetData");
            obj._setContents("<Formats></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_rowCount", "absolute", "336", "174", "144", "26", null, null, this);
            obj.set_taborder("5");
            obj.set_text("row count: 0");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Button("btn_prev", "absolute", "272", "553", "60", "30", null, null, this);
            obj.set_taborder("6");
            obj.set_text("Back");
            this.addChild(obj.name, obj);

            obj = new Button("btn_next", "absolute", "346", "553", "60", "30", null, null, this);
            obj.set_taborder("7");
            obj.set_text("Next");
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
            		p.set_classname("ExcelImportStep2");
            		p.set_titletext("step2: select sheet.");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ExcelImportStep2.xfdl", function() {

        /*
         * 그리드 body밴드의 구성정보가 단일 row를 대상으로 작성됨.
         */

        this.datasetPool = [];
        this.dsSelectedData = "";
        this.fileType = "xlsx";

        this.ExcelImportStep2_onload = function(obj,e)
        {
        	var ownFrame = this.getOwnerFrame();
        	var mainForm = ownFrame.form;
        	//var excelData = mainForm.div_step1.excelData;

        	//this.initForm(excelData);
        	this.initForm();
        }

        
        //init. form 
        //this.initForm = function(excelData)
        this.initForm = function()
        {
        	this.setTitleText();
        	
        	this.clearData();
        	
        	//var rtn = this.getSheetList(excelData);
        	var rtn = this.getSheetList();

        	//sheet가 1개 이면 자동읽기
        	if(this.ds_sheetList.rowcount == 1)
        	{
        		this.readSheetData();
        	}
        	
        	this.parent.setDisplayLoadingImage(false);
        }

        
        this.setTitleText = function()
        {
        	var ownFrame = this.getOwnerFrame();
        	ownFrame.set_showcascadetitletext(false);
        	ownFrame.set_titletext("Step 2 of 3: Select sheet");
        }

        
        /**
         * sheet 목록표시
         * @return {boolean} 성공여부
         */
        //this.getSheetList = function(excelData)
        this.getSheetList = function()
        {
        	//var datasetList = excelData.split("<SeperatoR>");
        	var datasetList = this.parent.importDatasetList;
        	var length = datasetList.length;
        	var tempXml;
        	var row;
        	var sheetName;
        	var dsSheetList = this.ds_sheetList;
        	
        	for(var i=0; i<length; i++)
        	{
        // 		tempXml = datasetList[i];
        // 
        // 		var excelDataset = this.getDataset(i);
        // 		
        // 		excelDataset.loadXML(tempXml);
        // 		sheetName = excelDataset.getConstColumn("sheetName");
        // 		excelDataset.deleteColumn("sheetName"); //상수컬럼제거
        // 		
        // 		row = dsSheetList.addRow();
        // 		dsSheetList.setColumn(row, "code", i);
        // 		dsSheetList.setColumn(row, "data", sheetName);	

        		

        		var excelDataset = datasetList[i];
        		sheetName = excelDataset.getConstColumn("sheetName");
        		
        		//상수컬럼제거를 위한 속성 설정
        		excelDataset.set_updatecontrol(false);
        		excelDataset.deleteColumn("sheetName"); //상수컬럼제거
        		
        		//trace("상수컬럼 제거확인!!" + excelDataset.saveXML());
        		
        		row = dsSheetList.addRow();
        		dsSheetList.setColumn(row, "code", i);
        		dsSheetList.setColumn(row, "data", sheetName);	
        	}
        	
        	this.lst_sheets.set_index(0);
        	
        	return true;
        }

        

        /**
         * dataset을 반환한다.
         * 필요한 dataset이 없을 경우는 생성 후 반환.
         * @param {number} seq 요청순번
         * @return {dataset} dataset(신규 또는 존재하는 dataset)
         */
        this.getDataset = function(seq)
        {
        	var datasetPool = this.datasetPool;
        	var dataset = datasetPool[seq];
        	
        	if(!dataset)
        	{
        		dataset = new Dataset();
        		dataset.name = "_ds_excel_"+ seq;
        		this.addChild(dataset.name, dataset);
        		
        		dataset.set_updatecontrol(false); //상수열을 제거하기 위한 용도
        		datasetPool.push(dataset);
        	}

        	return dataset;
        }

        
        /**
         * 2단계에서 사용되는 dataset을 초기화 한다.
         */
        this.clearData = function()
        {
        	var datasetPool = this.datasetPool;
        	
        	this.ds_sheetList.clearData();
        	this.ds_sheetData.clearData();
        	
        	
        	//datasetPool에 관리되는 dataset을 초기화한다.
        	var count = datasetPool.length;

        	for(var i=0; i<count; i++)
        	{
        		datasetPool[i].clearData();
        	}
        }

        
        //display data of sheet.
        this.btn_displayData_onclick = function(obj,e)
        {
        	this.readSheetData();
        }

        
        /**
         * sheet data를 읽는다.
         * @param {dataset} dataset 컬럼이 추가될 dataset. 
         */
        this.readSheetData = function(dataset)
        {
        	var isCalledLastStep = false;
        	if(Eco.isEmpty(dataset))
        	{
        		dataset = this.ds_sheetData;
        	}
        	else
        	{
        	    //실제 import시 전체데이터를 읽을 때 호출됨.
        	    //   form ExcelImportStep2.xfdl
        		isCalledLastStep = true;
        	}
        	

        	var sheetIndex = this.lst_sheets.index;
        	
        	if(isCalledLastStep) return;
        	
        	//var sourceDataset = Eco.XComp.lookup(this, "_ds_excel_" + sheetIndex);
        	var sourceDataset = this.parent.importDatasetList[sheetIndex];
        	
        	dataset.copyData(sourceDataset);
        	
        	var rtn = this.setPreviewGrid();
        	
        	
        	if(rtn) 
            {
        		var rowCount = dataset.rowcount;
        		this.st_rowCount.set_text("row count: " + rowCount);
        		
        		if(rowCount == 0)
        		{
        			this.btn_next.set_enable(false);
        			
        		} else {
        			this.btn_next.set_enable(true);
        		}
        		
        	}
        }

        

        /**
         * 미리보기 그리드에 엑셀데이터 표시
         */
        this.setPreviewGrid = function()
        {
        	var dataset = this.ds_sheetData;
        	var grd = this.grd_dataPreview;
        	grd.set_enableredraw(false);
        	grd.set_enableevent(false);
        	grd.createFormat();
        	grd.deleteContentsRow("head", 0);
        	
        	grd.set_enableredraw(true);
        	grd.set_enableevent(true);
        		
        	return true;
        }

        

        
        //when changed selected-sheet name.
        this.lst_sheets_onitemchanged = function(obj,e)
        {
        	this.btn_next.set_enable(false);
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

        
        this.btn_cancel_onclick = function(obj,e)
        {
        	this.parent.close();
        }

        this.btn_next_onclick = function(obj,e)
        {
        	this.dsSelectedData = this.ds_sheetData;
        	var ownFrame = this.getOwnerFrame();
        	var mainForm = ownFrame.form;
        	
        	mainForm.div_step1.set_visible(false);
        	mainForm.div_step2.set_visible(false);
        	mainForm.div_step3.set_url("");
        	mainForm.div_step3.set_url("Example::ExcelImportStep3.xfdl");
        	mainForm.div_step3.set_visible(true);
        	//mainForm.div_step3.initForm(this.ds_sheetData);
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.ExcelImportStep2_onload, this);
            this.lst_sheets.addEventHandler("onitemchanged", this.lst_sheets_onitemchanged, this);
            this.btn_displayData.addEventHandler("onclick", this.btn_displayData_onclick, this);
            this.btn_prev.addEventHandler("onclick", this.btn_prev_onclick, this);
            this.btn_next.addEventHandler("onclick", this.btn_next_onclick, this);
            this.btn_cancel.addEventHandler("onclick", this.btn_cancel_onclick, this);

        };

        this.loadIncludeScript("ExcelImportStep2.xfdl");

       
    };
}
)();

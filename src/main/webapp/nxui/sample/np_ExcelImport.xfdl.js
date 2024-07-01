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
                this.set_name("np_ExcelImport");
                this.set_classname("np_ExcelImport");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_excel", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"dept_code\" type=\"STRING\" size=\"256\"/><Column id=\"dept_name\" type=\"STRING\" size=\"256\"/><Column id=\"employee\" type=\"STRING\" size=\"256\"/><Column id=\"telno\" type=\"STRING\" size=\"256\"/><Column id=\"address\" type=\"STRING\" size=\"256\"/><Column id=\"age\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("Button02", "absolute", "648", "42", "101", "28", null, null, this);
            obj.set_taborder("0");
            obj.set_text("File Open");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea00", "absolute", "16", "262", "733", "160", null, null, this);
            obj.set_taborder("1");
            obj.set_value(" ");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "16", "15", "283", "15", null, null, this);
            obj.set_taborder("2");
            obj.set_text("Excel Import");
            obj.set_cssclass("sta_WF_subtitP");
            this.addChild(obj.name, obj);

            obj = new Grid("gd_excel", "absolute", "16", "42", "626", "214", null, null, this);
            obj.set_taborder("3");
            obj.set_binddataset("ds_excel");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"68\"/><Column size=\"184\"/><Column size=\"80\"/><Column size=\"97\"/><Column size=\"101\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"dept_code\"/><Cell col=\"1\" text=\"dept_name\"/><Cell col=\"2\" text=\"employee\"/><Cell col=\"3\" text=\"telno\"/><Cell col=\"4\" text=\"address\"/><Cell col=\"5\" text=\"age\"/></Band><Band id=\"body\"><Cell text=\"bind:dept_code\"/><Cell col=\"1\" style=\"align:left;\" text=\"bind:dept_name\"/><Cell col=\"2\" style=\"align:left;\" text=\"bind:employee\"/><Cell col=\"3\" style=\"align:left;\" text=\"bind:telno\"/><Cell col=\"4\" style=\"align:left;\" text=\"bind:address\"/><Cell col=\"5\" text=\"bind:age\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "656", "102", "99", "47", null, null, this);
            obj.set_taborder("4");
            obj.set_text("Button00");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("np_ExcelImport");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("np_ExcelImport.xfdl", function() {
        //this.url = "http://www.xplatform.co.kr:8080/nexacro-xeni/XImport";
        this.url = application.services["svcurl"].url+"XImport";
        this.importObj = null;
        //include "lib::comLib.xjs";

        this.Button02_onclick = function(obj,e)
        {
        	if(this.importObj == null){
        		this.importObj = new nexacro.ExcelImportObject("Import00",this);	
        		this.importObj.set_importtype(nexacro.ImportTypes.EXCEL);
        		this.importObj.addEventHandler("onsuccess", this.Import00_onsuccess, this);
        		this.importObj.addEventHandler("onerror", this.Import00_onerror, this);	
        	}
        	this.importObj.set_importurl(this.url);
        	this.TextArea00.set_value(this.TextArea00.value + "\n"+ "importurl set :" + this.url);	
        	
        	this.importObj.importData("","Sheet1!A1:F","ds_excel");
        	this.TextArea00.set_value(this.TextArea00.value + "\n"+ "importData() Method");
        }

        
        //onsuccess Event
        this.Import00_onsuccess = function(obj,e)
        {

        	this.gd_excel.createFormat();
        	this.gfn_cellReSizeAll(this.gd_excel);
        	this.importObj = null;
        	this.TextArea00.set_value(this.TextArea00.value + "\n=========== onsuccess event start=============");
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.eventid: " 				+ e.eventid			);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.fromobject: " 			+ e.fromobject		);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.fromreferenceobject: " 	+ e.fromreferenceobject);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.url: " 					+  e.url			);
        } 
             
        //onerror Event
        this.Import00_onerror = function(obj,e)
        {   
        	this.TextArea00.set_value(this.TextArea00.value + "\n=========== onerror event start===============");
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.eventid: " 				+ e.eventid			);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.fromobject: " 			+ e.fromobject		);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.fromreferenceobject: " 	+ e.fromreferenceobject);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.errorcode: " 			+  e.errorcode		);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.errormsg: " 				+ e.errormsg		);
        }                              

        

        //===================================================== cellResize start ========================================================
        this.gfn_cellReSizeAll = function(obj)
        {	

        	var i;
        	var objDs =  eval("this."+obj.binddataset);
        	var bindId;
        	var strCnt;
        	var objFont;
        	var objTextSize;
        	var nMaxTextSize;
        	var font = obj.currentstyle.font;
        	
        	for(j=0;j<obj.getCellCount("Body");j++)
        	{
        		bindId = obj.getCellProperty("body", j, "text").toString().replace("bind:", "");
        		strCnt = obj.getCellText(-1, j);
        		nMaxTextSize = 0;
        		  
        		for(i=0;i<objDs.rowcount;i++){
        		
        			var objTxt = objDs.getColumn(i, bindId);
        			
        			objTextSize = nexacro.getTextSize(objTxt, font);
        			
        			if(nMaxTextSize<objTextSize[0]){nMaxTextSize = objTextSize[0];}
        		}
        		
        		obj.setRealColSize(j,nMaxTextSize+100);		
        	}
        	   
        	this.gd_excel.setFormatRowProperty(0,"size",35);
        	this.gd_excel.setFormatRowProperty(1,"size",31);
        }

        
        this.np_ExcelImport_onload = function(obj,e){
        	Ex.core.init(obj);
        }

        this.Button00_onclick = function(obj,e)
        {
        	this.ds_excel.clearData();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.np_ExcelImport_onload, this);
            this.Button02.addEventHandler("onclick", this.Button02_onclick, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);

        };

        this.loadIncludeScript("np_ExcelImport.xfdl");

       
    };
}
)();

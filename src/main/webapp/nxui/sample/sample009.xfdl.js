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
                this.set_name("sample009");
                this.set_classname("excelExportImport");
                this.set_titletext("엑셀 Import / Export");
                this._setFormPosition(0,0,1260,640);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/><Column id=\"Column3\" type=\"STRING\" size=\"256\"/><Column id=\"Column4\" type=\"STRING\" size=\"256\"/><Column id=\"Column5\" type=\"STRING\" size=\"256\"/><Column id=\"Column6\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column0\">aad</Col><Col id=\"Column5\">11</Col><Col id=\"Column6\">3</Col><Col id=\"Column1\"/><Col id=\"Column2\"/><Col id=\"Column3\"/><Col id=\"Column4\"/></Row><Row><Col id=\"Column5\">33</Col><Col id=\"Column6\">3</Col><Col id=\"Column0\"/><Col id=\"Column1\"/><Col id=\"Column2\"/><Col id=\"Column3\"/><Col id=\"Column4\"/></Row><Row><Col id=\"Column0\">adf</Col><Col id=\"Column3\">df</Col><Col id=\"Column5\">4</Col><Col id=\"Column6\">1</Col><Col id=\"Column1\"/><Col id=\"Column2\"/><Col id=\"Column4\"/></Row><Row><Col id=\"Column1\">daf</Col><Col id=\"Column4\">dfa</Col><Col id=\"Column5\">1</Col><Col id=\"Column6\">2</Col><Col id=\"Column0\"/><Col id=\"Column2\"/><Col id=\"Column3\"/></Row><Row><Col id=\"Column0\">dafa</Col><Col id=\"Column1\">adfa</Col><Col id=\"Column2\">d</Col><Col id=\"Column3\">dafa</Col><Col id=\"Column5\">55</Col><Col id=\"Column6\">55</Col><Col id=\"Column4\"/></Row><Row><Col id=\"Column0\">dasf</Col><Col id=\"Column4\">a</Col><Col id=\"Column5\">1</Col><Col id=\"Column6\">3</Col><Col id=\"Column1\"/><Col id=\"Column2\"/><Col id=\"Column3\"/></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_out", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/><Column id=\"Column3\" type=\"STRING\" size=\"256\"/><Column id=\"Column4\" type=\"STRING\" size=\"256\"/><Column id=\"Column5\" type=\"STRING\" size=\"256\"/><Column id=\"Column6\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_list", "absolute", "48", "94", null, "193", "0", null, this);
            obj.set_taborder("0");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row band=\"head\" size=\"24\"/><Row band=\"body\" size=\"24\"/></Rows><Band id=\"head\"><Cell col=\"0\" disptype=\"normal\" text=\"Column0\"/><Cell col=\"1\" disptype=\"normal\" text=\"Column1\"/><Cell col=\"2\" disptype=\"normal\" text=\"Column2\"/><Cell col=\"3\" disptype=\"normal\" text=\"Column3\"/><Cell col=\"4\" disptype=\"normal\" text=\"Column4\"/><Cell col=\"5\" disptype=\"normal\" text=\"Column5\"/><Cell col=\"6\" disptype=\"normal\" text=\"Column6\"/></Band><Band id=\"body\"><Cell col=\"0\" disptype=\"normal\" text=\"bind:Column0\"/><Cell col=\"1\" disptype=\"normal\" text=\"bind:Column1\"/><Cell col=\"2\" disptype=\"normal\" text=\"bind:Column2\"/><Cell col=\"3\" disptype=\"normal\" text=\"bind:Column3\"/><Cell col=\"4\" disptype=\"normal\" text=\"bind:Column4\"/><Cell col=\"5\" disptype=\"normal\" text=\"bind:Column5\"/><Cell col=\"6\" disptype=\"normal\" text=\"bind:Column6\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "48", "48", "88", "34", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Export");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "48", "353", "88", "34", null, null, this);
            obj.set_taborder("2");
            obj.set_text("Import");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "44", "398", null, "92", "0", null, this);
            obj.set_taborder("3");
            obj.set_binddataset("ds_out");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row band=\"head\" size=\"24\"/><Row band=\"body\" size=\"24\"/></Rows><Band id=\"head\"><Cell col=\"0\" disptype=\"normal\" text=\"Column0\"/><Cell col=\"1\" disptype=\"normal\" text=\"Column1\"/><Cell col=\"2\" disptype=\"normal\" text=\"Column2\"/><Cell col=\"3\" disptype=\"normal\" text=\"Column3\"/><Cell col=\"4\" disptype=\"normal\" text=\"Column4\"/><Cell col=\"5\" disptype=\"normal\" text=\"Column5\"/><Cell col=\"6\" disptype=\"normal\" text=\"Column6\"/></Band><Band id=\"body\"><Cell col=\"0\" disptype=\"normal\" text=\"bind:Column0\"/><Cell col=\"1\" disptype=\"normal\" text=\"bind:Column1\"/><Cell col=\"2\" disptype=\"normal\" text=\"bind:Column2\"/><Cell col=\"3\" disptype=\"normal\" text=\"bind:Column3\"/><Cell col=\"4\" disptype=\"normal\" text=\"bind:Column4\"/><Cell col=\"5\" disptype=\"normal\" text=\"bind:Column5\"/><Cell col=\"6\" disptype=\"normal\" text=\"bind:Column6\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "44", "8", "140", "36", null, null, this);
            obj.set_taborder("4");
            obj.set_text("1.엑셀익스포트");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "48", "312", "332", "36", null, null, this);
            obj.set_taborder("5");
            obj.set_text("2.엑셀임포트");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1260, 640, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("excelExportImport");
            		p.set_titletext("엑셀 Import / Export");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("sample009.xfdl", "lib::comLib.xjs");
        this.registerScript("sample009.xfdl", function() {
        //include "lib::comLib.xjs";

        this.form_onload = function(obj,e)
        {
        	Ex.core.init(obj);
        	
        }

        //ExcelExport 실행
        this.Button00_onclick = function(obj,e)
        {
        	
        	Ex.core.exportExcel(this,this.grd_list);

        }

        this.Button01_onclick = function(obj,e)
        {
           /*
           * 1.heead = 시트명  뿌릴 해드값 A1 ~ G1 
           * 2. body = 그리드 body에 뿌릴 excel sheet 번호 
           */
            var sSheet = "head=sheet1!A1:G1;body=sheet1!A2;";  
            
           /*
           * 출력할 dataset 명
           */
        	var ds = "ds_out";
        	Ex.core.importExcel(sSheet,ds);

        }

        /**
        * excel import
        * @param {object} datsetName
        * @return N/A
        * @example
        * @memberOf ExtNx.core
        */
        this.importExcel = function(sDsName)
        {
        	this.importExcelProcess();
        }

        this.importObj = null;
        this.Button02_onclick = function(obj,e)
        {
        	   var ds = "ds_out";
        	    var sSheet = "head=sheet1!A1;body=sheet1!A2;";  
        		    var sSvcUrl = application.services["svcurl"].url+"XImport" ;
        			this.importObj = new nexacro.ExcelImportObject("_importExcel",this);
        			
        			this.importObj.set_importtype(nexacro.ImportTypes.EXCEL);
        			//this.setWaitCursor(true,true);
        			this.importObj.addEventHandler("onsuccess", this._importExcel_onsuccess, this);
        			this.importObj.addEventHandler("onerror", this._importExcel_onerror, this);
        			this.importObj.set_importurl(sSvcUrl);
        		
        			this.importObj.importData("", "[command=getsheetdata;output=outDs;" + sSheet +"]", "["+ds+"=outDs]");
        }

        this._importExcel_onsuccess = function(obj,e)
        {
              trace("success");
        }

        this._importExcel_onerror = function(obj,e)
        {
        trace(" =========== onerror event start============");
        			trace(" e.eventid : " + e.eventid);
        			trace(" e.fromobject : " + e.fromobject);
        			trace(" e.fromreferenceobject : " + e.fromreferenceobject);
        			trace(" e.errorcode : " + e.errorcode);
        			trace(" e.errormsg) : " + e.errormsg);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);

        };

        this.loadIncludeScript("sample009.xfdl");

       
    };
}
)();

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
                this.set_name("np_ExcelExport");
                this.set_classname("np_ExcelExport");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_excel", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"dept_code\" type=\"STRING\" size=\"256\"/><Column id=\"dept_name\" type=\"STRING\" size=\"256\"/><Column id=\"employee\" type=\"STRING\" size=\"256\"/><Column id=\"telno\" type=\"STRING\" size=\"256\"/><Column id=\"address\" type=\"STRING\" size=\"256\"/><Column id=\"age\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"dept_code\">100</Col><Col id=\"dept_name\">Technical Support Group</Col><Col id=\"employee\">Gil-Dong Hong</Col><Col id=\"telno\">02-1234-1234</Col><Col id=\"address\">Seoul Korea</Col><Col id=\"age\">100</Col></Row><Row><Col id=\"dept_code\">200</Col><Col id=\"dept_name\">Technical Support Group</Col><Col id=\"employee\">Sun-Sin Lee</Col><Col id=\"telno\">02-1234-1234</Col><Col id=\"address\">Seoul Korea</Col><Col id=\"age\">200</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static05", "absolute", "16", "15", "283", "15", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Excel Export");
            obj.set_cssclass("sta_WF_subtitP");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea00", "absolute", "16", "262", "733", "160", null, null, this);
            obj.set_taborder("1");
            obj.set_value(" ");
            this.addChild(obj.name, obj);

            obj = new Grid("gd_excel", "absolute", "16", "42", "626", "214", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_excel");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"68\"/><Column size=\"184\"/><Column size=\"80\"/><Column size=\"97\"/><Column size=\"101\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"dept_code\"/><Cell col=\"1\" text=\"dept_name\"/><Cell col=\"2\" text=\"employee\"/><Cell col=\"3\" text=\"telno\"/><Cell col=\"4\" text=\"address\"/><Cell col=\"5\" text=\"age\"/></Band><Band id=\"body\"><Cell text=\"bind:dept_code\"/><Cell col=\"1\" style=\"align:left;\" text=\"bind:dept_name\"/><Cell col=\"2\" style=\"align:left;\" text=\"bind:employee\"/><Cell col=\"3\" style=\"align:left;\" text=\"bind:telno\"/><Cell col=\"4\" style=\"align:left;\" text=\"bind:address\"/><Cell col=\"5\" text=\"bind:age\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", "648", "42", "101", "28", null, null, this);
            obj.set_taborder("3");
            obj.set_text("Export");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("np_ExcelExport");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("np_ExcelExport.xfdl", function() {
        //this.url = "http://www.xplatform.co.kr:8080/nexacro-xeni/XExportImport";
        this.url = application.services["svcurl"].url+"XExportImport";

        this.Button00_onclick = function(obj,e)
        {
        	this.ExcelExportObject00 = new ExcelExportObject();
        			
        	
        	this.ExcelExportObject00.addEventHandler("onprogress", this.ExcelExportObject00_onprogress, this);
        	this.ExcelExportObject00.addEventHandler("onsuccess", this.ExcelExportObject00_onsuccess, this);	
        	this.ExcelExportObject00.addEventHandler("onerror", this.ExcelExportObject00_onerror, this);		
        	
        	var ret = this.ExcelExportObject00.addExportItem(nexacro.ExportItemTypes.GRID, this.gd_excel, "Sheet1!A1");

        	this.ExcelExportObject00.set_exportmessageprocess("%d [ %d / %d ]");
        	this.ExcelExportObject00.set_exportuitype("exportprogress");
        	this.ExcelExportObject00.set_exporteventtype("itemrecord");
            this.ExcelExportObject00.set_exporttype(nexacro.ExportTypes.EXCEL2007);
        	   
         
        	this.ExcelExportObject00.set_exportfilename("ExcelExport_Sample");
            this.ExcelExportObject00.set_exporturl(this.url);       
            this.ExcelExportObject00.exportData();  	
        }     
         
        this.ExcelExportObject00_onsuccess = function(obj,e)
        {	 
        	this.TextArea00.set_value(this.TextArea00.value + "\n=========== onsuccess event start=================");
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.eventid : " + e.eventid 							);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.url: " +  e.url									);	
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.id 					:"+e.id 					);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.fromobject 			:"+e.fromobject 			);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.fromreferenceobject 	:"+e.fromreferenceobject 	);

        }

        this.ExcelExportObject00_onprogress = function(obj,e)
        {
        	this.TextArea00.set_value(this.TextArea00.value + "\n=========== onprogress event start================");
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.eventid 				:"+e.eventid 				);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.id 					:"+e.id 					);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.fromobject 			:"+e.fromobject 			);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.fromreferenceobject 	:"+e.fromreferenceobject 	);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.itemindex 			:"+e.itemindex 				);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.itemtype 			:"+e.itemtype 				);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.recordindex 			:"+e.recordindex  			);	
        }

        this.ExcelExportObject00_onerror = function(obj,e)
        {	
        	this.TextArea00.set_value(this.TextArea00.value + "\n=========== onerror event start===================");
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.eventid 				:"+e.eventid 				);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.id 					:"+e.id 					);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.fromobject 			:"+e.fromobject 			);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.fromreferenceobject 	:"+e.fromreferenceobject 	);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.errorcode 			:"+e.errorcode 				);
        	this.TextArea00.set_value(this.TextArea00.value + "\ne.errormsg 			:"+e.errormsg 				);	

        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.Button02.addEventHandler("onclick", this.Button00_onclick, this);

        };

        this.loadIncludeScript("np_ExcelExport.xfdl");

       
    };
}
)();

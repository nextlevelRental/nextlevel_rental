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
                this.set_name("RTSDContractStatus_tab_info11_etcPrdInfo");
                this.set_classname("RTSDContractStatus_tab_info5_preminumService");
                this.set_titletext("[STEP11]부가제품정보");
                this._setFormPosition(0,0,1147,150);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_etcPrdInfo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"addGdsCd\" type=\"STRING\" size=\"256\"/><Column id=\"addGdsNm\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"gdsDesc\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"gdsGrp\" type=\"STRING\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"actAmt\" type=\"STRING\" size=\"256\"/><Column id=\"dcYn\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static09", "absolute", "0", "0", null, "5", "0", null, this);
            obj.set_taborder("0");
            obj.set_text("w5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "1107", "0", "40", null, null, "0", this);
            obj.set_taborder("1");
            obj.set_text("w40");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_etcPrdInfo", "absolute", "0", "5", "1104", "135", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_etcPrdInfo");
            obj.set_autofittype("col");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"381\"/><Column size=\"189\"/><Column size=\"103\"/><Column size=\"427\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"부가제품명\"/><Cell col=\"1\" text=\"제조사\"/><Cell col=\"2\" text=\"제품군\"/><Cell col=\"3\" text=\"제품설명\"/></Band><Band id=\"body\"><Cell celltype=\"none\" text=\"bind:addGdsNm\"/><Cell col=\"1\" celltype=\"none\" text=\"bind:makerNm\"/><Cell col=\"2\" celltype=\"none\" text=\"bind:gdsGrpNm\"/><Cell col=\"3\" celltype=\"none\" text=\"bind:gdsDesc\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 150, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDContractStatus_tab_info5_preminumService");
            		p.set_titletext("[STEP11]부가제품정보");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDContractStatus_tab_info11_etcPrdInfo.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDContractStatus_tab_info11_etcPrdInfo.xfdl", function() {
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.obj_data;
        this.BUTTON_CELL = 1;			//버튼CELL 위치

        
        this.writeYn = "";

        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){

        	if(strErrorMsg != "") {
        		alert(strErrorMsg);
        		return;
        	}	
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_etcPrdInfo.addEventHandler("oncolumnchanged", this.dsPrice_oncolumnchanged, this);
            this.addEventHandler("onload", this.RTSDContractStatus_tab_info_info11_etcPrdInfo_onload, this);
            this.grid_etcPrdInfo.addEventHandler("oncellclick", this.grid_preminum_oncellclick, this);

        };

        this.loadIncludeScript("RTSDContractStatus_tab_info11_etcPrdInfo.xfdl");

       
    };
}
)();

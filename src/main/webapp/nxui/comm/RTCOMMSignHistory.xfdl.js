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
                this.set_name("RTCOMMSignHistory");
                this.set_classname("RTCOMMSignHistory");
                this.set_titletext("전자서명 조회이력");
                this._setFormPosition(0,0,950,351);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_signHistory", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"0\"/><Column id=\"seq\" type=\"STRING\" size=\"0\"/><Column id=\"custNo\" type=\"STRING\" size=\"0\"/><Column id=\"sheetId\" type=\"STRING\" size=\"0\"/><Column id=\"sheetNm\" type=\"STRING\" size=\"0\"/><Column id=\"fileName\" type=\"STRING\" size=\"256\"/><Column id=\"jobCd\" type=\"STRING\" size=\"0\"/><Column id=\"jobNm\" type=\"STRING\" size=\"0\"/><Column id=\"autoYn\" type=\"STRING\" size=\"0\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"dispId\" type=\"STRING\" size=\"0\"/><Column id=\"dispNm\" type=\"STRING\" size=\"0\"/><Column id=\"regDay\" type=\"STRING\" size=\"0\"/><Column id=\"regTm\" type=\"STRING\" size=\"0\"/><Column id=\"regId\" type=\"STRING\" size=\"0\"/><Column id=\"regNm\" type=\"STRING\" size=\"0\"/><Column id=\"regDt\" type=\"STRING\" size=\"0\"/><Column id=\"chgId\" type=\"STRING\" size=\"0\"/><Column id=\"chgNm\" type=\"STRING\" size=\"0\"/><Column id=\"chgDt\" type=\"STRING\" size=\"0\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("btn_close", "absolute", "899", "320", "43", "21", null, null, this);
            obj.set_taborder("1");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_signHistory", "absolute", "10", "10", "930", "300", null, null, this);
            obj.set_taborder("2");
            obj.set_autosizingtype("col");
            obj.set_cellsizingtype("col");
            obj.set_binddataset("ds_signHistory");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"200\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"서식명\"/><Cell col=\"1\" text=\"서식구분\"/><Cell col=\"2\" text=\"일자\"/><Cell col=\"3\" text=\"시간\"/><Cell col=\"4\" text=\"사용자ID\"/><Cell col=\"5\" text=\"사용자명\"/><Cell col=\"6\" text=\"이메일\"/><Cell col=\"7\" text=\"자동발송\"/></Band><Band id=\"body\"><Cell text=\"bind:sheetNm\"/><Cell col=\"1\" text=\"bind:jobNm\"/><Cell col=\"2\" text=\"bind:regDay\"/><Cell col=\"3\" text=\"bind:regTm\"/><Cell col=\"4\" text=\"bind:dispId\"/><Cell col=\"5\" text=\"bind:dispNm\"/><Cell col=\"6\" text=\"bind:emailAddr\"/><Cell col=\"7\" text=\"bind:autoYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "0", "950", "10", null, null, this);
            obj.set_taborder("3");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "0", "10", null, null, "0", this);
            obj.set_taborder("4");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0%", "310", "950", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "341", "950", "10", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "940", "0", "10", null, null, "0", this);
            obj.set_taborder("7");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 950, 351, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMSignHistory");
            		p.set_titletext("전자서명 조회이력");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMSignHistory.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMSignHistory.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){
        	if( strSvcId == "signHistory" ){
        		var ct = this.ds_signHistory.rowcount;
        		if( ct != 0 ){
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grid_signHistory.set_nodatatext("조회된 데이터가 없습니다.");
        			this.close();
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMSignHistory_onload = function(obj,e){
        	if( nvl(this.parent.p_ordNo) != "" ){
        		var sSvcID        	= "signHistory";                    
        		var sController   	= "rtms/sd/signHistory.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_signHistory=mapSignHistory";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		this.ds_signHistory.deleteAll();
        		sArgs += Ex.util.setParam("ordNo", this.parent.p_ordNo);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}else{
        		alert("계약번호가 없습니다.");
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMSignHistory_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCOMMSignHistory_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMSignHistory_onkeyup, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMSignHistory.xfdl");

       
    };
}
)();

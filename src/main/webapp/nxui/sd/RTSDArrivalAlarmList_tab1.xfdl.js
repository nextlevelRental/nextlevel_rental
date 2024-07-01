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
                this.set_name("RTSDArrivalAlarmList_tab1");
                this.set_classname("RTSDProvisionalContractRegister");
                this.set_titletext("발송정보업로드");
                this._setFormPosition(0,0,1125,445);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_user", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"tmpPwYn\" type=\"string\" size=\"32\"/><Column id=\"lastPwDt\" type=\"datetime\" size=\"17\"/><Column id=\"agentNm\" type=\"string\" size=\"32\"/><Column id=\"failCnt\" type=\"bigdecimal\" size=\"16\"/><Column id=\"userGrpNm\" type=\"string\" size=\"32\"/><Column id=\"agentId\" type=\"string\" size=\"32\"/><Column id=\"oldPassword\" type=\"string\" size=\"32\"/><Column id=\"chgId\" type=\"string\" size=\"32\"/><Column id=\"password\" type=\"string\" size=\"32\"/><Column id=\"userGrp\" type=\"string\" size=\"32\"/><Column id=\"userNm\" type=\"string\" size=\"32\"/><Column id=\"vkgrpNm\" type=\"string\" size=\"32\"/><Column id=\"lastLogonDt\" type=\"datetime\" size=\"17\"/><Column id=\"userId\" type=\"string\" size=\"32\"/><Column id=\"chgDt\" type=\"datetime\" size=\"17\"/><Column id=\"vkbur\" type=\"string\" size=\"32\"/><Column id=\"regDt\" type=\"datetime\" size=\"17\"/><Column id=\"regId\" type=\"string\" size=\"32\"/><Column id=\"lockYn\" type=\"string\" size=\"32\"/><Column id=\"vkburNm\" type=\"string\" size=\"32\"/><Column id=\"vkgrp\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_excelUp", this);
            obj._setContents("<ColumnInfo><Column id=\"COL_01\" type=\"STRING\" size=\"256\"/><Column id=\"COL_02\" type=\"STRING\" size=\"256\"/><Column id=\"COL_03\" type=\"STRING\" size=\"256\"/><Column id=\"COL_04\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list", this);
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"rdcNm\" type=\"STRING\" size=\"256\"/><Column id=\"invoiceNo\" type=\"STRING\" size=\"256\"/><Column id=\"giDay\" type=\"STRING\" size=\"256\"/><Column id=\"giYn\" type=\"STRING\" size=\"256\"/><Column id=\"sendCnt\" type=\"STRING\" size=\"256\"/><Column id=\"smsType\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S307", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">1</Col><Col id=\"cdNm\">1회차</Col></Row><Row><Col id=\"cd\">2</Col><Col id=\"cdNm\">2회차</Col></Row><Row><Col id=\"cd\">3</Col><Col id=\"cdNm\">3회차</Col></Row><Row><Col id=\"cd\">4</Col><Col id=\"cdNm\">4회차</Col></Row><Row><Col id=\"cd\">5</Col><Col id=\"cdNm\">5회차</Col></Row><Row><Col id=\"cd\">6</Col><Col id=\"cdNm\">6회차</Col></Row><Row><Col id=\"cd\">7</Col><Col id=\"cdNm\">7회차</Col></Row><Row><Col id=\"cd\">8</Col><Col id=\"cdNm\">8회차</Col></Row><Row><Col id=\"cd\">9</Col><Col id=\"cdNm\">9회차</Col></Row><Row><Col id=\"cd\">10</Col><Col id=\"cdNm\">10회차</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static17", "absolute", "10", "90", "1102", "31", null, null, this);
            obj.set_taborder("49");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("0");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "8", "10", "1104", "38", null, null, this);
            obj.set_taborder("44");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "-3", "1122", "12", null, null, this.div_search);
            obj.set_taborder("95");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "30", "1118", "12", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "104", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("99");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_procDay00", "absolute", "25", "8", "79", "21", null, null, this.div_search);
            obj.set_taborder("100");
            obj.set_text("출고일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_sendDay", "absolute", "123", "9", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("101");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Static("Static05", "absolute", "0", "49", "1122", "20", null, null, this);
            obj.set_taborder("45");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "65", "84", "20", null, null, this);
            obj.set_taborder("46");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "10", "80", null, "10", "9", null, this);
            obj.set_taborder("47");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "10", "90", "130", "31", null, null, this);
            obj.set_taborder("48");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_procStatus", "absolute", "144", "95", "963", "21", null, null, this);
            obj.set_taborder("50");
            obj.set_enable("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1104, 38, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("44");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1125, 445, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDProvisionalContractRegister");
            		p.set_titletext("발송정보업로드");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDArrivalAlarmList_tab1.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDArrivalAlarmList_tab1.xfdl", function() {
        //include "lib::comLib.xjs"; 

        // 전역변수 선언
        this.url = application.services["svcurl"].url+"XImport";	// 엑셀 import용 URL
        this.fUserId  = "";											// 현재 로그인 사용자의 ID
        this.fUserGrp = "";											// 현재 로그인 사용자의 사용자그룹
        this.toDay = "";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDArrivalAlarmList_tab1_onload = function(obj,e)
        {
        	this.fn_init();	
        	this.fn_getToday();
        	
        	// 사용자그룹 설정 
        	this.fUserId  = application.gds_userInfo.getColumn(0, "userId" );
        	this.fUserGrp = application.gds_userInfo.getColumn(0, "userGrp");
        }

        /**
         * 초기화
         */
        this.fn_init = function() {
        	this.parent.parent.parent.setButton("AG",this);
        }

        this.fn_getToday = function(){
        	var sSvcID      	= "getToday";  
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }

        /**
         * 집계 버튼의 클릭 이벤트 처리
         */
        this.fn_aggregate = function() {

        	var sSvcID        	= "aggregateAlarmList";                    
        	var sController   	= "rtms/sd/aggregateArrivalAlarmList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("dayF"		, this.div_search.cal_sendDay.value);	//발송일자
        	sArgs += Ex.util.setParam("dayT"		, this.div_search.cal_sendDay.value);	//발송일자
        			
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		
        		case "getToday":
        			var yyyy = this.toDay.substring(0, 4);
        			var mm = this.toDay.substring(4, 6);
        			var dd = this.toDay.substring(6, 8);
        				
        			var _calcDate = new Date(yyyy, mm, dd);
        			_calcDate.setDate(_calcDate.getDate() -1);
        			
        			var _yyyy = _calcDate.getFullYear();
        			var _mm = _calcDate.getMonth();
        			if(_mm.toString().length == 1){
        				_mm = "0" + _calcDate.getMonth();
        			}
        			
        			var _dd = _calcDate.getDate();
        			if(_dd.toString().length == 1){
        				_dd = "0" + _calcDate.getDate();
        			}
        	
        			this.div_search.cal_sendDay.set_value(_yyyy + "" + _mm + "" + _dd);
        			break;
        			
        		case "aggregateAlarmList":
        			this.edt_procStatus.set_value(strErrorMsg);		     
        			break;
        			
        		default:
        			break;
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_user.addEventHandler("onrowposchanged", this.checkSaveMode, this);
            this.addEventHandler("onload", this.RTSDArrivalAlarmList_tab1_onload, this);
            this.div_search.cal_sendDay.addEventHandler("onchanged", this.cal_cashReceiptDate_onchanged, this);

        };

        this.loadIncludeScript("RTSDArrivalAlarmList_tab1.xfdl");

       
    };
}
)();

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
                this.set_name("RTSDArrivalAlarmList_tab3");
                this.set_classname("RTSDProvisionalContractRegister");
                this.set_titletext("발송내역조회");
                this._setFormPosition(0,0,1125,445);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"orderType\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"invoiceNo\" type=\"STRING\" size=\"256\"/><Column id=\"sendCnt\" type=\"STRING\" size=\"256\"/><Column id=\"giDay\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"smsType\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"sendDay\" type=\"STRING\" size=\"256\"/><Column id=\"deliveryType\" type=\"STRING\" size=\"256\"/><Column id=\"logistics\" type=\"STRING\" size=\"256\"/><Column id=\"nextSendDay\" type=\"STRING\" size=\"256\"/><Column id=\"reservedDttm\" type=\"STRING\" size=\"256\"/><Column id=\"rcvPhnId\" type=\"STRING\" size=\"256\"/><Column id=\"sndPhnId\" type=\"STRING\" size=\"256\"/><Column id=\"sndMsg\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

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
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgentNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"orderNo\" type=\"STRING\" size=\"256\"/><Column id=\"orderDate\" type=\"STRING\" size=\"256\"/><Column id=\"deliveryNo\" type=\"STRING\" size=\"256\"/><Column id=\"deliveryDate\" type=\"STRING\" size=\"256\"/><Column id=\"arrivalDate\" type=\"STRING\" size=\"256\"/><Column id=\"deliveryGbn\" type=\"STRING\" size=\"256\"/><Column id=\"rdcNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"o2oYn\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"vkburNm\" type=\"STRING\" size=\"256\"/><Column id=\"vkgrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S307", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">1</Col><Col id=\"cdNm\">1회차</Col></Row><Row><Col id=\"cd\">2</Col><Col id=\"cdNm\">2회차</Col></Row><Row><Col id=\"cd\">3</Col><Col id=\"cdNm\">3회차</Col></Row><Row><Col id=\"cd\">4</Col><Col id=\"cdNm\">4회차</Col></Row><Row><Col id=\"cd\">5</Col><Col id=\"cdNm\">5회차</Col></Row><Row><Col id=\"cd\">6</Col><Col id=\"cdNm\">6회차</Col></Row><Row><Col id=\"cd\">7</Col><Col id=\"cdNm\">7회차</Col></Row><Row><Col id=\"cd\">8</Col><Col id=\"cdNm\">8회차</Col></Row><Row><Col id=\"cd\">9</Col><Col id=\"cdNm\">9회차</Col></Row><Row><Col id=\"cd\">10</Col><Col id=\"cdNm\">10회차</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C037", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">A</Col><Col id=\"cdNm\">일반</Col></Row><Row><Col id=\"cd\">B</Col><Col id=\"cdNm\">걱정제로</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C038", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">01</Col><Col id=\"cdNm\">일반</Col></Row><Row><Col id=\"cd\">02</Col><Col id=\"cdNm\">택배</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C033", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("0");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "9", "98", "120", "20", null, null, this);
            obj.set_taborder("21");
            obj.set_text("문자발송이력");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "118", "1122", "9", null, null, this);
            obj.set_taborder("22");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "8", "10", "1104", "71", null, null, this);
            obj.set_taborder("44");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "25", "7", "79", "21", null, null, this.div_search);
            obj.set_taborder("94");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "-3", "1122", "12", null, null, this.div_search);
            obj.set_taborder("95");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "28", "1118", "12", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "69", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "104", "0", "20", "68", null, null, this.div_search);
            obj.set_taborder("99");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "264", "8", "20", "61", null, null, this.div_search);
            obj.set_taborder("101");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "11.27%", "8", null, "20", "76%", null, this.div_search);
            obj.set_taborder("102");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_procDay00", "absolute", "283", "7", "79", "21", null, null, this.div_search);
            obj.set_taborder("103");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "368", "0", "20", "68", null, null, this.div_search);
            obj.set_taborder("104");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "35.27%", "8", null, "20", "52%", null, this.div_search);
            obj.set_taborder("105");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "528", "8", "20", "60", null, null, this.div_search);
            obj.set_taborder("106");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_procDay01", "absolute", "547", "9", "79", "21", null, null, this.div_search);
            obj.set_taborder("107");
            obj.set_text("접수일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "624", "0", "20", "68", null, null, this.div_search);
            obj.set_taborder("108");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_ordDayF", "absolute", "58.55%", "9", null, "20", "27.82%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("109");
            obj = new Calendar("cal_ordDayT", "absolute", "73.82%", "9", null, "20", "12.55%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("110");
            obj = new Static("Static05", "absolute", "959", "0", "20", "68", null, null, this.div_search);
            obj.set_taborder("111");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_procDay02", "absolute", "25", "39", "79", "21", null, null, this.div_search);
            obj.set_taborder("112");
            obj.set_text("회차");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "59", "1122", "12", null, null, this.div_search);
            obj.set_taborder("113");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "72.64%", "11", null, "17", "25.27%", null, this.div_search);
            obj.set_taborder("114");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_num", "absolute", "11.27%", "40", null, "20", "77.36%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("115");
            obj.set_value("1");
            obj.set_text("1회차");
            obj.set_innerdataset("@ds_S307");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("0");

            obj = new Static("Static07", "absolute", "0", "81", "1122", "20", null, null, this);
            obj.set_taborder("45");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_list", "absolute", "9", "126", "1103", "312", null, null, this);
            obj.set_taborder("46");
            obj.set_binddataset("ds_list");
            obj.set_autosizingtype("none");
            obj.set_autofittype("none");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"40\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"고객번호\"/><Cell col=\"2\" text=\"고객명\"/><Cell col=\"3\" text=\"연락처\"/><Cell col=\"4\" text=\"주문유형\"/><Cell col=\"5\" text=\"배송유형\"/><Cell col=\"6\" text=\"발송횟수\"/><Cell col=\"7\" text=\"문자유형\"/><Cell col=\"8\" text=\"택배사\"/><Cell col=\"9\" text=\"택배송장\"/><Cell col=\"10\" text=\"순번\"/><Cell col=\"11\" text=\"발송시간\"/><Cell col=\"12\" text=\"발송번호\"/><Cell col=\"13\" text=\"수신번호\"/><Cell col=\"14\" text=\"발송자\"/></Band><Band id=\"body\"><Cell celltype=\"none\" edittype=\"readonly\" text=\"bind:ordNo\" suppress=\"1\"/><Cell col=\"1\" text=\"bind:custNo\" suppress=\"0\"/><Cell col=\"2\" text=\"bind:custNm\" suppress=\"0\"/><Cell col=\"3\" text=\"bind:mobNo\" suppress=\"0\"/><Cell col=\"4\" displaytype=\"combo\" text=\"bind:orderType\" suppress=\"0\" combodataset=\"ds_C037\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"5\" displaytype=\"combo\" text=\"bind:deliveryType\" suppress=\"0\" combodataset=\"ds_C038\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"6\" text=\"bind:sendCnt\" suppress=\"0\"/><Cell col=\"7\" text=\"bind:smsType\" suppress=\"0\"/><Cell col=\"8\" text=\"bind:logistics\" suppress=\"0\"/><Cell col=\"9\" text=\"bind:invoiceNo\" suppress=\"0\"/><Cell col=\"10\" text=\"bind:seq\"/><Cell col=\"11\" text=\"bind:reservedDttm\"/><Cell col=\"12\" text=\"bind:sndPhnId\"/><Cell col=\"13\" text=\"bind:rcvPhnId\"/><Cell col=\"14\" text=\"bind:regId\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1104, 71, this.div_search,
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
            		p.set_titletext("발송내역조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDArrivalAlarmList_tab3.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDArrivalAlarmList_tab3.xfdl", function() {
        //include "lib::comLib.xjs"; 

        // 전역변수 선언
        this.fUserId  = "";											// 현재 로그인 사용자의 ID
        this.fUserGrp = "";											// 현재 로그인 사용자의 사용자그룹
        this.toDay = "";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDArrivalAlarmList_tab3_onload = function(obj,e)
        {
        	Ex.core.init(obj);
        	
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
        	this.parent.parent.parent.setButton("S|E",this);
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
         * 조회 버튼의 클릭 이벤트 처리
         */
        this.fn_search = function() {
        	
        	var sSvcID        	= "selectAlarmHistList";                    
        	var sController   	= "rtms/sd/selectArrivalAlarmHistList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("ordNo"		, this.div_search.ed_ordNo.value);	    //집계일자
        	sArgs += Ex.util.setParam("custNm"		, this.div_search.ed_custNo.value);	    //발송횟수
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);

        }

        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.grid_list);
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		
        		case "getToday":
        			var firstDate =  Eco.date.getFirstDate(this.toDay);
        			var lastDate = Eco.date.getLastDayOfMonth(this.toDay);
        			
        			this.div_search.cal_ordDayF.set_value(firstDate);
        			this.div_search.cal_ordDayT.set_value(this.toDay);
        			
        			break;
        			
        		case "selectAlarmList":		
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
            this.addEventHandler("onload", this.RTSDArrivalAlarmList_tab3_onload, this);
            this.grid_list.addEventHandler("oncellclick", this.grid_closeList_oncellclick, this);

        };

        this.loadIncludeScript("RTSDArrivalAlarmList_tab3.xfdl");

       
    };
}
)();

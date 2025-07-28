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
                this.set_name("RTSDArrivalAlarmList_tab2");
                this.set_classname("RTSDProvisionalContractRegister");
                this.set_titletext("발송내역조회");
                this._setFormPosition(0,0,1125,445);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"orderType\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"invoiceNo\" type=\"STRING\" size=\"256\"/><Column id=\"logistics\" type=\"STRING\" size=\"256\"/><Column id=\"sendCnt\" type=\"STRING\" size=\"256\"/><Column id=\"giDay\" type=\"STRING\" size=\"256\"/><Column id=\"giYn\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"smsType\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"nextSendDay\" type=\"STRING\" size=\"256\"/><Column id=\"deliveryType\" type=\"STRING\" size=\"256\"/><Column id=\"delYn\" type=\"STRING\" size=\"256\"/><Column id=\"holdYn\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"logisticsStatus\" type=\"STRING\" size=\"256\"/><Column id=\"logisticsStatusNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_user", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
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

            obj = new Dataset("ds_C033", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">전체</Col></Row><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C037", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">A</Col><Col id=\"cdNm\">일반</Col></Row><Row><Col id=\"cd\">B</Col><Col id=\"cdNm\">걱정제로</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C038", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">전체</Col></Row><Row><Col id=\"cd\">01</Col><Col id=\"cdNm\">일반</Col></Row><Row><Col id=\"cd\">02</Col><Col id=\"cdNm\">택배</Col></Row></Rows>");
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

            obj = new Static("Static21", "absolute", "9", "105", "120", "20", null, null, this);
            obj.set_taborder("21");
            obj.set_text("문자발송목록");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "125", "1122", "9", null, null, this);
            obj.set_taborder("22");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "8", "10", "1104", "74", null, null, this);
            obj.set_taborder("44");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "25", "7", "79", "21", null, null, this.div_search);
            obj.set_taborder("94");
            obj.set_text("집계일자");
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
            obj = new Static("Static08", "absolute", "0", "0", "25", "70", null, null, this.div_search);
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
            obj = new Static("Static01", "absolute", "243", "8", "20", "60", null, null, this.div_search);
            obj.set_taborder("101");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_sendDay", "absolute", "123", "7", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("102");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("st_procDay00", "absolute", "264", "7", "79", "21", null, null, this.div_search);
            obj.set_taborder("103");
            obj.set_text("회차");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "331", "0", "20", "70", null, null, this.div_search);
            obj.set_taborder("104");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_num", "absolute", "31.91%", "8", null, "20", "56.73%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("105");
            obj.set_innerdataset("@ds_S307");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_value("1");
            obj.set_text("1회차");
            obj.set_index("0");
            obj = new Static("Static03", "absolute", "476", "0", "20", "72", null, null, this.div_search);
            obj.set_taborder("106");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_procDay01", "absolute", "497", "7", "79", "21", null, null, this.div_search);
            obj.set_taborder("107");
            obj.set_text("다음발송일");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_nextSendDay", "absolute", "595", "7", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("108");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static04", "absolute", "575", "0", "20", "70", null, null, this.div_search);
            obj.set_taborder("109");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "715", "0", "20", "72", null, null, this.div_search);
            obj.set_taborder("110");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_giYn", "absolute", "76.55%", "8", null, "20", "12.09%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("111");
            obj.set_innerdataset("@ds_C033");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_text("전체");
            obj.set_index("0");
            obj = new Static("st_procDay02", "absolute", "736", "7", "79", "21", null, null, this.div_search);
            obj.set_taborder("112");
            obj.set_text("완료여부");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "823", "0", "20", "70", null, null, this.div_search);
            obj.set_taborder("113");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "0", "58", "1122", "12", null, null, this.div_search);
            obj.set_taborder("114");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_procDay03", "absolute", "25", "39", "79", "21", null, null, this.div_search);
            obj.set_taborder("115");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "11.36%", "40", null, "20", "77.91%", null, this.div_search);
            obj.set_taborder("116");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_procDay04", "absolute", "264", "39", "79", "21", null, null, this.div_search);
            obj.set_taborder("117");
            obj.set_cssclass("sta_WF_schTitle");
            obj.set_text("배송유형");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_deliveryType", "absolute", "31.91%", "40", null, "20", "56.73%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("118");
            obj.set_innerdataset("@ds_C038");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_text("전체");
            obj.set_index("0");
            obj = new Static("st_procDay05", "absolute", "496", "39", "79", "21", null, null, this.div_search);
            obj.set_taborder("119");
            obj.set_text("중지여부");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_holdYn", "absolute", "54%", "40", null, "20", "34.64%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("120");
            obj.set_text("전체");
            obj.set_innerdataset("@ds_C033");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("0");
            obj = new Static("st_procDay06", "absolute", "736", "39", "79", "21", null, null, this.div_search);
            obj.set_taborder("121");
            obj.set_text("삭제여부");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_delYn", "absolute", "76.55%", "40", null, "20", "12.09%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("122");
            obj.set_text("전체");
            obj.set_innerdataset("@ds_C033");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("0");

            obj = new Static("Static07", "absolute", "0", "85", "1122", "20", null, null, this);
            obj.set_taborder("45");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_list", "absolute", "9", "136", "1103", "273", null, null, this);
            obj.set_taborder("46");
            obj.set_binddataset("ds_list");
            obj.set_cellsizingtype("col");
            obj.set_cellmovingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"70\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"100\"/><Column size=\"40\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"주문유형\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"고객번호\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"연락처\"/><Cell col=\"5\" text=\"배송유형\"/><Cell col=\"6\" text=\"발송횟수\"/><Cell col=\"7\" text=\"도착확인\"/><Cell col=\"8\" text=\"문자유형\"/><Cell col=\"9\" text=\"다음발송일\"/><Cell col=\"10\" text=\"택배사\"/><Cell col=\"11\" text=\"택배송장\"/><Cell col=\"12\" text=\"발송중지\"/><Cell col=\"13\" text=\"배송상태\"/><Cell col=\"14\" text=\"지사\"/><Cell col=\"15\" text=\"지역\"/><Cell col=\"16\" text=\"대리점\"/><Cell col=\"17\" text=\"상품코드\"/><Cell col=\"18\" text=\"상품명\"/><Cell col=\"19\" text=\"본수\"/></Band><Band id=\"body\"><Cell displaytype=\"combo\" edittype=\"none\" text=\"bind:orderType\" combodataset=\"ds_C037\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"1\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"2\" text=\"bind:custNo\"/><Cell col=\"3\" edittype=\"readonly\" text=\"bind:custNm\"/><Cell col=\"4\" edittype=\"readonly\" text=\"bind:mobNo\"/><Cell col=\"5\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:deliveryType\" combodataset=\"ds_C038\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"6\" text=\"bind:sendCnt\"/><Cell col=\"7\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:giYn\" combodataset=\"ds_C033\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"8\" text=\"bind:smsType\"/><Cell col=\"9\" text=\"bind:nextSendDay\"/><Cell col=\"10\" displaytype=\"text\" edittype=\"text\" text=\"bind:logistics\"/><Cell col=\"11\" edittype=\"normal\" text=\"bind:invoiceNo\"/><Cell col=\"12\" displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:holdYn\"/><Cell col=\"13\" text=\"bind:logisticsStatusNm\"/><Cell col=\"14\" text=\"bind:rentalOfficeNm\"/><Cell col=\"15\" text=\"bind:rentalGroupNm\"/><Cell col=\"16\" text=\"bind:agencyNm\"/><Cell col=\"17\" text=\"bind:matCd\"/><Cell col=\"18\" text=\"bind:matNm\"/><Cell col=\"19\" text=\"bind:cntCd\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choiceAll", "absolute", "1040", "101", "66", "23", null, null, this);
            obj.set_taborder("47");
            obj.set_text("일괄선택");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choiceAll00", "absolute", "960", "101", "66", "23", null, null, this);
            obj.set_taborder("48");
            obj.set_text("송장번호");
            this.addChild(obj.name, obj);

            obj = new Button("btn_batchLogisticsStatus", "absolute", "878", "102", "66", "23", null, null, this);
            obj.set_taborder("49");
            obj.set_text("배송상태");
            this.addChild(obj.name, obj);

            obj = new Button("btn_updateLogistics", "absolute", "794", "102", "66", "23", null, null, this);
            obj.set_taborder("50");
            obj.set_text("택배사");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1104, 74, this.div_search,
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
        this.addIncludeScript("RTSDArrivalAlarmList_tab2.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDArrivalAlarmList_tab2.xfdl", function() {
        //include "lib::comLib.xjs"; 

        // 전역변수 선언
        this.fUserId  = "";											// 현재 로그인 사용자의 ID
        this.fUserGrp = "";											// 현재 로그인 사용자의 사용자그룹
        this.toDay = "";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDArrivalAlarmList_tab2_onload = function(obj,e)
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
        	this.parent.parent.parent.setButton("DL|E|RA|C|S",this);
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
        	
        	var sendCnt = nvl(this.div_search.cb_num.value);
        	if(sendCnt == ""){
        		this.alert("회차가 선택되지 않았습니다.");
        		return;
        	}
        	
        	var sSvcID        	= "selectAlarmList";                    
        	var sController   	= "rtms/sd/selectArrivalAlarmList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("sendDay"		, this.div_search.cal_sendDay.value);	    //집계일자
        	sArgs += Ex.util.setParam("sendCnt"		, this.div_search.cb_num.value - 1);	    //발송횟수
        	sArgs += Ex.util.setParam("nextSendDay" , this.div_search.cal_nextSendDay.value);	//다음발송일자
        	sArgs += Ex.util.setParam("giYn"        , this.div_search.cb_giYn.value);	        //도착완료여부
        	sArgs += Ex.util.setParam("ordNo"        , this.div_search.ed_ordNo.value);	        //주문번호
        	sArgs += Ex.util.setParam("deliveryType"        , this.div_search.cb_deliveryType.value);	        //배송유형
        	
        	sArgs += Ex.util.setParam("holdYn"        , this.div_search.cb_holdYn.value);	        //발송중지여부
        	sArgs += Ex.util.setParam("delYn"        , "N");	        							//삭제여부
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);

        }

        /**
         * 저장 버튼의 클릭 이벤트 처리
         */
        this.fn_save = function() {
        	
        	var sSvcID        	= "saveArrivalAlarmList";                    
        	var sController   	= "rtms/sd/saveArrivalAlarmList.do";
        	var sInDatasets   	= "ds_list=ds_list:U";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);

        }

        /**
         * 결과반영 버튼의 클릭 이벤트 처리
         */
        this.fn_resultapply = function() {
        	
        	var sSvcID        	= "sendArrivalAlarmList";                    
        	var sController   	= "rtms/sd/sendArrivalAlarmList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("sendDay"		, this.div_search.cal_sendDay.value);	//집계일자
        	sArgs += Ex.util.setParam("sendCnt"		, this.div_search.cb_num.value);	    //발송횟수
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);

        }

        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.grid_list);
        }

        this.fn_delete= function() {	
        	this.ds_list.deleteRow(this.ds_list.rowposition);
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
        	
        			this.div_search.cal_sendDay.set_value(this.toDay);
        			break;
        			
        		case "selectAlarmList":		     
        			break;
        		
        		case "saveArrivalAlarmList":	
        			break;
        			
        		case "sendAlarmList":	     
        			break;
        		
        		case "renewArrivalAlarmList":
        			alert("갱신이 완료되었습니다.");
        		case "updateLogistics":
        			alert("택배사정보 업데이트가 완료되었습니다.");
        		case "batchLogisticsStatus":
        			alert("택배상태정보 업데이트가 완료되었습니다.");
        		default:
        			break;
        	}
        }

        
        this.btn_choiceAll_onclick = function(obj,e)
        {
        	for(var i=0; i<this.ds_list.rowcount; i++){
        	
        		var giYn = this.ds_list.getColumn(i, "giYn");
        		if(giYn == "N") {
        			this.ds_list.setColumn(i, "giYn", "Y");
        		}
        	}
        }

        this.btn_renew_onclick = function(obj,e)
        {
        	var sSvcID        	= "renewArrivalAlarmList";                    
        	var sController   	= "rtms/sd/renewArrivalAlarmList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("dayF"		, this.div_search.cal_sendDay.value);	//집계일자
        	sArgs += Ex.util.setParam("dayT"		, this.div_search.cal_sendDay.value);	//집계일자
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.btn_updateLogistics_onclick = function(obj,e)
        {
        	var sSvcID        	= "updateLogistics";                    
        	var sController   	= "rtms/sd/updateLogistics.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.btn_batchLogisticsStatus_onclick = function(obj,e)
        {
        	var sSvcID        	= "batchLogisticsStatus";                    
        	var sController   	= "rtms/sd/batchLogisticsStatus.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("dayF"		, this.div_search.cal_sendDay.value);	//집계일자
        	sArgs += Ex.util.setParam("dayT"		, this.div_search.cal_sendDay.value);	//집계일자
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.grid_list_oncelldblclick = function(obj,e)
        {
        	var args ={p_arg : "RTSDArrivalAlarmList_tab2"};
        	Ex.core.popup(this,"택배배송조회","comm::RTCOMMLogistics_pop.xfdl",args, "modaless=false");
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_user.addEventHandler("onrowposchanged", this.checkSaveMode, this);
            this.addEventHandler("onload", this.RTSDArrivalAlarmList_tab2_onload, this);
            this.div_search.cal_sendDay.addEventHandler("onchanged", this.cal_cashReceiptDate_onchanged, this);
            this.div_search.cal_nextSendDay.addEventHandler("onchanged", this.cal_cashReceiptDate_onchanged, this);
            this.grid_list.addEventHandler("oncelldblclick", this.grid_list_oncelldblclick, this);
            this.btn_choiceAll.addEventHandler("onclick", this.btn_choiceAll_onclick, this);
            this.btn_choiceAll00.addEventHandler("onclick", this.btn_renew_onclick, this);
            this.btn_batchLogisticsStatus.addEventHandler("onclick", this.btn_batchLogisticsStatus_onclick, this);
            this.btn_updateLogistics.addEventHandler("onclick", this.btn_updateLogistics_onclick, this);

        };

        this.loadIncludeScript("RTSDArrivalAlarmList_tab2.xfdl");

       
    };
}
)();

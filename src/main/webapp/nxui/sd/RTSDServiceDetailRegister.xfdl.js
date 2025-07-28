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
                this.set_name("RTSDHomeShoppingContractRegister");
                this.set_classname("RTSDProvisionalContractRegister");
                this.set_titletext("홈쇼핑가계약업로드");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_excelUp", this);
            obj._setContents("<ColumnInfo><Column id=\"COL_01\" type=\"STRING\" size=\"256\"/><Column id=\"COL_02\" type=\"STRING\" size=\"256\"/><Column id=\"COL_03\" type=\"STRING\" size=\"256\"/><Column id=\"COL_04\" type=\"STRING\" size=\"256\"/><Column id=\"COL_05\" type=\"STRING\" size=\"256\"/><Column id=\"COL_06\" type=\"STRING\" size=\"256\"/><Column id=\"COL_07\" type=\"STRING\" size=\"256\"/><Column id=\"COL_08\" type=\"STRING\" size=\"256\"/><Column id=\"COL_09\" type=\"STRING\" size=\"256\"/><Column id=\"COL_10\" type=\"STRING\" size=\"256\"/><Column id=\"COL_11\" type=\"STRING\" size=\"256\"/><Column id=\"COL_12\" type=\"STRING\" size=\"256\"/><Column id=\"COL_13\" type=\"STRING\" size=\"256\"/><Column id=\"COL_14\" type=\"STRING\" size=\"256\"/><Column id=\"COL_15\" type=\"STRING\" size=\"256\"/><Column id=\"COL_16\" type=\"STRING\" size=\"256\"/><Column id=\"COL_17\" type=\"STRING\" size=\"256\"/><Column id=\"COL_18\" type=\"STRING\" size=\"256\"/><Column id=\"COL_19\" type=\"STRING\" size=\"256\"/><Column id=\"COL_20\" type=\"STRING\" size=\"256\"/><Column id=\"COL_21\" type=\"STRING\" size=\"256\"/><Column id=\"COL_22\" type=\"STRING\" size=\"256\"/><Column id=\"COL_23\" type=\"STRING\" size=\"256\"/><Column id=\"COL_24\" type=\"STRING\" size=\"256\"/><Column id=\"COL_25\" type=\"STRING\" size=\"256\"/><Column id=\"COL_26\" type=\"STRING\" size=\"256\"/><Column id=\"COL_27\" type=\"STRING\" size=\"256\"/><Column id=\"COL_28\" type=\"STRING\" size=\"256\"/><Column id=\"COL_29\" type=\"STRING\" size=\"256\"/><Column id=\"COL_30\" type=\"STRING\" size=\"256\"/><Column id=\"COL_31\" type=\"STRING\" size=\"256\"/><Column id=\"COL_32\" type=\"STRING\" size=\"256\"/><Column id=\"COL_33\" type=\"STRING\" size=\"256\"/><Column id=\"COL_34\" type=\"STRING\" size=\"256\"/><Column id=\"COL_35\" type=\"STRING\" size=\"256\"/><Column id=\"COL_36\" type=\"STRING\" size=\"256\"/><Column id=\"COL_37\" type=\"STRING\" size=\"256\"/><Column id=\"COL_38\" type=\"STRING\" size=\"256\"/><Column id=\"COL_39\" type=\"STRING\" size=\"256\"/><Column id=\"COL_40\" type=\"STRING\" size=\"256\"/><Column id=\"COL_41\" type=\"STRING\" size=\"256\"/><Column id=\"COL_42\" type=\"STRING\" size=\"256\"/><Column id=\"COL_43\" type=\"STRING\" size=\"256\"/><Column id=\"COL_44\" type=\"STRING\" size=\"256\"/><Column id=\"COL_45\" type=\"STRING\" size=\"256\"/><Column id=\"COL_46\" type=\"STRING\" size=\"256\"/><Column id=\"COL_47\" type=\"STRING\" size=\"256\"/><Column id=\"COL_48\" type=\"STRING\" size=\"256\"/><Column id=\"COL_49\" type=\"STRING\" size=\"256\"/><Column id=\"COL_50\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Dataset("ds_serviceDetailList", this);
            obj._setContents("<ColumnInfo><Column id=\"COL_01\" type=\"STRING\" size=\"256\"/><Column id=\"COL_02\" type=\"STRING\" size=\"256\"/><Column id=\"COL_03\" type=\"STRING\" size=\"256\"/><Column id=\"COL_04\" type=\"STRING\" size=\"256\"/><Column id=\"COL_05\" type=\"STRING\" size=\"256\"/><Column id=\"COL_06\" type=\"STRING\" size=\"256\"/><Column id=\"COL_07\" type=\"STRING\" size=\"256\"/><Column id=\"COL_08\" type=\"STRING\" size=\"256\"/><Column id=\"COL_09\" type=\"STRING\" size=\"256\"/><Column id=\"COL_10\" type=\"STRING\" size=\"256\"/><Column id=\"COL_11\" type=\"STRING\" size=\"256\"/><Column id=\"COL_12\" type=\"STRING\" size=\"256\"/><Column id=\"COL_13\" type=\"STRING\" size=\"256\"/><Column id=\"COL_14\" type=\"STRING\" size=\"256\"/><Column id=\"COL_15\" type=\"STRING\" size=\"256\"/><Column id=\"COL_16\" type=\"STRING\" size=\"256\"/><Column id=\"COL_17\" type=\"STRING\" size=\"256\"/><Column id=\"COL_18\" type=\"STRING\" size=\"256\"/><Column id=\"COL_19\" type=\"STRING\" size=\"256\"/><Column id=\"COL_20\" type=\"STRING\" size=\"256\"/><Column id=\"COL_21\" type=\"STRING\" size=\"256\"/><Column id=\"COL_22\" type=\"STRING\" size=\"256\"/><Column id=\"COL_23\" type=\"STRING\" size=\"256\"/><Column id=\"COL_24\" type=\"STRING\" size=\"256\"/><Column id=\"COL_25\" type=\"STRING\" size=\"256\"/><Column id=\"COL_26\" type=\"STRING\" size=\"256\"/><Column id=\"COL_27\" type=\"STRING\" size=\"256\"/><Column id=\"COL_28\" type=\"STRING\" size=\"256\"/><Column id=\"COL_29\" type=\"STRING\" size=\"256\"/><Column id=\"COL_30\" type=\"STRING\" size=\"256\"/><Column id=\"COL_31\" type=\"STRING\" size=\"256\"/><Column id=\"COL_32\" type=\"STRING\" size=\"256\"/><Column id=\"COL_33\" type=\"STRING\" size=\"256\"/><Column id=\"COL_34\" type=\"STRING\" size=\"256\"/><Column id=\"COL_35\" type=\"STRING\" size=\"256\"/><Column id=\"COL_36\" type=\"STRING\" size=\"256\"/><Column id=\"COL_37\" type=\"STRING\" size=\"256\"/><Column id=\"COL_38\" type=\"STRING\" size=\"256\"/><Column id=\"COL_39\" type=\"STRING\" size=\"256\"/><Column id=\"COL_40\" type=\"STRING\" size=\"256\"/><Column id=\"COL_41\" type=\"STRING\" size=\"256\"/><Column id=\"COL_42\" type=\"STRING\" size=\"256\"/><Column id=\"COL_43\" type=\"STRING\" size=\"256\"/><Column id=\"COL_44\" type=\"STRING\" size=\"256\"/><Column id=\"COL_45\" type=\"STRING\" size=\"256\"/><Column id=\"COL_46\" type=\"STRING\" size=\"256\"/><Column id=\"COL_47\" type=\"STRING\" size=\"256\"/><Column id=\"COL_48\" type=\"STRING\" size=\"256\"/><Column id=\"COL_49\" type=\"STRING\" size=\"256\"/><Column id=\"COL_50\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_saleList", this);
            obj._setContents("<ColumnInfo><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Static("Static00", "absolute", "0", "10", "10", "486", null, null, this);
            obj.set_taborder("18");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "75", "120", "21", null, null, this);
            obj.set_taborder("20");
            obj.set_text("서비스내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "95", "1122", "10", null, null, this);
            obj.set_taborder("21");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_ServiceDetailList", "absolute", "9", "104", "1113", "391", null, null, this);
            obj.set_taborder("17");
            obj.set_autofittype("none");
            obj.set_scrollbars("autoboth");
            obj.set_binddataset("ds_serviceDetailList");
            obj.set_cellsizingtype("none");
            obj.set_suppresslevel("allcompare");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"COL_01\"/><Cell col=\"1\" text=\"COL_02\"/><Cell col=\"2\" text=\"COL_03\"/><Cell col=\"3\" text=\"COL_04\"/><Cell col=\"4\" text=\"COL_05\"/><Cell col=\"5\" text=\"COL_06\"/><Cell col=\"6\" text=\"COL_07\"/><Cell col=\"7\" text=\"COL_08\"/><Cell col=\"8\" text=\"COL_09\"/><Cell col=\"9\" text=\"COL_10\"/><Cell col=\"10\" text=\"COL_11\"/><Cell col=\"11\" text=\"COL_12\"/><Cell col=\"12\" text=\"COL_13\"/><Cell col=\"13\" text=\"COL_14\"/><Cell col=\"14\" text=\"COL_15\"/><Cell col=\"15\" text=\"COL_16\"/><Cell col=\"16\" text=\"COL_17\"/><Cell col=\"17\" text=\"COL_18\"/><Cell col=\"18\" text=\"COL_19\"/><Cell col=\"19\" text=\"COL_20\"/><Cell col=\"20\" text=\"COL_21\"/><Cell col=\"21\" text=\"COL_22\"/><Cell col=\"22\" text=\"COL_23\"/><Cell col=\"23\" text=\"COL_24\"/><Cell col=\"24\" text=\"COL_25\"/><Cell col=\"25\" text=\"COL_26\"/><Cell col=\"26\" text=\"COL_27\"/><Cell col=\"27\" text=\"COL_28\"/><Cell col=\"28\" text=\"COL_29\"/><Cell col=\"29\" text=\"COL_30\"/><Cell col=\"30\" text=\"COL_31\"/><Cell col=\"31\" text=\"COL_32\"/><Cell col=\"32\" text=\"COL_33\"/><Cell col=\"33\" text=\"COL_34\"/><Cell col=\"34\" text=\"COL_35\"/><Cell col=\"35\" text=\"COL_36\"/><Cell col=\"36\" text=\"COL_37\"/><Cell col=\"37\" text=\"COL_38\"/><Cell col=\"38\" text=\"COL_39\"/><Cell col=\"39\" text=\"COL_40\"/><Cell col=\"40\" text=\"COL_41\"/><Cell col=\"41\" text=\"COL_42\"/><Cell col=\"42\" text=\"COL_43\"/><Cell col=\"43\" text=\"COL_44\"/><Cell col=\"44\" text=\"COL_45\"/><Cell col=\"45\" text=\"COL_46\"/><Cell col=\"46\" text=\"COL_47\"/><Cell col=\"47\" text=\"COL_48\"/><Cell col=\"48\" text=\"COL_49\"/><Cell col=\"49\" text=\"COL_50\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" text=\"bind:COL_01\"/><Cell col=\"1\" displaytype=\"normal\" text=\"bind:COL_02\"/><Cell col=\"2\" displaytype=\"normal\" text=\"bind:COL_03\"/><Cell col=\"3\" displaytype=\"normal\" text=\"bind:COL_04\"/><Cell col=\"4\" displaytype=\"normal\" text=\"bind:COL_05\"/><Cell col=\"5\" displaytype=\"normal\" text=\"bind:COL_06\"/><Cell col=\"6\" displaytype=\"normal\" text=\"bind:COL_07\"/><Cell col=\"7\" displaytype=\"normal\" text=\"bind:COL_08\"/><Cell col=\"8\" displaytype=\"normal\" text=\"bind:COL_09\"/><Cell col=\"9\" displaytype=\"normal\" text=\"bind:COL_10\"/><Cell col=\"10\" displaytype=\"normal\" text=\"bind:COL_11\"/><Cell col=\"11\" displaytype=\"normal\" text=\"bind:COL_12\"/><Cell col=\"12\" displaytype=\"normal\" text=\"bind:COL_13\"/><Cell col=\"13\" displaytype=\"normal\" text=\"bind:COL_14\"/><Cell col=\"14\" displaytype=\"normal\" text=\"bind:COL_15\"/><Cell col=\"15\" displaytype=\"normal\" text=\"bind:COL_16\"/><Cell col=\"16\" displaytype=\"normal\" text=\"bind:COL_17\"/><Cell col=\"17\" displaytype=\"normal\" text=\"bind:COL_18\"/><Cell col=\"18\" displaytype=\"normal\" text=\"bind:COL_19\"/><Cell col=\"19\" displaytype=\"normal\" text=\"bind:COL_20\"/><Cell col=\"20\" displaytype=\"normal\" text=\"bind:COL_21\"/><Cell col=\"21\" displaytype=\"normal\" text=\"bind:COL_22\"/><Cell col=\"22\" displaytype=\"normal\" text=\"bind:COL_23\"/><Cell col=\"23\" displaytype=\"normal\" text=\"bind:COL_24\"/><Cell col=\"24\" displaytype=\"normal\" text=\"bind:COL_25\"/><Cell col=\"25\" displaytype=\"normal\" text=\"bind:COL_26\"/><Cell col=\"26\" displaytype=\"normal\" text=\"bind:COL_27\"/><Cell col=\"27\" displaytype=\"normal\" text=\"bind:COL_28\"/><Cell col=\"28\" displaytype=\"normal\" text=\"bind:COL_29\"/><Cell col=\"29\" displaytype=\"normal\" text=\"bind:COL_30\"/><Cell col=\"30\" displaytype=\"normal\" text=\"bind:COL_31\"/><Cell col=\"31\" displaytype=\"normal\" text=\"bind:COL_32\"/><Cell col=\"32\" displaytype=\"normal\" text=\"bind:COL_33\"/><Cell col=\"33\" displaytype=\"normal\" text=\"bind:COL_34\"/><Cell col=\"34\" displaytype=\"normal\" text=\"bind:COL_35\"/><Cell col=\"35\" displaytype=\"normal\" text=\"bind:COL_36\"/><Cell col=\"36\" displaytype=\"normal\" text=\"bind:COL_37\"/><Cell col=\"37\" displaytype=\"normal\" text=\"bind:COL_38\"/><Cell col=\"38\" displaytype=\"normal\" text=\"bind:COL_39\"/><Cell col=\"39\" displaytype=\"normal\" text=\"bind:COL_40\"/><Cell col=\"40\" displaytype=\"normal\" text=\"bind:COL_41\"/><Cell col=\"41\" displaytype=\"normal\" text=\"bind:COL_42\"/><Cell col=\"42\" displaytype=\"normal\" text=\"bind:COL_43\"/><Cell col=\"43\" displaytype=\"normal\" text=\"bind:COL_44\"/><Cell col=\"44\" displaytype=\"normal\" text=\"bind:COL_45\"/><Cell col=\"45\" displaytype=\"normal\" text=\"bind:COL_46\"/><Cell col=\"46\" displaytype=\"normal\" text=\"bind:COL_47\"/><Cell col=\"47\" displaytype=\"normal\" text=\"bind:COL_48\"/><Cell col=\"48\" displaytype=\"normal\" text=\"bind:COL_49\"/><Cell col=\"49\" displaytype=\"normal\" text=\"bind:COL_50\"/></Band><Band id=\"summary\"><Cell text=\"총\"/><Cell col=\"1\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/><Cell col=\"18\"/><Cell col=\"19\"/><Cell col=\"20\"/><Cell col=\"21\"/><Cell col=\"22\"/><Cell col=\"23\"/><Cell col=\"24\"/><Cell col=\"25\"/><Cell col=\"26\"/><Cell col=\"27\"/><Cell col=\"28\"/><Cell col=\"29\"/><Cell col=\"30\"/><Cell col=\"31\"/><Cell col=\"32\"/><Cell col=\"33\"/><Cell col=\"34\"/><Cell col=\"35\"/><Cell col=\"36\"/><Cell col=\"37\"/><Cell col=\"38\"/><Cell col=\"39\"/><Cell col=\"40\"/><Cell col=\"41\"/><Cell col=\"42\"/><Cell col=\"43\"/><Cell col=\"44\"/><Cell col=\"45\"/><Cell col=\"46\"/><Cell col=\"47\"/><Cell col=\"48\"/><Cell col=\"49\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "9", "10", "1113", "45", null, null, this);
            obj.set_taborder("44");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "326", "12", "108", "21", null, null, this.div_search);
            obj.set_taborder("94");
            obj.set_text("업로드 엑셀파일");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("95");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "33", "1118", "12", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_fileChoice", "absolute", "456", "12", "100", "21", null, null, this.div_search);
            obj.set_taborder("98");
            obj.set_text("파일선택");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "88", "-1", "20", "45", null, null, this.div_search);
            obj.set_taborder("105");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "307", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("108");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_saleNm", "absolute", "25", "12", "68", "21", null, null, this.div_search);
            obj.set_taborder("109");
            obj.set_text("상품");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_Sale", "absolute", "107", "12", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("110");
            obj.set_innerdataset("@ds_saleList");
            obj.set_codecolumn("saleCd");
            obj.set_datacolumn("saleNm");
            obj.set_displayrowcount("6");
            obj = new Edit("ed_saleNm", "absolute", "204", "12", "103", "21", null, null, this.div_search);
            obj.set_taborder("111");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "436", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("112");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "55", "1122", "20", null, null, this);
            obj.set_taborder("45");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1113, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("44");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDProvisionalContractRegister");
            		p.set_titletext("홈쇼핑가계약업로드");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("bind_custNo","div_search.ed_saleNm","value","ds_saleList","saleNm");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDServiceDetailRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDServiceDetailRegister.xfdl", function() {
        //include "lib::comLib.xjs";

        // 전역변수 선언
        this.url = application.services["svcurl"].url+"XImport";	// 엑셀 import용 URL
        this.fUserId  = "";											// 현재 로그인 사용자의 ID
        this.fUserGrp = "";											// 현재 로그인 사용자의 사용자그룹
        this.toDay = "";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDHomeShoppingContractRegister_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.parent.setButton("C", this);
        	
        	// 사용자그룹 설정 
        	this.fUserId  = application.gds_userInfo.getColumn(0, "userId" );
        	this.fUserGrp = application.gds_userInfo.getColumn(0, "userGrp");
        }

        /**
         * 서버기준 오늘 날자 조회 후 세팅
         */
        this.fn_initYmd = function() {
        	var sSvcID      	= "getToday";  
        	var sController   	= "ntrms/re/getDayMongth.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /**
         * 저장 버튼의 클릭 이벤트 처리
         */
        this.fn_save = function() {

        	this.fn_saveRtsd0012();
        }

        /**
         * 서비스 상세정보 테이블에 저장
         */
        this.fn_saveRtsd0012 = function(){

        	var sSvcID        	= "saveRtsd0012";                    
        	var sController   	= "rtms/sd/saveServiceDetail.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("reg_Id", 	this.fUserId);	

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);			
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {

        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        			
        		case "saveRtsd0012":
        			this.reload();
        			alert("업로드완료");
        			break;
        			
        		default:
        			break;
        	}
        }

        /**
         * 파일선택 버튼의 클릭 이벤트 처리
         */
        this.div_search_btn_fileChoice_onclick = function(obj,e) {

        	this.ds_excelUp.clearData();

        	if(this.importObj) 
        	{ 
        		this.importObj.destroy(); 
        		this.importObj = null; 
        	}
        	
        	this.importObj = new nexacro.ExcelImportObject("Import01",this);
        	this.importObj.parent.addChild("Import01",this.importObj);
        	this.importObj.set_importtype(nexacro.ImportTypes.EXCEL);
        	this.importObj.addEventHandler("onsuccess", this.Import01_onsuccess, this);
        	this.importObj.addEventHandler("onerror", this.Import01_onerror, this);
        	this.importObj.set_importurl(this.url);
        	//this.importObj.importData("", "Sheet0!A1:U", "ds_excelUp");
        	this.importObj.importData("", "[command=getsheetdata;Output=ds_excelUp;body=!A2:AZ;]", "[ds_excelUp=ds_excelUp]","");
        	//this.importObj.parent.addChild("Import01",this.importObj);
        	//this.importObj.importData("", "[command=getsheetdata;output=ds_excelUp;head=Sheet1!A1:T1;body=Sheet1!A2:T;]", "[ds_serviceDetailList=ds_excelUp]" ,"");
        	//this.importObj = null;

        	Ex.core.set_wait(true);
        }

        /**
         * 엑셀업로드 성공 시 처리
         */
        this.Import01_onsuccess = function(obj,e) {
        	
        // 	this.grid_HomeShoppingList.createFormat();
        // 	this.grid_HomeShoppingList.appendContentsRow("Head");
        // 	this.grid_HomeShoppingList.appendContentsRow("Body");
        // 	for(var i=0; i<this.ds_excelUp.colcount; i++){
        // 		this.grid_HomeShoppingList.appendContentsCol(i);
        // 		this.grid_HomeShoppingList.setCellProperty( "Head", i, "text", this.ds_excelUp.getColumnInfo(i).name);
        // 		this.grid_HomeShoppingList.setCellProperty( "Body", i, "text", "bind:" + this.ds_excelUp.getColumnInfo(i).name);		
        // 	}

        	/*this.grid_HomeShoppingList.set_binddataset(this.ds_excelUp);*/
        	
        	// 업로드 데이터 검증로직 추가예정
        	//if (this.fn_chkUpDataset()) {
        		// 엑셀업로드 데이터셋을 가계약목록 데이터셋으로 복사
        		if (this.fn_copyUpDataset()) {
        			this.alert("엑셀 데이터 READ 완료!");
        		} else {
        			this.alert("업로드 데이터 복사 실패!");
        		}
        	//}
        	
        	Ex.core.set_wait(false);
        }

        /**
         * 엑셀업로드 실패 시 처리
         */
        this.Import01_onerror = function(obj,e) {
        	this.alert("엑셀업로드 실패!");
        	
        	Ex.core.set_wait(false);
        }

        /**
         * 엑셀업로드 데이터셋 유효성 검사
         */
        this.fn_chkUpDataset = function () {

        	for (var i=0; i < this.ds_excelUp.getRowCount(); i++) {
        		var nRow        = i;
        		var vCustNm     = this.ds_excelUp.getColumn(nRow, this.ds_excelUp.getColumnInfo(6).name    );  // 고객명
        		var vMobNo      = this.ds_excelUp.getColumn(nRow, this.ds_excelUp.getColumnInfo(9).name     ); // 연락처
        		var vAirDay     = this.ds_excelUp.getColumn(nRow, this.ds_excelUp.getColumnInfo(3).name    );  // 방송일자
        		var vRsrvDay     = this.ds_excelUp.getColumn(nRow, this.ds_excelUp.getColumnInfo(4).name    ); // 예약접수일자
        		
        		if (nvl(vCustNm) == "") {
        			this.alert(nRow + "번째 행의 고객명이 누락되었습니다.");
        			return false;
        		} else if (nvl(vMobNo) == "") {
        			this.alert(nRow + "번째 행의 연락처가 누락되었습니다.");
        			return false;
        		}else if (nvl(vAirDay) == "") {
        			this.alert(nRow + "번째 행의 방송일자가 누락되었습니다.");
        			return false;
        		}else if (nvl(vRsrvDay) == "") {
        			this.alert(nRow + "번째 행의 예약접수일자가 누락되었습니다.");
        			return false;
        		}				
        	}
        	
        	return true;

        }

        /**
         * 엑셀업로드 데이터셋을 가계약목록 데이터셋으로 복사
         */
        this.fn_copyUpDataset = function () {
        	
        	this.ds_serviceDetailList.clearData();
        	this.ds_serviceDetailList.set_enableevent(false);

        /*	this.ds_serviceDetailList.appendData(this.ds_excelUp);*/
        	for (var i=0; i < this.ds_excelUp.getRowCount(); i++) {
        		var idxAddRow     = this.ds_serviceDetailList.addRow();		
        		
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_01", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(0))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_02", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(1))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_03", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(2))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_04", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(3))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_05", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(4))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_06", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(5))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_07", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(6))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_08", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(7))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_09", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(8))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_10", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(9))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_11", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(10))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_12", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(11))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_13", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(12))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_14", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(13))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_15", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(14))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_16", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(15))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_17", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(16))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_18", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(17))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_19", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(18))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_20", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(19))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_21", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(20))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_22", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(21))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_23", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(22))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_24", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(23))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_25", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(24))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_26", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(25))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_27", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(26))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_28", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(27))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_29", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(28))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_30", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(29))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_31", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(30))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_32", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(31))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_33", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(32))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_34", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(33))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_35", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(34))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_36", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(35))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_37", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(36))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_38", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(37))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_39", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(38))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_40", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(39))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_41", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(40))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_42", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(41))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_43", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(42))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_44", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(43))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_45", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(44))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_46", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(45))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_47", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(46))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_48", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(47))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_49", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(48))));
        		this.ds_serviceDetailList.setColumn(idxAddRow, "COL_50", this.ds_excelUp.getColumn(idxAddRow, nvl(this.ds_excelUp.getColID(49))));
        		
        	}
        	
        	this.ds_serviceDetailList.set_enableevent(true);

        	return true;
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_user.addEventHandler("onrowposchanged", this.checkSaveMode, this);
            this.addEventHandler("onload", this.RTSDHomeShoppingContractRegister_onload, this);
            this.grid_ServiceDetailList.addEventHandler("oncellclick", this.grid_closeList_oncellclick, this);
            this.div_search.btn_fileChoice.addEventHandler("onclick", this.div_search_btn_fileChoice_onclick, this);
            this.div_search.cmb_Sale.addEventHandler("onitemchanged", this.div_search_cmb_condProvsnSt_onitemchanged, this);

        };

        this.loadIncludeScript("RTSDServiceDetailRegister.xfdl");

       
    };
}
)();

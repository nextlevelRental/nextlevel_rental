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
                this.set_name("RTREChargeExcept");
                this.set_classname("RTSDProvisionalContractRegister");
                this.set_titletext("청구제외등록");
                this._setFormPosition(0,0,1147,477);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_exceptList", this);
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"apprFlag\" type=\"STRING\" size=\"256\"/><Column id=\"apprDesc\" type=\"STRING\" size=\"256\"/><Column id=\"apprAmt\" type=\"STRING\" size=\"256\"/><Column id=\"apprScnt\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R069", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C033", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_exceptListCp", this);
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"apprFlag\" type=\"STRING\" size=\"256\"/><Column id=\"apprDesc\" type=\"STRING\" size=\"256\"/><Column id=\"apprAmt\" type=\"STRING\" size=\"256\"/><Column id=\"apprScnt\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj.set_taborder("19");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("20");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "75", "120", "21", null, null, this);
            obj.set_taborder("21");
            obj.set_text("고객리스트");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "95", "1122", "10", null, null, this);
            obj.set_taborder("22");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_exceptList", "absolute", "9", "104", "1113", "225", null, null, this);
            obj.set_taborder("18");
            obj.set_autofittype("none");
            obj.set_scrollbars("autoboth");
            obj.set_binddataset("ds_exceptList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"105\"/><Column size=\"65\"/><Column size=\"93\"/><Column size=\"88\"/><Column size=\"88\"/><Column size=\"106\"/><Column size=\"72\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"주문번호\"/><Cell col=\"1\" text=\"고객명\"/><Cell col=\"2\" text=\"연락처\"/><Cell col=\"3\" text=\"구분\"/><Cell col=\"4\" text=\"결제수단\"/><Cell col=\"5\" text=\"등록일자\"/><Cell col=\"6\" displaytype=\"normal\" text=\"등록자\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" text=\"bind:ordNo\" combodataset=\"ds_user\" combocodecol=\"userId\" combodatacol=\"userNm\"/><Cell col=\"1\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:custNm\"/><Cell col=\"2\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:mobNo\"/><Cell col=\"3\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:apprDesc\"/><Cell col=\"4\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:payMthdNm\"/><Cell col=\"5\" displaytype=\"date\" style=\"align:center;\" text=\"bind:regDt\" combodataset=\"ds_R051\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"6\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:regId\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" text=\"총계\"/><Cell col=\"2\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\"/><Cell col=\"6\" displaytype=\"normal\" style=\"align:right;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "328", null, "15", "0", null, this);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "10", "375", "1113", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNo", "absolute", "287", "375", "125", "31", null, null, this);
            obj.set_taborder("25");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNo", "absolute", "417", "380", "142", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_readonly("false");
            obj.set_maxlength("50");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm", "absolute", "564", "375", "125", "31", null, null, this);
            obj.set_taborder("26");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mobNo", "absolute", "694", "380", "142", "21", null, null, this);
            obj.set_taborder("4");
            obj.set_readonly("false");
            obj.set_maxlength("14");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "405", "1113", "31", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_regDt", "absolute", "841", "405", "125", "31", null, null, this);
            obj.set_taborder("28");
            obj.set_text("등록일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_apprScnt", "absolute", "694", "410", "142", "21", null, null, this);
            obj.set_taborder("8");
            obj.set_readonly("false");
            obj.set_maxlength("8");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_apprScnt", "absolute", "564", "405", "125", "31", null, null, this);
            obj.set_taborder("29");
            obj.set_text("연체회차");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_apprAmt", "absolute", "417", "410", "142", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_readonly("false");
            obj.set_maxlength("20");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_apprAmt", "absolute", "287", "405", "125", "31", null, null, this);
            obj.set_taborder("30");
            obj.set_text("연체금액");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_payMthdNm", "absolute", "140", "410", "142", "21", null, null, this);
            obj.set_taborder("6");
            obj.set_readonly("false");
            obj.set_maxlength("50");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_payMthdNm", "absolute", "10", "405", "125", "31", null, null, this);
            obj.set_taborder("31");
            obj.set_text("결제수단");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_contractInfo", "absolute", "10", "349", "80", "21", null, null, this);
            obj.set_taborder("42");
            obj.set_text("고객정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btn_new", "absolute", "1027", "343", "45", "22", null, null, this);
            obj.set_taborder("1");
            obj.set_text("신규");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_del", "absolute", "1077", "343", "45", "22", null, null, this);
            obj.set_taborder("2");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "365", "1147", "10", null, null, this);
            obj.set_taborder("43");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "9", "10", "1113", "45", null, null, this);
            obj.set_taborder("44");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
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
            obj = new Static("st_custNm00", "absolute", "29", "12", "69", "21", null, null, this.div_search);
            obj.set_taborder("100");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "96", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("102");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "426", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("103");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_fromDay", "absolute", "116", "12", "142", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("104");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Calendar("cal_toDay", "absolute", "284", "12", "142", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("105");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("st_custNm01", "absolute", "445", "12", "69", "21", null, null, this.div_search);
            obj.set_taborder("106");
            obj.set_text("주문번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "514", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("107");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "532", "12", "142", "21", null, null, this.div_search);
            obj.set_taborder("108");
            obj.set_maxlength("50");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "24.08%", "14", null, "20", "74.66%", null, this.div_search);
            obj.set_taborder("109");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_orderNo", "absolute", "683", "12", "89", "21", null, null, this.div_search);
            obj.set_taborder("110");
            obj.set_text("계약번호찾기");
            obj.getSetter("domainId").set("nexa.save");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "55", "1122", "20", null, null, this);
            obj.set_taborder("45");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNo00", "absolute", "10", "375", "125", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_text("주문번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordNo", "absolute", "140", "380", "142", "21", null, null, this);
            obj.set_taborder("48");
            obj.set_maxlength("50");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_exceptNm", "absolute", "841", "375", "125", "31", null, null, this);
            obj.set_taborder("49");
            obj.set_text("제외구분");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "10", "435", "1113", "31", null, null, this);
            obj.set_taborder("50");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_regId", "absolute", "10", "435", "125", "31", null, null, this);
            obj.set_taborder("51");
            obj.set_text("등록자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_regId", "absolute", "140", "440", "142", "21", null, null, this);
            obj.set_taborder("52");
            obj.set_maxlength("100");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_regDt", "absolute", "973", "410", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("53");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");

            obj = new Combo("cb_except", "absolute", "84.83%", "381", null, "20", "2.79%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("54");
            obj.set_innerdataset("@ds_R069");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Static("st_exceptNm00", "absolute", "287", "435", "125", "31", null, null, this);
            obj.set_taborder("55");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_useYn", "absolute", "36.36%", "441", null, "20", "51.26%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("56");
            obj.set_innerdataset("@ds_C033");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");


            
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
            obj = new Layout("default", "", 1147, 477, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDProvisionalContractRegister");
            		p.set_titletext("청구제외등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_custNo","value","ds_exceptList","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_mobNo","value","ds_exceptList","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_apprScnt","value","ds_exceptList","apprScnt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_apprAmt","value","ds_exceptList","apprAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_payMthdNm","value","ds_exceptList","payMthdNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","div_search.cal_fromDay","value","ds_provsnList","planDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","div_search.cal_toDay","value","ds_provsnList","planDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","div_search.ed_ordNo","value","ds_provsnList","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","ed_ordNo","value","ds_exceptList","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_regId","value","ds_exceptList","regId");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","cal_regDt","value","ds_exceptList","regDt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","cb_except","value","ds_exceptList","apprFlag");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","cb_useYn","value","ds_exceptList","useYn");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREChargeExcept.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREChargeExcept.xfdl", function() {
        //include "lib::comLib.xjs"; 

        
        // 전역변수 선언
        this.fUserId  = "";											// 현재 로그인 사용자의 ID
        this.fUserGrp = "";											// 현재 로그인 사용자의 사용자그룹
        this.firstDate  = "";
        this.lastDate  = "";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDProvisionalContractRegister_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.parent.setButton("C|S", this);

        	this.FN_listCommInfo();
        	
        	// 사용자그룹 설정 
        	this.fUserId  = application.gds_userInfo.getColumn(0, "userId" );
        	this.fUserGrp = application.gds_userInfo.getColumn(0, "userGrp");
        }	

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	

        	switch (strSvcId) {
        		case "getDate":
        			this.div_search.cal_fromDay.set_value(this.firstDate);
        			this.div_search.cal_toDay.set_value(this.lastDate);
        			break;
        	    case "listCommInfo":
        			this.get_date();
        			break;
        		case "listChargeExceptCp":
        			this.fn_copy();
        			break;
        		case "saveChargeExcept":
        			this.alert("저장이 완료되었습니다.");
        			break;
        		default:
        			break;
        	}
        }

        /**
         * 신규 버튼의 클릭 이벤트 처리
         */
        this.btn_new_onclick = function(obj,e) {	
        	this.ds_exceptList.addRow();
        }

        /**
         * 삭제 버튼의 클릭 이벤트 처리
         */
        this.btn_del_onclick = function(obj,e) {	
        	this.ds_exceptList.deleteRow(this.grid_exceptList.currentrow);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_btn_orderNo_onclick = function(obj,e)
        {
        	var args ={ p_arg : this.p_arg };
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.returnOrderNoInfo = function(arr){
        	var ds = arr[0];
        	var ordNo = ds.getColumn(ds.rowposition, "ordNo");
        	
        	if( nvl(ordNo) == "" ){
        		alert("계약번호찾기를 확인 하세요.");
        	}else{
        		this.div_search.ed_ordNo.set_value(ordNo);
        		this.ds_exceptList.clearData();
        		this.ds_exceptList.addRow();
        		
        		this.FN_listChargeExceptCp(ordNo);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_copy = function(){	
        	this.ds_exceptList.copyRow(this.ds_exceptList.rowposition, this.ds_exceptListCp, this.ds_exceptListCp.rowposition);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //java comm에서 현재 날짜 가져오기
        this.get_date = function() 
        {
        	var sSvcID        	= "getDate";                    
        	var sController   	= "/rtms/sd/getDate.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_listCommInfo = function(ordNo){
        	var sSvcID        	= "listCommInfo";                    
        	var sController   	= "rtms/re/chargeExceptComm.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_R069=R069 ds_C033=C033";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_listChargeExceptCp = function(ordNo){

        	var sSvcID        	= "listChargeExceptCp";                    
        	var sController   	= "rtms/re/listChargeExcept.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_exceptListCp=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("ordNo", 	ordNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_listChargeExcept = function(ordNo){

        	var procFDay = nvl(this.div_search.cal_fromDay.value);
        	var procTDay = nvl(this.div_search.cal_toDay.value);
        	
        	var sSvcID        	= "listChargeExcept";                    
        	var sController   	= "rtms/re/listChargeExcept.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_exceptList=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("ordNo", 	ordNo);
        	sArgs += Ex.util.setParam("procFDay", 	procFDay);
        	sArgs += Ex.util.setParam("procTDay", 	procTDay);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(ordNo){

        	var ordNo = nvl(this.div_search.ed_ordNo.value);
        	
        	this.FN_listChargeExcept(ordNo);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(ordNo){

        	var sSvcID        	= "saveChargeExcept";                    
        	var sController   	= "ntrms/re/saveChargeExcept.do";
        	var sInDatasets   	= "input=ds_exceptList:U";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDProvisionalContractRegister_onload, this);
            this.grid_exceptList.addEventHandler("oncellclick", this.grid_closeList_oncellclick, this);
            this.btn_new.addEventHandler("onclick", this.btn_new_onclick, this);
            this.btn_del.addEventHandler("onclick", this.btn_del_onclick, this);
            this.div_search.btn_orderNo.addEventHandler("onclick", this.div_search_btn_orderNo_onclick, this);

        };

        this.loadIncludeScript("RTREChargeExcept.xfdl");

       
    };
}
)();

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
                this.set_name("RTCSRegularCheckContactPopUp");
                this.set_classname("RTCSRegularCheckContactPopUp");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,862,409);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_contactList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"stdYm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"jobSeq\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"callSeq\" type=\"STRING\" size=\"256\"/><Column id=\"callDay\" type=\"STRING\" size=\"256\"/><Column id=\"callTm\" type=\"STRING\" size=\"256\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"recallDay\" type=\"STRING\" size=\"256\"/><Column id=\"recallTm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("btn_close", "absolute", "807", "366", "41", "21", null, null, this);
            obj.set_taborder("0");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "387", "863", "20", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "848", "0", "15", "405", null, null, this);
            obj.set_taborder("2");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "0", "356", "863", "10", null, null, this);
            obj.set_taborder("3");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_save", "absolute", "761", "366", "41", "21", null, null, this);
            obj.set_taborder("4");
            obj.set_text("저장");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "863", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "10", "9", "120", "21", null, null, this);
            obj.set_taborder("6");
            obj.set_text("정기점검 상담목록");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "29", "863", "10", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_contactList", "absolute", "9", "39", "840", "181", null, null, this);
            obj.set_taborder("8");
            obj.set_binddataset("ds_contactList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"90\"/><Column size=\"33\"/><Column size=\"76\"/><Column size=\"63\"/><Column size=\"200\"/><Column size=\"74\"/><Column size=\"74\"/><Column size=\"76\"/><Column size=\"133\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"순번\"/><Cell col=\"2\" text=\"상담일자\"/><Cell col=\"3\" text=\"상담시간\"/><Cell col=\"4\" text=\"상담내용\"/><Cell col=\"5\" text=\"재컨택일자\"/><Cell col=\"6\" text=\"재컨택시간\"/><Cell col=\"7\" text=\"등록자\"/><Cell col=\"8\" displaytype=\"normal\" text=\"등록일시\"/></Band><Band id=\"body\"><Cell style=\"align:center;\" text=\"bind:ordNo\"/><Cell col=\"1\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:callSeq\"/><Cell col=\"2\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:callDay\" mask=\"####-##-##\"/><Cell col=\"3\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:callTm\" mask=\"##:##\"/><Cell col=\"4\" displaytype=\"normal\" style=\"align:left;\" text=\"bind:callDtl\"/><Cell col=\"5\" text=\"bind:recallDay\" mask=\"####-##-##\"/><Cell col=\"6\" text=\"bind:recallTm\" mask=\"##:##\"/><Cell col=\"7\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:regId\" combodataset=\"ds_R051\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"8\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:regDt\" mask=\"####-##-## ##:##:##\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" text=\"총계\"/><Cell col=\"2\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\" displaytype=\"normal\" style=\"align:right;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "398", null, null, this);
            obj.set_taborder("9");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "10", "266", "839", "31", null, null, this);
            obj.set_taborder("10");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNo", "absolute", "10", "266", "85", "31", null, null, this);
            obj.set_taborder("11");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_provsnNo", "absolute", "99", "271", "142", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_readonly("true");
            obj.set_maxlength("50");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm", "absolute", "245", "266", "85", "31", null, null, this);
            obj.set_taborder("13");
            obj.set_text("상담순번");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_callSeq", "absolute", "334", "271", "142", "21", null, null, this);
            obj.set_taborder("14");
            obj.set_readonly("true");
            obj.set_maxlength("14");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "296", "839", "31", null, null, this);
            obj.set_taborder("15");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_chanNm", "absolute", "245", "296", "85", "31", null, null, this);
            obj.set_taborder("16");
            obj.set_text("상담시간");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNm", "absolute", "10", "296", "85", "31", null, null, this);
            obj.set_taborder("17");
            obj.set_text("상담일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "10", "326", "839", "31", null, null, this);
            obj.set_taborder("18");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_planDay", "absolute", "245", "326", "85", "31", null, null, this);
            obj.set_taborder("19");
            obj.set_text("등록일시");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordDay", "absolute", "10", "326", "85", "31", null, null, this);
            obj.set_taborder("20");
            obj.set_text("등록자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("cust_birth_title", "absolute", "480", "266", "85", "61", null, null, this);
            obj.set_taborder("21");
            obj.set_text("상담내용");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_contractInfo", "absolute", "10", "240", "118", "21", null, null, this);
            obj.set_taborder("22");
            obj.set_text("정기점검 상담정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_regId", "absolute", "99", "331", "142", "21", null, null, this);
            obj.set_taborder("23");
            obj.set_inputtype("number");
            obj.set_readonly("true");
            obj.style.set_background("#f7f7f7ff");
            this.addChild(obj.name, obj);

            obj = new Button("btn_new", "absolute", "753", "234", "45", "22", null, null, this);
            obj.set_taborder("24");
            obj.set_text("신규");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_del", "absolute", "803", "234", "45", "22", null, null, this);
            obj.set_taborder("25");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "256", "863", "10", null, null, this);
            obj.set_taborder("26");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "219", null, "15", "-1", null, this);
            obj.set_taborder("27");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new TextArea("ta_callDtl", "absolute", "66.01%", "271", null, "51", "2.09%", null, this);
            obj.set_taborder("28");
            obj.set_maxlength("1800");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_callDay", "absolute", "99", "301", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("29");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new MaskEdit("me_planDay", "absolute", "334", "301", "142", "21", null, null, this);
            obj.set_taborder("30");
            obj.set_type("string");
            obj.set_mask("##:##");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("me_regDt", "absolute", "334", "331", "142", "21", null, null, this);
            obj.set_taborder("31");
            obj.set_readonly("true");
            obj.set_type("string");
            obj.set_mask("####-##-## ##:##:##");
            obj.style.set_background("#f7f7f7ff");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("st_planDay00", "absolute", "480", "326", "85", "31", null, null, this);
            obj.set_taborder("32");
            obj.set_text("재컨택일시");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_recallDay", "absolute", "569", "331", "126", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("33");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new MaskEdit("me_recallTm", "absolute", "700", "331", "144", "21", null, null, this);
            obj.set_taborder("34");
            obj.set_type("string");
            obj.set_mask("##:##");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Div("divCallDtl", "absolute", "30.16%", "91", null, "210", "33.29%", null, this);
            obj.set_taborder("35");
            obj.style.set_background("white");
            obj.style.set_border("1 solid darkgray");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new TextArea("ta_callDtl_copy", "absolute", "0.64%", "2", null, "204", "0.64%", null, this.divCallDtl);
            obj.set_taborder("0");
            this.divCallDtl.addChild(obj.name, obj);

            obj = new Button("btn_sndSms", "absolute", "491", "304", "47", "18", null, null, this);
            obj.set_taborder("36");
            obj.set_text("SMS");
            obj.set_cssclass("btn_TF_utill");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 210, this.divCallDtl,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("35");
            		p.style.set_background("white");
            		p.style.set_border("1 solid darkgray");
            		p.set_visible("false");

            	}
            );
            this.divCallDtl.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 862, 409, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSRegularCheckContactPopUp");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_provsnNo","value","ds_contactList","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_callSeq","value","ds_contactList","callSeq");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_regId","value","ds_contactList","regId");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ta_callDtl","value","ds_contactList","callDtl");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","cal_callDay","value","ds_contactList","callDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item25","me_planDay","value","ds_contactList","callTm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","me_regDt","value","ds_contactList","regDt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","cal_recallDay","value","ds_contactList","recallDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","me_recallTm","value","ds_contactList","recallTm");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSRegularCheckContactPopUp.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSRegularCheckContactPopUp.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSRegularCheckContactPopUp.xfdl
         * 설    명 : 정기점검 컨택 관리(팝업)
         * 작 성 자 : wjim
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2017-03-27	wjim		[20170324_02] 신규 개발
         * 2017-06-20	wjim		[20170612_01] SMS발송 팝업 연동
         ***************************************************************************************************/
        //include "lib::comLib.xjs";

        // 전역변수
        this.fs_ordNo = "";		// 계약번호

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTCSRegularCheckContactPopUp_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	this.fs_ordNo = this.parent.p_ordNo;
        	
        	// 사용자그룹에 따라 편집권한 부여
        	if (this.parent.p_userGrp == "01" || this.parent.p_userGrp == "02") {
        		this.btn_new.set_visible(true);
        		this.btn_del.set_visible(true);
        		this.btn_save.set_visible(true);
        		this.cal_callDay.set_readonly(false);
        		this.me_planDay.set_readonly(false);
        		this.ta_callDtl.set_readonly(false);
        		this.cal_recallDay.set_readonly(false);
        		this.me_recallTm.set_readonly(false);
        	} else if(this.parent.p_userGrp == "08") { //로디안인경우 상담내역 작성기능 오픈
        		this.btn_new.set_visible(true);
        		this.btn_del.set_visible(true);
        		this.btn_save.set_visible(true);
        		this.cal_callDay.set_readonly(true);
        		this.me_planDay.set_readonly(true);
        		this.ta_callDtl.set_readonly(true);
        		this.cal_recallDay.set_readonly(true);
        		this.me_recallTm.set_readonly(true);
        	} else {
        		this.btn_new.set_visible(false);
        		this.btn_del.set_visible(false);
        		this.btn_save.set_visible(false);
        		this.cal_callDay.set_readonly(true);
        		this.me_planDay.set_readonly(true);
        		this.ta_callDtl.set_readonly(true);
        		this.cal_recallDay.set_readonly(true);
        		this.me_recallTm.set_readonly(true);
        	}
        	
        	// 조회
        	this.fn_search();
        }

        /**
         * Transaction CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		case "listContact":
        			var rowCt = this.ds_contactList.getRowCount();
        		
         			if (rowCt == 0) {
         				this.grid_contactList.set_nodatatext("조회된 데이터가 없습니다.");
         			}else{
        				this.grid_contactList.selectRow(0, true);
         			}
         			
         			this.btn_del.set_enable(false);
        			
        			break;
        			
        		case "saveContact":
        			this.alert(strErrorMsg);
        			this.fn_search();
        			break;
        			
        		default:
        			break;
        	}
        }

        /**
         * 조회
         */
        this.fn_search = function() {
        	// 기존 조회결과 초기화
        	this.ds_contactList.deleteAll();
        	
        	var sSvcID        	= "listContact";                    
        	var sController   	= "/rtms/cs/selectContactList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_contactList=ds_contactList";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("ordNo", this.fs_ordNo);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 목록 그리드의 Body 영역 셀 더블 클릭 이벤트 처리
         */
        this.grid_contactList_oncellclick = function(obj,e) {
        		
        	// 신규 생성 row인 경우에만 '삭제'가능
        	if (this.ds_contactList.getRowType(e.row) == 2) {
        		this.btn_del.set_enable(true);
        	} else {
        		this.btn_del.set_enable(false);
        	}
        }

        /**
         * 신규 버튼의 클릭 이벤트 처리
         */
        this.btn_new_onclick = function(obj,e) {	
        	var objDate = new Date();	

        	// 행 추가
        	var idx = this.ds_contactList.addRow();

        	// 추가한 행에 기본값 설정
        	this.ds_contactList.setColumn(idx, "stdYm"  , this.parent.p_stdYm );								// 기준년월	
        	this.ds_contactList.setColumn(idx, "ordNo"  , this.fs_ordNo       );								// 계약번호
        	this.ds_contactList.setColumn(idx, "equNo"  , this.parent.p_equNo );								// 설비번호
        	this.ds_contactList.setColumn(idx, "jobSeq" , this.parent.p_jobSeq);								// 작업순번
        	this.ds_contactList.setColumn(idx, "seq"    , this.parent.p_seq   );								// 변경순번
        	this.ds_contactList.setColumn(idx, "callSeq", idx+1               );								// 상담순번(실제 저장되는 값은 아님)
        	this.ds_contactList.setColumn(idx, "callDay", this.parent.p_today );								// 상담일자 = 서버상의 오늘날자
        	this.ds_contactList.setColumn(idx, "callTm" , objDate.toTimeString().substr(0,5).replace(":", ""));	// 상담시간 = 로컬PC의 시간
        }

        /**
         * 삭제 버튼의 클릭 이벤트 처리
         */
        this.btn_del_onclick = function(obj,e) {
        	this.ds_contactList.deleteRow(this.grid_contactList.currentrow);
        }

        /**
         * SMS 버튼의 클릭 이벤트 처리 [20170612_01]
         * - SMS발송 팝업 연동
         */
        this.btn_sndSms_onclick = function(obj,e) {
        	
        	var arr ={
        		  p_callId : "RTCSRegularCheckContactPopUp"
        		, p_phnNo  : this.parent.p_mobNo
        		, p_ordNo  : this.parent.p_ordNo
        	};
        			
        	Ex.core.popup(this, "SMS발송", "comm::RTCOMMSmsSend_pop.xfdl", arr, "modaless=false");
        }

        /**
         * 상담메모창 확대
         */
        this.ta_callDtl_oneditclick = function(obj,e)
        {	
        	//로디안인경우 타 ID로 작성된 상담내역 수정 불가
        	if(this.parent.p_userGrp == "08" && this.ds_contactList.getColumn(this.ds_contactList.rowposition, "regId") != this.parent.p_userId && nvl(this.ds_contactList.getColumn(this.ds_contactList.rowposition, "regId")) != ""){
        		this.divCallDtl.ta_callDtl_copy.set_enable(false);
        	}else{
        		this.divCallDtl.ta_callDtl_copy.set_enable(true);
        	}
        	
        	this.divCallDtl.ta_callDtl_copy.set_value(this.ta_callDtl.text);
        	this.divCallDtl.set_visible(true);
        	this.ta_callDtl.set_enable(false);
        	this.divCallDtl.setFocus();
        }

        /**
         * 상담메모창 제거
         */
        this.divCallDtl_onkillfocus = function(obj,e)
        {
        	this.ta_callDtl.set_value(this.divCallDtl.ta_callDtl_copy.text);
        	this.divCallDtl.set_visible(false);
        	this.ta_callDtl.set_enable(true);
        }

        /**
         * 저장 버튼의 클릭 이벤트 처리
         */
        this.btn_save_onclick = function(obj,e) {
        	if (confirm( "저장하시겠습니까?")) {
        		var sSvcID        	= "saveContact";                    
        		var sController   	= "/rtms/cs/saveContact.do";
        		var sInDatasets   	= "ds_contactList=ds_contactList:U";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}	
        }

        /**
         * 닫기 버튼의 클릭 이벤트 처리
         */
        this.btn_close_onclick = function(obj,e) {
        	this.close();
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCSRegularCheckContactPopUp_onload, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.btn_save.addEventHandler("onclick", this.btn_save_onclick, this);
            this.grid_contactList.addEventHandler("oncellclick", this.grid_contactList_oncellclick, this);
            this.btn_new.addEventHandler("onclick", this.btn_new_onclick, this);
            this.btn_del.addEventHandler("onclick", this.btn_del_onclick, this);
            this.ta_callDtl.addEventHandler("oneditclick", this.ta_callDtl_oneditclick, this);
            this.divCallDtl.addEventHandler("onkillfocus", this.divCallDtl_onkillfocus, this);
            this.btn_sndSms.addEventHandler("onclick", this.btn_sndSms_onclick, this);

        };

        this.loadIncludeScript("RTCSRegularCheckContactPopUp.xfdl");

       
    };
}
)();

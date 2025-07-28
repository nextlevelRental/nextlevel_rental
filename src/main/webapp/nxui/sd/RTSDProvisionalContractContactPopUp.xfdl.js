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
                this.set_name("RTSDProvisionalContractContactPopUp");
                this.set_classname("RTSDProvisionalContractContactPopUp");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,862,406);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_provsnContactList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"callSeq\" type=\"STRING\" size=\"256\"/><Column id=\"callDay\" type=\"STRING\" size=\"256\"/><Column id=\"callTm\" type=\"STRING\" size=\"256\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"recallDay\" type=\"STRING\" size=\"256\"/><Column id=\"recallTm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj.set_taborder("5");
            obj.set_text("저장");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "863", "10", null, null, this);
            obj.set_taborder("6");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "10", "9", "120", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_text("가계약상담목록");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "29", "863", "10", null, null, this);
            obj.set_taborder("8");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_provsnContactList", "absolute", "9", "39", "840", "181", null, null, this);
            obj.set_taborder("9");
            obj.set_binddataset("ds_provsnContactList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"90\"/><Column size=\"33\"/><Column size=\"76\"/><Column size=\"63\"/><Column size=\"200\"/><Column size=\"74\"/><Column size=\"74\"/><Column size=\"76\"/><Column size=\"133\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"가계약번호\"/><Cell col=\"1\" text=\"순번\"/><Cell col=\"2\" text=\"상담일자\"/><Cell col=\"3\" text=\"상담시간\"/><Cell col=\"4\" text=\"상담내용\"/><Cell col=\"5\" text=\"재컨택일자\"/><Cell col=\"6\" text=\"재컨택시간\"/><Cell col=\"7\" text=\"등록자\"/><Cell col=\"8\" displaytype=\"normal\" text=\"등록일시\"/></Band><Band id=\"body\"><Cell style=\"align:center;\" text=\"bind:provsnNo\"/><Cell col=\"1\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:callSeq\"/><Cell col=\"2\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:callDay\" mask=\"####-##-##\"/><Cell col=\"3\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:callTm\" mask=\"##:##\"/><Cell col=\"4\" displaytype=\"normal\" style=\"align:left;\" text=\"bind:callDtl\"/><Cell col=\"5\" text=\"bind:recallDay\" mask=\"####-##-##\"/><Cell col=\"6\" text=\"bind:recallTm\" mask=\"##:##\"/><Cell col=\"7\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:regId\" combodataset=\"ds_R051\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"8\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:regDt\" mask=\"####-##-## ##:##:##\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" text=\"총계\"/><Cell col=\"2\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\" displaytype=\"normal\" style=\"align:right;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "398", null, null, this);
            obj.set_taborder("10");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "10", "266", "839", "31", null, null, this);
            obj.set_taborder("11");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNo", "absolute", "10", "266", "85", "31", null, null, this);
            obj.set_taborder("12");
            obj.set_text("가계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_provsnNo", "absolute", "99", "271", "142", "21", null, null, this);
            obj.set_taborder("13");
            obj.set_maxlength("50");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm", "absolute", "245", "266", "85", "31", null, null, this);
            obj.set_taborder("14");
            obj.set_text("상담순번");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_callSeq", "absolute", "334", "271", "142", "21", null, null, this);
            obj.set_taborder("15");
            obj.set_maxlength("14");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "296", "839", "31", null, null, this);
            obj.set_taborder("16");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_chanNm", "absolute", "245", "296", "85", "31", null, null, this);
            obj.set_taborder("22");
            obj.set_text("상담시간");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNm", "absolute", "10", "296", "85", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_text("상담일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "10", "326", "839", "31", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_planDay", "absolute", "245", "326", "85", "31", null, null, this);
            obj.set_taborder("28");
            obj.set_text("등록일시");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordDay", "absolute", "10", "326", "85", "31", null, null, this);
            obj.set_taborder("29");
            obj.set_text("등록자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("cust_birth_title", "absolute", "480", "266", "85", "61", null, null, this);
            obj.set_taborder("39");
            obj.set_text("상담내용");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_contractInfo", "absolute", "10", "240", "110", "21", null, null, this);
            obj.set_taborder("42");
            obj.set_text("가계약상담정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_regId", "absolute", "99", "331", "142", "21", null, null, this);
            obj.set_taborder("43");
            obj.set_inputtype("number");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Button("btn_new", "absolute", "753", "234", "45", "22", null, null, this);
            obj.set_taborder("44");
            obj.set_text("신규");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_del", "absolute", "803", "234", "45", "22", null, null, this);
            obj.set_taborder("45");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "256", "863", "10", null, null, this);
            obj.set_taborder("46");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "219", null, "15", "-1", null, this);
            obj.set_taborder("48");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new TextArea("ta_callDtl", "absolute", "66.01%", "271", null, "51", "2.09%", null, this);
            obj.set_taborder("49");
            obj.set_maxlength("1800");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_callDay", "absolute", "99", "301", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("50");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new MaskEdit("me_planDay", "absolute", "334", "301", "142", "21", null, null, this);
            obj.set_taborder("51");
            obj.set_readonly("false");
            obj.set_type("string");
            obj.set_mask("##:##");
            obj.set_enable("true");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("me_regDt", "absolute", "334", "331", "142", "21", null, null, this);
            obj.set_taborder("52");
            obj.set_type("string");
            obj.set_mask("####-##-## ##:##:##");
            obj.style.set_align("left middle");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_planDay00", "absolute", "480", "326", "85", "31", null, null, this);
            obj.set_taborder("53");
            obj.set_text("재컨택일시");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_recallDay", "absolute", "569", "331", "126", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("54");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new MaskEdit("me_recallTm", "absolute", "700", "331", "144", "21", null, null, this);
            obj.set_taborder("55");
            obj.set_type("string");
            obj.set_mask("##:##");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Div("divCallDtl", "absolute", "25.52%", "91", null, "210", "26.45%", null, this);
            obj.set_taborder("56");
            obj.style.set_background("white");
            obj.style.set_border("1 solid darkgray");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new TextArea("ta_callDtl_copy", "absolute", "0.5%", "2", null, "204", "0.5%", null, this.divCallDtl);
            obj.set_taborder("0");
            this.divCallDtl.addChild(obj.name, obj);

            obj = new Button("btn_sndSms", "absolute", "491", "304", "47", "18", null, null, this);
            obj.set_taborder("57");
            obj.set_text("SMS");
            obj.set_cssclass("btn_TF_utill");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 210, this.divCallDtl,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("56");
            		p.style.set_background("white");
            		p.style.set_border("1 solid darkgray");
            		p.set_visible("false");

            	}
            );
            this.divCallDtl.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 862, 406, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDProvisionalContractContactPopUp");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_provsnNo","value","ds_provsnContactList","provsnNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_callSeq","value","ds_provsnContactList","callSeq");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_regId","value","ds_provsnContactList","regId");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ta_callDtl","value","ds_provsnContactList","callDtl");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","cal_callDay","value","ds_provsnContactList","callDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item25","me_planDay","value","ds_provsnContactList","callTm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","me_regDt","value","ds_provsnContactList","regDt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","cal_recallDay","value","ds_provsnContactList","recallDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","me_recallTm","value","ds_provsnContactList","recallTm");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDProvisionalContractContactPopUp.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDProvisionalContractContactPopUp.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDProvisionalContractContactPopUp.xfdl
         * 설    명 : (방판)가계약상담(팝업)
         * 작 성 자 : wjim
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2017-06-12	wjim		[20170612_01] SMS발송 팝업 연동
         ***************************************************************************************************/

        //include "lib::comLib.xjs";

        this.fv_provsnNo = "";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDProvisionalContractContactPopUp_onload = function(obj,e) {
        	Ex.core.init(obj);	
        	this.fv_provsnNo = this.parent.p_provsnNo;
        	
        	if (this.parent.p_userGrp == "01" || this.parent.p_userGrp == "02") {
        		this.btn_new.set_visible(true);
        		this.btn_del.set_visible(true);
        		this.btn_save.set_visible(true);
        		this.cal_callDay.set_readonly(false);
        		this.me_planDay.set_readonly(false);
        		this.ta_callDtl.set_readonly(false);
        		this.cal_recallDay.set_readonly(false);
        		this.me_recallTm.set_readonly(false);
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
        	
        	this.fn_search();
        }

        /**
         * 조회
         */
        this.fn_search = function() {
        	// 기존 조회결과 초기화
        	this.ds_provsnContactList.deleteAll();
        	
        	var sSvcID        	= "listContact";                    
        	var sController   	= "rtms/sd/listProvisionalContractContact.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_provsnContactList=ds_provsnContactList";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("provsnNo", this.fv_provsnNo);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 신규 버튼의 클릭 이벤트 처리
         */
        this.btn_new_onclick = function(obj,e) {	
        	var objDate = new Date();	

        	// 행 추가
        	var idx = this.ds_provsnContactList.addRow();

        	// 추가한 행에 기본값 설정
        	this.ds_provsnContactList.setColumn(idx, "provsnNo", this.fv_provsnNo);										// 가계약번호
        	this.ds_provsnContactList.setColumn(idx, "callSeq" , idx+1);												// 상담순번(실제 저장되는 값은 아님)
        	this.ds_provsnContactList.setColumn(idx, "callDay" , this.parent.p_today);									// 상담일자 = 서버상의 오늘날자
        	this.ds_provsnContactList.setColumn(idx, "callTm"  , objDate.toTimeString().substr(0,5).replace(":", ""));	// 상담시간 = 로컬PC의 시간
        }

        /**
         * 삭제 버튼의 클릭 이벤트 처리
         */
        this.btn_del_onclick = function(obj,e) {
        	this.ds_provsnContactList.deleteRow(this.grid_provsnContactList.currentrow);
        }

        /**
         * 저장 버튼의 클릭 이벤트 처리
         */
        this.btn_save_onclick = function(obj,e) {
        	if (confirm( "저장하시겠습니까?")) {
        		var sSvcID        	= "saveContact";                    
        		var sController   	= "rtms/sd/saveProvisionalContractContact.do";
        		var sInDatasets   	= "ds_provsnContactList=ds_provsnContactList:U";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}	
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		case "listContact":
        			var rowCt = this.ds_provsnContactList.getRowCount();
        		
         			if (rowCt == 0) {
         				this.grid_provsnContactList.set_nodatatext("조회된 데이터가 없습니다.");
         			}
        			
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
         * 닫기 버튼의 클릭 이벤트 처리
         */
        this.btn_close_onclick = function(obj,e) {
        	this.close();
        }

        /**
         * 상담메모창 확대
         */
        this.ta_callDtl_oneditclick = function(obj,e)
        {
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
         * SMS 버튼의 클릭 이벤트 처리 [20170612_01]
         * - SMS발송 팝업 연동
         */
        this.btn_sndSms_onclick = function(obj,e) {
        	// 휴대폰번호의 '-'를 제거
        	var vMobNo = nexacro.trim(nexacro.replaceAll(this.parent.p_mobNo, "-", "")); 
        	
        	var arr ={
        		  p_callId : "RTSDProvisionalContractContactPopUp"
        		, p_phnNo  : vMobNo
        		, p_ordNo  : this.parent.p_provsnNo
        	};
        			
        	Ex.core.popup(this, "SMS발송", "comm::RTCOMMSmsSend_pop.xfdl", arr, "modaless=false");
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDProvisionalContractContactPopUp_onload, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.btn_save.addEventHandler("onclick", this.btn_save_onclick, this);
            this.grid_provsnContactList.addEventHandler("oncellclick", this.grid_closeList_oncellclick, this);
            this.btn_new.addEventHandler("onclick", this.btn_new_onclick, this);
            this.btn_del.addEventHandler("onclick", this.btn_del_onclick, this);
            this.ta_callDtl.addEventHandler("oneditclick", this.ta_callDtl_oneditclick, this);
            this.divCallDtl.addEventHandler("onkillfocus", this.divCallDtl_onkillfocus, this);
            this.btn_sndSms.addEventHandler("onclick", this.btn_sndSms_onclick, this);

        };

        this.loadIncludeScript("RTSDProvisionalContractContactPopUp.xfdl");

       
    };
}
)();

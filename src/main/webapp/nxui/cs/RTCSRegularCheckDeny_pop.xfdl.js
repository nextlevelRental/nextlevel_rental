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
                this.set_name("RTCSRegularCheckDeny_pop");
                this.set_classname("RTCSRegularCheckDeny_pop");
                this.set_titletext("정기점검 거부/철회");
                this._setFormPosition(0,0,719,413);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_listDeny", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"denySeq\" type=\"STRING\" size=\"256\"/><Column id=\"denyYn\" type=\"STRING\" size=\"256\"/><Column id=\"denyYmd\" type=\"STRING\" size=\"256\"/><Column id=\"denyId\" type=\"STRING\" size=\"256\"/><Column id=\"denyStdYm\" type=\"STRING\" size=\"256\"/><Column id=\"denyDesc\" type=\"STRING\" size=\"256\"/><Column id=\"wthdrwYmd\" type=\"STRING\" size=\"256\"/><Column id=\"wthdrwId\" type=\"STRING\" size=\"256\"/><Column id=\"wthdrwStdYm\" type=\"STRING\" size=\"256\"/><Column id=\"wthdrwDesc\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_denyYn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">거부</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">철회</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static18", "absolute", "705", "0", "15", "406", null, null, this);
            obj.set_taborder("2");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "711", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "10", "9", "158", "21", null, null, this);
            obj.set_taborder("6");
            obj.set_text("정기점검 거부/철회목록");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "29", "711", "10", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_denyList", "absolute", "9", "39", "696", "181", null, null, this);
            obj.set_taborder("8");
            obj.set_binddataset("ds_listDeny");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"95\"/><Column size=\"81\"/><Column size=\"38\"/><Column size=\"81\"/><Column size=\"56\"/><Column size=\"85\"/><Column size=\"74\"/><Column size=\"87\"/><Column size=\"76\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"고객명\"/><Cell col=\"2\" text=\"순번\"/><Cell col=\"3\" text=\"거부기준월\"/><Cell col=\"4\" displaytype=\"normal\" text=\"거부상태\"/><Cell col=\"5\" text=\"거부등록일\"/><Cell col=\"6\" text=\"거부등록자\"/><Cell col=\"7\" text=\"철회등록일\"/><Cell col=\"8\" text=\"철회등록자\"/></Band><Band id=\"body\"><Cell style=\"align:center;\" text=\"bind:ordNo\"/><Cell col=\"1\" text=\"bind:custNm\"/><Cell col=\"2\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:denySeq\"/><Cell col=\"3\" style=\"align:center;\" text=\"bind:denyStdYm\" mask=\"####-##\"/><Cell col=\"4\" displaytype=\"combo\" style=\"align:center;\" text=\"bind:denyYn\" combodataset=\"ds_denyYn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"5\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:denyYmd\" mask=\"####-##-##\"/><Cell col=\"6\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:denyId\"/><Cell col=\"7\" style=\"align:center;\" text=\"bind:wthdrwYmd\" mask=\"####-##-##\"/><Cell col=\"8\" style=\"align:center;\" text=\"bind:wthdrwId\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\"/><Cell col=\"2\" text=\"총계\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"6\" style=\"align:right;\"/><Cell col=\"7\"/><Cell col=\"8\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "396", null, null, this);
            obj.set_taborder("9");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Button("btn_deny", "absolute", "610", "9", "45", "22", null, null, this);
            obj.set_taborder("24");
            obj.set_text("거부");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_wthdrw", "absolute", "660", "9", "45", "22", null, null, this);
            obj.set_taborder("25");
            obj.set_text("철회");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "339", "379", "41", "21", null, null, this);
            obj.set_taborder("28");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "399", null, "15", "-1", null, this);
            obj.set_taborder("29");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_denyStdYm", "absolute", "503", "9", "93", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("30");
            obj.set_dateformat("yyyy-MM");
            obj.set_enable("false");
            obj.set_value("null");
            obj.set_editformat("yyyy-MM");

            obj = new Static("st_denyStdYm", "absolute", "418", "10", "81", "21", null, null, this);
            obj.set_taborder("31");
            obj.set_text("거부기준월");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "230", "158", "21", null, null, this);
            obj.set_taborder("32");
            obj.set_text("거부내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "362", "230", "158", "21", null, null, this);
            obj.set_taborder("33");
            obj.set_text("철회내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new TextArea("ta_denyDesc", "absolute", "1.39%", "259", null, "111", "51.04%", null, this);
            obj.set_taborder("34");
            obj.set_maxlength("1800");
            obj.set_readonly("true");
            obj.set_wordwrap("char");
            this.addChild(obj.name, obj);

            obj = new TextArea("ta_wthdrwDesc", "absolute", "50.49%", "259", null, "111", "1.95%", null, this);
            obj.set_taborder("35");
            obj.set_maxlength("1800");
            obj.set_readonly("true");
            obj.set_wordwrap("char");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "220", "711", "10", null, null, this);
            obj.set_taborder("36");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "249", "711", "10", null, null, this);
            obj.set_taborder("37");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "0", "370", "711", "10", null, null, this);
            obj.set_taborder("38");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 719, 413, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSRegularCheckDeny_pop");
            		p.set_titletext("정기점검 거부/철회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item6","cal_denyStdYm","value","ds_list_main","planDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ta_denyDesc","value","ds_listDeny","denyDesc");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","ta_wthdrwDesc","value","ds_listDeny","wthdrwDesc");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSRegularCheckDeny_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSRegularCheckDeny_pop.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSRegularCheckDeny_pop.xfdl
         * 설    명 : 정기점검 거부철회(팝업)
         * 작 성 자 : wjim
         * 변경이력 
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2017-07-26	wjim		[20170726_01] 신규 개발
         ***************************************************************************************************/
        //include "lib::comLib.xjs";

        // 전역변수 선언
        this.fs_ordNo = "";	// 계약번호
        this.fs_equNo = "";	// 설비번호
        this.fs_stdYm = "";	// 배정기준년월
        this.fn_curRow = 0; // 선택된 행

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTCSRegularCheckDeny_pop_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	// 팝업 호출한 모화면의 전달 파라미터를 전역변수로 할당
        	this.fs_ordNo = this.parent.p_ordNo;	// 계약번호
        	this.fs_equNo = this.parent.p_equNo;	// 설비번호
        	this.fs_stdYm = this.parent.p_stdYm;	// 배정기준년월
        	
        	// 거부기준월 세팅
        	this.cal_denyStdYm.set_value(this.fs_stdYm);
        	
        	// 조회
        	this.fn_search();
        }

        /**
         * 정기점검 거부철회목록 조회
         */
        this.fn_search = function() {
        	// 기존 조회결과 초기화
        	this.ds_listDeny.deleteAll();
        	
        	var sSvcID        	= "listDeny";                    
        	var sController   	= "/rtms/cs/selectDenyList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_listDeny=ds_listDeny";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("ordNo", this.fs_ordNo);
        	
        	//application.set_httptimeout(330);
        	 
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 거부 버튼의 클릭 이벤트 처리
         */
        this.btn_deny_onclick = function(obj,e) {
        	if (confirm( "거부기준월 이후 배정정보가 모두 점검거부처리됩니다.\n진행하시겠습니까?")) {	
        		var arr ={p_mode : "deny"};				
        		Ex.core.popup(this, "거부내용등록", "cs::RTCSRegularCheckDenyDesc_pop.xfdl", arr, "modaless=false");		
        	}
        }

        /**
         * 철회 버튼의 클릭 이벤트 처리
         */
        this.btn_wthdrw_onclick = function(obj,e) {
        	this.fn_curRow = this.grid_denyList.currentrow;
        	
        	if (this.fn_curRow < 0) {
        		this.alert("철회할 거부정보가 선택되지 않았습니다");
        		return false;
        	} else {
        		if (confirm( "거부기준월 이후 점검거부건이 모두 초기배정상태로 변경됩니다.\n진행하시겠습니까?")) {
        			var arr ={p_mode : "withdraw"};				
        			Ex.core.popup(this, "철회내용등록", "cs::RTCSRegularCheckDenyDesc_pop.xfdl", arr, "modaless=false");			
        		}
        	}
        }

        /**
         * 거부/철회 내용입력 팝업 이후 처리
         */
        this.returnInputDesc = function(arg1,arg2,arg3){
        	if (arg1 == "confirm" ) {
        		var sSvcID       = "";  
        		var sController  = "";
        		var sInDatasets  = "";
        		var sOutDatasets = "";
        		var sArgs 		 = "";	
        		var fn_callBack	 = "fn_callBack";
        		
        		if (arg2 == "deny") {
        			sSvcID       = "saveDeny";  
        			sController  = "/rtms/cs/saveDeny.do";
        			
        			sArgs += Ex.util.setParam("ordNo"	 , nvl(this.fs_ordNo));
        			sArgs += Ex.util.setParam("equNo"    , nvl(this.fs_equNo));
        			sArgs += Ex.util.setParam("denyStdYm", nvl(this.fs_stdYm));
        			sArgs += Ex.util.setParam("denyDesc" , nvl(arg3));

        		} else if (arg2 == "withdraw") {
        			sSvcID       = "saveWithdraw";  
        			sController  = "/rtms/cs/saveWithdraw.do";
        			
        			sArgs += Ex.util.setParam("ordNo"	   , nvl(this.ds_listDeny.getColumn(this.fn_curRow, "ordNo")));
        			sArgs += Ex.util.setParam("equNo"      , nvl(this.ds_listDeny.getColumn(this.fn_curRow, "equNo")));
        			sArgs += Ex.util.setParam("denySeq"    , nvl(this.ds_listDeny.getColumn(this.fn_curRow, "denySeq")));
        			sArgs += Ex.util.setParam("wthdrwStdYm", nvl(this.ds_listDeny.getColumn(this.fn_curRow, "denyStdYm")));
        			sArgs += Ex.util.setParam("wthdrwDesc" , nvl(arg3));
        					
        		} else {
        			return false;
        		}
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        /**
         * 닫기 버튼의 클릭 이벤트 처리
         */
        this.btn_close_onclick = function(obj,e) {
        	this.close();
        }

        /**
         * Transaction CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		case "listDeny":			
        			var rowCt = this.ds_listDeny.getRowCount();
        		
         			if (rowCt == 0) {
         				this.grid_denyList.set_nodatatext("조회된 데이터가 없습니다.");
         			}	
         						
        			break;
        			
        		case "saveDeny":
        			this.alert(strErrorMsg);			
        			this.fn_search();
        			break;
        			
        		case "saveWithdraw":
        			this.alert(strErrorMsg);			
        			this.fn_search();
        			break;
        			
        		default:
        			break;
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCSRegularCheckDeny_pop_onload, this);
            this.grid_denyList.addEventHandler("oncellclick", this.grid_contactList_oncellclick, this);
            this.btn_deny.addEventHandler("onclick", this.btn_deny_onclick, this);
            this.btn_wthdrw.addEventHandler("onclick", this.btn_wthdrw_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.ta_denyDesc.addEventHandler("oneditclick", this.ta_callDtl_oneditclick, this);
            this.ta_wthdrwDesc.addEventHandler("oneditclick", this.ta_callDtl_oneditclick, this);

        };

        this.loadIncludeScript("RTCSRegularCheckDeny_pop.xfdl");

       
    };
}
)();

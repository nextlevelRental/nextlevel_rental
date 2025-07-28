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
                this.set_name("frm_RTREFullPayRehSearch");
                this.set_classname("test_form");
                this.set_titletext("중도완납/해지 내역조회");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_fullPayRehSearchList", this);
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"cncDay\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"mfpCd\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"totRentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"recvAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"pnltAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"totRecvAmt\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"recvRt\" type=\"STRING\" size=\"256\"/><Column id=\"mfpRsnCd\" type=\"STRING\" size=\"256\"/><Column id=\"mfpDesc\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_mfpCd", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_mfpRsnCd", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_fullPayRehSearchList", "absolute", "0", "86", "1122", "185", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_fullPayRehSearchList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"65\"/><Column size=\"75\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"90\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"1\"/><Column size=\"50\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"취소일자\"/><Cell col=\"2\" text=\"수납일자\"/><Cell col=\"3\" text=\"구분\"/><Cell col=\"4\" text=\"장착일자\"/><Cell col=\"5\" text=\"고객번호\"/><Cell col=\"6\" text=\"고객명\"/><Cell col=\"7\" text=\"총랜탈료\"/><Cell col=\"8\" text=\"수납금액\"/><Cell col=\"9\" text=\"위약금\"/><Cell col=\"10\" text=\"총수납금액\"/><Cell col=\"11\" text=\"회수율\"/><Cell col=\"12\" text=\"회수율\"/><Cell col=\"13\" text=\"완납/해지사유\"/><Cell col=\"14\" text=\"상세사유\"/></Band><Band id=\"body\"><Cell style=\"align:center middle;\" text=\"bind:ordNo\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" style=\"align:center middle;\" text=\"bind:cncDay\" mask=\"####-##-##\"/><Cell col=\"2\" style=\"align:center middle;\" text=\"bind:recvDay\" mask=\"####-##-##\"/><Cell col=\"3\" style=\"align:center middle;\" text=\"bind:mfpCdNm\"/><Cell col=\"4\" style=\"align:center middle;\" text=\"bind:procDay\" mask=\"####-##-##\"/><Cell col=\"5\" style=\"align:center middle;\" text=\"bind:custNo\"/><Cell col=\"6\" displaytype=\"normal\" style=\"align:right middle;\" text=\"bind:custNm\"/><Cell col=\"7\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:totRentAmt\" mask=\"###,###,###,##0\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:recvAmt\" mask=\"###,###,###,##0\"/><Cell col=\"9\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:pnltAmt\" mask=\"###,###,###,##0\"/><Cell col=\"10\" displaytype=\"number\" style=\"align:right middle;\" text=\"bind:totRecvAmt\" mask=\"###,###,###,##0\"/><Cell col=\"11\"/><Cell col=\"12\" text=\"bind:recvRt\"/><Cell col=\"13\" text=\"bind:mfpRsnCdNm\"/><Cell col=\"14\" text=\"bind:mfpDesc\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_accImmWthdrList", "absolute", "0", "61", "120", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "45", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_ractDay", "absolute", "20", "10", "70", "21", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("취소일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_cncFDay", "absolute", "96", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Calendar("cal_cncTDay", "absolute", "216", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static07", "absolute", "203", "10", "10", "21", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_ordNo", "absolute", "337", "10", "70", "21", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNo", "absolute", "555", "10", "70", "21", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "633", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp", "absolute", "713", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("5");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNoKeyword", "absolute", "732", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("6");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "413", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("2");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_ordPopUp", "absolute", "512", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_ordNo00", "absolute", "842", "10", "45", "21", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_text("구분");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_ordNo01", "absolute", "979", "10", "45", "21", null, null, this.div_search);
            obj.set_taborder("34");
            obj.set_text("사유");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_mfpCd", "absolute", "79.25%", "10", "80", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("35");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_innerdataset("@ds_mfpCd");
            obj = new Combo("cb_mfpRsnCd", "absolute", "91.77%", "10", "80", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("36");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_innerdataset("@ds_mfpRsnCd");


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("중도완납/해지 내역조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREFullPayRehSearch.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREFullPayRehSearch.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 중도완납/해지 내역조회
         * 02. 그룹명		: RTREFullPayRehisSearch.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 2018-12-10
         * 05. 작성자		: 심성규
         * 06. 수정이력	:
         ***********************************************************************

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
        this.toDay = "";

        /***********************************************************************************
        * Form Load Common Function
        ***********************************************************************************/
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	/* 현재일자 */
        	this.fn_getDate();
        	
        	this.fn_initComboMfpCd();
        	this.fn_initComboMfpRsnCd();
        	
        	/* 공통버튼 */
        	this.parent.setButton("S|E", this);
        }

        /***********************************************************************************
        * Transaction Function
        ***********************************************************************************/
        /**
         * 현재일자 조회
         */
        this.fn_getDate = function() {
        	/*
        	var sSvcID		 = "getDate";
        	var sController	 = "/rtms/comm/getToday.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	*/
        	//Eco.date.getFirstDate(this.toDay)
        	this.div_search.cal_cncFDay.set_value(FN_firstDay());
        	this.div_search.cal_cncTDay.set_value(FN_today());
        }

        /**
         * 콤보박스 데이터셋 구분
         */
        this.fn_initComboMfpCd = function() {
        	var sSvcID      	= "commonUserGroupCodeListS070";  
        	var sController   	= "ntrms/re/commUserGroupCodeList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	sOutDatasets 		= "ds_mfpCd=output";
        	
        	var sArgs 			= "";
        		sArgs		   += Ex.util.setParam("cdGrpCd", "S070");
        		sArgs		   += Ex.util.setParam("cdNm",  "");
        		sArgs		   += Ex.util.setParam("useYn", "Y");
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 콤보박스 데이터셋 사유
         */
        this.fn_initComboMfpRsnCd = function() {
        	var sSvcID      	= "commonUserGroupCodeListR053";  
        	var sController   	= "ntrms/re/commUserGroupCodeList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	sOutDatasets 		= "ds_mfpRsnCd=output";
        	
        	var sArgs 			= "";
        		sArgs		   += Ex.util.setParam("cdGrpCd", "R053");
        		sArgs		   += Ex.util.setParam("cdNm",  "");
        		sArgs		   += Ex.util.setParam("useYn", "Y");
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 중도완납/해지 내역조회
         */
        this.fn_fullPayRehSearchList = function() {
        	var sRactFDay = this.div_search.cal_cncFDay.value;	/* 취소일자 StartDay	*/
        	var sRactTDay = this.div_search.cal_cncTDay.value;	/* 취소일자 EndDay		*/
        	var sOrdNo	  = this.div_search.ed_ordNo.text;		/* 계약번호			*/
        	var sCustNo	  = this.div_search.ed_custNo.text;		/* 고객번호			*/
        	var sMfpCd	  = this.div_search.cb_mfpCd.value;		/* 구분					*/
        	var sMfpRsnCd = this.div_search.cb_mfpRsnCd.value;	/* 사유					*/
        	this.ds_fullPayRehSearchList.clearData();
        	
        	var sSvcID        	= "retrieveFullPayRehSearchList";
        	var sController   	= "ntrms/re/fullPayRehSearchList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_fullPayRehSearchList=output";
        	var sArgs 			= "";
        		sArgs		   += Ex.util.setParam("cncFDay",  nvl(sRactFDay));
        		sArgs		   += Ex.util.setParam("cncTDay",  nvl(sRactTDay));
        		sArgs		   += Ex.util.setParam("ordNo",	   nvl(sOrdNo));
        		sArgs		   += Ex.util.setParam("custNo",   nvl(sCustNo));
        		sArgs		   += Ex.util.setParam("mfpCd",    nvl(sMfpCd));
        		sArgs		   += Ex.util.setParam("mfpRsnCd", nvl(sMfpRsnCd));
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        /***********************************************************************************
         * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	switch(strSvcId) {
        		case "commonUserGroupCodeListS070":
        			var insert = this.ds_mfpCd.insertRow( 0 );
        			this.ds_mfpCd.setColumn(insert,"cd"," ");
        			this.ds_mfpCd.setColumn(insert,"cdNm","전체");
        			this.div_search.cb_mfpCd.set_value( " " );
        			break;
        		case "commonUserGroupCodeListR053":
        			var insert = this.ds_mfpRsnCd.insertRow( 0 );
        			this.ds_mfpRsnCd.setColumn(insert,"cd"," ");
        			this.ds_mfpRsnCd.setColumn(insert,"cdNm","전체");
        			this.div_search.cb_mfpRsnCd.set_value( " " );
        			break;	
        	
        		case "getDate":
        			var sFirstDay = Eco.date.getFirstDate(this.toDay);
        			
        			this.div_search.cal_cncFDay.set_value(sFirstDay);
        			this.div_search.cal_cncTDay.set_value(this.toDay);
        			break;
        		case "retrieveFullPayRehSearchList":
        			if(this.ds_fullPayRehSearchList.getRowcount() == 0) {
        				this.grd_fullPayRehSearchList.set_nodatatext("조회된 데이터가 없습니다.");
        			} else {
        				this.ds_fullPayRehSearchList.set_rowposition(0);
        			}
        			break;
        		default:
        			break;
        	}
        }

        /**
         * 계약번호 Popup Callback
         */
        this.returnOrderNoInfo = function(val) {
        	this.div_search.ed_ordNo.set_value(val[0].getColumn(0, "ordNo"));
        }

        /**
         * 고객번호 Popup Callback
         */
        this.returnCustInfo = function(arr) {
        	if(arr[0].rowcount > 0) {
        		if(nvl(arr[0].getColumn(0, "custNo")) != "") {
        			this.div_search.ed_custNo.set_value(arr[0].getColumn(0, "custNo"));
        		}
        		
        		if(nvl(arr[0].getColumn(0, "custNm")) != "") {
        			this.div_search.ed_custNoKeyword.set_value(arr[0].getColumn(0, "custNm"));
        		}
        	}
        }

        /***********************************************************************************
         * User Function
         ***********************************************************************************/

        /***********************************************************************************
         * Component Event & Function
         ***********************************************************************************/
        /**
         * 조회
         */
        this.fn_search = function() {
        	this.fn_fullPayRehSearchList();
        }

        /**
         * 엑셀 버튼의 클릭 이벤트 처리
         */
        this.fn_excel = function(obj,e) {
        	if(this.ds_fullPayRehSearchList.getRowCount() > 0) {
        		Ex.core.exportExcel(this, this.grd_fullPayRehSearchList, "중도완납/해지 내역조회");
        	} else {
        		this.alert("다운로드할 조회결과가 없습니다");
        	}
        }

        /**
         * 계약번호 팝업
         */
        this.fn_ordPopUp = function(obj,e) {
        	var args = {p_arg : "RTREVacc"};
        	
        	Ex.core.popup(this, "계약번호 조회", "comm::RTCOMMOrderNo_pop.xfdl", args, "modaless=false");
        }

        /**
         * 고객번호 팝업
         */
        this.fn_custPopUp = function(obj,e) {
        	var args = {  p_formId : this.id
        				, p_custNo : nvl(this.div_search.ed_custNo.value)
        				, p_custNm : nvl(this.div_search.ed_custNoKeyword.value)
        			   };
        	
        	Ex.core.popup(this, "고객찾기", "comm::RTCOMMCust_pop.xfdl", args, "modaless=false");
        }

        /**
         * ds_accImmWthdrList Onrowposchanged Event
         */
        this.ds_fullPayRehSearchList_onrowposchanged = function(obj,e) {
        	this.fn_fullPayRehSearchList();
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cal_cncFDay.addEventHandler("onchanged", this.cal_referDate_onchanged, this);
            this.div_search.cal_cncTDay.addEventHandler("onchanged", this.cal_referDate_onchanged, this);
            this.div_search.ed_custNo.addEventHandler("onkeyup", this.div_search_ed_custNo_onkeyup, this);
            this.div_search.btn_custPopUp.addEventHandler("onclick", this.fn_custPopUp, this);
            this.div_search.ed_ordNo.addEventHandler("onkeyup", this.div_search_ed_ordNo_onkeyup, this);
            this.div_search.btn_ordPopUp.addEventHandler("onclick", this.fn_ordPopUp, this);

        };

        this.loadIncludeScript("RTREFullPayRehSearch.xfdl");

       
    };
}
)();

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
                this.set_name("RTREAllowancePay");
                this.set_classname("RTREAllowancePay");
                this.set_titletext("충당금 지급관리");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_payList", this);
            obj._setContents("<ColumnInfo><Column id=\"regYm\" type=\"STRING\" size=\"256\"/><Column id=\"regSeq\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDay\" type=\"STRING\" size=\"256\"/><Column id=\"payAmt\" type=\"STRING\" size=\"256\"/><Column id=\"payMsg\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1122", "45", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_agency", "absolute", "8", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("12");
            obj.set_text("대리점코드");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "371", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("13");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", null, "12", "0", null, this.div_search);
            obj.set_taborder("14");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "30", null, "12", "0", null, this.div_search);
            obj.set_taborder("15");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyCd", "absolute", "112", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("16");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "251", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("17");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_agency", "absolute", "231", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "61", "169", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_text("지급내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_rtcs0202", "absolute", "0", "86", "1122", "306", null, null, this);
            obj.set_taborder("3");
            obj.set_binddataset("ds_payList");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"67\"/><Column size=\"40\"/><Column size=\"73\"/><Column size=\"122\"/><Column size=\"71\"/><Column size=\"91\"/><Column size=\"173\"/><Column size=\"60\"/><Column size=\"84\"/><Column size=\"121\"/><Column size=\"80\"/><Column size=\"118\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"등록년월\"/><Cell col=\"1\" text=\"순번\"/><Cell col=\"2\" text=\"대리점코드\"/><Cell col=\"3\" text=\"대리점명\"/><Cell col=\"4\" text=\"지급일자\"/><Cell col=\"5\" text=\"지급금액\"/><Cell col=\"6\" text=\"지급사유\"/><Cell col=\"7\" text=\"사용여부\"/><Cell col=\"8\" text=\"등록자\"/><Cell col=\"9\" text=\"등록일시\"/><Cell col=\"10\" text=\"수정자\"/><Cell col=\"11\" text=\"수정일시\"/></Band><Band id=\"body\"><Cell text=\"bind:regYm\" mask=\"####-##\" tooltiptext=\"bind:awSeq\"/><Cell col=\"1\" text=\"bind:regSeq\" tooltiptext=\"bind:agencyCd\"/><Cell col=\"2\" text=\"bind:agencyCd\" tooltiptext=\"bind:agencyNm\"/><Cell col=\"3\" text=\"bind:agencyNm\"/><Cell col=\"4\" displaytype=\"date\" text=\"bind:payDay\" tooltiptext=\"bind:warehCd\"/><Cell col=\"5\" style=\"align:right;\" text=\"bind:payAmt\" tooltiptext=\"bind:warehNm\"/><Cell col=\"6\" displaytype=\"normal\" text=\"bind:payMsg\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:begday\"/><Cell col=\"7\" displaytype=\"normal\" text=\"bind:useYn\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:endday\"/><Cell col=\"8\" text=\"bind:regId\" tooltiptext=\"bind:useYn\"/><Cell col=\"9\" text=\"bind:regDt\" mask=\"####-##-## ##:##:##\"/><Cell col=\"10\" text=\"bind:chgId\"/><Cell col=\"11\" text=\"bind:chgDt\" mask=\"####-##-## ##:##:##\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\"/><Cell col=\"2\" style=\"align:right;\"/><Cell col=\"3\" text=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\" style=\"align:right;\"/><Cell col=\"6\" style=\"align:right;\"/><Cell col=\"7\" style=\"align:right;\"/><Cell col=\"8\" style=\"align:right;\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "435", "1122", "31", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_payDay", "absolute", "448", "435", "100", "31", null, null, this);
            obj.set_taborder("5");
            obj.set_text("지급일자");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_payAmt", "absolute", "718", "435", "100", "31", null, null, this);
            obj.set_taborder("6");
            obj.set_text("지급금액");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_agency", "absolute", "0", "435", "100", "31", null, null, this);
            obj.set_taborder("7");
            obj.set_text("대리점코드");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "465", "1122", "31", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_payMsg", "absolute", "0", "465", "100", "31", null, null, this);
            obj.set_taborder("10");
            obj.set_text("지급사유");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Button("btn_delete", "absolute", "1081", "405", "41", "21", null, null, this);
            obj.set_taborder("11");
            obj.set_text("삭제");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_insert", "absolute", "1036", "405", "41", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_text("신규");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_payDay", "absolute", "553", "440", "160", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("13");
            obj.set_dateformat("yyyy-MM-dd");
            obj.style.set_align("middle");

            obj = new Combo("cb_useYn", "absolute", "823", "470", "160", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("15");
            obj.set_autoselect("true");
            obj.set_innerdataset("ds_useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("0");

            obj = new Static("Static11", "absolute", "0", "407", "169", "20", null, null, this);
            obj.set_taborder("16");
            obj.set_text("새부내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_agencyCd", "absolute", "104", "440", "88", "21", null, null, this);
            obj.set_taborder("17");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("bt_agency", "absolute", "190", "439", "21", "21", null, null, this);
            obj.set_taborder("18");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_agencyNm", "absolute", "210", "440", "232", "21", null, null, this);
            obj.set_taborder("19");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "45", "1147", "20", null, null, this);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_useYn00", "absolute", "718", "465", "100", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_payMsg", "absolute", "104", "470", "610", "21", null, null, this);
            obj.set_taborder("25");
            obj.set_maxlength("100");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_payAmt", "absolute", "823", "440", "160", "21", null, null, this);
            obj.set_taborder("26");
            obj.set_mask("###,###,##0");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTREAllowancePay");
            		p.set_titletext("충당금 지급관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item2","cal_payDay","value","ds_payList","payDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","cb_useYn","value","ds_payList","useYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","ed_agencyCd","value","ds_payList","agencyCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_agencyNm","value","ds_payList","agencyNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_payMsg","value","ds_payList","payMsg");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item24","ed_payAmt","value","ds_payList","payAmt");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREAllowancePay.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREAllowancePay.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTREAllowancePay.xfdl
         * 설    명 : 충당금 지급내역 관리
         * 작 성 자 : wjim
         * 변경이력 
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * ---------------------------------
         * 2017-11-23	wjim		[20171117_02] 신규 개발
         ***************************************************************************************************/
        //include "lib::comLib.xjs";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTREAllowancePay_onload = function(obj,e) {
        	// 화면 초기화
        	Ex.core.init(obj);
        	// 상단 공통버튼 세팅 (조회, 저장, 엑셀)
        	this.parent.setButton("E|C|S", this);
        	
        }

        /**
         * 조회조건-대리점 찾기 버튼 클릭 이벤트 처리
         * - 대리점조회 화면이 팝업
         */
        this.div_search_bt_agency_onclick = function(obj,e){
        	var args = {p_arg : "RTCSWarehAgencyRegister_select"};	// [대리점 창고 관리] 화면 참고
        	Ex.core.popup(this, "대리점 조회", "comm::RTCOMMAgency_pop.xfdl", args, "modaless=false");
        }

        /**
         * 조회조건-대리점 찾기 결과 처리
         * - 대리점조회 팝업화면에서 선택한 정보가 조회조건에 세팅
         */ 
        this.returnAgencyCdSelect = function(res) {
        	this.div_search.ed_agencyCd.set_value(res[0]);	//대리점코드
        	this.div_search.ed_agencyNm.set_value(res[1]);	//대리점명
        }

        /**
         * '조회' 버튼의 클릭 이벤트 처리
         */
        this.fn_search = function() {
        	// 기존 조회결과 초기화
        	this.ds_payList.deleteAll();
        	
        	var agencyCd = nvl(this.div_search.ed_agencyCd.value);
        	var userId   = application.gds_userInfo.getColumn(0, "userId"); //사용자ID
        	
        	var sSvcID        	= "listMain";                    
        	var sController   	= "/rtms/re/getAllowancePayList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_payList=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("agencyCd", agencyCd);
        	sArgs += Ex.util.setParam("userId", userId);

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /**
         * '저장' 버튼의 클릭 이벤트 처리
         */
        this.fn_save = function() {
        	// 저장 필수값 확인
        	if (!this.FN_saveCheckRequired()) {
        		return false;
        	}
        	
        	// 저장대상이 있는지 확인
        	if (!this.FN_saveCheckChange()) {
        		this.alert('변경된 데이터가 없습니다.');
        		return false;
        	}
        	
        	// 저장대상이 1건인지 확인
        	if (!this.FN_saveCheckChangeCount()) {
        		this.alert('변경된 데이터가 1건 이상입니다.');
        		return false;
        	}
        	
        	var sSvcID        	= "saveMain";                    
        	var sController   	= "/rtms/re/saveAllowancePayList.do";
        	var sInDatasets   	= "input=ds_payList:U";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 저장 필수값 확인
         */
        this.FN_saveCheckRequired = function(){
        	var returnFlag = true;
        	var cnt = this.ds_payList.getRowCount();
        	var msg = " 값이 없습니다.";
        	
        	for (var i=0; i < cnt; i++) {
        		if ((this.ds_payList.getRowType(i) == 2) || (this.ds_payList.getRowType(i) == 4)) {
        			var agencyCd= nvl(this.ds_payList.getColumn(i,"agencyCd"));
        			var payDay 	= nvl(this.ds_payList.getColumn(i,"payDay"));
        			var useYn 	= nvl(this.ds_payList.getColumn(i,"useYn"));
        			
        			if (agencyCd == "") { 	
        				this.alert("대리점코드" + msg);
        				this.ds_payList.set_rowposition(i);
        				this.ed_agencyCd.setFocus(true);
        				returnFlag = false;
        				break;
        			}
        			if (payDay == "") {
        			 	this.alert("지급일자"   + msg);
        			 	this.ds_payList.set_rowposition(i);
        			 	this.cal_payDay.setFocus(true);
        			 	returnFlag = false;
        			 	break;
        			}
        			if (useYn == "") {
        				this.alert("사용여부"   + msg);
        				this.ds_payList.set_rowposition(i);
        				this.cb_useYn.setFocus(true);
        				returnFlag = false;
        				break;
        			}
        		}
        	}
        	
        	return returnFlag;
        }

        /**
         * 저장대상이 있는지 확인
         * - 신규, 변경된 행이 있는가?
         */
        this.FN_saveCheckChange = function() {
        	var returnFlag = true;
        	var cnt = this.ds_payList.getRowCount();
        	
        	for (var i=0; i < cnt; i++) {
        		if ((this.ds_payList.getRowType(i) == 2) || (this.ds_payList.getRowType(i) == 4)) {
        			returnFlag = true;
        			break;
        		} else {
        			returnFlag = false;
        		}
        	}
        	
        	return returnFlag;
        }

        /**
         * 저장대상이 1건인지 확인
         * - 1건이 아닌 경우 저장 불가
         */
        this.FN_saveCheckChangeCount = function() {
        	var returnFlag = true;
        	var changeCount = 0;	
        	var cnt = this.ds_payList.getRowCount();
        	
        	for (var i=0 ; i < cnt ; i++) {
        		if ((this.ds_payList.getRowType(i) == 2) || (this.ds_payList.getRowType(i) == 4)) {
        			changeCount++;
        		}
        	}
        	
        	if (changeCount == 1){
        		returnFlag = true;
        	} else {
        		returnFlag = false;
        	}
        	
        	return returnFlag;
        }

        /**
         * '신규' 버튼의 클릭 이벤트 처리
         */
        this.btn_insert_onclick = function(obj,e) {
        	if (this.FN_addRow()) {
        		this.FN_addValue();
        	}
        }

        /**
         * 행추가가 가능한지 확인
         * - 이미 추가, 수정된 행이 있으면 신규 행 추가 불가
         */
        this.FN_addRow = function() {
        	var addRowFlag = false;
        	var cnt = this.ds_payList.getRowCount();
        	
        	if (cnt == 0) {
        		addRowFlag = true;
        	} else {		
        		for (var i=0; i < cnt; i++) {
        			if (this.ds_payList.getRowType(i) == 2 || this.ds_payList.getRowType(i) == 4) {
        				this.alert("추가,수정된 행이 있으므로 추가하실 수 없습니다.\n저장 후 다시 작업하세요.");
        				this.ds_payList.set_rowposition(i);
        				addRowFlag = false;
        				break;
        			} else {
        				addRowFlag = true;
        			}
        		}
        	}
        	return addRowFlag;
        }

        /**
         * 행추가 실행
         */
        this.FN_addValue = function(){
        	// 행추가
        	var nRow = this.ds_payList.addRow();
        	// 초기값 세팅
        	this.cb_useYn.set_value("Y");
        }

        /**
         * '삭제' 버튼의 클릭 이벤트 처리
         * - 신규 추가된 행을 삭제
         */
        this.btn_delete_onclick = function(obj,e) {
        	var delRow = -1;
        	var cnt = this.ds_payList.getRowCount();
        	
        	for (var i=0; i < cnt ; i++) {
        		if (this.ds_payList.getRowType(i) == 2) {
        			delRow = i;
        		} else {
        			delRow = -1
        		}
        	}
        	
        	if (delRow != -1) {
        		this.ds_payList.deleteRow(delRow);
        	} else {
        		alert("삭제할 행이 없습니다.");
        	}
        }

        /**
         * 세부내용-대리점 찾기 버튼 클릭 이벤트 처리
         * - 대리점조회 화면이 팝업
         */
        this.bt_agency_onclick = function(obj,e) {
        	var args = {p_arg : "RTCSWarehAgencyRegister_insert"}; // [대리점 창고 관리] 화면 참고
        	Ex.core.popup(this, "대리점 조회", "comm::RTCOMMAgency_pop.xfdl", args, "modaless=false");
        }

        /**
         *세부내용-대리점 찾기 결과 처리
         * - 대리점조회 팝업화면에서 선택한 정보가 세부내용에 세팅
         */ 
        this.returnAgencyCdInsert = function(res) {
        	this.ed_agencyCd.set_value( res[0] );
        	this.ed_agencyNm.set_value( res[1] );
        }

        /**
         * Transaction CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0) {
        		alert(strErrorMsg);		
        		return;
        	}
        	
        	switch (strSvcId) {		    
        		// 조회
        		case "listMain":
        			var rowCt = this.ds_payList.getRowCount();

        			if (rowCt == 0) {
        				this.alert("조회된 데이터가 없습니다.");
        				this.grid_rtcs0202.set_nodatatext("조회된 데이터가 없습니다.");
        			} 
        			
        			break;

        		// 저장
        		case "saveMain":
        			this.alert(strErrorMsg);
        		
        			if (nErrorCode == "0") {
        				this.fn_search();
        			}
        			
        			break;
        		
        		// 기타	
        		default:
        			break;
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTREAllowancePay_onload, this);
            this.div_search.ed_agencyCd.addEventHandler("onchanged", this.div_search_ed_agencyCd_onchanged, this);
            this.div_search.bt_agency.addEventHandler("onclick", this.div_search_bt_agency_onclick, this);
            this.grid_rtcs0202.addEventHandler("onselectchanged", this.grid_rtcs0202_onselectchanged, this);
            this.btn_delete.addEventHandler("onclick", this.btn_delete_onclick, this);
            this.btn_insert.addEventHandler("onclick", this.btn_insert_onclick, this);
            this.cal_payDay.addEventHandler("onchanged", this.cal_begday_onchanged, this);
            this.bt_agency.addEventHandler("onclick", this.bt_agency_onclick, this);

        };

        this.loadIncludeScript("RTREAllowancePay.xfdl");

       
    };
}
)();

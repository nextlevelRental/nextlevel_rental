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
                this.set_name("RTREArrearsResult");
                this.set_classname("test_form");
                this.set_titletext("계약번호별 연체내역 조회");
                this._setFormPosition(0,0,1147,496);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"delyDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"matNo\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"pntyAmt\" type=\"STRING\" size=\"256\"/><Column id=\"etcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"apprScnt\" type=\"STRING\" size=\"256\"/><Column id=\"apprAmt\" type=\"STRING\" size=\"256\"/><Column id=\"agenCy\" type=\"STRING\" size=\"256\"/><Column id=\"agenCyNm\" type=\"STRING\" size=\"256\"/><Column id=\"agenCyTel\" type=\"STRING\" size=\"256\"/><Column id=\"errMsg\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cust", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"custTp2\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo2\" type=\"STRING\" size=\"256\"/><Column id=\"posCd2\" type=\"STRING\" size=\"256\"/><Column id=\"addr12\" type=\"STRING\" size=\"256\"/><Column id=\"addr22\" type=\"STRING\" size=\"256\"/><Column id=\"safekey\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"corpNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"oCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"oBirthday\" type=\"STRING\" size=\"256\"/><Column id=\"oGendercd\" type=\"STRING\" size=\"256\"/><Column id=\"oLfcd\" type=\"STRING\" size=\"256\"/><Column id=\"oMobno\" type=\"STRING\" size=\"256\"/><Column id=\"oSafekey\" type=\"STRING\" size=\"256\"/><Column id=\"cCustnm\" type=\"STRING\" size=\"256\"/><Column id=\"cTelno\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr1\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr2\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"taxYn\" type=\"STRING\" size=\"256\"/><Column id=\"kunnr\" type=\"STRING\" size=\"256\"/><Column id=\"ciCd\" type=\"STRING\" size=\"256\"/><Column id=\"diCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_list", "absolute", "0", "124", "1121", "370", null, null, this);
            obj.set_taborder("6");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"79\"/><Column size=\"200\"/><Column size=\"90\"/><Column size=\"200\"/><Column size=\"70\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"70\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"150\"/><Column size=\"100\"/><Column size=\"300\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"연체기준일자\"/><Cell col=\"1\" text=\"계약번호\"/><Cell col=\"2\" text=\"고객번호\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"생년월일\"/><Cell col=\"5\" text=\"우편번호\"/><Cell col=\"6\" text=\"주소\"/><Cell col=\"7\" text=\"휴대폰번호\"/><Cell col=\"8\" text=\"상품명\"/><Cell col=\"9\" text=\"계약기간\"/><Cell col=\"10\" text=\"차량번호\"/><Cell col=\"11\" text=\"장착일자\"/><Cell col=\"12\" text=\"결제방법\"/><Cell col=\"13\" text=\"결제방법명\"/><Cell col=\"14\" text=\"결제일\"/><Cell col=\"15\" text=\"등록비\"/><Cell col=\"16\" text=\"렌탈료\"/><Cell col=\"17\" text=\"위약금\"/><Cell col=\"18\" text=\"기타\"/><Cell col=\"19\" text=\"연체회차\"/><Cell col=\"20\" text=\"연체금액\"/><Cell col=\"21\" text=\"계약처코드\"/><Cell col=\"22\" text=\"계약처명\"/><Cell col=\"23\" text=\"계약처 연락처\"/><Cell col=\"24\" text=\"오류내역\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" text=\"bind:delyDay\"/><Cell col=\"1\" text=\"bind:ordNo\"/><Cell col=\"2\" text=\"bind:custNo\"/><Cell col=\"3\" text=\"bind:custNm\"/><Cell col=\"4\" displaytype=\"date\" text=\"bind:birthDay\"/><Cell col=\"5\" style=\"align:center;\" text=\"bind:posCd\"/><Cell col=\"6\" style=\"align:left;\" text=\"bind:addr\"/><Cell col=\"7\" text=\"bind:mobNo\"/><Cell col=\"8\" text=\"bind:matNm\"/><Cell col=\"9\" text=\"bind:periodCd\"/><Cell col=\"10\" text=\"bind:carNo\"/><Cell col=\"11\" displaytype=\"date\" text=\"bind:procDay\"/><Cell col=\"12\" text=\"bind:payMthd\"/><Cell col=\"13\" text=\"bind:payMthdNm\"/><Cell col=\"14\" text=\"bind:payDd\"/><Cell col=\"15\" style=\"align:right;\" text=\"bind:regiAmt\"/><Cell col=\"16\" style=\"align:right;\" text=\"bind:rentAmt\"/><Cell col=\"17\" style=\"align:right;\" text=\"bind:pntyAmt\"/><Cell col=\"18\" style=\"align:right;\" text=\"bind:etcAmt\"/><Cell col=\"19\" text=\"bind:apprScnt\"/><Cell col=\"20\" style=\"align:right;\" text=\"bind:apprAmt\"/><Cell col=\"21\" text=\"bind:agenCy\"/><Cell col=\"22\" text=\"bind:agenCyNm\"/><Cell col=\"23\" text=\"bind:agenCyTel\"/><Cell col=\"24\" style=\"align:left;\" text=\"bind:errMsg\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\" displaytype=\"number\" style=\"align:right;\" expr=\"dataset.getSum(&quot;regiAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"16\" displaytype=\"number\" style=\"align:right;\" expr=\"dataset.getSum(&quot;rentAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"17\" displaytype=\"number\" style=\"align:right;\" expr=\"dataset.getSum(&quot;pntyAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"18\" displaytype=\"number\" style=\"align:right;\" expr=\"dataset.getSum(&quot;etcAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"19\"/><Cell col=\"20\" displaytype=\"number\" style=\"align:right;\" expr=\"dataset.getSum(&quot;apprAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"21\"/><Cell col=\"22\"/><Cell col=\"23\"/><Cell col=\"24\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "83", "1122", "20", null, null, this);
            obj.set_taborder("14");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "99", "81", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "114", null, "10", "25", null, this);
            obj.set_taborder("16");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "82", null, null, this);
            obj.set_taborder("17");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("8");
            obj.set_text("기준일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "78", null, null, this.div_search);
            obj.set_taborder("10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "77", "47", "21", null, null, this.div_search);
            obj.set_taborder("11");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "19", "41", "114", "30", null, null, this.div_search);
            obj.set_taborder("17");
            obj.set_text("연체회차");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "346", "0", "30", "78", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_delyDay", "absolute", "131", "12", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("st_searchCondition01", "absolute", "376", "12", "64", "20", null, null, this.div_search);
            obj.set_taborder("21");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_custNo", "absolute", "444", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_custNoKeyword", "absolute", "584", "12", "160", "21", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "176", "45", "9", "21", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp", "absolute", "564", "11", "20", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_fromApprScnt", "absolute", "131", "45", "40", "21", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_tooltiptext("edit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            obj.set_inputtype("digit");
            obj.set_value("1");
            obj.style.set_align("right middle");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_toApprScnt", "absolute", "190", "45", "40", "21", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_tooltiptext("edit");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            obj.style.set_align("right middle");
            obj.set_value("99");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", "1117", "12", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "1", "0", "1117", "12", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "66", "1118", "12", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "375", "44", "80", "20", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_orderNo", "absolute", "445", "44", "120", "21", null, null, this.div_search);
            obj.set_taborder("31");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "744", "0", "30", "78", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_ordNo", "absolute", "544", "43", "21", "21", null, null, this.div_search);
            obj.set_taborder("33");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new CheckBox("chk_reminder", "absolute", "84.53%", "12", "20", "20", null, null, this.div_search);
            obj.set_taborder("35");
            obj.style.set_font("bold 9 Dotum");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "773", "12", "170", "20", null, null, this.div_search);
            obj.set_taborder("36");
            obj.set_text("최고장 발송대상고객 제외");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 82, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("17");
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
            		p.set_classname("test_form");
            		p.set_titletext("계약번호별 연체내역 조회");
            		p.style.set_color("#333333ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREArrearsResult.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREArrearsResult.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTREArrearsResult.xfdl
         * 설    명 : 계약번호별 연체내역 조회
         * 작 성 자 : 
         * 변경이력 
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * ---------------------------------
         * 2017-11-16	wjim		[20171116_01] 우편번호 추가
         ***************************************************************************************************/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 	= "RTREArrearsResult";
        this.toDay 	= ""; 	//현재날짜
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){ 
        	if (nErrorCode < 0)	{
        		return Ex.core.comMsg("alert",strErrorMsg);		
        	}
        	
        	switch (strSvcId){
        		case "getDate":
        			var sFirstDay = Eco.date.getFirstDate(this.toDay);	//해당일짜의 1일 가져오기
        			this.div_search.cal_delyDay.set_value(sFirstDay);
        			break;
        		case "getArrearsResultList":		
        			if(this.ds_list.rowcount == 0) {
        				this.grd_list.set_nodatatext("조회된 결과가 없습니다.");
        			}
        			this.div_search_chk_reminder_onchanged(this.div_search.chk_reminder); // 2016-05-04 이영근, 체크박스 추가
        			break;	
        		case "listCustInfo":
        			if(this.ds_cust.rowcount > 0 ) {
        				this.div_search.edt_custNoKeyword.set_value(this.ds_cust.getColumn(0, "custNm"));
        			}
        			break;								
        		default:
        			break;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.form_onload = function(obj,e){
        	Ex.core.init(obj); 		
        	this.fn_init();
        } 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function() {
        	this.get_date();
        	this.fn_initBtn();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.get_date = function() {
        	var sSvcID        	= "getDate";                    
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_initBtn  = function() {
        	/* 1. N : 신규추가
        	 * 2. S : 조회
        	 * 3. C : 데이타생성
        	 * 4. E : 엑셀데이타생성
        	 * 5. AG: 집계
        	 * 6. DN: 다운
        	 */	
        	this.parent.setButton("E|S",this);
        }		
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	if(this.fn_getValid()) {
        		var sSvcID      	= "getArrearsResultList";  
        		var sController   	= "ntrms/re/getArrearsResultList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_list=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += Ex.util.setParam("delyDay"		, nvl(this.div_search.cal_delyDay.value));		//기준일자
        		sArgs += Ex.util.setParam("apprScntF"	, nvl(this.div_search.edt_fromApprScnt.value));	//연체회차 시작	
        		sArgs += Ex.util.setParam("apprScntT"	, nvl(this.div_search.edt_toApprScnt.value));	//연체회차 종료	
        		sArgs += Ex.util.setParam("custNo"		, nvl(this.div_search.edt_custNo.value));		//고객코드
        		sArgs += Ex.util.setParam("ordNo"		, nvl(this.div_search.ed_orderNo.value));		//계약번호
        		
        		// 수행시간을 고려하여 timeout 시간(초) 조정 (default = 60 sec)
        		application.set_httptimeout(300);
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e){
        	if ( e.keycode == 13 ){
        		this.fn_search();
        	}
        }		
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.custNo_onkeyup = function(obj,e){
        	this.div_search.edt_custNoKeyword.set_value("");	
        	if ( e.keycode == 13 ){
        		if(nvl(this.div_search.edt_custNo.value) == "") {
        			this.alert("고객번호를 입력하세요");
        			this.div_search.edt_custNo.setFocus();
        			return;
        		}
        		this.fn_getCustNm();
        	}		
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grd_list_oncelldblclick = function(obj,e){
        	var sDelyDay = this.ds_list.getColumn(this.ds_list.rowposition,"delyDay");	//연체기준일자
        	var sOrdNo   = this.ds_list.getColumn(this.ds_list.rowposition,"ordNo");	//계약번호
        	var sCustNo  = this.ds_list.getColumn(this.ds_list.rowposition,"custNo");	//고객번호
        	var args ={p_delyDay:sDelyDay, p_ordNo:sOrdNo, p_custNo:sCustNo};
        	Ex.core.popup(this,"연체청구세부조회","comm::RTCOMMArrearsDtl_pop.xfdl",args,"modaless=false");	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getValid = function(){
        	if(nvl(this.div_search.cal_delyDay.value) == "") {
        		alert('기준일자를 입력하세요');
        		this.div_search.cal_delyDay.setFocus();
        		return false;
        	}
        		
        	if(nvl(this.div_search.edt_fromApprScnt.value) == "") {
        		alert('연체회차를 입력하세요');
        		this.div_search.edt_fromApprScnt.setFocus();
        		return false;
        	}
        	if(nvl(this.div_search.edt_toApprScnt.value) == "") {
        		alert('연체회차를 입력하세요');
        		this.div_search.edt_toApprScnt.setFocus();
        		return false;
        	}	
        	
        	if(parseInt(this.div_search.edt_fromApprScnt.value,10)	> parseInt(this.div_search.edt_toApprScnt.value,10)) {
        		alert('시작 연체회차는 종료 연체회차보다 작아야 합니다.');
        		this.div_search.edt_fromApprScnt.setFocus();			
        		return false;
        	}
        	return true;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/	
        this.fn_getCustNm = function() {
        	var sSvcID        	= "listCustInfo";                    
        	var sController   	= "rtms/comm/listCustInfo.do";
        	var sInDatasets   	= "user_=ds_user";
        	var sOutDatasets  	= "ds_cust=mapCustInfo";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("custNo", this.div_search.edt_custNo.value);			
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }		
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_custPopUp = function(obj,e){
        	var args ={p_formId:this.id, p_custNo:nvl(this.div_search.edt_custNo.value), p_custNm:nvl(this.div_search.edt_custNoKeyword.value)};
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        }
        this.returnCustInfo = function(arr){
        	if(arr[0].rowcount > 0){	
        		if(nvl(arr[0].getColumn(0,"userId")) != "") { 
        			this.div_search.edt_custRegNo.set_value(arr[0].getColumn(0,"userId"));
        		}
        		if(nvl(arr[0].getColumn(0,"userNm")) != "") { 			
        			this.div_search.edt_custRegNoKeyword.set_value(arr[0].getColumn(0,"userNm"));
        		}
        		if(nvl(arr[0].getColumn(0,"custNo")) != "") { 
        			this.div_search.edt_custNo.set_value(arr[0].getColumn(0,"custNo"));			
        		}
        		if(nvl(arr[0].getColumn(0,"custNm")) != "") { 	
        			this.div_search.edt_custNoKeyword.set_value(arr[0].getColumn(0,"custNm"));								
        		}
        	}
        }		
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel = function(obj,e){
        	Ex.core.exportExcel(this, this.grd_list, "리스트");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_btn_ordNo_onclick = function(obj,e){
        	var args ={p_arg:this.p_arg};
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl", args ,"modaless=false");
        }
        this.returnOrderNo = function(val){
        	this.div_search.ed_orderNo.set_value(val);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_orderNo_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 ){
        		this.fn_search();
        	}
        }

        // 2016-05-04 이영근, 체크박스 변경시 이벤트
        this.div_search_chk_reminder_onchanged = function(obj,e)
        {
        	if(obj.value){
        		this.ds_list.filter("apprScnt < 3 || apprAmt < 100000");
        	}else{
        		this.ds_list.filter("");
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.grd_list.addEventHandler("oncelldblclick", this.grd_list_oncelldblclick, this);
            this.div_search.edt_custNo.addEventHandler("onkeyup", this.custNo_onkeyup, this);
            this.div_search.btn_custPopUp.addEventHandler("onclick", this.fn_custPopUp, this);
            this.div_search.ed_orderNo.addEventHandler("onkeyup", this.div_search_ed_orderNo_onkeyup, this);
            this.div_search.ed_orderNo.addEventHandler("onkillfocus", this.div_search_ed_orderNo_onkillfocus, this);
            this.div_search.btn_ordNo.addEventHandler("onclick", this.div_search_btn_ordNo_onclick, this);
            this.div_search.chk_reminder.addEventHandler("onchanged", this.div_search_chk_reminder_onchanged, this);

        };

        this.loadIncludeScript("RTREArrearsResult.xfdl");

       
    };
}
)();

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
                this.set_name("RTCSAgencyKakaoSatisfactionMang");
                this.set_classname("RTCMClaim");
                this.set_titletext("카카오 만족도 조사 리스트");
                this._setFormPosition(0,0,1123,470);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"stfySrvySeq\" type=\"STRING\" size=\"20\"/><Column id=\"subtDay\" type=\"STRING\" size=\"20\"/><Column id=\"ordNo\" type=\"STRING\" size=\"20\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"20\"/><Column id=\"rcvrCustNo\" type=\"STRING\" size=\"20\"/><Column id=\"rcvrNm\" type=\"STRING\" size=\"30\"/><Column id=\"rcvrMobNo\" type=\"STRING\" size=\"30\"/><Column id=\"rcvrBirthDay\" type=\"STRING\" size=\"20\"/><Column id=\"totEvalPoint\" type=\"STRING\" size=\"10\"/><Column id=\"stfyPointCd1\" type=\"STRING\" size=\"10\"/><Column id=\"stfyPointCd2\" type=\"STRING\" size=\"10\"/><Column id=\"stfyPointCd3\" type=\"STRING\" size=\"10\"/><Column id=\"stfyOpinon\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"30\"/><Column id=\"chgDt\" type=\"STRING\" size=\"20\"/><Column id=\"dpYn\" type=\"STRING\" size=\"10\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"50\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"50\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"50\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_DpYn", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_stateCd", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\"/><Col id=\"cdNm\">전체</Col></Row><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">전시</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">비전시</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_list", "absolute", "3", "111", "1119", "350", null, null, this);
            obj.set_taborder("4");
            obj.set_autofittype("col");
            obj.set_binddataset("ds_list");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"60\"/><Column size=\"50\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"90\"/><Column size=\"80\"/><Column size=\"50\"/><Column size=\"50\"/><Column size=\"50\"/><Column size=\"50\"/><Column size=\"140\"/><Column size=\"60\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"순번\"/><Cell col=\"2\" text=\"제출일\"/><Cell col=\"3\" text=\"대리점코드\"/><Cell col=\"4\" text=\"렌탈지사\"/><Cell col=\"5\" text=\"렌탈지점\"/><Cell col=\"6\" text=\"대리점명\"/><Cell col=\"7\" text=\"전시여부\"/><Cell col=\"8\" text=\"계약번호\"/><Cell col=\"9\" text=\"고객명\"/><Cell col=\"10\" text=\"총평점\"/><Cell col=\"11\" text=\"장착응대\"/><Cell col=\"12\" text=\"렌탈혜택설명\"/><Cell col=\"13\" text=\"친절\"/><Cell col=\"14\" text=\"고객 의견\"/><Cell col=\"15\" text=\"수정자\"/><Cell col=\"16\" text=\"수정일자\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" celltype=\"none\" text=\"bind:stfySrvySeq\" tooltiptext=\"bind:stfySrvySeq\" edittype=\"readonly\"/><Cell col=\"2\" celltype=\"none\" text=\"bind:subtDay\" tooltiptext=\"bind:subtDay\" displaytype=\"date\" edittype=\"readonly\"/><Cell col=\"3\" celltype=\"none\" text=\"bind:agencyCd\" tooltiptext=\"bind:agencyCd\" edittype=\"readonly\"/><Cell col=\"4\" celltype=\"none\" text=\"bind:rentalGroupNm\" tooltiptext=\"bind:rentalGroupNm\" edittype=\"readonly\"/><Cell col=\"5\" celltype=\"none\" text=\"bind:rentalOfficeNm\" tooltiptext=\"bind:rentalOfficeNm\" edittype=\"readonly\"/><Cell col=\"6\" celltype=\"none\" text=\"bind:agencyNm\" tooltiptext=\"bind:agencyNm\" edittype=\"readonly\"/><Cell col=\"7\" text=\"bind:dpYn\" tooltiptext=\"bind:dpYn\" edittype=\"readonly\"/><Cell col=\"8\" text=\"bind:ordNo\" tooltiptext=\"bind:ordNo\" edittype=\"readonly\"/><Cell col=\"9\" text=\"bind:rcvrNm\" tooltiptext=\"bind:rcvrNm\" edittype=\"readonly\"/><Cell col=\"10\" text=\"bind:totEvalPoint\" tooltiptext=\"bind:totEvalPoint\" edittype=\"readonly\"/><Cell col=\"11\" text=\"bind:stfyPointCd1\" tooltiptext=\"bind:stfyPointCd1\" edittype=\"readonly\"/><Cell col=\"12\" text=\"bind:stfyPointCd2\" tooltiptext=\"bind:stfyPointCd2\" edittype=\"readonly\"/><Cell col=\"13\" text=\"bind:stfyPointCd3\" tooltiptext=\"bind:stfyPointCd3\" edittype=\"readonly\"/><Cell col=\"14\" text=\"bind:stfyOpinon\" tooltiptext=\"bind:stfyOpinon\" edittype=\"readonly\"/><Cell col=\"15\" text=\"bind:chgId\" tooltiptext=\"bind:chgId\" edittype=\"readonly\"/><Cell col=\"16\" text=\"bind:chgDt\" calendardisplaynulltype=\"none\" displaytype=\"date\" edittype=\"readonly\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" text=\"총계\"/><Cell col=\"2\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "3", "89", "190", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("렌탈대리점 카카오 만족도 현황");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Combo("upd_DpYn", "absolute", "1041", "86", "80", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("142");
            obj.set_innerdataset("@ds_DpYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("st_dpYn", "absolute", "938", "87", "97", "21", null, null, this);
            obj.set_taborder("143");
            obj.set_text("전시여부 수정");
            obj.set_cssclass("sta_WF_schTitle");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1123", "71", null, null, this);
            obj.set_taborder("16");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "1122", "0", "25", "496", null, null, this.div_search);
            obj.set_taborder("124");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "72", "1118", "38", null, null, this.div_search);
            obj.set_taborder("128");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_stateCd", "absolute", "802", "40", "80", "21", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("전시여부");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_dlvrDay", "absolute", "31", "7", "80", "20", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("제출일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_subtDayF", "absolute", "104", "7", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("25");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Calendar("cal_subtDayT", "absolute", "234", "7", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("140");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static03", "absolute", "32", "40", "80", "20", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_text("대리점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_stateCd", "absolute", "873", "40", "132", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("26");
            obj.set_innerdataset("@ds_stateCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Edit("vkazcCd", "absolute", "104", "40", "120", "21", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save02", "absolute", "203", "40", "21", "21", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("vkazcNm", "absolute", "224", "40", "120", "21", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "456", "40", "64", "20", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "530", "40", "140", "21", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_custPopUp00", "absolute", "651", "40", "20", "21", null, null, this.div_search);
            obj.set_taborder("33");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "219", "7", "10", "21", null, null, this.div_search);
            obj.set_taborder("141");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1123, 71, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("16");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1123, 470, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMClaim");
            		p.set_titletext("카카오 만족도 조사 리스트");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSAgencyKakaoSatisfactionMang.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSAgencyKakaoSatisfactionMang.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSAgencyKakaoSatisfactionMang.xfdl
         * 설    명 : 카카오 만족도조사 내역 조회
         * 작 성 자 : 백인천
         * 변경이력 :
         * 변경일자	변경자		변경내용
         * ----------	------		--------
         * 2024-12-16	백인천		신규개발
         ***************************************************************************************************/ 

        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
        ************************************************************************/
        var selectedRowSeq; 	//선택데이터

        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
        this.toDay 	    = ""; 	   //현재날짜
        //-------------------------------------------------------------------------------   
        //폼로드시 공통함수      
        //-------------------------------------------------------------------------------  	 
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj); 		
        	this.fn_init();
        }

        //-------------------------------------------------------------------------------   
        //초기화  
        //------------------------------------------------------------------------------- 	
        this.fn_init = function() {
        	//당월 조회
        	this.fn_getToday();	

        	//버튼초기화		
        	this.fn_initBtn();

        	//선택날짜
        	this.fn_getdateCode();
        	
        	//만족도 리스트 조회
        	//this.fn_search();
        }

        /***********************************************************************************
        * Transaction Function
        ***********************************************************************************/
        //-------------------------------------------------------------------------------  	
        //당월 조회
        //-------------------------------------------------------------------------------  	
        this.fn_getToday  = function() {
        	var sSvcID      	= "getToday";  
        	var sController   	= "rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        			
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }

        //-------------------------------------------------------------------------------  	
        //공통코드(선택날짜)
        //-------------------------------------------------------------------------------  	
        this.fn_getdateCode  = function() {
        	 //this.div_search.cb_dateCd.set_index(0); 	
        }

        //---------------------------------------------------------------------------------
        // 만족도조사 내역 조회
        //---------------------------------------------------------------------------------	
        this.fn_search = function(obj,e) {

        	var subtDayF  		= nvl(this.div_search.cal_subtDayF.value);	//당월1일
        	var subtDayT 		= nvl(this.div_search.cal_subtDayT.value);	//현재일
        	var ordNo   		= nvl(this.div_search.ed_ordNo.text);		//계약번호
        	var agencyCd 		= nvl(this.div_search.vkazcCd.value);		//전문점
        	var dpYn   			= nvl(this.div_search.cb_stateCd.value);	//전시여부
        	
        	var sSvcID        	= "kakaoSatisfactionList";
        	var sController   	= "ntrms/cs/selectKakaoSatisfactionList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list=output";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";

        	sArgs += Ex.util.setParam("subtDayF"	, subtDayF);
        	sArgs += Ex.util.setParam("subtDayT"	, subtDayT);
        	sArgs += Ex.util.setParam("agencyCd"	, agencyCd);
        	sArgs += Ex.util.setParam("ordNo"		, ordNo);
        	sArgs += Ex.util.setParam("dpYn"		, dpYn);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        //---------------------------------------------------------------------------------
        // 만족도조사 데이터 수정
        //---------------------------------------------------------------------------------	
        this.upd_dpyn_onitemchanged = function(obj,e) {
        	if(!Ex.util.isUpdated(this.ds_list)) {
        		alert('데이터를 선택해주세요.');
        		return false;
        	}
        	
        	var updDpYn = nvl(this.upd_DpYn.value);	//일괄수정 전시여부
        	if(updDpYn == "") {
        		alert('전시여부를 선택해주세요.');
        		return false;
        	}

        	var cnt = this.ds_list.rowcount;
        	var checkCnt = 0;
        	for(var i = 0; i < cnt; i++) {
        		if(this.ds_list.getColumn(i, "chk")  == "1") {
        			this.ds_list.setColumn(i, "dpYn", updDpYn);
        		}
        	}

        	var sSvcID        	= "updateKakaoSatisfaction";
        	var sController   	= "ntrms/cs/updateKakaoSatisfaction.do";
        	var sInDatasets   	= "input=ds_list:U";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        /***********************************************************************************
        * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        ***********************************************************************************/
        //-------------------------------------------------------------------------------  	
        // callBack함수 
        //------------------------------------------------------------------------------- 
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) { 
        	if (nErrorCode < 0) {
        		alert(strErrorMsg);		
        		return;
        	}

        	switch (strSvcId) 
        	{
        	
        		 //신청일자 
        		 case "getToday":
        			var sFirstDay = Eco.date.getFirstDate(this.toDay);
        			this.div_search.cal_subtDayF.set_value(sFirstDay);
        			this.div_search.cal_subtDayT.set_value(this.toDay);
        			break;
        		//신청일자 검색결과				
        		case "kakaoSatisfactionList":
        			if(this.ds_list.rowcount == 0) {
        			   this.div_search.grd_list.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        			break;
        		//전시여부 수정
        		case "updateKakaoSatisfaction":
        			this.fn_search();
        			this.upd_DpYn.set_value("");
        			break;
        	}	
        }

        
        /***********************************************************************************
        * User Function
        ***********************************************************************************/
        //---------------------------------------------------------------------------------
        // 버튼생성
        //---------------------------------------------------------------------------------
        this.fn_initBtn  = function() {
        	/* 1. N : 신규추가
        	 * 2. S : 조회
        	 * 3. C : 데이타생성
        	 * 4. E : 엑셀데이타생성
        	 * 5. AG: 집계
        	 * 6. DN: 다운
        	 */	
        	this.parent.setButton("S",this);
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.showVkazc = function(obj,e) {
        	var args = {p_formId : "RTSDOrder"};
        	Ex.core.popup(this,"대리점 조회","comm::RTCOMMAgency_pop.xfdl",args,"modaless=false");
        }
        this.return_agency = function(arr) {
        	this.div_search.vkazcNm.set_value(arr[4]);
        	this.div_search.vkazcCd.set_value(arr[5]);
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        /**
         * 계약번호 찾기 버튼 클릭 이벤트 처리
         * - 계약번호 조회 화면 팝업
         */
        this.div_search_btn_custPopUp00_onclick = function(obj,e) {
        	var args ={ p_arg : "RTCSRegularCheck" };
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");
        }

        /**
         * 계약번호 찾기 결과 처리
         */
        this.returnOrderNoInfo = function(ordNo) {
        	this.div_search.ed_ordNo.set_value(ordNo);
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.upd_DpYn.addEventHandler("onitemchanged", this.upd_dpyn_onitemchanged, this);
            this.div_search.cal_subtDayF.addEventHandler("oneditclick", this.div_search_cal_slcmFr_oneditclick, this);
            this.div_search.cal_subtDayT.addEventHandler("oneditclick", this.div_search_cal_slcmFr_oneditclick, this);
            this.div_search.vkazcCd.addEventHandler("onkeyup", this.div_search_vkazcCd_onkeyup, this);
            this.div_search.btn_save02.addEventHandler("onclick", this.showVkazc, this);
            this.div_search.ed_ordNo.addEventHandler("onkeydown", this.div_search_ed_ordNo_onkeydown, this);
            this.div_search.btn_custPopUp00.addEventHandler("onclick", this.div_search_btn_custPopUp00_onclick, this);

        };

        this.loadIncludeScript("RTCSAgencyKakaoSatisfactionMang.xfdl");

       
    };
}
)();

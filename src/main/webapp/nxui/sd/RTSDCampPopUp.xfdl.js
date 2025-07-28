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
                this.set_name("RTSDCampPopUp");
                this.set_classname("RTCMPrice_pop");
                this.set_titletext("캠페인 신규등록 팝업");
                this._setFormPosition(0,0,490,252);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsRadioBtn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">01</Col><Col id=\"cdNm\">할인률(%)</Col></Row><Row><Col id=\"cd\">02</Col><Col id=\"cdNm\">할인액(원)</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsDcTp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "10", null, "242", "10", null, this);
            obj.set_taborder("23");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "0", "60", null, "31", "0", null, this.div_search);
            obj.set_taborder("90");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("Calendar00", "absolute", "124", "65", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("76");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj.set_readonly("true");
            obj = new Calendar("Calendar01", "absolute", "239", "65", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("77");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static06", "absolute", "0", "0", null, "31", "0", null, this.div_search);
            obj.set_taborder("87");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "0", "30", null, "31", "0", null, this.div_search);
            obj.set_taborder("88");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "0", "120", null, "31", "0", null, this.div_search);
            obj.set_taborder("92");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "0", "120", "31", null, null, this.div_search);
            obj.set_taborder("61");
            obj.set_text("할인유형");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "30", "120", "31", null, null, this.div_search);
            obj.set_taborder("62");
            obj.set_text("상품");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "120", "120", "31", null, null, this.div_search);
            obj.set_taborder("63");
            obj.set_text("할인율");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "60", "120", "31", null, null, this.div_search);
            obj.set_taborder("64");
            obj.set_text("적용일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_dcTp", "absolute", "124", "5", "215", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("68");
            obj.set_innerdataset("@dsDcTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("-1");
            obj = new Edit("ed_matCd", "absolute", "124", "35", "215", "21", null, null, this.div_search);
            obj.set_taborder("69");
            obj.set_enable("false");
            obj.set_readonly("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_searchProduct", "absolute", "319", "34", "20", "21", null, null, this.div_search);
            obj.set_taborder("71");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "227", "65", "30", "21", null, null, this.div_search);
            obj.set_taborder("75");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Radio("Radio02", "absolute", "4", "92", "206", "27", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("79");
            obj.set_innerdataset("@dsRadioBtn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_value("01");
            obj.set_direction("vertical");
            obj.set_index("0");
            obj = new Edit("Edit00", "absolute", "124", "125", "215", "21", null, null, this.div_search);
            obj.set_taborder("81");
            obj.set_tooltiptext("edit");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "342", "128", "30", "21", null, null, this.div_search);
            obj.set_taborder("83");
            obj.set_text("%");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("Button27", "absolute", "180", "191", "41", "21", null, null, this.div_search);
            obj.set_taborder("85");
            obj.set_text("저장");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("Button00", "absolute", "225", "191", "41", "21", null, null, this.div_search);
            obj.set_taborder("86");
            obj.set_text("취소");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "120", "120", "31", null, null, this.div_search);
            obj.set_taborder("94");
            obj.set_text("할인액");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("Edit01", "absolute", "124", "125", "215", "21", null, null, this.div_search);
            obj.set_taborder("95");
            obj.set_tooltiptext("edit");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "341", "126", "30", "21", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_text("원");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new CheckBox("CheckBox02", "absolute", "352", "36", "104", "21", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_text("전체");
            obj.set_value("true");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "0", null, "10", "10", null, this);
            obj.set_taborder("24");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 242, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("23");
            		p.set_scrollbars("none");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 490, 252, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMPrice_pop");
            		p.set_titletext("캠페인 신규등록 팝업");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDCampPopUp.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDCampPopUp.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 캠페인 등록 팝업
         * 02. 그룹명   : RTSD
         * 03. 그룹설명 :
         * 04. 작성일   : 2015-08-03
         * 05. 작성자   : 신정수
         * 06. 수정이력 :
         ***********************************************************************
         *     수정일     작성자   내용
         ***********************************************************************
         *
         ***********************************************************************
         */

        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
        this.toDay = "";
        this.countRegInfo = 0;
        this.countNext = 0;
            
        	this.RTSDCampPopUp_onload = function(obj,e)
        	{
        		//this.obj.value = "01"; //기본은 할인율로
        		Ex.core.init(obj);
        		this.fn_init();
        		this.get_date();
        		this.div_search.ed_matCd.set_value("전체");
        		
        	}

        

        	this.fn_init = function(){
        		var sSvcID      	= "initCombo";  
        		var sController   	= "rtms/sd/initCampReg.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsDcTp=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	//java에서 현재 날짜 가져오기
        	this.get_date = function() 
        	{
        		var sSvcID        	= "getDate";                    
        		var sController   	= "/rtms/comm/getToday.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        		
        	}
        	
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt)
        	{
        		if( strSvcId == "initCampReg" ){
        			
        		} else if(strSvcId == "getDate") {
        			this.getToDay();
        		} else if(strSvcId == "saveCampRegInfo") {
        			if(nErrorCode == 0) {
        				alert(strErrorMsg);
        				this.close();
        			} else {
        				alert(strErrorMsg);
        			}
        		}
        	}
        	
        	this.getToDay = function() //calendar1에대한 1일후값 가져오기
        	{
        		var bfDate = String(this.toDay); //현재 날짜

        		var yyyy  	= bfDate.substring(0, 4);
        		var mm  	= bfDate.substring(4, 6) ;
        		var dd  	= bfDate.substring(6, 8);

        		dd = String(parseInt(dd) + 1);
        		if((dd).length = 1) {
        			dd = "0" + dd;
        		}
        		var cDate = yyyy + "" + mm + "" + dd;
        		
        		this.toDay = cDate;
        		
        		this.div_search.Calendar00.set_value(cDate);
        		this.div_search.Calendar01.set_value("99991231");
        		//var cDate = new Date(temp_date);
        		
        		
        		//cDate.addMonth(2);
        		//this.fDate = cDate;
        	}
        	
        	this.div_search_btn_search_onclick = function(obj,e)
        	{
        		var edSearchProductCdVal = nvl(this.div_search.ed_searchProductCd.value);
        		var cbPeriodVal 		 = nvl(this.div_search.cb_period.value);
        		var cbSearchCntVal 		 = nvl(this.div_search.cb_searchCnt.value);
        		var calSearchOrdDayVal 	 = nvl(this.div_search.cal_searchOrdDay.value);
        		
        		if( edSearchProductCdVal == "" ){
        			alert( this.div_search.st_searchSalesGroup.text  + " 값이 없습니다.");
        			return this.div_search.ed_searchProductCd.setFocus();
        		}else if( cbPeriodVal == "" ){
        			alert( this.div_search.st_searchPeriod.text + " 값이 없습니다.");
        			return this.div_search.cb_period.setFocus();
        		}else if( cbSearchCntVal == "" ){
        			alert( this.div_search.st_searchCnt.text + " 값이 없습니다.");
        			return this.div_search.cb_searchCnt.setFocus();
        		}else if( calSearchOrdDayVal == "" ){
        			alert( this.div_search.st_searchOrdDay.text + " 값이 없습니다.");
        			return this.div_search.cal_searchOrdDay.setFocus();
        		}else{
        				var sSvcID        	= "listPricePop";                    
        				var sController   	= "rtms/comm/listPricePop.do";
        				var sInDatasets   	= "";
        				var sOutDatasets  	= "ds_price=mapPrice";
        				var sArgs 			= "";	
        				var fn_callBack		= "fn_callBack";
        				
        				this.ds_price.deleteAll();
        				
        				sArgs += Ex.util.setParam("ordDay", calSearchOrdDayVal);
        				sArgs += Ex.util.setParam("matCd", edSearchProductCdVal);
        				sArgs += Ex.util.setParam("periodCd", cbPeriodVal);
        				sArgs += Ex.util.setParam("cntCd", cbSearchCntVal);
        				
        				Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}

        
        //상품조회
        this.div_search_bt_searchSalesGroup_onclick = function(obj,e)
        {
        	this.div_search.CheckBox02.set_value(false);
        	var args ={p_formId :"RTSDCampReg" };
        	Ex.core.popup(this,"상품조회","sd::RTSDCampProductPopUp.xfdl",args, "modaless=false");
        }
        	
        //상품조회 파라미터 반환
        this.returnProduct = function(arr) {
        	this.div_search.ed_matCd.set_value(arr.cd);
        }

        //저장버튼
        this.div_search_Button00_onclick = function(obj,e)
        {
        	
        	var dcTp = this.div_search.cb_dcTp.value; //할인유형
        	
        	var matCd = "" //상품코드
        	if(this.div_search.CheckBox02.value == true) {
        		matCd = "Z"
        	} else {
        		matCd = this.div_search.ed_matCd.value; 
        	}
        	
        	var strDay = this.div_search.Calendar00.value; //가격적용 시작일
        	var endDay = this.div_search.Calendar01.value; //가격적용 완료일
        	var dcRate = nvl(this.div_search.Edit00.value); //할인율
        	var dcAmt = nvl(this.div_search.Edit01.value); //할인금액
        	var useYn = "Y"; //사용여부
        	
        	if(dcRate == null || dcRate == "") {
        		dcRate == 0;
        	}
        	if(dcAmt == null || dcAmt == "") {
        		dcRate == 0;
        	}
        	
        	var sSvcID      	= "saveCampRegInfo";  
        	var sController   	= "rtms/sd/saveCampRegInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsDcTp=dcTpInfo";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("dcTp", dcTp);
        	sArgs += Ex.util.setParam("matCd", matCd);
        	sArgs += Ex.util.setParam("strDay", strDay);
        	sArgs += Ex.util.setParam("endDay", endDay);
        	sArgs += Ex.util.setParam("dcRate", dcRate);
        	sArgs += Ex.util.setParam("dcAmt", dcAmt);
        	sArgs += Ex.util.setParam("useYn", useYn);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //취소버튼
        this.div_search_Button01_onclick = function(obj,e)
        {
        	this.close();
        }

        
        //라디오버튼 onchanged
        this.div_search_Radio02_onitemchanged = function(obj,e)
        {
        	if(obj.value == "01") {
        		this.div_search.Static03.set_visible(true);
        		this.div_search.Static04.set_visible(false);
        		this.div_search.Edit00.set_visible(true);
        		this.div_search.Edit01.set_visible(false);
        		this.div_search.Static07.set_visible(true);
        		this.div_search.Static08.set_visible(false);
        	} else if(obj.value == "02") {
        		this.div_search.Static03.set_visible(false);
        		this.div_search.Static04.set_visible(true);
        		this.div_search.Edit00.set_visible(false);
        		this.div_search.Edit01.set_visible(true);
        		this.div_search.Static07.set_visible(false);
        		this.div_search.Static08.set_visible(true);
        	} else {
        		return;
        	}
        }

        	//해당상품으로 등록된 계약 건수 count
        	this.regInfoCheck = function()
        	{
        		var sSvcID      	= "countRegInfo";  
        		var sController   	= "rtms/sd/countRegInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "countRegInfo";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        	//상품, 적용일자가 겹치는 할인내역 건수 count
        	this.nextCheck = function()
        	{
        		var sSvcID      	= "countNext";  
        		var sController   	= "rtms/sd/countNext.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        this.div_search_CheckBox02_onclick = function(obj,e)
        {
        	
        	if(this.div_search.CheckBox02.value == true) {
        		this.div_search.ed_matCd.set_value("전체");
        	} else {
        		this.div_search.ed_matCd.set_value("");
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDCampPopUp_onload, this);
            this.div_search.Calendar00.addEventHandler("ondayclick", this.div_search_Calendar00_ondayclick, this);
            this.div_search.cb_dcTp.addEventHandler("onitemchanged", this.div_search_cb_searchBrand_onitemchanged, this);
            this.div_search.ed_matCd.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.bt_searchProduct.addEventHandler("onclick", this.div_search_bt_searchSalesGroup_onclick, this);
            this.div_search.Radio02.addEventHandler("onitemchanged", this.div_search_Radio02_onitemchanged, this);
            this.div_search.Button27.addEventHandler("onclick", this.div_search_Button00_onclick, this);
            this.div_search.Button00.addEventHandler("onclick", this.div_search_Button01_onclick, this);
            this.div_search.CheckBox02.addEventHandler("onclick", this.div_search_CheckBox02_onclick, this);

        };

        this.loadIncludeScript("RTSDCampPopUp.xfdl");

       
    };
}
)();

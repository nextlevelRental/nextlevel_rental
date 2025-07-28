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
                this.set_name("RTREArrearsSend_tab1");
                this.set_classname("test_form");
                this.set_titletext("당월연체내역집계");
                this._setFormPosition(0,0,1147,496);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"delyDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"0\"/><Column id=\"cashNamt\" type=\"STRING\" size=\"256\"/><Column id=\"cashVamt\" type=\"STRING\" size=\"256\"/><Column id=\"matNo\" type=\"STRING\" size=\"0\"/><Column id=\"matNm\" type=\"STRING\" size=\"0\"/><Column id=\"carNo\" type=\"STRING\" size=\"0\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"payMthd\" type=\"STRING\" size=\"256\"/><Column id=\"payMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"payDd\" type=\"STRING\" size=\"0\"/><Column id=\"recpTp\" type=\"STRING\" size=\"256\"/><Column id=\"recpTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"apprScnt\" type=\"STRING\" size=\"256\"/><Column id=\"apprAmt\" type=\"STRING\" size=\"256\"/><Column id=\"agency\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyTel\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R005", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cdNm\">5일</Col><Col id=\"cd\">05</Col></Row><Row><Col id=\"cd\">15</Col><Col id=\"cdNm\">15일</Col></Row><Row><Col id=\"cd\">25</Col><Col id=\"cdNm\">25일</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static17", "absolute", "10", "101", "1102", "31", null, null, this);
            obj.set_taborder("21");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "59", "1122", "20", null, null, this);
            obj.set_taborder("14");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "90", null, "10", "25", null, this);
            obj.set_taborder("16");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1102", "49", null, null, this);
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
            obj = new Static("Static24", "absolute", "231", "0", "30", "78", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_delyDay", "absolute", "131", "12", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_dateformat("yyyy-MM-dd");
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
            obj = new Static("Static00", "absolute", "495", "0", "30", "78", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "260", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("33");
            obj.set_text("CMS집계일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "526", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("35");
            obj.set_text("카드집계일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "759", "0", "30", "78", null, null, this.div_search);
            obj.set_taborder("37");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "790", "8", "114", "30", null, null, this.div_search);
            obj.set_taborder("38");
            obj.set_text("청구일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_cmsDay", "absolute", "395", "12", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("39");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Calendar("cal_crdDay", "absolute", "659", "12", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("40");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Combo("cb_payDd", "absolute", "84.7%", "12", null, "20", "8.11%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("41");
            obj.set_innerdataset("@ds_R005");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Static("Static06", "absolute", "10", "76", "84", "20", null, null, this);
            obj.set_taborder("18");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "10", "101", "130", "31", null, null, this);
            obj.set_taborder("19");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_procStatus", "absolute", "144", "106", "963", "21", null, null, this);
            obj.set_taborder("20");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "0", "10", "459", null, null, this);
            obj.set_taborder("22");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "8", "0", "1122", "10", null, null, this);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 49, this.div_search,
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
            		p.set_titletext("당월연체내역집계");
            		p.style.set_color("#333333ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREArrearsSend_tab1.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREArrearsSend_tab1.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.toDay 	= ""; 	//현재날짜
        this.toHour = "";	//현재시간
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){ 
        	if (nErrorCode < 0)	{
        		this.edt_procStatus.set_value(strErrorMsg);
        		return;
        		//return Ex.core.comMsg("alert",strErrorMsg);		
        	}
        	
        	switch (strSvcId){
        		case "getDate":
        			//var sFirstDay = Eco.date.getFirstDate(this.toDay);	//해당일짜의 1일 가져오기
        			this.div_search.cal_delyDay.set_value(this.toDay);
        			this.div_search.cal_cmsDay.set_value(this.toDay);
        			this.div_search.cal_crdDay.set_value(this.toDay);
        			break;
        		case "arrSendAggregate":
        			if(nErrorCode == 0){
        				this.edt_procStatus.set_value("당월연체대상 집계가 완료되었습니다.");
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
        	this.parent.parent.parent.setButton("AG",this);
        	this.edt_procStatus.set_value("");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /**
         * 공통코드 조회
         */
        this.fn_getCommCodeInfo = function() {
        	var sSvcID		 = "getCommCodeInfo";
        	var sController	 = "ntrms/listCommInfo.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_R005=outputR005";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	sArgs += Ex.util.setParam("cdGrpCd"		, "R005");		//공통코드	
        	sArgs += Ex.util.setParam("useYn"		, "Y");			//사용여부		
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_aggregate = function(){
        	if(this.fn_getValid()) {
        		var sSvcID      	= "arrSendAggregate";  
        		var sController   	= "ntrms/re/arrSendAggregate.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("delyDay"		, nvl(this.div_search.cal_delyDay.value));		//기준일자		
        		sArgs += Ex.util.setParam("rcmsDay"		, nvl(this.div_search.cal_cmsDay.value));		//CMS집계일자		
        		sArgs += Ex.util.setParam("rcrdDay"		, nvl(this.div_search.cal_crdDay.value));		//카드집계일자		
        		sArgs += Ex.util.setParam("payDd"		, nvl(this.div_search.cb_payDd.value));		    //청구일자		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        	}
        }	
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getValid = function(){
        	if(nvl(this.div_search.cal_delyDay.value) == "") {
        		alert('기준일자를 입력하세요');
        		this.div_search.cal_delyDay.setFocus();
        		return false;
        	}
        	if(nvl(this.div_search.cal_cmsDay.value) == "") {
        		alert('기준일자를 입력하세요');
        		this.div_search.cal_cmdDay.setFocus();
        		return false;
        	}
        	if(nvl(this.div_search.cal_crdDay.value) == "") {
        		alert('기준일자를 입력하세요');
        		this.div_search.cal_crdDay.setFocus();
        		return false;
        	}
        	if(nvl(this.div_search.cb_payDd.value) == "") {
        		alert('기준일자를 입력하세요');
        		this.div_search.cb_payDd.setFocus();
        		return false;
        	}
        	return true;
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);

        };

        this.loadIncludeScript("RTREArrearsSend_tab1.xfdl");

       
    };
}
)();

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
                this.set_name("RTRERglrchkCommMang_tab3");
                this.set_classname("RTRERglrchkCommMang_tab3");
                this.set_titletext("지급대상 조회");
                this._setFormPosition(0,0,1122,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj._setContents("<ColumnInfo><Column id=\"slcmYm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"servSeq\" type=\"STRING\" size=\"256\"/><Column id=\"servDseq\" type=\"STRING\" size=\"256\"/><Column id=\"stdYm\" type=\"STRING\" size=\"256\"/><Column id=\"jobSeq\" type=\"STRING\" size=\"256\"/><Column id=\"procMrCd\" type=\"STRING\" size=\"256\"/><Column id=\"procMrNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procTm\" type=\"STRING\" size=\"256\"/><Column id=\"jobDseq\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"amtComm\" type=\"STRING\" size=\"256\"/><Column id=\"chgJobseq\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static03", "absolute", "0", "56", "1122", "20", null, null, this);
            obj.set_taborder("0");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1102", "45", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_referYM", "absolute", "20", "8", "84", "30", null, null, this.div_search);
            obj.set_taborder("45");
            obj.set_text("기준월");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_referYM", "absolute", "131", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("46");
            obj.set_dateformat("yyyy-MM");
            obj.set_value("null");
            obj.set_editformat("yyyy-MM");
            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this.div_search);
            obj.set_taborder("47");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("48");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static44", "absolute", "81", "40", "47", "21", null, null, this.div_search);
            obj.set_taborder("49");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this.div_search);
            obj.set_taborder("50");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "459", null, null, this);
            obj.set_taborder("3");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1112", "10", "10", "459", null, null, this);
            obj.set_taborder("4");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "72", "86", "20", null, null, this);
            obj.set_taborder("5");
            obj.set_text("조회결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "10", "87", null, "10", "9", null, this);
            obj.set_taborder("6");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "417", "1110", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list", "absolute", "10", "97", "1102", "320", null, null, this);
            obj.set_taborder("8");
            obj.set_binddataset("ds_list");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"83\"/><Column size=\"110\"/><Column size=\"101\"/><Column size=\"90\"/><Column size=\"304\"/><Column size=\"259\"/><Column size=\"95\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"마감기준월\"/><Cell col=\"1\" text=\"처리 로디안\"/><Cell col=\"2\" text=\"계약번호\"/><Cell col=\"3\" text=\"배정기준월\"/><Cell col=\"4\" text=\"주소\"/><Cell col=\"5\" text=\"상세주소\"/><Cell col=\"6\" text=\"수수료\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" style=\"align:center;\" text=\"bind:slcmYm\" mask=\"@@@@-@@\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" text=\"bind:procMrNm\"/><Cell col=\"2\" style=\"align:center;\" text=\"bind:ordNo\" calendardisplay=\"display\"/><Cell col=\"3\" edittype=\"none\" style=\"align:center;\" text=\"bind:stdYm\" mask=\"@@@@-@@\" calendardisplay=\"display\"/><Cell col=\"4\" displaytype=\"normal\" style=\"align:left middle;\" text=\"bind:addr1\"/><Cell col=\"5\" style=\"align:left;\" text=\"bind:addr2\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right;\" text=\"bind:amtComm\"/></Band><Band id=\"summary\"><Cell colspan=\"2\" text=\"총계\"/><Cell col=\"2\" style=\"align:right middle;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"3\"/><Cell col=\"4\" style=\"align:right middle;\"/><Cell col=\"5\" style=\"align:right middle;\"/><Cell col=\"6\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:comp.parent.ds_list.getSum(&quot;amtComm&quot;)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1102, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTRERglrchkCommMang_tab3");
            		p.set_titletext("지급대상 조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRERglrchkCommMang_tab3.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRERglrchkCommMang_tab3.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTRERglrchkCommMang_tab3.xfdl
         * 설    명 : 정기점검수수료 관리 > 지급대상 조회
         * 작 성 자 : wjim
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2017-05-26	wjim		신규 개발
         ***************************************************************************************************/

        //include "lib::comLib.xjs";

        /**
         * 전역변수 선언
         */
        this.toDay  = "";		// 서버기준 오늘날자
        this.prevYm = "";		// 전월

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리 (최초 1회만 수행)
         */
        this.RTRERglrchkCommMang_tab3_onload = function(obj,e) {
        	// 폼 로드 공통함수
        	Ex.core.init(obj);
        	// 화면 초기화
        	this.fn_init();
        }

        /**
         * Transaction CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert", strErrorMsg);
        	
        	switch (strSvcId) {		
        		// 기준월 세팅
        		case "setReferYm":
        			prevYm = this.toDay.substr(0,4)+(this.toDay.substr(4,2)-1);	// 서버시간 기준 전월(1월의 경우 12월로 정상표현되는지 확인 필요)
        			this.div_search.cal_referYM.set_value(prevYm);
        			break;
        		
        		// 조회
        		case "getList":
        			if (this.ds_list.getRowCount() == 0) {
        				this.grd_list.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        			break;
        		
        		default:
        			break;
        	}
        }

        /**
         * 화면 초기화
         */
        this.fn_init = function() {		
        	// 메인 공통버튼 초기화 (조회,엑셀)
        	this.parent.parent.parent.setButton("E|S",this);
        	// 기준월 세팅
        	this.fn_setReferYm();
        }

        /**
         * 기준월 세팅
         */
        this.fn_setReferYm  = function() {
        	var sSvcID      	= "setReferYm";  
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        			
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 조회 버튼 클릭 이벤트 처리
         */
        this.fn_search = function() {
        	// 필수값 검증 - 기준월
        	if (nvl(this.div_search.cal_referYM.value) == "") {
        		this.alert('기준월을 입력하세요');
        		this.div_search.cal_referYM.setFocus();
        		return;
        	}
        		
        	var sSvcID      	= "getList";  
        	var sController   	= "rtms/re/listRegularchkComm.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list=ds_regularchkComm";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("slcmYm", nvl(this.div_search.cal_referYM.value).substr(0,6));	// 기준월
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }

        /**
         * 엑셀 버튼 클릭 이벤트 처리
         */
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.grd_list);
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTRERglrchkCommMang_tab3_onload, this);
            this.div_search.cal_referYM.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);

        };

        this.loadIncludeScript("RTRERglrchkCommMang_tab3.xfdl");

       
    };
}
)();

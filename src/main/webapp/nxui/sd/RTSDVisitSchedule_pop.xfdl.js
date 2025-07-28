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
                this.set_name("RTSDVisitSchedule_pop");
                this.set_classname("RTSDVisitSchedule_pop");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,475,485);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_visitSchdList", this);
            obj._setContents("<ColumnInfo><Column id=\"calMon\" type=\"STRING\" size=\"256\"/><Column id=\"calDay\" type=\"STRING\" size=\"256\"/><Column id=\"calDat\" type=\"STRING\" size=\"256\"/><Column id=\"cntSum\" type=\"STRING\" size=\"256\"/><Column id=\"cntReal\" type=\"STRING\" size=\"256\"/><Column id=\"cnt01\" type=\"STRING\" size=\"256\"/><Column id=\"cnt02\" type=\"STRING\" size=\"256\"/><Column id=\"cnt03\" type=\"STRING\" size=\"256\"/><Column id=\"cnt04\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("btn_close", "absolute", "217", "459", "41", "21", null, null, this);
            obj.set_taborder("0");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "474", "10", null, null, this);
            obj.set_taborder("1");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "10", "77", "120", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_text("일자별 배정 건수");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "94", "471", "10", null, null, this);
            obj.set_taborder("3");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_visitSchdList", "absolute", "9", "104", "455", "345", null, null, this);
            obj.set_taborder("4");
            obj.set_binddataset("ds_visitSchdList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"53\"/><Column size=\"68\"/><Column size=\"64\"/><Column size=\"65\"/><Column size=\"64\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"일자\"/><Cell col=\"1\" text=\"요일\"/><Cell col=\"2\" text=\"총건수\"/><Cell col=\"3\" text=\"배정\"/><Cell col=\"4\" text=\"협의중\"/><Cell col=\"5\" text=\"확정\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" style=\"align:center;color:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);color2:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);\" text=\"bind:calDay\" mask=\"####-##-##\"/><Cell col=\"1\" displaytype=\"normal\" style=\"align:center;color:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);color2:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);\" text=\"bind:calDat\"/><Cell col=\"2\" displaytype=\"normal\" style=\"align:right;\" text=\"bind:cntReal\"/><Cell col=\"3\" displaytype=\"normal\" style=\"align:right;\" text=\"bind:cnt01\"/><Cell col=\"4\" displaytype=\"normal\" style=\"align:right;\" text=\"bind:cnt02\"/><Cell col=\"5\" displaytype=\"normal\" style=\"align:right;\" text=\"bind:cnt03\"/></Band><Band id=\"summary\"><Cell style=\"align:right;\"/><Cell col=\"1\" style=\"align:right;\"/><Cell col=\"2\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;cntReal&quot;)\"/><Cell col=\"3\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;cnt01&quot;)\"/><Cell col=\"4\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;cnt02&quot;)\"/><Cell col=\"5\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;cnt03&quot;)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "6", "10", "470", null, null, this);
            obj.set_taborder("5");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "9", "454", "63", null, null, this);
            obj.set_taborder("8");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "9", "4", "54", "21", null, null, this.div_search);
            obj.set_taborder("144");
            obj.set_text("대리점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyCd", "absolute", "78", "4", "61", "21", null, null, this.div_search);
            obj.set_taborder("145");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("30");
            obj.set_enable("false");
            obj.set_tooltiptext("edit");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "144", "4", "247", "21", null, null, this.div_search);
            obj.set_taborder("146");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("30");
            obj.set_enable("false");
            obj.set_tooltiptext("edit");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "9", "32", "75", "21", null, null, this.div_search);
            obj.set_taborder("147");
            obj.set_text("방문일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_visitFrom", "absolute", "78", "32", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("148");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static07", "absolute", "183", "32", "10", "21", null, null, this.div_search);
            obj.set_taborder("149");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_visitTo", "absolute", "198", "32", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("150");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Static("Static05", "absolute", "464", "6", "10", "470", null, null, this);
            obj.set_taborder("9");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Button("btn_search", "absolute", "408", "15", "45", "22", null, null, this);
            obj.set_taborder("10");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "449", "471", "10", null, null, this);
            obj.set_taborder("11");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 454, 63, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("8");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 475, 485, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDVisitSchedule_pop");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDVisitSchedule_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDVisitSchedule_pop.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDVisitSchedule_pop.xfdl
         * 설    명 : 방문점검 일정조회(팝업)
         * 작 성 자 : wjim
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2018-11-25	wjim		[20181122_01] 신규 개발
         ***************************************************************************************************/
        //include "lib::comLib.xjs";

        /**
         * 전역변수 선언
         */
        this.bfAfDay = "";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDVisitSchedule_pop_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	this.div_search.ed_agencyCd.set_value(this.parent.p_agencyCd);
        	this.div_search.ed_agencyNm.set_value(this.parent.p_agencyNm);
        	this.div_search.cal_visitFrom.set_value(this.parent.p_visitFromDay);
        	
        	// 방문일자(to) 조회조건 세팅 후 자동조회
        	this.fn_getAccReqDate();
        }

        /**
         * Transaction CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		case "getAccReqDate":
        			this.div_search.cal_visitTo.set_value(this.bfAfDay);
         			this.fn_searchListVisitSchdPerStat();			
        			break;
        			
        		case "listVisitSchdPerStat":
        			var rowCt = this.ds_visitSchdList.getRowCount();
        		
         			if (rowCt == 0) {
         				this.grid_visitSchdList.set_nodatatext("조회된 데이터가 없습니다.");
         			}
         						
        			break;
        			
        		default:
        			break;
        	}
        }

        /**
         * X일 이후 영업일 조회
         */
        this.fn_getAccReqDate  = function() {
        	var sSvcID      	= "getAccReqDate";  
        	var sController   	= "ntrms/re/getAccReqDate.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("serchGb", '+');	
        	sArgs += Ex.util.setParam("days", 7);			
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }

        /**
         * 조회 버튼의 클릭 이벤트 처리
         */
        this.btn_search_onclick = function(obj,e) {
        	this.fn_searchListVisitSchdPerStat();
        }

        /**
         * 일자별 배정건수 조회
         */
        this.fn_searchListVisitSchdPerStat = function() {
        	// 기존 조회결과 초기화
        	this.ds_visitSchdList.deleteAll();
        	
        	var sSvcID        	= "listVisitSchdPerStat";                    
        	var sController   	= "/rtms/comm/listVisitSchdPerStat.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_visitSchdList=mapVisitSchdPerStat";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("agencyCd"   , this.div_search.ed_agencyCd.value  );
        	sArgs += Ex.util.setParam("procDayFrom", this.div_search.cal_visitFrom.value);
        	sArgs += Ex.util.setParam("procDayTo"  , this.div_search.cal_visitTo.value  );
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
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
            this.addEventHandler("onload", this.RTSDVisitSchedule_pop_onload, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.grid_visitSchdList.addEventHandler("oncellclick", this.grid_mrMonDecideCnt_oncellclick, this);
            this.btn_search.addEventHandler("onclick", this.btn_search_onclick, this);

        };

        this.loadIncludeScript("RTSDVisitSchedule_pop.xfdl");

       
    };
}
)();

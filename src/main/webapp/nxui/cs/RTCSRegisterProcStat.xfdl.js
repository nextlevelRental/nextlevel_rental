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
                this.set_name("RTCSRegisterProcStat");
                this.set_classname("RTCSHappyCallRegister");
                this.set_titletext("정기정검 처리현황");
                this._setFormPosition(0,0,1147,512);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_registerProcStatList", this);
            obj._setContents("<ColumnInfo><Column id=\"userNm\" type=\"STRING\" size=\"256\"/><Column id=\"carmasterNu\" type=\"STRING\" size=\"256\"/><Column id=\"baejungCnt\" type=\"STRING\" size=\"256\"/><Column id=\"processCnt\" type=\"STRING\" size=\"256\"/><Column id=\"processYul\" type=\"STRING\" size=\"256\"/><Column id=\"contactCnt\" type=\"STRING\" size=\"256\"/><Column id=\"contactYul\" type=\"STRING\" size=\"256\"/><Column id=\"processDateCnt\" type=\"STRING\" size=\"256\"/><Column id=\"saleCnt\" type=\"STRING\" size=\"256\"/><Column id=\"onePoint\" type=\"STRING\" size=\"256\"/><Column id=\"twoPoint\" type=\"STRING\" size=\"256\"/><Column id=\"threePoint\" type=\"STRING\" size=\"256\"/><Column id=\"fourPoint\" type=\"STRING\" size=\"256\"/><Column id=\"fivePoint\" type=\"STRING\" size=\"256\"/><Column id=\"stdYm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "1", "0", null, "43", "13", null, this);
            obj.set_taborder("20");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "25", "0", "71", "41", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_text("지정월");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "108", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "232", "0", "30", "89", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("sdYm", "absolute", "102", "11", "120", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_dateformat("yyyy-MM");
            obj.set_editformat("yyyy-MM");

            obj = new Grid("gd_registerProcStatList", "absolute", "1", "57", null, "420", "13", null, this);
            obj.set_taborder("22");
            obj.set_binddataset("ds_registerProcStatList");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"97\"/><Column size=\"84\"/><Column size=\"70\"/><Column size=\"60\"/><Column size=\"70\"/><Column size=\"60\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"65\"/><Column size=\"65\"/><Column size=\"65\"/><Column size=\"65\"/><Column size=\"65\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell rowspan=\"2\" text=\"로디안\"/><Cell col=\"1\" rowspan=\"2\" text=\"배정건\"/><Cell col=\"2\" colspan=\"2\" text=\"처리건/율\"/><Cell col=\"4\" colspan=\"2\" text=\"컨택건/율\"/><Cell col=\"6\" rowspan=\"2\" text=\"처리일수\"/><Cell col=\"7\" rowspan=\"2\" text=\"판매수량\"/><Cell col=\"8\" colspan=\"5\" text=\"만족도\"/><Cell row=\"1\" col=\"2\" text=\"건수\"/><Cell row=\"1\" col=\"3\" text=\"율(%)\"/><Cell row=\"1\" col=\"4\" text=\"건수\"/><Cell row=\"1\" col=\"5\" text=\"율(%)\"/><Cell row=\"1\" col=\"8\" text=\"매우불만족\"/><Cell row=\"1\" col=\"9\" text=\"불만족\"/><Cell row=\"1\" col=\"10\" text=\"보통\"/><Cell row=\"1\" col=\"11\" text=\"만족\"/><Cell row=\"1\" col=\"12\" text=\"매우만족\"/></Band><Band id=\"body\"><Cell text=\"bind:userNm\"/><Cell col=\"1\" style=\"align:right;\" text=\"bind:baejungCnt\" editlimit=\"3\" editlengthunit=\"ascii\"/><Cell col=\"2\" style=\"align:right;\" text=\"bind:processCnt\"/><Cell col=\"3\" edittype=\"none\" style=\"align:right;\" text=\"bind:processYul\"/><Cell col=\"4\" style=\"align:right;\" text=\"bind:contactCnt\"/><Cell col=\"5\" style=\"align:right;\" text=\"bind:contactYul\"/><Cell col=\"6\" edittype=\"none\" style=\"align:right;\" text=\"bind:processDateCnt\" editlengthunit=\"utf16\"/><Cell col=\"7\" style=\"align:right;\" text=\"bind:saleCnt\"/><Cell col=\"8\" style=\"align:right;\" text=\"bind:onePoint\"/><Cell col=\"9\" style=\"align:right;\" text=\"bind:twoPoint\"/><Cell col=\"10\" style=\"align:right;\" text=\"bind:threePoint\"/><Cell col=\"11\" style=\"align:right;\" text=\"bind:fourPoint\"/><Cell col=\"12\" style=\"align:right;\" text=\"bind:fivePoint\"/><Cell col=\"13\"/></Band><Band id=\"summary\"><Cell text=\"합 계\"/><Cell col=\"1\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\" style=\"align:right;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\" style=\"align: ;\"/><Cell col=\"6\" style=\"align:right;\"/><Cell col=\"7\" style=\"align:right;\"/><Cell col=\"8\" style=\"align:right;\"/><Cell col=\"9\" style=\"align:right;\"/><Cell col=\"10\" style=\"align:right;\"/><Cell col=\"11\" style=\"align:right;\"/><Cell col=\"12\" style=\"align:right;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", null, null, "0", this);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 43, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("20");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 512, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSHappyCallRegister");
            		p.set_titletext("정기정검 처리현황");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSRegisterProcStat.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSRegisterProcStat.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
         
        /***********************************************************************************
        * Form Load Common Function
        ***********************************************************************************/ 
        this.form_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.div_search.sdYm.set_value( FN_today());
        	this.fn_init();
        }

        /***********************************************************************************
        * Transaction Function
        ***********************************************************************************/
        this.fn_initBtn  = function() {
        	/* 
        	  1. S : 조회
        	  2. C : 저장
        	  3. N : 추가
        	  4. DL: 삭제
        	  5. E : 엑셀
        	  기타: workFrame.xfdl참조
        	*/	
        	this.parent.setButton("E|S", this);
        }

        /**
         * 정기점검 처리현황 조회
         */
        this.fn_registerProcStatList = function() {

        	this.ds_registerProcStatList.clearData();
        	
        	var stdYm	=	nvl(this.div_search.sdYm.value);	/* 년도월 */
        	stdYm = stdYm.substring(0, 6);
        	var sSvcID		 = "registerProcStatList";
        	var sController	 = "/ntrms/cs/registerProcStatList.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_registerProcStatList=output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("stdYm", stdYm);
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
         * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){ 
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	switch(strSvcId) {
        		/**
        		 * 정기점검 처리현황 조회
        		 */
        		case "registerProcStatList":
        			var ds = this.ds_registerProcStatList;
        			if(ds.getRowCount() == 0) {
        				
        				this.alert("조회된 데이터가 없습니다.");
        				
        				return false;
        			}
        			break;
        	}
        	
        }
        /***********************************************************************************
         * User Function
         ***********************************************************************************/
         
        /***********************************************************************************
        * Component Event & Function
        ***********************************************************************************/
        this.fn_init = function() {
        	this.fn_initBtn();		//Button
        }
        /**
         * 검색
         */
        this.fn_search = function() {
        	this.fn_registerProcStatList();
        }
        /**
         * 엑셀
         */
        this.fn_excel= function()	{
        	var ds = this.ds_registerProcStatList;
        			
        	if(ds.getRowCount() == 0) {
        			
        		this.alert("조회된 데이터가 없습니다.");
        		
        		return false;
        	}
        	Ex.core.exportExcel(this, this.gd_registerProcStatList);
        }

        

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.st_searchCondition.addEventHandler("onclick", this.div_search00_st_searchCondition_onclick, this);

        };

        this.loadIncludeScript("RTCSRegisterProcStat.xfdl");

       
    };
}
)();

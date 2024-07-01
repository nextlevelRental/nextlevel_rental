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
                this.set_name("RTCSRegularCheckMrSchedulePop");
                this.set_classname("RTCSRegularCheckMrSchedulePop");
                this.set_titletext("로디안 배정내역");
                this._setFormPosition(0,0,581,485);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_mrMonDecideCnt", this);
            obj._setContents("<ColumnInfo><Column id=\"calMon\" type=\"STRING\" size=\"256\"/><Column id=\"calDay\" type=\"STRING\" size=\"256\"/><Column id=\"calDat\" type=\"STRING\" size=\"256\"/><Column id=\"cntJob\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_mrDayDecide", this);
            obj._setContents("<ColumnInfo><Column id=\"mrCd\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"planTm\" type=\"STRING\" size=\"256\"/><Column id=\"stdYm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"jobSeq\" type=\"STRING\" size=\"256\"/><Column id=\"doNm\" type=\"STRING\" size=\"256\"/><Column id=\"ctNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("btn_close", "absolute", "270", "459", "41", "21", null, null, this);
            obj.set_taborder("0");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "0", "595", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "10", "45", "120", "21", null, null, this);
            obj.set_taborder("6");
            obj.set_text("일자별 배정 건수");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "62", "591", "10", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_mrMonDecideCnt", "absolute", "9", "72", "208", "380", null, null, this);
            obj.set_taborder("8");
            obj.set_binddataset("ds_mrMonDecideCnt");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"81\"/><Column size=\"39\"/><Column size=\"70\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"일자\"/><Cell col=\"1\" text=\"요일\"/><Cell col=\"2\" text=\"배정건수\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" style=\"align:center;color:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);color2:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);\" text=\"bind:calDay\" mask=\"####-##-##\"/><Cell col=\"1\" displaytype=\"normal\" style=\"align:center;color:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);color2:EXPR(calDat==&quot;일&quot;?&quot;red&quot;:calDat==&quot;토&quot;?&quot;blue&quot;:nulll);\" text=\"bind:calDat\"/><Cell col=\"2\" displaytype=\"normal\" style=\"align:right;\" text=\"bind:cntJob\"/></Band><Band id=\"summary\"><Cell style=\"align:right;\"/><Cell col=\"1\" style=\"align:right;\"/><Cell col=\"2\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;cntJob&quot;)+&quot;(건)&quot;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "6", "10", "470", null, null, this);
            obj.set_taborder("9");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_mrDayDecide", "absolute", "233", "72", "338", "380", null, null, this);
            obj.set_taborder("10");
            obj.set_binddataset("ds_mrDayDecide");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"51\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"광역시도\"/><Cell col=\"1\" text=\"시군구\"/><Cell col=\"2\" text=\"계약번호\"/><Cell col=\"3\" text=\"시간\"/></Band><Band id=\"body\"><Cell style=\"align:center;\" text=\"bind:doNm\"/><Cell col=\"1\" style=\"align:center;\" text=\"bind:ctNm\"/><Cell col=\"2\" style=\"align:center;\" text=\"bind:ordNo\"/><Cell col=\"3\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:planTm\" mask=\"##:##\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\"/><Cell col=\"2\"/><Cell col=\"3\" style=\"align:right;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "234", "45", "120", "21", null, null, this);
            obj.set_taborder("11");
            obj.set_text("배정내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "9", "561", "33", null, null, this);
            obj.set_taborder("12");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "16", "4", "54", "21", null, null, this.div_search);
            obj.set_taborder("139");
            obj.set_text("로디안");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_mrCd", "absolute", "76", "4", "48", "21", null, null, this.div_search);
            obj.set_taborder("140");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("30");
            obj.set_enable("false");
            obj.set_tooltiptext("edit");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_mrNm", "absolute", "127", "4", "80", "21", null, null, this.div_search);
            obj.set_taborder("141");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("30");
            obj.set_enable("false");
            obj.set_tooltiptext("edit");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "224", "4", "56", "21", null, null, this.div_search);
            obj.set_taborder("142");
            obj.set_text("배정월");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_ym", "absolute", "286", "4", "86", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("143");
            obj.set_dateformat("yyyy-MM");
            obj.set_editformat("yyyy-MM");
            obj.set_enable("true");
            obj.set_type("normal");

            obj = new Static("Static05", "absolute", "571", "6", "10", "470", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 561, 33, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("12");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 581, 485, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSRegularCheckMrSchedulePop");
            		p.set_titletext("로디안 배정내역");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSRegularCheckMrSchedulePop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSRegularCheckMrSchedulePop.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSRegularCheckMrSchedulePop.xfdl
         * 설    명 : 로디안 일정조회(팝업)
         * 작 성 자 : wjim
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2017-04-06	wjim		[20170406_01] 신규 개발
         ***************************************************************************************************/
        //include "lib::comLib.xjs";

        // 전역변수
        this.fs_planYm = "";
        this.fs_mrCd   = "";
        this.fs_mrNm   = "";
        this.fs_today  = "";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTCSRegularCheckMrSchedulePop_onload = function(obj,e) {
        	Ex.core.init(obj);

        	this.fs_planYm = this.parent.p_planYm;
        	this.fs_mrCd   = this.parent.p_mrCd;
        	this.fs_mrNm   = this.parent.p_mrNm;
        	this.fs_today  = this.parent.p_today;
        	
        	this.div_search.ed_mrCd.set_value(this.fs_mrCd);
        	this.div_search.ed_mrNm.set_value(this.fs_mrNm);
        	this.div_search.cal_ym.set_value(this.fs_planYm);	

        	// 일자별 배정건수 조회
        	this.fn_searchMst(this.fs_mrCd, this.fs_planYm);
        }

        /**
         * Transaction CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		case "listMst":
        			var rowCt = this.ds_mrMonDecideCnt.getRowCount();
        		
         			if (rowCt == 0) {
         				this.grid_mrMonDecideCnt.set_nodatatext("조회된 데이터가 없습니다.");
         			} else {
        				// 오늘날자 row 조회
        				var rowToday = this.ds_mrMonDecideCnt.findRow("calDay", this.fs_today);
        				// 오늘날자 row 선택
        				this.grid_mrMonDecideCnt.selectRow(rowToday);
        				//배정내역 조회
        				this.fn_searchDtl(this.fs_mrCd, this.ds_mrMonDecideCnt.getColumn(rowToday, "calDay"));
         			}
         						
        			break;
        			
        		case "listDtl":
        			var rowCt = this.ds_mrDayDecide.getRowCount();
        		
         			if (rowCt == 0) {
         				this.grid_mrDayDecide.set_nodatatext("조회된 데이터가 없습니다.");
         			}
         						
        			break;
        			
        		default:
        			break;
        	}
        }

        /**
         * 일자별 배정건수 조회
         */
        this.fn_searchMst = function(pMrCd,pStdYm) {
        	// 기존 조회결과 초기화
        	this.ds_mrMonDecideCnt.deleteAll();
        	
        	var sSvcID        	= "listMst";                    
        	var sController   	= "/rtms/cs/selectMrMonDecideCnt.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_mrMonDecideCnt=ds_mrMonDecideCnt";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("mrCd" , pMrCd);
        	sArgs += Ex.util.setParam("stdYm", pStdYm);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 배정월 변경 이벤트 처리
         */
        this.div_search_cal_ym_onchanged = function(obj,e) {
        	// 일자별 배정건수 조회
        	this.fn_searchMst(this.fs_mrCd, e.postvalue.toString().substr(0,6));
        }

        /**
         * '일자별 배정 건수' 그리드의 Body 영역 셀 더블 클릭 이벤트 처리
         */
        this.grid_mrMonDecideCnt_oncellclick = function(obj,e) {
        	//배정내역 조회
        	this.fn_searchDtl(this.fs_mrCd, this.ds_mrMonDecideCnt.getColumn(e.row, "calDay"));
        }

        /**
         * 배정내역 조회
         */
        this.fn_searchDtl = function(pMrCd,pPlanDay) {
        	// 기존 조회결과 초기화
        	this.ds_mrDayDecide.deleteAll();
        	
        	var sSvcID        	= "listDtl";                    
        	var sController   	= "/rtms/cs/selectMrDayDecide.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_mrDayDecide=ds_mrDayDecide";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("mrCd"   , pMrCd);
        	sArgs += Ex.util.setParam("planDay", pPlanDay);
        	
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
            this.addEventHandler("onload", this.RTCSRegularCheckMrSchedulePop_onload, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.grid_mrMonDecideCnt.addEventHandler("oncellclick", this.grid_mrMonDecideCnt_oncellclick, this);
            this.div_search.ed_mrCd.addEventHandler("onkeyup", this.div_search_Ed_ctNm_onkeyup, this);
            this.div_search.ed_mrNm.addEventHandler("onkeyup", this.div_search_Ed_ctNm_onkeyup, this);
            this.div_search.cal_ym.addEventHandler("onchanged", this.div_search_cal_ym_onchanged, this);

        };

        this.loadIncludeScript("RTCSRegularCheckMrSchedulePop.xfdl");

       
    };
}
)();

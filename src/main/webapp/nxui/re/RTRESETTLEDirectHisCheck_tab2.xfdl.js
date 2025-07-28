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
                this.set_name("RTRESETTLEDirectHisCheck_tab2");
                this.set_classname("RTREKCPPayHisCheck_tab2");
                this.set_titletext("[STEP2]세틀뱅크결제내역조회");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_checkSet", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"checkSet\" type=\"STRING\" size=\"256\"/><Column id=\"setNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_checkYn", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list", this);
            obj._setContents("<ColumnInfo><Column id=\"checkDay\" type=\"STRING\" size=\"256\"/><Column id=\"checkSet\" type=\"STRING\" size=\"256\"/><Column id=\"cseqCseq\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"recpPay\" type=\"STRING\" size=\"256\"/><Column id=\"recpPayNm\" type=\"STRING\" size=\"256\"/><Column id=\"bankNm\" type=\"STRING\" size=\"256\"/><Column id=\"cardcomNm\" type=\"STRING\" size=\"256\"/><Column id=\"appAmt\" type=\"STRING\" size=\"256\"/><Column id=\"stDesc\" type=\"STRING\" size=\"256\"/><Column id=\"appDay\" type=\"STRING\" size=\"256\"/><Column id=\"cncDay\" type=\"STRING\" size=\"256\"/><Column id=\"pcncDay\" type=\"STRING\" size=\"256\"/><Column id=\"tnoTno\" type=\"STRING\" size=\"256\"/><Column id=\"appDesc\" type=\"STRING\" size=\"256\"/><Column id=\"cncAmt\" type=\"STRING\" size=\"256\"/><Column id=\"cncpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"recpAmt\" type=\"STRING\" size=\"256\"/><Column id=\"diffYn\" type=\"STRING\" size=\"256\"/><Column id=\"diffYnNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1117", "45", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1113", "10", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "0", "31", "1113", "10", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_text("체크일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_checkDay", "absolute", "120", "10", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("32");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("true");
            obj = new Static("Static03", "absolute", "261", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("33");
            obj.set_text("체크회차");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_checkSet", "absolute", "361", "10", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("34");
            obj.set_innerdataset("ds_checkSet");
            obj.set_codecolumn("checkSet");
            obj.set_datacolumn("setNm");
            obj.set_displayrowcount("5");
            obj = new Static("Static00", "absolute", "241", "0", "20", "41", null, null, this.div_search);
            obj.set_taborder("35");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "481", "0", "20", "41", null, null, this.div_search);
            obj.set_taborder("36");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "41", null, null, this.div_search);
            obj.set_taborder("37");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_checkYn", "absolute", "601", "10", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("38");
            obj.set_innerdataset("@ds_checkYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("Static01", "absolute", "1117", "0", "30", "496", null, null, this);
            obj.set_taborder("2");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "501", "12", "100", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_text("차이여부");
            obj.set_cssclass("sta_WF_schTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_list", "absolute", "0", "81", "1117", null, null, "0", this);
            obj.set_taborder("7");
            obj.set_binddataset("ds_list");
            obj.set_cellsizingtype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"70\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"90\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"70\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"체크일자\"/><Cell col=\"1\" text=\"체크회차\"/><Cell col=\"2\" text=\"차이여부명\"/><Cell col=\"3\" text=\"계약번호\"/><Cell col=\"4\" text=\"결제방법\"/><Cell col=\"5\" text=\"은행명\"/><Cell col=\"6\" text=\"카드사명\"/><Cell col=\"7\" text=\"거래상태\"/><Cell col=\"8\" text=\"거래금액\"/><Cell col=\"9\" text=\"취소금액\"/><Cell col=\"10\" text=\"취소가능금액\"/><Cell col=\"11\" text=\"수납금액\"/><Cell col=\"12\" text=\"승인일자\"/><Cell col=\"13\" text=\"취소일자\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" text=\"bind:checkDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" text=\"bind:checkSet\"/><Cell col=\"2\" text=\"bind:diffYnNm\"/><Cell col=\"3\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"4\" text=\"bind:recpPayNm\"/><Cell col=\"5\" text=\"bind:bankNm\"/><Cell col=\"6\" text=\"bind:cardcomNm\"/><Cell col=\"7\" text=\"bind:stDesc\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right;\" text=\"bind:appAmt\"/><Cell col=\"9\" displaytype=\"number\" style=\"align:right;\" text=\"bind:cncAmt\"/><Cell col=\"10\" displaytype=\"number\" style=\"align:right;\" text=\"bind:cncpAmt\"/><Cell col=\"11\" displaytype=\"number\" style=\"align:right;\" text=\"bind:recpAmt\"/><Cell col=\"12\" displaytype=\"date\" text=\"bind:appDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"13\" displaytype=\"date\" text=\"bind:cncDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\" style=\"align:right;\"/><Cell col=\"6\" style=\"align:right;\"/><Cell col=\"7\" style=\"align:right;\"/><Cell col=\"8\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;appAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"9\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;cncAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"10\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;cncpAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"11\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;recpAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"12\" style=\"align:right;\"/><Cell col=\"13\" style=\"align:right;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "45", "1147", "15", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "56", "100", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("조회결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "71", "1147", "10", null, null, this);
            obj.set_taborder("10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1117, 45, this.div_search,
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
            		p.set_classname("RTREKCPPayHisCheck_tab2");
            		p.set_titletext("[STEP2]세틀뱅크결제내역조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRESETTLEDirectHisCheck_tab2.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRESETTLEDirectHisCheck_tab2.xfdl", function() {
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg = "RTRESETTLEDirectHisCheck_tab1";
        this.toDay = "";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "getToday" ){
        		if( this.toDay != "" ){
        			this.div_search.cal_checkDay.set_value(this.toDay);
        			this.fn_initSelectCheckSet();
        		}
        	}
        	
        	if( strSvcId == "initRTRESETTLEDirectHisCheck" ){
        		var nAddRow = this.ds_checkYn.insertRow(0);
        		this.ds_checkYn.setColumn(nAddRow, "cd", " ");
        		this.ds_checkYn.setColumn(nAddRow, "cdNm", "전체");
        		this.div_search.cb_checkYn.set_value("Y");
        	}
        	
        	if( strSvcId == "checkSetRtre0045" ){
        		var nCnt = this.ds_checkSet.getRowCount();
        		if( nCnt != 0 ){
        			this.div_search.cb_checkSet.set_value(nCnt);
        		}	
        	}
        	
        	if( strSvcId == "selectSRtre0045" ){
        		
        		var listCnt = this.ds_list.getRowCount();
        		if( listCnt == 0 ){
        			this.grid_list.set_nodatatext("조회된 데이터가 없습니다.");
        			alert("조회된 데이터가 없습니다.");
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/	
        this.RTRESETTLEDirectHisCheck_tab2_onload = function(obj,e){
        	Ex.core.init(obj); 	
        	this.fn_init();
        }
        this.fn_init = function(){
        	this.fn_getToday();
        	this.fn_initCombo();
        	this.parent.parent.parent.setButton("E|S",this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getToday = function(){
        	var sSvcID      	= "getToday";  
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_initCombo = function(){
        	var sSvcID        	= "initRTRESETTLEDirectHisCheck";
        	var sController   	= "rtms/re/initRTRESETTLEDirectHisCheck.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	sOutDatasets += " ds_checkYn=mapDsCheckYn ";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_initSelectCheckSet = function(){
        	var sSvcID        	= "checkSetRtre0045";
        	var sController   	= "rtms/re/checkSetRtre0045.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_checkSet=selectCheckSetMap";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("checkDay", this.div_search.cal_checkDay.value);
        	this.ds_checkSet.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	var checkDay = nvl(this.div_search.cal_checkDay.value);
        	var checkSet = nvl(this.div_search.cb_checkSet.value);
        	var diffYn 	 = nvl(this.div_search.cb_checkYn.value);
        	this.ds_list.clearData();
        	var sSvcID        	= "selectSRtre0045";                    
        	var sController   	= "rtms/re/selectSRtre0045.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_list=selectSRtre0045Map ";
        	sArgs += Ex.util.setParam("checkDay", checkDay);
        	sArgs += Ex.util.setParam("checkSet", checkSet);
        	sArgs += Ex.util.setParam("diffYn",   diffYn);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel = function(){
        	Ex.core.exportExcel(this, this.grid_list);
        }
        this.div_search_cal_checkDay_onchanged = function(obj,e)
        {
        	this.fn_initSelectCheckSet();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTRESETTLEDirectHisCheck_tab2_onload, this);
            this.div_search.cal_checkDay.addEventHandler("onchanged", this.div_search_cal_checkDay_onchanged, this);

        };

        this.loadIncludeScript("RTRESETTLEDirectHisCheck_tab2.xfdl");

       
    };
}
)();

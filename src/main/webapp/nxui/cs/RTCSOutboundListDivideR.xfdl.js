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
                this.set_name("RTCSOutboundListDivideR");
                this.set_classname("RTCSHappyCallRegister");
                this.set_titletext("아웃바운드배정(재렌탈)");
                this._setFormPosition(0,0,1147,492);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"provsnTp\" type=\"STRING\" size=\"256\"/><Column id=\"callId\" type=\"STRING\" size=\"256\"/><Column id=\"callNm\" type=\"STRING\" size=\"256\"/><Column id=\"assignCnt\" type=\"STRING\" size=\"256\"/><Column id=\"holiYn\" type=\"STRING\" size=\"256\"/><Column id=\"noAssignCnt\" type=\"STRING\" size=\"256\"/><Column id=\"revokeCnt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsBoardInfo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"assignCnt\" type=\"STRING\" size=\"256\"/><Column id=\"noAssignCnt\" type=\"STRING\" size=\"256\"/><Column id=\"revokeCnt\" type=\"STRING\" size=\"256\"/><Column id=\"totalCnt\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"noAssignCnt\">0</Col><Col id=\"revokeCnt\">0</Col><Col id=\"assignCnt\">0</Col><Col id=\"totalCnt\">0</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsC033", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsS317", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsListCp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"provsnTp\" type=\"STRING\" size=\"256\"/><Column id=\"callId\" type=\"STRING\" size=\"256\"/><Column id=\"callNm\" type=\"STRING\" size=\"256\"/><Column id=\"assignCnt\" type=\"STRING\" size=\"256\"/><Column id=\"holiYn\" type=\"STRING\" size=\"256\"/><Column id=\"noAssignCnt\" type=\"STRING\" size=\"256\"/><Column id=\"revokeCnt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsListOrg", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"provsnTp\" type=\"STRING\" size=\"256\"/><Column id=\"callId\" type=\"STRING\" size=\"256\"/><Column id=\"callNm\" type=\"STRING\" size=\"256\"/><Column id=\"assignCnt\" type=\"STRING\" size=\"256\"/><Column id=\"holiYn\" type=\"STRING\" size=\"256\"/><Column id=\"noAssignCnt\" type=\"STRING\" size=\"256\"/><Column id=\"revokeCnt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("Div00", "absolute", "0", "0", "1122", "46", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "25", "10", "80", "21", null, null, this.Div00);
            obj.set_taborder("22");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("cal_proc_to", "absolute", "219", "10", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("34");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static07", "absolute", "207", "10", "9", "21", null, null, this.Div00);
            obj.set_taborder("35");
            obj.set_text("~");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("cal_proc_from", "absolute", "105", "10", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("36");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static26", "absolute", "0", "0", "1147", "12", null, null, this.Div00);
            obj.set_taborder("42");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "32", "1147", "12", null, null, this.Div00);
            obj.set_taborder("43");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "329", "10", "80", "21", null, null, this.Div00);
            obj.set_taborder("44");
            obj.set_text("계약만료일");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("cal_os_from", "absolute", "409", "10", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("45");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static03", "absolute", "511", "10", "9", "21", null, null, this.Div00);
            obj.set_taborder("46");
            obj.set_text("~");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("cal_os_to", "absolute", "523", "10", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("47");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Grid("Grid00", "absolute", "402", "86", "718", "402", null, null, this);
            obj.set_taborder("5");
            obj.set_binddataset("dsList");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"26\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"0\"/><Column size=\"70\"/><Column size=\"60\"/><Column size=\"60\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\"/><Cell col=\"1\" text=\"상담사유형\"/><Cell col=\"2\" text=\"상담사ID\"/><Cell col=\"3\" text=\"휴대폰\"/><Cell col=\"4\" text=\"상담사명\"/><Cell col=\"5\" text=\"배정건수\"/><Cell col=\"6\" text=\"휴무여부\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" displaytype=\"combo\" text=\"bind:provsnTp\" combodataset=\"dsS317\" combocodecol=\"cd\" combodatacol=\"cdNm\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" text=\"bind:callId\"/><Cell col=\"3\" text=\"bind:mobNo\"/><Cell col=\"4\" displaytype=\"text\" edittype=\"none\" text=\"bind:callNm\"/><Cell col=\"5\" displaytype=\"normal\" text=\"bind:assignCnt\" calendardisplaynulltype=\"none\"/><Cell col=\"6\" displaytype=\"combo\" text=\"bind:holiYn\" combodataset=\"dsC033\" combocodecol=\"cd\" combodatacol=\"cdNm\" calendardisplaynulltype=\"none\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" text=\"총계\"/><Cell col=\"2\" displaytype=\"number\" expr=\"dataset.getCountNF(0)\"/><Cell col=\"3\"/><Cell col=\"4\" text=\"건\"/><Cell col=\"5\"/><Cell col=\"6\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "0", "25", "46", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "46", "1147", "15", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "492", null, null, this);
            obj.set_taborder("9");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_divideInfo", "absolute", "0", "62", "118", "21", null, null, this);
            obj.set_taborder("10");
            obj.set_text("배정현황");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("st_divideSettingInfo", "absolute", "0", "179", "118", "21", null, null, this);
            obj.set_taborder("11");
            obj.set_text("개별배정");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("st_callInfo", "absolute", "402", "65", "118", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_text("상담사리스트");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "0", "86", "339", "66", null, null, this);
            obj.set_taborder("13");
            obj.set_binddataset("dsBoardInfo");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"0\"/><Column size=\"70\"/><Column size=\"60\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"배정\"/><Cell col=\"1\" text=\"미배정\"/><Cell col=\"2\" text=\"휴대폰\"/><Cell col=\"3\" text=\"회수\"/><Cell col=\"4\" text=\"합계\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" text=\"bind:assignCnt\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" text=\"bind:noAssignCnt\"/><Cell col=\"2\" text=\"bind:mobNo\"/><Cell col=\"3\" displaytype=\"normal\" edittype=\"none\" text=\"bind:revokeCnt\"/><Cell col=\"4\" displaytype=\"normal\" text=\"bind:totalCnt\" calendardisplaynulltype=\"none\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "301", "339", "31", null, null, this);
            obj.set_taborder("14");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_rntMstId00", "absolute", "0", "301", "125", "31", null, null, this);
            obj.set_taborder("15");
            obj.set_text("평균배정건수");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_rntMstId01", "absolute", "0", "271", "125", "31", null, null, this);
            obj.set_taborder("16");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "271", "339", "31", null, null, this);
            obj.set_taborder("17");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_rntMstId02", "absolute", "0", "241", "125", "31", null, null, this);
            obj.set_taborder("18");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "241", "339", "31", null, null, this);
            obj.set_taborder("19");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_rntMstId03", "absolute", "0", "211", "125", "31", null, null, this);
            obj.set_taborder("20");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "211", "339", "31", null, null, this);
            obj.set_taborder("21");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_rntMstId04", "absolute", "0", "271", "125", "31", null, null, this);
            obj.set_taborder("22");
            obj.set_text("인원");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_rntMstId05", "absolute", "0", "241", "125", "31", null, null, this);
            obj.set_taborder("23");
            obj.set_text("배정건수(기입)");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_rntMstId06", "absolute", "0", "211", "125", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_text("배정가능건수");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_assign_future", "absolute", "131", "216", "201", "21", null, null, this);
            obj.set_taborder("25");
            obj.set_maxlength("50");
            obj.set_readonly("true");
            obj.set_displaynulltext("0");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_assign_future_input", "absolute", "131", "246", "201", "21", null, null, this);
            obj.set_taborder("26");
            obj.set_maxlength("50");
            obj.set_displaynulltext("0");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_userCnt", "absolute", "131", "276", "201", "21", null, null, this);
            obj.set_taborder("27");
            obj.set_maxlength("50");
            obj.set_readonly("true");
            obj.set_displaynulltext("0");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_assign_average", "absolute", "131", "306", "201", "21", null, null, this);
            obj.set_taborder("28");
            obj.set_maxlength("50");
            obj.set_enable("true");
            obj.set_readonly("true");
            obj.set_displaynulltext("0");
            this.addChild(obj.name, obj);

            obj = new Button("btn_pop", "absolute", null, "62", "92", "22", "28", null, this);
            obj.set_taborder("29");
            obj.set_text("상담사 관리");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_revoke", "absolute", null, "62", "92", "22", "124", null, this);
            obj.set_taborder("30");
            obj.set_text("배정회수");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_dist_day", "absolute", "824", "63", "100", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("31");
            obj.set_dateformat("yyyy-MM-dd");


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 46, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 492, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSHappyCallRegister");
            		p.set_titletext("아웃바운드배정(재렌탈)");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_assign_future","value","dsBoardInfo","assignCnt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_assign_future_input","value","dsBoardInfo","rntMstId");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_userCnt","value","dsBoardInfo","rntMstId");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_assign_average","value","ds_list","rntMstId");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSOutboundListDivideR.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSOutboundListDivideR.xfdl", function() {
        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";

        this.NOASSIGN = "NOASSIGN";

        this.firstDate  = "";
        this.lastDate  = "";

        this.p_arg = "";

        /* Form onload Event */
        this.form_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.parent.setButton("E|AG|S", this);
        	this.fn_init();
        	this.get_date();
        }

        //java comm에서 현재 날짜 가져오기
        this.get_date = function() 
        {
        	var sSvcID        	= "getDate";                    
        	var sController   	= "/rtms/sd/getDate.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /* 공통코드 조회 */
        this.fn_init = function(obj,e)
        {
        	
        	var sSvcID        	= "initCounselorMaster";             
        	var sController   	= "/ntrms/cs/initCounselorMaster.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsS317=s317 dsC033=c033";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /* 배정 기준 정보 조회 */
        this.fn_search = function(obj,e)
        {
        	
        	var procDayF = this.Div00.cal_proc_from.value;
        	var procDayT = this.Div00.cal_proc_to.value;
        	
        	var osDayF = this.Div00.cal_os_from.value;
        	var osDayT = this.Div00.cal_os_to.value;
        	
        	var sSvcID        	= "selectOutboundAssignInfo";             
        	var sController   	= "rtms/sd/selectOutboundAssignInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsListOrg=output";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsList.clearData();
        	
        	sArgs += Ex.util.setParam("provsnDayF", "");
        	sArgs += Ex.util.setParam("provsnDayT", "");
        	sArgs += Ex.util.setParam("procDayF", procDayF);
        	sArgs += Ex.util.setParam("procDayT", procDayT);
        	sArgs += Ex.util.setParam("osDayF", osDayF);
        	sArgs += Ex.util.setParam("osDayT", osDayT);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /* 아웃바운드 상담내역 분배 처리 */
        this.fn_aggregate = function(obj,e)
        {

        	var assignFutureInput = nvl(this.ed_assign_future_input.value);
        	if(assignFutureInput == "") {
        		this.alert("배정 기준 건 수가 입력되지 않았습니다.");
        		return;
        	}
        	
        	var chkCnt = 0;
        	for(var i=0; i<this.dsList.rowcount; i++){
        		if(nvl(this.dsList.getColumn(i, "chk")) == "1"){
        			chkCnt++;
        		}
        	}
        	
        	if(chkCnt == 0){
        		this.alert("상담사 리스트를 선택하지 않았습니다.");
        		return;
        	}
        	
        	var sSvcID        	= "aggregateOutboundListDivide";             
        	var sController   	= "rtms/sd/aggregateOutboundListDivide.do";
        	var sInDatasets   	= "input=dsList:U";
        	var sOutDatasets  	= "";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("provsnDayF", "");
        	sArgs += Ex.util.setParam("provsnDayT", "");
        	sArgs += Ex.util.setParam("distCnt", assignFutureInput);
        	sArgs += Ex.util.setParam("contractType", "R");
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /* 아웃바운드 상담내역 회수 처리 */
        this.fn_revoke = function()
        {	
        	var distDay = this.cal_dist_day.value;
        	if(nvl(distDay) == "") {
        		this.alert("배정일자가 선택되지 않았습니다.");
        		return;
        	}
        	
        	var chkCnt = 0;
        	for(var i=0; i<this.dsList.rowcount; i++){
        		if(nvl(this.dsList.getColumn(i, "chk")) == "1"){
        			chkCnt++;
        		}
        	}
        	
        	if(chkCnt == 0){
        		this.alert("상담사 리스트를 선택하지 않았습니다.");
        		return;
        	}
        	
        	var sSvcID        	= "updateOutboundListRevoke";             
        	var sController   	= "rtms/sd/updateOutboundListRevoke.do";
        	var sInDatasets   	= "input=dsList:U";
        	var sOutDatasets  	= "";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("provsnDayF", "");
        	sArgs += Ex.util.setParam("provsnDayT", "");
        	sArgs += Ex.util.setParam("distCnt", assignFutureInput);
        	sArgs += Ex.util.setParam("contractType", "R");
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /* 조회 데이터 중 배정건수/미배정,회수건수 분리 */
        this.fn_filteringDataset = function(){
        	
        	this.dsListOrg.filter("callId == '" + this.NOASSIGN + "'");
        	this.dsListCp.copyData(this.dsListOrg, true);	
        	
        	this.dsListOrg.filter("");	
        	this.dsListOrg.filter("callId != '" + this.NOASSIGN + "'");
        	this.dsList.copyData(this.dsListOrg, true);
        }

        /* 현황데이터 할당/합계 데이터 계산 */
        this.fn_calcBoardData = function(){

        	var noAssignCnt = Number(this.dsBoardInfo.getColumn(0, "noAssignCnt"));
        	var revokeCnt = Number(this.dsBoardInfo.getColumn(0, "revokeCnt"));
        	
        	this.dsBoardInfo.setColumn(0, "assignCnt", noAssignCnt + revokeCnt);
        	this.dsBoardInfo.setColumn(0, "totalCnt", Number(this.dsBoardInfo.getColumn(0, "assignCnt")) + noAssignCnt + revokeCnt);
        }

        /* 할당데이터 할당/합계 데이터 계산 */
        this.fn_calcAssignData = function(){

        	var assignAvailableCnt = Number(this.ed_assign_future_input.value);
        	var counsellorCnt = this.dsList.rowcount;
        	
        	var averageAssignCnt = 0;	
        	if(assignAvailableCnt > 0){
        		averageAssignCnt = assignAvailableCnt / counsellorCnt;
        	}
        	
        	this.ed_userCnt.set_value(counsellorCnt);
        	this.ed_assign_average.set_value(averageAssignCnt);
        }
        /***********************************************************************************
        * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        ***********************************************************************************/

        /* callBack함수 */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        { 
        	if (nErrorCode < 0) 
        	{
        		alert(strErrorMsg);				
        		return;
        	} 
        	
        	if(strSvcId == "getDate") {
        // 		this.Div00.cal_proc_from.set_value(this.firstDate);
        // 		this.Div00.cal_proc_to.set_value(this.lastDate);
        	}
        	
        	if (strSvcId == "selectCounselorMasterList") 
        	{
        		var cnt = this.dsList.getRowCount();
        		if( cnt <= 0) {
        			alert("조회된 데이터가 없습니다.");
        			return;
        		}
        	}
        }

        /***********************************************************************************
        * Control Event
        ***********************************************************************************/
        /* Excel파일 추출  Event */
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.Grid00);
        }

        /* 조회 완료 후 Dataset로딩  Event */
        this.dsListOrg_onload = function(obj,e)
        {
        	if(this.dsListOrg.rowcount > 0){
        	
        		this.fn_filteringDataset();		
        		this.fn_calcAssignData();
        		
        		this.dsBoardInfo.setColumn(0, "noAssignCnt", this.dsListCp.getColumn(0, "noAssignCnt"));
        		this.dsBoardInfo.setColumn(0, "revokeCnt", this.dsListCp.getColumn(0, "revokeCnt"));
        		
        		this.fn_calcBoardData();
        	}
        }

        /* 상담사 관리 팝업 화면 오픈  Event */
        this.btn_pop_onclick = function(obj,e)
        {
        	var args = {p_arg : this.p_arg};
        	Ex.core.popup(this, "상담사관리", "comm::RTCOMMCounselor_pop.xfdl", args, "modaless=false");
        }

        /* 배정 건수 기입시 key-up  Event */
        this.ed_assign_future_input_onkeyup = function(obj,e)
        {
        	this.fn_calcAssignData();
        }

        /* 배정 회수  Event */
        this.btn_revoke_onclick = function(obj,e)
        {
        	this.fn_revoke();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.dsListCp.addEventHandler("onload", this.dsList_onload, this);
            this.dsListOrg.addEventHandler("onload", this.dsListOrg_onload, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.Div00.cal_proc_to.addEventHandler("onchanged", this.Div00_Calendar02_onchanged, this);
            this.Div00.cal_proc_to.addEventHandler("canchange", this.Div00_Calendar02_canchange, this);
            this.Div00.cal_os_to.addEventHandler("onchanged", this.Div00_Calendar02_onchanged, this);
            this.Div00.cal_os_to.addEventHandler("canchange", this.Div00_Calendar02_canchange, this);
            this.ed_assign_future_input.addEventHandler("onkeyup", this.ed_assign_future_input_onkeyup, this);
            this.btn_pop.addEventHandler("onclick", this.btn_pop_onclick, this);
            this.btn_revoke.addEventHandler("onclick", this.btn_revoke_onclick, this);

        };

        this.loadIncludeScript("RTCSOutboundListDivideR.xfdl");

       
    };
}
)();

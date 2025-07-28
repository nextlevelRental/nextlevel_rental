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
                this.set_name("RTRESalesCommMangOpenMall");
                this.set_classname("RTRESalesCommMangOpenMall");
                this.set_titletext("판매수수료관리(오픈몰)");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj._setContents("<ColumnInfo><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"agentNm\" type=\"STRING\" size=\"256\"/><Column id=\"chrSeq\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"slcmAmt\" type=\"STRING\" size=\"256\"/><Column id=\"apfdAmt\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"oldStrDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_save", this);
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj._setContents("<ColumnInfo><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"agentNm\" type=\"STRING\" size=\"256\"/><Column id=\"chrSeq\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"slcmAmt\" type=\"STRING\" size=\"256\"/><Column id=\"apfdAmt\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"oldStrDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYn", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "1117", "0", "30", "496", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1117", "45", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Edit("ed_agentNm", "absolute", "440", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("14");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_ordAgent", "absolute", "275", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("판매처");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_standardDay", "absolute", "25", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("17");
            obj.set_text("기준일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "33", "1118", "12", null, null, this.div_search);
            obj.set_taborder("19");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "245", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("21");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "640", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("22");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "1088", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("dt_standardDay", "absolute", "105", "12", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("26");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Edit("ed_ordAgent", "absolute", "360", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_enable("true");
            obj.set_tooltiptext("edit");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_ordAgent", "absolute", "419", "12", "20", "21", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "62", "140", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "77", "1147", "10", null, null, this);
            obj.set_taborder("3");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "45", "1147", "20", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "365", "1147", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "350", "140", "20", null, null, this);
            obj.set_taborder("6");
            obj.set_text("변경할 내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "333", "1147", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static43", "absolute", "0", "375", "1117", "31", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordAgent", "absolute", "0", "375", "130", "31", null, null, this);
            obj.set_taborder("9");
            obj.set_text("판매처");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_agentNm", "absolute", "215", "380", "153", "21", null, null, this);
            obj.set_taborder("10");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "405", "1117", "31", null, null, this);
            obj.set_taborder("11");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "435", "1117", "31", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "0", "465", "1117", "31", null, null, this);
            obj.set_taborder("13");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_strDay", "absolute", "375", "375", "130", "31", null, null, this);
            obj.set_taborder("14");
            obj.set_text("시작일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_regNm", "absolute", "750", "375", "130", "31", null, null, this);
            obj.set_taborder("15");
            obj.set_text("등록자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_regNm", "absolute", "885", "380", "227", "21", null, null, this);
            obj.set_taborder("16");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_endDay", "absolute", "375", "405", "130", "31", null, null, this);
            obj.set_taborder("18");
            obj.set_text("종료일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_regDt", "absolute", "750", "405", "130", "31", null, null, this);
            obj.set_taborder("19");
            obj.set_text("등록일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_useYn", "absolute", "375", "435", "130", "31", null, null, this);
            obj.set_taborder("21");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("st_chgNm", "absolute", "750", "435", "130", "31", null, null, this);
            obj.set_taborder("22");
            obj.set_text("수정자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_chgNm", "absolute", "885", "440", "227", "21", null, null, this);
            obj.set_taborder("23");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_chgDt", "absolute", "750", "465", "130", "31", null, null, this);
            obj.set_taborder("25");
            obj.set_text("수정일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_useYn", "absolute", "510", "440", "235", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("26");
            obj.set_autoselect("true");
            obj.set_innerdataset("ds_useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_enable("false");
            obj.set_index("0");

            obj = new Edit("ed_ordAgent", "absolute", "135", "380", "80", "21", null, null, this);
            obj.set_taborder("27");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("bt_ordAgent", "absolute", "195", "380", "20", "21", null, null, this);
            obj.set_taborder("28");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Calendar("dt_strDay", "absolute", "510", "380", "235", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("31");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_cssclass("readonly");
            obj.set_enable("false");

            obj = new Calendar("dt_endDay", "absolute", "510", "410", "235", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("32");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_cssclass("readonly");
            obj.set_enable("false");

            obj = new Calendar("dt_regDt", "absolute", "885", "410", "227", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("33");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_cssclass("readonly");
            obj.set_enable("false");

            obj = new Calendar("dt_chgDt", "absolute", "885", "470", "227", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("34");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_cssclass("readonly");
            obj.set_enable("false");

            obj = new Button("bt_insert", "absolute", "1076", "349", "41", "21", null, null, this);
            obj.set_taborder("35");
            obj.set_text("추가");
            this.addChild(obj.name, obj);

            obj = new Button("bt_delete", "absolute", "1029", "349", "41", "21", null, null, this);
            obj.set_taborder("36");
            obj.set_text("삭제");
            this.addChild(obj.name, obj);

            obj = new Grid("gr_list", "absolute", "0", "87", "1117", "246", null, null, this);
            obj.set_taborder("37");
            obj.set_binddataset("ds_list");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"140\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"판매처코드\"/><Cell col=\"1\" text=\"판매처명\"/><Cell col=\"2\" text=\"시작일자\"/><Cell col=\"3\" text=\"종료일자\"/><Cell col=\"4\" text=\"판매수수료\"/><Cell col=\"5\" text=\"충당금 설정금액\"/><Cell col=\"6\" text=\"사용여부\"/><Cell col=\"7\" text=\"등록자\"/><Cell col=\"8\" text=\"등록일자\"/><Cell col=\"9\" text=\"수정자\"/><Cell col=\"10\" text=\"수정일자\"/></Band><Band id=\"body\"><Cell text=\"bind:ordAgent\" tooltiptext=\"bind:ordAgent\"/><Cell col=\"1\" text=\"bind:agentNm\" tooltiptext=\"bind:agentNm\"/><Cell col=\"2\" displaytype=\"date\" text=\"bind:strDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:strDay\"/><Cell col=\"3\" displaytype=\"date\" text=\"bind:endDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:endDay\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;\" text=\"bind:slcmAmt\" mask=\"###,###,###,##0\" tooltiptext=\"bind:slcmAmt\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" text=\"bind:apfdAmt\" mask=\"###,###,###,##0\" tooltiptext=\"bind:apfdAmt\"/><Cell col=\"6\" text=\"bind:useYn\" combodataset=\"ds_useYn\" combocodecol=\"cd\" combodatacol=\"cdNm\" tooltiptext=\"bind:useYn\"/><Cell col=\"7\" text=\"bind:regNm\" tooltiptext=\"bind:regNm\"/><Cell col=\"8\" displaytype=\"date\" text=\"bind:regDt\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:regDt\"/><Cell col=\"9\" text=\"bind:chgNm\" tooltiptext=\"bind:chgNm\"/><Cell col=\"10\" displaytype=\"date\" text=\"bind:chgDt\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:chgDt\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" text=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\" style=\"align:right;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\" style=\"align:right;\"/><Cell col=\"6\" style=\"align:right;\"/><Cell col=\"7\" style=\"align:right;\"/><Cell col=\"8\" style=\"align:right;\"/><Cell col=\"9\" style=\"align:right;\"/><Cell col=\"10\" style=\"align:right;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_slcmAmt", "absolute", "0", "405", "130", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_text("판매수수료");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Spin("ed_slcmAmt", "absolute", "135", "410", "235", "21", null, null, this);
            obj.set_taborder("39");
            obj.set_value("0");
            obj.set_max("100000000");
            obj.set_displaycomma("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_apfdAmt", "absolute", "0", "435", "130", "31", null, null, this);
            obj.set_taborder("40");
            obj.set_text("충당설정금액");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Spin("ed_apfdAmt", "absolute", "135", "440", "235", "21", null, null, this);
            obj.set_taborder("41");
            obj.set_value("0");
            obj.set_max("100000000");
            obj.set_displaycomma("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1117, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTRESalesCommMangOpenMall");
            		p.set_titletext("판매수수료관리(오픈몰)");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_agentNm","value","ds_list","agentNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_ordAgent","value","ds_list","ordAgent");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","dt_strDay","value","ds_list","strDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_regNm","value","ds_list","regNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_slcmAmt","value","ds_list","slcmAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","dt_endDay","value","ds_list","endDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","dt_regDt","value","ds_list","regDt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_apfdAmt","value","ds_list","apfdAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","cb_useYn","value","ds_list","useYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","ed_chgNm","value","ds_list","chgNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","dt_chgDt","value","ds_list","chgDt");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRESalesCommMangOpenMall.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRESalesCommMangOpenMall.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 		= "RTRESalesCommMangOpenMall";
        this.toDay 		= "";
        this.addMonth 	= "";
        this.firstDay	= "";
        this.lastDay	= "";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "RTRESalesCommMangOpenMall" ) {
        	}
        	
        	if( strSvcId == "getToday" ) {
        		if( this.toDay != "" ){
        			this.div_search.dt_standardDay.set_value( this.toDay );
        			this.addMonth = Eco.date.addMonth( this.toDay, 1 );
        			this.firstDay  = Eco.date.getFirstDate( this.toDay );
        			this.lastDay   = this.addMonth.substr(0,4)+this.addMonth.substr(4,2)+Eco.date.getLastDayOfMonth(this.addMonth);
        		}
        	}
        	
        	if( strSvcId == "selectRTRESalesCommMangOpenMall" ){
        		var rowCt = this.ds_list.getRowCount();
        		if( rowCt == 0 ){
        			alert("조회된 데이터가 없습니다.");
        			this.gr_list.set_nodatatext("조회된 데이터가 없습니다.");
        		}else{
        			if( nvl(this.div_search.ed_ordAgent.value) != "" ){
        				this.div_search.ed_agentNm.set_value( this.ds_list.getColumn(0, "agentNm") );
        			}else{
        				this.div_search.ed_agentNm.set_value( "" );
        			}
        			this.gr_list_onselectchanged();
        		}
        	}
        	
        	if( strSvcId == "saveRTRESalesCommMangOpenMall" ){
        		alert(strErrorMsg);
        		if( nErrorCode < 0 ){
        		
        		}else{
        			this.fn_search();
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTRESalesCommMangOpenMall_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_setButton();
        	this.fn_init();
        	this.fn_getToday();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_setButton = function(){
        	this.parent.setButton("E|C|S", this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	var sSvcID      	= "RTRESalesCommMangOpenMall";  
        	var sController   	= "rtms/re/RTRESalesCommMangOpenMall.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_useYn=mapDsUseYn ";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
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
        this.fn_search = function(){
        	var standardDay = nvl(this.div_search.dt_standardDay.value);
        	var ordAgent 	= nvl(this.div_search.ed_ordAgent.value);
        	
        	var sSvcID        	= "selectRTRESalesCommMangOpenMall";
        	var sController   	= "rtms/re/selectRTRESalesCommMangOpenMall.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list=outList";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	this.ds_list.clearData();
        	sArgs += Ex.util.setParam("standardDay", standardDay);
        	sArgs += Ex.util.setParam("ordAgent", ordAgent);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(){
        	var flag 		= -1;
        	var saveFlag 	= -1;
        	var nCnt 		= this.ds_list.getRowCount();
        	var msg 		= " 값이 없습니다.";
        	
        	for( var i = 0 ; i < nCnt ; i++ ){
        		var rowType = this.ds_list.getRowType(i);
        		if( rowType == 2 || rowType == 4 ){
        			flag++;
        		}
        	}
        	
        	if( flag == -1 ){
        		alert("추가 또는 수정된 정보가 없습니다.");
        		return false;
        	}
        	
        	if( flag != 0 ){
        		alert("추가 또는 수정된 정보가 "+flag+"건 이므로 저장할 수가 없습니다.");
        		return false;
        	}
        	
        	for( var i = 0 ; i < nCnt ; i++ ){
        		var rowType = this.ds_list.getRowType(i);
        		if( rowType == 2 || rowType == 4 ){
        			saveFlag = i;
        			break;
        		}
        	}
        	
        	var ordAgent	= nvl(this.ds_list.getColumn( saveFlag, "ordAgent" ));
        	var strDay  	= nvl(this.ds_list.getColumn( saveFlag, "strDay" ));
        	var endDay  	= nvl(this.ds_list.getColumn( saveFlag, "endDay" ));
        	var slcmAmt 	= nvl(this.ds_list.getColumn( saveFlag, "slcmAmt" ));
        	var apfdAmt 	= nvl(this.ds_list.getColumn( saveFlag, "apfdAmt" ));
        	var useYn   	= nvl(this.ds_list.getColumn( saveFlag, "useYn" ));
        	
        	var saveType	= this.ds_list.getRowType( saveFlag );
        	
        	if( ordAgent == "" ){ 		alert( "판매처"+msg );			this.ds_list.set_rowposition(saveFlag); return false;
        	}else if( strDay == "" ){ 	alert( "시작일자"+msg );		this.ds_list.set_rowposition(saveFlag);	return false;
        	}else if( endDay == "" ){ 	alert( "종료일자"+msg );		this.ds_list.set_rowposition(saveFlag);	return false;
        	}else if( slcmAmt == "" ){ 	alert( "판매수수료"+msg );		this.ds_list.set_rowposition(saveFlag);	return false;
        	}else if( apfdAmt == "" ){ 	alert( "충당설정금액"+msg );	this.ds_list.set_rowposition(saveFlag);	return false;
        	}else if( useYn == "" ){ 	alert( "사용유무"+msg );		this.ds_list.set_rowposition(saveFlag);	return false;
        	}else if( (saveType == 2) && ( (strDay < this.firstDay) || (strDay > this.lastDay) ) ){
        		alert("현재일자 기준으로 1일부터 익월말일까지 입력가능합니다.");
        		this.ds_list.set_rowposition(saveFlag);
        		return false;
        	}else if( (saveType == 4) && ( (strDay < this.firstDay) || (strDay > this.lastDay) ) ){//(oldStrDay < this.firstDay) ||
        		alert("기존 내역의 값이 현재월보다 작은경우 변경 불가하며 변경하는 값은 당월 ~ 익월까지 입력가능합니다.");
        		this.ds_list.set_rowposition(saveFlag);
        		return false;
        	}else{
        		this.ds_save.clearData();
        		var saveAddRow  = this.ds_save.addRow();
        		var copy 		= this.ds_save.copyRow( saveAddRow, this.ds_list, saveFlag );
        	
        		if( copy ){
        			this.ds_save.set_updatecontrol(false);
        			this.ds_save.setRowType( saveAddRow, saveType );
        			this.ds_save.set_updatecontrol(true);
        			
        			if( confirm( "저장하시겠습니까?" ) ){
        				var sSvcID        	= "saveRTRESalesCommMangOpenMall";                
        				var sController   	= "rtms/re/saveRTRESalesCommMangOpenMall.do";
        				var sInDatasets   	= "";
        				var sOutDatasets  	= "";
        				var sArgs 			= "";
        				sInDatasets   		= "input=ds_save:U";
        				sOutDatasets  		= "";
        				var fn_callBack		= "fn_callBack";		
        				Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        			}
        		}else{
        			alert("SYSTEM ERROR");
        			return false;
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel = function(){
        	Ex.core.exportExcel(this, this.gr_list);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_ordAgent_onclick = function(obj,e){
        	var args ={p_arg : "selectRTRESalesCommMangOpenMall"};
        	Ex.core.popup(this,"판매인조회","comm::RTCOMMOrdAgentList_pop.xfdl",args, "modaless=false");
        }
        this.retrunSelect = function(res){
        	this.div_search.ed_ordAgent.set_value(res[0]);
        	this.div_search.ed_agentNm.set_value(res[1]);
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.bt_ordAgent_onclick = function(obj,e){
        	var args ={p_arg : "insertRTRESalesCommMangOpenMall"};
        	Ex.core.popup(this,"판매인조회","comm::RTCOMMOrdAgentList_pop.xfdl",args, "modaless=false");
        }
        this.retrunInsert = function(res){
        	this.ed_ordAgent.set_value(res[0]);
        	this.ed_agentNm.set_value(res[1]);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.bt_delete_onclick = function(obj,e){
        	var deleteRowFlag = false;
        	var nCnt = this.ds_list.getRowCount();
        	
        	if( nCnt == 0 ){
        		alert("삭제할 정보가 없습니다.");
        	}else{
        		var nRow = this.ds_list.rowposition;
        		if( this.ds_list.getRowType(nRow) == 2 ){
        			if( confirm( "삭제하시겠습니까?" ) ){
        				this.ds_list.deleteRow(nRow);
        			}
        		}else{
        			alert("해당정보는 삭제할 수가 없습니다.");
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.bt_insert_onclick = function(obj,e){
        	var insertRowFlag = false;
        	var nCnt = this.ds_list.getRowCount();
        	
        	if( nCnt == 0 ){
        		insertRowFlag = true;
        	}else{
        		for( var i = 0 ; i < nCnt ;  i++ ){
        			var type = this.ds_list.getRowType(i);
        			if( (type == 2) || (type == 4) ){
        				alert("추가 또는 수정된 정보가 있으므로 추가할 수 없습니다.");
        				insertRowFlag = false;
        				break;
        			}else{
        				insertRowFlag = true;
        			}
        		}
        	}
        	
        	if( insertRowFlag ){
        		var addRow = this.ds_list.addRow();
        		this.ds_list.setColumn( addRow, "useYn", "Y" );
        		this.ds_list.setColumn( addRow, "endDay", "99991231" );
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.gr_list_onselectchanged = function(obj,e){
        	var strDay = nvl(this.ds_list.getColumn( this.ds_list.rowposition, "strDay" ));
        	var endDay = nvl(this.ds_list.getColumn( this.ds_list.rowposition, "endDay" ));
        	this.oldStrDay = strDay;
        	
        	if( this.ds_list.getRowType( this.ds_list.rowposition ) == 2 ){
        		this.cb_useYn.set_enable(false);
        		this.bt_ordAgent.set_enable(true);
        		
        		this.dt_strDay.set_enable(true);
        		this.ed_slcmAmt.set_enable(true);
        		this.ed_apfdAmt.set_enable(true);
        	}else{
        		this.bt_ordAgent.set_enable(false);
        		
        		if( strDay != "" ){
        			if( (strDay.substr(0,6) < this.toDay.substr(0,6)) || (endDay != "99991231") ){
        				this.cb_useYn.set_enable(false);
        				
        				this.dt_strDay.set_enable(false);
        				this.ed_slcmAmt.set_enable(false);
        				this.ed_apfdAmt.set_enable(false);
        			}else{
        				this.cb_useYn.set_enable(true);
        				
        				this.dt_strDay.set_enable(true);
        				this.ed_slcmAmt.set_enable(true);
        				this.ed_apfdAmt.set_enable(true);
        			}
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_dt_standardDay_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.fn_search();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_ordAgent_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.fn_search();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.ds_list_canrowposchange = function(obj,e){
        	var nCnt = this.ds_list.getRowCount();
        	var flag = false;
        	for( var i = 0 ; i < nCnt ; i++ ){
        		var stat = this.ds_list.getRowType(i);
        		if( stat == 2 || stat == 4 ){
        			alert("추가 또는 수정된 정보가 있습니다.\n저장 후 진행하세요.");
        			flag = false;
        			break;
        		}else{
        			flag = true;
        		}
        	}
        	return flag;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.dt_strDay_onchanged = function(obj,e){
        	var nRow 	 	= this.ds_list.rowposition;
        	var saveType 	= this.ds_list.getRowType( nRow );
        	var returnFlag 	= true;
        	if( (saveType == 2) && ( (e.postvalue < this.firstDay) || (e.postvalue > this.lastDay) ) ){
        		alert("현재일자 기준으로 1일부터 익월말일까지 입력가능합니다.");
        		returnFlag = false;
        	}
        	
        	if( (saveType == 4) && ( (e.prevalue < this.firstDay) || (this.firstDay > e.postvalue) || (e.postvalue > this.lastDay) ) ){
        		alert("기존 내역의 값이 현재월보다 작은경우 변경 불가하며 변경하는 값은 당월 ~ 익월까지 입력가능합니다.");
        		returnFlag = false;
        	}
        	
        	if(returnFlag){
        		this.ds_list.setColumn( nRow, "oldStrDay", this.ds_list.getColumn(nRow, "strDay") );
        	}else{
        		this.dt_strDay.set_value(e.prevalue);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_list.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.addEventHandler("onload", this.RTRESalesCommMangOpenMall_onload, this);
            this.div_search.dt_standardDay.addEventHandler("onkeyup", this.div_search_dt_standardDay_onkeyup, this);
            this.div_search.ed_ordAgent.addEventHandler("onkeyup", this.div_search_ed_ordAgent_onkeyup, this);
            this.div_search.bt_ordAgent.addEventHandler("onclick", this.div_search_bt_ordAgent_onclick, this);
            this.bt_ordAgent.addEventHandler("onclick", this.bt_ordAgent_onclick, this);
            this.dt_strDay.addEventHandler("onchanged", this.dt_strDay_onchanged, this);
            this.bt_insert.addEventHandler("onclick", this.bt_insert_onclick, this);
            this.bt_delete.addEventHandler("onclick", this.bt_delete_onclick, this);
            this.gr_list.addEventHandler("onselectchanged", this.gr_list_onselectchanged, this);

        };

        this.loadIncludeScript("RTRESalesCommMangOpenMall.xfdl");

       
    };
}
)();

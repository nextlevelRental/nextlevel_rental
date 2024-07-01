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
                this.set_name("RTSDOrdAgentResult");
                this.set_classname("RTSDSellersResult");
                this.set_titletext("판매인실적조회");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_ordAgentList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"sales_groupNm\" type=\"STRING\" size=\"256\"/><Column id=\"sales_officeNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"pgNm\" type=\"STRING\" size=\"256\"/><Column id=\"petternNm\" type=\"STRING\" size=\"256\"/><Column id=\"sectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiNm\" type=\"INT\" size=\"256\"/><Column id=\"monAmt\" type=\"INT\" size=\"256\"/><Column id=\"orgAgnm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("0");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "49", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Edit("ed_ordAgentCd", "absolute", "105", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("45");
            obj.set_enable("false");
            obj.set_tooltiptext("edit");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_agencyCd", "absolute", "25", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("46");
            obj.set_text("판매인");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("54");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "33", "1118", "12", null, null, this.div_search);
            obj.set_taborder("55");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "45", null, null, this.div_search);
            obj.set_taborder("56");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "365", "0", "25", "45", null, null, this.div_search);
            obj.set_taborder("57");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "730", "0", "25", "45", null, null, this.div_search);
            obj.set_taborder("58");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_ordAgent", "absolute", "225", "12", "20", "21", null, null, this.div_search);
            obj.set_taborder("62");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordAgentNm", "absolute", "245", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("72");
            obj.set_enable("false");
            obj.set_tooltiptext("edit");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_procDayE", "absolute", "611", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("73");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static03", "absolute", "596", "12", "9", "21", null, null, this.div_search);
            obj.set_taborder("74");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_procDayS", "absolute", "471", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("75");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("st_procDay", "absolute", "391", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("76");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grid_ordAgent", "absolute", "0", "89", "1122", "407", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_ordAgentList");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"180\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"렌탈지사\"/><Cell col=\"1\" text=\"렌탈지점\"/><Cell col=\"2\" text=\"대리점\"/><Cell col=\"3\" text=\"계약번호\"/><Cell col=\"4\" text=\"PG\"/><Cell col=\"5\" text=\"패턴\"/><Cell col=\"6\" text=\"단면폭\"/><Cell col=\"7\" text=\"편평비\"/><Cell col=\"8\" text=\"인치\"/><Cell col=\"9\" text=\"PR\"/><Cell col=\"10\" text=\"본수\"/><Cell col=\"11\" text=\"상품코드\"/><Cell col=\"12\" text=\"계절구분\"/><Cell col=\"13\" text=\"장착일자\"/><Cell col=\"14\" text=\"계약기간\"/><Cell col=\"15\" text=\"고객명\"/><Cell col=\"16\" text=\"등록비\"/><Cell col=\"17\" text=\"월렌탈료\"/><Cell col=\"18\" text=\"판매인명\"/><Cell col=\"19\" text=\"판매인코드\"/></Band><Band id=\"body\"><Cell text=\"bind:rentalGroupNm\"/><Cell col=\"1\" text=\"bind:rentalOfficeNm\"/><Cell col=\"2\" text=\"bind:agencyNm\"/><Cell col=\"3\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"4\" text=\"bind:pgNm\"/><Cell col=\"5\" text=\"bind:petternNm\"/><Cell col=\"6\" text=\"bind:sectionWidth\"/><Cell col=\"7\" text=\"bind:aspectRatio\"/><Cell col=\"8\" text=\"bind:wheelInches\"/><Cell col=\"9\" text=\"bind:plyRating\"/><Cell col=\"10\" text=\"bind:cntNm\"/><Cell col=\"11\" text=\"bind:matCd\"/><Cell col=\"12\" text=\"bind:seasonNm\"/><Cell col=\"13\" displaytype=\"date\" text=\"bind:procDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"14\" text=\"bind:periodNm\"/><Cell col=\"15\" text=\"bind:custNm\"/><Cell col=\"16\" displaytype=\"number\" style=\"align:right;\" text=\"bind:regiNm\" mask=\"###,###,###,##0\"/><Cell col=\"17\" displaytype=\"number\" style=\"align:right;\" text=\"bind:monAmt\" mask=\"###,###,###,##0\"/><Cell col=\"18\" text=\"bind:orgAgnm\"/><Cell col=\"19\" text=\"bind:ordAgent\"/></Band><Band id=\"summary\"><Cell text=\"총합계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\" style=\"align:right;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\" style=\"align:right;\"/><Cell col=\"6\" style=\"align:right;\"/><Cell col=\"7\" style=\"align:right;\"/><Cell col=\"8\" style=\"align:right;\"/><Cell col=\"9\" style=\"align:right;\"/><Cell col=\"10\" style=\"align:right;\"/><Cell col=\"11\" style=\"align:right;\"/><Cell col=\"12\" style=\"align:right;\"/><Cell col=\"13\" style=\"align:right;\"/><Cell col=\"14\" style=\"align:right;\"/><Cell col=\"15\" style=\"align:right;\"/><Cell col=\"16\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;regiNm&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"17\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;monAmt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"18\" style=\"align:right;\"/><Cell col=\"19\" style=\"align:right;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "65", "169", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("메인 LIST");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "49", "1147", "20", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "79", "1147", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 49, this.div_search,
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
            		p.set_classname("RTSDSellersResult");
            		p.set_titletext("판매인실적조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDOrdAgentResult.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDOrdAgentResult.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.toDay = "";													//현재날짜
        this.p_arg = "RTSDOrdAgentResult";
        this.userGrp = application.gds_userInfo.getColumn(0,"userGrp");	//01 : 영업관리자//02 : 콜센터//03 : 지사//04 : 지점	//05 : 대리점
        this.userId  = application.gds_userInfo.getColumn(0,"userId");	
        this.userNm  = application.gds_userInfo.getColumn(0,"userNm");
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if (nErrorCode < 0) {
        		alert(strErrorMsg);		
        		return;
        	}
        	
        	if( strSvcId == "getToday" ){
        		if( this.toDay != "" ){
        			var firstDate =  Eco.date.getFirstDate(this.toDay);
        			
        			this.div_search.cal_procDayS.set_value(firstDate);
        			this.div_search.cal_procDayE.set_value(this.toDay);
        		}
        	}
        	
        	if( strSvcId == "selectOrdAgentList" ){
        		var rowCt = this.ds_ordAgentList.getRowCount();
        		if( rowCt == 0 ){
        			alert("조회된 데이터가 없습니다.");
        			this.grid_ordAgent.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTSDSellersResult_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.fn_init();
        	this.parent.setButton("E|S", this);
        	
        	if(this.userGrp != "01" && this.userGrp != "02" && this.userGrp != "RM") {
        		this.div_search.bt_ordAgent.set_enable(false);
        		this.div_search.ed_ordAgentCd.set_value(this.userId);
        		this.div_search.ed_ordAgentNm.set_value(this.userNm);
        	}
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	var sSvcID      	= "getToday";  
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_cal_procDayS_onchanged = function(obj,e){
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_procDayE_onchanged = function(obj,e){
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_ordAgentCd_cancharchange = function(obj,e){
        	this.div_search.ed_ordAgentNm.set_value("");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_ordAgent_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"판매인 조회","comm::RTCOMMOrdAgentList_pop.xfdl",args, "modaless=false");
        }
        this.FN_sellers = function(res){
        	this.div_search.ed_ordAgentCd.set_value(res[0]);
        	this.div_search.ed_ordAgentNm.set_value(res[1]);
        } 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	var ordAgent 	= nvl(this.div_search.ed_ordAgentCd.value);
        	var procDayS 	= nvl(this.div_search.cal_procDayS.value);
        	var procDayE 	= nvl(this.div_search.cal_procDayE.value);
        	var userId      = application.gds_userInfo.getColumn(0, "userId"); //사용자ID
        	
        	if( procDayS > procDayE){
        		alert("장착일자를 다시 확인하세요.");
        		this.div_search.ed_procDayE.setFocus(true);
        		return false;
        	}else{
        		var sSvcID        	= "selectOrdAgentList";                    
        		var sController   	= "rtms/sd/selectOrdAgentList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_ordAgentList=selectOrdAgentListMap";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += Ex.util.setParam("ordAgent",  	ordAgent);
        		sArgs += Ex.util.setParam("procDayS",  	procDayS);
        		sArgs += Ex.util.setParam("procDayE",  	procDayE);
        		sArgs += Ex.util.setParam("userId", userId);
        		this.ds_ordAgentList.clearData();
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel= function(){
        	Ex.core.exportExcel(this, this.grid_ordAgent);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDSellersResult_onload, this);
            this.div_search.ed_ordAgentCd.addEventHandler("cancharchange", this.div_search_ed_ordAgentCd_cancharchange, this);
            this.div_search.bt_ordAgent.addEventHandler("onclick", this.div_search_bt_ordAgent_onclick, this);
            this.div_search.cal_procDayE.addEventHandler("onchanged", this.div_search_ed_procDayE_onchanged, this);
            this.div_search.cal_procDayS.addEventHandler("onchanged", this.div_search_cal_procDayS_onchanged, this);

        };

        this.loadIncludeScript("RTSDOrdAgentResult.xfdl");

       
    };
}
)();

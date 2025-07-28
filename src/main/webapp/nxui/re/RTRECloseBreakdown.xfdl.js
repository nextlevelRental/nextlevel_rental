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
                this.set_name("RTRECloseBreakdown");
                this.set_classname("RTREFinishBreakdown");
                this.set_titletext("마감 내역 조회");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_closeList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"closeYm\" type=\"STRING\" size=\"256\"/><Column id=\"closeTp\" type=\"STRING\" size=\"256\"/><Column id=\"closeTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"clsDetail\" type=\"STRING\" size=\"256\"/><Column id=\"clsDetailNm\" type=\"STRING\" size=\"256\"/><Column id=\"closeCnt\" type=\"STRING\" size=\"256\"/><Column id=\"closeAmt\" type=\"BIGDECIMAL\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_closeTp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("0");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "486", null, null, this);
            obj.set_taborder("1");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "60", "1122", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("3");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1112", "49", null, null, this);
            obj.set_taborder("4");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_closeTp", "absolute", "294", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("105");
            obj.set_text("마감항목");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_closeTp", "absolute", "399", "12", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("106");
            obj.set_displaynulltext("전체");
            obj.set_innerdataset("@ds_closeTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_date", "absolute", "20", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("110");
            obj.set_text("기준년월");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "0", "1108", "12", null, null, this.div_search);
            obj.set_taborder("112");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("114");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "105", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("115");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "273", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("116");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "379", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("117");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "539", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("118");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "33", "1108", "12", null, null, this.div_search);
            obj.set_taborder("119");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edtYear", "absolute", "124", "12", "60", "21", null, null, this.div_search);
            obj.set_taborder("120");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_autoskip("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition06", "absolute", "188", "12", "20", "20", null, null, this.div_search);
            obj.set_taborder("121");
            obj.set_text("년");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edtMonth", "absolute", "214", "12", "40", "21", null, null, this.div_search);
            obj.set_taborder("122");
            obj.set_inputtype("digit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("2");
            obj.set_autoskip("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition07", "absolute", "258", "12", "20", "20", null, null, this.div_search);
            obj.set_taborder("123");
            obj.set_text("월");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "80", "120", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_closeList", "absolute", "9", "110", "1113", "386", null, null, this);
            obj.set_taborder("6");
            obj.set_binddataset("ds_closeList");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"220\"/><Column size=\"220\"/><Column size=\"220\"/><Column size=\"220\"/><Column size=\"218\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"대상년월\"/><Cell col=\"1\" text=\"마감항목\"/><Cell col=\"2\" text=\"마감세부항목\"/><Cell col=\"3\" text=\"건수\"/><Cell col=\"4\" displaytype=\"number\" text=\"금액\"/></Band><Band id=\"body\"><Cell text=\"bind:closeYm\"/><Cell col=\"1\" text=\"bind:closeTpNm\"/><Cell col=\"2\" text=\"bind:clsDetailNm\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right;\" text=\"bind:closeCnt\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;\" text=\"bind:closeAmt\" mask=\"###,###,###,##0\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\" style=\"align:right;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;closeAmt&quot;)\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "100", "1122", "10", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1112, 49, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("4");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTREFinishBreakdown");
            		p.set_titletext("마감 내역 조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item16","div_search.edtYear","value","ds_chgInfo","expireY");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","div_search.edtMonth","value","ds_chgInfo","expireM");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRECloseBreakdown.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRECloseBreakdown.xfdl", function() {
        	//include "lib::comLib.xjs";

        	this.p_arg = "RTREFinishBreakdown";
        	this.toDay		= ""; 	//당일
        	this.yesterDay	= ""; 	//전일
        	this.curMonth 	= "";	//당월	
        	this.prevMonth	= ""; 	//전월
        	this.nextMonth	= ""; 	//익월
        	this.closeYm	= "";
        	
        	
        	
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        		if( strSvcId == "initRTRECloseBreakdown" ){
        			var rowCtItem = this.ds_closeTp.rowcount;
        			if( rowCtItem != 0 ){
        				var insert = this.ds_closeTp.insertRow( 0 );
        				this.ds_closeTp.setColumn(insert,"cd"," ");
        				this.ds_closeTp.setColumn(insert,"cdNm","전체");
        				this.div_search.cb_closeTp.set_value( " " );
        			}
        		}
        		
        		if( strSvcId == "getDayMongth" ){
        			this.div_search.edtYear.set_value(this.curMonth.substr(0,4));
        			this.div_search.edtMonth.set_value(this.curMonth.substr(4,2));
        			this.closeYm = this.curMonth;
        		}
        		
        		if( strSvcId == "rTRECloseBreakdownList" ){
        			var rowCt = this.ds_closeList.getRowCount();
        			if( rowCt == 0 ){
        				alert("조회된 데이터가 없습니다.");
        				this.grid_closeList.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        		}
        	}
        	
        	
        	
        	this.RTRECloseBreakdown_onload = function(obj,e)
        	{
        		Ex.core.init(obj);
        		this.fn_init(); 
        		this.parent.setButton("E|S", this);
        	}

        

        	this.fn_init = function(){
        		var sSvcID      	= "initRTRECloseBreakdown";  
        		var sController   	= "rtms/re/initRTRECloseBreakdown.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sOutDatasets += " ds_closeTp=mapDsCloseTp ";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		
        		var sSvcID      	= "getDayMongth";  
        		var sController   	= "ntrms/re/getDayMongth.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        	
        	
        	
        	this.cal_accReqDate_onchanged = function(obj,e){
        		if(nvl(this.div_search.edtMonth.value) != "" && obj.getLength() == 1) {
        			if(parseInt(this.div_search.edtMonth.value,10) < 10) {
        				this.div_search.edtMonth.set_value("0" + obj.value);
        			}
        		}	
        		
        		this.closeYm = nvl(this.div_search.edtYear.value) + "" + nvl(this.div_search.edtMonth.value);

        		if(this.closeYm != "") {
        			if(this.closeYm.length == 6) {
        				if(!this.fn_chkYm(this.div_search.edtYear.value, this.div_search.edtMonth.value)){
        					return;
        				}else {
        				}
        			}else {
        				var nYear = nvl(this.div_search.edtYear.value);
        				var nMonth = nvl(this.div_search.edtMonth.value);
        				if(nYear.length < 4) {
        					alert('마감월을 입력하세요.');
        					this.div_search.edtYear.setFocus();
        					return false;
        				}
        				if(nMonth.length < 2) {
        					alert('마감월을 입력하세요.');
        					this.div_search.edtMonth.setFocus();
        					return false;
        				}				
        			}
        		}
        	}
        	
        	
        	
        	this.fn_chkYm = function(nYear,nMonth){
        		if(nYear.length < 4) {
        			alert('기준년을 입력하세요.');
        			this.div_search.edtYear.setFocus();
        			return false;
        		}
        		if(nMonth.length < 2) {
        			alert('기준월을 입력하세요.');
        			this.div_search.edtMonth.setFocus();
        			return false;
        		}	
        		    
        		if (nYear < 1900 || nYear > 3000)   
        		{ 
        			this.alert("사용할수 없는 기준월이 입력되었습니다.");
        			this.div_search.edtYear.setFocus();			
        			return false;
        		}   
        	  
        		if (nMonth < 1 || nMonth > 12)   
        		{  
        			this.alert("사용할수 없는 기준월이 입력되었습니다.");
        			this.div_search.edtMonth.setFocus();			
        			return false;		
        		}  
        		
        		var yyyymm = nYear + "" + nMonth;
        		
        		if(parseInt(yyyymm,10) > parseInt(this.curMonth,10)) {
        			alert("현재이후년월로 조회할 수 없습니다.");
        			this.div_search.edtYear.setFocus(true);
        			return false;
        		}
        		return true;
            }
            
            
            
        	this.fn_search = function(){
        		var closeTp     = nvl(this.div_search.cb_closeTp.value);
        		
        		var sSvcID        	= "rTRECloseBreakdownList";                    
        		var sController   	= "rtms/re/rTRECloseBreakdownList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_closeList=closeListMap";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		this.ds_closeList.deleteAll();
        		
        		sArgs += Ex.util.setParam("closeYm"	,this.closeYm);
        		sArgs += Ex.util.setParam("closeTp"	,closeTp);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	
        	
        	this.fn_excel = function(){
        		Ex.core.exportExcel(this, this.grid_closeList);
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTRECloseBreakdown_onload, this);
            this.div_search.edtYear.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);
            this.div_search.edtMonth.addEventHandler("onchanged", this.cal_accReqDate_onchanged, this);

        };

        this.loadIncludeScript("RTRECloseBreakdown.xfdl");

       
    };
}
)();

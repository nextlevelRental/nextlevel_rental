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
                this.set_name("RTSDOrderMonthAnalysis");
                this.set_classname("RTSDOrderMonthAnalysis");
                this.set_titletext("월간 계약 현황");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_timGb", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_chanCd", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_disGb", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_valGb", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_resultList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"dt\" type=\"STRING\" size=\"256\"/><Column id=\"mon\" type=\"INT\" size=\"256\"/><Column id=\"tue\" type=\"INT\" size=\"256\"/><Column id=\"wed\" type=\"INT\" size=\"256\"/><Column id=\"thu\" type=\"INT\" size=\"256\"/><Column id=\"fri\" type=\"INT\" size=\"256\"/><Column id=\"sat\" type=\"INT\" size=\"256\"/><Column id=\"sun\" type=\"INT\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1122", "77", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1118", "10", null, null, this.div_search);
            obj.set_taborder("42");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "0", "31", "1117", "10", null, null, this.div_search);
            obj.set_taborder("43");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_day", "absolute", "25", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("44");
            obj.set_text("기간지정");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_fDay", "absolute", "105", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("45");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static03", "absolute", "253", "10", "9", "21", null, null, this.div_search);
            obj.set_taborder("46");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_eDay", "absolute", "270", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("47");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static08", "absolute", "0", "0", "25", "73", null, null, this.div_search);
            obj.set_taborder("48");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "410", "0", "25", "73", null, null, this.div_search);
            obj.set_taborder("49");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_disGb", "absolute", "435", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("50");
            obj.set_text("시간단위");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "655", "0", "25", "73", null, null, this.div_search);
            obj.set_taborder("52");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_valGb", "absolute", "680", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("53");
            obj.set_text("구분");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_timGb", "absolute", "515", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("54");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_timGb");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new ExtCombo("cb_chanCd", "absolute", "760", "10", "340", "21", null, null, this.div_search);
            obj.set_taborder("56");
            obj.set__select_type("select");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_disGb00", "absolute", "25", "41", "80", "21", null, null, this.div_search);
            obj.set_taborder("57");
            obj.set_text("조건1");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Radio("ra_disGb", "absolute", "105", "41", "180", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("58");
            obj.set_innerdataset("ds_disGb");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_direction("vertical");
            obj = new Static("st_valGb00", "absolute", "435", "41", "80", "21", null, null, this.div_search);
            obj.set_taborder("59");
            obj.set_text("조건2");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Radio("ra_valGb", "absolute", "515", "41", "180", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("60");
            obj.set_innerdataset("@ds_valGb");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_direction("vertical");
            obj = new Static("Static02", "absolute", "1", "63", "1117", "10", null, null, this.div_search);
            obj.set_taborder("61");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grid_resultList", "absolute", "0", "80", "1122", "416", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_resultList");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell style=\"background:#5a1166ff;background2:#5a1166ff;color:aliceblue;color2:aliceblue;font:9 bold 12 arial;\" text=\"시간대\"/><Cell col=\"1\" style=\"background:#5a1166ff;background2:#5a1166ff;color:aliceblue;color2:aliceblue;font:9 bold 12 arial;\" text=\"월\"/><Cell col=\"2\" style=\"background:#5a1166ff;background2:#5a1166ff;color:aliceblue;color2:aliceblue;font:9 bold 12 arial;\" text=\"화\"/><Cell col=\"3\" style=\"background:#5a1166ff;background2:#5a1166ff;color:aliceblue;color2:aliceblue;font:9 bold 12 arial;\" text=\"수\"/><Cell col=\"4\" style=\"background:#5a1166ff;background2:#5a1166ff;color:aliceblue;color2:aliceblue;font:9 bold 12 arial;\" text=\"목\"/><Cell col=\"5\" style=\"background:#5a1166ff;background2:#5a1166ff;color:aliceblue;color2:aliceblue;font:9 bold 12 arial;\" text=\"금\"/><Cell col=\"6\" style=\"background:#5a1166ff;background2:#5a1166ff;color:aliceblue;color2:aliceblue;font:9 bold 12 arial;\" text=\"토\"/><Cell col=\"7\" style=\"background:#5a1166ff;background2:#5a1166ff;color:aliceblue;color2:aliceblue;font:9 bold 12 arial;\" text=\"일\"/></Band><Band id=\"body\"><Cell style=\"background:#5a1166ff;background2:#5a1166ff;color:aliceblue;color2:aliceblue;font:9 bold 12 arial;\" text=\"bind:dt\"/><Cell col=\"1\" text=\"bind:mon\"/><Cell col=\"2\" text=\"bind:tue\"/><Cell col=\"3\" text=\"bind:wed\"/><Cell col=\"4\" text=\"bind:thu\"/><Cell col=\"5\" text=\"bind:fri\"/><Cell col=\"6\" text=\"bind:sat\"/><Cell col=\"7\" text=\"bind:sun\"/></Band><Band id=\"summary\"><Cell text=\"합계\"/><Cell col=\"1\" style=\"align:right;\" text=\"expr:dataset.getSum(&quot;mon&quot;)+&quot;(건)&quot;\"/><Cell col=\"2\" style=\"align:right;\" text=\"expr:dataset.getSum(&quot;tue&quot;)+&quot;(건)&quot;\"/><Cell col=\"3\" style=\"align:right;\" text=\"expr:dataset.getSum(&quot;wed&quot;)+&quot;(건)&quot;\"/><Cell col=\"4\" style=\"align:right;\" text=\"expr:dataset.getSum(&quot;thu&quot;)+&quot;(건)&quot;\"/><Cell col=\"5\" style=\"align:right;\" text=\"expr:dataset.getSum(&quot;fri&quot;)+&quot;(건)&quot;\"/><Cell col=\"6\" style=\"align:right;\" text=\"expr:dataset.getSum(&quot;sat&quot;)+&quot;(건)&quot;\"/><Cell col=\"7\" style=\"align:right;\" text=\"expr:dataset.getSum(&quot;sun&quot;)+&quot;(건)&quot;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", null, null, "0", this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 77, this.div_search,
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
            		p.set_classname("RTSDOrderMonthAnalysis");
            		p.set_titletext("월간 계약 현황");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDOrderMonthAnalysis.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDOrderMonthAnalysis.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.toDay = "";
        this.p_arg = "RTSDOrderMonthAnalysis";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "initRTSDOrderMonthAnalysis" ){
        		var timGbCnt = this.ds_timGb.getRowCount();
        		if( timGbCnt != 0 ){
        			this.div_search.cb_timGb.set_value( "1" );
        		}
        		
        		var chanCdCnt = this.ds_chanCd.getRowCount();
        		if( chanCdCnt != 0 ){
        			this.div_search.cb_chanCd.setInnerDataset(this.ds_chanCd,"cd","cdNm")
        		}
        		
        		var disCnt = this.ds_disGb.getRowCount()
        		if( disCnt != 0 ){
        			this.div_search.ra_disGb.set_value("1");
        		}
        		
        		var valGb = this.ds_valGb.getRowCount();
        		if( valGb != 0 ){
        			this.div_search.ra_valGb.set_value("1");
        		}
        	}
        	
        	if( strSvcId == "getToday" ){
        		this.div_search.cal_fDay.set_value( Eco.date.getFirstDate(this.toDay) );
        		this.div_search.cal_eDay.set_value( this.toDay );
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTSDOrderMonthAnalysis_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	this.parent.setButton("E|S",this);
        }
        this.fn_init = function(){
        	var sSvcID      	= "initRTSDOrderMonthAnalysis";  
        	var sController   	= "rtms/sd/initRTSDOrderMonthAnalysis.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";	 
        	sOutDatasets += " ds_timGb=mapDsTimGb ";
        	sOutDatasets += " ds_chanCd=mapDsChanCd ";
        	sOutDatasets += " ds_disGb=mapDsDisGb ";
        	sOutDatasets += " ds_valGb=mapDsValGb ";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
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
        	

        	var fDay 	= nvl(this.div_search.cal_fDay.value);
        	var eDay 	= nvl(this.div_search.cal_eDay.value);
        	var disGb 	= nvl(this.div_search.ra_disGb.value);
        	var valGb 	= nvl(this.div_search.ra_valGb.value);
        	var chanCd = nvl(this.div_search.cb_chanCd.getValue());
        	var count = 0;
        	do{
        		if( chanCd.indexOf(",") < 0 ) break;
        		else chanCd = chanCd.replace(",","|");
        		count++;
        	}while( count <= count);
        	var timGb 	= nvl(this.div_search.cb_timGb.value);
        	var msg  	= " 값이 없습니다.";
        	if( fDay == "" ){
        		alert("기준일자"+msg);
        	}else if( eDay == "" ){
        		alert("기준일자"+msg);
        	}else if( fDay > eDay ){
        		alert("기준일자를 확인하세요.");
        	}else if( timGb == "" ){
        		alert("시간단위"+msg);
        	}else if( chanCd == "" ){
        		alert("채널"+msg);
        	}else if( disGb == "" ){
        		alert("조건1"+msg);
        	}else if( valGb == "" ){
        		alert("조건2"+msg);
        	}else{
        		this.ds_resultList.clearData();
        		var sSvcID      	= "selectRTSDOrderMonthAnalysis";  
        		var sController   	= "rtms/sd/selectRTSDOrderMonthAnalysis.do";
        		var sInDatasets   	= "";
        		var sOutDatasets	= ""
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sOutDatasets += " ds_resultList=resultList "
        		sArgs += Ex.util.setParam("fDay",  fDay);
        		sArgs += Ex.util.setParam("eDay",  eDay);
        		sArgs += Ex.util.setParam("disGb", disGb);
        		sArgs += Ex.util.setParam("valGb", valGb);
        		sArgs += Ex.util.setParam("timGb", timGb);
        		sArgs += Ex.util.setParam("chanCd", chanCd);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel = function(){
        	Ex.core.exportExcel(this, this.grid_resultList);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDOrderMonthAnalysis_onload, this);

        };

        this.loadIncludeScript("RTSDOrderMonthAnalysis.xfdl");

       
    };
}
)();

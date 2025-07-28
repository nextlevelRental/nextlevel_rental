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
                this.set_name("RTSDRendalAnalysisStatus");
                this.set_classname("RendalAnalysisStatus");
                this.set_titletext("렌탈분석현황");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_rASMenu", this);
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

            obj = new Dataset("ds_resultCursor01", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"groupCd\" type=\"STRING\" size=\"256\"/><Column id=\"groupNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"INT\" size=\"256\"/><Column id=\"ratio\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_resultCursor02", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"groupCd\" type=\"STRING\" size=\"256\"/><Column id=\"groupNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"INT\" size=\"256\"/><Column id=\"ratio\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_resultCursor03", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"groupCd\" type=\"STRING\" size=\"256\"/><Column id=\"groupNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"INT\" size=\"256\"/><Column id=\"ratio\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_resultCursor04", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"groupCd\" type=\"STRING\" size=\"256\"/><Column id=\"groupNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"INT\" size=\"256\"/><Column id=\"ratio\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_resultCursor05", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"groupCd\" type=\"STRING\" size=\"256\"/><Column id=\"groupNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"INT\" size=\"256\"/><Column id=\"ratio\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_resultCursor06", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"groupCd\" type=\"STRING\" size=\"256\"/><Column id=\"groupNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"INT\" size=\"256\"/><Column id=\"ratio\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_resultCursor07", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"groupCd\" type=\"STRING\" size=\"256\"/><Column id=\"groupNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"INT\" size=\"256\"/><Column id=\"ratio\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_resultCursor08", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"groupCd\" type=\"STRING\" size=\"256\"/><Column id=\"groupNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"INT\" size=\"256\"/><Column id=\"ratio\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_resultCursor09", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"groupCd\" type=\"STRING\" size=\"256\"/><Column id=\"groupNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"INT\" size=\"256\"/><Column id=\"ratio\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_resultCursor10", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ym\" type=\"STRING\" size=\"256\"/><Column id=\"joinCnt\" type=\"INT\" size=\"256\"/><Column id=\"leaveCnt\" type=\"INT\" size=\"256\"/><Column id=\"accrueCnt\" type=\"INT\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("st_BG", "absolute", "10", "0", null, "40", "-10", null, this);
            obj.set_taborder("4");
            obj.set_cssclass("sta_WF_SearchBox");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("5");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1118", "10", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "31", "1117", "10", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_day", "absolute", "25", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_text("기준일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_fDay", "absolute", "105", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("32");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static03", "absolute", "253", "10", "9", "21", null, null, this.div_search);
            obj.set_taborder("33");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_eDay", "absolute", "270", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("34");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static08", "absolute", "0", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("35");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "410", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("36");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_disGb", "absolute", "435", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("37");
            obj.set_text("조건1");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Radio("ra_disGb", "absolute", "513", "12", "180", "18", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("38");
            obj.set_direction("vertical");
            obj.set_innerdataset("@ds_disGb");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Static("Static01", "absolute", "693", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("39");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_valGb", "absolute", "718", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("40");
            obj.set_text("조건2");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Radio("ra_valGb", "absolute", "796", "12", "180", "18", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("41");
            obj.set_direction("vertical");
            obj.set_innerdataset("@ds_valGb");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Static("Static21", "absolute", "0", "55", "81", "20", null, null, this);
            obj.set_taborder("6");
            obj.set_text("분석지표");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", null, null, "0", this);
            obj.set_taborder("9");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_rasMenu", "absolute", "0", "80", "200", "413", null, null, this);
            obj.set_taborder("23");
            obj.set_binddataset("ds_rASMenu");
            obj.style.set_treeitemimage("URL('theme://images/ico_treeitem.png')");
            obj.style.set_cursor("pointer");
            obj.set_treeuseexpandkey("false");
            obj.set_treeusebutton("use");
            obj.set_treeusecheckbox("false");
            obj.set_autosizingtype("none");
            obj.set_autoupdatetype("none");
            obj.set_autosizebandtype("body");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/></Columns><Rows><Row size=\"41\"/></Rows><Band id=\"body\"><Cell displaytype=\"tree\" edittype=\"tree\" text=\"bind:cdNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "45", "1147", "15", null, null, this);
            obj.set_taborder("24");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "70", "1147", "10", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "200", "45", "25", null, null, "0", this);
            obj.set_taborder("26");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_resultCursor", "absolute", "225", "80", "300", "415", null, null, this);
            obj.set_taborder("27");
            obj.set_binddataset("ds_resultCursor01");
            obj.set_autosizingtype("col");
            obj.set_cellsizingtype("none");
            obj.set_autosizebandtype("body");
            obj.set_autofittype("col");
            obj.set_extendsizetype("none");
            obj.set_selecttype("row");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"구분\"/><Cell col=\"1\" text=\"수량\"/><Cell col=\"2\" text=\"비중\"/></Band><Band id=\"body\"><Cell text=\"bind:groupNm\"/><Cell col=\"1\" text=\"bind:cnt\"/><Cell col=\"2\" text=\"bind:ratio\"/></Band><Band id=\"summary\"><Cell text=\"합계\"/><Cell col=\"1\" style=\"align:right;\" text=\"expr:dataset.getSum(&quot;cnt&quot;)+&quot;(건)&quot;\"/><Cell col=\"2\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "525", "45", "10", null, null, "0", this);
            obj.set_taborder("29");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "535", "80", "587", "415", null, null, this);
            obj.set_taborder("30");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new EcoChart("ecochart", "absolute", "535", "80", "587", "415", null, null, this);
            obj.style.set_background("#ffffffff");
            obj.style.set_border("0 solid #808080ff");
            obj.style.set_bordertype("round 15 15");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_resultCursor10", "absolute", "225", "80", "500", "415", null, null, this);
            obj.set_taborder("31");
            obj.set_binddataset("ds_resultCursor10");
            obj.set_autosizingtype("col");
            obj.set_autoupdatetype("none");
            obj.set_autosizebandtype("body");
            obj.set_cellmovingtype("none");
            obj.set_cellsizingtype("none");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"월\"/><Cell col=\"1\" text=\"가입계정수\"/><Cell col=\"2\" text=\"이탈계정수\"/><Cell col=\"3\" text=\"누적계정수\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" text=\"bind:ym\" expr=\"expr:nvl(ym) != &quot;&quot; ? ym.substr(0,4)+&quot;-&quot;+ym.substr(4,2) : &quot;&quot;\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" displaytype=\"number\" style=\"align:right;\" text=\"bind:joinCnt\" mask=\"###,###,###,##0\"/><Cell col=\"2\" displaytype=\"number\" style=\"align:right;\" text=\"bind:leaveCnt\" mask=\"###,###,###,##0\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right;\" text=\"bind:accrueCnt\" mask=\"###,###,###,##0\"/></Band><Band id=\"summary\"><Cell text=\"합계\"/><Cell col=\"1\" text=\"expr:dataset.getSum(&quot;joinCnt&quot;)+&quot;(건)&quot;\"/><Cell col=\"2\" text=\"expr:dataset.getSum(&quot;leaveCnt&quot;)+&quot;(건)&quot;\"/><Cell col=\"3\" text=\"expr:dataset.getSum(&quot;accrueCnt&quot;)+&quot;(건)&quot;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("5");
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
            		p.set_classname("RendalAnalysisStatus");
            		p.set_titletext("렌탈분석현황");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDRendalAnalysisStatus.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDRendalAnalysisStatus.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.toDay 		= "";
        this.oldFDay	= "";
        this.p_arg		= "RendalAnalysisStatus";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "initRTSDRendalAnalysisStatus" ){
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
        	
        	if( strSvcId == "selectRTSDRendalAnalysisStatus" ){
        		this.oldFDay	= nvl(this.div_search.cal_fDay.value);
        		var rowCt 		= this.ds_resultCursor01.getRowCount();
        		var menuCt		= this.ds_rASMenu.getRowCount();
        		if( rowCt == 0 ){
        			this.grid_resultCursor.set_nodatatext("조회된 데이터가 없습니다.");
        			this.ds_rASMenu.set_rowposition(menuCt-1);
        		}else{
        			this.ecochart.set_visible(true); 
        		}
        		this.grid_rasMenu_onselectchanged();
        	}
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RendalAnalysisStatus_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	this.parent.setButton("E|S",this);
        }
        this.fn_init = function(){
        	var sSvcID      	= "initRTSDRendalAnalysisStatus";  
        	var sController   	= "rtms/sd/initRTSDRendalAnalysisStatus.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";	 
        	sOutDatasets += " ds_rASMenu=mapDsRASMenu ";
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
        	var msg  	= " 값이 없습니다.";
        	if( fDay == "" ){
        		alert("기준일자"+msg);
        	}else if( eDay == "" ){
        		alert("기준일자"+msg);
        	}else if( fDay > eDay ){
        		alert("기준일자를 확인하세요.");
        	}else if( disGb == "" ){
        		alert("조건1"+msg);
        	}else if( valGb == "" ){
        		alert("조건2"+msg);
        	}else{
        		this.ds_resultCursor01.clearData();
        		this.ds_resultCursor02.clearData();
        		this.ds_resultCursor03.clearData();
        		this.ds_resultCursor04.clearData();
        		this.ds_resultCursor05.clearData();
        		this.ds_resultCursor06.clearData();
        		this.ds_resultCursor07.clearData();
        		this.ds_resultCursor08.clearData();
        		this.ds_resultCursor09.clearData();
        		this.ds_resultCursor10.clearData();
        		var sSvcID      	= "selectRTSDRendalAnalysisStatus";  
        		var sController   	= "rtms/sd/selectRTSDRendalAnalysisStatus.do";
        		var sInDatasets   	= "";
        		var sOutDatasets	= "";
        		var sArgs 			= "";
        		var fn_callBack		= "fn_callBack";
        		sOutDatasets += " ds_resultCursor01=refCursor01Map "//◀01.연령별
        		sOutDatasets += " ds_resultCursor02=refCursor02Map "//◀02.성별
        		sOutDatasets += " ds_resultCursor03=refCursor03Map "//◀03.대리점 지역별
        		sOutDatasets += " ds_resultCursor04=refCursor04Map "//◀04.계약기간별
        		sOutDatasets += " ds_resultCursor05=refCursor05Map "//◀05.on/off별
        		sOutDatasets += " ds_resultCursor06=refCursor06Map "//◀06.채널별
        		sOutDatasets += " ds_resultCursor07=refCursor07Map "//◀07.패턴별
        		sOutDatasets += " ds_resultCursor08=refCursor08Map "//◀08.인치별
        		sOutDatasets += " ds_resultCursor09=refCursor09Map "//◀09.교체유입 제조사
        		sOutDatasets += " ds_resultCursor10=refCursor10Map "//◀10.누적 고객 현황 (미정의상태 -> 우선 교체유입제조사로 임시 사용)
        		sArgs += Ex.util.setParam("fDay",  fDay);
        		sArgs += Ex.util.setParam("eDay",  eDay);
        		sArgs += Ex.util.setParam("disGb", disGb);
        		sArgs += Ex.util.setParam("valGb", valGb);
        		sArgs += Ex.util.setParam("fDayOuter",  "20150904");
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel = function(){
        	Ex.core.exportExcel(this, this.fn_excel_grid());
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel_grid = function(){
        	var nRow 	= this.ds_rASMenu.rowposition;
        	var cd		= nvl(this.ds_rASMenu.getColumn(nRow, "cd"));
        	switch( cd ){
        		case "010" : return this.grid_resultCursor10; break;
        		default : return this.grid_resultCursor; break;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_rasMenu_onselectchanged = function(obj,e){
        	var nRow 	= this.ds_rASMenu.rowposition;
        	var cd		= nvl(this.ds_rASMenu.getColumn(nRow, "cd"));
        	var headNm	= nvl(this.ds_rASMenu.getColumn(this.ds_rASMenu.rowposition, "cdNm"));
        	switch( cd ){
        		case "001" : this.grid_resultCursor.setBindDataset( this.ds_resultCursor01 ); this.grid_resultCursor.setCellProperty( "Head", 0, "text", headNm ); this.drawChart( this.ds_resultCursor01 ); this.FN_changeA(); break;
        		case "002" : this.grid_resultCursor.setBindDataset( this.ds_resultCursor02 ); this.grid_resultCursor.setCellProperty( "Head", 0, "text", headNm ); this.drawChart( this.ds_resultCursor02 ); this.FN_changeA(); break;
        		case "003" : this.grid_resultCursor.setBindDataset( this.ds_resultCursor03 ); this.grid_resultCursor.setCellProperty( "Head", 0, "text", headNm ); this.drawChart( this.ds_resultCursor03 ); this.FN_changeA(); break;
        		case "004" : this.grid_resultCursor.setBindDataset( this.ds_resultCursor04 ); this.grid_resultCursor.setCellProperty( "Head", 0, "text", headNm ); this.drawChart( this.ds_resultCursor04 ); this.FN_changeA(); break;
        		case "005" : this.grid_resultCursor.setBindDataset( this.ds_resultCursor05 ); this.grid_resultCursor.setCellProperty( "Head", 0, "text", headNm ); this.drawChart( this.ds_resultCursor05 ); this.FN_changeA(); break;
        		case "006" : this.grid_resultCursor.setBindDataset( this.ds_resultCursor06 ); this.grid_resultCursor.setCellProperty( "Head", 0, "text", headNm ); this.drawChart( this.ds_resultCursor06 ); this.FN_changeA(); break;
        		case "007" : this.grid_resultCursor.setBindDataset( this.ds_resultCursor07 ); this.grid_resultCursor.setCellProperty( "Head", 0, "text", headNm ); this.drawChart( this.ds_resultCursor07 ); this.FN_changeA(); break;
        		case "008" : this.grid_resultCursor.setBindDataset( this.ds_resultCursor08 ); this.grid_resultCursor.setCellProperty( "Head", 0, "text", headNm ); this.drawChart( this.ds_resultCursor08 ); this.FN_changeA(); break;
        		case "009" : this.grid_resultCursor.setBindDataset( this.ds_resultCursor09 ); this.grid_resultCursor.setCellProperty( "Head", 0, "text", headNm ); this.drawChart( this.ds_resultCursor09 ); this.FN_changeA(); break;
        		case "010" : this.grid_resultCursor.setBindDataset( this.ds_resultCursor10 ); this.grid_resultCursor.setCellProperty( "Head", 0, "text", headNm ); this.drawChart( this.ds_resultCursor10 ); this.FN_changeB(); break;
        		default	   :  this.grid_resultCursor.setBindDataset( "" ); 					  this.grid_resultCursor.setCellProperty( "Head", 0, "text", "" );												 this.FN_changeA(); break;
        	}
        }
        this.FN_changeA = function(){
        	this.grid_resultCursor.set_visible(true);
        	this.ecochart.set_visible(true);
        	this.Static07.set_visible(true);
        	this.grid_resultCursor10.set_visible(false);
        	
        	this.div_search.cal_fDay.set_enable(true);
        	this.div_search.ra_disGb.set_enable(true);
        	this.div_search.ra_valGb.set_enable(true);
        	if( this.oldFDay != "" ){
        		this.div_search.cal_fDay.set_value( this.oldFDay );
        	}else{
        		this.div_search.cal_fDay.set_value( Eco.date.getFirstDate(this.toDay) );
        	}
        	//this.div_search.cal_eDay.set_value( this.toDay );
        }
        this.FN_changeB = function(){
        this.grid_resultCursor.set_visible(false);
        	this.ecochart.set_visible(false);
        	this.Static07.set_visible(false);
        	this.grid_resultCursor10.set_visible(true);
        	
        	this.div_search.cal_fDay.set_enable(false);
        	this.div_search.ra_disGb.set_enable(false);
        	this.div_search.ra_valGb.set_enable(false);
        	this.div_search.ra_disGb.set_value( "1" );
        	this.div_search.ra_valGb.set_value( "1" );
        	this.div_search.cal_fDay.set_value( "20150904" );
        	//this.div_search.cal_eDay.set_value( this.toDay );
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //var chart = true;
        this.drawChart = function(dataSet){
        	this.ecochart.removeChart()
        	//if(!chart){
        		var config = {
        			"type": "Pie",
        			"chart": {
        				"id": "donut chart",
        				"bindDataset": dataSet,
        				"bindCategory": "groupNm",
        				"bindValue": "ratio",
        				"colors": "excelColor001",
        				"plotBackgroundColor": "#FFFFFF",
        				"plotBackgroundOpacity": 0.2,
        				"radius": 0.7,
        				"innerRadius": 0.3,
        				"tilt": 0.7,
        				"labelFontSize": 8,
        				"labelRadius": 0.8,
        				"labelColor": "gray",
        				"labelWordwrap": "true",
        				"labelFontType": "bold",
        				"showHighLight": true,
        				"highLightOpacity": 0.6,
        				"highLightRadius": 0.8,
        				"margin": "0"
        			},
        			"legend": {
        				"position": "bottom",
        				"valign": "bottom",
        				"autoMargins": false,
        				"marginTop": "0",
        				"marginLeft": "0",
        				"marginRight": "0",
        				"markerType": "circle",
        				"markerSize": 12,
        				"switchable": false,
        				"useMarkerColorForLabels": false,
        				"equalItemWidths": true,
        				"columns": "5",
        				"align": "center",
        				"marginBottom": "10",
        				"labelFontFace": "Meriyo UI",
        				"labelFontType": "normal"
        			},
        			"tooltip": {
        				"text": "[%x] : [%y]% ",
        				"fontSize": 8
        			}
        		};
        	this.ecochart.set_config(config);
        	//}
        	chart = this.ecochart.getChart();
        	this.ecochart.draw();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RendalAnalysisStatus_onload, this);
            this.grid_rasMenu.addEventHandler("onselectchanged", this.grid_rasMenu_onselectchanged, this);

        };

        this.loadIncludeScript("RTSDRendalAnalysisStatus.xfdl");

       
    };
}
)();

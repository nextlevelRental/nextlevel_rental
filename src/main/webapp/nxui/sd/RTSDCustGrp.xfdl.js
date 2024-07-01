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
                this.set_name("RTSDCustGrp");
                this.set_classname("RTSDCustGrp");
                this.set_titletext("고객결합");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_custGrp1", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"grpDay\" type=\"STRING\" size=\"256\"/><Column id=\"sptDay\" type=\"STRING\" size=\"256\"/><Column id=\"grpYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"custGrpCount\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_custGrp1Cp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"grpDay\" type=\"STRING\" size=\"256\"/><Column id=\"sptDay\" type=\"STRING\" size=\"256\"/><Column id=\"grpYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"custGrpCount\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_custGrp2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"grpDay\" type=\"STRING\" size=\"256\"/><Column id=\"sptDay\" type=\"STRING\" size=\"256\"/><Column id=\"grpYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"insertFlag\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_grpYn1", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_grpYn2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYn", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static02", "absolute", "1121", "0", null, "496", "0", null, this);
            obj.set_taborder("1");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "10", "55", null, "20", "25", null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1112", "45", null, null, this);
            obj.set_taborder("3");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "20", "12", "71", "20", null, null, this.div_search);
            obj.set_taborder("49");
            obj.set_text("결합일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "585", "13", "72", "20", null, null, this.div_search);
            obj.set_taborder("50");
            obj.set_text("고객");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "628", "12", "100", "21", null, null, this.div_search);
            obj.set_taborder("51");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "369", "12", "71", "20", null, null, this.div_search);
            obj.set_taborder("52");
            obj.set_text("결합여부");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("Button02", "absolute", "710", "11", "20", "21", null, null, this.div_search);
            obj.set_taborder("60");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "730", "12", "137", "21", null, null, this.div_search);
            obj.set_taborder("61");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "220", "11", "10", "21", null, null, this.div_search);
            obj.set_taborder("62");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "340", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("63");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "556", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("64");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_useYn", "absolute", "438", "10", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("66");
            obj.set_innerdataset("@ds_useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Static("Static01", "absolute", "84", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("67");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_grpDayStart", "absolute", "115", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("68");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Calendar("cal_grpDayEnd", "absolute", "232", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("69");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj.set_enable("false");

            obj = new Button("bt_addCustGrp1", "absolute", "945", "80", "97", "22", null, null, this);
            obj.set_taborder("6");
            obj.set_text("결합번호생성");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("bt_saveCustGrp1", "absolute", "1051", "80", "71", "22", null, null, this);
            obj.set_taborder("7");
            obj.set_text("변경저장");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("bt_addCustGrp2", "absolute", "13", "281", "71", "22", null, null, this);
            obj.set_taborder("8");
            obj.set_text("라인추가");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("bt_saveCustGrp2", "absolute", "1077", "281", "45", "22", null, null, this);
            obj.set_taborder("9");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_custGrp1", "absolute", "10", "105", "1112", "150", null, null, this);
            obj.set_taborder("10");
            obj.set_binddataset("ds_custGrp1");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"300\"/><Column size=\"200\"/><Column size=\"200\"/><Column size=\"200\"/><Column size=\"195\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"결합번호\"/><Cell col=\"1\" text=\"결합일자\"/><Cell col=\"2\" text=\"분리일자\"/><Cell col=\"3\" text=\"결합여부\"/><Cell col=\"4\" text=\"결합고객수\"/></Band><Band id=\"body\"><Cell text=\"bind:grpNo\"/><Cell col=\"1\" displaytype=\"date\" text=\"bind:grpDay\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" displaytype=\"date\" text=\"bind:sptDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"3\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:grpYn\" combodataset=\"ds_grpYn1\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"4\" text=\"bind:custGrpCount\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_custGrp2", "absolute", "10", "305", "1112", "150", null, null, this);
            obj.set_taborder("11");
            obj.set_binddataset("ds_custGrp2");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"300\"/><Column size=\"200\"/><Column size=\"200\"/><Column size=\"200\"/><Column size=\"200\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"결합번호\"/><Cell col=\"1\"><Cell text=\"결합고객\"/></Cell><Cell col=\"2\" text=\"결합일자\"/><Cell col=\"3\" text=\"분리일자\"/><Cell col=\"4\" text=\"결합여부\"/></Band><Band id=\"body\"><Cell text=\"bind:grpNo\"/><Cell col=\"1\" text=\"bind:custNo\"/><Cell col=\"2\" displaytype=\"date\" text=\"bind:grpDay\" calendardisplaynulltype=\"none\"/><Cell col=\"3\" displaytype=\"date\" text=\"bind:sptDay\" calendardisplaynulltype=\"none\"/><Cell col=\"4\" displaytype=\"combo\" edittype=\"expr:(dataset.getRowType(currow) == 2) ? 'none' : 'combo'\" text=\"bind:grpYn\" combodataset=\"ds_grpYn2\" combocodecol=\"cd\" combodatacol=\"cdNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1112, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("3");
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
            		p.set_classname("RTSDCustGrp");
            		p.set_titletext("고객결합");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDCustGrp.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDCustGrp.xfdl", function() {
        	//include "lib::comLib.xjs";
        	
        	this.resultGrpNo = "";
        	
        	this.selectGrpNo = "0";
        	this.selectCustNo = "0";
        	
            /***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{
        		if( strSvcId == "initRTCMCustGrp" ){
        			this.div_search.cal_grpDayStart.set_value(FN_beforeMonths());
        			this.div_search.cal_grpDayEnd.set_value(FN_today());
        		}
        		
        		if( strSvcId == "listGrpNo1" ){
        			var rowCt = this.ds_custGrp1.getRowCount();
        			if( rowCt == 0 ){
        				this.grid_custGrp1.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        		}
        		
        		if( strSvcId == "listGrpNo2" ){
        			var rowCt = this.ds_custGrp2.getRowCount();
        			if( rowCt == 0 ){
        				this.grid_custGrp2.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        		}
        		
        		if( strSvcId == "grpNoCrate" ){
        			if( nErrorCode == "0" ){
        				if( confirm( strErrorMsg+"\n저장된 결합번호는 \'"+this.resultGrpNo+"\'입니다."+"\n저장된 결합번호로 조회하시겠습니까?") ){
        					this.FN_custGrpSearch("", "", "", "", this.resultGrpNo);
        				}else{
        					this.reload();
        				}
        			}else{
        				alert(strErrorMsg);
        				this.reload();
        			}
        		}
        		
        		if( strSvcId == "selectCustGrpCustNo" ){
        			if( nvl(this.selectGrpNo) == "0" ){
        				var findRow = this.ds_custGrp2.findRow( "custNo", this.selectCustNo );
        				if( findRow == -1 ){
        					var rowposition = this.ds_custGrp1.rowposition;
        					var nRow = this.ds_custGrp2.addRow();
        					this.ds_custGrp2.setColumn( nRow,"grpNo", nvl(this.ds_custGrp1.getColumn(rowposition,"grpNo")) );
        					this.ds_custGrp2.setColumn( nRow,"grpYn", "Y" );
        					this.ds_custGrp2.setColumn( nRow,"custNo", this.selectCustNo);
        				}else{
        					alert("결합고객 \'"+nvl(this.ds_custGrp2.getColumn(rowposition,"custNo"))+"\'번으로 중복 등록할 수 없습니다.");
        					this.grid_custGrp2.selectRow( findRow );
        				}
        			}else{
        				if(confirm("고객번호 \'"+this.selectCustNo+"\'번 으로 저장된 내역이 있습니다.\n저장된 결합번호는 \'"+this.selectGrpNo+" 입니다."+"\n저장된 결합번호로 조회하시겠습니까?")){
        					this.FN_custGrpSearch("", "", "", "", this.selectGrpNo);
        				}
        			}
        		}
        		
        		if( strSvcId == "saveCustGrp1"){
        			if( nErrorCode == "0" ){
        				alert(strErrorMsg);
        				this.reload();
        			}else{
        				alert(strErrorMsg);
        			}
        			
        		}
        		
        		if( strSvcId == "saveCustGrp2"){
        			if( nErrorCode == "0" ){
        				alert(strErrorMsg);
        				this.reload();
        			}else{
        				alert(strErrorMsg);
        			}
        		}
        	}
        	
        	
        	
        	this.RTSDCustGrp_onload = function(obj,e)
        	{
        		Ex.core.init(obj); 	
        		this.fn_init();
        		this.parent.setButton("S", this);
        	}

        

        	this.fn_init = function(){
        		var sSvcID      	= "initRTCMCustGrp";  
        		var sController   	= "rtms/sd/initRTCMCustGrp.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sOutDatasets+= " ds_grpYn1=mapCustGrpYn1 ";
        		sOutDatasets+= " ds_grpYn2=mapCustGrpYn2 ";
        		sOutDatasets+= " ds_useYn=mapUseYn ";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	
        	
        	this.bt_prog_onclick = function(obj,e)
        	{
        		var args ={p_arg : "RTSDCustGrp_2"};
        		Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        	}
        	this.FN_custNo_2 = function(res){
        		this.div_search.ed_custNm.set_value(res[0]);
        		this.div_search.ed_custNo.set_value(res[1]);
        	}

        
        	this.fn_search = function(obj,e)
        	{
        		var grpDayStart 	= nvl(this.div_search.cal_grpDayStart.value);
        		var grpDayEnd 		= nvl(this.div_search.cal_grpDayEnd.value);
        		var useYn 			= nvl(this.div_search.cb_useYn.value);
        		var custNo 			= nvl(this.div_search.ed_custNo.value);

        		var date1 = new Date(grpDayStart.substr(0,4),grpDayStart.substr(4,2)-1,grpDayStart.substr(6,2));
        		var date2 = new Date(grpDayEnd.substr(0,4),grpDayEnd.substr(4,2)-1,grpDayEnd.substr(6,2));
        		var interval = date2 - date1;
        		var day = 1000*60*60*24;
        		var month = day*30;
        		var year = month*12;
        		
        		if( parseInt(interval/month) > 2 ){
        			alert("조회기간을 2개월 이내로 설정하세요.");
        			this.div_search.cal_grpDayStart.setFocus(true);
        		}else{
        			this.FN_custGrpSearch(grpDayStart, grpDayEnd, useYn, custNo, "");
        		}
        	}
        	this.FN_custGrpSearch = function(grpDayStart,grpDayEnd,useYn,custNo,grpNo){
        		var sSvcID        	= "listGrpNo1";                    
        		var sController   	= "rtms/sd/listGrpNo1.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_custGrp1=mapGrpNo1";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		this.ds_custGrp1.deleteAll();
        		this.ds_custGrp2.deleteAll();
        		
        		sArgs += Ex.util.setParam("grpDayStart"	, nvl(grpDayStart));
        		sArgs += Ex.util.setParam("grpDayEnd"	, nvl(grpDayEnd));
        		sArgs += Ex.util.setParam("useYn"		, nvl(useYn));
        		sArgs += Ex.util.setParam("custNo"		, nvl(custNo));
        		sArgs += Ex.util.setParam("grpNo"		, nvl(grpNo));
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	

        
        	this.grid_custGrp1_onselectchanged = function(obj,e)
        	{
        		var rowposition1 = this.ds_custGrp1.rowposition;
        		
        		var sSvcID        	= "listGrpNo2";                    
        		var sController   	= "rtms/sd/listGrpNo2.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_custGrp2=mapGrpNo2";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		this.ds_custGrp2.deleteAll();
        		
        		sArgs += Ex.util.setParam("grpNo", nvl(this.ds_custGrp1.getColumn(rowposition1,"grpNo")) );
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	
        	
        	this.bt_addCustGrp1_onclick = function(obj,e)
        	{
        		this.ds_custGrp1Cp.deleteAll();
        		var nRow = this.ds_custGrp1Cp.addRow();
        		this.ds_custGrp1Cp.setColumn(nRow, "grpYn", "Y");
        		
        		if( confirm( "결합번호를 생성하시겠습니까?") ){
        			var sSvcID        	= "grpNoCrate";                    
        			var sController   	= "rtms/sd/grpNoCrate.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			sInDatasets   		= "input=ds_custGrp1Cp:U";
        			sOutDatasets  		= "";
        			var fn_callBack		= "fn_callBack";
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}else{
        			return false;
        		}
        	}

        

        	this.bt_saveCustGrp1_onclick = function(obj,e)
        	{
        		var cnt1 = this.ds_custGrp1.getRowCount();
        		var cnt2 = this.ds_custGrp2.getRowCount();
        		var saveFlag1 = false;
        		var saveFlag2 = false;
        		
        		for( var  i = 0 ; i < cnt1 ; i++ ){
        			if( this.ds_custGrp1.getRowType(i) == 1 ){
        				
        			}else{
        				saveFlag1 = true;
        				break;
        			}
        		}
        		
        		for( var  i = 0 ; i < cnt2 ; i++ ){
        			if( this.ds_custGrp2.getRowType(i) == 1 ){
        				
        			}else{
        				saveFlag2 = true;
        				break;
        			}
        		}
        		
        		if( saveFlag1 || saveFlag2 ){
        			if( confirm( "저장하시겠습니까?") ){
        				var sSvcID        	= "saveCustGrp1";                    
        				var sController   	= "rtms/sd/saveCustGrp1.do";
        				var sInDatasets   	= "";
        				var sOutDatasets  	= "";
        				var sArgs 			= "";	
        				sInDatasets   		= "input1=ds_custGrp1:U input2=ds_custGrp2:U";
        				sOutDatasets  		= "";
        				var fn_callBack		= "fn_callBack";
        				Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        			}
        		}else{
        			alert("변경된 내역이 없습니다.");
        		}
        	}

        

        	this.bt_addCustGrp2_onclick = function(obj,e)
        	{
        		var rowposition = this.ds_custGrp1.rowposition;
        		if( rowposition >= 0 ){
        			var args ={p_arg : "RTSDCustGrp_1"};
        			Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        		}else{
        			alert("선택된 행이 없습니다.");
        			return false;
        		}
        	}
        	this.FN_custNo_1 = function(res){
        		if( nvl(res[0]) != ""){			
        			var sSvcID        	= "selectCustGrpCustNo";                    
        			var sController   	= "rtms/sd/selectCustGrpCustNo.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			sInDatasets   		= "";
        			sOutDatasets  		= "";
        			var fn_callBack		= "fn_callBack";
        			
        			sArgs += Ex.util.setParam("custNo",res[0]);
        			
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}

        

        	this.bt_saveCustGrp2_onclick = function(obj,e)
        	{
        		var cnt = this.ds_custGrp2.getRowCount();
        		var saveFlag = false;
        		for( var  i = 0 ; i < cnt ; i++ ){
        			if( this.ds_custGrp2.getRowType(i) == 1 ){
        				
        			}else{
        				saveFlag = true;
        				break;
        			}
        		}
        		if( saveFlag ){
        			if( confirm( "저장하시겠습니까?") ){
        				var sSvcID        	= "saveCustGrp2";                    
        				var sController   	= "rtms/sd/saveCustGrp2.do";
        				var sInDatasets   	= "";
        				var sOutDatasets  	= "";
        				var sArgs 			= "";	
        				sInDatasets   		= "input=ds_custGrp2:U";
        				sOutDatasets  		= "";
        				var fn_callBack		= "fn_callBack";
        				Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        			}
        		}else{
        			alert("변경된 내역이 없습니다.");
        		}
        	}	
        	
        	
        	
        	this.ds_custGrp1_cancolumnchange = function(obj,e)
        	{
        		var rowCt = this.ds_custGrp2.getRowCount();
        		var flag = false;
        			
        		if( e.newvalue == "Y" ){
        			for(var i = 0 ; i < rowCt ; i++){
        				var insertFlag 	= this.ds_custGrp2.getColumn(i, "insertFlag");
        				var custNo 		= this.ds_custGrp2.getColumn(i, "custNo");
        				if( insertFlag == "N" ){
        					flag = false;
        					if(confirm("결합여부를 변경할 수 없습니다."+"\n고객번호 \'" + custNo +"\'번은 다른 결합번호로 결합이 되어있습니다. 조회하시겠습니까?")){
        						this.FN_custGrpSearch("", "", "", custNo, "");
        						return false;
        						break;
        					}else{
        						this.ds_custGrp1.setColumn(i, "grpYn", e.oldvalue);
        						return false;
        						break;
        					}
        				}else{
        					flag = true;
        				}
        			}
        			
        			for(var i = 0 ; i < rowCt ; i++){
        				this.ds_custGrp2.setColumn(i, "grpYn", e.newvalue);
        			}
        		}else if(  e.newvalue == "N" ){
        			for(var i = 0 ; i < rowCt ; i++){
        				this.ds_custGrp2.setColumn(i, "grpYn", e.newvalue);
        			}
        		}else{
        		
        		}
        	}

        
        	this.ds_custGrp2_cancolumnchange = function(obj,e)
        	{
        		var rowposition = this.ds_custGrp2.rowposition;
        		
        		if( e.newvalue == "Y" ){
        			var insertFlag = this.ds_custGrp2.getColumn(rowposition, "insertFlag");
        			var custNo 		= this.ds_custGrp2.getColumn(rowposition, "custNo");
        			
        			if( insertFlag == "N" ){
        				if(confirm("결합여부를 변경할 수 없습니다."+"\n고객번호 \'" + custNo +"\'번은 다른 결합번호로 결합이 되어있습니다. 조회하시겠습니까?")){
        					this.FN_custGrpSearch("", "", "", custNo, "");
        					return false;
        				}else{
        					this.ds_custGrp2.setColumn(rowposition, "grpYn", "N");
        					return false;
        				}
        			}
        		}
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_custGrp1.addEventHandler("cancolumnchange", this.ds_custGrp1_cancolumnchange, this);
            this.ds_custGrp2.addEventHandler("cancolumnchange", this.ds_custGrp2_cancolumnchange, this);
            this.addEventHandler("onload", this.RTSDCustGrp_onload, this);
            this.div_search.Button02.addEventHandler("onclick", this.bt_prog_onclick, this);
            this.bt_addCustGrp1.addEventHandler("onclick", this.bt_addCustGrp1_onclick, this);
            this.bt_saveCustGrp1.addEventHandler("onclick", this.bt_saveCustGrp1_onclick, this);
            this.bt_addCustGrp2.addEventHandler("onclick", this.bt_addCustGrp2_onclick, this);
            this.bt_saveCustGrp2.addEventHandler("onclick", this.bt_saveCustGrp2_onclick, this);
            this.grid_custGrp1.addEventHandler("onselectchanged", this.grid_custGrp1_onselectchanged, this);
            this.grid_custGrp2.addEventHandler("onselectchanged", this.grid_custGrp2_onselectchanged, this);

        };

        this.loadIncludeScript("RTSDCustGrp.xfdl");

       
    };
}
)();

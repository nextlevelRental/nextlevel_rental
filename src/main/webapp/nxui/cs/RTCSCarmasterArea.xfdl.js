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
                this.set_titletext("지역별 미스터로디안 등록");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"doNm\" type=\"STRING\" size=\"256\"/><Column id=\"ctNm\" type=\"STRING\" size=\"256\"/><Column id=\"emNm\" type=\"STRING\" size=\"256\"/><Column id=\"rdNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"INT\" size=\"256\"/><Column id=\"carmasterNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj.set_text("광역시/도");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "553", "13", "72", "20", null, null, this.div_search);
            obj.set_taborder("50");
            obj.set_text("면/동");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "289", "12", "71", "20", null, null, this.div_search);
            obj.set_taborder("52");
            obj.set_text("시/군/구");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "260", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("63");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "523", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("64");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "90", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("67");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("Ed_doNm", "absolute", "120", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("68");
            obj.set_tooltiptext("edit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("30");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("Ed_ctNm", "absolute", "383", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("69");
            obj.set_tooltiptext("edit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("30");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "353", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("70");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("Ed_emNm", "absolute", "627", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("71");
            obj.set_tooltiptext("edit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("30");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "597", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("72");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition03", "absolute", "797", "13", "72", "20", null, null, this.div_search);
            obj.set_taborder("73");
            obj.set_text("도로명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "846", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("74");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("Ed_rdNm", "absolute", "876", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("75");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("30");
            obj.set_tooltiptext("edit");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "767", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("76");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Button("bt_saveCustGrp1", "absolute", "1051", "75", "71", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_text("일괄적용");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_custGrp1", "absolute", "10", "105", "1112", "390", null, null, this);
            obj.set_taborder("10");
            obj.set_binddataset("dsList");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"60\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"광역시/도 명\"/><Cell col=\"2\" text=\"시/군/구 명\"/><Cell col=\"3\" text=\"면동\"/><Cell col=\"4\" text=\"도로명\"/><Cell col=\"5\" text=\"지번건수\"/><Cell col=\"6\" text=\"미스터로디안\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:check\"/><Cell col=\"1\" text=\"bind:doNm\"/><Cell col=\"2\" text=\"bind:ctNm\"/><Cell col=\"3\" text=\"bind:emNm\"/><Cell col=\"4\" text=\"bind:rdNm\"/><Cell col=\"5\" text=\"bind:cnt\"/><Cell col=\"6\" text=\"bind:carmasterNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_searchCondition01", "absolute", "776", "75", "104", "20", null, null, this);
            obj.set_taborder("11");
            obj.set_text("Mr. Roadian");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("Ed_carmasterNm", "absolute", "881", "75", "140", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_tooltiptext("edit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "851", "61", "30", "44", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1021", "61", "30", "44", null, null, this);
            obj.set_taborder("14");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_postSearch1", "absolute", "1001", "74", "20", "21", null, null, this);
            obj.set_taborder("15");
            obj.set_cssclass("btn_WF_edtSch");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Edit("Ed_carmasterNu", "absolute", "881", "75", "52", "21", null, null, this);
            obj.set_taborder("16");
            obj.set_tooltiptext("edit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            obj.set_visible("false");
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
            		p.set_titletext("지역별 미스터로디안 등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSCarmasterArea.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSCarmasterArea.xfdl", function() {
        	//include "lib::comLib.xjs";
        	
        	this.resultGrpNo = "";
        	
        	this.selectGrpNo = "0";
        	this.selectCustNo = "0";
        	
        		
        	//onloard
        	this.RTSDCustGrp_onload = function(obj,e)
        	{
        		Ex.core.init(obj); 
        		this.parent.setButton("E|C|S", this);
        	}
        	
            /***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{
        		if( strSvcId == "initRTCMCustGrp" ){
        			this.div_search.cal_grpDayStart.set_value(FN_beforeMonths());
        			this.div_search.cal_grpDayEnd.set_value(FN_today());
        		}
        		
        		if( strSvcId == "carmasterAreaList" ){
        			this.dsList.addColumn("check", "string", 256);
        			//alert(this.dsList.saveXML());
        			var cnt = this.dsList.getRowCount();
        			if( cnt <= 0) {
        				alert("조회된 데이터가 없습니다.");
        				return;
        			} else {
        				
        			}
        		}
        		if(strSvcId == "saveData") {
        			alert(strErrorMsg);
        			this.fn_search();
        		}
        		
        	}
        	

        //조회
        	this.fn_search = function(obj,e)
        	{
        		var doNm 	= nvl(this.div_search.Ed_doNm.value); //광역시/도 세팅
        		var ctNm 	= nvl(this.div_search.Ed_ctNm.value); //시/군/구 세팅
        		var emNm 	= nvl(this.div_search.Ed_emNm.value); //면/동 세팅
        		var rdNm 	= nvl(this.div_search.Ed_rdNm.value); //도로명
        		if(doNm == "") {
        			alert("광역시/도 명을 입력해주세요")
        			return;
        		}
        		
        		this.dsList.addColumn("check", "string", 256);
        		
        		var sSvcID        	= "carmasterAreaList";                    
        		var sController   	= "ntrms/cs/carmasterAreaList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		this.dsList.clearData();
        		
        		sArgs += Ex.util.setParam("doNm", doNm);
        		sArgs += Ex.util.setParam("ctNm", ctNm);
        		sArgs += Ex.util.setParam("emNm", emNm);
        		sArgs += Ex.util.setParam("rdNm", rdNm);
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        //저장
        this.fn_save = function(obj,e)
        {
        	var cnt = this.dsList.rowcount;
        	var checkCnt = 0;
        	
        	for(var i = cnt; i >=0; i--) {
        		if(this.dsList.getColumn(i, "check")  == "1") {
        			var carmasterNm = nvl(this.dsList.getColumn(i, "carmasterNm"));
        			var rdNm = nvl(this.dsList.getColumn(i, "rdNm"));
        			if(carmasterNm == "") {
        				alert('도로명 "' + rdNm + '" 건 미스터로디안을 지정해주세요');
        				return;
        			}
        			checkCnt++;
        		}
        	}
        	
        	if(checkCnt == 0) {
        		alert("미스터로디안 적용 대상을 선택해주세요.");
        		return;
        	}
        	
        	var sSvcID        	= "saveData";
        	var sController   	= "ntrms/cs/carmasterAreaSave.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	sInDatasets   		= "input=dsList:U";
        	sOutDatasets  		= "";
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        	
        //일괄적용 button
        this.bt_saveCustGrp1_onclick = function(obj,e)
        {
        	this.dsList.addColumn("carmasterNu", "string", 256);
        	this.dsList.addColumn("carmasterNm", "string", 256);
        	
        	var carmasterNu = nvl(this.Ed_carmasterNu.value); //미스터로디안 코드
        	var carmasterNm = nvl(this.Ed_carmasterNm.value); //미스터로디안 이름
        	
        	if(carmasterNu == "" || carmasterNm == "") {
        		alert("미스터로디안을 입력해주세요.");
        		return;
        	}
        	if( confirm( '미스터로디안 "' + carmasterNm + '" 을 적용시키겠습니까?') ){
        		var cnt = this.dsList.rowcount;
        		var checkCnt = 0;
        		for(var i = cnt; i >= 0; i--) {
        			if(this.dsList.getColumn(i, "check")  == "1") {
        				this.dsList.setColumn(i, "carmasterNu", carmasterNu);
        				this.dsList.setColumn(i, "carmasterNm", carmasterNm);
        				checkCnt++;
        			}
        		}
        	}else{
        		return false;
        	}
        	
        	if(checkCnt == 0) {
        		alert("미스터로디안 적용 대상을 선택해주세요.");
        	} else {
        		
        	}
        }

        //미스터로디안 찾기
        this.div_cust_btn_postSearch1_onclick = function(obj,e)
        {
        	var args ={p_formId : "RTCSCarMaster"};
        	Ex.core.popup(this,"Mr. Roadian 찾기","cs::RTCSCarMaster_pop.xfdl",args, "modaless=false");
        }
        //팝업 리턴
        this.returnCarmaster = function(val1,val2){
        	this.Ed_carmasterNu.set_value(val1);
        	this.Ed_carmasterNm.set_value(val2);
        }

        
        //광역시/도 enter
        this.div_search_Ed_doNm_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 )
        	{
        		this.fn_search();
        	}
        }
        //시/군/구 enter
        this.div_search_Ed_ctNm_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 )
        	{
        		this.fn_search();
        	}
        }
        //면/동 enter
        this.div_search_Ed_emNm_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 )
        	{
        		this.fn_search();
        	}
        }

        	this.fn_excel = function(obj,e)
        	{
        		Ex.core.exportExcel(this, this.grid_custGrp1, "리스트");
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDCustGrp_onload, this);
            this.div_search.Ed_doNm.addEventHandler("onkeyup", this.div_search_Ed_doNm_onkeyup, this);
            this.div_search.Ed_ctNm.addEventHandler("onkeyup", this.div_search_Ed_ctNm_onkeyup, this);
            this.div_search.Ed_emNm.addEventHandler("onkeyup", this.div_search_Ed_emNm_onkeyup, this);
            this.div_search.Ed_rdNm.addEventHandler("onkeyup", this.div_search_Ed_emNm_onkeyup, this);
            this.bt_saveCustGrp1.addEventHandler("onclick", this.bt_saveCustGrp1_onclick, this);
            this.grid_custGrp1.addEventHandler("onselectchanged", this.grid_custGrp1_onselectchanged, this);
            this.btn_postSearch1.addEventHandler("onclick", this.div_cust_btn_postSearch1_onclick, this);

        };

        this.loadIncludeScript("RTCSCarmasterArea.xfdl");

       
    };
}
)();

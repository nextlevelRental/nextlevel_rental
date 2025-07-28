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
                this.set_name("RTSDCampReg");
                this.set_classname("RTSDCampReg");
                this.set_titletext("캠페인 등록");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsCampList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"dcTp\" type=\"STRING\" size=\"256\"/><Column id=\"dcTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"dcRate\" type=\"STRING\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsDcTp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("Grid00", "absolute", "0", "68", null, "428", "25", null, this);
            obj.set_taborder("5");
            obj.set_binddataset("dsCampList");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"140\"/><Column size=\"140\"/><Column size=\"140\"/><Column size=\"140\"/><Column size=\"140\"/><Column size=\"140\"/><Column size=\"140\"/><Column size=\"140\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"할인유형\"/><Cell col=\"1\" text=\"상품코드\"/><Cell col=\"2\" text=\"상품명\"/><Cell col=\"3\" text=\"적용시작일\"/><Cell col=\"4\" text=\"적용종료일\"/><Cell col=\"5\" text=\"할인율\"/><Cell col=\"6\" text=\"할인금액\"/><Cell col=\"7\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell text=\"bind:dcTpNm\"/><Cell col=\"1\" text=\"bind:matCd\"/><Cell col=\"2\" text=\"bind:matNm\"/><Cell col=\"3\" displaytype=\"date\" text=\"bind:strDay\" calendardisplaynulltype=\"none\"/><Cell col=\"4\" displaytype=\"date\" text=\"bind:endDay\" calendardisplaynulltype=\"none\"/><Cell col=\"5\" text=\"bind:dcRate\"/><Cell col=\"6\" text=\"bind:dcAmt\"/><Cell col=\"7\" text=\"bind:useYn\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "48", "25", null, this);
            obj.set_taborder("6");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Edit("Edit00", "absolute", "349", "12", "165", "21", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_enableevent("false");
            obj.set_readonly("false");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "25", "12", "77", "21", null, null, this.div_search);
            obj.set_taborder("33");
            obj.set_text("할인유형");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("Button02", "absolute", "495", "12", "20", "21", null, null, this.div_search);
            obj.set_taborder("34");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "539", "12", "78", "21", null, null, this.div_search);
            obj.set_taborder("35");
            obj.set_text("기준일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("Combo00", "absolute", "102", "12", "143", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("37");
            obj.set_autoselect("true");
            obj.set_innerdataset("@dsDcTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_value("null");
            obj.set_index("0");
            obj = new Static("Static01", "absolute", "270", "12", "79", "21", null, null, this.div_search);
            obj.set_taborder("38");
            obj.set_text("상품");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("Calendar00", "absolute", "617", "12", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("39");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static11", "absolute", "0", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("40");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", null, "12", "0", null, this.div_search);
            obj.set_taborder("41");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "245", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("42");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "514", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("43");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "0", "32", null, "12", "0", null, this.div_search);
            obj.set_taborder("44");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "48", "1147", "20", null, null, this);
            obj.set_taborder("8");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 48, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("6");
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
            		p.set_classname("RTSDCampReg");
            		p.set_titletext("캠페인 등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDCampReg.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDCampReg.xfdl", function() {
        /***********************************************************************
         * Script Include 
         ************************************************************************/
         
        //include "lib::comLib.xjs";
        this.toDay = "";

        	
        	this.RTSDCampReg_onload = function(obj,e)
        	{
        		Ex.core.init(obj);
        		this.fn_init();
        		this.get_date();
        		this.parent.setButton("S|E|N", this); //S조회, C추가
        	}
        	this.fn_init = function(){
        			var sSvcID      	= "initCombo";  
        			var sController   	= "rtms/sd/initCampReg.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "dsDcTp=output";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        		//java에서 현재 날짜 가져오기
        	this.get_date = function(){
        		var sSvcID        	= "getDate";                    
        		var sController   	= "/rtms/comm/getToday.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        		
        	}
        	
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt)
        	{
        		if( strSvcId == "list" ){
        			
        		} else if(strSvcId == "getDate") {
        			this.div_search.Calendar00.set_value(this.toDay);
        		} else if(strSvcId == "countRegInfo") {
        			alert(this.countRegInfo);
        		} else if(strSvcId == "countNext") {
        			alert(this.countNext);
        		}
        	}

        //조회 button event
        this.fn_search = function(obj,e)
        {
        	var dcTp = this.div_search.Combo00.value;
        	var matCd = this.div_search.Edit00.value;
        	var strDay = this.div_search.Calendar00.value;
        	
        	var sSvcID        	= "listCamp";                    
        	var sController   	= "rtms/sd/listCampRegInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsCampList=mapCampReg";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsCampList.deleteAll();
        	
        	sArgs += Ex.util.setParam("dcTp", dcTp);
        	sArgs += Ex.util.setParam("matCd", matCd);
        	sArgs += Ex.util.setParam("strDay", strDay);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        }

        //추가 button event
        this.fn_add = function(obj,e)
        {
        	var args ={p_formId :"RTSDCampReg" };
        	Ex.core.popup(this,"캠페인 - 신규등록","sd::RTSDCampPopUp.xfdl",args, "modaless=false");
        }

        //상품조회
        this.Div01_Button02_onclick = function(obj,e)
        {
        	var args ={p_formId :"RTSDCampReg" };
        	Ex.core.popup(this,"상품조회","sd::RTSDCampProductPopUp.xfdl",args, "modaless=false");
        }

        //상품조회 파라미터 반환
        this.returnProduct = function(arr) {
        	this.div_search.Edit00.set_value(arr.cd);
        }

        
        //엑셀
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.Grid00);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDCampReg_onload, this);
            this.div_search.Button02.addEventHandler("onclick", this.Div01_Button02_onclick, this);
            this.div_search.Combo00.addEventHandler("onitemchanged", this.Div01_Combo00_onitemchanged, this);

        };

        this.loadIncludeScript("RTSDCampReg.xfdl");

       
    };
}
)();

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
                this.set_name("RTCOMMPreminumService_pop");
                this.set_classname("RTCOMMPreminumService_pop");
                this.set_titletext("프리미엄서비스 팝업");
                this._setFormPosition(0,0,450,342);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_cnt", this);
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

            obj = new Dataset("ds_season", this);
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

            obj = new Dataset("ds_preminum", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"servVnt\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_preminumCp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"psCd\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"servVnt\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "10", null, "72", "10", null, this);
            obj.set_taborder("2");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_applyDate", "absolute", "20", "10", "100", "19", null, null, this.div_search);
            obj.set_taborder("66");
            obj.set_text("적용일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_season", "absolute", "89", "36", "120", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("67");
            obj.set_innerdataset("@ds_season");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_enable("false");
            obj.set_index("-1");
            obj = new Static("st_cnt", "absolute", "239", "10", "100", "20", null, null, this.div_search);
            obj.set_taborder("68");
            obj.set_text("타이어갯수");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_cnt", "absolute", "320", "10", "86", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("69");
            obj.set_innerdataset("ds_cnt");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_enable("false");
            obj.set_index("-1");
            obj = new Static("st_season", "absolute", "20", "36", "100", "20", null, null, this.div_search);
            obj.set_taborder("70");
            obj.set_text("계절용");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_applyDate", "absolute", "89", "10", "120", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("71");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Button("btn_search", "absolute", null, "37", "45", "22", "20", null, this.div_search);
            obj.set_taborder("72");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.div_search.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "301", "41", "21", "10", null, this);
            obj.set_taborder("4");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_preminum", "absolute", "10", "92", null, "199", "10", null, this);
            obj.set_taborder("5");
            obj.set_binddataset("ds_preminum");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"170\"/><Column size=\"129\"/><Column size=\"129\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"프리미엄서비스 \"/><Cell col=\"1\" text=\"상세서비스\"/><Cell col=\"2\" text=\"서비스횟수\"/></Band><Band id=\"body\"><Cell celltype=\"none\" text=\"bind:psNm\" suppress=\"1\" suppressalign=\"first\"/><Cell col=\"1\" text=\"bind:prsNm\"/><Cell col=\"2\" text=\"bind:servVnt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "301", "41", "21", "55", null, this);
            obj.set_taborder("6");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 72, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("2");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 450, 342, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMPreminumService_pop");
            		p.set_titletext("프리미엄서비스 팝업");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMPreminumService_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMPreminumService_pop.xfdl", function() {
        	//include "lib::comLib.xjs"; 
        	
        	
        	
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt,checkAuthGrpuCd)
        	{
        		if( strSvcId == "initRTCOMMPreminumService"){
        			this.div_search_btn_search_onclick();
        		}
        		
        		if( strSvcId == "preminumList" ){
        			var rowCt = this.ds_preminum.getRowCount();
        			if( rowCt == 0 ){
        				alert("선택가능한 프리미엄서비스가 없어 계약저장 실패하였습니다.\n영업관리팀 확인바랍니다.");
        				this.grid_preminum.set_nodatatext( "조회된 데이터가 없습니다." );
        			}
        		}
        	}
        	
        	
        	
        	this.RTCOMMPreminumService_pop_onload = function(obj,e)
        	{
        		Ex.core.init(obj);
        		this.fn_init();
        	}

        

        	this.fn_init = function(){
        		this.div_search.cal_applyDate.set_value( this.parent.ordDay );
        		this.div_search.cb_cnt.set_value( this.parent.cntCd );
        		this.div_search.cb_season.set_value( this.parent.seasonCd );
        		
        		var sSvcID      	= "initRTCOMMPreminumService";  
        		var sController   	= "rtms/comm/initRTCOMMPreminumService.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_cnt=mapDsCnt ds_season=mapDsSeason";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	
        	
        	this.div_search_btn_search_onclick = function(obj,e)
        	{
        		
        		var sSvcID        	= "preminumList";                    
        		var sController   	= "rtms/comm/preminumList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_preminum=preminumMap";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("applyDate", 	nvl(this.div_search.cal_applyDate.value));
        		sArgs += Ex.util.setParam("cnt", 		nvl(this.div_search.cb_cnt.value));
        		sArgs += Ex.util.setParam("season", 	nvl(this.div_search.cb_season.value));
        		
        		this.ds_preminum.deleteAll();
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	this.grid_preminum_oncelldblclick = function(obj,e)
        	{
        		this.FN_choice();
        	}

        	this.btn_choice_onclick = function(obj,e)
        	{
        		this.FN_choice();
        	}

        	this.FN_choice = function(){
        		for( var i = 0 ; i < this.ds_preminum.getRowCount() ; i++){
        			this.ds_preminum.setColumn(i, "servCnt0", this.ds_preminum.getColumn(i, "servVnt"));
        			this.ds_preminum.setColumn(i, "servCntr", this.ds_preminum.getColumn(i, "servVnt"));
        		}
        		this.ds_preminumCp.copyData(this.ds_preminum);
        		var arr = [this.ds_preminumCp];
        		this.close(this.opener.returnPreminum(arr));
        	}
        	
        	this.btn_close_onclick = function(obj,e)
        	{
        		this.close();
        	}

        
        	this.RTCOMMPreminumService_pop_onkeyup = function(obj,e)
        	{
        		if(e.keycode == 27){
        			this.close();
        		}
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCOMMPreminumService_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMPreminumService_pop_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search_btn_search_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.grid_preminum.addEventHandler("oncellclick", this.grid_preminum_oncellclick, this);
            this.grid_preminum.addEventHandler("oncelldblclick", this.grid_preminum_oncelldblclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);

        };

        this.loadIncludeScript("RTCOMMPreminumService_pop.xfdl");

       
    };
}
)();

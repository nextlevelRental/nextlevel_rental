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
                this.set_name("RTCOMMSeviceOrd_pop");
                this.set_classname("RTCMVkbur_pop");
                this.set_titletext("서비스등록");
                this._setFormPosition(0,0,817,433);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_rtsd0013", this);
            obj._setContents("<ColumnInfo><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"prsDcd\" type=\"STRING\" size=\"256\"/><Column id=\"prsNm\" type=\"STRING\" size=\"256\"/><Column id=\"servAmt\" type=\"STRING\" size=\"256\"/><Column id=\"servInfAmt\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt\" type=\"STRING\" size=\"256\"/><Column id=\"servAmtSum\" type=\"STRING\" size=\"256\"/><Column id=\"servAmtSumOrg\" type=\"STRING\" size=\"256\"/><Column id=\"servCntOrg\" type=\"STRING\" size=\"256\"/><Column id=\"servInfYN\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_svrCnt", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">1</Col><Col id=\"cdNm\">1회</Col></Row><Row><Col id=\"cd\">2</Col><Col id=\"cdNm\">2회</Col></Row><Row><Col id=\"cd\">3</Col><Col id=\"cdNm\">3회</Col></Row><Row><Col id=\"cd\">4</Col><Col id=\"cdNm\">4회</Col></Row><Row><Col id=\"cd\">5</Col><Col id=\"cdNm\">5회</Col></Row><Row><Col id=\"cd\">6</Col><Col id=\"cdNm\">6회</Col></Row><Row><Col id=\"cd\">999</Col><Col id=\"cdNm\">무제한</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grid_seviceCd", "absolute", "10", "8", null, "380", "313", null, this);
            obj.set_taborder("0");
            obj.set_binddataset("ds_rtsd0013");
            obj.set_autofittype("col");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj.set_cellsizingtype("col");
            obj.set_autoupdatetype("comboselect");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"138\"/><Column size=\"69\"/><Column size=\"93\"/><Column size=\"74\"/><Column size=\"114\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"상세서비스\"/><Cell col=\"1\" text=\"기간\"/><Cell col=\"2\" text=\"타이어본수\"/><Cell col=\"3\" text=\"서비스횟수\"/><Cell col=\"4\" text=\"금액\"/></Band><Band id=\"body\"><Cell text=\"bind:prsNm\"/><Cell col=\"1\" text=\"bind:periodNm\"/><Cell col=\"2\" text=\"bind:cntNm\"/><Cell col=\"3\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:servCnt\" combodataset=\"ds_svrCnt\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/><Cell col=\"4\" text=\"bind:servAmtSum\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "398", "41", "21", "365", null, this);
            obj.set_taborder("2");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "398", "41", "21", "320", null, this);
            obj.set_taborder("3");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 817, 433, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMVkbur_pop");
            		p.set_titletext("서비스등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMSeviceOrd_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMSeviceOrd_pop.xfdl", function() {
        /***********************************************************************************
         * 1. Script Include 
         ***********************************************************************************/
        //include "lib::comLib.xjs";

        var p_prsNm = "";

        // 데이터 호출 후 실행 함수 
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){
        	if( strSvcId == "srvcOrdList" ){
        	
        		var ct = this.ds_rtsd0013.getRowCount();
        		if( ct == 0){
        			alert("1 조회된 데이터가 없습니다.");
        			this.div_search.p_prsNm.setFocus(true);
        			p_prsNm = "";
        		}
        		this.alert(this.ds_rtsd0013.getColumn(0, "servInfYN"));
        		// 무제한 선택여부 
        		if(nvl(this.ds_rtsd0013.getColumn(0, "servInfYN")) != 'Y'){
        			this.grid_seviceCd.setCellProperty("body", this.grid_seviceCd.getBindCellIndex("body", "servCnt"), "displaytype", "normal");
        			this.grid_seviceCd.setCellProperty("body", this.grid_seviceCd.getBindCellIndex("body", "servCnt"), "edittype", "none");
        		}
        	}else if( strSvcId == "prmmSrvcOrdList" ){
        	
        		var ct = this.ds_rtsd0013.getRowCount();
        		if( ct == 0){
        			alert("2 조회된 데이터가 없습니다.");
        			this.div_search.p_prsNm.setFocus(true);
        			p_prsNm = "";
        		}
        		this.alert(this.ds_rtsd0013.getColumn(0, "servInfYN"));
        		// 무제한 선택여부 
        		if(nvl(this.ds_rtsd0013.getColumn(0, "servInfYN")) != 'Y'){
        			this.grid_seviceCd.setCellProperty("body", this.grid_seviceCd.getBindCellIndex("body", "servCnt"), "displaytype", "normal");
        			this.grid_seviceCd.setCellProperty("body", this.grid_seviceCd.getBindCellIndex("body", "servCnt"), "edittype", "none");
        		}
        	}
        }

        // 초기 로딩시
        this.RTCOMMSeviceOrd_pop_onload = function (obj,e){
        	Ex.core.init(obj);
        	this.searchDo(); 
        }

        // 검색 버튼클릭시
        this.searchDo = function(){

        	/*var sSvcID        	= "srvcOrdList";                    
        	var sController   	= "rtms/comm/srvcOrdList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_rtsd0013=srvcOrdListMap";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_rtsd0013.clearData();  // dataset clear 한다.
        	sArgs += Ex.util.setParam("p_saleCd", 'S000000110');	// 전달변수
        	sArgs += Ex.util.setParam("p_periodCd", '12');	// 전달변수
        	sArgs += Ex.util.setParam("p_cntCd", '02');	// 전달변수
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); */
        	
        	var sSvcID        	= "prmmSrvcOrdList";                    
        	var sController   	= "/rtms/sd/prmmSrvcOrdList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_rtsd0013=prmmSrvcOrdList";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	this.ds_rtsd0013.clearData();  // dataset clear 한다.
        		sArgs += Ex.util.setParam("ordNo",   "D17000109781");
        		sArgs += Ex.util.setParam("periodCd",   "12");
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        // 닫기
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }

        // ESC 닫기
        this.RTCOMMSeviceOrd_pop_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }

        
        this.comboChk = function(obj,e)
        {
        	if(e.col == 3) {
        		this.ds_svrCnt.filter("cd == '999' || cd == " + this.ds_rtsd0013.getColumn(e.row, "servCntOrg"));
        		
        		
        	}
        }

        
        this.aaaa = function(obj,e)
        {
        	//this.alert(obj.getColumn(e.row, "servCnt"));
        	
        	if(obj.getColumn(e.row, "servCnt") == '999'){
        		obj.setColumn(e.row, "servAmtSum", obj.getColumn(e.row, "servInfAmt"));
        	}else{
        		obj.setColumn(e.row, "servAmtSum", obj.getColumn(e.row, "servAmtSumOrg"));
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_rtsd0013.addEventHandler("oncolumnchanged", this.aaaa, this);
            this.addEventHandler("onload", this.RTCOMMSeviceOrd_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMSeviceOrd_pop_onkeyup, this);
            this.grid_seviceCd.addEventHandler("oncellclick", this.comboChk, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMSeviceOrd_pop.xfdl");

       
    };
}
)();

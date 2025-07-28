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
                this.set_name("RTCOMMTireDetail_pop");
                this.set_classname("RTCMAgency_pop");
                this.set_titletext("타이어제외상품");
                this.set_scrollbars("none");
                this._setFormPosition(0,0,800,430);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_agencyPop", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"standard\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_agencyPop00", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("st_BG", "absolute", "10", "0", null, "40", "-10", null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_SearchBox");
            this.addChild(obj.name, obj);

            obj = new Div("div_grid_top", "absolute", "10", "55", null, "23", "-10", null, this);
            obj.set_taborder("1");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", null, "45", "10", null, this);
            obj.set_taborder("2");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, "9", "45", "22", "20", null, this.div_search);
            obj.set_taborder("21");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("22");
            obj.set_text("패턴코드");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_searchKeyword", "absolute", "101", "10", "180", "20", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_searchKeyword00", "absolute", "301", "10", "67", "20", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_searchKeyword01", "absolute", "341", "10", "55", "20", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_searchKeyword02", "absolute", "373", "10", "43", "20", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Div("div_grid_bottom", "absolute", "0.78%", null, null, "20", "-10", "21", this);
            obj.set_taborder("3");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_bg", "absolute", "0%", "0", null, null, "0%", "0", this.div_grid_bottom);
            obj.set_taborder("26");
            obj.set_cssclass("sta_WF_GridDis");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Static("sta_msg", "absolute", "0.49%", "0", null, "20", "23.78%", null, this.div_grid_bottom);
            obj.set_taborder("27");
            obj.style.set_color("#444444ff");
            this.div_grid_bottom.addChild(obj.name, obj);

            obj = new Grid("grd_Group", "absolute", "15", "75", null, "326", "440", null, this);
            obj.set_taborder("4");
            obj.set_binddataset("ds_agencyPop");
            obj.set_autofittype("col");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"160\"/><Column size=\"0\"/><Column size=\"160\"/><Column size=\"0\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"패턴코드\"/><Cell col=\"1\" text=\"규격\"/><Cell col=\"2\" text=\"상품코드\"/><Cell col=\"3\" text=\"상품명\"/></Band><Band id=\"body\"><Cell text=\"bind:petternCd\"/><Cell col=\"1\" text=\"bind:standard\"/><Cell col=\"2\" text=\"bind:matCd\"/><Cell col=\"3\" text=\"bind:matNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "405", "41", "21", "10", null, this);
            obj.set_taborder("6");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "15", "57", "126", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_cssclass("sta_WF_subTitle");
            obj.set_text("상품(제품)정보");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", null, "192", "24", "22", "403", null, this);
            obj.set_taborder("8");
            obj.set_cssclass("btn_WF_suttleR");
            obj.style.set_font("11 Verdana");
            this.addChild(obj.name, obj);

            obj = new Button("Button03", "absolute", null, "222", "22", "22", "404", null, this);
            obj.set_taborder("9");
            obj.set_cssclass("btn_WF_suttleL");
            obj.style.set_font("11 Verdana");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_Group00", "absolute", "416", "74", null, "326", "47", null, this);
            obj.set_taborder("10");
            obj.set_binddataset("ds_agencyPop00");
            obj.set_autofittype("col");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"160\"/><Column size=\"160\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"패턴코드\"/><Cell col=\"1\" text=\"상품코드\"/></Band><Band id=\"body\"><Cell text=\"bind:petternCd\"/><Cell col=\"1\" text=\"bind:matCd\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "405", "41", "21", "54", null, this);
            obj.set_taborder("11");
            obj.set_text("확인");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "415", "57", "126", "20", null, null, this);
            obj.set_taborder("12");
            obj.set_text("제외 상품");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 23, this.div_grid_top,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_top.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("2");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 20, this.div_grid_bottom,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("3");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_bottom.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 800, 430, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMAgency_pop");
            		p.set_titletext("타이어제외상품");
            		p.set_scrollbars("none");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMTireDetail_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMTireDetail_pop.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCOMMTireDetail_pop.xfdl
         * 설    명 : 상품(제품)정보 조회 (팝업)
          ***************************************************************************************************/

        //include "lib::comLib.xjs";

        this.fv_opYn = "";	// 온라인장착 가능여부

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.form_onload = function(obj,e)	{

        	Ex.core.init(obj);
        	
        	if(this.parent.p_formId == "RTSDSaleItemRegister"){
        	
        		if(nvl(this.parent.p_Cd) != ""){
        	
        			this.div_search.edt_searchKeyword.set_value(this.parent.p_Cd);
        			this.div_search.edt_searchKeyword00.set_value(this.parent.p_saleCd);
        			this.div_search.edt_searchKeyword01.set_value(this.parent.p_strDay);
        			this.div_search.edt_searchKeyword02.set_value(this.parent.p_endDay);
        			this.FN_search();
        			this.FN_search2();
        		}		
        	}
        	else{
        	this.div_search.edt_searchKeyword.set_value(this.parent.p_Cd);
        	}
        		
        	// 모화면에서 온라인장착 가능여부 파라미터를 받았는지 확인하여 전역변수로 세팅
        	// - 받지않은 경우 null로 처리하여 가능여부와 관계없이 모두 조회되도록 함
        	if (this.parent.p_opYn == "Y" || this.parent.p_opYn == "N") {
        		this.fv_opYn = this.parent.p_opYn;
        	}
        }

        /**
         * 키입력 이벤트 처리
         * - ESC 키 입력 시 닫기
         */
        this.RTCOMMTireDetail_pop_onkeyup = function(obj,e)	{
        	if(e.keycode == 27){
        		this.close();
        	}
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){
        	if( strSvcId == "listTireDetailInfo" ){
        		var ct = this.ds_agencyPop.rowcount;
        		if( ct != 0 ){
        		
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grid_agency.set_nodatatext("조회된 데이터가 없습니다.");
        			this.div_search.ed_searchAgency.setFocus();
        		}
        	}
        	
         	if (strSvcId =="saveTireDetail"){

          	}
        	if( strSvcId == "listTireDetailInfo2" ){
        	}
        	if (strSvcId =="saveTireDetail2"){
        	}

        }

        /**
         * 조회 버튼의 클릭 이벤트 처리
         */
        this.div_search.btn_search_onclick = function(obj,e){
        	this.FN_search();
        }

        /**
         * 조회
         */
        this.FN_search = function(){
        	var petternCd		= this.div_search.edt_searchKeyword.value;
        	var sSvcID        	= "listTireDetailInfo";                    
        	var sController   	= "/rtms/sd/listTireDetailInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_agencyPop=listTireDetailGrp";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_agencyPop.deleteAll();
        	sArgs += Ex.util.setParam("nodeNm", 	"listTireDetailGrp");	//리턴받을 DstaSet이름
        	sArgs += Ex.util.setParam("petternCd", 	this.div_search.edt_searchKeyword.value);			//코드
        	sArgs += Ex.util.setParam("saleCd", 	this.div_search.edt_searchKeyword00.value);			//Sale코드

        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 조회결과 더블클릭 이벤트 처리
         */
        this.grid_agency_oncelldblclick = function(obj,e){
        	this.FN_choice();
        }

        /**
         * 닫기 버튼의 클릭 이벤트 처리
         */
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }

        var showmodalRetVal = "";

        this.setRetVal = function(res ){
        	showmodalRetVal = res;
        }
        this.Button00_onclick = function(obj,e)		//>버튼
        {
        	var cnt = this.ds_agencyPop.rowcount;	
        	var rNow = this.grd_Group.currentrow;
        	var checkCnt = 0;
        	for(var i=cnt;i>0;i--){	
        	checkCnt++
        	}
        	    if(checkCnt == 0) {
        		alert("조회하실 제품을 선택해주세요.");
        		return;
           }  
        	var petternCd = this.ds_agencyPop.getColumn(rNow,"petternCd");
        	/*var standard = this.ds_agencyPop.getColumn(rNow,"standard");*/
        	var matCd = this.ds_agencyPop.getColumn(rNow,"matCd");
        	/*var matNm = this.ds_agencyPop.getColumn(rNow,"matNm");*/
        	var regDt = this.ds_agencyPop.getColumn(rNow,"regDt");

        	var idx = this.ds_agencyPop00.addRow();
        	this.ds_agencyPop00.setColumn(idx,"petternCd",petternCd);
        	/*this.ds_agencyPop00.setColumn(idx,"standard",standard);*/
        	this.ds_agencyPop00.setColumn(idx,"matCd",matCd);
         	/*this.ds_agencyPop00.setColumn(idx,"matNm",matNm);*/
         	this.ds_agencyPop00.setColumn(idx,"regDt",regDt);
         		
        	this.ds_agencyPop.deleteRow(rNow);
        	
          	
        	
        }

        this.Button01_onclick = function(obj,e)		//<버튼
        {
        	var cnt = this.ds_agencyPop00.rowcount;	
        	var rNow = this.grd_Group00.currentrow;
        	
        	var checkCnt = 0;
        	for(var i=cnt;i>0;i--){	
        	checkCnt++
        	}
        	if(checkCnt == 0) {
        		alert("제외하실 제품을 선택해주세요.");
        		return;
           }
                	
        	var petternCd = this.ds_agencyPop00.getColumn(rNow,"petternCd");
        	/*var standard = this.ds_agencyPop00.getColumn(rNow,"standard");	*/
        	var matCd = this.ds_agencyPop00.getColumn(rNow,"matCd");
        	/*var matNm = this.ds_agencyPop00.getColumn(rNow,"matNm");*/
        	var regDt = this.ds_agencyPop00.getColumn(rNow,"regDt");
        	
        	var idx = this.ds_agencyPop.addRow();
        		
        	this.ds_agencyPop.setColumn(idx,"petternCd",petternCd);
        	/*this.ds_agencyPop.setColumn(idx,"standard",standard);*/
        	this.ds_agencyPop.setColumn(idx,"matCd",matCd);
        	/*this.ds_agencyPop.setColumn(idx,"matNm",matNm);*/
        	this.ds_agencyPop.setColumn(idx,"regDt",regDt);
        	
        	this.ds_agencyPop00.deleteRow(rNow);
        	
        	
        }

        this.btn_choice_onclick = function(obj,e)
        {
        	
        	this.ds_agencyPop00.set_updatecontrol(false);
        	for( var i = 0 ; i < this.ds_agencyPop00.getRowCount() ; i++){
        		this.ds_agencyPop00.setRowType(i, Dataset.ROWTYPE_INSERT);
        	}
        	this.ds_agencyPop00.set_updatecontrol(true);
        	
        	
        	
        	if( confirm( "저장하시겠습니까?") ){

        	for(var i=0;i<this.ds_agencyPop00.getRowCount();i++){
        	this.ds_agencyPop00.setColumn(i,"saleCd",nvl(this.div_search.edt_searchKeyword00.value));
        	}
        	console.log(this.ds_agencyPop00.saveXML());
        	var sSvcID        	= "saveTireDetail";
         	var sController   	= "/ntrms/sd/saveTireDetail.do";
         	var sInDatasets   	= "dssaveTireDetail=ds_agencyPop00:A";
         	var sOutDatasets  	= "";
         	var sArgs 			= "";
         	var fn_callBack		= "fn_callBack";

         	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
         	
        	}
        }

        
        this.FN_search2 = function(){
        	var petternCd		= this.div_search.edt_searchKeyword.value;
        	var sSvcID        	= "listTireDetailInfo2";                    
        	var sController   	= "/rtms/sd/listTireDetailInfo2.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_agencyPop00=listTireDetailGrp2";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_agencyPop.deleteAll();
        	sArgs += Ex.util.setParam("nodeNm", 	"listTireDetailGrp2");	//리턴받을 DstaSet이름
        	sArgs += Ex.util.setParam("saleCd", 	this.div_search.edt_searchKeyword00.value);			//Sale코드
        	sArgs += Ex.util.setParam("petternCd", 	this.div_search.edt_searchKeyword.value);			//코드
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMAgency_pop_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search.btn_search_onclick, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_searchKeyword.addEventHandler("oneditclick", this.div_search_edt_searchKeyword_oneditclick, this);
            this.div_search.edt_searchKeyword00.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_searchKeyword00.addEventHandler("oneditclick", this.div_search_edt_searchKeyword_oneditclick, this);
            this.div_search.edt_searchKeyword01.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_searchKeyword01.addEventHandler("oneditclick", this.div_search_edt_searchKeyword_oneditclick, this);
            this.div_search.edt_searchKeyword02.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_searchKeyword02.addEventHandler("oneditclick", this.div_search_edt_searchKeyword_oneditclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.Button02.addEventHandler("onclick", this.Button00_onclick, this);
            this.Button03.addEventHandler("onclick", this.Button01_onclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);

        };

        this.loadIncludeScript("RTCOMMTireDetail_pop.xfdl");

       
    };
}
)();

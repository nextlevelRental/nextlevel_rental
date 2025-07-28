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
                this.set_name("RTCSCarMaster_pop");
                this.set_classname("RTCMPrice_pop");
                this.set_titletext("Mr. Roadian 조회");
                this._setFormPosition(0,0,600,490);
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
            obj._setContents("<ColumnInfo><ConstColumn id=\"carmasterNu\" type=\"STRING\" size=\"30\" value=\"\"/><ConstColumn id=\"carmasterNm\" type=\"STRING\" size=\"30\" value=\"\"/><ConstColumn id=\"salesGroup\" type=\"STRING\" size=\"30\" value=\"\"/><ConstColumn id=\"salesOffice\" type=\"STRING\" size=\"30\" value=\"\"/><ConstColumn id=\"agencyCd\" type=\"STRING\" size=\"30\" value=\"\"/><ConstColumn id=\"mobNo\" type=\"STRING\" size=\"30\" value=\"\"/><ConstColumn id=\"telNo\" type=\"STRING\" size=\"30\" value=\"\"/><ConstColumn id=\"strDay\" type=\"STRING\" size=\"30\" value=\"\"/><ConstColumn id=\"endDay\" type=\"STRING\" size=\"30\" value=\"\"/><ConstColumn id=\"useYn\" type=\"STRING\" size=\"30\" value=\"\"/><ConstColumn id=\"street\" type=\"STRING\" size=\"30\" value=\"\"/><ConstColumn id=\"rentalGroup\" type=\"STRING\" size=\"30\" value=\"\"/><ConstColumn id=\"rentalGroupNm\" type=\"STRING\" size=\"30\" value=\"\"/><ConstColumn id=\"rentalOffice\" type=\"STRING\" size=\"30\" value=\"\"/><ConstColumn id=\"rentalOfficeNm\" type=\"STRING\" size=\"30\" value=\"\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "10", null, "45", "10", null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, "9", "45", "22", "66", null, this.div_search);
            obj.set_taborder("2");
            obj.set_text("검색");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchModel", "absolute", "20", "11", "111", "20", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_text("Mr. Roadian");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("Ed_carmasterNm", "absolute", "22.22%", "10", null, "21", "53.47%", null, this.div_search);
            obj.set_taborder("4");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("80");
            obj.set_tooltiptext("edit");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_excel", "absolute", null, "9", "45", "22", "18", null, this.div_search);
            obj.set_taborder("5");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grid_price", "absolute", "10", "65", null, "385", "10", null, this);
            obj.set_taborder("1");
            obj.set_binddataset("dsList");
            obj.set_cellsizingtype("col");
            obj.set_readonly("false");
            obj.set_cellmovingtype("col");
            obj.set_cellclickbound("control");
            obj.set_autofittype("none");
            obj.set_nodatatext("조회된 데이터가 없습니다");
            obj.set_autoenter("select");
            obj.style.set_padding("0 0 0 0");
            obj.style.set_align("center");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"112\"/><Column size=\"100\"/><Column size=\"70\"/><Column size=\"70\"/><Column size=\"60\"/><Column size=\"110\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"300\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"Mr. Roadian 사번\"/><Cell col=\"1\" text=\"Mr. Roadian 명\"/><Cell col=\"2\" text=\"렌탈지사\"/><Cell col=\"3\" text=\"렌탈지점\"/><Cell col=\"4\" text=\"대리점\"/><Cell col=\"5\" text=\"휴대폰번호\"/><Cell col=\"6\" text=\"전화번호\"/><Cell col=\"7\" text=\"입사일\"/><Cell col=\"8\" text=\"퇴사일\"/><Cell col=\"9\" text=\"근무여부\"/><Cell col=\"10\" text=\"주소\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" edittype=\"none\" text=\"bind:carmasterNu\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"none\" text=\"bind:carmasterNm\"/><Cell col=\"2\" displaytype=\"normal\" edittype=\"none\" text=\"bind:rentalGroupNm\"/><Cell col=\"3\" displaytype=\"normal\" edittype=\"none\" text=\"bind:rentalOfficeNm\"/><Cell col=\"4\" displaytype=\"normal\" edittype=\"none\" text=\"bind:agencyCd\"/><Cell col=\"5\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:mobNo\"/><Cell col=\"6\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:telNo\"/><Cell col=\"7\" displaytype=\"normal\" edittype=\"none\" text=\"bind:strDay\"/><Cell col=\"8\" displaytype=\"normal\" edittype=\"none\" text=\"bind:endDay\"/><Cell col=\"9\" displaytype=\"normal\" edittype=\"none\" text=\"bind:useYn\"/><Cell col=\"10\" displaytype=\"normal\" edittype=\"none\" text=\"bind:street\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "460", "41", "21", "55", null, this);
            obj.set_taborder("3");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "460", "41", "21", "10", null, this);
            obj.set_taborder("4");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 600, 490, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMPrice_pop");
            		p.set_titletext("Mr. Roadian 조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSCarMaster_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSCarMaster_pop.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSCarMaster_pop.xfdl
         * 설    명 : 미스터로디안 조회(팝업)
         * 작 성 자 : 
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2017-06-22	wjim		[20170622_02] '근무여부' 조회조건 추가
         * 2017-12-08	wjim		[20171208_01] '휴대폰번호','전화번호' Copy & Paste 기능 추가
         * 2017-12-18	wjim		[20171218_01] 엑셀 다운로드 기능 추가
         ***************************************************************************************************/

        //include "lib::comLib.xjs";
        this.args = "";

        
        this.RTCMPrice_pop_onload = function(obj,e)
        {
        	Ex.core.init(obj);
        	this.fn_init();
        	
        	
        }

        this.fn_init = function(){
        	var sSvcID      	= "listBrandCombo";  
        	var sController   	= "rtms/comm/listBrandCombo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_brand=output1";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.div_search_cb_searchBrand_onitemchanged = function(obj,e)
        {
        	var cbSearchBrandlVal 	= nvl(this.div_search.cb_searchBrand.value);
        	var sSvcID      	= "listModelCombo";  
        	var sController   	= "rtms/comm/listModelCombo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_model=mapModelCombo";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	if( cbSearchBrandlVal != "" ){
        		sArgs += Ex.util.setParam("makerCd", cbSearchBrandlVal);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        

        this.div_search_cb_searchModel_onitemchanged = function(obj,e)
        {
        	var nRow1 = this.ds_model.findRow( "rn", this.div_search.cb_searchModel.value );
        	var nRow2 = this.ds_model.findRow( "mcNm", this.div_search.cb_searchModel.text );
        	if( nvl(nRow1) != "" && nvl(nRow2) != "" ){
        		this.grid_model.selectRow( nRow1 );
        	}
        }

        
        //검색버튼
        this.div_search_btn_search_onclick = function(obj,e)
        {
        	var carmasterNm = nvl(this.div_search.Ed_carmasterNm.value);
        	var	useYn = this.parent.p_useYn;
        	
        	// 근무여부 조회조건 [20170622_02]
        	// - 파라미터가 null 이면 근무여부 'Y'인 건만 조회
        	// - 파라미터가 'A'이면 근무여부 관계없이 조회
        	if (nvl(useYn) == "") {
        		useYn = "Y";
        	} else if (useYn == "A") {
        		useYn = "";
        	}

        	/*if( carmasterNm == "" ){
        		alert( "미스터로디안명 값이 없습니다.");
        		return;
        	}*/
        	var sSvcID        	= "carmasterPopUp";                    
        	var sController   	= "ntrms/cs/carmasterPopUp.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsList.deleteAll();
        	
        	sArgs += Ex.util.setParam("carmasterNm", carmasterNm);	// 로디안명
        	sArgs += Ex.util.setParam("useYn", useYn);				// 근무여부 [20170622_02]
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        }

        /**
         * '엑셀' 버튼의 클릭 이벤트 처리
         */
        this.div_search_btn_excel_onclick = function(obj,e) {
        	if (this.dsList.getRowCount() == 0) {
        		this.alert("다운로드할 데이터가 없습니다.");
        		return false;
        	}
        	
        	Ex.core.exportExcel(this, this.grid_price, "로디안목록");
        }

        //Grid 더블클릭 event
        this.grid_product_oncelldblclick = function(obj,e)
        {
        	this.FN_choice();
        }

        
        //선택버튼
        this.btn_choice_onclick = function(obj,e)
        {
        	this.FN_choice();
        }

        //선택 event
        this.FN_choice = function(){
        	var idx = this.dsList.rowposition;
        	var carmasterNu 	= this.dsList.getColumn(idx, "carmasterNu");
        	var carmasterNm 	= this.dsList.getColumn(idx, "carmasterNm");
        	
        	if( idx != -1 ){
        		if( this.parent.p_formId == "RTCSCarMaster" ){
        			if( nvl(carmasterNu) != "" && nvl(carmasterNm) != "" ){
        				var val1 = carmasterNu;
        				var val2 = carmasterNm;
        				this.close(this.opener.returnCarmaster(val1, val2));
        			}
        		}
        	}else{
        		alert("선택된 데이터가 없습니다.");
        	}
        	
        }
        //닫기 버튼
        this.btn_close_onclick = function(obj,e)
        {
        	this.close();
        }

        //enter 검색키
        this.div_search_Ed_carmasterNm_onkeyup = function(obj,e)
        {
        	
        }
        //esc 키
        this.RTCSCarMaster_pop_onkeyup = function(obj,e)
        {
        	if(e.keycode == 27){
        		this.close();
        	}
        }

        /***********************************************************************************
        * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        ***********************************************************************************/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt)
        {
        	if( strSvcId == "carmasterPopUp" ){
        		var dsBrandRowCt = this.ds_brand.getRowCount();
        		if( dsBrandRowCt != 0 ){
        			
        		}
        	}
        }

        this.div_search_Ed_carmasterNm_onkillfocus = function(obj,e)
        {
        	
        }

        this.div_search_Ed_carmasterNm_onchanged = function(obj,e)
        {
        	this.div_search_btn_search_onclick();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onkeyup", this.RTCSCarMaster_pop_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search_btn_search_onclick, this);
            this.div_search.Ed_carmasterNm.addEventHandler("ontextchanged", this.div_search_Ed_carmasterNm_ontextchanged, this);
            this.div_search.Ed_carmasterNm.addEventHandler("onchanged", this.div_search_Ed_carmasterNm_onchanged, this);
            this.div_search.btn_excel.addEventHandler("onclick", this.div_search_btn_excel_onclick, this);
            this.grid_price.addEventHandler("oncelldblclick", this.grid_product_oncelldblclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCSCarMaster_pop.xfdl");

       
    };
}
)();

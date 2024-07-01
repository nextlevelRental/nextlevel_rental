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
                this.set_name("RTSDAddProduct_pop");
                this.set_classname("RTSDAddProduct_pop");
                this.set_titletext("제품추가");
                this._setFormPosition(0,0,800,430);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_agencyPop", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"saleGdsCd\" type=\"STRING\" size=\"256\"/><Column id=\"standard\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_cnt", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_period", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_agencyPop_Cp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_searchKeyword", "absolute", "67", "10", "214", "20", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "284", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_text("렌탈기간");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "460", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_text("타이어본수");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("Combo00", "absolute", "358", "10", "90", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("29");
            obj.set_innerdataset("@ds_period");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Combo("Combo01", "absolute", "542", "10", "90", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("30");
            obj.set_innerdataset("@ds_cnt");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Edit("edt_searchKeyword01", "absolute", "179", "10", "102", "20", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_searchKeyword00", "absolute", "67", "10", "106", "20", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grd_Group", "absolute", "10", "65", null, "326", "10", null, this);
            obj.set_taborder("4");
            obj.set_binddataset("ds_agencyPop");
            obj.set_autofittype("col");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"48\"/><Column size=\"58\"/><Column size=\"56\"/><Column size=\"0\"/><Column size=\"0\"/><Column size=\"76\"/><Column size=\"68\"/><Column size=\"66\"/><Column size=\"0\"/><Column size=\"97\"/><Column size=\"49\"/><Column size=\"68\"/><Column size=\"50\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"패턴코드\"/><Cell col=\"2\" text=\"규격\"/><Cell col=\"3\" text=\"비밀번호\"/><Cell col=\"4\" displaytype=\"normal\" text=\"대리점아이디\"/><Cell col=\"5\" text=\"상품코드\"/><Cell col=\"6\" text=\"상품명\"/><Cell col=\"7\" text=\"랜탈 기간\"/><Cell col=\"8\" text=\"사용자 그룹\"/><Cell col=\"9\" text=\"계절구분\"/><Cell col=\"10\" text=\"본수\"/><Cell col=\"11\" text=\"렌탈등록비\"/><Cell col=\"12\" text=\"월렌탈료\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" text=\"bind:saleGdsCd\"/><Cell col=\"2\" text=\"bind:standard\"/><Cell col=\"3\" displaytype=\"none\" text=\"bind:password\"/><Cell col=\"4\" text=\"bind:agentId\"/><Cell col=\"5\" text=\"bind:matCd\"/><Cell col=\"6\" text=\"bind:matNm\"/><Cell col=\"7\" text=\"bind:periodNm\"/><Cell col=\"8\" text=\"bind:userGrp\"/><Cell col=\"9\" text=\"bind:seasonNm\"/><Cell col=\"10\" text=\"bind:cntCd\"/><Cell col=\"11\" text=\"bind:regiAmt\"/><Cell col=\"12\" text=\"bind:amt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "397", "41", "21", "10", null, this);
            obj.set_taborder("6");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "397", "41", "21", "54", null, this);
            obj.set_taborder("7");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);


            
            // Layout Functions
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
            obj = new Layout("default", "", 800, 430, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDAddProduct_pop");
            		p.set_titletext("제품추가");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDAddProduct_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDAddProduct_pop.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDAddProduct_pop.xfdl
         * 설    명 : 상품(제품)정보 조회 (팝업)
          ***************************************************************************************************/

        //include "lib::comLib.xjs";

        this.fv_opYn = "";	// 온라인장착 가능여부

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.form_onload = function(obj,e)	{

        	Ex.core.init(obj);
        	if(this.parent.p_formId == "RTSDContractRegister"){
        	
        	this.div_search.edt_searchKeyword00.set_value(this.parent.p_makerTxt);
        	this.div_search.edt_searchKeyword01.set_value(this.parent.p_modelTxt);
        	this.div_search.edt_searchKeyword.set_value(this.parent.p_modelCd);
        	}		
        	this.fn_init();		
        	// 모화면에서 온라인장착 가능여부 파라미터를 받았는지 확인하여 전역변수로 세팅
        	// - 받지않은 경우 null로 처리하여 가능여부와 관계없이 모두 조회되도록 함
        	if (this.parent.p_opYn == "Y" || this.parent.p_opYn == "N") {
        		this.fv_opYn = this.parent.p_opYn;
        	}
        }

        this.fn_init = function(){
        	var sSvcID      	= "initProductPriceCombo";  
        	var sController   	= "rtms/comm/initProductPriceCombo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= " ";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sOutDatasets += " ds_period=mapPeriod ";
        	sOutDatasets += " ds_cnt=mapCnt ";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 키입력 이벤트 처리
         * - ESC 키 입력 시 닫기
         */
        this.RTSDAddProduct_pop_onkeyup = function(obj,e)	{
        	if(e.keycode == 27){
        		this.close();
        	}
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){
        	if( strSvcId == "listAddProduct" ){
        	this.ds_agencyPop.addColumn("chk", "string", 256);
        		var ct = this.ds_agencyPop.rowcount;
        		if( ct != 0 ){
        		
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grid_agency.set_nodatatext("조회된 데이터가 없습니다.");
        			this.div_search.ed_searchAgency.setFocus();
        		}
        	}
        	
        	if (strSvcId=="initProductPriceCombo") {
        		var modelCd 	= nvl(this.parent.p_modelCd);
        		var contentsCd 	= nvl(this.parent.p_contentsCd);

        		var sSvcID        	= "initCombosetMat";                    
        		var sController   	= "rtms/comm/combosetMat.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_combosetMat=mapCombosetMat";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("modelCd"   , modelCd);
        		sArgs += Ex.util.setParam("contentsCd", contentsCd);
        				
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		
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
        	
        	/*var modelCd 		= nvl(this.ds_model.getColumn(idx, "modelCd"));*/
        	var sSvcID        	= "listAddProduct";                    
        	var sController   	= "/listAddProduct.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_agencyPop=listAddProductGrp";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_agencyPop.deleteAll();
        	sArgs += Ex.util.setParam("nodeNm", 	"listAddProductGrp");	//리턴받을 DstaSet이름
        	sArgs += Ex.util.setParam("modelCd", 	this.div_search.edt_searchKeyword.value);			//코드
        	sArgs += Ex.util.setParam("periodCd", 	this.div_search.Combo00.value);			//코드
        	sArgs += Ex.util.setParam("cntCd", 	this.div_search.Combo01.value);			//코드	
        	
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
        this.btn_choice_onclick = function(obj,e)
        {
        	var result 		= "";
        	var res			= "";
        	var idx 		= this.ds_agencyPop.rowposition;
        	var nCnt = this.ds_agencyPop.getRowCount();
        	
        		for( var i = 0 ; i < nCnt ; i++){
        			if(this.ds_agencyPop.getColumn(i,"chk",1)==1){
        				var nRow = this.ds_agencyPop_Cp.addRow();
        				this.ds_agencyPop_Cp.setColumn(nRow,"matCd",this.ds_agencyPop.getColumn(i,"matCd"));
        				this.ds_agencyPop_Cp.setColumn(nRow,"matNm",this.ds_agencyPop.getColumn(i,"matNm"));
        				this.ds_agencyPop_Cp.setColumn(nRow,"periodNm",this.ds_agencyPop.getColumn(i,"periodNm"));
        				this.ds_agencyPop_Cp.setColumn(nRow,"seasonNm",this.ds_agencyPop.getColumn(i,"seasonNm"));
        				this.ds_agencyPop_Cp.setColumn(nRow,"cntCd",this.ds_agencyPop.getColumn(i,"cntCd"));
        				this.ds_agencyPop_Cp.setColumn(nRow,"regiAmt",this.ds_agencyPop.getColumn(i,"regiAmt"));
        				this.ds_agencyPop_Cp.setColumn(nRow,"amt",this.ds_agencyPop.getColumn(i,"amt"));				
        			}
        		}
        		var arr = [this.ds_agencyPop_Cp];
        		this.close(this.opener._setReturn(arr));
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
            this.div_search.edt_searchKeyword01.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_searchKeyword01.addEventHandler("oneditclick", this.div_search_edt_searchKeyword_oneditclick, this);
            this.div_search.edt_searchKeyword00.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_searchKeyword00.addEventHandler("oneditclick", this.div_search_edt_searchKeyword_oneditclick, this);
            this.grd_Group.addEventHandler("oncelldblclick", this.selectUserInfo, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);

        };

        this.loadIncludeScript("RTSDAddProduct_pop.xfdl");

       
    };
}
)();

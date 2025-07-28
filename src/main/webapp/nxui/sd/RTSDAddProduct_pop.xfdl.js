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
                this.set_scrollbars("none");
                this._setFormPosition(0,0,996,478);
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
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"prsPk\" type=\"STRING\" size=\"256\"/><Column id=\"saleGdsCd\" type=\"STRING\" size=\"256\"/><Column id=\"standard\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"groupSale\" type=\"STRING\" size=\"256\"/><Column id=\"chnlSale\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"frNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

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

            obj = new Dataset("ds_period", this);
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

            obj = new Dataset("ds_agencyPop_Cp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"prsPk\" type=\"STRING\" size=\"256\"/><Column id=\"saleGdsCd\" type=\"STRING\" size=\"256\"/><Column id=\"standard\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiCd\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"amt\" type=\"STRING\" size=\"256\"/><Column id=\"groupSale\" type=\"STRING\" size=\"256\"/><Column id=\"chnlSale\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"frNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_frCd", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_seasonCd", this);
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

            obj = new Dataset("ds_combosetPettern", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"saleGdsCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_combosetStan", this);
            obj._setContents("<ColumnInfo><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"petternCd\" type=\"STRING\" size=\"256\"/><Column id=\"sectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"specNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Div("div_search", "absolute", "10", "10", null, "84", "10", null, this);
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
            obj = new Edit("edt_modelCd", "absolute", "746", "56", "50", "20", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchPeriod", "absolute", "425", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_text("렌탈기간");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCnt", "absolute", "668", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_text("타이어본수");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_searchPeriod", "absolute", "523", "10", "90", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("29");
            obj.set_innerdataset("@ds_period");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Combo("cb_searchCnt", "absolute", "750", "10", "90", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("30");
            obj.set_innerdataset("@ds_cnt");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("-1");
            obj = new Edit("edt_makerTxt", "absolute", "115", "10", "133", "20", null, null, this.div_search);
            obj.set_taborder("32");
            obj.set_enable("false");
            obj.set_visible("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_saleCd", "absolute", "801", "56", "98", "20", null, null, this.div_search);
            obj.set_taborder("33");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_contentsCd", "absolute", "692", "56", "51", "20", null, null, this.div_search);
            obj.set_taborder("34");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_frCd", "absolute", "907", "56", "51", "20", null, null, this.div_search);
            obj.set_taborder("36");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchOrdDay00", "absolute", "20", "38", "75", "21", null, null, this.div_search);
            obj.set_taborder("39");
            obj.set_text("계절구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_seasonCd", "absolute", "115", "38", "92", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("40");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_seasonCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_readonly("false");
            obj = new Static("st_searchPettern", "absolute", "226", "38", "43", "21", null, null, this.div_search);
            obj.set_taborder("41");
            obj.set_text("패턴");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_petternCd", "absolute", "289", "38", "115", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("42");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_combosetPettern");
            obj.set_codecolumn("saleGdsCd");
            obj.set_datacolumn("saleGdsCd");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_readonly("false");
            obj.set_enable("true");
            obj.set_enableevent("true");
            obj = new Static("st_searchSpec", "absolute", "424", "38", "80", "21", null, null, this.div_search);
            obj.set_taborder("43");
            obj.set_text("규격");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_specCd", "absolute", "524", "38", "128", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("44");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("@ds_combosetStan");
            obj.set_codecolumn("specNm");
            obj.set_datacolumn("specNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_readonly("false");
            obj = new Edit("edt_modelTxt", "absolute", "251", "9", "153", "20", null, null, this.div_search);
            obj.set_taborder("45");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_cntCd", "absolute", "907", "38", "51", "20", null, null, this.div_search);
            obj.set_taborder("46");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_periodCd", "absolute", "848", "32", "51", "20", null, null, this.div_search);
            obj.set_taborder("47");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grd_Group", "absolute", "10", "113", null, "326", "10", null, this);
            obj.set_taborder("4");
            obj.set_binddataset("ds_agencyPop");
            obj.set_autofittype("col");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"48\"/><Column size=\"82\"/><Column size=\"89\"/><Column size=\"0\"/><Column size=\"66\"/><Column size=\"76\"/><Column size=\"252\"/><Column size=\"66\"/><Column size=\"0\"/><Column size=\"76\"/><Column size=\"49\"/><Column size=\"85\"/><Column size=\"75\"/><Column size=\"80\"/><Column size=\"85\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"패턴코드\"/><Cell col=\"2\" text=\"규격\"/><Cell col=\"3\" text=\"비밀번호\"/><Cell col=\"4\" displaytype=\"normal\" text=\"전후구분\"/><Cell col=\"5\" text=\"상품코드\"/><Cell col=\"6\" text=\"상품명\"/><Cell col=\"7\" text=\"랜탈 기간\"/><Cell col=\"8\" text=\"사용자 그룹\"/><Cell col=\"9\" text=\"계절구분\"/><Cell col=\"10\" text=\"본수\"/><Cell col=\"11\" text=\"렌탈등록비\"/><Cell col=\"12\" text=\"월렌탈료\"/><Cell col=\"13\" text=\"단체할인\"/><Cell col=\"14\" text=\"판매채널할인\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" text=\"bind:saleGdsCd\"/><Cell col=\"2\" text=\"bind:standard\"/><Cell col=\"3\" displaytype=\"none\" text=\"bind:password\"/><Cell col=\"4\" text=\"bind:frNm\"/><Cell col=\"5\" text=\"bind:matCd\"/><Cell col=\"6\" text=\"bind:matNm\"/><Cell col=\"7\" text=\"bind:periodNm\"/><Cell col=\"8\" text=\"bind:userGrp\"/><Cell col=\"9\" text=\"bind:seasonNm\"/><Cell col=\"10\" text=\"bind:cntNm\"/><Cell col=\"11\" text=\"bind:regiAmt\"/><Cell col=\"12\" text=\"bind:amt\"/><Cell col=\"13\" text=\"bind:groupSale\"/><Cell col=\"14\" text=\"bind:chnlSale\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "445", "41", "21", "10", null, this);
            obj.set_taborder("6");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", null, "445", "41", "21", "54", null, this);
            obj.set_taborder("7");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 84, this.div_search,
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
            obj = new Layout("default", "", 996, 478, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDAddProduct_pop");
            		p.set_titletext("제품추가");
            		p.set_scrollbars("none");

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
        this.parent.p_perioCd="";
        this.wheelQty = "";
        this.wheelQtyLt = "";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.form_onload = function(obj,e)	{

        	Ex.core.init(obj);
        	if(this.parent.p_formId == "RTSDContractRegister" || this.parent.p_formId =="RTSDDirectOrder"){	
        		this.div_search.edt_makerTxt.set_value(this.parent.p_makerTxt);
        		this.div_search.edt_modelTxt.set_value(this.parent.p_modelTxt);
        		this.div_search.edt_modelCd.set_value(this.parent.p_modelCd);
        		this.div_search.edt_contentsCd.set_value(this.parent.p_contentsCd);
        		this.div_search.edt_saleCd.set_value(this.parent.p_saleCd);
        		this.div_search.edt_frCd.set_value(this.parent.p_frCd);
        		this.div_search.edt_cntCd.set_value(this.parent.p_cntCd);
        		this.div_search.edt_periodCd.set_value(this.parent.p_periodCd);
        	}
        	this.fn_WheelQty();
        	this.fn_WheelQtyLt();
        	this.fn_init(); 

        	// 모화면에서 온라인장착 가능여부 파라미터를 받았는지 확인하여 전역변수로 세팅
        	// - 받지않은 경우 null로 처리하여 가능여부와 관계없이 모두 조회되도록 함
        	if (this.parent.p_opYn == "Y" || this.parent.p_opYn == "N") {
        		this.fv_opYn = this.parent.p_opYn;
        	}

        	if(nvl(this.div_search.edt_periodCd.value) != ""){
        		this.div_search.cb_searchPeriod.set_value(this.parent.p_periodCd);  // 개월수 를 받아와서 선택
        		this.div_search.cb_searchPeriod.set_readonly(true);	
        	}else{
        		this.div_search.cb_searchPeriod.set_readonly(false);	
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
        	sOutDatasets += " ds_seasonCd=mapSeasonCd ";
        	/*sOutDatasets += " ds_frCd=mapFrCd ";*/
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.FN_init2 = function(){
        	if( nvl(this.parent.p_seasonCd) != "" ){		
        		this.div_search.cb_seasonCd.set_value(this.parent.p_seasonCd);
        		this.FN_postSeasonCdSelect(this.parent.p_seasonCd);		
        		this.div_search.cb_seasonCd.set_readonly(true);		
        	}else{
        		
        		// 대리점 정보의 계절구분이 '4계절'인 경우 계절구분을 '4계절'로 고정
        		if( this.agencySeasonCd == "01" ){
        			this.div_search.cb_seasonCd.set_value("01");
        			this.div_search.cb_seasonCd.set_enable(false);
        			// 패턴, 규격 drill-down 처리
        			this.FN_postSeasonCdSelect("01");
        		}else{
        			this.div_search.cb_seasonCd.set_enable(true);
        		}
        	}
        	//this.FN_listProduct("1");												// 박정석 대리 요청으로 최초 자동조회 기능 삭제
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
        this.fn_WheelQty = function(){

        	var modelCd = this.div_search.edt_modelCd.value;
        	var contentsCd = this.div_search.edt_contentsCd.value;
        	var frCd =this.div_search.edt_frCd.value;
        	
        	var sSvcID        	= "wheelQty";
        	var sController   	= "/rtms/sd/wheelQty.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("modelCd", 		modelCd);
        	sArgs += Ex.util.setParam("contentsCd", 	contentsCd);
        	sArgs += Ex.util.setParam("frCd", 			frCd);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        this.fn_WheelQtyLt = function(){

        	var modelCd = this.div_search.edt_modelCd.value;
        	var contentsCd = this.div_search.edt_contentsCd.value;
        	var frCd =this.div_search.edt_frCd.value;
        	
        	var sSvcID        	= "wheelQtyLt";
        	var sController   	= "/rtms/sd/wheelQtyLt.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("modelCd", 		modelCd);
        	sArgs += Ex.util.setParam("contentsCd", 	contentsCd);
        	sArgs += Ex.util.setParam("frCd", 			frCd);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
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
        		var saleCd 	= nvl(this.div_search.edt_saleCd.value);
        		var sSvcID        	= "initCombosetStan";                    
        		var sController   	= "rtms/comm/combosetStan.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_combosetStan=mapCombosetMat";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("saleCd", saleCd);
        		sArgs += Ex.util.setParam("modelCd", this.parent.p_modelCd);
        		sArgs += Ex.util.setParam("contentCd", this.parent.p_contentsCd);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);		
        	}
        	if( strSvcId=="initCombosetStan" ){
        		var seasonCdCnt = this.ds_seasonCd.getRowCount();
        		if( seasonCdCnt != 0 ){
        			// 계절구분 조회조건에 '전체'추가
        			var insert = this.ds_seasonCd.insertRow( 0 );
        			this.ds_seasonCd.setColumn(insert,"cd"," ");
        			this.ds_seasonCd.setColumn(insert,"cdNm","전체");
        			this.div_search.cb_seasonCd.set_value( " " );
        			
        			if( this.userGrp == "05"){
        				var sSvcID        	= "initProductPriceGetSeason";                    
        				var sController   	= "rtms/comm/initProductPriceGetSeason.do";
        				var sInDatasets   	= "";
        				var sOutDatasets  	= "";
        				var sArgs 			= "";	
        				var fn_callBack		= "fn_callBack";
        				sArgs += Ex.util.setParam("agentId", this.agentId);
        				Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        			}else{
        				this.FN_init2();
        			}
        		}
        	}
        	
        	if (strSvcId=="initCombosetPettern") {
        	}
        	if(strSvcId == "wheelQty"){		
        	}
        	if(strSvcId == "wheelQtyLt"){
        		this.ds_cnt.filter("cd <="+this.wheelQtyLt);
        	}
        }

        /**
         * 조회 버튼의 클릭 이벤트 처리
         */
        this.div_search.btn_search_onclick = function(obj,e){

        	if(nvl(this.div_search.cb_searchPeriod.value) == ""){
        		this.alert("렌탈기간을 선택하세요");
        		return;
        	}
        	if(nvl(this.div_search.cb_searchCnt.value) == ""){
        		this.alert("타이어본수를 선택하세요");
        		return;
        	}
        	this.FN_search();
        }

        /**
         * 조회
         */
        this.FN_search = function(){
        	var sSvcID        	= "listAddProduct";                    
        	var sController   	= "/rtms/sd/listAddProduct.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_agencyPop=listAddProductGrp";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_agencyPop.deleteAll();
        	sArgs += Ex.util.setParam("nodeNm", 	"listAddProductGrp");								//리턴받을 DstaSet이름
        	sArgs += Ex.util.setParam("modelCd", 	this.div_search.edt_modelCd.value);			//차량모델
        	sArgs += Ex.util.setParam("periodCd", 	this.div_search.cb_searchPeriod.value);						//렌탈기간
        	sArgs += Ex.util.setParam("cntCd", 		this.div_search.cb_searchCnt.value);						//타이어본수	
        	sArgs += Ex.util.setParam("saleCd", 	this.div_search.edt_saleCd.value);			//상품코드
        	sArgs += Ex.util.setParam("contentsCd", this.div_search.edt_contentsCd.value);			//모델상세코드	
        	sArgs += Ex.util.setParam("frCd", 		this.div_search.edt_frCd.value);						//장착위치
        	sArgs += Ex.util.setParam("seasonCd", 	this.div_search.cb_seasonCd.value);						//계절구분
        	sArgs += Ex.util.setParam("petternCd", 	this.div_search.cb_petternCd.value);						//패턴
        	sArgs += Ex.util.setParam("specCd", 	this.div_search.cb_specCd.value);						//패턴

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
        	this.ds_agencyPop_Cp.clearData(); 
        	var result 		= "";
        	var res			= "";
        	var idx 		= this.ds_agencyPop.rowposition;
        	var nCnt 		= this.ds_agencyPop.getRowCount();
        	var qty 		= parseInt(nvl(this.wheelQty,0));  

        	var cntCd = parseInt(nvl(this.div_search.edt_cntCd.value)==""?"0":this.div_search.edt_cntCd.value);
        	//alert("장착가능타이어 수 " + qty + " :: 현재 제품추가된 타이어수 " + cntCd);
        		for( var i = 0 ; i < nCnt ; i++){
        			if(this.ds_agencyPop.getColumn(i,"chk")==1){								
        				var nRow = this.ds_agencyPop_Cp.addRow();
        				this.ds_agencyPop_Cp.copyRow(nRow,this.ds_agencyPop, i);				
        			}
        		}
        		if(parseInt(this.getTotCntCdPop())+parseInt(cntCd) > qty ){
        			this.alert("선택가능한 타이어 본수는 최대"+qty+"본 입니다.");
        			return;
        		}
        		
        		if(this.getFrCdChkPop()){
        			this.alert("동일한 앞, 뒤 타이어 선택은 불가능합니다. 단 범용제외");
        			return;
        		}
        		
        		var arr = [this.ds_agencyPop_Cp];
        		this.close(this.opener._setReturn(arr));
        }

        
        // 타이어본수 계산
        this.getTotCntCdPop = function(){
        	var totCntCd = 0;
        	for(var i=0; i< this.ds_agencyPop_Cp.rowcount; i++){
        		if(this.ds_agencyPop_Cp.getColumn(i, "cntCd") !== undefined && this.ds_agencyPop_Cp.getColumn(i, "cntCd") != "" ){
        			totCntCd += parseInt(this.ds_agencyPop_Cp.getColumn(i, "cntCd")); 
        		}	
        	}
        	return totCntCd;
        } 

        // 타이어장착위치 검증
        this.getFrCdChkPop = function(){
        	var frCdChkP = false;
        	var temp = "";
        	for(var i=0; i< this.ds_agencyPop_Cp.rowcount; i++){
        	
        		if(nvl(this.ds_agencyPop_Cp.getColumn(i, "frCd")) != "" && this.ds_agencyPop_Cp.getColumn(i, "frCd") != "Z"){
        			if(temp != this.ds_agencyPop_Cp.getColumn(i, "frCd")){
        				temp = this.ds_agencyPop_Cp.getColumn(i, "frCd");
        			}else{
        				frCdChkP = true;
        				break;
        			}
        		}	
        	}	
        	return frCdChkP;
        } 

        this.div_search_cb_seasonCd_onitemchanged = function(obj,e)
        {
        	this.FN_postSeasonCdSelect(e.postvalue);
        }

        this.FN_postSeasonCdSelect = function(pSeasonCd) {
        	// 관련 조회조건 dataset 초기화
         	this.ds_combosetPettern.clearData();				// 패턴
         	this.ds_combosetStan.clearData();					// 규격
        	
        	// 계절구분에 부합하는 패턴 조회조건 생성
        	this.FN_makePetternCombo(pSeasonCd);
        	
        	// 관련 조회조건 선택값 초기화
        	//this.div_search.cb_petternCd.set_index(0);	// 패턴
        	//this.div_search.cb_specCd.set_index(0);		// 규격	
        }

        this.FN_makePetternCombo = function(seasonCd) {
         	var saleCd 	= nvl(this.div_search.edt_saleCd.value);

         	var sSvcID        	= "initCombosetPettern2";
         	var sController   	= "rtms/sd/combosetPettern.do";
         	var sInDatasets   	= "";
         	var sOutDatasets  	= "ds_combosetPettern=mapCombosetPettern";
         	var sArgs 			= "";
         	var fn_callBack		= "fn_callBack";
         	
         	sArgs += Ex.util.setParam("saleCd", saleCd);
        	sArgs += Ex.util.setParam("seasonCd", seasonCd);
        	sArgs += Ex.util.setParam("modelCd", 	this.div_search.edt_modelCd.value);
        	sArgs += Ex.util.setParam("contentsCd",  this.div_search.edt_contentsCd.value);
        	sArgs += Ex.util.setParam("periodCd", 	this.div_search.cb_searchPeriod.value);	
        	sArgs += Ex.util.setParam("frCd", 		this.div_search.edt_frCd.value);						//장착위치
        	sArgs += Ex.util.setParam("cntCd", 		this.div_search.cb_searchCnt.value);						//타이어본수	
        	
         	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.div_search_cb_petternCd_onitemchanged = function(obj,e)
        {
        	this.ds_combosetStan.clearData();					// 규격
        	// 조회
        	this.FN_makeSpecCombo(this.div_search.cb_seasonCd.value, e.postvalue);
        	// 관련 조회조건 선택값 초기화
        	this.div_search.cb_specCd.set_index(0);		// 규격
        }
        this.FN_makeSpecCombo = function(seasonCd,petternCd) {
        		
        	var saleCd 	= nvl(this.div_search.edt_saleCd.value);
        	var sSvcID        	= "initCombosetStan2";
        	var sController   	= "rtms/comm/combosetStan.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_combosetStan=mapCombosetMat";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("saleCd", saleCd);
        	sArgs += Ex.util.setParam("seasonCd", seasonCd);
        	sArgs += Ex.util.setParam("petternCd", petternCd);
        	sArgs += Ex.util.setParam("modelCd", 	this.div_search.edt_modelCd.value);
        	sArgs += Ex.util.setParam("contentsCd",  this.div_search.edt_contentsCd.value);
        	sArgs += Ex.util.setParam("periodCd", 	this.div_search.cb_searchPeriod.value);	
        	sArgs += Ex.util.setParam("frCd", 		this.div_search.edt_frCd.value);						//장착위치
        	sArgs += Ex.util.setParam("cntCd", 		this.div_search.cb_searchCnt.value);						//타이어본수	
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);	
        }
        this.grd_Group_oncellclick = function(obj,e)
        {
        	for (var i=0; i<=this.ds_agencyPop.rowcount; i++) {
        		if(this.ds_agencyPop.rowposition == i) {
        			this.ds_agencyPop.setColumn(this.ds_agencyPop.rowposition ,"chk","1");
        		}else {
        			this.ds_agencyPop.setColumn(i,"chk","0");
        		}
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMAgency_pop_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.div_search.btn_search_onclick, this);
            this.div_search.edt_modelCd.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_modelCd.addEventHandler("oneditclick", this.div_search_edt_searchKeyword_oneditclick, this);
            this.div_search.cb_searchPeriod.addEventHandler("onitemchanged", this.div_search_cb_searchPeriod_onitemchanged, this);
            this.div_search.edt_makerTxt.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_makerTxt.addEventHandler("oneditclick", this.div_search_edt_searchKeyword_oneditclick, this);
            this.div_search.edt_saleCd.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_saleCd.addEventHandler("oneditclick", this.div_search_edt_searchKeyword_oneditclick, this);
            this.div_search.edt_contentsCd.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_contentsCd.addEventHandler("oneditclick", this.div_search_edt_searchKeyword_oneditclick, this);
            this.div_search.edt_frCd.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_frCd.addEventHandler("oneditclick", this.div_search_edt_searchKeyword_oneditclick, this);
            this.div_search.cb_seasonCd.addEventHandler("onitemchanged", this.div_search_cb_seasonCd_onitemchanged, this);
            this.div_search.cb_petternCd.addEventHandler("onitemchanged", this.div_search_cb_petternCd_onitemchanged, this);
            this.div_search.edt_modelTxt.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_modelTxt.addEventHandler("oneditclick", this.div_search_edt_searchKeyword_oneditclick, this);
            this.div_search.edt_cntCd.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_cntCd.addEventHandler("oneditclick", this.div_search_edt_searchKeyword_oneditclick, this);
            this.div_search.edt_periodCd.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.edt_periodCd.addEventHandler("oneditclick", this.div_search_edt_searchKeyword_oneditclick, this);
            this.grd_Group.addEventHandler("oncellclick", this.grd_Group_oncellclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);

        };

        this.loadIncludeScript("RTSDAddProduct_pop.xfdl");

       
    };
}
)();

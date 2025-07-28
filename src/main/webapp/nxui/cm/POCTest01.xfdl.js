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
                this.set_name("POCTest01");
                this.set_classname("POCTest01");
                this.set_titletext("PoC 테스트");
                this._setFormPosition(0,0,1147,768);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_carClassCd", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_carMaker", this);
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_carModel", this);
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_contents", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_frCd", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtsd0004", this);
            obj._setContents("<ColumnInfo><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"sectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"wheelQty\" type=\"STRING\" size=\"256\"/><Column id=\"wheelLimitQty\" type=\"STRING\" size=\"256\"/><Column id=\"classCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_detail", this);
            obj._setContents("<ColumnInfo><Column id=\"id\" type=\"STRING\" size=\"256\"/><Column id=\"sw\" type=\"STRING\" size=\"256\"/><Column id=\"ar\" type=\"STRING\" size=\"256\"/><Column id=\"inch\" type=\"STRING\" size=\"256\"/><Column id=\"maker\" type=\"STRING\" size=\"256\"/><Column id=\"pattern\" type=\"STRING\" size=\"256\"/><Column id=\"idxRr\" type=\"STRING\" size=\"256\"/><Column id=\"idxWet\" type=\"STRING\" size=\"256\"/><Column id=\"sale\" type=\"STRING\" size=\"256\"/><Column id=\"scrRr\" type=\"STRING\" size=\"256\"/><Column id=\"scrWet\" type=\"STRING\" size=\"256\"/><Column id=\"scrSale\" type=\"STRING\" size=\"256\"/><Column id=\"scrTot\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "10", "1126", "49", null, null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_contentsCd", "absolute", "661", "12", "47", "21", null, null, this.div_search);
            obj.set_taborder("75");
            obj.set_text("사양");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_contentsCd", "absolute", "762", "12", "92", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("76");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_contents");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("");
            obj = new Edit("ed_frCd", "absolute", "276", "-10", "81", "21", null, null, this.div_search);
            obj.set_taborder("77");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_modelCd", "absolute", "80", "-10", "84", "21", null, null, this.div_search);
            obj.set_taborder("78");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_contentsCd", "absolute", "172", "-10", "104", "21", null, null, this.div_search);
            obj.set_taborder("79");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_carModelCd", "absolute", "421", "12", "45", "21", null, null, this.div_search);
            obj.set_taborder("81");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_carGubunCd", "absolute", "20", "12", "75", "21", null, null, this.div_search);
            obj.set_taborder("82");
            obj.set_text("차량분류");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "0", "1102", "12", null, null, this.div_search);
            obj.set_taborder("84");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "37", null, null, this.div_search);
            obj.set_taborder("86");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "95", "0", "20", "37", null, null, this.div_search);
            obj.set_taborder("87");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "401", "0", "20", "35", null, null, this.div_search);
            obj.set_taborder("88");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "466", "0", "20", "37", null, null, this.div_search);
            obj.set_taborder("89");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "640", "0", "20", "35", null, null, this.div_search);
            obj.set_taborder("90");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "742", "0", "20", "36", null, null, this.div_search);
            obj.set_taborder("91");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "1102", "0", "20", "37", null, null, this.div_search);
            obj.set_taborder("92");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "1077", "0", "20", "35", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "206", "0", "20", "36", null, null, this.div_search);
            obj.set_taborder("99");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "290", "0", "20", "36", null, null, this.div_search);
            obj.set_taborder("101");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_carClassCd", "absolute", "115", "12", "92", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("103");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_carClassCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_carMakerCd", "absolute", "227", "12", "66", "21", null, null, this.div_search);
            obj.set_taborder("104");
            obj.set_text("제조사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_carMakerCd", "absolute", "309", "12", "92", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("105");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_carMaker");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Combo("cb_carModelCd", "absolute", "485", "12", "155", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("106");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_carModel");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("st_frCd", "absolute", "873", "12", "65", "21", null, null, this.div_search);
            obj.set_taborder("107");
            obj.set_text("전후구분");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "854", "0", "20", "36", null, null, this.div_search);
            obj.set_taborder("108");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_frCd", "absolute", "968", "11", "109", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("109");
            obj.set_displaynulltext("선택");
            obj.set_innerdataset("ds_frCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Static("Static15", "absolute", "948", "8", "20", "27", null, null, this.div_search);
            obj.set_taborder("113");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "33", "1122", "12", null, null, this.div_search);
            obj.set_taborder("114");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grid_productAndPrice", "absolute", "11", "66", "285", "406", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_rtsd0004");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"단면폭\"/><Cell col=\"1\" text=\"편평비\"/><Cell col=\"2\" text=\"인치\"/></Band><Band id=\"body\"><Cell text=\"bind:sectionWidth\"/><Cell col=\"1\" text=\"bind:aspectRatio\"/><Cell col=\"2\" text=\"bind:wheelInches\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_productAndPrice00", "absolute", "307", "66", "829", "406", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_detail");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"101\"/><Column size=\"200\"/><Column size=\"51\"/><Column size=\"55\"/><Column size=\"68\"/><Column size=\"55\"/><Column size=\"57\"/><Column size=\"59\"/><Column size=\"71\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"제조사\"/><Cell col=\"1\" text=\"패턴\"/><Cell col=\"2\" text=\"RR지수\"/><Cell col=\"3\" text=\"WET지수\"/><Cell col=\"4\" text=\"판가\"/><Cell col=\"5\" text=\"RR점수\"/><Cell col=\"6\" text=\"WET점수\"/><Cell col=\"7\" text=\"판가점수\"/><Cell col=\"8\" text=\"총점수\"/></Band><Band id=\"body\"><Cell text=\"bind:maker\"/><Cell col=\"1\" text=\"bind:pattern\"/><Cell col=\"2\" text=\"bind:idxRr\"/><Cell col=\"3\" text=\"bind:idxWet\"/><Cell col=\"4\" text=\"bind:sale\"/><Cell col=\"5\" text=\"bind:scrRr\"/><Cell col=\"6\" text=\"bind:scrWet\"/><Cell col=\"7\" text=\"bind:scrSale\"/><Cell col=\"8\" text=\"bind:scrTot\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1126, 49, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 768, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("POCTest01");
            		p.set_titletext("PoC 테스트");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("POCTest01.xfdl", "lib::comLib.xjs");
        this.registerScript("POCTest01.xfdl", function() {
        //include "lib::comLib.xjs";

        this.toDay = "";

        this.POCTest01_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.parent.setButton("S", this);
        	this.fn_initYmd();
        	this.fn_init();
        }

        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		case "initProductPriceCombo":
        		
        			this.ds_period.insertRow(0);
        			this.ds_period.setColumn(0, "cd","");
        			this.ds_period.setColumn(0, "cdNm","전체");
        			
        			this.fn_resetCombo(this.div_search.cb_period);
        			
        			this.ds_seasonCd.insertRow(0);
        			this.ds_seasonCd.setColumn(0, "cd","");
        			this.ds_seasonCd.setColumn(0, "cdNm","전체");
        			
        			this.fn_resetCombo(this.div_search.cb_seasonCd);
        			
        			this.ds_cnt.insertRow(0);
        			this.ds_cnt.setColumn(0, "cd","");
        			this.ds_cnt.setColumn(0, "cdNm","전체");
        			
        			this.fn_resetCombo(this.div_search.cb_cnt);
        			
        			break;
        			
        		case "sRtsd0004ContentsSelect":
        				
        			for(var i=0; i<this.ds_contents.rowcount; i++){
        				if(nvl(this.ds_contents.getColumn(i, "cdNm")) == ""){
        					this.ds_contents.setColumn(i, "cdNm", "사양없음");
        				}
        			}
        			
        			break;
        			
        		case "sRtsd0004FrCdSelect":
        		
        			//조회한 전후구분코드로 세팅
        			for(var i=0; i<this.ds_frCd.rowcount;i++){
        				if(nvl(this.ds_frCd.getColumn(i, "cd")) == "Z"){
        					this.ds_frCd.setColumn(i, "cdNm", "구분없음");
        				}
        			}
        			
        			this.fn_resetCombo(this.div_search.cb_frCd);
        			
        			break;

        		case "sRtsd0004Select":
        			
        			if(this.ds_rtsd0004.rowcount == 0){
        				this.grid_productAndPrice.set_nodatatext("조회된 데이터가 존재 하지 않습니다.");
        			}
        				
        			break;		
        			
        		case "listPocScore":
        			
        			if(this.ds_detail.rowcount == 0){
        				this.grid_productAndPrice00.set_nodatatext("조회된 데이터가 존재 하지 않습니다.");
        			}
        				
        			break;
        		
        		default:
        			break;
        	}
        }

        /**
         * 서버기준 오늘 날자 조회 후 세팅
         */
        this.fn_initYmd = function() {
        	var sSvcID      	= "getToday";  
        	var sController   	= "ntrms/re/getDayMongth.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        this.fn_init = function() {
        	var sSvcID      	= "initProductPriceCombo";  
        	var sController   	= "rtms/comm/initProductPriceCombo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= " ";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sOutDatasets += " ds_carClassCd=mapCarGubun ";
        	sOutDatasets += " ds_carMaker=mapBrand ";
        	sOutDatasets += " ds_period=mapPeriod ";
        	sOutDatasets += " ds_cnt=mapCnt ";
        	sOutDatasets += " ds_seasonCd=mapSeasonCd ";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 콤보박스 컨트롤 초기화
         */
        this.fn_resetCombo = function(cbObj) {	
        	cbObj.set_index(-1);
        	cbObj.value = "";
        }

        //차량분류 변경
        this.div_search_cb_carClassCd_onitemchanged = function(obj,e)
        {
        	if(nvl(this.div_search.cb_carMakerCd.value) != ""){
        		this.div_search_cb_carMakerCd_onitemchanged();
        	}
        }

        //제조사에 해당하는 차종종류
        this.div_search_cb_carMakerCd_onitemchanged = function(obj,e)
        {
        	var sSvcID        	= "sRtsd0001ModelSelect";                    
        	var sController   	= "/rtms/sd/sRtsd0001ModelByClassSelect.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_carModel=modelSearchMap";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("makerCd",  nvl(this.div_search.cb_carMakerCd.value));
        	sArgs += Ex.util.setParam("classCd",  nvl(this.div_search.cb_carClassCd.value));
        	
        	this.ds_carModel.clearData();
        	this.ds_contents.clearData();
        	this.ds_frCd.clearData();
        	
        	this.fn_resetCombo(this.div_search.cb_carModelCd);
        	this.fn_resetCombo(this.div_search.cb_contentsCd);	
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //차종분류,차종에 해당하는 사양종류
        this.div_search_cb_carModelCd_onitemchanged = function(obj,e)
        {	
        	var sSvcID        	= "sRtsd0004ContentsSelect";                    
        	var sController   	= "/rtms/sd/sRtsd0004ContentsCdSelect.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_contents=contentsCdSearchMap";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("modelCd",  nvl(this.div_search.cb_carModelCd.value));
        	sArgs += Ex.util.setParam("classCd",  nvl(this.div_search.cb_carClassCd.value));
        	sArgs += Ex.util.setParam("useYn",  "Y");
        	
        	this.ds_contents.clearData();
        	this.ds_frCd.clearData();
        	
        	this.fn_resetCombo(this.div_search.cb_contentsCd);
        		
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //차종분류,차종에 해당하는 전후구분
        this.div_search_cb_contentsCd_onitemchanged = function(obj,e)
        {
        	var sSvcID        	= "sRtsd0004FrCdSelect";                    
        	var sController   	= "/rtms/sd/sRtsd0004FrCdSelect.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_frCd=fdCdSearchMap";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("classCd",  nvl(this.div_search.cb_carClassCd.value));
        	sArgs += Ex.util.setParam("contentsCd",  nvl(this.div_search.cb_contentsCd.value));
        	sArgs += Ex.util.setParam("modelCd",  nvl(this.div_search.cb_carModelCd.value));
        	sArgs += Ex.util.setParam("useYn",  "Y");
        	
        	this.ds_frCd.clearData();
        		
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 조회 버튼의 클릭 이벤트 처리
         */
        this.fn_search = function(){
        	
        	if(nvl(this.div_search.cb_carClassCd.value) == ""){
        		this.alert("차량분류를 선택해주세요.");
        		return;
        	}
        	
        	if(nvl(this.div_search.cb_carMakerCd.value) == ""){
        		this.alert("제조사를 선택해주세요.");
        		return;
        	}
        	
        	if(nvl(this.div_search.cb_carModelCd.value) == ""){
        		this.alert("차량종류를 선택해주세요.");
        		return;
        	}
        	
        	if(nvl(this.div_search.cb_contentsCd.value) == ""){
        		this.alert("사양을 선택해주세요.");
        		return;
        	}
        	
        	this.ds_detail.clearData();
        	
        	var sSvcID        	= "sRtsd0004Select";                    
        	var sController   	= "/rtms/sd/sRtsd0004Select.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_rtsd0004=rtsd0004SearchMap";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("modelCd" 		,nvl(this.div_search.cb_carModelCd.value));
        	sArgs += Ex.util.setParam("contentsCd" 		,nvl(this.div_search.cb_contentsCd.value));
        	sArgs += Ex.util.setParam("frCd" 		,nvl(this.div_search.cb_frCd.value));
        	sArgs += Ex.util.setParam("classCd" 		,nvl(this.div_search.cb_carClassCd.value));
        	sArgs += Ex.util.setParam("useYn" 		,"Y");
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.grid_product_oncellclick = function(obj,e) {
        	var sSvcID        	= "listPocScore";                    
        	var sController   	= "/ntrms/cm/listPocScore.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_detail=listPocScore";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("sw", this.ds_rtsd0004.getColumn(e.row, "sectionWidth"));
        	sArgs += Ex.util.setParam("ar", this.ds_rtsd0004.getColumn(e.row, "aspectRatio"));
        	sArgs += Ex.util.setParam("inch", this.ds_rtsd0004.getColumn(e.row, "wheelInches"));	
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.POCTest01_onload, this);
            this.div_search.cb_contentsCd.addEventHandler("onitemchanged", this.div_search_cb_contentsCd_onitemchanged, this);
            this.div_search.Static01.addEventHandler("onclick", this.div_search_Static01_onclick, this);
            this.div_search.cb_carClassCd.addEventHandler("onitemchanged", this.div_search_cb_carClassCd_onitemchanged, this);
            this.div_search.cb_carMakerCd.addEventHandler("onitemchanged", this.div_search_cb_carMakerCd_onitemchanged, this);
            this.div_search.cb_carModelCd.addEventHandler("onitemchanged", this.div_search_cb_carModelCd_onitemchanged, this);
            this.div_search.cb_frCd.addEventHandler("onitemchanged", this.div_search_cb_searchPeriod_onitemchanged, this);
            this.grid_productAndPrice.addEventHandler("oncellclick", this.grid_product_oncellclick, this);
            this.grid_productAndPrice00.addEventHandler("oncellclick", this.grid_product_oncellclick, this);

        };

        this.loadIncludeScript("POCTest01.xfdl");

       
    };
}
)();

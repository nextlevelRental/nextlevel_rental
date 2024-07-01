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
                this.set_name("form");
                this.set_classname("Authority");
                this.set_titletext("상품등록");
                this._setFormPosition(0,0,1147,527);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsProduct", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"matCd\" type=\"string\" size=\"32\"/><Column id=\"demendQty\" type=\"bigdecimal\" size=\"16\"/><Column id=\"aspectRatio\" type=\"string\" size=\"32\"/><Column id=\"chgId\" type=\"string\" size=\"32\"/><Column id=\"pgCd\" type=\"string\" size=\"32\"/><Column id=\"sectionWidth\" type=\"string\" size=\"32\"/><Column id=\"useYn\" type=\"string\" size=\"32\"/><Column id=\"matNm\" type=\"string\" size=\"32\"/><Column id=\"chgDt\" type=\"string\" size=\"32\"/><Column id=\"petternCd\" type=\"string\" size=\"32\"/><Column id=\"regDt\" type=\"string\" size=\"32\"/><Column id=\"plyRating\" type=\"string\" size=\"32\"/><Column id=\"seasonCd\" type=\"string\" size=\"32\"/><Column id=\"regId\" type=\"string\" size=\"32\"/><Column id=\"wheelInches\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsPetternCd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"nm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsSectionWidth", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"nm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsAspectRatio", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"nm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsPlyRating", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"nm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsPgCd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"nm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsUseYn", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"nm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"nm\">사용</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"nm\">사용안함</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsSeasonCd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static56", "absolute", "748", "146", null, "31", "25", null, this);
            obj.set_taborder("108");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static57", "absolute", "748", "176", null, "31", "25", null, this);
            obj.set_taborder("109");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static55", "absolute", "748", "116", null, "31", "25", null, this);
            obj.set_taborder("107");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "0", "86", "1122", "31", null, null, this);
            obj.set_taborder("102");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "116", "749", "31", null, null, this);
            obj.set_taborder("50");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_BG", "absolute", "10", "0", null, "40", "-10", null, this);
            obj.set_cssclass("sta_WF_SearchBox");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("19");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "64", "21", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("상품코드");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("matCd", "absolute", "88", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_enable("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save00", "absolute", "207", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("21");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1118", "12", null, null, this.div_search);
            obj.set_taborder("22");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "0", "29", "1118", "12", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "61", "81", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("변경할 내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "527", null, null, this);
            obj.set_taborder("30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "374", "116", "130", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_text("단연폭");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "748", "116", "130", "31", null, null, this);
            obj.set_taborder("43");
            obj.set_text("편평비");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "0", "86", "130", "31", null, null, this);
            obj.set_taborder("46");
            obj.set_text("상품코드");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "0", "116", "130", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_text("패턴코드");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Edit("matCd", "absolute", "134", "91", "167", "21", null, null, this);
            obj.set_taborder("49");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "0", "146", "749", "31", null, null, this);
            obj.set_taborder("51");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("demendQty", "absolute", "882", "151", "235", "21", null, null, this);
            obj.set_taborder("52");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "748", "146", "130", "31", null, null, this);
            obj.set_taborder("53");
            obj.set_text("타이어소요량");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "374", "146", "130", "31", null, null, this);
            obj.set_taborder("55");
            obj.set_text("Pricing grp.");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "0", "146", "130", "31", null, null, this);
            obj.set_taborder("57");
            obj.set_text("PR(강도)");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "0", "176", "749", "31", null, null, this);
            obj.set_taborder("58");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "374", "176", "130", "31", null, null, this);
            obj.set_taborder("62");
            obj.set_text("계절구분");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "0", "176", "130", "31", null, null, this);
            obj.set_taborder("64");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Edit("matNm", "absolute", "305", "91", "442", "21", null, null, this);
            obj.set_taborder("75");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Combo("plyRating", "absolute", "134", "151", "236", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("104");
            obj.set_displayrowcount("5");
            obj.set_enable("false");
            obj.set_index("-1");

            obj = new Combo("useYn", "absolute", "134", "181", "236", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("105");
            obj.set_displayrowcount("5");
            obj.set_enable("true");
            obj.set_innerdataset("@dsUseYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("nm");
            obj.set_index("-1");

            obj = new Combo("petternCd", "absolute", "134", "121", "236", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("110");
            obj.set_displayrowcount("5");
            obj.set_enable("false");

            obj = new Combo("sectionWidth", "absolute", "508", "121", "236", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("111");
            obj.set_displayrowcount("5");
            obj.set_enable("false");

            obj = new Combo("aspectRatio", "absolute", "882", "121", "235", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("112");
            obj.set_displayrowcount("5");
            obj.set_tabstop("true");
            obj.set_enable("false");

            obj = new Combo("pgCd", "absolute", "508", "151", "236", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("113");
            obj.set_displayrowcount("5");
            obj.set_enable("false");

            obj = new Combo("seasonCd", "absolute", "508", "181", "236", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("114");
            obj.set_displayrowcount("5");
            obj.set_enable("true");
            obj.set_innerdataset("@dsSeasonCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Static("Static00", "absolute", "0", "45", "1147", "20", null, null, this);
            obj.set_taborder("115");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0%", "76", "1147", "10", null, null, this);
            obj.set_taborder("116");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("19");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");
            		p.set_scrollbars("none");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 527, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("상품등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item2","sectionWidth","value","dsProduct","sectionWidth");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","demendQty","value","dsProduct","demendQty");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","plyRating","value","dsProduct","plyRating");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","useYn","value","dsProduct","useYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","petternCd","value","dsProduct","petternCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","aspectRatio","value","dsProduct","aspectRatio");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","pgCd","value","dsProduct","pgCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","matCd","value","dsProduct","matCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","matNm","value","dsProduct","matNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","seasonCd","value","dsProduct","seasonCd");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDProduct.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDProduct.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "detailProductInfo" ){
        	
        	}
        	
        	if( strSvcId == "saveProductInfo" ){
        		alert(strErrorMsg);
        		if( nErrorCode < 0 ){
        		
        		}else{
        			this.fn_search();
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.form_onload = function(obj,e){
        	Ex.core.init(obj); 	
        	this.parent.setButton("C|S", this);/* 1. N : 신규추가 	* 2. S : 조회  		* 3. C : 데이타생성 		* 4. E : 엑셀데이타생성 */
        	this.getCommSeason();
        } 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.getCommSeason = function(){
        	var sSvcID        	= "getCommSeason";                    
        	var sController   	= "rtms/sd/getCommSeason.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsSeasonCd=ds_output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	var matCd = nvl(this.div_search.matCd.value);
        	if(matCd == ""){
        		alert("상품코드를 선택해주십시오");
        		return;
        	}else{
        		var sSvcID        	= "detailProductInfo";                    
        		var sController   	= "rtms/sd/detailProductInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsProduct=ds_output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += Ex.util.setParam("matCd", matCd);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(){
        	var rowtype = this.dsProduct.getRowType(0);
        	if(rowtype != 4) {
        		alert("변경된 자료가 없습니다.");
        		return false;
        	}else{
        		var sSvcID        	= "saveProductInfo";                    
        		var sController   	= "rtms/sd/saveProductInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "input=dsProduct:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.searchProeuctPop = function(obj,e){
        	var args ={p_formId :"RTSDCampReg" };
        	Ex.core.popup(this,"상품조회","comm::RTCOMMCampProductPopUp.xfdl",args, "modaless=false");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.returnProduct = function(arr) {
        	this.div_search.matCd.set_value(arr.cd);
        	this.fn_search();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_matCd_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.fn_search();
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("ontimer", this.form_ontimer, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.matCd.addEventHandler("onkeyup", this.div_search_matCd_onkeyup, this);
            this.div_search.btn_save00.addEventHandler("onclick", this.searchProeuctPop, this);
            this.plyRating.addEventHandler("onitemchanged", this.div_search00_userGrp_onitemchanged, this);
            this.petternCd.addEventHandler("onitemchanged", this.div_search00_userGrp_onitemchanged, this);
            this.sectionWidth.addEventHandler("onitemchanged", this.div_search00_userGrp_onitemchanged, this);
            this.aspectRatio.addEventHandler("onitemchanged", this.div_search00_userGrp_onitemchanged, this);
            this.pgCd.addEventHandler("onitemchanged", this.div_search00_userGrp_onitemchanged, this);
            this.seasonCd.addEventHandler("onitemchanged", this.div_search00_userGrp_onitemchanged, this);

        };

        this.loadIncludeScript("RTSDProduct.xfdl");

       
    };
}
)();

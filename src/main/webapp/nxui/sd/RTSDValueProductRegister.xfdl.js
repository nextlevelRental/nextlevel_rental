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
                this.set_titletext("부가제품등록");
                this._setFormPosition(0,0,1147,496);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsPrice", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"addGdsCd\" type=\"string\"/><Column id=\"addGdsNm\" type=\"string\"/><Column id=\"amt\" type=\"string\"/><Column id=\"makerNm\" type=\"string\"/><Column id=\"gdsGb\" type=\"string\"/><Column id=\"gdsDesc\" type=\"string\"/><Column id=\"gdsDescDt\" type=\"string\"/><Column id=\"regId\" type=\"string\"/><Column id=\"regDt\" type=\"string\"/><Column id=\"chgId\" type=\"string\"/><Column id=\"chgDt\" type=\"string\"/><Column id=\"gdsGrp\" type=\"string\"/><Column id=\"useYn\" type=\"string\"/><Column id=\"dcAmt\" type=\"string\"/><Column id=\"actAmt\" type=\"STRING\" size=\"256\"/><Column id=\"dcYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("comGrp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdDesc\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/><Column id=\"cd\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_yn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">판매중</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">판매중지</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_dcYn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">할부</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">할부불가</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("st_BG", "absolute", "10", "0", null, "40", "-10", null, this);
            obj.set_cssclass("sta_WF_SearchBox");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "45", null, null, this);
            obj.set_taborder("19");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "25", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("부가제품명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "270", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_text("제조사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_company", "absolute", "342", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_enable("true");
            obj.set_maxlength("100");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1118", "12", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "0", "33", "1118", "12", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_prodNm", "absolute", "119", "10", "124", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_enable("true");
            obj.set_maxlength("100");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "61", "81", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "0", "25", "45", null, null, this);
            obj.set_taborder("27");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "245", "0", "25", "44", null, null, this);
            obj.set_taborder("28");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("regiAmt", "absolute", "984", "440", "133", "21", null, null, this);
            obj.set_taborder("119");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "0", "85", "1122", "393", null, null, this);
            obj.set_taborder("127");
            obj.set_binddataset("dsPrice");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"240\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"350\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"부가제품명\"/><Cell col=\"1\" text=\"제조사\"/><Cell col=\"2\" text=\"금액\"/><Cell col=\"3\" text=\"할인금액\"/><Cell col=\"4\" text=\"실판매금액\"/><Cell col=\"5\" text=\"제품군\"/><Cell col=\"6\" text=\"할부여부\"/><Cell col=\"7\" text=\"사용구분\"/><Cell col=\"8\" text=\"제품설명\"/></Band><Band id=\"body\"><Cell edittype=\"normal\" style=\"align:left;\" text=\"bind:addGdsNm\"/><Cell col=\"1\" edittype=\"normal\" style=\"align:left;\" text=\"bind:makerNm\"/><Cell col=\"2\" displaytype=\"number\" edittype=\"masknumber\" style=\"align:right;\" text=\"bind:amt\" mask=\"###,###,###,##0\"/><Cell col=\"3\" displaytype=\"number\" edittype=\"masknumber\" style=\"align:right;\" text=\"bind:dcAmt\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;\" text=\"bind:actAmt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:gdsGrp\" combodataset=\"comGrp\" combocodecol=\"cd\" combodatacol=\"cdNm\" calendardisplaynulltype=\"none\"/><Cell col=\"6\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:dcYn\" combodataset=\"ds_dcYn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"7\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:useYn\" combodataset=\"ds_yn\" combocodecol=\"cd\" combodatacol=\"cdNm\" calendardisplaynulltype=\"none\"/><Cell col=\"8\" edittype=\"normal\" style=\"align:left;\" text=\"bind:gdsDesc\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "45", "1147", "20", null, null, this);
            obj.set_taborder("128");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "75", "1147", "10", null, null, this);
            obj.set_taborder("129");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "690", null, null, this);
            obj.set_taborder("130");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "479", "1147", "10", null, null, this);
            obj.set_taborder("132");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 45, this.div_search,
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
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("부가제품등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDValueProductRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDValueProductRegister.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 부가제품등록
         * 02. 그룹명   : 주문관리
         * 03. 그룹설명 :
         * 04. 작성일   : 2018.10.11
         * 05. 작성자   : Sean
         * 06. 수정이력 :
         ***********************************************************************
         *     수정일     작성자   내용
         ***********************************************************************
         * 완료 - ToDo.1. 신규연도일 경우에 대한 Max채번 로직 추가
         * 완료 - ToDo.2. [추가]시 중복건 체크
         * 완료 - ToDo.3. 할인금액입력시 실판매금액 변경
         * 불필요 - ToDo.4. [변경]시 키값 없는 경우 체크
         * ToDo.5. 제품구분(GDS_GB)은 2로 설정
         ***********************************************************************
         */

        /***********************************************************************************
         * 1. Script Include 
         ***********************************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************************
         * 2. FORM 변수 선언 영역
        ***********************************************************************************/
        	//팝업에서 전달받은 변수 저장
        	this.arr ;

        /***********************************************************************************
         * 3. Common Events and Functions
        ***********************************************************************************/
        	this.form_onload = function(obj,e)
        	{
        		/* 1. N : 신규추가
        		 * 2. S : 조회
        		 * 3. C : 데이타생성
        		 * 4. E : 엑셀데이타생성
        		 */
        		Ex.core.init(obj); 
        		this.parent.setButton("E|C|N|S", this);
        		this.listCommInfo(); //공통코드 조회(S210, 제품군)
        	} 
        	 
        /***********************************************************************************
        * 4. Transaction Functions
        ***********************************************************************************/
        //----------------------------------------------------------------------------------
        // Search
        //----------------------------------------------------------------------------------
        	this.fn_search = function()
        	{
        		this.dsPrice.clearData();
        		var sSvcID        	= "listProductInfo";                    
        		var sController   	= "/rtms/sd/listAddProductInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsPrice=ds_output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs 			+= Ex.util.setParam("addGdsNm",  nvl(this.div_search.edt_prodNm.value));
        			sArgs 			+= Ex.util.setParam("makerNm",   nvl(this.div_search.edt_company.value));
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        	
        //----------------------------------------------------------------------------------
        // Save
        //----------------------------------------------------------------------------------
        	this.fn_save = function()
        	{
        		if( !Ex.util.isUpdated(this.dsPrice)) {
        			alert('변경된 데이터가 없습니다.');
        			return false;
        		}

        		//Save Validation is not needed.

        		if( confirm( "저장하시겠습니까?") ){			
        			var sSvcID        	= "saveProductInfo";                    
        			var sController   	= "rtms/sd/saveAddProductInfo.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			sInDatasets   		= "input=dsPrice:U";
        			sOutDatasets  		= "";
        			var fn_callBack		= "fn_callBack";
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}

        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
        	//공통
        	this.listCommInfo = function()
        	{
        		var sSvcID        	= "listCommInfo";                    
        		var sController   	= "/rtms/sd/listAddProductCommInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "comGrp=com_grp";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}	
        	
        	
        /***********************************************************************************
        * 5. CallBack Functions
        ***********************************************************************************/	
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/

        	/* callBack함수 */
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{ 
        		if (nErrorCode < 0) {
        			alert(strErrorMsg);		
        		}
        		
        		if (strSvcId == "listProductInfo") {

        		}
        		
        		if (strSvcId == "saveProductInfo") {
        			alert(strErrorMsg);
        			this.fn_search();
        		}
        	}

        /***********************************************************************************
         * 6. User Functions
        ***********************************************************************************/
        /***********************************************************************************
        * Component Event
        ***********************************************************************************/
        	//=======================================
        	//검색 시 Enter키 이벤트 처리
        	//=======================================
        	this.div_search_edt_prodNm_onkeyup = function(obj,e){
        		if ( e.keycode == 13 ){
        			this.fn_search();
        		}
        	}

        	this.div_search_edt_company_onkeyup = function(obj,e)
        	{
        		if ( e.keycode == 13 ){
        			this.fn_search();
        		}		
        	}
        	
        	
        	
        //----------------------------------------------------------------------------------
        // Add
        //----------------------------------------------------------------------------------
        	this.fn_add = function() {
        		var row = this.dsPrice.addRow();
        		
         		this.dsPrice.setColumn(row, "dcAmt", 0);
         		this.dsPrice.setColumn(row, "gdsGb", "2");
         		this.dsPrice.setColumn(row, "useYn", "Y"); 		
        	}

        //----------------------------------------------------------------------------------
        // Excel
        //----------------------------------------------------------------------------------
        	this.fn_excel= function() {
        		Ex.core.exportExcel(this, this.Grid01);
        	}

        //----------------------------------------------------------------------------------
        // 칼럼변경시
        //----------------------------------------------------------------------------------
        	this.dsPrice_oncolumnchanged = function(obj,e)
        	{
        		var sColId = e.columnid;
        		var nRow = e.row;
        				
        		if(sColId == "dcAmt"){		//할인금액		
        			obj.setColumn(nRow, "actAmt", nvl(obj.getColumn(nRow, "amt"), 0) - nvl( obj.getColumn(nRow, "dcAmt"), 0));
        		}else if(sColId == "amt"){	//금액
        			obj.setColumn(nRow, "actAmt", nvl(obj.getColumn(nRow, "amt"), 0) - nvl( obj.getColumn(nRow, "dcAmt"), 0));
        		}
        	}
        	
        //----------------------------------------------------------------------------------
        // Save Validation
        //----------------------------------------------------------------------------------
        	this.fn_saveValidation = function() {
        		if(nvl(this.matCd.value) == "") {
        			alert("상품정보조회후 등록 해주십시오.");
        			return false;
        		}
        		
        		if(nvl(this.periodCd.value) == "") {
        			alert("기간코드 선택후 등록 해주십시오.");
        			return false;
        		}
        		
        		return true;
        	}	
        	
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.dsPrice.addEventHandler("oncolumnchanged", this.dsPrice_oncolumnchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.edt_company.addEventHandler("onkeyup", this.div_search_edt_company_onkeyup, this);
            this.div_search.edt_prodNm.addEventHandler("onkeyup", this.div_search_edt_prodNm_onkeyup, this);

        };

        this.loadIncludeScript("RTSDValueProductRegister.xfdl");

       
    };
}
)();

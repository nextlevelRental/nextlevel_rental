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
                this.set_titletext("렌탈마스터찾기팝업");
                this._setFormPosition(0,0,567,316);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rtmasterNu\" type=\"STRING\" size=\"0\"/><Column id=\"rtmasterNm\" type=\"STRING\" size=\"0\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"0\"/><Column id=\"regId\" type=\"STRING\" size=\"0\"/><Column id=\"regDt\" type=\"STRING\" size=\"0\"/><Column id=\"chgId\" type=\"STRING\" size=\"0\"/><Column id=\"chgDt\" type=\"STRING\" size=\"0\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsListCp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rtmasterNu\" type=\"STRING\" size=\"0\"/><Column id=\"rtmasterNm\" type=\"STRING\" size=\"0\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"0\"/><Column id=\"regId\" type=\"STRING\" size=\"0\"/><Column id=\"regDt\" type=\"STRING\" size=\"0\"/><Column id=\"chgId\" type=\"STRING\" size=\"0\"/><Column id=\"chgDt\" type=\"STRING\" size=\"0\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("st_BG", "absolute", "20", "2", null, "40", "4", null, this);
            obj.set_cssclass("sta_WF_SearchBox");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "2", "549", "45", null, null, this);
            obj.set_taborder("19");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "25", "12", "112", "20", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("렌탈 마스터 성명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "885", "12", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "0", "33", "885", "12", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_prodNm", "absolute", "143", "10", "124", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_enable("true");
            obj.set_maxlength("100");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, "9", "45", "22", "20", null, this.div_search);
            obj.set_taborder("25");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "63", "89", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "2", "33", "45", null, null, this);
            obj.set_taborder("27");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "279", "2", "33", "44", null, null, this);
            obj.set_taborder("28");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "10", "47", "557", "20", null, null, this);
            obj.set_taborder("128");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "10", "77", "557", "10", null, null, this);
            obj.set_taborder("129");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_choice", "absolute", "462", "287", "49", "21", null, null, this);
            obj.set_taborder("133");
            obj.set_text("선택");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "509", "287", "49", "21", null, null, this);
            obj.set_taborder("134");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid", "absolute", "10", "87", "550", "194", null, null, this);
            obj.set_taborder("135");
            obj.set_binddataset("dsList");
            obj.set_selecttype("row");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"0\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"렌탈마스터 사번\"/><Cell col=\"2\" text=\"렌탈마스터 성명\"/><Cell col=\"3\" text=\"휴대폰번호\"/><Cell col=\"4\" text=\"전화번호\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" style=\"align:center;\" text=\"bind:rtmasterNu\" editlimit=\"3\"/><Cell col=\"2\" edittype=\"none\" style=\"align:center;\" text=\"bind:rtmasterNm\" editlimit=\"100\"/><Cell col=\"3\" displaytype=\"normal\" edittype=\"none\" editfilter=\"integer\" style=\"align:center;\" text=\"bind:mobNo\" expr=\"expr:FN_numberMaskReturn(mobNo)\" combodataset=\"ds_yn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"4\" edittype=\"none\" editfilter=\"integer\" text=\"bind:telNo\" expr=\"expr:FN_numberMaskReturn(telNo)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 549, 45, this.div_search,
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
            obj = new Layout("default", "", 567, 316, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("렌탈마스터찾기팝업");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDRentalMasterPopup.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDRentalMasterPopup.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 렌탈마스터 찾기 팝업
         * 02. 그룹명   : 기준정보
         * 03. 그룹설명 :
         * 04. 작성일   : 2018.11.12
         * 05. 작성자   : Sean
         * 06. 수정이력 :
         ***********************************************************************
         *     수정일     작성자   내용
         ***********************************************************************
         * ToDo.1. 
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
        		Ex.core.init(obj); 
        		
        	} 
        	 
        /***********************************************************************************
        * 4. Transaction Functions
        ***********************************************************************************/
        	//----------------------------------------------------------------------------------
        	// Search
        	//----------------------------------------------------------------------------------
        	this.fn_search = function()
        	{
        		this.dsList.clearData();
        		
        		var sSvcID        	= "listRentalMaster";                    
        		var sController   	= "/rtms/sd/listRentalMaster.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList=ds_output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs 			+= Ex.util.setParam("rentalGroupNm", nvl(this.div_search.edt_prodNm.value));
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
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
        		
        		if (strSvcId == "listRentalMaster") {
        		
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
        	this.div_search_edt_prodNm_onkeyup = function(obj,e)
        	{
        		if ( e.keycode == 13 ){
        			this.fn_search();
        		}
        	}
        	
        	//----------------------------------------------------------------------------------
        	// Excel
        	//----------------------------------------------------------------------------------
        	this.fn_excel= function() {
        		Ex.core.exportExcel(this, this.Grid01);
        	}

        
        	//----------------------------------------------------------------------------------
        	// 선택
        	//----------------------------------------------------------------------------------
        	this.btn_choice_onclick = function(obj,e)
        	{
        		var nRow = this.dsList.rowcount;
        		if(nRow < 1) return false;
        		
        		this.dsListCp.clearData();
        		this.dsListCp.addRow();
        		this.dsListCp.copyRow(0, this.dsList, this.dsList.rowposition);
        		
        		var arr = [this.dsListCp];
        		this.close(this.opener._setReturnRentalMasterNm(arr));
        	}

        	this.Grid_oncelldblclick = function(obj,e)
        	{
        		//var arr = [obj.name];
        		var nRow = this.dsList.rowcount;
        		if(nRow < 1) return false;
        		
        		this.dsListCp.clearData();
        		this.dsListCp.addRow();
        		this.dsListCp.copyRow(0, this.dsList, this.dsList.rowposition);
        		
        		var arr = [this.dsListCp];		
        		this.close(this.opener._setReturnRentalMasterNm(arr));		
        	}

        	//----------------------------------------------------------------------------------
        	// 닫기
        	//----------------------------------------------------------------------------------
        	this.btn_close_onclick = function(obj,e)
        	{
        		this.close();
        	}	

        

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.edt_prodNm.addEventHandler("onkeyup", this.div_search_edt_prodNm_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.btn_choice.addEventHandler("onclick", this.btn_choice_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.Grid.addEventHandler("oncelldblclick", this.Grid_oncelldblclick, this);

        };

        this.loadIncludeScript("RTSDRentalMasterPopup.xfdl");

       
    };
}
)();

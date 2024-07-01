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
                this.set_titletext("렌탈마스터관리");
                this._setFormPosition(0,0,1147,496);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_yn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">렌탈마스터</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">관계없음</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsS030", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdDesc\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/><Column id=\"cd\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsS090", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdDesc\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/><Column id=\"cd\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsS091", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdDesc\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/><Column id=\"cd\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rtmasterNu\" type=\"STRING\" size=\"0\"/><Column id=\"rtmasterNm\" type=\"STRING\" size=\"0\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"0\"/><Column id=\"regId\" type=\"STRING\" size=\"0\"/><Column id=\"regDt\" type=\"STRING\" size=\"0\"/><Column id=\"chgId\" type=\"STRING\" size=\"0\"/><Column id=\"chgDt\" type=\"STRING\" size=\"0\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsListArea", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"0\"/><Column id=\"rtmasterNu\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"0\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"0\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"0\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"0\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"0\"/><Column id=\"regId\" type=\"STRING\" size=\"0\"/><Column id=\"regDt\" type=\"STRING\" size=\"0\"/><Column id=\"chgId\" type=\"STRING\" size=\"0\"/><Column id=\"chgDt\" type=\"STRING\" size=\"0\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsListAgent", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agencyCd\" type=\"STRING\" size=\"0\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"0\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"0\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"0\"/><Column id=\"telNo\" type=\"STRING\" size=\"0\"/><Column id=\"chanCd\" type=\"STRING\" size=\"0\"/><Column id=\"lifnr\" type=\"STRING\" size=\"0\"/><Column id=\"taxRqcd\" type=\"STRING\" size=\"0\"/><Column id=\"rentalYn\" type=\"STRING\" size=\"0\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"0\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"0\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"0\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"0\"/></ColumnInfo>");
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
            obj = new Static("st_searchCondition", "absolute", "25", "12", "88", "20", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("렌탈마스터명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
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
            obj = new Edit("edt_grpNm", "absolute", "127", "10", "124", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_enable("true");
            obj.set_maxlength("100");
            obj.set_readonly("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", "253", "10", "21", "21", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "61", "81", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("렌탈마스터");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "0", "25", "45", null, null, this);
            obj.set_taborder("27");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "309", "0", "25", "44", null, null, this);
            obj.set_taborder("28");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "0", "85", "1122", "60", null, null, this);
            obj.set_taborder("127");
            obj.set_binddataset("dsList");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_selecttype("cell");
            obj.set_fillareatype("none");
            obj.set_useselcolor("false");
            obj.set_scrollbars("none");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"0\"/><Column size=\"150\"/><Column size=\"240\"/><Column size=\"160\"/><Column size=\"102\"/><Column size=\"109\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"렌탈마스터 사번\"/><Cell col=\"2\" text=\"렌탈마스터 성명\"/><Cell col=\"3\" text=\"휴대폰번호\"/><Cell col=\"4\" text=\"전화번호\"/><Cell col=\"5\" text=\"렌탈 마스터 여부\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" edittype=\"normal\" editfilter=\"integer\" style=\"align:center;\" text=\"bind:rtmasterNu\" editlimit=\"10\"/><Cell col=\"2\" edittype=\"normal\" style=\"align:center;\" text=\"bind:rtmasterNm\" editlimit=\"100\"/><Cell col=\"3\" displaytype=\"normal\" edittype=\"normal\" editfilter=\"integer\" style=\"align:center;\" text=\"bind:mobNo\" expr=\"expr:FN_numberMaskReturn(mobNo)\" combodataset=\"ds_yn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"4\" edittype=\"normal\" editfilter=\"integer\" text=\"bind:telNo\" expr=\"expr:FN_numberMaskReturn(telNo)\"/><Cell col=\"5\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:useYn\" combodataset=\"ds_yn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/></Band></Format></Formats>");
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

            obj = new Grid("Grid03", "absolute", "331", "189", "794", "289", null, null, this);
            obj.set_taborder("139");
            obj.set_binddataset("dsListAgent");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"70\"/><Column size=\"70\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"구분\"/><Cell col=\"1\" text=\"판매인번호\"/><Cell col=\"2\" text=\"판매인명\"/><Cell col=\"3\" text=\"채널대분류\"/><Cell col=\"4\" text=\"채널중분류\"/><Cell col=\"5\" text=\"연락처\"/><Cell col=\"6\" text=\"렌탈지사\"/><Cell col=\"7\" text=\"렌탈지역\"/></Band><Band id=\"body\"><Cell displaytype=\"combo\" edittype=\"none\" style=\"align:center;\" text=\"bind:chanCd\" combodataset=\"dsS030\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"1\" edittype=\"none\" text=\"bind:agencyCd\" editlimit=\"4\"/><Cell col=\"2\" edittype=\"none\" text=\"bind:agencyNm\" editlimit=\"100\"/><Cell col=\"3\" displaytype=\"combo\" edittype=\"none\" style=\"align:center;\" text=\"bind:chanLclsCd\" combodataset=\"dsS090\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"4\" displaytype=\"combo\" text=\"bind:chanMclsCd\" combodataset=\"dsS091\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"5\" expr=\"expr:FN_numberMaskReturn(telNo)\"/><Cell col=\"6\" text=\"bind:rentalGroupNm\"/><Cell col=\"7\" text=\"bind:rentalOfficeNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "165", "89", "20", null, null, this);
            obj.set_taborder("142");
            obj.set_text("렌탈지역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "179", "1147", "10", null, null, this);
            obj.set_taborder("143");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "332", "165", "113", "20", null, null, this);
            obj.set_taborder("145");
            obj.set_text("소속 판매인");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid02", "absolute", "3", "189", "322", "289", null, null, this);
            obj.set_taborder("146");
            obj.set_binddataset("dsListArea");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"30\"/><Column size=\"140\"/><Column size=\"150\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"렌탈지사\"/><Cell col=\"2\" text=\"렌탈지역\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" edittype=\"none\" style=\"align:center;\" text=\"bind:rentalGroupNm\"/><Cell col=\"2\" edittype=\"none\" text=\"bind:rentalOfficeNm\" editlimit=\"100\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_addArea", "absolute", "175", "165", "101", "22", null, null, this);
            obj.set_taborder("147");
            obj.set_text("렌탈지역등록");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_del", "absolute", "279", "165", "45", "22", null, null, this);
            obj.set_taborder("148");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
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
            		p.set_titletext("렌탈마스터관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDRentalMaster.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDRentalMaster.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 렌탈마스터관리
         * 02. 그룹명   : 주문관리-기준정보
         * 03. 그룹설명 :
         * 04. 작성일   : 2018.11.05
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
        	
        	this.nuSeq = 0; //사번 시퀀스	

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
        		this.parent.setButton("N|C|S", this);
        		this.fn_searchCode(); //공통코드 조회(S030: 채널구분, S090: 채널 대분류, S091: 채널 중분류)
        		//this.div_search.edt_grpNm.setFocus();
        	}
        	 
        /***********************************************************************************
        * 4. Transaction Functions
        ***********************************************************************************/
        	//----------------------------------------------------------------------------------
        	// Search: 렌탈마스터 조회
        	//----------------------------------------------------------------------------------
        	this.fn_search = function()
        	{
        		this.dsList.clearData();
        		this.dsListArea.clearData();
        		this.dsListAgent.clearData();

        		var sRentalMasterNm = nvl(this.div_search.edt_grpNm.value);
        		if(Eco.isEmpty(sRentalMasterNm))
        		{
        			alert("렌탈마스터명이 없습니다.");
        			this.div_search.edt_grpNm.setFocus();
        			return false;
        		}
        		
        		var sSvcID        	= "listRentalMaster";                    
        		var sController   	= "/rtms/sd/listRentalMaster.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList=ds_output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs 			+= Ex.util.setParam("rentalGroupNm", nvl(this.div_search.edt_grpNm.value));
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}

        	//----------------------------------------------------------------------------------
        	// Search: 렌탈관리지역 조회
        	//----------------------------------------------------------------------------------
        	this.fn_searchMgmtArea = function()
        	{
        		if(!this.fn_searchMgmtAreaValidation()) return false;
        		
        		var sSvcID        	= "listMgmtArea";                    
        		var sController   	= "/rtms/sd/listRentalMgmtArea.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsListArea=ds_output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs 			+= Ex.util.setParam("rtMasterNu", nvl(this.dsList.getColumn(0, "rtmasterNu")));
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        	//----------------------------------------------------------------------------------
        	// Search: 소속판매인 조회
        	//----------------------------------------------------------------------------------
        	this.fn_searchSalesAgent = function()
        	{
        		if(!this.fn_searchSalesAgentValidation())	return false;
        		
        		var sSvcID        	= "listSalesAgent";                    
        		var sController   	= "/rtms/sd/listRentalSalesAgent.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsListAgent=ds_output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs 			+= Ex.util.setParam("rentalGroup", nvl(this.dsListArea.getColumn(0, "rentalGroup")));
        			sArgs 			+= Ex.util.setParam("rtMasterNu", nvl(this.dsList.getColumn(0, "rtmasterNu")));
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        	//----------------------------------------------------------------------------------
        	// 추가
        	//----------------------------------------------------------------------------------
        	this.fn_add = function() {
        		this.dsList.clearData();
        		this.dsList.addRow();
        		this.dsList.setColumn(0, "useYn", "Y");
        		
        		this.dsListArea.clearData();
        		//this.dsListArea.addRow();
        		
        		this.dsListAgent.clearData();
        		
        		//렌탈마스터 성명 focus
        		this.Grid01.setFocus();
        		this.Grid01.selectRow(0);
        		this.Grid01.setCellPos(1);		
        		
        	}

        	//----------------------------------------------------------------------------------
        	// Save
        	//----------------------------------------------------------------------------------
        	this.fn_save = function()
        	{
        		if(!this.fn_saveValidation())	return false;

        		if( confirm( "저장하시겠습니까?"))
        		{					
        			if(this.dsList.getRowType(0) == Dataset.ROWTYPE_INSERT)
        			{
        				this.div_search.edt_grpNm.set_value(nvl(this.dsList.getColumn(0, "rtmasterNm")));
        			}

        			this.fn_saveDetail();
        		}
        	}
        	
        	this.fn_saveDetail = function()
        	{
        		var sSvcID        	= "saveRentalMaster";                    
        		var sController   	= "/rtms/sd/saveRentalMaster.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		sInDatasets   		= "input1=dsList:U input2=dsListArea:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);	
        	}

        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
        	//공통
        	this.fn_searchCode = function()
        	{
        		var sSvcID        	= "searchCode";                    
        		var sController   	= "/rtms/sd/listRentalMasterCode.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsS030=dsS030 dsS090=dsS090 dsS091=dsS091";
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
        		
        		if (strSvcId == "listRentalMaster") { //렌탈마스터 조회
        			if(this.dsList.rowcount < 1)
        			{
        				//alert("조회된 데이터가 없습니다.");
        			}
        			else
        			{
        				this.fn_searchMgmtArea();	//렌탈관리지역 조회
        			}
        		}
        		
        		if (strSvcId == "listMgmtArea") { //렌탈관리지역 조회
        			if(this.dsListArea.rowcount	< 1)
        			{
        				//alert("조회된 데이터가 없습니다.");
        			}
        			else
        			{
        				for(var i=0; i<this.dsListArea.rowcount; i++){
        					this.dsListArea.setColumn(i, "chk", 0);
        				}
        				
        				this.dsListArea.set_updatecontrol(false);
        				for( var i = 0 ; i < this.dsListArea.rowcount ; i++ ){
        					this.dsListArea.setRowType(i, Dataset.ROWTYPE_NORMAL);
        				}
        				this.dsListArea.set_updatecontrol(true);
        				
        				this.fn_searchSalesAgent();	//소속판매인 조회
        			}
        		}
        		
        		if (strSvcId == "getNuSeq") { //사번 Seq
        			if(this.nuSeq == 0){
        				alert("사번시퀀스를 가져오지 못했습니다.");
        			}else{
        				//신규
        				this.dsList.setColumn(0, "rtmasterNu", this.nuSeq);				
        				this.dsList.set_updatecontrol(false);
        				this.dsList.setRowType(0, Dataset.ROWTYPE_INSERT);				
        				this.dsList.set_updatecontrol(true);
        				
        				this.div_search.edt_grpNm.set_value(nvl(this.dsList.getColumn(0, "rtmasterNm")));
        				
        				for(var i=0; i<this.dsListArea.rowcount; i++)
        				{
        					this.dsListArea.setColumn(i, "rtmasterNu", this.nuSeq);				
        					this.dsListArea.set_updatecontrol(false);
        					this.dsListArea.setRowType(i, Dataset.ROWTYPE_INSERT);				
        					this.dsListArea.set_updatecontrol(true);
        				}
        				
        				this.fn_saveDetail();
        			}
        		}
        				
        		if (strSvcId == "saveRentalMaster") { //저장
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
        	// 검색 시 Enter키 이벤트 처리
        	//=======================================
        	this.div_search_edt_grpNm_onkeyup = function(obj,e){
        		if ( e.keycode == 13 ){
        			this.fn_search();
        		}
        	}	

        	//----------------------------------------------------------------------------------
        	// [렌탈마스터명 찾기] 클릭: 팝업호출
        	//----------------------------------------------------------------------------------
        	this.fn_searchRentalMasterNm = function(obj,e)
        	{
        		var args ={p_argRentalMasterNm:""};
        		Ex.core.popup(this,"렌탈마스터찾기","sd::RTSDRentalMasterPopup.xfdl",args, "modaless=false");		
        	}

        	//----------------------------------------------------------------------------------
        	// 팝업반환값(렌탈마스터명 찾기)
        	//----------------------------------------------------------------------------------
        	this._setReturnRentalMasterNm = function(val){
        		var sDsNm = val[0];
        		var nRowCnt = sDsNm.rowcount;
        		
        		if ( nRowCnt > 0)
        		{			
        			this.div_search.edt_grpNm.set_value(sDsNm.getColumn(0, "rtmasterNm"));
        		}	
        	
        	}

        	//----------------------------------------------------------------------------------
        	// [렌탈지역등록] 클릭: 팝업호출
        	//----------------------------------------------------------------------------------
        	this.btn_addArea_onclick = function(obj,e)
        	{
        		var args ={p_argGrpNo:""};
        		Ex.core.popup(this,"렌탈지역등록","sd::RTSDRentalAreaRegisterPopup.xfdl",args, "modaless=false");
        	}
        	
        	//----------------------------------------------------------------------------------
        	// 팝업반환값(렌탈지역등록)
        	//----------------------------------------------------------------------------------
        	this._setReturnRentalArea = function(val){
        		var sDsNm = val[0];
        		var nRowCnt = sDsNm.rowcount;
        		var sRtMasterNu = nvl(this.dsList.getColumn(0, "rtmasterNu")); //렌탈 마스터 사번
        		
        		if ( nRowCnt > 0)
        		{
        			var sRentalOffice = "";
        			var nRow = -1;
        			
        			for(var i=0; i<nRowCnt; i++)
        			{
        				sRentalOffice = sDsNm.getColumn(i, "rentalOffice");
        				if(this.dsListArea.findRow("rentalOffice", sRentalOffice) < 0) //중복건은 무시
        				{
        					//trace("sRentalOffice = " + sRentalOffice);
        					nRow = this.dsListArea.addRow();
        					this.dsListArea.copyRow(nRow, sDsNm, i);
        					this.dsListArea.setColumn(nRow, "chk", 0);
        					this.dsListArea.setColumn(nRow, "rtmasterNu", sRtMasterNu);
        				}
        			}
        		}
        		
        // 		for(var i=0; i< this.dsListArea.rowcount; i++)
        // 		{
        // 			trace("getRowType = " + this.dsListArea.getRowType(i));
        // 		}
        	}	

        	//----------------------------------------------------------------------------------
        	// [추가]: 렌탈지사
        	//----------------------------------------------------------------------------------
        	this.btn_add_onclick = function(obj,e)
        	{
        		var nRow = this.dsList.addRow();
        		this.dsList.setColumn(nRow, "useYn", "Y");
        	}

        	//----------------------------------------------------------------------------------
        	// [삭제]: 렌탈지역
        	//----------------------------------------------------------------------------------
        	this.btn_del_onclick = function(obj,e)
        	{
        		var nRow = this.dsListArea.rowcount;
        		if(nRow < 1) return false;		
        		if(this.dsListArea.getCaseCount("chk == 1") == 0) return false;
        		
        		for(var i=nRow-1; i>=0; i--)
        		{
        			trace("i ==  " + i + ", chk == " + this.dsListArea.getColumn(i, "chk"));
        			
        			if(nexacro._nvl(this.dsListArea.getColumn(i, "chk"), 0) == 1)
        			{
        				this.dsListArea.deleteRow(i);
        			}
        		}
        		
        	}

        	//----------------------------------------------------------------------------------
        	// [추가]: 렌탈지역
        	//----------------------------------------------------------------------------------
        	this.btn_add2_onclick = function(obj,e)
        	{
        		var nGrpPos = this.dsList.rowposition;	//지사
        		if(Eco.isEmpty(this.dsList.getColumn(nGrpPos, "rentalGroup")))
        		{
        			alert("지사코드가 없습니다");
        			return false;
        		}

        		if(Eco.isEmpty(this.dsList.getColumn(nGrpPos, "rentalGroupNm")))
        		{
        			alert("지사명이 없습니다");
        			return false;
        		}		

        		if(this.dsList.getColumn(nGrpPos, "useYn") != "Y")
        		{
        			alert("사용중인 지사만 지역추가가 가능합니다");
        			return false;
        		}		
        		
        		var nRow = this.dsList2.addRow(); //지역 [추가]

        		this.dsList2.setColumn(nRow, "rentalGroup", this.dsList.getColumn(nGrpPos, "rentalGroup"));
        		this.dsList2.setColumn(nRow, "rentalGroupNm", this.dsList.getColumn(nGrpPos, "rentalGroupNm"));
        		this.dsList2.setColumn(nRow, "useYn", "Y");
        	}

        	//----------------------------------------------------------------------------------
        	// [삭제]: 렌탈지역
        	//----------------------------------------------------------------------------------
        	this.btn_del2_onclick = function(obj,e)
        	{
        		//this.dsList2.deleteRow(this.dsList2.rowposition);
        		if(this.dsList2.rowcount < 1)
        		{			
        			return false;
        		}
        		
        		//trace(this.dsList2.getCaseCount("chk == '1'"));
        		if(this.dsList2.getCaseCount("chk == '1'") < 1)
        		{
        			alert("삭제할 지역을 체크박스에 선택해주세요");
        			return false;
        		}
        		
        		if( confirm( "삭제하시겠습니까?") ){
        			var nRow = this.dsList2.rowcount;
        			for (var i = 0; i < nRow; i++) 
        			{
        				if (this.dsList2.getColumn(i, "chk") == 1) 
        				{
        					this.dsList2.setColumn(i, "useYn", "N");
        					this.dsList2.setColumn(i, "chk", 0);
        				}
        			}
        			
        			var sSvcID        	= "saveRentalArea";                    
        			var sController   	= "/rtms/sd/saveRentalArea.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			sInDatasets   		= "input1=dsList:U input2=dsList2:U";
        			sOutDatasets  		= "";
        			var fn_callBack		= "fn_callBack";
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);			
        		}
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
        	this.dsList_oncolumnchanged = function(obj,e)
        	{
        		var sColId = e.columnid;
        		var nRow = e.row;
        				
        		if(sColId == "useYn"){		//지사 사용여부
        			//trace("newvalue = " + e.newvalue);
        			if(e.newvalue == "N")
        			{
        				var nAreaRow = this.dsList2.rowcount;
        				for(var i=0; i<nAreaRow; i++)
        				{
        					this.dsList2.setColumn(i, "useYn", "N");
        				}				
        			}
        			//obj.setColumn(nRow, "actAmt", nvl(obj.getColumn(nRow, "amt"), 0) - nvl( obj.getColumn(nRow, "dcAmt"), 0));
        		}
        	}

        	//----------------------------------------------------------------------------------
        	// Search Validation: 렌탈관리지역 조회
        	//----------------------------------------------------------------------------------	
        	this.fn_searchMgmtAreaValidation = function(){
        // 		if(this.dsList.rowcount < 1)
        // 		{
        // 
        // 		}
        		var sRtMasterNu = nvl(this.dsList.getColumn(0, "rtmasterNu")); //렌탈 마스터 사번
        		if(Eco.isEmpty(sRtMasterNu))
        		{
        			alert("렌탈지역을 조회하기 위해서는 렌탈 마스터 사번이 필요합니다.");
        			return false;
        		}		
        	
        		return true;
        	}

        	//----------------------------------------------------------------------------------
        	// Search Validation: 소속판매인 조회
        	//----------------------------------------------------------------------------------	
        	this.fn_searchSalesAgentValidation = function(){
        		//Callback에서 이미 확인
        // 		if(this.dsList.rowcount < 1)
        // 		{
        // 
        // 		}
        		//rtmasterNu, 렌탈 마스터 사번은 fn_searchMgmtAreaValidation()에서 이미 확인

        		//Callback에서 이미 확인
        //  	if(this.dsListArea.rowcount < 1)
        //  	{
        // 
        //  	}
         		
        		var sRentalGroup = nvl(this.dsListArea.getColumn(0, "rentalGroup")); //렌탈지사
        		if(Eco.isEmpty(sRentalGroup))
        		{
        			alert("소속판매인을 조회하기 위해서는 렌탈지사코드가 필요합니다.");
        			return false;
        		}		
        	
        		return true;
        	}	
        		
        	//----------------------------------------------------------------------------------
        	// Save Validation
        	//----------------------------------------------------------------------------------
        	this.fn_saveValidation = function() {
        		if(!Ex.util.isUpdated(this.dsList) && !Ex.util.isUpdated(this.dsListArea)) {
        			alert('변경된 데이터가 없습니다.');
        			return false;			
        		}
        	
        		//1. 렌탈 마스터
        		if(Eco.isEmpty(nvl(this.dsList.getColumn(0, "rtmasterNu"))))	//사번
        		{
        			alert("사번을 입력해 주세요");			
        			this.Grid01.setFocus();
        			this.Grid01.selectRow(0);
        			this.Grid01.setCellPos(1);
        			return false; 		
        		}		
        		
        		if(Eco.isEmpty(nvl(this.dsList.getColumn(0, "rtmasterNm"))))	//성명
        		{
        			alert("성명을 입력해 주세요");			
        			this.Grid01.setFocus();
        			this.Grid01.selectRow(0);
        			this.Grid01.setCellPos(2);
        			return false; 		
        		}
        		
        		var sMobNo = nvl(this.dsList.getColumn(0, "mobNo"));
        		if(!Eco.isEmpty(sMobNo))
        		{		
        			if(!FN_mobNoCheck(sMobNo))	//핸드폰번호
        			{
        				alert("휴대폰 번호를 확인해 주세요");
        				this.Grid01.setFocus();
        				this.Grid01.selectRow(0);
        				this.Grid01.setCellPos(3);				
        				return false; 
        			}
        		}
        		
        		var sTelNo = nvl(this.dsList.getColumn(0, "telNo"));
        		if(!Eco.isEmpty(sTelNo))
        		{	
        			if(!this.fn_telNoVal(sTelNo))	//전화번호
        			{
        				alert("전화번호를 확인해 주세요");
        				this.Grid01.setFocus();
        				this.Grid01.selectRow(0);
        				this.Grid01.setCellPos(4);							
        				return false;
        			}
        		}
        				
        		//2. 렌탈지역
        		if(this.dsListArea.rowcount < 1)
        		{
        			alert("렌탈지역 정보가 없습니다.");
        			return false;
        		}
        		
        		var srentalGroup = "";
        		var rentalOffice = "";

        		for(var i=0; i<this.dsListArea.rowcount; i++)
        		{
        			srentalGroup = nvl(this.dsListArea.getColumn(i, "rentalGroup"));
        			if(Eco.isEmpty(srentalGroup))
        			{
        				alert("렌탈지사를 입력해 주세요");
        				this.Grid02.setFocus();
        				this.Grid02.selectRow(i);
        				return false;
        			}
        			
        			rentalOffice = nvl(this.dsListArea.getColumn(i, "rentalOffice"));
        			if(Eco.isEmpty(rentalOffice))
        			{
        				alert("렌탈지역을 입력해 주세요");
        				this.Grid02.setFocus();
        				this.Grid02.selectRow(i);
        				return false;
        			}			
        		}		
        		
        		return true;
        	}

        	//전화번호 validation
        	this.fn_telNoVal = function(telNo ){
        		//var regExp1 = /^\d{2,3}-\d{3,4}-\d{4}$/;//전화번호
        		var regExp1 = /^(02|051|053|032|062|042|052|044|031|033|043|041|063|061|054|055|064|070|010|011|016|017|018|019|0310|0502|0505|0506)([0-9]{3,4})([0-9]{4})$/;//전화번호(-없이 입력)
        		if(!regExp1.test(telNo)) return false;
        		
        		return true
        	}

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.edt_grpNm.addEventHandler("onkeyup", this.div_search_edt_grpNm_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.fn_searchRentalMasterNm, this);
            this.Static05.addEventHandler("onclick", this.Static04_onclick, this);
            this.btn_addArea.addEventHandler("onclick", this.btn_addArea_onclick, this);
            this.btn_del.addEventHandler("onclick", this.btn_del_onclick, this);

        };

        this.loadIncludeScript("RTSDRentalMaster.xfdl");

       
    };
}
)();

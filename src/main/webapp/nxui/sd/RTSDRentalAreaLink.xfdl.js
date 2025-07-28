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
                this.set_titletext("렌탈지사/렌탈지점 연결");
                this._setFormPosition(0,0,1147,496);
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
            obj._setContents("<ColumnInfo><Column id=\"cdGrpCd\" type=\"STRING\" size=\"0\"/><Column id=\"cd\" type=\"STRING\" size=\"0\"/><Column id=\"cdNm\" type=\"STRING\" size=\"0\"/><Column id=\"orderPt\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"0\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("comGrp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdDesc\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/><Column id=\"cd\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_yn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">사용</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">미사용</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("comType", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdDesc\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/><Column id=\"cd\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsList2", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"cdGrpCd\" type=\"STRING\" size=\"0\"/><Column id=\"cd\" type=\"STRING\" size=\"0\"/><Column id=\"cdNm\" type=\"STRING\" size=\"0\"/><Column id=\"orderPt\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"0\"/><Column id=\"rfr1\" type=\"STRING\" size=\"0\"/><Column id=\"rfr2\" type=\"STRING\" size=\"0\"/><Column id=\"dataYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj = new Static("st_searchCondition", "absolute", "25", "12", "120", "20", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("렌탈지사 코드/명");
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
            obj = new Edit("edt_grpNm", "absolute", "151", "10", "124", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_enable("true");
            obj.set_maxlength("100");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "561", "12", "120", "20", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_text("렌탈지점 코드/명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_officeNm", "absolute", "687", "10", "124", "21", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_maxlength("100");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "61", "81", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "0", "25", "45", null, null, this);
            obj.set_taborder("27");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "237", "0", "25", "44", null, null, this);
            obj.set_taborder("28");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
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

            obj = new Static("Static02", "absolute", "563", "61", "81", "20", null, null, this);
            obj.set_taborder("138");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btn_save", "absolute", "507", "61", "45", "22", null, null, this);
            obj.set_taborder("140");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_save2", "absolute", "1071", "61", "45", "22", null, null, this);
            obj.set_taborder("141");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_add", "absolute", "459", "61", "45", "22", null, null, this);
            obj.set_taborder("142");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_add2", "absolute", "1023", "61", "45", "22", null, null, this);
            obj.set_taborder("143");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "85", "554", "393", null, null, this);
            obj.set_taborder("144");
            obj.set_binddataset("dsList");
            obj.set_autoenter("select");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"126\"/><Column size=\"272\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"렌탈지사코드\"/><Cell col=\"1\" text=\"렌탈지사명\"/><Cell col=\"2\" text=\"정렬순서\"/></Band><Band id=\"body\"><Cell edittype=\"expr:cdGrpCd == null || cdGrpCd == '' ? 'normal' : 'none'\" text=\"bind:cd\"/><Cell col=\"1\" edittype=\"normal\" text=\"bind:cdNm\"/><Cell col=\"2\" edittype=\"masknumber\" text=\"bind:orderPt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid2", "absolute", "563", "85", "554", "393", null, null, this);
            obj.set_taborder("145");
            obj.set_binddataset("dsList2");
            obj.set_autoenter("select");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"43\"/><Column size=\"134\"/><Column size=\"286\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"렌탈지점코드\"/><Cell col=\"2\" text=\"렌탈지점명\"/><Cell col=\"3\" text=\"정렬순서\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" edittype=\"expr:cdGrpCd == null || cdGrpCd == '' ? 'normal' : 'none'\" text=\"bind:cd\"/><Cell col=\"2\" edittype=\"normal\" text=\"bind:cdNm\"/><Cell col=\"3\" edittype=\"masknumber\" text=\"bind:orderPt\"/></Band></Format></Formats>");
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
            		p.set_titletext("렌탈지사/렌탈지점 연결");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDRentalAreaLink.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDRentalAreaLink.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 렌탈지사/렌탈지점 연결
         * 02. 그룹명   : 주문관리-기준정보
         * 03. 그룹설명 :
         * 04. 작성일   : 2018.12.12
         * 05. 작성자   : 지영식
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
        		/* 1. N : 신규추가
        		 * 2. S : 조회
        		 * 3. C : 데이타생성
        		 * 4. E : 엑셀데이타생성
        		 */
        		Ex.core.init(obj); 
        		this.parent.setButton("S", this);
        		this.fn_search();
        	} 
        	 
        /***********************************************************************************
        * 4. Transaction Functions
        ***********************************************************************************/
        //----------------------------------------------------------------------------------
        // Search: 렌탈지사(M)
        //----------------------------------------------------------------------------------
        	this.fn_search = function()
        	{
        		this.dsList.clearData();
        		this.dsList2.clearData();
        		
        		var sSvcID        	= "listGroupLinkInfo";                    
        		var sController   	= "/rtms/sd/listRentalAreaLinkInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList=ds_output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs 			+= Ex.util.setParam("cdNm",   nvl(this.div_search.edt_grpNm.value));
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}

        //----------------------------------------------------------------------------------
        // Search: 렌탈지역(D)
        //----------------------------------------------------------------------------------
        	this.fn_searchOffice = function()
        	{
        		this.dsList2.clearData();
        		
        		if(!this.fn_searchOfficeValidation())
        		{
        			return false;
        		}		
        		
        		var sSvcID        	= "listOfficeLinkInfo";                    
        		var sController   	= "/rtms/sd/listRentalOfficeLinkInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList2=ds_output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs 			+= Ex.util.setParam("cd",   nvl(this.dsList.getColumn(this.dsList.rowposition, "cd")));
        			sArgs 			+= Ex.util.setParam("cdNm", nvl(this.div_search.edt_officeNm.value));
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}	

        //----------------------------------------------------------------------------------
        // Save - 렌탈지사
        //----------------------------------------------------------------------------------
        	this.fn_save_mst = function()
        	{
        		if(!Ex.util.isUpdated(this.dsList)) {
        			alert('변경된 데이터가 없습니다.');
        			return false;
        		}

        		if( confirm( "저장하시겠습니까?") ){			
        			var sSvcID        	= "saveRentalMstLink";                    
        			var sController   	= "/rtms/sd/saveRentalMstLink.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			sInDatasets   		= "input1=dsList:U";
        			sOutDatasets  		= "";
        			var fn_callBack		= "fn_callBack";
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}

        //----------------------------------------------------------------------------------
        // Save - 렌탈지점
        //----------------------------------------------------------------------------------
        	this.fn_save_dtl = function()
        	{
        		if(!Ex.util.isUpdated(this.dsList2)) {
        			alert('변경된 데이터가 없습니다.');
        			return false;
        		}

        		if( confirm( "저장하시겠습니까?") ){			
        			var sSvcID        	= "saveRentalDtlLink";                    
        			var sController   	= "/rtms/sd/saveRentalDtlLink.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			sInDatasets   		= "input2=dsList2:U";
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
        		var sController   	= "/rtms/sd/listAddGroupCommInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "comGrp=com_grp comType=com_type";
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
        			return;
        		}
        		
        		if (strSvcId == "listGroupLinkInfo") { //지사조회(M)
        		
        		}
        		
        		if (strSvcId == "listOfficeLinkInfo") { //지역조회(D)
        		
        		}
        				
        		if (strSvcId == "saveRentalMstLink") { //저장
        			alert(strErrorMsg);
        			this.fn_search();
        		}
        				
        		if (strSvcId == "saveRentalDtlLink") { //저장
        			alert(strErrorMsg);
        			//this.fn_search();
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
        	// [저장]: 렌탈지사
        	//----------------------------------------------------------------------------------
        	this.btn_save_onclick = function(obj,e)
        	{
        		this.fn_save_mst();
        	}
        	
        	//----------------------------------------------------------------------------------
        	// [저장]: 렌탈지점
        	//----------------------------------------------------------------------------------
        	this.btn_save2_onclick = function(obj,e)
        	{
        		this.fn_save_dtl();
        	}

        	//----------------------------------------------------------------------------------
        	// [추가]: 렌탈지사
        	//----------------------------------------------------------------------------------
        	this.btn_add_onclick = function(obj,e)
        	{		
        		var nRow = this.dsList.addRow();
        		
        		this.dsList.setColumn(nRow, "useYn", "Y");
        		
        		this.dsList.set_rowposition(nRow);
        		this.Grid00.setCellPos(0);
        		this.Grid00.showEditor(true);
        	}

        
        	//----------------------------------------------------------------------------------
        	// [추가]: 렌탈지점
        	//----------------------------------------------------------------------------------
        	this.btn_add2_onclick = function(obj,e)
        	{
        		if(Eco.isEmpty(this.dsList.getColumn(this.dsList.rowposition, "cd")))
        		{
        			alert("렌탈지사코드가 없습니다");
        			return false;
        		}
        		
        		if(Eco.isEmpty(this.dsList.getColumn(this.dsList.rowposition, "cdNm")))
        		{
        			alert("렌탈지사명이 없습니다");
        			return false;
        		}		

        		if(this.dsList.getColumn(this.dsList.rowposition, "useYn") != "Y")
        		{
        			alert("사용중인 지사만 지역추가가 가능합니다");
        			return false;
        		}		
        		
        		var nRow = this.dsList2.addRow(); //지점 [추가]

        		this.dsList2.setColumn(nRow, "rfr1", "S301");
        		this.dsList2.setColumn(nRow, "useYn", "Y");		

        		this.dsList2.set_rowposition(nRow);
        		this.Grid2.setCellPos(1);
        		this.Grid2.showEditor(true);
        	}

        
        	//----------------------------------------------------------------------------------
        	// [삭제]: 렌탈지사
        	//----------------------------------------------------------------------------------
        	this.btn_del_onclick = function(obj,e)
        	{	
        		if( confirm( "삭제하시겠습니까?") ){
        			if (Eco.isEmpty(this.dsList.getColumn(this.dsList.rowposition, "CD_GRP_CD")))
        			{
        				this.dsList.deleteRow(this.dsList.rowposition);
        				return;
        			}
        			else
        			{
        				this.dsList.deleteRow(this.dsList.rowposition);
        				this.fn_save_mst();
        				return;
        			}
        		}
        	}

        	//----------------------------------------------------------------------------------
        	// [삭제]: 렌탈지점
        	//----------------------------------------------------------------------------------
        	this.btn_del2_onclick = function(obj,e)
        	{	
        		if( confirm( "삭제하시겠습니까?") ){
        			if (Eco.isEmpty(this.dsList.getColumn(this.dsList.rowposition, "CD")))
        			{
        				this.dsList.deleteRow(this.dsList.rowposition);
        				return;
        			}
        			else
        			{
        				this.dsList.deleteRow(this.dsList.rowposition);
        				this.fn_save_dtl();
        				return;
        			}
        		}
        	}

        
        	//----------------------------------------------------------------------------------
        	// Search Validation: 렌탈지점(D)
        	//----------------------------------------------------------------------------------	
        	this.fn_searchOfficeValidation = function(){
        		if(this.dsList.rowcount < 1)
        		{
        			return false;
        		}
        	
        		return true;
        	}
        	
        	this.dsList_onrowposchanged = function(obj,e)
        	{
        		this.fn_searchOffice(); //렌탈지점 조회
        	}

        //렌탈지점 사용여부 체크
        this.dsList2_cancolumnchange = function(obj,e)
        {
        	var nRow = this.dsList2.rowposition;
        	if (e.columnid == "chk")
        	{
        		if (this.dsList2.getColumn(nRow, "dataYn") == "1")
        		{
        			alert("렌탈마스터관리에서 사용하고 있어 선택이 불가능합니다.");
        			//this.fn_searchOffice(); //렌탈지점 조회
        			return false;
        		}
        		else
        		{
        			if (e.oldvalue == 0)
        			{
        				if ((this.dsList.getColumn(this.dsList.rowposition, "cd") != this.dsList2.getColumn(nRow, "cd")) 
        				     && !Eco.isEmpty(this.dsList2.getColumn(nRow, "rfr2"))  )
        				{
        					alert("다른 렌탈지사에 연결되어 있어 선택이 불가능합니다.");
        					//this.fn_searchOffice(); //렌탈지점 조회
        					return false;
        				}
        				
        				this.dsList2.setColumn(nRow, "rfr2", this.dsList.getColumn(this.dsList.rowposition, "cd"));
        			}
        			else
        			{
        				this.dsList2.setColumn(nRow, "rfr2", "");
        			}
        		}
        	}
        }

        
        this.Grid00_onkeyup = function(obj,e)
        {
        	if (e.keycode == 13) {
        		obj.moveToNextCell();
        	}
        }

        this.Grid2_onkeyup = function(obj,e)
        {
        	if (e.keycode == 13) {
        		obj.moveToNextCell();
        	}
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.dsList.addEventHandler("onrowposchanged", this.dsList_onrowposchanged, this);
            this.dsList.addEventHandler("oncolumnchanged", this.dsList_oncolumnchanged, this);
            this.dsList2.addEventHandler("cancolumnchange", this.dsList2_cancolumnchange, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.addEventHandler("onkeyup", this.div_search_onkeyup, this);
            this.div_search.edt_grpNm.addEventHandler("onkeyup", this.div_search_edt_grpNm_onkeyup, this);
            this.div_search.edt_officeNm.addEventHandler("onkeyup", this.div_search_edt_grpNm_onkeyup, this);
            this.btn_save.addEventHandler("onclick", this.btn_save_onclick, this);
            this.btn_save2.addEventHandler("onclick", this.btn_save2_onclick, this);
            this.btn_add.addEventHandler("onclick", this.btn_add_onclick, this);
            this.btn_add2.addEventHandler("onclick", this.btn_add2_onclick, this);
            this.Grid00.addEventHandler("onkeyup", this.Grid00_onkeyup, this);
            this.Grid2.addEventHandler("onkeyup", this.Grid2_onkeyup, this);

        };

        this.loadIncludeScript("RTSDRentalAreaLink.xfdl");

       
    };
}
)();

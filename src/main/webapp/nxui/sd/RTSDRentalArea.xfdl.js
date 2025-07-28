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
                this.set_titletext("렌탈지역관리");
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
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"0\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"0\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"0\"/><Column id=\"useYn\" type=\"STRING\" size=\"0\"/><Column id=\"regId\" type=\"STRING\" size=\"0\"/><Column id=\"regDt\" type=\"STRING\" size=\"0\"/><Column id=\"chgId\" type=\"STRING\" size=\"0\"/><Column id=\"chgDt\" type=\"STRING\" size=\"0\"/></ColumnInfo>");
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
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"0\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"0\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"0\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"0\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"0\"/><Column id=\"useYn\" type=\"STRING\" size=\"0\"/><Column id=\"regId\" type=\"STRING\" size=\"0\"/><Column id=\"regDt\" type=\"STRING\" size=\"0\"/><Column id=\"chgId\" type=\"STRING\" size=\"0\"/><Column id=\"chgDt\" type=\"STRING\" size=\"0\"/></ColumnInfo>");
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
            obj.set_text("렌탈지사명");
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
            obj = new Edit("edt_grpNm", "absolute", "111", "10", "124", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_enable("true");
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

            obj = new Grid("Grid01", "absolute", "0", "85", "554", "393", null, null, this);
            obj.set_taborder("127");
            obj.set_binddataset("dsList");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"0\"/><Column size=\"150\"/><Column size=\"240\"/><Column size=\"160\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"렌탈지사\"/><Cell col=\"2\" text=\"렌탈지사명\"/><Cell col=\"3\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" edittype=\"normal\" style=\"align:center;\" text=\"bind:rentalGroup\" editlimit=\"3\"/><Cell col=\"2\" edittype=\"normal\" style=\"align:center;\" text=\"bind:rentalGroupNm\" editlimit=\"100\"/><Cell col=\"3\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:useYn\" combodataset=\"ds_yn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/></Band></Format></Formats>");
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

            obj = new Button("btn_add", "absolute", "459", "61", "45", "22", null, null, this);
            obj.set_taborder("133");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_add2", "absolute", "1023", "61", "45", "22", null, null, this);
            obj.set_taborder("136");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "563", "61", "81", "20", null, null, this);
            obj.set_taborder("138");
            obj.set_text("렌탈지역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid02", "absolute", "563", "85", "554", "393", null, null, this);
            obj.set_taborder("139");
            obj.set_binddataset("dsList2");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"150\"/><Column size=\"120\"/><Column size=\"150\"/><Column size=\"90\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"렌탈지사명\"/><Cell col=\"2\" text=\"렌탈지역\"/><Cell col=\"3\" text=\"렌탈지역명\"/><Cell col=\"4\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" edittype=\"none\" style=\"align:center;\" text=\"bind:rentalGroupNm\"/><Cell col=\"2\" edittype=\"normal\" text=\"bind:rentalOffice\" editlimit=\"4\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:rentalOfficeNm\" editlimit=\"100\"/><Cell col=\"4\" displaytype=\"combo\" edittype=\"combo\" style=\"align:center;\" text=\"bind:useYn\" combodataset=\"ds_yn\" combocodecol=\"cd\" combodatacol=\"cdNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_del", "absolute", "507", "61", "45", "22", null, null, this);
            obj.set_taborder("140");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_del2", "absolute", "1071", "61", "45", "22", null, null, this);
            obj.set_taborder("141");
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
            		p.set_titletext("렌탈지역관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDRentalArea.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDRentalArea.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 렌탈지역관리
         * 02. 그룹명   : 주문관리-기준정보
         * 03. 그룹설명 :
         * 04. 작성일   : 2018.10.31
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
        		/* 1. N : 신규추가
        		 * 2. S : 조회
        		 * 3. C : 데이타생성
        		 * 4. E : 엑셀데이타생성
        		 */
        		Ex.core.init(obj); 
        		this.parent.setButton("C|S", this);
        		//this.listCommInfo(); //공통코드 조회(S202: 단체상태, S204: 단체유형)
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
        		
        		var sSvcID        	= "listGroupInfo";                    
        		var sController   	= "/rtms/sd/listRentalAreaInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList=ds_output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs 			+= Ex.util.setParam("rentalGroupNm",   nvl(this.div_search.edt_grpNm.value));
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
        		
        		var sSvcID        	= "listOfficeInfo";                    
        		var sController   	= "/rtms/sd/listRentalOfficeInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList2=ds_output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs 			+= Ex.util.setParam("rentalGroup", nvl(this.dsList.getColumn(this.dsList.rowposition, "rentalGroup")));
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}	

        //----------------------------------------------------------------------------------
        // Save
        //----------------------------------------------------------------------------------
        	this.fn_save = function()
        	{
        		if(!Ex.util.isUpdated(this.dsList) && !Ex.util.isUpdated(this.dsList2)) {
        			alert('변경된 데이터가 없습니다.');
        			return false;
        		}

        		//Save Validation is not needed.

        		if( confirm( "저장하시겠습니까?") ){			
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
        		}
        		
        		if (strSvcId == "listGroupInfo") { //지사조회(M)
        			this.dsList.set_enableevent = false;
        // 			for(var i=0; i<this.dsList.rowcount; i++){
        // 				this.dsList.setColumn(i, "chk", 0);
        // 			}
        			
        			this.dsList.set_updatecontrol(false);
        			for( var i = 0 ; i < this.dsList.rowcount ; i++ ){
        				this.dsList.setRowType(i, Dataset.ROWTYPE_NORMAL);
        			}
        			this.dsList.set_updatecontrol(true);
        			this.dsList.set_enableevent = true;
        		}
        		
        		if (strSvcId == "listOfficeInfo") { //지역조회(D)
        			for(var i=0; i<this.dsList2.rowcount; i++){
        				this.dsList2.setColumn(i, "chk", 0);
        			}
        			
        			this.dsList2.set_updatecontrol(false);
        			for( var i = 0 ; i < this.dsList2.rowcount ; i++ ){
        				this.dsList2.setRowType(i, Dataset.ROWTYPE_NORMAL);
        			}
        			this.dsList2.set_updatecontrol(true);
        		}
        				
        		if (strSvcId == "saveRentalArea") { //저장
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
        	

        	this.fn_add = function() {
        		var row = this.dsList.addRow();
        		
         		this.dsList.setColumn(row, "dcAmt", 0);
         		this.dsList.setColumn(row, "gdsGb", "2");
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
        	// [삭제]: 렌탈지사
        	//----------------------------------------------------------------------------------
        	this.btn_del_onclick = function(obj,e)
        	{
        		//this.dsList.deleteRow(this.dsList.rowposition);
        		if(this.dsList.rowcount < 1)
        		{			
        			return false;
        		}
        		
        		if( confirm( "삭제하시겠습니까?") ){
        			var nGrpPos = this.dsList.rowposition;	//지사
        			this.dsList.setColumn(nGrpPos, "useYn", "N");
        			
        			var nAreaRow = this.dsList2.rowcount;
        			for(var i=0; i<nAreaRow; i++)
        			{
        				this.dsList2.setColumn(i, "useYn", "N");
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
        	// Search Validation: 렌탈지역(D)
        	//----------------------------------------------------------------------------------	
        	this.fn_searchOfficeValidation = function(){
        		if(this.dsList.rowcount < 1)
        		{
        			return false;
        		}
        	
        		return true;
        	}
        	
        	//----------------------------------------------------------------------------------
        	// Save Validation
        	//----------------------------------------------------------------------------------
        	this.fn_saveValidation = function() {
        		//렌탈지사코드
        		//렌탈지사명

        		//렌탈지사코드
        		//렌탈지사명
        		//렌탈지역코드
        		//렌탈지역명
        		
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
        	
        	this.dsList_onrowposchanged = function(obj,e)
        	{
        		this.fn_searchOffice(); //렌탈지역 조회
        	}

        

        

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.dsList.addEventHandler("onrowposchanged", this.dsList_onrowposchanged, this);
            this.dsList.addEventHandler("oncolumnchanged", this.dsList_oncolumnchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.addEventHandler("onkeyup", this.div_search_onkeyup, this);
            this.div_search.edt_grpNm.addEventHandler("onkeyup", this.div_search_edt_grpNm_onkeyup, this);
            this.btn_add.addEventHandler("onclick", this.btn_add_onclick, this);
            this.btn_add2.addEventHandler("onclick", this.btn_add2_onclick, this);
            this.btn_del.addEventHandler("onclick", this.btn_del_onclick, this);
            this.btn_del2.addEventHandler("onclick", this.btn_del2_onclick, this);

        };

        this.loadIncludeScript("RTSDRentalArea.xfdl");

       
    };
}
)();

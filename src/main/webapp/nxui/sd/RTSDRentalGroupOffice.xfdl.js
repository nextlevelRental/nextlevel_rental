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
                this.set_titletext("렌탈지사/지역 변경");
                this._setFormPosition(0,0,1147,496);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_yn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">렌탈마스터</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">관계없음</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsChnCd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdDesc\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/><Column id=\"cd\" type=\"string\" size=\"32\"/></ColumnInfo><Rows><Row><Col id=\"cd\">1</Col><Col id=\"cdNm\">대리점</Col></Row><Row><Col id=\"cd\">2</Col><Col id=\"cdNm\">판매인</Col></Row><Row><Col id=\"cd\">3</Col><Col id=\"cdNm\">로디안</Col></Row></Rows>");
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

            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"0\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"0\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"0\"/><Column id=\"telNo\" type=\"STRING\" size=\"0\"/><Column id=\"chanCd\" type=\"STRING\" size=\"0\"/><Column id=\"lifnr\" type=\"STRING\" size=\"0\"/><Column id=\"taxRqcd\" type=\"STRING\" size=\"0\"/><Column id=\"rentalYn\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"chnCl\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNew\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNmNew\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNew\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNmNew\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsListChked", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"0\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"0\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"0\"/><Column id=\"telNo\" type=\"STRING\" size=\"0\"/><Column id=\"chanCd\" type=\"STRING\" size=\"0\"/><Column id=\"lifnr\" type=\"STRING\" size=\"0\"/><Column id=\"taxRqcd\" type=\"STRING\" size=\"0\"/><Column id=\"rentalYn\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"chnCl\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNew\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNmNew\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNew\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNmNew\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj = new Static("st_searchCondition", "absolute", "25", "11", "40", "21", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("구분");
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
            obj = new Static("Static01", "absolute", "160", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_chnCd", "absolute", "75", "11", "85", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_innerdataset("@dsChnCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("6");
            obj.set_value("1");
            obj.set_text("대리점");
            obj.set_index("0");
            obj = new Edit("edt_grpNm", "absolute", "255", "11", "124", "21", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_readonly("true");
            obj.set_maxlength("100");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_officeNm", "absolute", "383", "11", "124", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_readonly("true");
            obj.set_maxlength("100");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", "509", "10", "21", "21", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition00", "absolute", "180", "11", "64", "21", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("렌탈지역");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "61", "153", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("소속판매인");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "0", "25", "45", null, null, this);
            obj.set_taborder("27");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "621", "0", "25", "44", null, null, this);
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

            obj = new Grid("Grid", "absolute", "0", "85", "1122", "393", null, null, this);
            obj.set_taborder("139");
            obj.set_binddataset("dsList");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"30\"/><Column size=\"80\"/><Column size=\"70\"/><Column size=\"180\"/><Column size=\"70\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"구분\"/><Cell col=\"2\" text=\"판매인번호\"/><Cell col=\"3\" text=\"판매인명\"/><Cell col=\"4\" text=\"채널대분류\"/><Cell col=\"5\" text=\"채널중분류\"/><Cell col=\"6\" text=\"연락처\"/><Cell col=\"7\" text=\"(現)렌탈지사\"/><Cell col=\"8\" text=\"(現)렌탈지역\"/><Cell col=\"9\" text=\"(新)렌탈지사\"/><Cell col=\"10\" text=\"(新)렌탈지역\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" displaytype=\"combo\" edittype=\"none\" style=\"align:center;\" text=\"bind:chnCl\" combodataset=\"dsChnCd\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"2\" edittype=\"none\" text=\"bind:agencyCd\" editlimit=\"4\"/><Cell col=\"3\" edittype=\"none\" style=\"align:left;\" text=\"bind:agencyNm\" editlimit=\"100\"/><Cell col=\"4\" displaytype=\"combo\" edittype=\"none\" style=\"align:center;\" text=\"bind:chanLclsCd\" combodataset=\"dsS090\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"5\" displaytype=\"combo\" text=\"bind:chanMclsCd\" combodataset=\"dsS091\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"6\" expr=\"expr:FN_numberMaskReturn(telNo)\"/><Cell col=\"7\" text=\"bind:rentalGroupNm\"/><Cell col=\"8\" text=\"bind:rentalOfficeNm\"/><Cell col=\"9\" edittype=\"none\" text=\"bind:rentalGroupNmNew\" expandshow=\"show\" expandsize=\"13\" expandimage=\"URL('theme://images\\btn_WF_Search_N.png')\"/><Cell col=\"10\" text=\"bind:rentalOfficeNmNew\" expandshow=\"show\" expandimage=\"URL('theme://images\\btn_WF_Search_N.png')\"/></Band></Format></Formats>");
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
            		p.set_titletext("렌탈지사/지역 변경");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","div_search.edt_grpNm","value","dsListArea","rentalGroupNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_search.edt_officeNm","value","dsListArea","rentalOfficeNm");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDRentalGroupOffice.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDRentalGroupOffice.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 렌탈지사, 지역 변경
         * 02. 그룹명   : 주문관리-기준정보
         * 03. 설명		 : 
        				   대리점: RTVIEW33.CHN_CD in ('01', '05')
        				   판매인: RTVIEW33.CHN_LCLS_CD = '03' AND RTVIEW33.AGENCY_CD <> RTCS0002.ORD_AGENT
        				   로디안: RTVIEW33.CHN_LCLS_CD = '03' AND RTVIEW33.AGENCY_CD = RTCS0002.ORD_AGENT
         * 04. 작성일   : 2018.11.12
         * 05. 작성자   : Sean
         * 06. 수정이력 :
         ***********************************************************************
         *     수정일     작성자   내용
         ***********************************************************************
         * ToDo.1. 확인: 로디안 저장시, RTCS0002에만 저장하면 되는지 RTSD0113에도 저장해야 하는지 확인
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
        		this.parent.setButton("C|S", this);
        		this.fn_searchCode(); //공통코드 조회(S030: 채널구분, S090: 채널 대분류, S091: 채널 중분류)
        		//this.div_search.edt_grpNm.setFocus();
        	}
        	 
        /***********************************************************************************
        * 4. Transaction Functions
        ***********************************************************************************/
        	//----------------------------------------------------------------------------------
        	// Search: 렌탈지사지역 조회
        	//----------------------------------------------------------------------------------
        	this.fn_search = function()
        	{
        		this.dsList.clearData();

        		//if(!this.fn_searchValidation()) return false;

        		var sSvcID        	= "listRentalGroupOffice";                    
        		var sController   	= "/rtms/sd/listRentalGroupOffice.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList=ds_output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs 			+= Ex.util.setParam("rentalGroup", this.dsListArea.getColumn(0, "rentalGroup"));
        			sArgs 			+= Ex.util.setParam("rentalOffice", this.dsListArea.getColumn(0, "rentalOffice"));
        			sArgs 			+= Ex.util.setParam("chnCd", this.div_search.cmb_chnCd.value);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        	//----------------------------------------------------------------------------------
        	// Save
        	//----------------------------------------------------------------------------------
        	this.fn_save = function()
        	{
        		if(!this.fn_saveValidation())	return false;

        		if( confirm( "저장하시겠습니까?"))
        		{					
        			this.dsListChked.clearData();
        			var nRow = 0;

        			for(var i=0; i<this.dsList.rowcount; i++)
        			{
        				if(this.dsList.getColumn(i, "chk") == 1)
        				{
        					nRow = this.dsListChked.addRow();
        					this.dsListChked.copyRow(nRow, this.dsList, i);
        				}
        			}
        			
        			this.fn_saveDetail();
        		}
        	}
        	
        	this.fn_saveDetail = function()
        	{
        		var sSvcID        	= "saveRentalGroupOffice";                    
        		var sController   	= "/rtms/sd/saveRentalGroupOffice.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		sInDatasets   		= "input=dsListChked";
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
        		
        		if (strSvcId == "listRentalGroupOffice") { //조회

        		}
        				
        		if (strSvcId == "saveRentalGroupOffice") { //저장
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
        	// [렌탈지역찾기] 클릭: 팝업호출
        	//----------------------------------------------------------------------------------
        	this.btn_addArea_onclick = function(obj,e)
        	{
        		var args ={p_argGrid:""};
        		Ex.core.popup(this,"렌탈지역찾기","sd::RTSDRentalAreaRegisterPopup2.xfdl",args, "modaless=false");
        	}
        	
        	//----------------------------------------------------------------------------------
        	// 팝업반환값(렌탈지역찾기)
        	//----------------------------------------------------------------------------------
        	this._setReturnRentalArea = function(val){
        		var sDsNm = val[0];
        		var nRowCnt = sDsNm.rowcount;
        		
        		if ( nRowCnt > 0)
        		{
        			this.dsListArea.clearData();
        			this.dsListArea.addRow();
        			this.dsListArea.copyRow(0, sDsNm, 0); 
        		}
        	}	

        	//확장버튼 클릭시
        	this.Grid_onexpandup = function(obj,e)
        	{
        		//trace("e.col = " + e.col);
        		var nCol = e.col;
        		if(nCol == 9 || nCol == 10)
        		{
        			var args ={p_argGrid:"1"};
        			Ex.core.popup(this,"렌탈지역찾기(Grid)","sd::RTSDRentalAreaRegisterPopup.xfdl",args, "modaless=false");			
        		}		
        	}

        	//----------------------------------------------------------------------------------
        	// [Grid 렌탈지역찾기] 클릭: 팝업호출
        	//----------------------------------------------------------------------------------
        	this.fn_searchRentalMasterNm = function(obj,e)
        	{
        		var args ={p_argGrid:"1"};
        		Ex.core.popup(this,"렌탈지역찾기","sd::RTSDRentalAreaRegisterPopup.xfdl",args, "modaless=false");	
        	}

        	//----------------------------------------------------------------------------------
        	// 팝업반환값(Grid 렌탈지역찾기)
        	//----------------------------------------------------------------------------------
        	this._setReturnRentalAreaGrid = function(val){
        		var sDsNm = val[0];
        		var nRowCnt = sDsNm.rowcount;
        		
        		if ( nRowCnt > 0)
        		{
        			this.dsList.setColumn(this.dsList.rowposition, "rentalGroupNew", sDsNm.getColumn(0, "rentalGroup"));
        			this.dsList.setColumn(this.dsList.rowposition, "rentalGroupNmNew", sDsNm.getColumn(0, "rentalGroupNm"));
        			this.dsList.setColumn(this.dsList.rowposition, "rentalOfficeNew",sDsNm.getColumn(0, "rentalOffice"));
        			this.dsList.setColumn(this.dsList.rowposition, "rentalOfficeNmNew",sDsNm.getColumn(0, "rentalOfficeNm"));
        			

        			this.dsListArea.copyRow(0, sDsNm, 0); 
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
        	// Search Validation
        	//----------------------------------------------------------------------------------	
        	this.fn_searchValidation = function(){
        // 		var sChnCd = nvl(this.div_search.cmb_chnCd.value);
        // 		if(sChnCd == 0)
        // 		{
        // 		
        // 		}
        // 		else
        // 		{
        // 			var sRentalGroup = nvl(this.dsListArea.getColumn(0, "rentalGroup")); 
        // 			if(Eco.isEmpty(sRentalGroup))
        // 			{
        // 				alert("렌탈지사를 선택해주세요.");
        // 				this.div_search.btn_search.setFocus();
        // 				return false;
        // 			}
        // 			
        // 			var sRentalOffice = nvl(this.dsListArea.getColumn(0, "rentalOffice")); 
        // 			if(Eco.isEmpty(sRentalOffice))
        // 			{
        // 				alert("렌탈지역을 선택해주세요.");
        // 				this.div_search.btn_search.setFocus();
        // 				return false;
        // 			}
        // 		}
        		return true;
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
        		if(!Ex.util.isUpdated(this.dsList))
        		{
        			alert('변경된 데이터가 없습니다.');
        			return false;			
        		}

        		if(this.dsList.getCaseCount("chk == 1") == 0)
        		{
        			alert('저장할 데이타를 선택해 주세요.');
        			return false;
        		}
        		
        		var srentalGroup = "";
        		var rentalOffice = "";

        		for(var i=0; i<this.dsList.rowcount; i++)
        		{
        			if(this.dsList.getColumn(i, "chk") == 1)
        			{
        				srentalGroup = nvl(this.dsList.getColumn(i, "rentalGroupNew"));
        				if(Eco.isEmpty(srentalGroup))
        				{
        					alert("렌탈지사를 입력해 주세요");
        					this.Grid.setFocus();
        					this.Grid.selectRow(i);
        					return false;
        				}
        				
        				rentalOffice = nvl(this.dsList.getColumn(i, "rentalOfficeNew"));
        				if(Eco.isEmpty(rentalOffice))
        				{
        					alert("렌탈지역을 입력해 주세요");
        					this.Grid.setFocus();
        					this.Grid.selectRow(i);
        					return false;
        				}			
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

        	//구분 변경시
        	this.div_search_cmb_chnCd_onitemchanged = function(obj,e)
        	{
        		this.dsListArea.clearData(); //렌탈지역 초기화
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.cmb_chnCd.addEventHandler("onitemchanged", this.div_search_cmb_chnCd_onitemchanged, this);
            this.div_search.edt_grpNm.addEventHandler("onkeyup", this.div_search_edt_grpNm_onkeyup, this);
            this.div_search.edt_officeNm.addEventHandler("onkeyup", this.div_search_edt_grpNm_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.btn_addArea_onclick, this);
            this.Grid.addEventHandler("onexpandup", this.Grid_onexpandup, this);

        };

        this.loadIncludeScript("RTSDRentalGroupOffice.xfdl");

       
    };
}
)();

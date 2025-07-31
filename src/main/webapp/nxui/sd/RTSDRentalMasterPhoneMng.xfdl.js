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
            obj._setContents("<ColumnInfo><Column id=\"userId\" type=\"STRING\" size=\"0\"/><Column id=\"userNm\" type=\"STRING\" size=\"0\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_yn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">사용</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">미사용</Col></Row></Rows>");
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
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"1\"/><Column id=\"rntMstId\" type=\"STRING\" size=\"20\"/><Column id=\"userNm\" type=\"STRING\" size=\"50\"/><Column id=\"mobNo\" type=\"STRING\" size=\"13\"/><Column id=\"useYn\" type=\"STRING\" size=\"1\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"100\"/><Column id=\"isNew\" type=\"STRING\" size=\"1\"/></ColumnInfo>");
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
            obj.set_text("렌탈마스터 ID/명");
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
            obj = new Edit("edt_userNm", "absolute", "151", "10", "124", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_enable("true");
            obj.set_maxlength("100");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "61", "104", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("렌탈마스터ID");
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

            obj = new Static("Static02", "absolute", "499", "61", "103", "20", null, null, this);
            obj.set_taborder("138");
            obj.set_text("인증사용자");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btn_save2", "absolute", "1071", "61", "45", "22", null, null, this);
            obj.set_taborder("141");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_add2", "absolute", "1023", "61", "45", "22", null, null, this);
            obj.set_taborder("143");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "0", "85", "488", "393", null, null, this);
            obj.set_taborder("144");
            obj.set_binddataset("dsList");
            obj.set_autoenter("select");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"0\"/><Column size=\"158\"/><Column size=\"319\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"렌탈마스터ID\"/><Cell col=\"2\" text=\"렌탈마스터명\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"none\" style=\"align:center;\" text=\"bind:userId\" editlimit=\"3\"/><Cell col=\"2\" edittype=\"none\" style=\"align:center;\" text=\"bind:userNm\" editlimit=\"100\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid02", "absolute", "495", "85", "622", "393", null, null, this);
            obj.set_taborder("145");
            obj.set_binddataset("dsList2");
            obj.set_autoenter("select");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"0\"/><Column size=\"134\"/><Column size=\"133\"/><Column size=\"143\"/><Column size=\"60\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"\"/><Cell col=\"1\" text=\"사용자명\"/><Cell col=\"2\" text=\"휴대폰번호\"/><Cell col=\"3\" text=\"이메일\"/><Cell col=\"4\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell text=\"bind:rntMstId\" edittype=\"none\"/><Cell col=\"1\" edittype=\"normal\" text=\"bind:userNm\" editlimit=\"20\"/><Cell col=\"2\" edittype=\"expr:dataset.getColumn(currow,'isNew')=='1'?'normal':'none'\" text=\"bind:mobNo\" editlimit=\"11\" editfilter=\"digit\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:emailAddr\" editlimit=\"100\"/><Cell col=\"4\" edittype=\"combo\" combodataset=\"ds_yn\" combocodecol=\"cd\" combodatacol=\"cdNm\" text=\"bind:useYn\"/></Band></Format></Formats>");
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
        this.addIncludeScript("RTSDRentalMasterPhoneMng.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDRentalMasterPhoneMng.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : 주문관리 - 렌탈마스터
        * BUSINESS    : 판매처 2차인증 수단관리
        * FILE NAME   : RTSDRentalMasterPhoneMng.xfdl
        * PROGRAMMER  : 
        * DATE        : 
        * DESCRIPTION : 2차인증 사용자 등록/수정/삭제
        *------------------------------------------------------------------
        * MODIFY DATE   PROGRAMMER			DESCRIPTION
        *------------------------------------------------------------------
        * 2025.07.31 		길형철			최초 작성
        *------------------------------------------------------------------
        ***********************************************************************************/

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
        // Search: 렌탈마스터list
        //----------------------------------------------------------------------------------
        	this.fn_search = function()
        	{
        		this.dsList.clearData();
        		this.dsList2.clearData();
        		
        		var sSvcID        	= "listRentalAuthMstInfo";                    
        		var sController   	= "/rtms/sd/listRentalAuthMstInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList=ds_output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs 			+= Ex.util.setParam("userNm",   nvl(this.div_search.edt_userNm.value));
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        	}

        //----------------------------------------------------------------------------------
        // Search: 사용자list
        //----------------------------------------------------------------------------------
        	this.fn_searchDtl = function()
        	{
        		this.dsList2.clearData();
        		
        		if(!this.fn_searchOfficeValidation())
        		{
        			return false;
        		}		
        		
        		var sSvcID        	= "listRentalAuthPhoneInfo";                    
        		var sController   	= "/rtms/sd/listRentalAuthPhoneInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList2=ds_output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs 			+= Ex.util.setParam("rntMstId",   nvl(this.dsList.getColumn(this.dsList.rowposition, "userId")));
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        //----------------------------------------------------------------------------------
        // Save - 2차인증 사용자
        //----------------------------------------------------------------------------------
        	this.fn_save_dtl = function()
        	{
        		if(!Ex.util.isUpdated(this.dsList2)) {
        			alert('변경된 데이터가 없습니다.');
        			return false;
        		}

        		if( confirm( "저장하시겠습니까?") ){			
        			var sSvcID        	= "saveRentalAuthPhoneInfo";                    
        			var sController   	= "/rtms/sd/saveRentalAuthPhoneInfo.do";
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
        		
        		if (strSvcId == "listRentalAuthMstInfo") { //지사조회(M)
        		
        		}
        		
        		if (strSvcId == "listRentalAuthPhoneInfo") { //지역조회(D)
        		
        		}
        				
        		if (strSvcId == "saveRentalAuthPhoneInfo") { //저장
        			alert(strErrorMsg);
        			this.fn_searchDtl();
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
        	// [저장]: 2차인증 사용자
        	//----------------------------------------------------------------------------------
        	this.btn_save2_onclick = function(obj,e)
        	{
        		this.fn_save_dtl();
        	}

        	//----------------------------------------------------------------------------------
        	// [추가]: 2차인증 사용자
        	//----------------------------------------------------------------------------------
        	this.btn_add2_onclick = function(obj,e)
        	{
        		if(Eco.isEmpty(this.dsList.getColumn(this.dsList.rowposition, "userId")))
        		{
        			alert("렌탈마스터ID가 없습니다");
        			return false;
        		}
        		
        		var nRow = this.dsList2.addRow(); //추가
        		var rntMstId = this.dsList.getColumn(this.dsList.rowposition, "userId");
        		this.dsList2.setColumn(nRow, "rntMstId", rntMstId);
        		this.dsList2.setColumn(nRow, "useYn", "Y");
        		this.dsList2.setColumn(nRow, "isNew", "1");
        		
        		this.dsList2.set_rowposition(nRow);
        		this.Grid02.setCellPos(1);
        		this.Grid02.showEditor(true);
        	}

        	//----------------------------------------------------------------------------------
        	// Search Validation: 2차인증 사용자
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
        		this.fn_searchDtl(); //2차인증 사용자 조회
        	}

        	//2차인증 사용자 사용여부 체크
        	this.dsList2_cancolumnchange = function(obj,e)
        	{
        		if (this.dsList.rowcount < 1) return;
        		
        		var nRow = this.dsList2.rowposition;
        		
        		if (e.columnid == "chk")
        		{
        			if ((this.dsList.getColumn(this.dsList.rowposition, "userId") != this.dsList2.getColumn(nRow, "rntMstId")) 
        				 && !Eco.isEmpty(this.dsList2.getColumn(nRow, "rntMstId"))  )
        			{
        				alert("다른 렌탈마스터ID에 연결되어 있어 선택이 불가능합니다.");
        				return false;
        			}
        				
        			if (e.oldvalue == 0)
        			{
        				this.dsList2.setColumn(nRow, "rntMstId", this.dsList.getColumn(this.dsList.rowposition, "userId"));
        			}
        			else
        			{
        				this.dsList2.setColumn(nRow, "rntMstId", "");
        			}
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
            this.div_search.edt_userNm.addEventHandler("onkeyup", this.div_search_edt_grpNm_onkeyup, this);
            this.btn_save2.addEventHandler("onclick", this.btn_save2_onclick, this);
            this.btn_add2.addEventHandler("onclick", this.btn_add2_onclick, this);
            this.Grid01.addEventHandler("onkeyup", this.Grid00_onkeyup, this);
            this.Grid02.addEventHandler("onkeyup", this.Grid02_onkeyup, this);

        };

        this.loadIncludeScript("RTSDRentalMasterPhoneMng.xfdl");

       
    };
}
)();

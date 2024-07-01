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
                this.set_titletext("렌탈마스터 관할 대리점 설정");
                this._setFormPosition(0,0,1147,496);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"userId\" type=\"STRING\" size=\"0\"/><Column id=\"userNm\" type=\"STRING\" size=\"0\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsList2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"rntMstId\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"0\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsAuth", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"rntMstId\" type=\"STRING\" size=\"0\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"delChk\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Static("Static24", "absolute", "277", "0", "25", "44", null, null, this);
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
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"0\"/><Column size=\"158\"/><Column size=\"319\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"렌탈마스터ID\"/><Cell col=\"2\" text=\"렌탈마스터명\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"none\" style=\"align:center;\" text=\"bind:userId\" editlimit=\"3\"/><Cell col=\"2\" edittype=\"none\" style=\"align:center;\" text=\"bind:userNm\" editlimit=\"100\"/></Band></Format></Formats>");
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

            obj = new Static("Static02", "absolute", "563", "61", "97", "20", null, null, this);
            obj.set_taborder("138");
            obj.set_text("대리점");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid02", "absolute", "563", "85", "554", "393", null, null, this);
            obj.set_taborder("139");
            obj.set_binddataset("dsList2");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"39\"/><Column size=\"221\"/><Column size=\"267\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"normal\" edittype=\"none\" text=\"선택\"/><Cell col=\"1\" text=\"대리점코드\"/><Cell col=\"2\" text=\"대리점명\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" edittype=\"none\" text=\"bind:agencyCd\" editlimit=\"4\"/><Cell col=\"2\" edittype=\"none\" text=\"bind:agencyNm\" editlimit=\"100\"/></Band></Format></Formats>");
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
            		p.set_titletext("렌탈마스터 관할 대리점 설정");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDRentalMasterAgency.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDRentalMasterAgency.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 렌탈마스터 대리점 매핑설정
         * 02. 그룹명   : 공통관리-렌탈관리
         * 03. 그룹설명 :
         * 04. 작성일   : 2022.10.12
         * 05. 작성자   : 김선태
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
        		this.parent.setButton("DL|C|S", this);
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
        // Search: 렌탈대리점(D)
        //----------------------------------------------------------------------------------
        	this.fn_searchDtl = function()
        	{
        		this.dsList2.clearData();
        		
        		if(!this.fn_searchOfficeValidation())
        		{
        			return false;
        		}		
        		
        		var sSvcID        	= "listRentalAuthDtlInfo";                    
        		var sController   	= "/ntrms/cm/getRentalMasterInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList2=output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs 			+= Ex.util.setParam("rntMstId",   nvl(this.dsList.getColumn(this.dsList.rowposition, "userId")));
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}	

        //----------------------------------------------------------------------------------
        // Save - 렌탈지사
        //----------------------------------------------------------------------------------
        	this.fn_save = function()
        	{
        		if(!Ex.util.isUpdated(this.dsList2)) {
        			alert('변경된 데이터가 없습니다.');
        			return false;
        		}

        		this.dsAuth.clearData(); 
        		var nRow = -1;
        		var nCnt = 0;
        		for (var i = 0; i < this.dsList2.rowcount; i++)
        		{
        			if (this.dsList2.getColumn(i, "chk") == "1")
        			{
        				nCnt++;
        				nRow = this.dsAuth.addRow();
        				this.dsAuth.setColumn(nRow, "rntMstId", this.dsList.getColumn(this.dsList.rowposition, "userId"));
        				this.dsAuth.setColumn(nRow, "agencyCd", this.dsList2.getColumn(i, "agencyCd"));
        				this.dsAuth.setColumn(nRow, "regId", application.gds_userInfo.getColumn(0, "userId"));
        				this.dsAuth.setColumn(nRow, "delChk", nCnt);
        			}
        		}
        		
        		if( confirm( "저장하시겠습니까?") ){			
        			var sSvcID        	= "saveRentalMsterInfo";                    
        			var sController   	= "/ntrms/cm/saveRentalMasterInfo.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";
        			sArgs 			    += Ex.util.setParam("rntMstId",   this.dsList.getColumn(this.dsList.rowposition, "userId"));
        			sArgs 			    += Ex.util.setParam("regId",   application.gds_userInfo.getColumn(0, "userId"));
        			sInDatasets   		= "dsAuth=dsAuth:U";
        			sOutDatasets  		= "";
        			var fn_callBack		= "fn_callBack";
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}
        //----------------------------------------------------------------------------------
        // Delete - 렌탈지사
        //----------------------------------------------------------------------------------
        this.fn_delete = function(){

        	var sSvcID        	= "deleteRentalMsterInfo";                    
        	var sController   	= "/ntrms/cm/deleteRentalMasterInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	sArgs 			    += Ex.util.setParam("rntMstId",   this.dsList.getColumn(this.dsList.rowposition, "userId"));
        	sArgs 			    += Ex.util.setParam("regId",   application.gds_userInfo.getColumn(0, "userId"));
        	sOutDatasets  		= "";
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
        		
        		if (strSvcId == "listRentalAuthMstInfo") { //렌탈마스터조회
        		
        		}
        		
        		if (strSvcId == "getRentalMasterInfo") { //지사/지점조회
        		
        		}
        				
        		if (strSvcId == "saveRentalMsterInfo") { //저장
        			alert(strErrorMsg);
        		}
        		
        		if (strSvcId == "deleteRentalMsterInfo") { //삭제
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
        	// [저장]: 렌탈지사
        	//----------------------------------------------------------------------------------
        	this.btn_save_onclick = function(obj,e)
        	{
        		this.fn_save();
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
        		this.fn_searchDtl(); //렌탈지점 조회
        	}

        	//렌탈지점 사용여부 체크
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
            this.dsAuth.addEventHandler("cancolumnchange", this.dsList2_cancolumnchange, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.addEventHandler("onkeyup", this.div_search_onkeyup, this);
            this.div_search.edt_userNm.addEventHandler("onkeyup", this.div_search_edt_grpNm_onkeyup, this);

        };

        this.loadIncludeScript("RTSDRentalMasterAgency.xfdl");

       
    };
}
)();

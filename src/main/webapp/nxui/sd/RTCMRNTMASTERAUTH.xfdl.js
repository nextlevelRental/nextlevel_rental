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
                this.set_name("RTCMRtlMsAth");
                this.set_classname("RTCMCdGrp");
                this.set_titletext("렌탈 마스터 권한 설정");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_masterUser", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"userNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_hoboInfo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"rntPntNm\" type=\"STRING\" size=\"256\"/><Column id=\"ocfGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"pntGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"ofcCd\" type=\"STRING\" size=\"256\"/><Column id=\"ofcNm\" type=\"STRING\" size=\"256\"/><Column id=\"pntCd\" type=\"STRING\" size=\"256\"/><Column id=\"pntNm\" type=\"STRING\" size=\"256\"/><Column id=\"rntMstId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_masterCb", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_hoboCb", this);
            obj._setContents("<ColumnInfo><Column id=\"rntOfcNm\" type=\"STRING\" size=\"256\"/><Column id=\"rntPntNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grid_masterUser", "absolute", "0", "65", "362", "421", null, null, this);
            obj.set_taborder("5");
            obj.set_binddataset("ds_masterUser");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"134\"/><Column size=\"224\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"렌탈마스터 ID\"/><Cell col=\"1\" text=\"렌탈마스터명\"/></Band><Band id=\"body\"><Cell text=\"bind:userId\"/><Cell col=\"1\" text=\"bind:userNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "71", "20", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_text("검색");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_rentalMaster", "absolute", "61", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_visible("true");
            obj.set_readonly("false");
            obj.set_innerdataset("@ds_masterCb");
            obj.set_index("-1");
            obj = new Edit("ed_masterKeyword", "absolute", "206", "10", "260", "21", null, null, this.div_search);
            obj.set_taborder("2");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_rtnHoBo", "absolute", "478", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_innerdataset("@ds_hoboCb");
            obj.set_codecolumn("cdGrpCd");
            obj.set_datacolumn("cdGrpNm");
            obj.set_index("-1");
            obj = new Edit("ed_hoBoKeyword", "absolute", "625", "10", "260", "21", null, null, this.div_search);
            obj.set_taborder("5");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", "998", "10", "45", "22", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_text("조회");
            obj.style.set_background("#5d5d5dff");
            obj.style.set_border("1 solid #3e3e3eff");
            obj.style.set_color("#ffffffff");
            obj.style.set_font("bold 9 Dotum");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save", "absolute", "1052", "10", "45", "22", null, null, this.div_search);
            obj.set_taborder("6");
            obj.set_text("저장");
            obj.style.set_background("#5d5d5dff");
            obj.style.set_border("1 solid #3e3e3eff");
            obj.style.set_color("#ffffffff");
            obj.style.set_font("bold 9 Dotum");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("1");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "45", "1122", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "363", "65", "20", "431", null, null, this);
            obj.set_taborder("3");
            obj.set_text("FIX\r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_hoboInfo", "absolute", "383", "63", "739", "423", null, null, this);
            obj.set_taborder("4");
            obj.set_cellsizingtype("col");
            obj.set_binddataset("ds_hoboInfo");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"70\"/><Column size=\"221\"/><Column size=\"446\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"렌탈지사\"/><Cell col=\"2\" text=\"렌탈지점\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"chk\"/><Cell col=\"1\" text=\"bind:ofcNm\"/><Cell col=\"2\" text=\"bind:pntNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMCdGrp");
            		p.set_titletext("렌탈 마스터 권한 설정");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMRNTMASTERAUTH.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMRNTMASTERAUTH.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 공통관리 > 렌탈관리 > 렌탈마스터 권한 설정
         * 02. 그룹명		: RTCMRntMasterAuth.xfdl
         * 03. 그룹설명	: 렌탈관리
         * 04. 작성일		: 2018-12-14
         * 05. 작성자		: 심성규
         * 06. 수정이력	:
         ***********************************************************************/
        //include "lib::comLib.xjs";
        	
        	//this.resultCnt = "";//중복코드카운트
        	//this.checkCd = "";	//중복코드코드
        	//var checkCdRow; 	//중복체크ROW
        	
        /***********************************************************************************
        * Form Load Common Function
        ***********************************************************************************/
        this.RTCMRtlMsAth_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	// 콤보 박스 데이터 셋
        	this.fn_initMasterCb();
        	
        	// 콤보 박스 제어
        	this.fn_firstLoadComboBox();
        	
        	/* 공통버튼 */
        	//this.parent.setButton("S|E", this);
        }
            
        /***********************************************************************************
         * 콤보박스 데이터셋 cb_rentalMaster, 렌탈 지사 / 지점 조회 cb_rtnHoBo
         ***********************************************************************************/
        this.fn_initMasterCb = function(){
        	var sSvcID      	= "commonCodeRtlMaster";  
        	var sController   	= "ntrms/cm/commCodeRtlMaster.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	sOutDatasets 		= "ds_masterCb=output1 ds_hoboCb=output2 ds_masterUser=output3 ds_hoboInfo=output4";
        	
        	var sArgs 			= "";
        		sArgs		   += Ex.util.setParam("cdGrpCd",  "R064");
        		sArgs		   += Ex.util.setParam("cdNm", "");
        		sArgs		   += Ex.util.setParam("cdGrpCd1",  "S301");
        		sArgs		   += Ex.util.setParam("cdGrpCd2",  "S302");
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
         * 콤보 박스 제어
         ***********************************************************************************/
        this.fn_firstLoadComboBox = function() {
        	this.div_search.cb_rtnHoBo.set_readonly(true);
        	this.div_search.ed_hoBoKeyword.set_readonly(true);
        }

        /***********************************************************************************
         * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt,checkCd) {
        	
        	if (strSvcId == "commonCodeRtlMaster") {
        		this.div_search.cb_rentalMaster.set_value('RID');
        		this.div_search.cb_rtnHoBo.set_value('S301');
        	}
        	
        	if ( strSvcId == "masterUserList" ) {
        		
        		var dsMsUsRowCt = this.ds_masterUser.getRowCount();
        		
        		if ( dsMsUsRowCt == 0 ){
        			this.grid_masterUser.set_nodatatext("조회된 데이터가 없습니다.");
        			this.div_search.ed_masterKeyword.setFocus();
        		} else {
        			this.div_search.cb_rtnHoBo.set_readonly(false);
        			this.div_search.ed_hoBoKeyword.set_readonly(false);
        			this.div_search.cb_rentalMaster.set_readonly(true);
        			this.div_search.ed_masterKeyword.set_readonly(true);
        		}
        		this.ds_hoboInfo.set_enableevent(true);
        	
        	}
        	
        	if (strSvcId == "rtlHOBOList") {
        	
        		var dsHoBoRowCt = this.ds_hoboInfo.getRowCount();
        	
        		if(dsHoBoRowCt == '0') {
        			this.grid_masterUser.set_nodatatext("조회된 데이터가 없습니다.");
        			this.div_search.ed_hoBoKeyword.setFocus();
        		} else {
        			this.div_search.cb_rtnHoBo.set_readonly(true);
        			this.div_search.ed_hoBoKeyword.set_readonly(true);
        			this.div_search.cb_rentalMaster.set_readonly(true);
        			this.div_search.ed_masterKeyword.set_readonly(true);
        		}

        	}
        	
        	if (strSvcId == "masterHoBoReList") {
        	}
        	/*
        	if( strSvcId == "cdGrpCdOverlapConfirm" ) {
        		var msg = "";
        		if(this.resultCnt != "0") {
        			msg = "입력하신 공통코드 \'" + this.ed_cdGrpCd.value + "\'는 존재하고 있습니다.";
        			this.ed_cdGrpCd.set_value("");
        			this.ed_cdGrpCd.setFocus();
        		} else {
        			msg = "사용가능한 공통코드 입니다.";
        			this.ed_cdGrpCd.set_enable(false);
        			this.btn_overlapConfirm.set_visible(false)
        			this.ed_overlapConfirmFlag.set_value("true");
        			this.ed_cdGrpNm.setFocus(true);
        		}
        		resultCnt = 0;
        		alert(msg);
        	}
        	
        	if( strSvcId == "saveCdGrp" ){
        		if( nErrorCode == "0" ){
        			alert(strErrorMsg);
        			this.reload();
        		}else{
        			alert(strErrorMsg);
        		}
        	}
        	
        	if( strSvcId == "listCdGrpChild" ){
        		var dsCdGrpChildRowCt = this.ds_cdGrpChild.getRowCount();
        		if( dsCdGrpChildRowCt == 0 ){
        			this.grid_cdGrpChild.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        	}
        	//최초로드시 공통코드선택
        	if(strSvcId == "listcdGrpCombo") {
        		this.div_search.cb_searchCondition.set_value("CD_GRP_CD");
        	}
        	*/
        }

        /***********************************************************************************
         * 조회
         ***********************************************************************************/
        this.fn_search = function(obj,e) {

        	if (this.div_search.cb_rtnHoBo.readonly && this.div_search.ed_hoBoKeyword.readonly) {
        		this.fn_rtlMasterSearch();
        	} else if (this.div_search.cb_rentalMaster.readonly && this.div_search.ed_masterKeyword.readonly) {
        		this.fn_rtlLocationSearch();
        	}
        	
        }

        /***********************************************************************************
         * 렌탈 마스터 사용자 검색
         ***********************************************************************************/
        this.fn_rtlMasterSearch = function() {
        	var cbRentalMasterVal 	 = nvl(this.div_search.cb_rentalMaster.value);
        	var edMasterKeywordVal 	 = nvl(this.div_search.ed_masterKeyword.text);
        	
        	var sSvcID        	= "masterUserList";                    
        	var sController   	= "ntrms/cm/rtlMasterList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_masterUser=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	if ( cbRentalMasterVal == 'RID' ) {
        		sArgs += Ex.util.setParam("userId", edMasterKeywordVal);
        	}else if ( cbRentalMasterVal == 'RNM' ) {
        		sArgs += Ex.util.setParam("userNm", edMasterKeywordVal);
        	}else {
        		alert("검색조건을 선택하세요.");
        		return this.div_search.cb_rentalMaster.setFocus();
        	}
        	
        	this.ds_masterUser.clearData();
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
         * 렌탈 마스터 지사 지점 검색
         ***********************************************************************************/
        this.fn_rtlLocationSearch = function() {
        	var cbRtnHoBoVal 	 = nvl(this.div_search.cb_rtnHoBo.value);
        	var edHoBoKeywordVal = nvl(this.div_search.ed_hoBoKeyword.text);
        	
        	var sSvcID        	= "masterUserList";                    
        	var sController   	= "ntrms/cm/rtlHOBOList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_hoboInfo=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	
        	
        	if ( cbRtnHoBoVal == 'S301' ) {
        		sArgs += Ex.util.setParam("rntOfcNm", edHoBoKeywordVal);
        	}else if ( cbRtnHoBoVal == 'S302' ) {
        		sArgs += Ex.util.setParam("rntPntNm", edHoBoKeywordVal);
        	}else {
        		alert("검색조건을 선택하세요.");
        		return this.div_search.cb_rtnHoBo.setFocus();
        	}
        	
        	this.ds_hoboInfo.clearData();
        	this.ds_hoboInfo.set_enableevent(false);
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
         * combo box 클릭 이벤트 
         ***********************************************************************************/
        this.fn_comboBoxClick = function(obj,e) {
        	// 해당 콤보 박스 정보 
        	if (obj.id == 'cb_rentalMaster') {
        		this.div_search.cb_rtnHoBo.set_readonly(true);
        		this.div_search.ed_hoBoKeyword.set_readonly(true);
        		this.div_search.cb_rentalMaster.set_readonly(false);
        		this.div_search.ed_masterKeyword.set_readonly(false);
        	} else if (obj.id == 'cb_rtnHoBo'){
        		this.div_search.cb_rtnHoBo.set_readonly(false);
        		this.div_search.ed_hoBoKeyword.set_readonly(false);
        		this.div_search.cb_rentalMaster.set_readonly(true);
        		this.div_search.ed_masterKeyword.set_readonly(true);
        	}
        }

        /***********************************************************************************
         * HoBo 그리드 선택시 해당 로우 정보 재검색
         ***********************************************************************************/
        this.fn_rtlReLocationSearch = function(obj,e) {
        	var userIdVal = obj.getColumn(e.newrow, 'userId');
        	var chkVal = this.ds_hoboInfo[0];
        	console.log('chkVal', chkVal);
        }

        this.fn_ReLocationSearch= function(ofcCdVal,pntCdVal) {
        	this.ds_hoboInfo.clearData();

        	var sSvcID        	= "masterHoBoReList";                    
        	var sController   	= "ntrms/cm/rtlHOBOList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_hoboInfo=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        		sArgs += Ex.util.setParam("ofcCd", nvl(ofcCdVal));
        		sArgs += Ex.util.setParam("pntCd", nvl(pntCdVal));
        	
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*    
            FN_stringByteLength = function(p_val){
        		var objString = new String(p_val);
        		var stringByteLength = 0;
        		for(var i=0; i<objString.length; i++)
        		{
        			if( escape(objString.charAt(i)).length >= 4)  stringByteLength += 3;
        			else if(escape(objString.charAt(i)) == "%A7") stringByteLength += 3;
        			else if(escape(objString.charAt(i)) != "%0D") stringByteLength++;
        		}
        		return stringByteLength;
        	}
            
        	
        	this.RTCMCdGrp_onload = function(obj:Form, e:nexacro.LoadEventInfo)
        	{
        		Ex.core.init(obj); 	
        		this.fn_init();
        		this.parent.setButton("E|C|N|S", this);
        	}
        */

        

        /*
        	this.div_cdGrp_grid_codeGrp_onselectchanged = function(obj:Grid, e:nexacro.GridSelectEventInfo)
        	{
        		if(this.ds_cdGrp.getRowType( this.ds_cdGrp.rowposition ) != 2){
        			this.ed_cdGrpCd.set_value	(this.ds_cdGrp.getColumn(this.grid_cdGrp.currentrow, "cdGrpCd"));
        			this.cb_mdlCd.set_value		(this.ds_cdGrp.getColumn(this.grid_cdGrp.currentrow, "mdlCd"));
        			this.ed_cdGrpNm.set_value	(this.ds_cdGrp.getColumn(this.grid_cdGrp.currentrow, "cdGrpNm"));
        			this.cd_useYn.set_value		(this.ds_cdGrp.getColumn(this.grid_cdGrp.currentrow, "useYn"));
        			this.ed_cdGrpDesc.set_value	(this.ds_cdGrp.getColumn(this.grid_cdGrp.currentrow, "cdGrpDesc"));
        			
        			this.ed_cdGrpCd.set_enable(false);
        			this.btn_overlapConfirm.set_visible(false);
        			
        			this.ed_overlapConfirmFlag.set_value("true");
        			this.fn_listCdGrpChild("parent");
        		}
        		
        		if(this.ds_cdGrp.getRowType( this.ds_cdGrp.rowposition ) == 2){
        			this.ed_cdGrpCd.set_enable(true);
        			this.btn_overlapConfirm.set_visible(true);
        			this.ed_overlapConfirmFlag.set_value("false");
        			this.ds_cdGrpChild.clearData();
        		}
        	}
        	
        	this.fn_add = function(obj:Button,  e:nexacro.ClickEventInfo)
        	{
        		var nRow = this.ds_cdGrp.addRow();
        		this.ds_cdGrp.setColumn(nRow,"useYn", "Y");
        		this.ed_cdGrpCd.setFocus(true);
        		this.ds_cdGrpChild.clearData();
        	}

        

        	
        	
        	

        	this.fn_save = function(obj:Button,  e:nexacro.ClickEventInfo)
        	{
        		var dsCdGrpChildRowCt = this.ds_cdGrpChild.getRowCount();
        		var exitFlag = false;
        		var overlapConfirmVal 	= nvl(this.ed_overlapConfirmFlag.value);
        		var overlapConfirmTxt 	= nvl(this.btn_overlapConfirm.text);
        		
        		if( overlapConfirmVal == "true" ){
        			var edCdGrpCdVal 	= nvl(this.ed_cdGrpCd.value);
        			var cbMdlCdVal 		= nvl(this.cb_mdlCd.value);
        			var edCdGrpNmVal 	= nvl(this.ed_cdGrpNm.value);
        			var cdUseYnVal 		= nvl(this.cd_useYn.value);
        			var edCdGrpDescVal 	= nvl(this.ed_cdGrpDesc.value);
        			
        			var cdGrpCdTxt 		= nvl(this.st_cdGrpCd.text);
        			var cdGrpNmTxt 		= nvl(this.st_cdGrpNm.text);
        			var cdUseYnTxt 		= nvl(this.st_useYn.text);
        			
        			if( edCdGrpCdVal == "" ){
        				alert(cdGrpCdTxt + " 값이 없습니다.");
        				this.ed_cdGrpCd.setFocus();
        			}else if( FN_stringByteLength(edCdGrpCdVal)  > 4 ){
        				alert(cdGrpCdTxt + " 크기가 4Byte를 초과하였습니다.");
        				this.ed_cdGrpCd.setFocus();
        			}else if( edCdGrpNmVal == "" ){
        				alert("저장되었습니다.");
        				this.ed_cdGrpNm.setFocus();
        			}else if( cdUseYnVal == "" ){
        				alert(cdUseYnTxt + " 값이 없습니다.");
        				this.cd_useYn.setFocus();
        			}else{
        				
        				if( dsCdGrpChildRowCt > 0){
        					for( var row_i = 1 , row_ii = 0 ; row_i <= dsCdGrpChildRowCt ; row_i++, row_ii++){
        						for( var cell_i = 0 ; cell_i <= 3 ; cell_i++){
        						
        							var cellVal = nvl(this.grid_cdGrpChild.getCellValue(row_ii, cell_i));
        							
        							if( (cell_i == 0 || cell_i == 1) && cellVal == "" ){
        								alert(nvl(this.grid_cdGrpChild.getCellText(-1, cell_i)) + " 값이 없습니다.");
        								this.grid_cdGrpChild.selectRow(row_ii);
        								this.grid_cdGrpChild.setCellPos(cell_i);
        								this.grid_cdGrpChild.showEditor(true);
        								exitFlag = true;
        							}else if( cell_i == 0 && FN_stringByteLength(cellVal) > 16 ){
        								alert(nvl(this.grid_cdGrpChild.getCellText(-1, cell_i)) + " 크기가 16Byte를 초과하였습니다.");
        								this.grid_cdGrpChild.selectRow(row_ii);
        								this.grid_cdGrpChild.setCellPos(cell_i);
        								this.grid_cdGrpChild.showEditor(true);
        								exitFlag = true;
        							}
        							
        							if(exitFlag){break;}
        						}
        						for( var find_i = 1 ; find_i <= dsCdGrpChildRowCt ; find_i++ ){
        							if( row_i != find_i && nvl(this.ds_cdGrpChild.getColumn( row_i, "cd" )) ==  nvl(this.ds_cdGrpChild.getColumn( find_i, "cd" )) ){
        								alert( "\'" + nvl(this.ds_cdGrpChild.getColumn(  find_i, "cd" )) + "\'" + " 중복된 코드값입니다." );
        								this.grid_cdGrpChild.selectRow(find_i);
        								this.grid_cdGrpChild.setCellPos(0);
        								this.grid_cdGrpChild.showEditor(true);
        								exitFlag = true;
        							}
        							if(exitFlag){break;}
        						}
        					}
        				}else{
        					exitFlag = false;
        				}
        				
        				if( !exitFlag  ){
        					var saveFlag_1 = true;
        					var saveFlag_2 = true;
        					if( this.ds_cdGrp.getRowType( this.ds_cdGrp.rowposition ) == 1 ){
        						saveFlag_1 = false;
        					}else{
        						saveFlag_1 = true;
        					}
        					
        					for(var i  = 0 ; i < this.ds_cdGrpChild.getRowCount() ; i++){
        						if( this.ds_cdGrpChild.getRowType( i ) == 1){
        							saveFlag_2 = false;
        						}else{
        							saveFlag_2 = true;break;
        						}
        					}
        					
        					if( saveFlag_1 == true || saveFlag_2 == true){
        						var sSvcID        	= "saveCdGrp";                    
        						var sController   	= "rtms/cm/saveCdGrp.do";
        						var sInDatasets   	= "";
        						var sOutDatasets  	= "";
        						var sArgs 			= "";
        						var fn_callBack		= "fn_callBack";
        						sInDatasets += "input1=ds_cdGrp:U input2=ds_cdGrpChild:U";
        						Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        					}else{
        						alert("수정된 사항이 없습니다.");
        					}
        				}				
        			}
        		}else{
        			alert(overlapConfirmTxt + "을 하십시오.");
        			this.btn_overlapConfirm.setFocus();
        		}
        	}

        

        	this.div_cdGrpDetails_btn_overlapConfirm_onclick = function(obj:Button,  e:nexacro.ClickEventInfo)
        	{
        		var edCdGrpCdVal = nvl(this.ed_cdGrpCd.value);
        		
        		if( nvl(edCdGrpCdVal) != "" ){
        			var sSvcID        	= "cdGrpCdOverlapConfirm";                    
        			var sController   	= "rtms/cm/cdGrpCdOverlapConfirm.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";
        			sInDatasets   		= "";
        			sOutDatasets  		= "";
        			var fn_callBack		= "fn_callBack";
        			
        			sArgs += Ex.util.setParam("cdGrpCd",edCdGrpCdVal);
        			
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}else{
        			alert("공통코드 값이 없습니다.");
        			this.ed_cdGrpCd.setFocus();
        		}
        	}
        	
        	
        	
        	this.div_cdGrpChild_btn_searchChild_onclick = function(obj:Button,  e:nexacro.ClickEventInfo)
        	{
        		this.fn_listCdGrpChild("child");
        	}
        	
        	
        	
        	this.fn_listCdGrpChild = function(division){
        		var grid_cdGrp_selectNb = this.grid_cdGrp.currentrow;
        	
        		var cbSearchConditionChildVal = nvl(this.cb_searchConditionChild.value);
        		var cbSearchConditionTxt 	  = this.cb_searchConditionChild.text;
        		var edSearchKeywordChildVal   = nvl(this.ed_searchKeywordChild.value);
        		
        		var sSvcID        	= "listCdGrpChild";
        		var sController   	= "rtms/cm/listCdGrpChild.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_cdGrpChild=mapCdGrpChild";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam( "cdGrpCd", this.ds_cdGrp.getColumn(grid_cdGrp_selectNb, "cdGrpCd") );
        		
        		if( division == "child"){
        			if( cbSearchConditionChildVal == 'CD_GRP_CD' ){
        				sArgs += Ex.util.setParam("cd", edSearchKeywordChildVal);
        			}else if( cbSearchConditionChildVal == 'CD_GRP_NM' ){
        				
        				if( edSearchKeywordChildVal.length < 2){
        					alert(cbSearchConditionTxt + "은 최소 2글자 이상이여야 합니다.");
        					this.div_cdGrpChild.ed_searchKeywordChild.setFocus();
        				}else{
        					sArgs += Ex.util.setParam( "cdNm", edSearchKeywordChildVal );
        				}
        			}else{
        				alert("검색조건을 선택하세요.");
        				return this.cb_searchConditionChild.setFocus();
        			}
        		}
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        

        	this.btnAddChild_onclick = function(obj:Button,  e:nexacro.ClickEventInfo)
        	{
        		var cdGrpCdVal 			= nvl(this.ed_cdGrpCd.value);
        		var cdGrpNmVal 			= nvl(this.ed_cdGrpNm.value);
        		var cdUseYnVal 			= nvl(this.cd_useYn.value);
        		var overlapConfirmVal 	= nvl(this.ed_overlapConfirmFlag.value);
        		
        		var cdGrpCdTxt = nvl(this.st_cdGrpCd.text);
        		var cdGrpNmTxt = nvl(this.st_cdGrpNm.text);
        		var cdUseYnTxt = nvl(this.st_useYn.text);
        		var overlapConfirmTxt = nvl(this.btn_overlapConfirm.text);
        		
        		if( cdGrpCdVal == "" ){
        			alert(cdGrpCdTxt + " 값이 없습니다.");
        			this.ed_cdGrpCd.setFocus();
        		}else if( cdGrpNmVal == "" ){
        			alert(cdGrpNmTxt + " 값이 없습니다.");
        			this.ed_cdGrpNm.setFocus();
        		}else if( cdUseYnVal == "" ){
        			alert(cdUseYnTxt + " 값이 없습니다.");
        			this.cd_useYn.setFocus();
        		}else if( overlapConfirmVal == "false"){
        			alert(overlapConfirmTxt + "을 하십시오.");
        			this.btn_overlapConfirm.setFocus();
        		}else{
        			var nRow = this.ds_cdGrpChild.addRow();
        			this.grid_cdGrpChild.selectRow(nRow);
        			this.grid_cdGrpChild.setCellPos(0);
        			this.grid_cdGrpChild.showEditor(true);
        			this.ds_cdGrpChild.setColumn(nRow,"useYn","Y");
        			this.ds_cdGrpChild.setColumn(nRow,"cdGrpCd",cdGrpCdVal);
        		}
        	}

        

        	this.btnDelChild_onclick = function(obj:Button,  e:nexacro.ClickEventInfo)
        	{
        		var gridCdGrpChildSlected = this.grid_cdGrpChild.currentrow;
        		
        		if( gridCdGrpChildSlected == -9 ){
        			alert("삭제할 행을 선택하여 주십시오.");
        		}else{
        			this.ds_cdGrpChild.deleteRow(gridCdGrpChildSlected);
        		}
        	}

        

        	this.ds_cdGrpChild_oncolumnchanged = function(obj:Dataset, e:nexacro.DSColChangeEventInfo)
        	{
        		if(e.columnid == "cd") {
        			checkCdRow = e.row;
        			this.FN_cdGrpCdCheck( nvl(obj.getColumn(e.row, "cdGrpCd")), nvl(obj.getColumn(e.row, "cd")) );
        		}
        	}

        

        	this.FN_cdGrpCdCheck = function( objVal1, objVal2)
        	{
        		var sSvcID        	= "checkCd";
        		var sController   	= "rtms/cm/checkCd.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("cdGrpCd",objVal1);
        		sArgs += Ex.util.setParam("cd"	   ,objVal2);
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	
        	this.fn_excel= function() {
        		//Ex.core.exportExcel(this, this.grid_cdGrpChild);
        		var objArray1 = new Array();
        		objArray1.push(this.grid_cdGrp);
        		objArray1.push(this.grid_cdGrpChild);
        		Ex.core.exportExcel(this, objArray1);
        	}
        	

        
        // 2016-05-03 이영근, 엔터키 입력시 조회
        this.div_search_ed_searchKeyword_onkeyup = function(obj:Edit, e:nexacro.KeyEventInfo)
        {
        	if( e.keycode == "13" ){
        		this.fn_search();
        	}	
        }
        */

        
        this.ds_hoboInfo_onrowposchanged = function(obj,e)
        {
        	
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_masterUser.addEventHandler("onrowposchanged", this.fn_rtlReLocationSearch, this);
            this.addEventHandler("onload", this.RTCMRtlMsAth_onload, this);
            this.grid_masterUser.addEventHandler("onselectchanged", this.div_cdGrp_grid_codeGrp_onselectchanged, this);
            this.div_search.cb_rentalMaster.addEventHandler("oneditclick", this.fn_comboBoxClick, this);
            this.div_search.ed_masterKeyword.addEventHandler("onkeyup", this.div_search_ed_searchKeyword_onkeyup, this);
            this.div_search.cb_rtnHoBo.addEventHandler("oneditclick", this.fn_comboBoxClick, this);
            this.div_search.btn_search.addEventHandler("onclick", this.fn_search, this);

        };

        this.loadIncludeScript("RTCMRNTMASTERAUTH.xfdl");

       
    };
}
)();

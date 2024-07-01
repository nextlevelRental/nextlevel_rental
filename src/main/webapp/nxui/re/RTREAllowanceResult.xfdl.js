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
                this.set_name("RTREAllowanceResult");
                this.set_classname("test_form");
                this.set_titletext("충당금 현황");
                this._setFormPosition(0,0,1147,496);
            }
            this.style.set_color("#333333ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list01", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"lifnr\" type=\"STRING\" size=\"256\"/><Column id=\"apfdAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_list02", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"apfdDay\" type=\"STRING\" size=\"256\"/><Column id=\"apfdTp\" type=\"STRING\" size=\"256\"/><Column id=\"apfdNm\" type=\"STRING\" size=\"256\"/><Column id=\"apfdPamt\" type=\"STRING\" size=\"256\"/><Column id=\"apfdMamt\" type=\"STRING\" size=\"256\"/><Column id=\"apfdMsg\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_copy", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"apfdDay\" type=\"STRING\" size=\"256\"/><Column id=\"apfdTp\" type=\"STRING\" size=\"256\"/><Column id=\"apfdNm\" type=\"STRING\" size=\"256\"/><Column id=\"apfdPamt\" type=\"STRING\" size=\"256\"/><Column id=\"apfdMamt\" type=\"STRING\" size=\"256\"/><Column id=\"apfdMsg\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsRentalInfo", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("13");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list01", "absolute", "1", "107", "572", "389", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_list01");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"140\"/><Column size=\"80\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"43\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"렌탈지사\"/><Cell col=\"1\" text=\"렌탈지점\"/><Cell col=\"2\" text=\"판매처코드\"/><Cell col=\"3\" text=\"판매처명\"/><Cell col=\"4\" text=\"벤더코드\"/><Cell col=\"5\" text=\"충당금\"/></Band><Band id=\"body\"><Cell text=\"bind:rentalGroupNm\" tooltiptext=\"bind:salesGroupNm\"/><Cell col=\"1\" text=\"bind:rentalOfficeNm\" tooltiptext=\"bind:salesOfficeNm\"/><Cell col=\"2\" text=\"bind:agencyCd\" tooltiptext=\"bind:agencyCd\"/><Cell col=\"3\" text=\"bind:agencyNm\" tooltiptext=\"bind:agencyNm\"/><Cell col=\"4\" text=\"bind:lifnr\" tooltiptext=\"bind:lifnr\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"none\" style=\"align:right;\" text=\"bind:apfdAmt\" tooltiptext=\"bind:apfdAmt\"/></Band><Band id=\"summary\"><Cell style=\"align: ;\" text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" expr=\"dataset.getSum(&quot;apfdAmt&quot;)\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "82", "140", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_text("검색내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "585", "82", "140", "20", null, null, this);
            obj.set_taborder("21");
            obj.set_text("판매처별 세부내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list02", "absolute", "583", "107", "539", "389", null, null, this);
            obj.set_taborder("26");
            obj.set_binddataset("ds_list02");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"140\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"300\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"판매처명\"/><Cell col=\"1\" text=\"발생일자\"/><Cell col=\"2\" text=\"구분\"/><Cell col=\"3\" text=\"발생금액\"/><Cell col=\"4\" text=\"차감금액\"/><Cell col=\"5\" style=\"align:center;\" text=\"  내용\"/></Band><Band id=\"body\"><Cell text=\"bind:agencyNm\" tooltiptext=\"bind:agencyNm\"/><Cell col=\"1\" displaytype=\"date\" text=\"bind:apfdDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:apfdDay\"/><Cell col=\"2\" text=\"bind:apfdNm\" tooltiptext=\"bind:apfdNm\"/><Cell col=\"3\" style=\"align:right;\" text=\"bind:apfdPamt\" tooltiptext=\"bind:apfdPamt\"/><Cell col=\"4\" displaytype=\"normal\" style=\"align:right;\" text=\"bind:apfdMamt\" tooltiptext=\"bind:apfdMamt\"/><Cell col=\"5\" style=\"align:left;\" text=\"bind:apfdMsg\" tooltiptext=\"bind:apfdMsg\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right;\" expr=\"dataset.getSum(&quot;apfdPamt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;\" expr=\"dataset.getSum(&quot;apfdMamt&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"5\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1121", "71", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "1122", "0", "25", "496", null, null, this.div_search);
            obj.set_taborder("199");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "31", "1118", "5", null, null, this.div_search);
            obj.set_taborder("200");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "0", "57", "1118", "10", null, null, this.div_search);
            obj.set_taborder("201");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "72", "1118", "38", null, null, this.div_search);
            obj.set_taborder("202");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "67", null, null, this.div_search);
            obj.set_taborder("203");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "528", "10", "150", "21", null, null, this.div_search);
            obj.set_taborder("204");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("120");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyCd", "absolute", "448", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("205");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "368", "9", "80", "21", null, null, this.div_search);
            obj.set_taborder("206");
            obj.set_text("판매처");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "25", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("208");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "25", "36", "80", "21", null, null, this.div_search);
            obj.set_taborder("209");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesOfficeCd", "absolute", "105", "36", "120", "21", null, null, this.div_search);
            obj.set_taborder("210");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroupCd", "absolute", "105", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("211");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesOfficeNm", "absolute", "225", "36", "118", "21", null, null, this.div_search);
            obj.set_taborder("212");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroupNm", "absolute", "225", "10", "118", "21", null, null, this.div_search);
            obj.set_taborder("213");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "343", "0", "25", "67", null, null, this.div_search);
            obj.set_taborder("214");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_agencyCd", "absolute", "506", "10", "21", "21", null, null, this.div_search);
            obj.set_taborder("218");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_salesOfficeCd", "absolute", "204", "36", "21", "21", null, null, this.div_search);
            obj.set_taborder("219");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_salesGroupCd", "absolute", "204", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("220");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "0", "1118", "10", null, null, this.div_search);
            obj.set_taborder("221");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "97", "1147", "10", null, null, this);
            obj.set_taborder("30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "71", "1147", "15", null, null, this);
            obj.set_taborder("31");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "573", "0", "10", "496", null, null, this);
            obj.set_taborder("32");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "528", "80", "45", "22", null, null, this);
            obj.set_taborder("33");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", "1077", "80", "45", "22", null, null, this);
            obj.set_taborder("34");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1121, 73, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("27");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("test_form");
            		p.set_titletext("충당금 현황");
            		p.style.set_color("#333333ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREAllowanceResult.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREAllowanceResult.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 수금관리 > 수수료 > 충당금 현황
         * 02. 그룹명   : RTREAllowanceResult.xfdl
         * 03. 그룹설명 :
         * 04. 작성일   : 2015.12.10
         * 05. 작성자   : 윤용택
         * 06. 수정이력 :
         ***********************************************************************
         *     수정일     작성자   내용
         ***********************************************************************
         *
         ***********************************************************************
         */

        /***********************************************************************
         * Script Include
         ************************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
        ************************************************************************/

        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
        this.codeName = "";
        this.agencyName = "";

        //-------------------------------------------------------------------------------   
        //폼로드시 공통함수
        //-------------------------------------------------------------------------------  	 
        this.form_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	this.fn_userRentalGroupInfo();
        }

        //-------------------------------------------------------------------------------
        //초기화
        //-------------------------------------------------------------------------------
        this.fn_init = function() {
        	var div		 = this.div_search;
        	var gdsUser  = application.gds_userInfo;
        	var dsRental = this.dsRentalInfo;
        	
        	var userId	= gdsUser.getColumn(0,	"userId");			/* ID			*/
        	var userNm	= gdsUser.getColumn(0,	"userNm");			/* 이름			*/
        	var userGrp	= gdsUser.getColumn(0,	"userGrp");			/* 그룹			*/
        	var vkgrp	= dsRental.getColumn(0,	"rentalGroup"); 	/* 지사코드	*/
        	var vkgrpNm = dsRental.getColumn(0,	"rentalGroupNm");	/* 지사Nm		*/
        	var vkbur	= dsRental.getColumn(0,	"rentalOffice");	/* 지점코드	*/
        	var vkburNm	= dsRental.getColumn(0,	"rentalOfficeNm");	/* 지점NM		*/
        	var vkazc	= gdsUser.getColumn(0,	"vkazc");			/* 대리점		*/
        	var vkazcNm	= gdsUser.getColumn(0,	"vkazcNm");			/* 대리점NM	*/
        	
        	if(userGrp != "01" && userGrp != "02" && userGrp != "RM") {
        		div.ed_salesGroupCd.set_enable(false);		/* 렌탈지사Code Disabled		*/
        		div.ed_salesGroupNm.set_enable(false);		/* 렌탈지사Name Disabled		*/
        		div.bt_salesGroupCd.set_visible(false);		/* 렌탈지사Button Invisible	*/
        		div.ed_salesOfficeCd.set_enable(false);		/* 렌탈지점Code Disabled 		*/
        		div.ed_salesOfficeNm.set_enable(false);		/* 렌탈지점Name Disabled		*/
        		div.bt_salesOfficeCd.set_visible(false);	/* 렌탈지점Button visible		*/
        		div.ed_agencyCd.set_enable(false);			/* 장착대리점Code Disabled		*/
        		div.ed_agencyNm.set_enable(false);			/* 장착대리점Name Disabled		*/
        		div.bt_agencyCd.set_visible(false);			/* 장착대리점Button Invisible	*/
        		
        		div.ed_salesGroupCd.set_value(vkgrp);
        		div.ed_salesGroupNm.set_value(vkgrpNm);
        		div.ed_salesOfficeCd.set_value(vkbur);
        		div.ed_salesOfficeNm.set_value(vkburNm);
        		div.ed_agencyCd.set_value(userId);
        		div.ed_agencyNm.set_value(userNm);
        	}
        }

        /***********************************************************************************
        * Transaction Function
        ***********************************************************************************/
        //----------------------------------------------------------------------------------
        // Search: 사용자 렌탈그룹 조회
        //----------------------------------------------------------------------------------
        this.fn_userRentalGroupInfo = function() {
        	this.dsRentalInfo.clearData();
        	
        	var sSvcID		 = "userRentalGroupInfo";
        	var sController	 = "/rtms/sd/userRentalGroupInfo.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "dsRentalInfo=ds_output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("userId", application.gds_userInfo.getColumn(0, "userId"));
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //---------------------------------------------------------------------------------
        // 충당금 현황(검색내역)
        //---------------------------------------------------------------------------------
        this.fn_search = function(obj,e) {
        	this.ds_list01.clearData();
        	this.ds_list02.clearData();		
        	this.grd_list02.set_binddataset("");		
        	this.grd_list01.set_nodatatext("");	
        	this.grd_list02.set_nodatatext("");	
        		
        	var salesGroup 		= ""; //지사
        	var salesOffice 	= ""; //지점
        	var agencyCd 		= nvl(this.div_search.ed_agencyCd.value); //판매처
        	
        	var rentalGroup 	= nvl(this.div_search.ed_salesGroupCd.value); //렌탈지사
        	var rentalOffice 	= nvl(this.div_search.ed_salesOfficeCd.value); //렌탈지점
        	var userId      	= application.gds_userInfo.getColumn(0, "userId"); //사용자ID
        	
        	var userGrp 	= application.gds_userInfo.getColumn(0, "userGrp"); //그룹

        	var bfVkgrp 	= application.gds_userInfo.getColumn(0, "vkgrp"); //지사코드
        	var bfVkgrpNm 	= application.gds_userInfo.getColumn(0, "vkgrpNm"); //지사Nm
        	var bfVkbur 	= application.gds_userInfo.getColumn(0, "vkbur"); //지점코드
        	var bfVkburNm 	= application.gds_userInfo.getColumn(0, "vkburNm"); //지점NM

        	
        	var afVkgrpNm 	= this.div_search.ed_salesGroupNm.value; //팝업 지사Nm
        	var afVkburNm 	= this.div_search.ed_salesOfficeNm.value; //팝업 지점Nm
        	
        	/* 렌탈지사지점 Check 해제 */
        // 	if (rentalGroup == "" || rentalGroup == null)
        // 	{
        // 		alert("렌탈지사를 선택하세요.");
        // 		return false;
        // 	}
        // 	if (rentalOffice == "" || rentalOffice == null)
        // 	{
        // 		alert("렌탈지점을 선택하세요.");
        // 		return false;
        // 	}
        	
        	if(userGrp == '04') { //지점
        		if(bfVkgrpNm != afVkgrpNm) {
        			alert("타 조직내역 조회 불가합니다.");
        			return;
        		}
        		if(bfVkburNm != afVkburNm) {
        			alert("타 조직내역 조회 불가합니다.");
        			return;
        		}
        	}
        	
        	if(userGrp == '03' || userGrp == '07') { //지사
        		if(bfVkgrpNm != afVkgrpNm) {
        			alert("타 조직내역 조회 불가합니다.");
        			return;
        		}
        	}
        		
        	//검색 내역
        	var sSvcID        	= "allowanceResultList";                    
        	var sController   	= "/rtms/re/allowanceResultList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list01=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("salesGroup", salesGroup);
        	sArgs += Ex.util.setParam("salesOffice", salesOffice);
        	sArgs += Ex.util.setParam("agencyCd", agencyCd);
        	sArgs += Ex.util.setParam("rentalGroup", rentalGroup);
        	sArgs += Ex.util.setParam("rentalOffice", rentalOffice);
        	sArgs += Ex.util.setParam("userId", userId);
        			
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		
        }
        //---------------------------------------------------------------------------------
        // 충당금 현황(판매처별 세부내역)
        //---------------------------------------------------------------------------------	
        this.fn_getAgencyResultList = function() 
        {
        	this.grd_list02.set_nodatatext("");
        	this.ds_list02.clearData();	
        	
        	var sSvcID      	= "getAgencyResultList";  
        	var sController   	= "/rtms/re/getAgencyResultList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_list02=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        							
        	sArgs += Ex.util.setParam("agencyCd"	, nvl(this.ds_list01.getColumn(this.ds_list01.rowposition,"agencyCd")));     //판매처코드

        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	

        }

        /***********************************************************************************
        * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	switch(strSvcId) {
        		/* 사용자 렌탈그룹 조회 */
        		case "userRentalGroupInfo":
        			/* 버튼초기화 */
        			this.fn_initBtn();
        			
        			this.fn_init();
        			break;
        		
        		//충당금 현황(검색내역)				
        		case "allowanceResultList":
        		
        			if(this.ds_list01.rowcount == 0) {
        			   this.grd_list01.set_nodatatext("조회된 결과가 없습니다.");
        			}
        			break;
        		//충당금 현황(판매처별 세부내역)	
        		case "getAgencyResultList":
        			if(this.ds_list02.rowcount == 0) {
        			   this.grd_list02.set_nodatatext("조회된 결과가 없습니다.");     
        			}
        			if(this.ds_list02.rowcount > 0) {
        				this.grd_list02.set_binddataset(this.ds_list02);				
        				var pos = this.ds_list01.rowposition;	
        				this.ds_copy.clearData();
        				var row = this.ds_copy.addRow();
        				this.ds_copy.copyRow(row, this.ds_list01, pos);							
        			}  	
        			break;	
        		//지사
        		case "getCodeS018":
        			this.div_search.ed_salesGroupNm.set_value(this.codeName);
        			break;
        		//지점	
        		case "getCodeS019":
        			this.div_search.ed_salesOfficeNm.set_value(this.codeName);
        			break;
        		//판매처
        		case "getAgencyName":
        			this.div_search.ed_agencyNm.set_value(nexacro._replaceAll(this.agencyName, "&#32;", " "));
        			break;																
        		default:
        			break;
        	}
        }

        //지사
        this.div_search_bt_salesGroupNm_onclick = function(obj,e)
        {
        	 var args ={p_arg:"RTRESaleCommission"};
        	 Ex.core.popup(this,"지사정보 조회","comm::RTCOMMVkgrp_pop.xfdl",args,"modaless=false");
        }

        this.div_search_bt_salesOfficeCd_onclick = function(obj,e)
        {
        	 var args ={p_arg:"RTRESaleCommission", p_rentalGroup:this.div_search.ed_salesGroupCd.value};
        		Ex.core.popup(this,"지점정보 조회","comm::RTCOMMVkbur_pop.xfdl",args,"modaless=false");
        }
        	
        this._setReturn = function(val) {
        		var cd = val[0];
        		var nm = val[1];
        		var gb = val[2];
        		
        		if(gb == "vkgrp") {
        			this.div_search.ed_salesGroupCd.set_value(cd);
        			this.div_search.ed_salesGroupNm.set_value(nm);
        		} else if(gb == "vkbur" ) {
        			this.div_search.ed_salesOfficeCd.set_value(cd);
        			this.div_search.ed_salesOfficeNm.set_value(nm);
        		} else if(gb == "vkazc" ) {
        			this.div_search.ed_agencyCd.set_value(cd);
        			this.div_search.ed_agencyNm.set_value(nm);
        		}
        	}

        //판매처  
        this.div_search_bt_agencyCd_onclick = function(obj,e)
        {
        	//var args ={p_arg:"RTRESaleCommission"};
        	
        	var args = {p_vkgrpCd:this.div_search.ed_salesGroupCd.value, p_vkgrpNm:this.div_search.ed_salesGroupNm.value, 
        				p_vkburCd:this.div_search.ed_salesOfficeCd.value, p_vkburNm:this.div_search.ed_salesOfficeNm.value, 
        				p_arg : "RTRESaleCommission"};
        			
        	Ex.core.popup(this,"판매처 조회","comm::RTCOMMSaleAgentList_pop.xfdl",args, "modaless=false");
        }
        this.FN_sellers = function(res)
        {
           this.div_search.ed_agencyCd.set_value(res[0]);
           this.div_search.ed_agencyNm.set_value(res[1]);
        }

        

        //지사 enter키 이벤트
        this.div_search_vkgrpCd_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 ) {
        		var sSvcID        	= "getCodeS018";                    
        		var sController   	= "rtms/comm/getCodeName.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("cd", this.div_search.ed_salesGroupCd.value);
        		sArgs += Ex.util.setParam("cdGrpCd", "S018");
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        //지점 enter키 이벤트
        this.div_search_vkburCd_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 ) {
        		var sSvcID        	= "getCodeS019";                    
        		var sController   	= "rtms/comm/getCodeName.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("cd", this.div_search.ed_salesOfficeCd.value);
        		sArgs += Ex.util.setParam("cdGrpCd", "S019");
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        
        //판매처 enter키 이벤트
        this.div_search_ed_agencyCd_onkeyup = function(obj,e)
        {
        	   if ( e.keycode == 13 ) {
        		var sSvcID        	= "getAgencyName";                    
        		var sController   	= "rtms/comm/getAgencyName.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("agencyCd", this.div_search.ed_agencyCd.value);
        					
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	 }
        }

        //------------------------------------------------------------------------------
        //검색내역 클릭시 이벤트
        //------------------------------------------------------------------------------
        this.grd_list01_oncellclick = function(obj,e)
        {
        	this.grd_list02.set_binddataset("");
        	var pos = this.ds_list01.rowposition;	
        	this.ds_copy.clearData();
        	var row = this.ds_copy.addRow();
        	this.ds_copy.copyRow(row, this.ds_list01, pos);
        	this.agencyCd = nvl(this.ds_list01.getColumn(this.ds_list01.rowposition,"agencyCd"));     //판매처코드
        		
        	//판매처별 세부내역
        	this.fn_getAgencyResultList();
        					
         }

        
        /***********************************************************************************
        * User Function
        ***********************************************************************************/
        //---------------------------------------------------------------------------------
        // 버튼생성
        //---------------------------------------------------------------------------------
        this.fn_initBtn  = function() {
        	/* 1. N : 신규추가
        	 * 2. S : 조회
        	 * 3. C : 데이타생성
        	 * 4. E : 엑셀데이타생성
        	 * 5. AG: 집계
        	 * 6. DN: 다운
        	 */	
        	this.parent.setButton("S",this);		
        }

        //---------------------------------------------------------------------------------
        // 엑셀
        //---------------------------------------------------------------------------------
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.grd_list);
        }

        this.Button01_onclick = function(obj,e)
        {
        	Ex.core.exportExcel(this, this.grd_list01);
        }

        this.Button02_onclick = function(obj,e)
        {
        	Ex.core.exportExcel(this, this.grd_list02);
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.grd_list01.addEventHandler("onselectchanged", this.grd_list02_oncellclick, this);
            this.grd_list01.addEventHandler("oncellclick", this.grd_list01_oncellclick, this);
            this.grd_list02.addEventHandler("oncellclick", this.grd_list03_oncellclick, this);
            this.div_search.Static10.addEventHandler("onclick", this.div_search_Static10_onclick, this);
            this.div_search.ed_agencyCd.addEventHandler("onkeyup", this.div_search_ed_agencyCd_onkeyup, this);
            this.div_search.ed_salesOfficeCd.addEventHandler("onkeyup", this.div_search_ed_salesOfficeCd_onkeyup, this);
            this.div_search.ed_salesGroupCd.addEventHandler("onkeyup", this.div_search_ed_salesGroupCd_onkeyup, this);
            this.div_search.bt_agencyCd.addEventHandler("onclick", this.div_search_bt_agencyCd_onclick, this);
            this.div_search.bt_salesOfficeCd.addEventHandler("onclick", this.div_search_bt_salesOfficeCd_onclick, this);
            this.div_search.bt_salesGroupCd.addEventHandler("onclick", this.div_search_bt_salesGroupNm_onclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);
            this.Button02.addEventHandler("onclick", this.Button02_onclick, this);

        };

        this.loadIncludeScript("RTREAllowanceResult.xfdl");

       
    };
}
)();

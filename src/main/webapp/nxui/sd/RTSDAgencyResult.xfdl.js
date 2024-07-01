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
                this.set_name("RTSDAgencyResult");
                this.set_classname("commissionBreakdown");
                this.set_titletext("대리점실적조회");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_chanCd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_agencyResultList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"salesGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"pgNm\" type=\"STRING\" size=\"256\"/><Column id=\"petternNm\" type=\"STRING\" size=\"256\"/><Column id=\"sectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiNm\" type=\"INT\" size=\"256\"/><Column id=\"monAmt\" type=\"INT\" size=\"256\"/><Column id=\"orgAgnm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntB00007\" type=\"STRING\" size=\"256\"/><Column id=\"cntB00001\" type=\"STRING\" size=\"256\"/><Column id=\"cntB00002\" type=\"STRING\" size=\"256\"/><Column id=\"cntB00008\" type=\"STRING\" size=\"256\"/><Column id=\"cntB00003\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rentalInfo", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("1");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "75", null, null, this);
            obj.set_taborder("3");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "800", "12", "200", "21", null, null, this.div_search);
            obj.set_taborder("14");
            obj.set_tooltiptext("edit");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_agencyCd", "absolute", "715", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("장착대리점");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_rentalOfficeNm", "absolute", "570", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("16");
            obj.set_tooltiptext("edit");
            obj.set_enable("false");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_salesOffice", "absolute", "370", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("17");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_salesGroupNm", "absolute", "25", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_rentalGroupNm", "absolute", "225", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("19");
            obj.set_tooltiptext("edit");
            obj.set_enable("false");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "370", "39", "80", "21", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("채널구분");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "25", "39", "80", "21", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static29", "absolute", "0", "33", "1122", "6", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_text("FIX h6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "60", "1118", "12", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_agencyCd", "absolute", "980", "12", "20", "21", null, null, this.div_search);
            obj.set_taborder("37");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_chanCd", "absolute", "450", "39", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("38");
            obj.set_autoselect("true");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_chanCd");
            obj.set_index("-1");
            obj = new Calendar("cal_procDayS", "absolute", "105", "39", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("39");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Calendar("ed_procDayE", "absolute", "235", "39", "110", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("40");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static03", "absolute", "220", "39", "10", "21", null, null, this.div_search);
            obj.set_taborder("41");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_agencyCd", "absolute", "1018", "39", "100", "21", null, null, this.div_search);
            obj.set_taborder("44");
            obj.set_displaynulltext("장착대리점코드");
            obj.set_tooltiptext("edit");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_rentalGroup", "absolute", "105", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("45");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_rentalGroup", "absolute", "204", "11", "21", "21", null, null, this.div_search);
            obj.set_taborder("35");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_visible("true");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_rentalOffice", "absolute", "450", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("46");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_rentalOffice", "absolute", "549", "12", "21", "21", null, null, this.div_search);
            obj.set_taborder("36");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("grid_agencyResultList", "absolute", "0", "90", "1122", "406", null, null, this);
            obj.set_taborder("4");
            obj.set_binddataset("ds_agencyResultList");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"180\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"138\"/><Column size=\"119\"/><Column size=\"95\"/><Column size=\"113\"/><Column size=\"98\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"렌탈지사\"/><Cell col=\"1\" text=\"렌탈지점\"/><Cell col=\"2\" text=\"채널대분류\"/><Cell col=\"3\" text=\"채널중분류\"/><Cell col=\"4\" text=\"대리점코드\"/><Cell col=\"5\" text=\"대리점\"/><Cell col=\"6\" text=\"계약번호\"/><Cell col=\"7\" text=\"PG\"/><Cell col=\"8\" text=\"패턴\"/><Cell col=\"9\" text=\"단면폭\"/><Cell col=\"10\" text=\"편평비\"/><Cell col=\"11\" text=\"인치\"/><Cell col=\"12\" text=\"PR\"/><Cell col=\"13\" text=\"본수\"/><Cell col=\"14\" text=\"상품코드\"/><Cell col=\"15\" text=\"타이어무상교체서비스\"/><Cell col=\"16\" text=\"엔진오일교체서비스\"/><Cell col=\"17\" text=\"위치교환서비스\"/><Cell col=\"18\" text=\"얼라인먼트서비스\"/><Cell col=\"19\" text=\"방문점검서비스\"/><Cell col=\"20\" text=\"장착일자\"/><Cell col=\"21\" text=\"계약기간\"/><Cell col=\"22\" text=\"고객명\"/><Cell col=\"23\" text=\"판매인명\"/><Cell col=\"24\" text=\"판매인코드\"/><Cell col=\"25\" text=\"등록비\"/><Cell col=\"26\" text=\"월렌탈료\"/></Band><Band id=\"body\"><Cell text=\"bind:rentalGroupNm\"/><Cell col=\"1\" text=\"bind:rentalOfficeNm\"/><Cell col=\"2\" text=\"bind:chanLclsNm\"/><Cell col=\"3\" text=\"bind:chanMclsNm\"/><Cell col=\"4\" text=\"bind:agencyCd\"/><Cell col=\"5\" text=\"bind:agencyNm\"/><Cell col=\"6\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"7\" text=\"bind:pgNm\"/><Cell col=\"8\" text=\"bind:petternNm\"/><Cell col=\"9\" text=\"bind:sectionWidth\"/><Cell col=\"10\" text=\"bind:aspectRatio\"/><Cell col=\"11\" text=\"bind:wheelInches\"/><Cell col=\"12\" text=\"bind:plyRating\"/><Cell col=\"13\" text=\"bind:cntNm\"/><Cell col=\"14\" text=\"bind:matCd\" tooltiptext=\"bind:matCd\"/><Cell col=\"15\" text=\"bind:cntB00007\"/><Cell col=\"16\" text=\"bind:cntB00001\"/><Cell col=\"17\" text=\"bind:cntB00002\"/><Cell col=\"18\" text=\"bind:cntB00008\"/><Cell col=\"19\" text=\"bind:cntB00003\"/><Cell col=\"20\" displaytype=\"date\" edittype=\"none\" text=\"bind:procDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"21\" text=\"bind:periodNm\"/><Cell col=\"22\" text=\"bind:custNm\"/><Cell col=\"23\" text=\"bind:orgAgnm\"/><Cell col=\"24\" text=\"bind:ordAgent\"/><Cell col=\"25\" displaytype=\"number\" style=\"align:right;\" text=\"bind:regiNm\" mask=\"###,###,###,##0\"/><Cell col=\"26\" displaytype=\"number\" style=\"align:right;\" text=\"bind:monAmt\" mask=\"###,###,###,##0\"/></Band><Band id=\"summary\"><Cell text=\"총합계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\"/><Cell col=\"3\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/><Cell col=\"16\"/><Cell col=\"17\"/><Cell col=\"18\"/><Cell col=\"19\"/><Cell col=\"20\"/><Cell col=\"21\"/><Cell col=\"22\"/><Cell col=\"23\"/><Cell col=\"24\"/><Cell col=\"25\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;regiNm&quot;)\" mask=\"###,###,###,##0\"/><Cell col=\"26\" displaytype=\"number\" style=\"align:right;\" expr=\"expr:dataset.getSum(&quot;monAmt&quot;)\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "75", "1147", "15", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 75, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("3");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("commissionBreakdown");
            		p.set_titletext("대리점실적조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDAgencyResult.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDAgencyResult.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분	: 주문관리 > 실적관리 > 대리점 실적조회
         * 02. 그룹명		: RTSDAgencyResult.xfdl
         * 03. 그룹설명	: 
         * 04. 작성일		: 
         * 05. 작성자		: 
         * 06. 수정이력	: 
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * ---------------------------------
         * ...			...			...
         * 2019-02-27	wjim		[20190226_01] 조회항목 추가
         *							- 타이어무상교체서비스, 엔진오일교체서비스, 위치교환서비스, 얼라인먼트서비스, 방문점검서비스
         ***********************************************************************/

        /***********************************************************************
         * Script Include
         ***********************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.p_arg = "RTSDAgencyResult";

        /***********************************************************************
         * 그룹 변수 선언부
         ***********************************************************************/

        /***********************************************************************************
         * Form Load Common Function
         ***********************************************************************************/
        this.RTSDAgencyResult_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	this.parent.setButton("E|S", this);
        	
        	if(application.gds_userInfo.getColumn(0,"userGrp") == "RM"){	
        		this.div_search.ed_procDayE.set_enable(false);
        	}
        	
        	/* 사용자 렌탈그룹 조회 */
        	this.fn_userRentalGroupInfo();
        }

        this.fn_init = function() {
        	var div		 = this.div_search;
        	var gdsUser  = application.gds_userInfo;
        	var dsRental = this.ds_rentalInfo;
        	
        	div.cal_procDayS.set_value(FN_firstDay());
        	div.ed_procDayE.set_value(FN_lastDay());
        	
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
        		div.ed_rentalGroup.set_enable(false);	/* 렌탈지사Code Disabled		*/
        		div.ed_rentalGroupNm.set_enable(false);	/* 렌탈지사Name Disabled		*/
        		div.bt_rentalGroup.set_visible(false);	/* 렌탈지사Button Invisible	*/
        		div.ed_rentalOffice.set_enable(false);	/* 렌탈지점Code Disabled 		*/
        		div.ed_rentalOfficeNm.set_enable(false);	/* 렌탈지점Name Disabled		*/
        		div.bt_rentalOffice.set_visible(false);	/* 렌탈지점Button visible		*/
        		div.ed_agencyCd.set_enable(false);		/* 장착대리점Code Disabled		*/
        		div.ed_agencyNm.set_enable(false);		/* 장착대리점Name Disabled		*/
        		div.bt_agencyCd.set_visible(false);		/* 장착대리점Button Invisible	*/
        		
        		div.ed_rentalGroup.set_value(vkgrp);
        		div.ed_rentalGroupNm.set_value(vkgrpNm);
        		div.ed_rentalOffice.set_value(vkbur);
        		div.ed_rentalOfficeNm.set_value(vkburNm);
        		div.ed_agencyCd.set_value(userId);
        		div.ed_agencyNm.set_value(userNm);
        	}
        	
        	
        	
        	this.fn_initRTSDAgencyResult();
        }

        /***********************************************************************************
         * Transaction Function
         ***********************************************************************************/
        /**
         * 채널구분 조회
         */
        this.fn_initRTSDAgencyResult = function() {
        	var sSvcID		 = "initRTSDAgencyResult";
        	var sController	 = "rtms/sd/initRTSDAgencyResult.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_chanCd=mapDsChanCd";
        	var sArgs		 = "";
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 사용자 렌탈그룹 조회
         */
        this.fn_userRentalGroupInfo = function() {
        	this.ds_rentalInfo.clearData();
        	
        	var sSvcID		 = "userRentalGroupInfo";
        	var sController	 = "/rtms/sd/userRentalGroupInfo.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_rentalInfo=ds_output";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("userId", application.gds_userInfo.getColumn(0, "userId"));
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 수수료 기초내역조회
         */
        this.fn_selectRTSDAgencyResult = function() {
        	var div		= this.div_search;
        	var gdsUser	= application.gds_userInfo;
        	
        	var agencyCd	 = nvl(div.ed_agencyCd.value);
        	var salesGroup	 = "";
        	var salesOffice	 = "";
        	var procDayS	 = nvl(div.cal_procDayS.value);
        	var procDayE	 = nvl(div.ed_procDayE.value);
        	var chanCd		 = nvl(div.cb_chanCd.value);
        	var rentalGroup	 = nvl(div.ed_rentalGroup.value);	/* 렌탈지사	*/
        	var rentalOffice = nvl(div.ed_rentalOffice.value);	/* 렌탈지점	*/
        	
        	var userId		 = gdsUser.getColumn(0, "userId");	/* 사용자ID	*/
        	var userGrp		 = gdsUser.getColumn(0, "userGrp");	/* 그룹			*/
        	var bfVkgrp		 = gdsUser.getColumn(0, "vkgrp");	/* 지사코드	*/
        	var bfVkgrpNm	 = gdsUser.getColumn(0, "vkgrpNm");	/* 지사명		*/
        	var bfVkbur		 = gdsUser.getColumn(0, "vkbur");	/* 지점코드	*/
        	var bfVkburNm	 = gdsUser.getColumn(0, "vkburNm");	/* 지점명		*/
        	var afVkgrpNm	 = div.ed_rentalGroupNm.value;		/* 팝업 지사명	*/
        	var afVkburNm	 = div.ed_rentalOfficeNm.value;		/* 팝업 지점명	*/
        	
        	if(!(userGrp == "01" || userGrp != "02" || userGrp == "RM")) {
        // 		if(Eco.isEmpty(rentalGroup)) {
        // 			this.alert("렌탈지사를 선택하세요.");
        // 			return false;
        // 		}
        // 		
        // 		if(Eco.isEmpty(rentalOffice)) {
        // 			this.alert("렌탈지점을 선택하세요.");
        // 			return false;
        // 		}
        	}
        	
        	if(userGrp == "04") {
        		if(bfVkgrpNm != afVkgrpNm) {
        			this.alert("타 조직내역 조회 불가합니다.");
        			return false;
        		}
        		
        		if(bfVkburNm != afVkburNm) {
        			this.alert("타 조직내역 조회 불가합니다.");
        			return false;
        		}
        	}
        	
        	if(userGrp == "03" || userGrp == "07") {
        		if(bfVkgrpNm != afVkgrpNm) {
        			this.alert("타 조직내역 조회 불가합니다.");
        			return false;
        		}
        	}
        	
        	if(procDayS > procDayE) {
        		this.alert("장착일자를 다시 확인하세요.");
        		div.ed_procDayE.setFocus(true);
        		return false;
        	}
        	
        	this.ds_agencyResultList.clearData();
        	
        	var sSvcID		 = "selectRTSDAgencyResult";
        	var sController	 = "rtms/sd/selectRTSDAgencyResult.do";
        	var sInDatasets	 = "";
        	var sOutDatasets = "ds_agencyResultList=selectRTSDAgencyResultMap";
        	var sArgs		 = "";
        		sArgs		+= Ex.util.setParam("agencyCd",		agencyCd);
        		sArgs		+= Ex.util.setParam("salesGroup",	salesGroup);
        		sArgs		+= Ex.util.setParam("salesOffice",	salesOffice);
        		sArgs		+= Ex.util.setParam("procDayS",		procDayS);
        		sArgs		+= Ex.util.setParam("procDayE",		procDayE);
        		sArgs		+= Ex.util.setParam("chanCd",		chanCd);
        		sArgs		+= Ex.util.setParam("rentalGroup",	rentalGroup);
        		sArgs		+= Ex.util.setParam("rentalOffice",	rentalOffice);
        		sArgs		+= Ex.util.setParam("userId",		userId);
        	var fn_callBack		= "fn_callBack";
        	
        	// 수행시간을 고려하여 timeout 시간(초) 조정
        	application.set_httptimeout(300);
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /***********************************************************************************
         * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        		return;
        	}
        	
        	switch(strSvcId) {
        		/* 월일 조회 */
        		case "initRTSDAgencyResult":
        			var rowCt = this.ds_chanCd.getRowCount();
        			
        			if(rowCt > 0) {
        				var insert = this.ds_chanCd.insertRow(0);
        				this.ds_chanCd.setColumn(insert,"cd","ALL");
        				this.ds_chanCd.setColumn(insert,"cdNm","전체");
        				this.div_search.cb_chanCd.set_value( "ALL" ); 
        			}
        			break;
        		
        		/* 사용자 렌탈그룹 조회 */
        		case "userRentalGroupInfo":
        			this.fn_init();
        			break;
        		
        		/* 수수료 기초내역조회 */
        		case "selectRTSDAgencyResult":
        			var rowCt = this.ds_agencyResultList.getRowCount();
        			
        			if(rowCt == 0) {
        				this.alert("조회된 데이터가 없습니다.");
        				
        				this.grid_agencyResultList.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        			break;
        		default:
        			break;
        	}
        }

        /**
         * 지사조회 Popup Callback
         */
        this.return_salesGroup = function(arr) {
        	this.div_search.ed_rentalGroupNm.set_value(arr[0]);
        	this.div_search.ed_rentalGroup.set_value(arr[1]);
        }

        /**
         * 지점조회 Popup Callback
         */
        this.return_salesOffice = function(arr) {
        	this.div_search.ed_rentalOfficeNm.set_value(arr[0]);
        	this.div_search.ed_rentalOffice.set_value(arr[1]);
        }

        /**
         * 장착대리점 Popup Callback
         */
        this.return_agency = function(arr) {
        	this.div_search.ed_rentalGroupNm.set_value(arr[0]);
        	this.div_search.ed_rentalGroup.set_value(arr[1]);
        	this.div_search.ed_rentalOfficeNm.set_value(arr[2]);
        	this.div_search.ed_rentalOffice.set_value(arr[3]);
        	this.div_search.ed_agencyNm.set_value(arr[4]);
        	this.div_search.ed_agencyCd.set_value(arr[5]);
        }

        /***********************************************************************************
         * User Function
         ***********************************************************************************/

        /***********************************************************************************
         * Component Event & Function
         ***********************************************************************************/
        /**
         * 조회
         */
        this.fn_search = function() {
        	/* 수수료 기초내역조회 */
        	this.fn_selectRTSDAgencyResult();
        }

        /**
         * 엑셀다운로드
         */
        this.fn_excel = function() {
        	Ex.core.exportExcel(this, this.grid_agencyResultList);
        }

        this.div_search_bt_rentalGroup_onclick = function(obj,e) {
        	var args = {p_arg : this.p_arg};
        	
        	Ex.core.popup(this, "지사", "comm::RTCOMMVkgrp_pop.xfdl", args, "modaless=false");
        }

        this.div_search_bt_rentalOffice_onclick = function(obj,e) {
        	var args = {p_arg : this.p_arg, p_rentalGroup:this.div_search.ed_rentalGroup.value};
        	
        	Ex.core.popup(this, "지점조회", "comm::RTCOMMVkbur_pop.xfdl", args, "modaless=false");
        }

        this.div_search_bt_agencyCd_onclick = function(obj,e) {
        	var div	 = this.div_search;
        	var args = {  p_vkgrpCd	: div.ed_rentalGroup.value, p_vkgrpNm:div.ed_rentalGroupNm.value
        				, p_vkburCd	: div.ed_rentalOffice.value, p_vkburNm:div.ed_rentalOfficeNm.value
        				, p_formId	: "RTSDAgencyResult"
        			   };
        	
        	Ex.core.popup(this, "대리점조회", "comm::RTCOMMAgency_pop.xfdl", args, "modaless=false");
        }

        this.div_search_cal_procDayS_onchanged = function(obj,e)
        {
        	if(application.gds_userInfo.getColumn(0,"userGrp") != "RM"){	
        		return;
        	}
        		
        	var startDate = obj.value + "";

        	var yy = startDate.substring(0, 4);
        	var mm = startDate.substring(4, 6);
        	var dd = startDate.substring(6, 8);

        	var dat = new Date(yy, (Number(mm) + 2), dd);
        	
        	var calcYY = dat.getFullYear();
        	var calcMM = dat.getMonth();
        	var calcDD = dat.getDate();
        	
        	if(calcMM.toString().length == 1) calcMM = "0" + calcMM;
        	if(calcDD.toString().length == 1) calcDD = "0" + calcDD;
        	
        	this.div_search.ed_procDayE.set_value(calcYY + "" + calcMM + "" + calcDD);

        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDAgencyResult_onload, this);
            this.div_search.bt_agencyCd.addEventHandler("onclick", this.div_search_bt_agencyCd_onclick, this);
            this.div_search.cal_procDayS.addEventHandler("onchanged", this.div_search_cal_procDayS_onchanged, this);
            this.div_search.ed_rentalGroup.addEventHandler("onkeyup", this.div_search_vkgrpCd_onkeyup, this);
            this.div_search.bt_rentalGroup.addEventHandler("onclick", this.div_search_bt_rentalGroup_onclick, this);
            this.div_search.ed_rentalOffice.addEventHandler("onkeyup", this.div_search_vkburCd_onkeyup, this);
            this.div_search.bt_rentalOffice.addEventHandler("onclick", this.div_search_bt_rentalOffice_onclick, this);

        };

        this.loadIncludeScript("RTSDAgencyResult.xfdl");

       
    };
}
)();

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
                this.set_name("RTSDAgencyStatus");
                this.set_classname("Authority");
                this.set_titletext("대리점정보조회");
                this._setFormPosition(0,0,1147,496);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_agencyPop", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"street\" type=\"STRING\" size=\"256\"/><Column id=\"sidoCd\" type=\"STRING\" size=\"256\"/><Column id=\"sigunCd\" type=\"STRING\" size=\"256\"/><Column id=\"serNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"taxNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"rentalYn\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"posX\" type=\"STRING\" size=\"256\"/><Column id=\"posY\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"lmYn\" type=\"STRING\" size=\"256\"/><Column id=\"fmYn\" type=\"STRING\" size=\"256\"/><Column id=\"lifnr\" type=\"STRING\" size=\"256\"/><Column id=\"taxRqcd\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"taxRqcdNm\" type=\"STRING\" size=\"256\"/><Column id=\"cwYn\" type=\"STRING\" size=\"256\"/><Column id=\"chYn\" type=\"STRING\" size=\"256\"/><Column id=\"opYn\" type=\"STRING\" size=\"256\"/><Column id=\"memo\" type=\"STRING\" size=\"256\"/><Column id=\"desorptCd\" type=\"STRING\" size=\"256\"/><Column id=\"desorptNm\" type=\"STRING\" size=\"256\"/><Column id=\"alignCd\" type=\"STRING\" size=\"256\"/><Column id=\"alignNm\" type=\"STRING\" size=\"256\"/><Column id=\"balanceCd\" type=\"STRING\" size=\"256\"/><Column id=\"balanceNm\" type=\"STRING\" size=\"256\"/><Column id=\"visitYn\" type=\"STRING\" size=\"256\"/><Column id=\"prplYn\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"rntMstId\" type=\"STRING\" size=\"256\"/><Column id=\"rntMstNm\" type=\"STRING\" size=\"256\"/><Column id=\"rntMstMob\" type=\"STRING\" size=\"256\"/><Column id=\"premPrplYn\" type=\"STRING\" size=\"256\"/><Column id=\"totEvalPoint\" type=\"STRING\" size=\"256\"/><Column id=\"stfyPointCd1\" type=\"STRING\" size=\"256\"/><Column id=\"stfyPointCd2\" type=\"STRING\" size=\"256\"/><Column id=\"stfyPointCd3\" type=\"STRING\" size=\"256\"/><Column id=\"hpAgencyNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsRentalInfo", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("st_BG", "absolute", "10", "0", null, "40", "-10", null, this);
            obj.set_cssclass("sta_WF_SearchBox");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("19");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1118", "12", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "33", "1117", "12", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroupNm", "absolute", "163", "12", "100", "21", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchSalesGroup", "absolute", "20", "12", "68", "20", null, null, this.div_search);
            obj.set_taborder("26");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchSalesOffice", "absolute", "288", "12", "68", "20", null, null, this.div_search);
            obj.set_taborder("27");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.set_enableevent("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesOfficeNm", "absolute", "431", "12", "100", "21", null, null, this.div_search);
            obj.set_taborder("28");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchAgency", "absolute", "556", "12", "56", "20", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_text("대리점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_searchAgency", "absolute", "612", "12", "140", "21", null, null, this.div_search);
            obj.set_taborder("30");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchRentalYn", "absolute", "777", "12", "92", "20", null, null, this.div_search);
            obj.set_taborder("31");
            obj.set_text("렌탈가능여부");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_searchRentalYn", "absolute", "874", "12", "60", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            var cb_searchRentalYn_innerdataset = new Dataset("cb_searchRentalYn_innerdataset", this.div_search.cb_searchRentalYn);
            cb_searchRentalYn_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">Y</Col><Col id=\"datacolumn\">Y</Col></Row><Row><Col id=\"codecolumn\">N</Col><Col id=\"datacolumn\">N</Col></Row></Rows>");
            obj.set_innerdataset(cb_searchRentalYn_innerdataset);
            obj.set_taborder("32");
            obj.set_value("Y");
            obj.set_text("Y");
            obj.set_displaynulltext("선택");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("0");
            obj = new Edit("ed_salesGroup", "absolute", "93", "12", "70", "21", null, null, this.div_search);
            obj.set_taborder("35");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_salesOffice", "absolute", "361", "12", "70", "21", null, null, this.div_search);
            obj.set_taborder("36");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_searchSalesGroup", "absolute", "142", "11", "21", "21", null, null, this.div_search);
            obj.set_taborder("33");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_searchSalesOffice", "absolute", "410", "12", "21", "21", null, null, this.div_search);
            obj.set_taborder("34");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "45", "1147", "20", null, null, this);
            obj.set_taborder("29");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("#ff9197ff");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static50", "absolute", "51.96%", "41", null, "21", "43.94%", null, this);
            obj.set_taborder("99");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_agency", "absolute", "0%", "86", null, "410", "2.18%", null, this);
            obj.set_taborder("100");
            obj.set_binddataset("ds_agencyPop");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"220\"/><Column size=\"166\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"60\"/><Column size=\"200\"/><Column size=\"100\"/><Column size=\"70\"/><Column size=\"66\"/><Column size=\"100\"/><Column size=\"97\"/><Column size=\"90\"/><Column size=\"70\"/><Column size=\"130\"/><Column size=\"110\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"110\"/><Column size=\"110\"/><Column size=\"110\"/><Column size=\"90\"/><Column size=\"131\"/><Column size=\"135\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"90\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"40\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"채널대분류\"/><Cell col=\"1\" text=\"채널중분류\"/><Cell col=\"2\" text=\"대리점코드\"/><Cell col=\"3\" text=\"대리점명\"/><Cell col=\"4\" text=\"홈페이지 대리점명\"/><Cell col=\"5\" text=\"렌탈지사코드\"/><Cell col=\"6\" text=\"렌탈지사명\"/><Cell col=\"7\" text=\"렌탈지점코드\"/><Cell col=\"8\" text=\"렌탈지점명\"/><Cell col=\"9\" text=\"우편번호\"/><Cell col=\"10\" text=\"주소\"/><Cell col=\"11\" text=\"상세주소\"/><Cell col=\"12\" text=\"렌탈지사\"/><Cell col=\"13\" text=\"렌탈지역\"/><Cell col=\"14\" text=\"전화번호\"/><Cell col=\"15\" text=\"휴대폰번호\"/><Cell col=\"16\" text=\"대표명\"/><Cell col=\"17\" text=\"벤더코드\"/><Cell col=\"18\" text=\"세금계산서 발행방법\"/><Cell col=\"19\" text=\"렌탈대리점 여부\"/><Cell col=\"20\" text=\"렌탈시작일\"/><Cell col=\"21\" text=\"렌탈종료일\"/><Cell col=\"22\" text=\"경정비 가능여부\"/><Cell col=\"23\" text=\"1급정비 가능여부\"/><Cell col=\"24\" text=\"세차 가능여부\"/><Cell col=\"25\" text=\"전략추천 여부\"/><Cell col=\"26\" text=\"온라인장착 가능여부\"/><Cell col=\"27\" text=\"프리미엄 퍼플점 여부\"/><Cell col=\"28\" text=\"퍼플점 여부\"/><Cell col=\"29\" text=\"담당영업사원\"/><Cell col=\"30\" text=\"담당연락처\"/><Cell col=\"31\" text=\"만족도 총평점\"/><Cell col=\"32\" text=\"장착응대\"/><Cell col=\"33\" text=\"렌탈혜택\"/><Cell col=\"34\" text=\"친절\"/></Band><Band id=\"body\"><Cell text=\"bind:chanLclsNm\"/><Cell col=\"1\" text=\"bind:chanMclsNm\"/><Cell col=\"2\" text=\"bind:agencyCd\"/><Cell col=\"3\" style=\"align:left;\" text=\"bind:agencyNm\"/><Cell col=\"4\" style=\"align:left;\" text=\"bind:hpAgencyNm\"/><Cell col=\"5\" text=\"bind:rentalGroup\"/><Cell col=\"6\" text=\"bind:rentalGroupNm\"/><Cell col=\"7\" text=\"bind:rentalOffice\"/><Cell col=\"8\" text=\"bind:rentalOfficeNm\"/><Cell col=\"9\" text=\"bind:posCd\"/><Cell col=\"10\" style=\"align:left;\" text=\"bind:city\"/><Cell col=\"11\" style=\"align:left;\" text=\"bind:street\"/><Cell col=\"12\" text=\"bind:rentalGroupNm\"/><Cell col=\"13\" text=\"bind:rentalOfficeNm\"/><Cell col=\"14\" text=\"bind:telNo\"/><Cell col=\"15\" text=\"bind:mobNo\"/><Cell col=\"16\" text=\"bind:repNm\"/><Cell col=\"17\" text=\"bind:lifnr\"/><Cell col=\"18\" text=\"bind:taxRqcdNm\"/><Cell col=\"19\" text=\"bind:rentalYn\"/><Cell col=\"20\" displaytype=\"date\" text=\"bind:strDay\"/><Cell col=\"21\" displaytype=\"date\" text=\"bind:endDay\"/><Cell col=\"22\" text=\"bind:lmYn\"/><Cell col=\"23\" text=\"bind:fmYn\"/><Cell col=\"24\" text=\"bind:cwYn\"/><Cell col=\"25\" text=\"bind:chYn\"/><Cell col=\"26\" text=\"bind:opYn\"/><Cell col=\"27\" text=\"bind:premPrplYn\"/><Cell col=\"28\" text=\"bind:prplYn\"/><Cell col=\"29\" text=\"bind:rntMstNm\"/><Cell col=\"30\" text=\"bind:rntMstMob\"/><Cell col=\"31\" text=\"bind:totEvalPoint\"/><Cell col=\"32\" text=\"bind:stfyPointCd1\"/><Cell col=\"33\" text=\"bind:stfyPointCd2\"/><Cell col=\"34\" text=\"bind:stfyPointCd3\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "60", "100", "21", null, null, this);
            obj.set_taborder("101");
            obj.set_text("메인 LIST");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "76", "1130", "10", null, null, this);
            obj.set_taborder("102");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
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
            		p.set_titletext("대리점정보조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item9","sidoCd","value","dsAgency","sidoCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","sigunCd","value","dsAgency","sigunCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","serNo","value","dsAgency","serNo");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDAgencyStatus.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDAgencyStatus.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDAgencyStatus.xfdl
         * 설    명 : 대리점 정보 조회
         * 작 성 자 : 
         * 변경이력 :
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * ---------------------------------
         * ...			...			...
         * 2019-02-21	wjim		[20170118_01] 조회항목(퍼플점 여부) 추가
         ***************************************************************************************************/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        this.p_arg = "RTSDAgencyStatus";

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){
        	if (nErrorCode < 0) {
        		alert(strErrorMsg);		
        		return; 
        	}
        	
        	if( strSvcId == "listAgencyPop" ){
        		var ct = this.ds_agencyPop.rowcount;
        		if( ct != 0 ){
        		
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grid_agency.set_nodatatext("조회된 데이터가 없습니다.");
        			this.div_search.ed_searchAgency.setFocus();
        		}
        	}
        			
        	if (strSvcId == "userRentalGroupInfo"){		
        		if (this.dsRentalInfo.getColumn(0, "rentalGroup") == "" || this.dsRentalInfo.getColumn(0, "rentalGroup") == null) return;
        		
        		this.fn_init();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTSDAgencyStatus_onload = function(obj,e)	{
        	Ex.core.init(obj);
        	this.fn_userRentalGroupInfo();
        	this.parent.setButton("E|S",this);
        	this.div_search.ed_searchAgency.setFocus();
        }

        
        //----------------------------------------------------------------------------------
        // Search: 사용자 렌탈그룹 조회
        //----------------------------------------------------------------------------------
        this.fn_userRentalGroupInfo = function()
        {
        	this.dsRentalInfo.clearData();
        	
        	var sSvcID        	= "userRentalGroupInfo";                    
        	var sController   	= "/rtms/sd/userRentalGroupInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsRentalInfo=ds_output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        		sArgs 			+= Ex.util.setParam("userId", application.gds_userInfo.getColumn(0, "userId"));
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        	
        this.fn_init = function(){

        	var userGrp = application.gds_userInfo.getColumn(0, "userGrp"); //그룹
        	
        	var vkgrp = this.dsRentalInfo.getColumn(0, "rentalGroup"); 	//지사코드
        	var vkgrpNm = this.dsRentalInfo.getColumn(0, "rentalGroupNm"); //지사Nm
        	var vkbur = this.dsRentalInfo.getColumn(0, "rentalOffice"); 	//지점코드
        	var vkburNm = this.dsRentalInfo.getColumn(0, "rentalOfficeNm"); //지점NM
        	
        	if(userGrp != '01' && userGrp != 'RM'){ 
        	
        		this.div_search.ed_salesGroup.set_enable(false);  //렌탈지사code 비활성
        		this.div_search.ed_salesGroupNm.set_enable(false); 		  //렌탈지사name 비활성
        		this.div_search.bt_searchSalesGroup.set_visible(false); 	//렌탈지사button visible
        		
        		this.div_search.ed_salesOffice.set_enable(false); 		//렌탈지점code 비활성 
        		this.div_search.ed_salesOfficeNm.set_enable(false); 		//렌탈지점name 비활성
        		this.div_search.bt_searchSalesOffice.set_visible(false); 	//렌탈지점button visible
        		
        		this.div_search.ed_salesGroup.set_value(vkgrp);
        		this.div_search.ed_salesGroupNm.set_value(vkgrpNm);
        		this.div_search.ed_salesOffice.set_value(vkbur);
        		this.div_search.ed_salesOfficeNm.set_value(vkburNm);
        	}
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.fn_search();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	var salesGroup 	= "";
        	var salesOffice = "";
        	var agencyNm 	= nvl(this.div_search.ed_searchAgency.value);
        	var rentalYn 	= nvl(this.div_search.cb_searchRentalYn.value);
        	
        	var rentalGroup 	= nvl(this.div_search.ed_salesGroup.value); 	//렌탈지사
        	var rentalOffice 	= nvl(this.div_search.ed_salesOffice.value); 	//렌탈지점
        	var userId      	= application.gds_userInfo.getColumn(0, "userId"); //사용자ID
        	
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
        	
        	var sSvcID        	= "listAgencyPop";                    
        	var sController   	= "rtms/comm/listAgencyPop.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_agencyPop=mapAgencyPop";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	this.ds_agencyPop.deleteAll();
        	sArgs += Ex.util.setParam("salesGroup",		salesGroup);
        	sArgs += Ex.util.setParam("salesOffice", 	salesOffice);
        	sArgs += Ex.util.setParam("agencyNm", 		agencyNm);
        	sArgs += Ex.util.setParam("rentalYn", 		rentalYn);
        	sArgs += Ex.util.setParam("rentalGroup", rentalGroup);
        	sArgs += Ex.util.setParam("rentalOffice", rentalOffice);
        	sArgs += Ex.util.setParam("userId", userId);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMAgency_pop_onkeyup = function(obj,e)	{
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_btn_excel_onclick = function(obj,e){
        	Ex.core.exportExcel(this, this.grid_agency, "대리점정보");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_salesGroupNm_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"지사","comm::RTCOMMVkgrp_pop.xfdl",args, "modaless=false");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.return_salesGroup = function(arr){
        	this.div_search.ed_salesGroupNm.set_value(arr[0]);
        	this.div_search.ed_salesGroup.set_value(arr[1]);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_salesOffice_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg, p_rentalGroup:this.div_search.ed_salesGroup.value};
        	Ex.core.popup(this,"지점조회","comm::RTCOMMVkbur_pop.xfdl",args, "modaless=false");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.return_salesOffice = function(arr){
        	this.div_search.ed_salesOfficeNm.set_value(arr[0]);
        	this.div_search.ed_salesOffice.set_value(arr[1]);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.grid_agency);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("ontimer", this.form_ontimer, this);
            this.addEventHandler("onload", this.RTSDAgencyStatus_onload, this);
            this.div_search.ed_salesGroupNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.ed_salesOfficeNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.ed_searchAgency.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.cb_searchRentalYn.addEventHandler("onitemchanged", this.div_search_cmb_searchCondition_onitemchanged, this);
            this.div_search.ed_salesGroup.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.ed_salesOffice.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_search.bt_searchSalesGroup.addEventHandler("onclick", this.div_search_bt_salesGroupNm_onclick, this);
            this.div_search.bt_searchSalesOffice.addEventHandler("onclick", this.div_search_bt_salesOffice_onclick, this);

        };

        this.loadIncludeScript("RTSDAgencyStatus.xfdl");

       
    };
}
)();

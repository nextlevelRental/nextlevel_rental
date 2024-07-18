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
                this.set_name("RTSDNoMadeProcOrderList");
                this.set_classname("RTCSHappyCallRegister");
                this.set_titletext("장착 오더 미생성 리스트");
                this._setFormPosition(0,0,1147,492);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsS316", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows/>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsS313", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows/>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"rcYn\" type=\"STRING\" size=\"256\"/><Column id=\"outStockTypeNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"vbeln\" type=\"STRING\" size=\"256\"/><Column id=\"vbelnD\" type=\"STRING\" size=\"256\"/><Column id=\"vbelnR\" type=\"STRING\" size=\"256\"/><Column id=\"vbelnDR\" type=\"STRING\" size=\"256\"/><Column id=\"giDay\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows/>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsRentalInfo", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("Div00", "absolute", "0", "0", "1122", "110", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1147", "12", null, null, this.Div00);
            obj.set_taborder("42");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "32", "1147", "12", null, null, this.Div00);
            obj.set_taborder("43");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "22", "42", "80", "21", null, null, this.Div00);
            obj.set_taborder("44");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "8", "64", "1147", "12", null, null, this.Div00);
            obj.set_taborder("45");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "22", "74", "80", "21", null, null, this.Div00);
            obj.set_taborder("46");
            obj.set_text("휴대폰번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "16", "96", "1147", "12", null, null, this.Div00);
            obj.set_taborder("47");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("st_warehCd01", "absolute", "20", "11", "80", "20", null, null, this.Div00);
            obj.set_taborder("48");
            obj.set_text("렌탈지사");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroup", "absolute", "120", "11", "68", "21", null, null, this.Div00);
            obj.set_taborder("49");
            this.Div00.addChild(obj.name, obj);
            obj = new Button("bt_salesGroupCd", "absolute", "188", "10", "21", "21", null, null, this.Div00);
            obj.set_taborder("50");
            obj.set_cssclass("btn_WF_edtSch");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroupNm", "absolute", "211", "11", "118", "21", null, null, this.Div00);
            obj.set_taborder("51");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("st_warehCd00", "absolute", "428", "13", "64", "20", null, null, this.Div00);
            obj.set_taborder("52");
            obj.set_text("렌탈지점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("ed_salesOffice", "absolute", "500", "11", "68", "21", null, null, this.Div00);
            obj.set_taborder("53");
            this.Div00.addChild(obj.name, obj);
            obj = new Button("bt_salesOfficeCd", "absolute", "568", "10", "21", "21", null, null, this.Div00);
            obj.set_taborder("54");
            obj.set_cssclass("btn_WF_edtSch");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("ed_salesOfficeNm", "absolute", "590", "11", "118", "21", null, null, this.Div00);
            obj.set_taborder("55");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("ed_agencyCd", "absolute", "896", "11", "71", "21", null, null, this.Div00);
            obj.set_taborder("57");
            obj.set_enable("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Button("bt_agency", "absolute", "947", "11", "20", "21", null, null, this.Div00);
            obj.set_taborder("58");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("true");
            obj.getSetter("domainId").set("nexa.save");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("ed_agencyNm", "absolute", "967", "11", "71", "21", null, null, this.Div00);
            obj.set_taborder("59");
            obj.set_enable("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("st_warehCd02", "absolute", "814", "13", "86", "20", null, null, this.Div00);
            obj.set_taborder("60");
            obj.set_text("장착대리점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "120", "44", "140", "21", null, null, this.Div00);
            obj.set_taborder("61");
            obj.set_inputfilter("space");
            obj.set_lengthunit("ascii");
            this.Div00.addChild(obj.name, obj);
            obj = new Button("btn_ordNoPopup", "absolute", "240", "43", "20", "21", null, null, this.Div00);
            obj.set_taborder("62");
            obj.set_cssclass("btn_WF_edtSch");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "815", "43", "80", "21", null, null, this.Div00);
            obj.set_taborder("63");
            obj.set_text("접수일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("cal_Ord_Fday", "absolute", "895", "43", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("64");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static07", "absolute", "997", "43", "9", "21", null, null, this.Div00);
            obj.set_taborder("65");
            obj.set_text("~");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("cal_Ord_Tday", "absolute", "1009", "43", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("66");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static06", "absolute", "815", "75", "80", "21", null, null, this.Div00);
            obj.set_taborder("67");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("cal_Proc_Fday", "absolute", "895", "75", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("68");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static08", "absolute", "997", "75", "9", "21", null, null, this.Div00);
            obj.set_taborder("69");
            obj.set_text("~");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("cal_Proc_Tday", "absolute", "1009", "75", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("70");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Edit("ed_mobNo", "absolute", "120", "76", "120", "20", null, null, this.Div00);
            obj.set_taborder("71");
            obj.set_displaynulltext("('-')하이픈 제거");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("st_warehCd03", "absolute", "428", "45", "64", "20", null, null, this.Div00);
            obj.set_taborder("72");
            obj.set_text("채널");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("st_warehCd04", "absolute", "428", "77", "64", "20", null, null, this.Div00);
            obj.set_taborder("73");
            obj.set_text("재고유형");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.Div00.addChild(obj.name, obj);
            obj = new Combo("cb_channel", "absolute", "44.72%", "44", null, "20", "41.86%", null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("74");
            obj.set_innerdataset("@dsS316");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Combo("cb_stockType", "absolute", "44.72%", "76", null, "20", "41.86%", null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("75");
            obj.set_innerdataset("@dsS313");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Grid("Grid00", "absolute", "0", "128", "1122", "357", null, null, this);
            obj.set_taborder("5");
            obj.set_binddataset("dsList");
            obj.set_autofittype("none");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"150\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"120\"/><Column size=\"90\"/><Column size=\"90\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"계약번호\"/><Cell col=\"1\" text=\"계약상태\"/><Cell col=\"2\" text=\"이름\"/><Cell col=\"3\" text=\"휴대폰\"/><Cell col=\"4\" text=\"계약일자\"/><Cell col=\"5\" text=\"장착일자\"/><Cell col=\"6\" text=\"상품코드\"/><Cell col=\"7\" text=\"상품명\"/><Cell col=\"8\" text=\"본수\"/><Cell col=\"9\" text=\"거점\"/><Cell col=\"10\" text=\"재고유형\"/><Cell col=\"11\" text=\"채널\"/><Cell col=\"12\" text=\"채널중분류\"/><Cell col=\"13\" text=\"대리점코드\"/><Cell col=\"14\" text=\"대리점\"/><Cell col=\"15\" text=\"오더번호\"/><Cell col=\"16\" text=\"출고일자\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" text=\"bind:ordNo\" calendardisplaynulltype=\"none\"/><Cell col=\"1\" text=\"bind:statNm\"/><Cell col=\"2\" text=\"bind:custNm\"/><Cell col=\"3\" text=\"bind:mobNo\"/><Cell col=\"4\" displaytype=\"text\" edittype=\"none\" text=\"bind:ordDay\" mask=\"####-##-##\"/><Cell col=\"5\" displaytype=\"text\" text=\"bind:procDay\" mask=\"####-##-##\" calendardisplaynulltype=\"none\"/><Cell col=\"6\" displaytype=\"normal\" text=\"bind:matCd\" calendardisplaynulltype=\"none\"/><Cell col=\"7\" displaytype=\"normal\" text=\"bind:matNm\" calendardisplaynulltype=\"none\"/><Cell col=\"8\" displaytype=\"normal\" text=\"bind:cntNm\" calendardisplaynulltype=\"none\"/><Cell col=\"9\" displaytype=\"normal\" text=\"bind:rcYn\" calendardisplaynulltype=\"none\"/><Cell col=\"10\" text=\"bind:outStockTypeNm\"/><Cell col=\"11\" text=\"bind:chanNm\"/><Cell col=\"12\" text=\"bind:chanMclsNm\"/><Cell col=\"13\" text=\"bind:agencyCd\"/><Cell col=\"14\" text=\"bind:agencyNm\"/><Cell col=\"15\" text=\"bind:vbeln\"/><Cell col=\"16\" text=\"bind:giDay\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "0", "25", "108", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "110", "1147", "15", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "492", null, null, this);
            obj.set_taborder("9");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 110, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 492, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSHappyCallRegister");
            		p.set_titletext("장착 오더 미생성 리스트");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item8","Div00.ed_agencyCd","value","ds_list","agencyCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","Div00.ed_agencyNm","value","ds_list","agencyNm");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDNoMadeProcOrderList.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDNoMadeProcOrderList.xfdl", function() {
        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";
        this.firstDate  = "";
        this.lastDate  = "";
        this.orgToDate = "";

        this.form_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.get_date();
        	this.parent.setButton("E|S", this);
        	
        	this.fn_initNoMadeOrder();
        	this.fn_userRentalGroupInfo();
        }

        //java comm에서 현재 날짜 가져오기
        this.get_date = function() 
        {
        	var sSvcID        	= "getDate";                    
        	var sController   	= "/rtms/sd/getDate.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        
        this.fn_initNoMadeOrder = function()
        {	
        	var sSvcID        	= "initNoMadeOrder";                    
        	var sController   	= "/rtms/sd/initNoMadeOrder.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsS313=output1 dsS316=output2";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

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
        	
        	var userId = application.gds_userInfo.getColumn(0, "userId"); 	//id
        	var userNm = application.gds_userInfo.getColumn(0, "userNm"); 	//이름
        	var userGrp = application.gds_userInfo.getColumn(0, "userGrp"); //그룹
        	
        	var vkgrp = this.dsRentalInfo.getColumn(0, "rentalGroup"); 	//지사코드
        	var vkgrpNm = this.dsRentalInfo.getColumn(0, "rentalGroupNm"); //지사Nm
        	var vkbur = this.dsRentalInfo.getColumn(0, "rentalOffice"); 	//지점코드
        	var vkburNm = this.dsRentalInfo.getColumn(0, "rentalOfficeNm"); //지점NM
        	
        	var vkazc = application.gds_userInfo.getColumn(0, "vkazc");	 	//대리점
        	var vkazcNm = application.gds_userInfo.getColumn(0, "vkazcNm"); //대리점NM
        	
        	if(userGrp != "01" && userGrp != "02" && userGrp != "RM"){ 
        	
        		this.Div00.ed_salesGroup.set_enable(false); 			//지사code 비활성
        		this.Div00.ed_salesGroupNm.set_enable(false); 		//지사name 비활성
        		this.Div00.bt_salesGroupCd.set_visible(false); 		//지사button visible
        		this.Div00.ed_salesOffice.set_enable(false); 		//지점code 비활성 
        		this.Div00.ed_salesOfficeNm.set_enable(false); 		//지점name 비활성
        		this.Div00.bt_salesOfficeCd.set_visible(false); 	//지점button visible
        		this.Div00.ed_agencyCd.set_enable(false); 			//장착대리점code 비활성
        		this.Div00.ed_agencyNm.set_enable(false); 			//장착대리점name 비활성
        		this.Div00.bt_agency.set_visible(false); 			//장착대리점button visible
        		
        		this.Div00.ed_salesGroup.set_value(vkgrp);
        		this.Div00.ed_salessGroupNm.set_value(vkgrpNm);
        		this.Div00.ed_salesOffice.set_value(vkbur);
        		this.Div00.ed_salesOfficeNm.set_value(vkburNm);
        		this.Div00.ed_agencyCd.set_value(userId);	
        		this.Div00.ed_agencyNm.set_value(userNm);
        	}

        }

        //조회
        this.fn_search = function(obj,e)
        {
        	var saleGroup = 		"";  //렌탈지사	
        	var saleOffice = 		""; //렌탈지점
        	
        	var ordDayF = 			nvl(this.Div00.cal_Ord_Fday.value); //접수일자FROM	
        	var ordDayT = 			nvl(this.Div00.cal_Ord_Tday.value); //접수일자TO
        	
        	var procDayF = 			nvl(this.Div00.cal_Proc_Fday.value); //장착일자FROM	
        	var procDayT = 			nvl(this.Div00.cal_Proc_Tday.value); //장착일자TO
        	
        	var agencyCd = 		    nvl(this.Div00.ed_agencyCd.value); 	//대리점코드	
        	var ordNo = 		    nvl(this.Div00.ed_ordNo.value); 	//주문번호	
        	var mobNo = 		    nvl(this.Div00.ed_mobNo.value); 	//휴대폰번호	

        	var chanCd = 		    nvl(this.Div00.cb_channel.value); 	//채널	
        	var stockType = 		nvl(this.Div00.cb_stockType.value); //재고유형	
        	
        	var userGrp 	= application.gds_userInfo.getColumn(0, "userGrp"); //그룹
        	var bfVkgrp 	= application.gds_userInfo.getColumn(0, "vkgrp"); 	//지사코드
        	var bfVkgrpNm 	= application.gds_userInfo.getColumn(0, "vkgrpNm"); //지사Nm
        	var bfVkbur 	= application.gds_userInfo.getColumn(0, "vkbur"); 	//지점코드
        	var bfVkburNm 	= application.gds_userInfo.getColumn(0, "vkburNm"); //지점NM
        	var afVkgrp 	= this.Div00.ed_salesGroup.value; 					//팝업 지사코드
        	var afVkgrpNm 	= this.Div00.ed_salesGroupNm.value; 					//팝업 지사Nm
        	var afVkbur 	= this.Div00.ed_salesOffice.value; 					//팝업 지점코드
        	var afVkburNm 	= this.Div00.ed_salesOfficeNm.value; 				//팝업 지점Nm
        	
        	if(userGrp == "04") { //지점
        		if(bfVkgrp != afVkgrp || bfVkgrpNm != afVkgrpNm) {
        			alert("타 조직내역 조회 불가합니다.");
        			return;
        		}
        		if(bfVkbur != afVkbur || bfVkburNm != afVkburNm) {
        			alert("타 조직내역 조회 불가합니다.");
        			return;
        		}
        	}
        	
        	if(userGrp == "03" || userGrp == "07") { //지사
        		if(bfVkgrp != afVkgrp || bfVkgrpNm != afVkgrpNm) {
        			alert("타 조직내역 조회 불가합니다.");
        			return;
        		}
        	}
        	
        	var rentalGroup 	= nvl(this.Div00.ed_salesGroup.value); 	//렌탈지사
        	var rentalOffice 	= nvl(this.Div00.ed_salesOffice.value); 	//렌탈지점
        	var userId      	= application.gds_userInfo.getColumn(0, "userId"); //사용자ID
        	
        	var sSvcID        	= "searchList";             
        	var sController   	= "/rtms/sd/listOrderList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=output";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsList.clearData();
        	
        	sArgs += Ex.util.setParam("rentalGroup", 	saleGroup);
        	sArgs += Ex.util.setParam("rentalOffice",   saleOffice);
        	sArgs += Ex.util.setParam("ordFDay", 	ordDayF);
        	sArgs += Ex.util.setParam("ordTDay", 	ordDayT);
        	sArgs += Ex.util.setParam("procFDay", 	procDayF);
        	sArgs += Ex.util.setParam("procTDay", 	procDayT);
        	sArgs += Ex.util.setParam("agencyCd", 	agencyCd);
        	sArgs += Ex.util.setParam("ordNo", 		ordNo);
        	sArgs += Ex.util.setParam("mobNo", 		mobNo);
        	sArgs += Ex.util.setParam("mode", 		"02");
        	sArgs += Ex.util.setParam("rentalGroup", rentalGroup);
        	sArgs += Ex.util.setParam("rentalOffice", rentalOffice);
        	sArgs += Ex.util.setParam("userGrp", userGrp);
        	sArgs += Ex.util.setParam("userId", userId);
        	
        	sArgs += Ex.util.setParam("chanCd", 	chanCd);
        	sArgs += Ex.util.setParam("stockType", 	stockType);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /***********************************************************************************
        * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        ***********************************************************************************/

        /* callBack함수 */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        { 
        	if (nErrorCode < 0) 
        	{
        		alert(strErrorMsg);				
        		return;
        	} 
        	if(strSvcId == "getDate") {
        		this.Div00.cal_Ord_Fday.set_value(this.firstDate);
        		this.Div00.cal_Ord_Tday.set_value(this.lastDate);
        	}
        	if (strSvcId == "userRentalGroupInfo"){		
        		if (this.dsRentalInfo.getColumn(0, "rentalGroup") == "" || this.dsRentalInfo.getColumn(0, "rentalGroup") == null) return;
        		
        		this.fn_init();
        	}
        	if (strSvcId == "searchList") 
        	{
        		var cnt = this.dsList.getRowCount();
        		if( cnt <= 0) {
        			alert("조회된 데이터가 없습니다.");
        			return;
        		}
        	}
        	
        }

        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.Grid00);
        }

        this.Div00_bt_salesGroupCd_onclick = function(obj,e)
        {
        	var args ={p_arg:"RTSDNoMadeProcOrderList"};
        	Ex.core.popup(this,"지사정보 조회","comm::RTCOMMVkgrp_pop.xfdl",args,"modaless=false");
        }

        this.Div00_bt_salesOfficeCd_onclick = function(obj,e)
        {
        	var args ={p_arg:"RTSDNoMadeProcOrderList", p_rentalGroup:this.Div00.ed_salesGroup.value};
            Ex.core.popup(this,"지점정보 조회","comm::RTCOMMVkbur_pop.xfdl",args,"modaless=false");
        }

        this._setReturn = function(val){	
        	var cd = val[0];
        	var nm = val[1];
        	var gb = val[2];
        	if(gb == "vkgrp") {
        		this.Div00.ed_salesGroup.set_value(cd);
        		this.Div00.ed_salesGroupNm.set_value(nm);
        	} else if(gb == "vkbur" ) {
        		this.Div00.ed_salesOffice.set_value(cd);
        		this.Div00.ed_salesOfficeNm.set_value(nm);
        	} else if(gb == "vkazc" ) {
        		this.Div00.ed_agencyCd.set_value(cd);
        		this.Div00.ed_agencyNm.set_value(nm);
        	}
        	
        }

        this.Div00_bt_agency_onclick = function(obj,e)
        {
        	var args = {p_vkgrpCd:this.Div00.ed_salesGroup.value, p_vkgrpNm:this.Div00.ed_salesGroupNm.value, 
        				p_vkburCd:this.Div00.ed_salesOffice.value, p_vkburNm:this.Div00.ed_salesOfficeNm.value, 
        				p_formId : "RTSDNoMadeProcOrderList"};
        	Ex.core.popup(this,"대리점 조회","comm::RTCOMMAgency_pop.xfdl",args,"modaless=false");
        }

        this.return_agency = function(arr) {
        	this.div_search.ed_salesGroupNm.set_value(arr[0]);
        	this.div_search.ed_salesGroup.set_value(arr[1]);
        	this.div_search.ed_salesOfficeNm.set_value(arr[2]);
        	this.div_search.ed_salesOffice.set_value(arr[3]);
        	this.div_search.ed_agencyNm.set_value(arr[4]);
        	this.div_search.ed_agencyCd.set_value(arr[5]);
        }

        this.Div00_btn_ordNoPopup_onclick = function(obj,e)
        {
        	var args ={p_arg:"RTSDNoMadeProcOrderList"};
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl", args ,"modaless=false");
        }

        this.returnOrderNoInfo = function(val) {
        	this.Div00.ed_ordNo.set_value(val);
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Div00.ed_salesGroup.addEventHandler("onkeyup", this.div_search_ed_warehNm_onkeyup, this);
            this.Div00.bt_salesGroupCd.addEventHandler("onclick", this.Div00_bt_salesGroupCd_onclick, this);
            this.Div00.ed_salesOffice.addEventHandler("onkeyup", this.div_search_ed_warehCd_onkeyup, this);
            this.Div00.bt_salesOfficeCd.addEventHandler("onclick", this.Div00_bt_salesOfficeCd_onclick, this);
            this.Div00.bt_agency.addEventHandler("onclick", this.Div00_bt_agency_onclick, this);
            this.Div00.ed_ordNo.addEventHandler("onkeydown", this.div_search_ed_ordNo_onkeydown, this);
            this.Div00.btn_ordNoPopup.addEventHandler("onclick", this.Div00_btn_ordNoPopup_onclick, this);
            this.Div00.cal_Ord_Tday.addEventHandler("onchanged", this.Div00_Calendar02_onchanged, this);
            this.Div00.cal_Ord_Tday.addEventHandler("canchange", this.Div00_Calendar02_canchange, this);
            this.Div00.cal_Proc_Tday.addEventHandler("onchanged", this.Div00_Calendar02_onchanged, this);
            this.Div00.cal_Proc_Tday.addEventHandler("canchange", this.Div00_Calendar02_canchange, this);

        };

        this.loadIncludeScript("RTSDNoMadeProcOrderList.xfdl");

       
    };
}
)();

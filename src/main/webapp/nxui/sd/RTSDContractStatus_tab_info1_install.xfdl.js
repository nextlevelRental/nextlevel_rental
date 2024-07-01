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
                this.set_name("RTSDContractStatus_tab_info1_install");
                this.set_classname("RTSDContractStatus_tab_info1_install");
                this.set_titletext("[STEP1]설치정보");
                this._setFormPosition(0,0,1147,192);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_install", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeCd\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupCd\" type=\"STRING\" size=\"256\"/><Column id=\"engNm\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"instYn\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"agDesc\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"instCd\" type=\"STRING\" size=\"256\"/><Column id=\"instNm\" type=\"STRING\" size=\"256\"/><Column id=\"instTm\" type=\"STRING\" size=\"256\"/><Column id=\"inst1PosCd\" type=\"STRING\" size=\"256\"/><Column id=\"inst1Addr1\" type=\"STRING\" size=\"256\"/><Column id=\"inst1Addr2\" type=\"STRING\" size=\"256\"/><Column id=\"inst2PosCd\" type=\"STRING\" size=\"256\"/><Column id=\"inst2Addr1\" type=\"STRING\" size=\"256\"/><Column id=\"inst2Addr2\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsTransInfo", this);
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsParamINfo", this);
            obj._setContents("");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static25", "absolute", "0", "5", "1107", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_salesOffice", "absolute", "829", "5", "100", "31", null, null, this);
            obj.set_taborder("3");
            obj.set_text("지점");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_salesOfficeNm", "absolute", "933", "10", "168", "21", null, null, this);
            obj.set_taborder("4");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_procDay", "absolute", "374", "5", "70", "31", null, null, this);
            obj.set_taborder("8");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_align("center middle");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_agencyNm", "absolute", "105", "10", "219", "21", null, null, this);
            obj.set_taborder("9");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_agencyNm", "absolute", "0", "5", "100", "31", null, null, this);
            obj.set_taborder("12");
            obj.set_text("장착대리점");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "35", "1107", "31", null, null, this);
            obj.set_taborder("13");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_instYn", "absolute", "656", "40", "169", "21", null, null, this);
            obj.set_taborder("14");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_instYn", "absolute", "552", "35", "100", "31", null, null, this);
            obj.set_taborder("15");
            obj.set_text("장착여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_equNo", "absolute", "379", "40", "169", "21", null, null, this);
            obj.set_taborder("16");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_equNo", "absolute", "275", "35", "100", "31", null, null, this);
            obj.set_taborder("17");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_engNm", "absolute", "106", "40", "165", "21", null, null, this);
            obj.set_taborder("18");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_engNm", "absolute", "0", "35", "100", "31", null, null, this);
            obj.set_taborder("19");
            obj.set_text("대리점코드");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "65", "1107", "31", null, null, this);
            obj.set_taborder("20");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_agDesc", "absolute", "105", "70", "996", "21", null, null, this);
            obj.set_taborder("25");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_agDesc", "absolute", "0", "65", "100", "31", null, null, this);
            obj.set_taborder("26");
            obj.set_text("대리점주소");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "1107", "0", "40", null, null, "0", this);
            obj.set_taborder("27");
            obj.set_text("w40");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_salesGroup", "absolute", "552", "5", "100", "31", null, null, this);
            obj.set_taborder("28");
            obj.set_text("지사");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_salesGroupNm", "absolute", "656", "10", "169", "21", null, null, this);
            obj.set_taborder("29");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_planDay", "absolute", "829", "35", "100", "31", null, null, this);
            obj.set_taborder("30");
            obj.set_text("장착예정일");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "0", "0", null, "5", "0", null, this);
            obj.set_taborder("34");
            obj.set_text("w5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_planDay", "absolute", "933", "40", "168", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("35");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Calendar("cal_procDay", "absolute", "448", "10", "100", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("36");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Button("btn_agency", "absolute", "303", "9", "22", "21", null, null, this);
            obj.set_taborder("37");
            obj.set_cssclass("btn_WF_edtSch");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_agencyCd", "absolute", "0%", "159", null, "21", "89.1%", null, this);
            obj.set_taborder("38");
            obj.set_displaynulltext("장착대리점코드");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_salesGroupCd", "absolute", "11.16%", "159", null, "21", "77.94%", null, this);
            obj.set_taborder("39");
            obj.set_displaynulltext("지사 코드");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_salesOfficeCd", "absolute", "22.32%", "159", null, "21", "66.78%", null, this);
            obj.set_taborder("40");
            obj.set_displaynulltext("지점 코드");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_saveAgency", "absolute", "329", "10", "41", "21", null, null, this);
            obj.set_taborder("41");
            obj.set_text("저장");
            obj.getSetter("domainId").set("nexa.add");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordNo", "absolute", "33.48%", "159", null, "21", "55.62%", null, this);
            obj.set_taborder("42");
            obj.set_displaynulltext("주문 번호");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "95", "1107", "31", null, null, this);
            obj.set_taborder("43");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_instCd", "absolute", "0", "95", "100", "31", null, null, this);
            obj.set_taborder("44");
            obj.set_text("장착유형");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_instNm", "absolute", "105", "100", "259", "21", null, null, this);
            obj.set_taborder("45");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "125", "1107", "31", null, null, this);
            obj.set_taborder("48");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_inst1Addr", "absolute", "371", "95", "100", "31", null, null, this);
            obj.set_taborder("49");
            obj.set_text("장착주소1");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_inst1PosCd", "absolute", "475", "100", "59", "21", null, null, this);
            obj.set_taborder("50");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_inst1Addr1", "absolute", "537", "100", "270", "21", null, null, this);
            obj.set_taborder("51");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_inst2Addr", "absolute", "371", "125", "100", "31", null, null, this);
            obj.set_taborder("52");
            obj.set_text("장착주소2");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_inst1Addr2", "absolute", "810", "100", "169", "21", null, null, this);
            obj.set_taborder("53");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_instTm", "absolute", "200", "125", "100", "31", null, null, this);
            obj.set_taborder("46");
            obj.set_text("장착시간");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_inst2PosCd", "absolute", "475", "130", "59", "21", null, null, this);
            obj.set_taborder("58");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_inst2Addr1", "absolute", "537", "130", "270", "21", null, null, this);
            obj.set_taborder("59");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_inst2Addr2", "absolute", "810", "130", "169", "21", null, null, this);
            obj.set_taborder("60");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_instTm", "absolute", "305", "130", "59", "21", null, null, this);
            obj.set_taborder("61");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_instTm00", "absolute", "0", "125", "100", "31", null, null, this);
            obj.set_taborder("62");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_instDay", "absolute", "105", "130", "87", "21", null, null, this);
            obj.set_taborder("63");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 192, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDContractStatus_tab_info1_install");
            		p.set_titletext("[STEP1]설치정보");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_agencyNm","value","ds_install","agencyNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_salesOfficeNm","value","ds_install","salesOffice");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_salesGroupNm","value","ds_install","salesGroup");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_engNm","value","ds_install","agencyCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_equNo","value","ds_install","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_instYn","value","ds_install","instYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","ed_agDesc","value","ds_install","addr");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","cal_planDay","value","ds_install","planDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","cal_procDay","value","ds_install","procDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","ed_ordNo","value","ds_install","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","ed_agencyCd","value","ds_install","agencyCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","ed_salesGroupCd","value","ds_install","salesGroupCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","ed_salesOfficeCd","value","ds_install","salesOfficeCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","ed_instNm","value","ds_install","instNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","ed_inst1PosCd","value","ds_install","inst1PosCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","ed_inst1Addr1","value","ds_install","inst1Addr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","ed_inst1Addr2","value","ds_install","inst1Addr2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","ed_inst2PosCd","value","ds_install","inst2PosCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","ed_inst2Addr1","value","ds_install","inst2Addr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","ed_inst2Addr2","value","ds_install","inst2Addr2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","ed_instTm","value","ds_install","instTm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","ed_instDay","value","ds_install","instDay");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDContractStatus_tab_info1_install.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDContractStatus_tab_info1_install.xfdl", function() {
        //include "lib::comLib.xjs";
        this.RTSDContractStatus_tab_info1_install_onload = function(obj,e) {
        	//Ex.core.init(obj);
        }

        /***********************************************************************************
         * CallBack Event(strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
         ***********************************************************************************/
        this.fn_callBack = function(strSvcId,nErrorCode,strErrorMsg) {
        	if(nErrorCode < 0) {
        		return Ex.core.comMsg("alert", strErrorMsg);
        	}
        	
        	
        	switch(strSvcId) {
        		case"rtsd0104AgencyUpdate":
        			this.alert(strErrorMsg);
        			break;
        		default:
        			break;
        	}
        }

        this.btn_agency_onclick = function(obj,e) {
        	var args ={p_arg : "RTSDContractStatus_tab_info1_install"};
        	
        	Ex.core.popup(this, "대리점조회", "comm::RTCOMMAgencyOrd_pop.xfdl", args, "modaless=false");
        }

        this.return_agency = function(arr) {
        	this.ed_salesGroupNm.set_value(arr[0]);
        	this.ed_salesGroupCd.set_value(arr[1]);
        	this.ed_salesOfficeNm.set_value(arr[2]);
        	this.ed_salesOfficeCd.set_value(arr[3]);
        	this.ed_agencyNm.set_value(arr[4]);
        	this.ed_agencyCd.set_value(arr[5]);
        }

        this.btn_saveAgency_onclick = function(obj,e) {
        	if(confirm("저장하시겠습니까?")) {
        		var sSvcID		 = "rtsd0104AgencyUpdate";
        		var sController	 = "/rtms/sd/rtsd0104AgencyUpdate.do";
        		var sInDatasets	 = "input=ds_install:U";
        		var sOutDatasets = "";
        		var sArgs		 = "";
        		var fn_callBack	 = "fn_callBack";
        		
        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        this.ds_install_oncolumnchanged = function(obj,e) {
        	if(e.columnid == "agencyNm") {
        		this.btn_saveAgency.set_enable(true);
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_install.addEventHandler("oncolumnchanged", this.ds_install_oncolumnchanged, this);
            this.addEventHandler("onload", this.RTSDContractStatus_tab_info1_install_onload, this);
            this.btn_agency.addEventHandler("onclick", this.btn_agency_onclick, this);
            this.btn_saveAgency.addEventHandler("onclick", this.btn_saveAgency_onclick, this);

        };

        this.loadIncludeScript("RTSDContractStatus_tab_info1_install.xfdl");

       
    };
}
)();

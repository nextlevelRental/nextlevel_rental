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
                this.set_name("RTCSAdviceStatus_tab_info4_install");
                this.set_classname("RTSDContractStatus_tab_info1_install");
                this.set_titletext("[STEP5]설치정보");
                this._setFormPosition(0,0,1147,150);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_install", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeCd\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupCd\" type=\"STRING\" size=\"256\"/><Column id=\"engNm\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"instYn\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"agDesc\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"street\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsTransInfo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsParamINfo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
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

            obj = new Static("st_procDay", "absolute", "275", "5", "100", "31", null, null, this);
            obj.set_taborder("8");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_align("center middle");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_agencyNm", "absolute", "105", "10", "166", "21", null, null, this);
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
            obj.set_text("설비번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_engNm", "absolute", "106", "40", "165", "21", null, null, this);
            obj.set_taborder("18");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_engNm", "absolute", "0", "35", "100", "31", null, null, this);
            obj.set_taborder("19");
            obj.set_text("장착기사");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "94", "1107", "31", null, null, this);
            obj.set_taborder("20");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_agDesc", "absolute", "105", "99", "996", "21", null, null, this);
            obj.set_taborder("25");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_agDesc", "absolute", "0", "94", "100", "31", null, null, this);
            obj.set_taborder("26");
            obj.set_text("비고");
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

            obj = new Calendar("cal_procDay", "absolute", "379", "10", "169", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("36");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Edit("ed_agencyCd", "absolute", "0%", "124", null, "21", "89.1%", null, this);
            obj.set_taborder("38");
            obj.set_displaynulltext("장착대리점코드");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_salesGroupCd", "absolute", "11.16%", "124", null, "21", "77.94%", null, this);
            obj.set_taborder("39");
            obj.set_displaynulltext("지사 코드");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_salesOfficeCd", "absolute", "22.32%", "124", null, "21", "66.78%", null, this);
            obj.set_taborder("40");
            obj.set_displaynulltext("지점 코드");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordNo", "absolute", "33.48%", "124", null, "21", "55.62%", null, this);
            obj.set_taborder("42");
            obj.set_displaynulltext("주문 번호");
            obj.set_maxlength("80");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "65", "1107", "31", null, null, this);
            obj.set_taborder("43");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_instYn00", "absolute", "560", "70", "265", "21", null, null, this);
            obj.set_taborder("44");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_equNo00", "absolute", "379", "70", "169", "21", null, null, this);
            obj.set_taborder("46");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_equNo00", "absolute", "275", "65", "100", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_engNm00", "absolute", "106", "70", "165", "21", null, null, this);
            obj.set_taborder("48");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_engNm00", "absolute", "0", "65", "100", "31", null, null, this);
            obj.set_taborder("49");
            obj.set_text("우편번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_planDay00", "absolute", "829", "65", "100", "31", null, null, this);
            obj.set_taborder("50");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_salesOfficeNm00", "absolute", "933", "70", "168", "21", null, null, this);
            obj.set_taborder("51");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 150, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDContractStatus_tab_info1_install");
            		p.set_titletext("[STEP5]설치정보");

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
            obj = new BindItem("item4","ed_engNm","value","ds_install","engNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_equNo","value","ds_install","equNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_instYn","value","ds_install","instYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","ed_agDesc","value","ds_install","agDesc");
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
            obj = new BindItem("item13","ed_instYn00","value","ds_install","street");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","ed_equNo00","value","ds_install","city");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","ed_engNm00","value","ds_install","posCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","ed_salesOfficeNm00","value","ds_install","salesOffice");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSAdvicetStatus_tab_info4_install.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSAdvicetStatus_tab_info4_install.xfdl", function() {
        //include "lib::comLib.xjs";
        this.RTCSAdviceStatus_tab_info4_install_onload = function(obj,e){
        	//Ex.core.init(obj);
        }

        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "rtsd0104AgencyUpdate" ){
        		alert(strErrorMsg);
        		//if( nErrorCode == "0" ){
        		//	this.reload();
        		//}else{
        		//	return false;
        		//}
        	}
        }

        this.btn_agency_onclick = function(obj,e){
        	var args ={p_arg : "RTCSAdviceStatus_tab_info4_install"};
        	Ex.core.popup(this,"대리점조회","comm::RTCOMMAgency_pop.xfdl",args, "modaless=false");
        }

        this.return_agency = function(arr){
        	this.ed_salesGroupNm.set_value(arr[0]);
        	this.ed_salesGroupCd.set_value(arr[1]);
        	this.ed_salesOfficeNm.set_value(arr[2]);
        	this.ed_salesOfficeCd.set_value(arr[3]);
        	this.ed_agencyNm.set_value(arr[4]);
        	this.ed_agencyCd.set_value(arr[5]);
        }

        this.btn_saveAgency_onclick = function(obj,e){
        	if( confirm( "저장하시겠습니까?") ){
        		var sSvcID        	= "rtsd0104AgencyUpdate";                    
        		var sController   	= "/rtms/sd/rtsd0104AgencyUpdate.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "input=ds_install:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        this.ds_install_oncolumnchanged = function(obj,e){
        	if( e.columnid == "agencyNm" ){
        		this.btn_saveAgency.set_enable(true);
        	}
        }

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_install.addEventHandler("oncolumnchanged", this.ds_install_oncolumnchanged, this);
            this.addEventHandler("onload", this.RTCSAdviceStatus_tab_info4_install_onload, this);

        };

        this.loadIncludeScript("RTCSAdvicetStatus_tab_info4_install.xfdl");

       
    };
}
)();

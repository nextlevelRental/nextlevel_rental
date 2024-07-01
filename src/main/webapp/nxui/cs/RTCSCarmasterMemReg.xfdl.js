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
                this.set_name("RTCSCarmasterMemReg");
                this.set_classname("RTSDCustGrp");
                this.set_titletext("미스터로디안 조직원 등록");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"carmasterNu\" type=\"STRING\" size=\"256\"/><Column id=\"carmasterNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"street\" type=\"STRING\" size=\"256\"/><Column id=\"etc1\" type=\"STRING\" size=\"256\"/><Column id=\"etc2\" type=\"STRING\" size=\"256\"/><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("useYn", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
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


            
            // UI Components Initialize
            obj = new Static("Static02", "absolute", "1121", "0", null, "496", "0", null, this);
            obj.set_taborder("1");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "10", "55", null, "20", "25", null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "10", "1112", "45", null, null, this);
            obj.set_taborder("3");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);

            obj = new Button("bt_saveCustGrp1", "absolute", "1051", "75", "71", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_text("일괄적용");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Static("st_searchCondition01", "absolute", "21", "23", "112", "20", null, null, this);
            obj.set_taborder("11");
            obj.set_text("미스터로디안");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("Ed_carmasterNm", "absolute", "204", "23", "108", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_tooltiptext("edit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("80");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "112", "9", "30", "44", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_carMaster", "absolute", "185", "22", "20", "21", null, null, this);
            obj.set_taborder("15");
            obj.set_cssclass("btn_WF_edtSch");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Edit("Ed_carmasterNu", "absolute", "142", "23", "44", "21", null, null, this);
            obj.set_taborder("16");
            obj.set_tooltiptext("edit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            obj.set_visible("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_cust", "absolute", "0.87%", "75", null, "261", "2.18%", null, this);
            obj.set_taborder("17");
            obj.style.set_background("@gradation");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0%", "60", null, "31", "0%", null, this.div_cust);
            obj.set_taborder("12");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0%", "30", null, "31", "0%", null, this.div_cust);
            obj.set_taborder("13");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0%", "90", null, "31", "0%", null, this.div_cust);
            obj.set_taborder("14");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0%", "120", null, "31", "0%", null, this.div_cust);
            obj.set_taborder("15");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "0%", "0", null, "31", "0%", null, this.div_cust);
            obj.set_taborder("16");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_custTp", "absolute", "0%", "0", null, "31", "88.58%", null, this.div_cust);
            obj.set_taborder("17");
            obj.set_text("미스터로디안 사번");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_custNm", "absolute", "0%", "30", null, "31", "88.58%", null, this.div_cust);
            obj.set_taborder("18");
            obj.set_text("지사");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_mobNo", "absolute", "0%", "60", null, "31", "88.58%", null, this.div_cust);
            obj.set_taborder("19");
            obj.set_text("휴대폰");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_posCd", "absolute", "0%", "90", null, "31", "88.58%", null, this.div_cust);
            obj.set_taborder("20");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_posCd", "absolute", "11.78%", "95", null, "21", "80.76%", null, this.div_cust);
            obj.set_taborder("21");
            obj.set_inputtype("number");
            obj.set_maxlength("6");
            obj.set_enable("false");
            obj.set_lengthunit("ascii");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_mobFirm", "absolute", "33.9%", "60", null, "31", "54.68%", null, this.div_cust);
            obj.set_taborder("22");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_addr1", "absolute", "19.6%", "95", null, "21", "62.41%", null, this.div_cust);
            obj.set_taborder("23");
            obj.set_maxlength("100");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_addr2", "absolute", "37.95%", "95", null, "21", "33.81%", null, this.div_cust);
            obj.set_taborder("24");
            obj.set_maxlength("160");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_telNo", "absolute", "68.44%", "90", null, "31", "20.86%", null, this.div_cust);
            obj.set_taborder("25");
            obj.set_text("퇴사일");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_telNo2", "absolute", "68.44%", "120", null, "31", "20.86%", null, this.div_cust);
            obj.set_taborder("26");
            obj.set_text("근무여부");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new MaskEdit("ed_mobNo", "absolute", "11.78%", "65", null, "21", "75.72%", null, this.div_cust);
            obj.set_taborder("4");
            obj.set_type("string");
            obj.set_mask("###-####-####");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_buslNo", "absolute", "33.9%", "30", null, "31", "54.68%", null, this.div_cust);
            obj.set_taborder("27");
            obj.set_text("지점");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_custTp2", "absolute", "68.44%", "30", null, "31", "20.86%", null, this.div_cust);
            obj.set_taborder("28");
            obj.set_text("대리점");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Button("btn_postSearch", "absolute", "17.45%", "94", null, "21", "80.76%", null, this.div_cust);
            obj.set_taborder("7");
            obj.set_cssclass("btn_WF_edtSch");
            obj.getSetter("domainId").set("nexa.save");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_carmasterNu", "absolute", "11.78%", "5", null, "21", "75.72%", null, this.div_cust);
            obj.set_taborder("29");
            obj.set_maxlength("10");
            obj.set_enable("false");
            obj.set_lengthunit("ascii");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_custNo00", "absolute", "33.9%", "0", null, "31", "54.68%", null, this.div_cust);
            obj.set_taborder("30");
            obj.set_text("미스터로디안 명");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_carmasterNm", "absolute", "45.68%", "5", null, "21", "41.82%", null, this.div_cust);
            obj.set_taborder("0");
            obj.set_maxlength("80");
            obj.set_lengthunit("ascii");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_telNo", "absolute", "45.77%", "65", null, "21", "41.91%", null, this.div_cust);
            obj.set_taborder("5");
            obj.set_maxlength("12");
            obj.set_lengthunit("ascii");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_mobFirm00", "absolute", "68.44%", "60", null, "31", "20.86%", null, this.div_cust);
            obj.set_taborder("31");
            obj.set_text("입사일");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Combo("Cb_useYn", "absolute", null, "125", "136", "21", "8.36%", null, this.div_cust);
            this.div_cust.addChild(obj.name, obj);
            obj.set_taborder("9");
            obj.set_text("Y");
            obj.set_innerdataset("@useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_value("Y");
            obj.set_enable("true");
            obj.set_index("0");
            obj = new Calendar("Calendar00", "absolute", "79.5%", "66", "136", "21", null, null, this.div_cust);
            this.div_cust.addChild(obj.name, obj);
            obj.set_taborder("6");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Calendar("Calendar01", "absolute", "79.5%", "95", "136", "21", null, null, this.div_cust);
            this.div_cust.addChild(obj.name, obj);
            obj.set_taborder("8");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Edit("Ed_salesGroup", "absolute", "11.78%", "35", null, "21", "81.29%", null, this.div_cust);
            obj.set_taborder("32");
            obj.set_enableevent("true");
            obj.set_visible("true");
            obj.set_enable("false");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            this.div_cust.addChild(obj.name, obj);
            obj = new Button("Btn_salesGroup", "absolute", "16.91%", "34", null, "21", "81.29%", null, this.div_cust);
            obj.set_taborder("1");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("Ed_salesGroupNm", "absolute", "18.62%", "35", null, "21", "70.77%", null, this.div_cust);
            obj.set_taborder("33");
            obj.set_visible("true");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("Ed_salesOfficeNm", "absolute", "52.52%", "35", null, "21", "36.87%", null, this.div_cust);
            obj.set_taborder("34");
            obj.set_visible("true");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("Ed_agencyCdNm", "absolute", "86.33%", "35", null, "21", "3.06%", null, this.div_cust);
            obj.set_taborder("35");
            obj.set_visible("true");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_custTp00", "absolute", "0%", "184", null, "31", "88.58%", null, this.div_cust);
            obj.set_taborder("36");
            obj.set_text("기타1");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_etc1", "absolute", "11.78%", "189", null, "21", "75.72%", null, this.div_cust);
            obj.set_taborder("10");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            obj.set_enable("true");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_custNo01", "absolute", "33.9%", "184", null, "31", "54.68%", null, this.div_cust);
            obj.set_taborder("37");
            obj.set_text("기타2");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_etc2", "absolute", "45.68%", "189", null, "21", "41.82%", null, this.div_cust);
            obj.set_taborder("11");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("Ed_salesOffice", "absolute", "45.77%", "35", null, "21", "47.3%", null, this.div_cust);
            obj.set_taborder("38");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Button("Btn_salesOffice", "absolute", "50.81%", "34", null, "21", "47.39%", null, this.div_cust);
            obj.set_taborder("2");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("Ed_agencyCd", "absolute", "79.59%", "35", null, "21", "13.49%", null, this.div_cust);
            obj.set_taborder("39");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Button("Btn_agencyCd", "absolute", "84.62%", "34", null, "21", "13.58%", null, this.div_cust);
            obj.set_taborder("3");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_ordAgent", "absolute", "0%", "120", null, "31", "88.58%", null, this.div_cust);
            obj.set_taborder("40");
            obj.set_text("판매인번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_ordAgent", "absolute", "11.78%", "125", null, "21", "75.72%", null, this.div_cust);
            obj.set_taborder("41");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            obj.set_visible("true");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "0", "150", null, "31", "0%", null, this.div_cust);
            obj.set_taborder("42");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_cust.addChild(obj.name, obj);
            obj = new Static("st_useYn00", "absolute", "0", "150", null, "31", "88.58%", null, this.div_cust);
            obj.set_taborder("43");
            obj.set_text("렌탈지역");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroupCd00", "absolute", "11.78%", "156", "80", "21", null, null, this.div_cust);
            obj.set_taborder("44");
            obj.set_readonly("true");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Button("bt_salesGroup00", "absolute", "215", "156", "21", "21", null, null, this.div_cust);
            obj.set_taborder("45");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroupNm00", "absolute", "236", "156", "148", "21", null, null, this.div_cust);
            obj.set_taborder("46");
            obj.set_readonly("true");
            obj.set_enable("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroupCd01", "absolute", "11.78%", "156", "37", "21", null, null, this.div_cust);
            obj.set_taborder("47");
            obj.set_readonly("true");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);
            obj = new Edit("ed_salesGroupNm01", "absolute", "236", "156", "36", "21", null, null, this.div_cust);
            obj.set_taborder("48");
            obj.set_readonly("true");
            obj.set_enable("false");
            obj.set_visible("false");
            this.div_cust.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1112, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("3");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1024, 301, this.div_cust,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("17");
            		p.style.set_background("@gradation");
            		p.set_scrollbars("none");

            	}
            );
            this.div_cust.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDCustGrp");
            		p.set_titletext("미스터로디안 조직원 등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","div_cust.ed_carmasterNu","value","dsList","carmasterNu");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_cust.ed_carmasterNm","value","dsList","carmasterNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_cust.Ed_salesGroup","value","dsList","salesGroup");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_cust.Ed_salesOffice","value","dsList","salesOffice");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","div_cust.Ed_agencyCd","value","dsList","agencyCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_cust.ed_mobNo","value","dsList","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","div_cust.ed_telNo","value","dsList","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","div_cust.Calendar00","value","dsList","strDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","div_cust.Calendar01","value","dsList","endDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","div_cust.Cb_useYn","value","dsList","useYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","div_cust.Ed_salesGroupNm","value","dsList","salesGroupNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","div_cust.Ed_salesOfficeNm","value","dsList","salesOfficeNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","div_cust.Ed_agencyCdNm","value","dsList","agencyNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","div_cust.ed_posCd","value","dsList","posCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","div_cust.ed_addr1","value","dsList","city");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","div_cust.ed_addr2","value","dsList","street");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","div_cust.ed_etc1","value","dsList","etc1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","div_cust.ed_etc2","value","dsList","etc2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","div_cust.ed_ordAgent","value","dsList","ordAgent");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","div_cust.ed_salesGroupCd00","value","dsList","rentalGroupNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","div_cust.ed_salesGroupNm00","value","dsList","rentalOfficeNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","div_cust.ed_salesGroupCd01","value","dsList","rentalGroup");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","div_cust.ed_salesGroupNm01","value","dsList","rentalOffice");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSCarmasterMemReg.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSCarmasterMemReg.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSCarmasterMemReg.xfdl
         * 설    명 : 미스터로디안 조직원 등록
         * 작 성 자 : 
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2017-05-19	wjim		[20170519_01] 판매인번호 추가
         * 2017-06-22	wjim		[20170622_01] 조회기준 변경
         *							- 로디안명 > 로디안 사번
         * 2017-06-22	wjim		[20170622_02] 로디안 팝업 조회기준 변경
         *							- '근무여부' 관계없이 조회
         ***************************************************************************************************/
         
        //include "lib::comLib.xjs";

        this.resultGrpNo = "";

        this.selectGrpNo = "0";
        this.selectCustNo = "0";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDCustGrp_onload = function(obj,e)
        {
        	Ex.core.init(obj); 
        	this.parent.setButton("C|N|S", this);
        }

        /**
         * 조회
         * - 조회기준 변경 [20170622_01]
         */
        this.fn_search = function(obj,e) {
        	var carmasterNu = nvl(this.Ed_carmasterNu.value); //로디안 사번	
        	
        	if (carmasterNu == "") {
        		this.alert("조회할 로디안을 선택해주세요!")
        		return;
        	}
        	
        	var sSvcID        	= "carmasterAreaList";                    
        	var sController   	= "/ntrms/cs/carmasterNu.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsList.clearData();
        		
        	sArgs += Ex.util.setParam("carmasterNu", carmasterNu);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        	
        //저장
        this.fn_save = function(obj,e)
        {	var rType = this.dsList.getRowType(0);
        	if(rType == "1") {
        		alert("변경내용이 없습니다.")
        		return;
        	} else if(rType == "0") {
        		alert("추가버튼을 눌러 정보를 입력해주세요.")
        		return;
        	} 
        	var carmasterNm = nvl(this.div_cust.ed_carmasterNm.value);
        	if(carmasterNm == "") {
        		alert("미스터로디안 명을 입력해주세요.");
        		this.div_cust.ed_carmasterNm.setFocus();
        		return;
        	}
        	
        	var sSvcID        	= "saveData";
        	var sController   	= "ntrms/cs/carmasterMemRegSave.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	sInDatasets   		= "input=dsList:U";
        	sOutDatasets  		= "";
        	var fn_callBack		= "fn_callBack";
        	
        	this.Ed_carmasterNm.set_value(carmasterNm);
        	this.div_cust.ed_telNo.set_value(FN_numberHyphenOut(this.div_cust.ed_telNo.value));
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        //추가
        this.fn_add = function(obj,e)
        {
        	this.Ed_carmasterNm.set_value("");
        	this.Ed_carmasterNu.set_value("");
        	this.dsList.clearData();
        	this.dsList.addRow();
        	this.div_cust.Cb_useYn.set_index(0);
        	this.div_cust.ed_carmasterNm.setFocus();
        }

        //미스터로디안 팝업 버튼
        this.btn_carMaster_onclick = function(obj,e)
        {
        	// [20170622_02] p_useYn 추가
        	var args ={
        		  p_formId : "RTCSCarMaster"
        		, p_useYn  : "A"
        	};
        	
        	Ex.core.popup(this,"미스터로디안 찾기","cs::RTCSCarMaster_pop.xfdl",args, "modaless=false");
        }
        //팝업 리턴
        this.returnCarmaster = function(val1,val2){
        	this.Ed_carmasterNu.set_value(val1);
        	this.Ed_carmasterNm.set_value(val2);
        }
        	
        //일괄적용 button
        this.bt_saveCustGrp1_onclick = function(obj,e)
        {
        	this.dsList.addColumn("carmasterNu", "string", 256);
        	this.dsList.addColumn("carmasterNm", "string", 256);
        	
        	var carmasterNu = nvl(this.Ed_carmasterNu.value); //미스터로디안 코드
        	var carmasterNm = nvl(this.Ed_carmasterNm.value); //미스터로디안 이름
        	
        	if(carmasterNu == "" || carmasterNm == "") {
        		alert("미스터로디안를 입력해주세요.");
        		return;
        	}
        	if( confirm( '미스터로디안 "' + carmasterNm + '" 을 적용시키겠습니까?') ){
        		var cnt = this.dsList.rowcount;
        		var checkCnt = 0;
        		for(var i = cnt; i >= 0; i--) {
        			if(this.dsList.getColumn(i, "check")  == "1") {
        				this.dsList.setColumn(i, "carmasterNu", carmasterNu);
        				this.dsList.setColumn(i, "carmasterNm", carmasterNm);
        				checkCnt++;
        			}
        		}
        	}else{
        		return false;
        	}
        	
        	if(checkCnt == 0) {
        		alert("미스터로디안 적용 대상을 선택해주세요.");
        	} else {
        		
        	}
        }

        //우편번호 찾기
        this.div_cust_btn_postSearch_onclick = function(obj,e)
        {
        	var args ={p_arg : "RTCSCarmasterMemReg"};
        	Ex.core.popup(this,"우편번호 조회","comm::RTCOMMPostCode_pop.xfdl",args, "modaless=false");
        }
        //우편번호 리턴
        this.FN_postCd = function(res ){
        	this.div_cust.ed_posCd.set_value( res[0] );
        	this.div_cust.ed_addr1.set_value( res[1] );
        	this.div_cust.ed_addr2.set_value( res[2] );
        }

        
        //광역시/도 enter
        this.div_search_Ed_doNm_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 )
        	{
        		this.fn_search();
        	}
        }
        //시/군/구 enter
        this.div_search_Ed_ctNm_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 )
        	{
        		this.fn_search();
        	}
        }
        //면/동 enter
        this.div_search_Ed_emNm_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 )
        	{
        		this.fn_search();
        	}
        }

        //지사 팝업
        this.div_cust_Btn_salesGroup_onclick = function(obj,e)
        {
        	var args ={p_arg:""};
        	Ex.core.popup(this,"지사 조회","comm::RTCOMMVkgrp_pop_old.xfdl",args,"modaless=false");
        }
        //지점 팝업
        this.div_cust_Btn_salesOffice_onclick = function(obj,e)
        {
        	var args ={p_arg:"RTCSCarmasterMemReg"};
        	Ex.core.popup(this,"지점 조회","comm::RTCOMMVkbur_pop_old.xfdl",args,"modaless=false");
        }
        //대리점 팝업
        this.div_cust_Btn_agencyCd_onclick = function(obj,e)
        {
        	var args = {p_vkgrpCd: this.div_cust.Ed_salesGroup.value, p_vkgrpNm: this.div_cust.Ed_salesGroupNm.value, 
        				p_vkburCd: this.div_cust.Ed_salesOffice.value, p_vkburNm: this.div_cust.Ed_salesOfficeNm.value, 
        				p_formId : "RTCSCarmasterMemReg"};
        	Ex.core.popup(this,"대리점 조회","comm::RTCOMMAgency_pop.xfdl",args,"modaless=false");
        }

        //----------------------------------------------------------------------------------
        // [렌탈지역등록] 클릭: 팝업호출
        //----------------------------------------------------------------------------------
        this.div_cust.bt_salesGroup00_onclick = function(obj,e) {
        	var args = {p_argGrpNo : ""};
        	
        	Ex.core.popup(this, "렌탈지역등록", "sd::RTSDRentalAreaRegisterPopup2_new.xfdl", args, "modaless=false");
        }

        	//----------------------------------------------------------------------------------
        	// 팝업반환값(렌탈지역등록)
        	//----------------------------------------------------------------------------------
        	this._setReturnRentalArea = function(val){
        		var sDsNm = val[0];
        		var nRowCnt = sDsNm.rowcount;
        		
        		var rentalGroup=sDsNm.getColumn(0,"rentalGroup");
        		var rentalOffice=sDsNm.getColumn(0,"rentalOffice");
        		var rentalGroupNm=sDsNm.getColumn(0,"rentalGroupNm");
        		var rentalOfficeNm =sDsNm.getColumn(0,"rentalOfficeNm");

        		this.div_cust.ed_salesGroupCd01.set_value(rentalGroup);		
        		this.div_cust.ed_salesGroupNm01.set_value(rentalOffice);
        		this.div_cust.ed_salesGroupCd00.set_value(rentalGroupNm);
        		this.div_cust.ed_salesGroupNm00.set_value(rentalOfficeNm);		
        	}

        
        // 파라미터 반환 공통
        this._setReturn = function(val) {
        	var cd = val[0];
        	var nm = val[1];
        	var gb = val[2];
        	if(gb == "vkgrp") {
        		this.div_cust.Ed_salesGroup.set_value(cd);
        		this.div_cust.Ed_salesGroupNm.set_value(nm);
        	} else if(gb == "vkbur" ) {
        		this.div_cust.Ed_salesOffice.set_value(cd);
        		this.div_cust.Ed_salesOfficeNm.set_value(nm);
        	} else if(gb == "vkazc" ) {
        		this.div_cust.Ed_agencyCd.set_value(cd);
        		this.div_cust.Ed_agencyCdNm.set_value(nm);
        	}
        }
        /*
        this.div_cust_ed_telNo_onkeyup = function(obj:Edit, e:nexacro.KeyEventInfo)
        {
        	this.div_cust.ed_telNo.set_value(FN_numberHyphenInReturn(this.div_cust.ed_telNo.value));
        }*/

        this.div_cust_ed_telNo_onchanged = function(obj,e)
        {
        	this.div_cust.ed_telNo.set_value(FN_numberHyphenInReturn(this.div_cust.ed_telNo.value));
        }

        /**
         * Transaction CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        {
        	if( strSvcId == "initRTCMCustGrp" ){
        		this.div_search.cal_grpDayStart.set_value(FN_beforeMonths());
        		this.div_search.cal_grpDayEnd.set_value(FN_today());
        	}
        	
        	if( strSvcId == "carmasterAreaList" ){
        		this.dsList.set_updatecontrol(false);
        		this.div_cust.ed_telNo.set_value(FN_numberHyphenInReturn(this.dsList.getColumn(0,"telNo")));
        		this.dsList.set_updatecontrol(true);
        		//alert(this.dsList.saveXML());
        		var cnt = this.dsList.getRowCount();
        		if( cnt <= 0) {
        			alert("조회된 데이터가 없습니다.");
        			return;
        		} else {
        		}
        	}
        	if(strSvcId == "saveData") {
        		alert(strErrorMsg);
        		this.fn_search();
        	}
        	
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDCustGrp_onload, this);
            this.bt_saveCustGrp1.addEventHandler("onclick", this.bt_saveCustGrp1_onclick, this);
            this.btn_carMaster.addEventHandler("onclick", this.btn_carMaster_onclick, this);
            this.div_cust.ed_mobNo.addEventHandler("onsetfocus", this.div_cust_ed_mobNo_onsetfocus, this);
            this.div_cust.btn_postSearch.addEventHandler("onclick", this.div_cust_btn_postSearch_onclick, this);
            this.div_cust.ed_telNo.addEventHandler("onkeyup", this.div_cust_ed_telNo_onkeyup, this);
            this.div_cust.ed_telNo.addEventHandler("onchanged", this.div_cust_ed_telNo_onchanged, this);
            this.div_cust.Btn_salesGroup.addEventHandler("onclick", this.div_cust_Btn_salesGroup_onclick, this);
            this.div_cust.Btn_salesOffice.addEventHandler("onclick", this.div_cust_Btn_salesOffice_onclick, this);
            this.div_cust.Btn_agencyCd.addEventHandler("onclick", this.div_cust_Btn_agencyCd_onclick, this);
            this.div_cust.bt_salesGroup00.addEventHandler("onclick", this.div_cust.bt_salesGroup00_onclick, this);

        };

        this.loadIncludeScript("RTCSCarmasterMemReg.xfdl");

       
    };
}
)();

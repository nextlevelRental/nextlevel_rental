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
                this.set_name("RTCSAdvicetStatus_tab_info1_contractInfo");
                this.set_classname("RTCMCustRegister");
                this.set_scrollbars("autoboth");
                this.set_titletext("[STEP2]계약정보");
                this.set_name("RTSDCustRegister");
                this._setFormPosition(0,0,1147,296);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_contractStatus", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"osYn\" type=\"STRING\" size=\"256\"/><Column id=\"mepYn\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"maMileage\" type=\"STRING\" size=\"256\"/><Column id=\"reqText\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderCdNm\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"posCd2\" type=\"STRING\" size=\"256\"/><Column id=\"mobFirm\" type=\"STRING\" size=\"256\"/><Column id=\"custTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"vbeln\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"rerentDayF\" type=\"STRING\" size=\"256\"/><Column id=\"rerentDayT\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleCdNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleCdDc\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static34", "absolute", "0", "18", "1122", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNo", "absolute", "0", "18", "130", "31", null, null, this);
            obj.set_taborder("1");
            obj.set_text("고객코드");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNo", "absolute", "134", "23", "142", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm", "absolute", "280", "18", "130", "31", null, null, this);
            obj.set_taborder("4");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNm", "absolute", "414", "23", "142", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "48", "1122", "31", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_statNm", "absolute", "974", "53", "142", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_statNm", "absolute", "840", "48", "130", "31", null, null, this);
            obj.set_taborder("8");
            obj.set_text("계약상태");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_saleNm", "absolute", "694", "53", "142", "21", null, null, this);
            obj.set_taborder("9");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_saleNm", "absolute", "560", "48", "130", "31", null, null, this);
            obj.set_taborder("10");
            obj.set_text("계약유형");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_chanNm", "absolute", "414", "53", "142", "21", null, null, this);
            obj.set_taborder("11");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_chanNm", "absolute", "280", "48", "130", "31", null, null, this);
            obj.set_taborder("12");
            obj.set_text("채널구분");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordNm", "absolute", "134", "53", "142", "21", null, null, this);
            obj.set_taborder("13");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNm", "absolute", "0", "48", "130", "31", null, null, this);
            obj.set_taborder("14");
            obj.set_text("주문구분");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "78", "1122", "31", null, null, this);
            obj.set_taborder("15");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_cancDay", "absolute", "280", "78", "130", "31", null, null, this);
            obj.set_taborder("16");
            obj.set_text("취소일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordDay", "absolute", "0", "78", "130", "31", null, null, this);
            obj.set_taborder("17");
            obj.set_text("접수일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "0", "108", "1122", "31", null, null, this);
            obj.set_taborder("18");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_psNm", "absolute", "694", "113", "142", "21", null, null, this);
            obj.set_taborder("20");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_psNm", "absolute", "560", "108", "130", "31", null, null, this);
            obj.set_taborder("21");
            obj.set_text("프리미엄서비스");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mepYn", "absolute", "414", "113", "142", "21", null, null, this);
            obj.set_taborder("22");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_mepYn", "absolute", "280", "108", "130", "31", null, null, this);
            obj.set_taborder("23");
            obj.set_text("중도완납여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_osYn", "absolute", "134", "113", "142", "21", null, null, this);
            obj.set_taborder("24");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_osYn", "absolute", "0", "108", "130", "31", null, null, this);
            obj.set_taborder("25");
            obj.set_text("소유권이전여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "0", "3", null, "7", "0", null, this);
            obj.set_taborder("27");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static33", "absolute", "0", "208", "1122", "31", null, null, this);
            obj.set_taborder("29");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_maMileage", "absolute", "560", "208", "130", "31", null, null, this);
            obj.set_taborder("30");
            obj.set_text("월 평균주행거리");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_cMileage", "absolute", "280", "208", "130", "31", null, null, this);
            obj.set_taborder("31");
            obj.set_text("현재주행거리");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carOwner", "absolute", "134", "213", "142", "21", null, null, this);
            obj.set_taborder("32");
            obj.set_readonly("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_carOwner", "absolute", "0", "208", "130", "31", null, null, this);
            obj.set_taborder("33");
            obj.set_text("차량소유자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "0", "247", null, "7", "0", null, this);
            obj.set_taborder("34");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "0", "178", "1122", "31", null, null, this);
            obj.set_taborder("35");
            obj.set_cssclass("sta_WF_detailLabel2");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_makerNm", "absolute", "0", "178", "130", "31", null, null, this);
            obj.set_taborder("36");
            obj.set_text("카메이커");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_makerNm", "absolute", "134", "183", "142", "21", null, null, this);
            obj.set_taborder("37");
            obj.set_readonly("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_mcNm", "absolute", "280", "178", "130", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mcNm", "absolute", "414", "183", "142", "21", null, null, this);
            obj.set_taborder("39");
            obj.set_readonly("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_carNo", "absolute", "560", "178", "130", "31", null, null, this);
            obj.set_taborder("40");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carNo", "absolute", "694", "183", "142", "21", null, null, this);
            obj.set_taborder("41");
            obj.set_readonly("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_cancDay", "absolute", "414", "83", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("42");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Calendar("cla_ordDay", "absolute", "134", "83", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("43");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new MaskEdit("ed_cMileage", "absolute", "414", "213", "110", "21", null, null, this);
            obj.set_taborder("44");
            obj.set_readonly("true");
            obj.set_mask("###,###,###,##0");
            obj.set_type("number");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_maMileage", "absolute", "694", "213", "110", "21", null, null, this);
            obj.set_taborder("45");
            obj.set_readonly("true");
            obj.set_mask("###,###,###,##0");
            obj.set_enable("false");
            obj.set_type("number");
            this.addChild(obj.name, obj);

            obj = new Static("st_cMileage2", "absolute", "530", "213", "25", "21", null, null, this);
            obj.set_taborder("46");
            obj.set_text("Km");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_cMileage00", "absolute", "810", "213", "25", "21", null, null, this);
            obj.set_taborder("47");
            obj.set_text("Km");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("cust_birth_title", "absolute", "560", "18", "130", "31", null, null, this);
            obj.set_taborder("48");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("cust_tel_title", "absolute", "840", "18", "130", "31", null, null, this);
            obj.set_taborder("49");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("cust_birthDay", "absolute", "694", "23", "142", "21", null, null, this);
            obj.set_taborder("50");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("cust_telNo", "absolute", "974", "23", "142", "21", null, null, this);
            obj.set_taborder("51");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_vbeln", "absolute", "974", "113", "79", "21", null, null, this);
            obj.set_taborder("52");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_vbeln", "absolute", "840", "108", "130", "31", null, null, this);
            obj.set_taborder("53");
            obj.set_text("배송오더");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Button("btn_carInfoUpdate", "absolute", "1036", "214", "80", "21", null, null, this);
            obj.set_taborder("55");
            obj.set_text("차량정보변경");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "138", "1122", "31", null, null, this);
            obj.set_taborder("56");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_rerentDay", "absolute", "0", "138", "130", "31", null, null, this);
            obj.set_taborder("57");
            obj.set_text("재렌탈가능일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Calendar("cla_rerentDayF", "absolute", "134", "143", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("58");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Calendar("cla_rerentDayT", "absolute", "293", "143", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("59");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Static("st_provsnNo", "absolute", "560", "138", "130", "31", null, null, this);
            obj.set_taborder("60");
            obj.set_text("가계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_provsnNo", "absolute", "694", "143", "142", "21", null, null, this);
            obj.set_taborder("61");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "280", "142", "9", "21", null, null, this);
            obj.set_taborder("62");
            obj.set_text("~");
            this.addChild(obj.name, obj);

            obj = new Static("st_psNm00", "absolute", "560", "78", "130", "31", null, null, this);
            obj.set_taborder("63");
            obj.set_text("판매상품명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_psNm01", "absolute", "840", "78", "130", "31", null, null, this);
            obj.set_taborder("64");
            obj.set_text("판매상품 할인율/원");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_saleCdNm", "absolute", "694", "83", "142", "21", null, null, this);
            obj.set_taborder("65");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_saleCdDc", "absolute", "974", "82", "142", "21", null, null, this);
            obj.set_taborder("66");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_makerNm00", "absolute", "134", "263", "66", "21", null, null, this);
            obj.set_taborder("67");
            obj.set_readonly("true");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_makerNm01", "absolute", "166", "263", "70", "21", null, null, this);
            obj.set_taborder("68");
            obj.set_readonly("true");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_makerNm02", "absolute", "198", "263", "50", "21", null, null, this);
            obj.set_taborder("69");
            obj.set_readonly("true");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_makerNm03", "absolute", "222", "263", "54", "21", null, null, this);
            obj.set_taborder("70");
            obj.set_readonly("true");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_makerNm04", "absolute", "238", "263", "54", "21", null, null, this);
            obj.set_taborder("71");
            obj.set_readonly("true");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 296, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMCustRegister");
            		p.set_scrollbars("autoboth");
            		p.set_titletext("[STEP2]계약정보");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_custNo","value","ds_contractStatus","custNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_custNm","value","ds_contractStatus","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_statNm","value","ds_contractStatus","statNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_saleNm","value","ds_contractStatus","saleNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_chanNm","value","ds_contractStatus","chanNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_ordNm","value","ds_contractStatus","ordNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","ed_psNm","value","ds_contractStatus","psNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","ed_mepYn","value","ds_contractStatus","mepYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","ed_osYn","value","ds_contractStatus","osYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","ed_carOwner","value","ds_contractStatus","carOwner");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","ed_makerNm","value","ds_contractStatus","makerNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","ed_mcNm","value","ds_contractStatus","mcNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","ed_carNo","value","ds_abc","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","cal_cancDay","value","ds_contractStatus","cancDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","cla_ordDay","value","ds_contractStatus","ordDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","ed_cMileage","value","ds_contractStatus","cMileage");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","ed_maMileage","value","ds_contractStatus","maMileage");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","cust_birthDay","value","ds_contractStatus","birthDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item24","cust_telNo","value","ds_contractStatus","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item25","ed_vbeln","value","ds_contractStatus","vbeln");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item27","cla_rerentDayF","value","ds_contractStatus","rerentDayF");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item28","cla_rerentDayT","value","ds_contractStatus","rerentDayT");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item29","ed_provsnNo","value","ds_contractStatus","provsnNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_saleCdNm","value","ds_contractStatus","saleCdNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","ed_saleCdDc","value","ds_contractStatus","saleCdDc");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","ed_makerNm00","value","ds_contractStatus","makerCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","ed_makerNm01","value","ds_contractStatus","modelCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","ed_makerNm02","value","ds_contractStatus","contentsCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","ed_makerNm03","value","ds_contractStatus","frCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item26","ed_makerNm04","value","ds_contractStatus","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSAdvicetStatus_tab_info1_contractInfo.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSAdvicetStatus_tab_info1_contractInfo.xfdl", function() {
        //include "lib::comLib.xjs";

         this.btn_carInfoUpdate_onclick = function(obj,e){
         	var args ={p_arg : this.p_arg};
         	Ex.core.popup(this,"차량정보변경","comm::RTCOMMCarInfoUpdate.xfdl",args, "modaless=false");
         }

        this.FN_carInfoUpdate = function(ordNo){

        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_contractStatus.addEventHandler("onvaluechanged", this.ds_contractStatus_onvaluechanged, this);
            this.btn_carInfoUpdate.addEventHandler("onclick", this.btn_carInfoUpdate_onclick, this);

        };

        this.loadIncludeScript("RTCSAdvicetStatus_tab_info1_contractInfo.xfdl");

       
    };
}
)();

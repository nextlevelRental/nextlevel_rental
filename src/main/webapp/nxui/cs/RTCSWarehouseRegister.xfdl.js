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
                this.set_name("RTCSWarehouseRegister");
                this.set_classname("RTCSWarehouseRegister");
                this.set_titletext("창고등록");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_rtcs0200", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"warehCd\" type=\"STRING\" size=\"256\"/><Column id=\"warehNm\" type=\"STRING\" size=\"256\"/><Column id=\"begday\" type=\"STRING\" size=\"256\"/><Column id=\"endday\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYn", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYnSelect", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1122", "45", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_telNo", "absolute", "402", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("17");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_wareh", "absolute", "8", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("18");
            obj.set_text("창고코드");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "372", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", null, "12", "0", null, this.div_search);
            obj.set_taborder("21");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "30", null, "12", "0", null, this.div_search);
            obj.set_taborder("22");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_warehCd", "absolute", "112", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_enable("true");
            obj.set_imemode("none");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_warehNm", "absolute", "252", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_wareh", "absolute", "230", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_telNo", "absolute", "502", "10", "121", "21", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_maxlength("15");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_useYn", "absolute", "653", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_useYn", "absolute", "763", "10", "80", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("24");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_useYnSelect");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_enable("true");
            obj.set_index("-1");
            obj = new Static("Static00", "absolute", "623", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "45", "1147", "20", null, null, this);
            obj.set_taborder("28");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "61", "169", "20", null, null, this);
            obj.set_taborder("29");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "76", "1147", "10", null, null, this);
            obj.set_taborder("30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_rtcs0200", "absolute", "0", "86", "1122", "210", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_rtcs0200");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"140\"/><Column size=\"140\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"60\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"창고코드\"/><Cell col=\"1\" text=\"창고명\"/><Cell col=\"2\" text=\"시작일자\"/><Cell col=\"3\" text=\"종료일자\"/><Cell col=\"4\" text=\"우편번호\"/><Cell col=\"5\" text=\"주소\"/><Cell col=\"6\" text=\"상세주소\"/><Cell col=\"7\" text=\"전화번호\"/><Cell col=\"8\" text=\"팩스번호\"/><Cell col=\"9\" text=\"핸드폰번호\"/><Cell col=\"10\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" text=\"bind:warehCd\" tooltiptext=\"bind:warehCd\"/><Cell col=\"1\" edittype=\"none\" text=\"bind:warehNm\" tooltiptext=\"bind:warehNm\"/><Cell col=\"2\" displaytype=\"date\" edittype=\"none\" text=\"bind:begday\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:begday\"/><Cell col=\"3\" displaytype=\"date\" edittype=\"none\" text=\"bind:endday\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:endday\"/><Cell col=\"4\" edittype=\"none\" text=\"bind:posCd\" tooltiptext=\"bind:posCd\"/><Cell col=\"5\" edittype=\"none\" text=\"bind:addr1\" tooltiptext=\"bind:addr1\"/><Cell col=\"6\" edittype=\"none\" text=\"bind:addr2\" tooltiptext=\"bind:addr2\"/><Cell col=\"7\" edittype=\"none\" text=\"bind:telNo\" tooltiptext=\"bind:telNo\"/><Cell col=\"8\" edittype=\"none\" text=\"bind:faxNo\" tooltiptext=\"bind:faxNo\"/><Cell col=\"9\" edittype=\"none\" text=\"bind:mobNo\" tooltiptext=\"bind:mobNo\"/><Cell col=\"10\" edittype=\"none\" text=\"bind:useYn\" tooltiptext=\"bind:useYn\"/></Band><Band id=\"summary\"><Cell text=\"총계\"/><Cell col=\"1\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"2\" style=\"align:right;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\" style=\"align:right;\"/><Cell col=\"6\" style=\"align:right;\"/><Cell col=\"7\" style=\"align:right;\"/><Cell col=\"8\" style=\"align:right;\"/><Cell col=\"9\" style=\"align:right;\"/><Cell col=\"10\" style=\"align:right;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "345", "1122", "31", null, null, this);
            obj.set_taborder("21");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_warehCd", "absolute", "155", "350", "130", "21", null, null, this);
            obj.set_taborder("4");
            obj.set_enable("false");
            obj.set_readonly("false");
            obj.set_inputtype("number,english");
            obj.set_imemode("alpha");
            this.addChild(obj.name, obj);

            obj = new Static("st_begday", "absolute", "360", "345", "150", "31", null, null, this);
            obj.set_taborder("32");
            obj.set_text("시작일자");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_useYn", "absolute", "721", "345", "150", "31", null, null, this);
            obj.set_taborder("33");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_warehCd", "absolute", "0", "345", "150", "31", null, null, this);
            obj.set_taborder("34");
            obj.set_text("창고코드");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "375", "1122", "31", null, null, this);
            obj.set_taborder("22");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_warehNm", "absolute", "155", "380", "200", "21", null, null, this);
            obj.set_taborder("8");
            obj.set_enable("true");
            obj.set_readonly("false");
            obj.set_imemode("hangul");
            this.addChild(obj.name, obj);

            obj = new Static("st_endday", "absolute", "360", "375", "150", "31", null, null, this);
            obj.set_taborder("36");
            obj.set_text("종료일자");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_regId", "absolute", "721", "375", "150", "31", null, null, this);
            obj.set_taborder("37");
            obj.set_text("등록자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_regId", "absolute", "876", "380", "240", "20", null, null, this);
            obj.set_taborder("10");
            obj.set_enable("false");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_warehNm", "absolute", "0", "375", "150", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_text("창고명");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_carNo03", "absolute", "0", "405", "150", "31", null, null, this);
            obj.set_taborder("39");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "405", "1122", "31", null, null, this);
            obj.set_taborder("23");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_posCd", "absolute", "155", "410", "200", "21", null, null, this);
            obj.set_taborder("11");
            obj.set_enable("false");
            obj.set_readonly("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_telNo", "absolute", "360", "405", "150", "31", null, null, this);
            obj.set_taborder("40");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_telNo", "absolute", "516", "410", "200", "20", null, null, this);
            obj.set_taborder("13");
            obj.set_enable("true");
            obj.set_readonly("false");
            obj.set_inputtype("number");
            this.addChild(obj.name, obj);

            obj = new Static("st_regDt", "absolute", "721", "405", "150", "31", null, null, this);
            obj.set_taborder("41");
            obj.set_text("등록일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_regDt", "absolute", "876", "410", "240", "20", null, null, this);
            obj.set_taborder("14");
            obj.set_enable("false");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd", "absolute", "0", "405", "150", "31", null, null, this);
            obj.set_taborder("42");
            obj.set_text("창고주소");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "360", "435", "762", "31", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "360", "465", "762", "31", null, null, this);
            obj.set_taborder("26");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_faxNo", "absolute", "360", "435", "150", "31", null, null, this);
            obj.set_taborder("45");
            obj.set_text("팩스번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_faxNo", "absolute", "516", "440", "200", "20", null, null, this);
            obj.set_taborder("16");
            obj.set_enable("true");
            obj.set_readonly("false");
            obj.set_inputtype("number");
            this.addChild(obj.name, obj);

            obj = new Static("st_chgId", "absolute", "721", "435", "150", "31", null, null, this);
            obj.set_taborder("46");
            obj.set_text("수정자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_chgId", "absolute", "876", "440", "240", "20", null, null, this);
            obj.set_taborder("17");
            obj.set_enable("false");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_mobNo", "absolute", "360", "465", "150", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_text("휴대폰번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mobNo", "absolute", "516", "470", "200", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_enable("true");
            obj.set_readonly("false");
            obj.set_inputtype("number");
            this.addChild(obj.name, obj);

            obj = new Static("st_chgDt", "absolute", "721", "465", "150", "31", null, null, this);
            obj.set_taborder("48");
            obj.set_text("수정일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_chgDt", "absolute", "876", "470", "240", "20", null, null, this);
            obj.set_taborder("20");
            obj.set_enable("false");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "0", "295", "1147", "20", null, null, this);
            obj.set_taborder("49");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_cancel", "absolute", "1035", "315", "41", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_text("취소");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_add", "absolute", "1081", "315", "41", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_text("추가");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "335", "1147", "10", null, null, this);
            obj.set_taborder("50");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("bt_posCd", "absolute", "334", "409", "20", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("btn_WF_edtSch");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("bt_warehCd", "absolute", "290", "350", "65", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_text("중복확인");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_begday", "absolute", "517", "350", "200", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("6");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("true");
            obj.set_readonly("false");

            obj = new Calendar("cal_endday", "absolute", "517", "380", "200", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("9");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");
            obj.set_readonly("false");

            obj = new Combo("cb_useYn", "absolute", "876", "350", "240", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("7");
            obj.set_autoselect("true");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_enable("true");
            obj.set_readonly("false");
            obj.set_index("0");

            obj = new Edit("ed_bldMngNo", "absolute", "160", "315", "200", "21", null, null, this);
            obj.set_taborder("51");
            obj.set_enable("false");
            obj.set_displaynulltext("우편번호 PK");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "0", "317", "169", "20", null, null, this);
            obj.set_taborder("52");
            obj.set_text("변경할 내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "435", "361", "61", null, null, this);
            obj.set_taborder("53");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_addr", "absolute", "0", "435", "150", "61", null, null, this);
            obj.set_taborder("54");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_addr1", "absolute", "155", "440", "200", "21", null, null, this);
            obj.set_taborder("55");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_addr2", "absolute", "155", "470", "200", "21", null, null, this);
            obj.set_taborder("56");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 45, this.div_search,
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
            		p.set_classname("RTCSWarehouseRegister");
            		p.set_titletext("창고등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_warehCd","value","ds_rtcs0200","warehCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_warehNm","value","ds_rtcs0200","warehNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_bldMngNo","value","ds_rtcs0200","bldMngNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_posCd","value","ds_rtcs0200","posCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","cal_begday","value","ds_rtcs0200","begday");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","cal_endday","value","ds_rtcs0200","endday");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","ed_telNo","value","ds_rtcs0200","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","ed_faxNo","value","ds_rtcs0200","faxNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","ed_mobNo","value","ds_rtcs0200","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","cb_useYn","value","ds_rtcs0200","useYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","ed_regId","value","ds_rtcs0200","regId");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","ed_regDt","value","ds_rtcs0200","regDt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","ed_chgId","value","ds_rtcs0200","chgId");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","ed_chgDt","value","ds_rtcs0200","chgDt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","ed_bldMngNo","value","ds_rtcs0200","bldMngNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_addr1","value","ds_rtcs0200","addr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_addr2","value","ds_rtcs0200","addr2");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSWarehouseRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSWarehouseRegister.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs"; 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 			= "RTCSWarehouseRegister";
        this.checkWarchCd 	= false;	//중복체크여부
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.toDay 			= "";		//현재날짜
        this.cntWarehCd 	= "";		//창고코드 중복체크
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "initRTCSWarehouseRegister" ){
        		var ct = this.ds_useYnSelect.getRowCount();
        		if( ct != 0 ){
        			this.div_search.cb_useYn.set_value("Y");
        		}
        	}
        	
        	if( strSvcId == "getToday" ){
        	
        	}
        	
        	if( strSvcId == "checkWarehCd" ){
        		if(this.cntWarehCd != '0') {
        			this.checkWarchCd = false;
        			alert('입력하신 창고코드 \'' + this.ed_warehCd.value + '\'는 존재하고 있습니다.'); 
        			this.ed_warehCd.set_value('');
        		}else{
        			this.checkWarchCd = true;
        			this.ed_warehCd.set_enable(false);
        			this.cal_begday.setFocus(true);
        			alert('사용가능한 창고코드 입니다.');
        		}
        	}
        	
        	if( strSvcId == "saveRTCSWarehouseRegister" ){
        		alert(strErrorMsg);
        		if( nErrorCode == "0" ){
        			this.fn_search();
        		}
        	}
        	
        	if( strSvcId == "selectRTCSWarehouseRegister" ){
        		var nRowCount = this.ds_rtcs0200.getRowCount();
        		if(nRowCount != 0){
        			this.ds_rtcs0200.set_updatecontrol(false);
        			for( var i = 0 ; i < nRowCount ; i++ ){
        				this.ds_rtcs0200.setColumn(i, "telNo",FN_numberHyphenInReturn(nvl(this.ds_rtcs0200.getColumn(i,"telNo"))));
        				this.ds_rtcs0200.setColumn(i, "faxNo",FN_numberHyphenInReturn(nvl(this.ds_rtcs0200.getColumn(i,"faxNo"))));
        				this.ds_rtcs0200.setColumn(i, "mobNo",FN_numberHyphenInReturn(nvl(this.ds_rtcs0200.getColumn(i,"mobNo"))));
        			}
        			this.ds_rtcs0200.set_updatecontrol(true);
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grid_rtcs0200.set_nodatatext("조회된 데이터가 없습니다.");
        			this.div_search.ed_warehCd.setFocus(true);
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCSWarehouseRegister_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.parent.setButton("E|C|S", this);
        	this.fn_init();
        	
        }
        this.fn_init = function(){
        	var sSvcID      	= "initRTCSWarehouseRegister";  
        	var sController   	= "rtms/cs/initRTCSWarehouseRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_useYn=mapDsUseYn ";
        	sOutDatasets += " ds_useYnSelect=mapDsUseYnSelect ";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        	var sSvcID      	= "getToday";  
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(){
        	
        	if( !this.FN_saveCheckRequired() ) {
        		return false;
        	}
        	
        	if( !this.FN_saveCheckChange() ) {
        		alert('변경된 데이터가 없습니다.');
        		return false;
        	}
        	
        	if( !this.FN_saveCheckChangeCount() ) {
        		alert('변경된 데이터가 1건 이상입니다.');
        		return false;
        	}
        	
        	var sSvcID        	= "saveRTCSWarehouseRegister";                    
        	var sController   	= "rtms/cs/saveRTCSWarehouseRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	sInDatasets   		= "input=ds_rtcs0200:U";
        	sOutDatasets  		= "";
        	var fn_callBack		= "fn_callBack";
        	
        	var nRow = this.ds_rtcs0200.rowposition;
        	var cnt = this.ds_rtcs0200.getRowCount();
        	for( var i = 0 ; i < cnt ; i++){
        		if( (this.ds_rtcs0200.getRowType(i) == 2) || (this.ds_rtcs0200.getRowType(i) == 4) ){
        			this.ds_rtcs0200.setColumn(i, "telNo",FN_numberHyphenOut(nvl(this.ds_rtcs0200.getColumn(i,"telNo"))));
        			this.ds_rtcs0200.setColumn(i, "faxNo",FN_numberHyphenOut(nvl(this.ds_rtcs0200.getColumn(i,"faxNo"))));
        			this.ds_rtcs0200.setColumn(i, "mobNo",FN_numberHyphenOut(nvl(this.ds_rtcs0200.getColumn(i,"mobNo"))));
        		}
        	}
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        this.FN_saveCheckRequired = function(){
        	var returnFlag = true;
        	var cnt = this.ds_rtcs0200.getRowCount();
        	var msg = " 값이 없습니다.";
        	for( var  i = 0 ; i < cnt ; i++ ){
        		if( (this.ds_rtcs0200.getRowType(i) == 2) || (this.ds_rtcs0200.getRowType(i) == 4) ){
        			var warehCd 	= nvl(this.ds_rtcs0200.getColumn(i,"warehCd"));
        			var begday		= nvl(this.ds_rtcs0200.getColumn(i,"begday"));
        			var useYn 		= nvl(this.ds_rtcs0200.getColumn(i,"useYn"));
        			var warehNm 	= nvl(this.ds_rtcs0200.getColumn(i,"warehNm"));
        			var endday 		= nvl(this.ds_rtcs0200.getColumn(i,"endday"));
        			var posCd 		= nvl(this.ds_rtcs0200.getColumn(i,"posCd"));
        			var addr1 		= nvl(this.ds_rtcs0200.getColumn(i,"addr1"));
        			var addr2 		= nvl(this.ds_rtcs0200.getColumn(i,"addr2"));
        			var bldMngNo 	= nvl(this.ds_rtcs0200.getColumn(i,"bldMngNo"));
        			var telNo 		= nvl(this.ds_rtcs0200.getColumn(i,"telNo"));
        			if( warehCd == "" ){ 	alert( "창고코드" + msg); 		this.ds_rtcs0200.set_rowposition(i); this.ed_warehCd.setFocus(true); 	returnFlag = false; break;}
        			if( begday == "" ){ 	alert( "시작일자" + msg); 		this.ds_rtcs0200.set_rowposition(i); this.cal_begday.setFocus(true); 	returnFlag = false; break;}
        			if( useYn == "" ){ 		alert( "사용여부" + msg); 		this.ds_rtcs0200.set_rowposition(i); this.cb_useYn.setFocus(true);	 	returnFlag = false; break;}
        			if( warehNm == "" ){ 	alert( "창고명" + msg); 		this.ds_rtcs0200.set_rowposition(i); this.ed_warehNm.setFocus(true); 	returnFlag = false; break;}
        			if( endday == "" ){ 	alert( "종료일자" + msg ); 	this.ds_rtcs0200.set_rowposition(i); this.cal_endday.setFocus(true); 	returnFlag = false; break;}
        			if( posCd == "" ){ 		alert( "우편번호" + msg ); 	this.ds_rtcs0200.set_rowposition(i); this.bt_posCd.setFocus(true);	  	returnFlag = false; break;}
        			if( addr1 == "" ){ 		alert( "주소"  + msg ); 		this.ds_rtcs0200.set_rowposition(i); this.bt_posCd.setFocus(true);	 	returnFlag = false; break;}
        			if( addr2 == "" ){ 		alert( "상세주소"  + msg ); 	this.ds_rtcs0200.set_rowposition(i); this.ed_addr2.setFocus(true);	 	returnFlag = false; break;}
        			//if( bldMngNo == "" ){ 	alert( "우편번호 PK" + msg ); 	this.ds_rtcs0200.set_rowposition(i); this.bt_posCd.setFocus(true);	 	returnFlag = false; break;}
        			if( telNo == "" ){ 		alert( "전화번호"  + msg ); 	this.ds_rtcs0200.set_rowposition(i); this.ed_telNo.setFocus(true);	 	returnFlag = false; break;}
        			//if( warehCd.length < 5 = "" ){ 		alert( "창고코드길이는 5자리 이상입니다."); this.ed_warehCd.setFocus(true);  return false; }
        		}

        	}
        	if( (returnFlag == true) && (this.checkWarchCd == false) ){
        		for( var  i = 0 ; i < cnt ; i++ ){
        			if( this.ds_rtcs0200.getRowType(i) == 2 ){
        				alert("창고코드 중복체크를 해주세요.");
        				this.ds_rtcs0200.set_rowposition(i);
        				this.bt_warehCd.setFocus(true);
        				returnFlag = false;
        			}
        		}
        	}
        	return returnFlag;
        }
        this.FN_saveCheckChange = function(){
        	var returnFlag = true;
        	var cnt = this.ds_rtcs0200.getRowCount();
        	for( var  i = 0 ; i < cnt ; i++ ){
        		if( (this.ds_rtcs0200.getRowType(i) == 2) || (this.ds_rtcs0200.getRowType(i) == 4) ){
        			returnFlag = true;
        			break;
        		}else{
        			returnFlag = false;
        		}
        	}
        	return returnFlag;
        }
        this.FN_saveCheckChangeCount = function(){
        	var returnFlag = true;
        	var changeCount = 0;
        	var cnt = this.ds_rtcs0200.getRowCount();
        	for( var i = 0 ; i < cnt ; i++ ){
        		if( (this.ds_rtcs0200.getRowType(i) == 2) || (this.ds_rtcs0200.getRowType(i) == 4) ){
        			changeCount++;
        		}
        	}
        	if( changeCount == 1 ){
        		returnFlag = true;
        	}else{
        		returnFlag = false;
        	}
        	return returnFlag;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel = function(){
        	Ex.core.exportExcel(this, this.grid_rtcs0200);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	var warehCd = nvl(this.div_search.ed_warehCd.value);
        	var telNo 	= nvl(FN_numberHyphenOut(nvl(this.div_search.ed_telNo.value)));
        	var useYn 	= nvl(this.div_search.cb_useYn.value);
        	
        	var sSvcID        	= "selectRTCSWarehouseRegister";                    
        	var sController   	= "rtms/cs/selectRTCSWarehouseRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_rtcs0200=mapRtcs0200";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("warehCd", warehCd);
        	sArgs += Ex.util.setParam("telNo", telNo);
        	sArgs += Ex.util.setParam("useYn", useYn);
        	this.ds_rtcs0200.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_wareh_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"창고 조회","comm::RTCOMMWarehouse_pop.xfdl",args, "modaless=false");
        }
        this.returnWarehCd = function(res ){
        	this.div_search.ed_warehCd.set_value( res[0] );
        	this.div_search.ed_warehNm.set_value( res[1] );
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_cancel_onclick = function(obj,e){
        	var delRow = -1;
        	var cnt = this.ds_rtcs0200.getRowCount();
        	for( var i = 0 ; i < cnt ; i++ ){
        		if( this.ds_rtcs0200.getRowType(i) == 2 ){
        			delRow = i;
        		}else{
        			delRow = -1
        		}
        	}
        	
        	if( delRow != -1 ){
        		this.ds_rtcs0200.deleteRow(delRow);
        		this.bt_warehCd.set_enable(false);
        	}else{
        		alert("취소할 행이 없습니다.");
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_add_onclick = function(obj,e){
        	if( this.FN_addRow() ){
        		this.FN_addValue();
        	}
        }
        this.FN_addRow = function(){
        	var addRowFlag = false;
        	var cnt = this.ds_rtcs0200.getRowCount();
        	if( cnt == 0 ){
        		addRowFlag = true;
        	}else{		
        		for( var  i = 0 ; i < cnt ; i++ ){
        			if( this.ds_rtcs0200.getRowType(i) == 2 || this.ds_rtcs0200.getRowType(i) == 4){
        				alert("추가,수정된 행이 있으므로 추가하실 수 없습니다.\n저장 후 다시 작업하세요.");
        				this.ds_rtcs0200.set_rowposition(i);
        				addRowFlag = false;
        				break;
        			}else{
        				addRowFlag = true;
        			}
        		}
        	}
        	return addRowFlag;
        }
        this.FN_addValue = function(){
        	this.ds_rtcs0200.addRow();
        	this.cal_begday.set_value(this.toDay);
        	this.cal_endday.set_value("99991231");
        	this.cb_useYn.set_value("Y");
        	this.bt_warehCd.setFocus(true);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.bt_warehCd_onclick = function(obj,e){
        	if(nvl(this.ed_warehCd.value) == "") {
        		alert("창고코드를  입력해주십시오.");
        		this.ed_warehCd.setFocus(true);
        		return;
        	}
        	var sSvcID        	= "checkWarehCd";                    
        	var sController   	= "rtms/cs/checkWarehCd.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	sArgs += Ex.util.setParam("warehCd",this.ed_warehCd.value);
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.bt_posCd_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"우편번호 조회","comm::RTCOMMPostCode_pop.xfdl",args, "modaless=false");
        }
        this.FN_postCd = function(res ){
        	this.ed_posCd.set_value( res[0] );
        	this.ed_addr1.set_value( res[1] );
        	this.ed_addr2.set_value( res[2] );
        	this.ed_bldMngNo.set_value( res[3] );
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_rtcs0200_onselectchanged = function(obj,e){
        	if( this.ds_rtcs0200.getRowType( this.ds_rtcs0200.rowposition ) == 2 ){
        		this.bt_warehCd.set_enable(true);
        		this.ed_warehCd.set_enable(true);
        		this.cb_useYn.set_enable(false);
        	}else{
        		this.bt_warehCd.set_enable(false);
        		this.ed_warehCd.set_enable(false);
        		this.cb_useYn.set_enable(true);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_rtcs0200_oncelldblclick = function(obj,e){
        	var args = {p_arg : this.p_arg, warehCd : this.ds_rtcs0200.getColumn( this.ds_rtcs0200.rowposition, "warehCd" )};
        	Ex.core.popup(this,"창고변경이력","comm::RTCOMMWarehouseUpdateList_pop.xfdl",args, "modaless=false");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_warehCd_onkeyup = function(obj,e){
        	if(e.keycode == 13){
        		this.fn_search();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_telNo_onkeyup = function(obj,e){
        	if(e.keycode == 13){
        		this.fn_search();
        	}else{
        		FN_numberHyphenIn(obj, e);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.ed_telNo_onkeyup = function(obj,e){
        	FN_numberHyphenIn(obj, e);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.ed_faxNo_onkeyup = function(obj,e){
        	FN_numberHyphenIn(obj, e);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.ed_mobNo_onkeyup = function(obj,e){
        	FN_numberHyphenIn(obj, e);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.cal_begday_onchanged = function(obj,e){
        	var thisValue =  obj.value;
        	var firstDate =  Eco.date.getFirstDate(this.toDay);
        	var lastDay   =  this.toDay.substr(0,4)+this.toDay.substr(4,2)+Eco.date.getLastDayOfMonth(this.toDay);
        	
        	if( !(( firstDate <= thisValue ) && (thisValue <= lastDay)) ){
        		alert("시작일자는 "+firstDate+" ~ "+lastDay+" 선택가능합니다.");
        		obj.set_value(this.toDay);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_warehCd_onchanged = function(obj,e){
        	this.div_search.ed_warehNm.set_value("");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCSWarehouseRegister_onload, this);
            this.div_search.ed_warehCd.addEventHandler("onkeyup", this.div_search_ed_warehCd_onkeyup, this);
            this.div_search.ed_warehCd.addEventHandler("onchanged", this.div_search_ed_warehCd_onchanged, this);
            this.div_search.bt_wareh.addEventHandler("onclick", this.div_search_bt_wareh_onclick, this);
            this.div_search.ed_telNo.addEventHandler("onkeyup", this.div_search_ed_telNo_onkeyup, this);
            this.div_search.cb_useYn.addEventHandler("onitemchanged", this.div_search_cb_makerSearch_onitemchanged, this);
            this.grid_rtcs0200.addEventHandler("onselectchanged", this.grid_rtcs0200_onselectchanged, this);
            this.grid_rtcs0200.addEventHandler("oncelldblclick", this.grid_rtcs0200_oncelldblclick, this);
            this.ed_telNo.addEventHandler("onkeyup", this.ed_telNo_onkeyup, this);
            this.ed_faxNo.addEventHandler("onkeyup", this.ed_faxNo_onkeyup, this);
            this.ed_mobNo.addEventHandler("onkeyup", this.ed_mobNo_onkeyup, this);
            this.btn_cancel.addEventHandler("onclick", this.btn_cancel_onclick, this);
            this.btn_add.addEventHandler("onclick", this.btn_add_onclick, this);
            this.bt_posCd.addEventHandler("onclick", this.bt_posCd_onclick, this);
            this.bt_warehCd.addEventHandler("onclick", this.bt_warehCd_onclick, this);
            this.cal_begday.addEventHandler("onchanged", this.cal_begday_onchanged, this);
            this.cb_useYn.addEventHandler("onitemchanged", this.div_search_cb_makerSearch_onitemchanged, this);

        };

        this.loadIncludeScript("RTCSWarehouseRegister.xfdl");

       
    };
}
)();

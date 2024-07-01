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
                this.set_name("RTSDProvisionalContractRegister");
                this.set_classname("RTSDProvisionalContractRegister");
                this.set_titletext("가계약등록");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_provsnList", this);
            obj._setContents("<ColumnInfo><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"provsnTp\" type=\"STRING\" size=\"256\"/><Column id=\"provsnDay\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/><Column id=\"specNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"patternNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"STRING\" size=\"256\"/><Column id=\"period\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"provsnSt\" type=\"STRING\" size=\"256\"/><Column id=\"provsnStDtl\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"hshopTp\" type=\"STRING\" size=\"256\"/><Column id=\"hshopOrdno\" type=\"STRING\" size=\"256\"/><Column id=\"airDay\" type=\"STRING\" size=\"256\"/><Column id=\"airTm\" type=\"STRING\" size=\"256\"/><Column id=\"contactGet\" type=\"STRING\" size=\"256\"/><Column id=\"contactCnt\" type=\"STRING\" size=\"256\"/><Column id=\"custReq\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_excelUp", this);
            obj._setContents("<ColumnInfo><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/><Column id=\"specNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"patternNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"STRING\" size=\"256\"/><Column id=\"period\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"contactGet\" type=\"STRING\" size=\"256\"/><Column id=\"custReq\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_user", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"tmpPwYn\" type=\"string\" size=\"32\"/><Column id=\"lastPwDt\" type=\"datetime\" size=\"17\"/><Column id=\"agentNm\" type=\"string\" size=\"32\"/><Column id=\"failCnt\" type=\"bigdecimal\" size=\"16\"/><Column id=\"userGrpNm\" type=\"string\" size=\"32\"/><Column id=\"agentId\" type=\"string\" size=\"32\"/><Column id=\"oldPassword\" type=\"string\" size=\"32\"/><Column id=\"chgId\" type=\"string\" size=\"32\"/><Column id=\"password\" type=\"string\" size=\"32\"/><Column id=\"userGrp\" type=\"string\" size=\"32\"/><Column id=\"userNm\" type=\"string\" size=\"32\"/><Column id=\"vkgrpNm\" type=\"string\" size=\"32\"/><Column id=\"lastLogonDt\" type=\"datetime\" size=\"17\"/><Column id=\"userId\" type=\"string\" size=\"32\"/><Column id=\"chgDt\" type=\"datetime\" size=\"17\"/><Column id=\"vkbur\" type=\"string\" size=\"32\"/><Column id=\"regDt\" type=\"datetime\" size=\"17\"/><Column id=\"regId\" type=\"string\" size=\"32\"/><Column id=\"lockYn\" type=\"string\" size=\"32\"/><Column id=\"vkburNm\" type=\"string\" size=\"32\"/><Column id=\"vkgrp\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("0");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "486", null, null, this);
            obj.set_taborder("19");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("20");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "75", "120", "21", null, null, this);
            obj.set_taborder("21");
            obj.set_text("가계약목록");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "95", "1122", "10", null, null, this);
            obj.set_taborder("22");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_provsnList", "absolute", "9", "104", "1113", "225", null, null, this);
            obj.set_taborder("18");
            obj.set_autofittype("none");
            obj.set_scrollbars("autoboth");
            obj.set_binddataset("ds_provsnList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"105\"/><Column size=\"65\"/><Column size=\"93\"/><Column size=\"178\"/><Column size=\"88\"/><Column size=\"81\"/><Column size=\"72\"/><Column size=\"101\"/><Column size=\"36\"/><Column size=\"33\"/><Column size=\"56\"/><Column size=\"58\"/><Column size=\"82\"/><Column size=\"96\"/><Column size=\"189\"/><Column size=\"172\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"판매처\"/><Cell col=\"1\" text=\"고객명\"/><Cell col=\"2\" text=\"연락처\"/><Cell col=\"3\" text=\"주소\"/><Cell col=\"4\" text=\"차종\"/><Cell col=\"5\" text=\"타이어규격\"/><Cell col=\"6\" displaytype=\"normal\" text=\"차량번호\"/><Cell col=\"7\" text=\"패턴\"/><Cell col=\"8\" text=\"개수\"/><Cell col=\"9\" text=\"기간\"/><Cell col=\"10\" text=\"등록비\"/><Cell col=\"11\" text=\"월렌탈료\"/><Cell col=\"12\" text=\"장착희망일\"/><Cell col=\"13\" text=\"e-mail\"/><Cell col=\"14\" text=\"연락처수집방법\"/><Cell col=\"15\" text=\"고객요청사항\"/></Band><Band id=\"body\"><Cell displaytype=\"combo\" text=\"bind:hshopTp\" combodataset=\"ds_user\" combocodecol=\"userId\" combodatacol=\"userNm\"/><Cell col=\"1\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:custNm\"/><Cell col=\"2\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:mobNo\"/><Cell col=\"3\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:addr\"/><Cell col=\"4\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:mcNm\"/><Cell col=\"5\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:specNm\" combodataset=\"ds_R051\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"6\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:carNo\"/><Cell col=\"7\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:patternNm\"/><Cell col=\"8\" displaytype=\"normal\" style=\"align:right;\" text=\"bind:cnt\"/><Cell col=\"9\" displaytype=\"normal\" style=\"align:right;\" text=\"bind:period\" combodataset=\"ds_reltCd\" combocodecol=\"cd\" combodatacol=\"nm\" combodisplay=\"edit\"/><Cell col=\"10\" displaytype=\"number\" style=\"align:right;\" text=\"bind:regiAmt\"/><Cell col=\"11\" displaytype=\"number\" style=\"align:right;\" text=\"bind:rentAmt\"/><Cell col=\"12\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:planDay\"/><Cell col=\"13\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:emailAddr\"/><Cell col=\"14\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:contactGet\"/><Cell col=\"15\" text=\"bind:custReq\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" text=\"총계\"/><Cell col=\"2\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"3\" style=\"align:right;\"/><Cell col=\"4\" style=\"align:right;\"/><Cell col=\"5\"/><Cell col=\"6\" displaytype=\"normal\" style=\"align:right;\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "328", null, "15", "0", null, this);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "10", "375", "1113", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNo", "absolute", "10", "375", "125", "31", null, null, this);
            obj.set_taborder("25");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNo", "absolute", "140", "380", "142", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_readonly("false");
            obj.set_maxlength("50");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm", "absolute", "287", "375", "125", "31", null, null, this);
            obj.set_taborder("26");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "10", "405", "1113", "31", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_patternNm", "absolute", "971", "410", "142", "21", null, null, this);
            obj.set_taborder("9");
            obj.set_readonly("false");
            obj.set_maxlength("100");
            this.addChild(obj.name, obj);

            obj = new Static("st_statNm", "absolute", "841", "405", "125", "31", null, null, this);
            obj.set_taborder("28");
            obj.set_text("패턴");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carNo", "absolute", "694", "410", "142", "21", null, null, this);
            obj.set_taborder("8");
            obj.set_readonly("false");
            obj.set_maxlength("8");
            this.addChild(obj.name, obj);

            obj = new Static("st_saleNm", "absolute", "564", "405", "125", "31", null, null, this);
            obj.set_taborder("29");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_specNm", "absolute", "417", "410", "142", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_readonly("false");
            obj.set_maxlength("20");
            this.addChild(obj.name, obj);

            obj = new Static("st_chanNm", "absolute", "287", "405", "125", "31", null, null, this);
            obj.set_taborder("30");
            obj.set_text("타이어규격");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mcNm", "absolute", "140", "410", "142", "21", null, null, this);
            obj.set_taborder("6");
            obj.set_readonly("false");
            obj.set_maxlength("50");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNm", "absolute", "10", "405", "125", "31", null, null, this);
            obj.set_taborder("31");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "10", "435", "1113", "31", null, null, this);
            obj.set_taborder("32");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_cancDay", "absolute", "433", "435", "82", "31", null, null, this);
            obj.set_taborder("33");
            obj.set_text("월렌탈료");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_procDay", "absolute", "269", "435", "82", "31", null, null, this);
            obj.set_taborder("34");
            obj.set_text("렌탈등록비");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_planDay", "absolute", "139", "435", "82", "31", null, null, this);
            obj.set_taborder("35");
            obj.set_text("계약기간");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordDay", "absolute", "10", "435", "82", "31", null, null, this);
            obj.style.set_align("center middle");
            obj.set_taborder("36");
            obj.set_text("타이어개수");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "10", "465", "1113", "31", null, null, this);
            obj.set_taborder("37");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_period", "absolute", "226", "440", "38", "21", null, null, this);
            obj.set_taborder("11");
            obj.set_readonly("false");
            obj.set_inputtype("number");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_regiAmt", "absolute", "356", "440", "72", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_readonly("false");
            obj.set_inputtype("number");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordQty", "absolute", "564", "465", "125", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_text("연락처수집방법");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_emailAddr", "absolute", "417", "470", "142", "21", null, null, this);
            obj.set_taborder("16");
            obj.set_readonly("false");
            obj.set_maxlength("100");
            this.addChild(obj.name, obj);

            obj = new Static("st_matNm", "absolute", "287", "465", "125", "31", null, null, this);
            obj.set_taborder("39");
            obj.set_text("e-mail");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_matCd", "absolute", "10", "465", "125", "31", null, null, this);
            obj.set_taborder("40");
            obj.set_text("장착희망일");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_rentAmt", "absolute", "520", "440", "72", "21", null, null, this);
            obj.set_taborder("13");
            obj.set_readonly("false");
            obj.set_inputtype("number");
            this.addChild(obj.name, obj);

            obj = new Static("cust_birth_title", "absolute", "564", "375", "125", "31", null, null, this);
            obj.set_taborder("41");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_addr", "absolute", "694", "380", "419", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_readonly("false");
            obj.set_maxlength("200");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_contactGet", "absolute", "694", "470", "419", "21", null, null, this);
            obj.set_taborder("17");
            obj.set_readonly("false");
            obj.set_maxlength("200");
            this.addChild(obj.name, obj);

            obj = new Static("st_contractInfo", "absolute", "10", "349", "80", "21", null, null, this);
            obj.set_taborder("42");
            obj.set_text("가계약정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_cnt", "absolute", "97", "440", "38", "21", null, null, this);
            obj.set_taborder("10");
            obj.set_readonly("false");
            obj.set_inputtype("number");
            this.addChild(obj.name, obj);

            obj = new Button("btn_new", "absolute", "1027", "343", "45", "22", null, null, this);
            obj.set_taborder("1");
            obj.set_text("신규");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_del", "absolute", "1077", "343", "45", "22", null, null, this);
            obj.set_taborder("2");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "365", "1147", "10", null, null, this);
            obj.set_taborder("43");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_planDay", "absolute", "140", "470", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("15");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Div("div_search", "absolute", "9", "10", "1113", "45", null, null, this);
            obj.set_taborder("44");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "273", "12", "108", "21", null, null, this.div_search);
            obj.set_taborder("94");
            obj.set_text("업로드 엑셀파일");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("95");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "33", "1118", "12", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_fileChoice", "absolute", "404", "12", "100", "21", null, null, this.div_search);
            obj.set_taborder("98");
            obj.set_text("파일선택");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "384", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("99");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm00", "absolute", "29", "12", "52", "21", null, null, this.div_search);
            obj.set_taborder("100");
            obj.set_text("판매처");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_condSaleId", "absolute", "108", "12", "141", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("101");
            obj.set_innerdataset("@ds_user");
            obj.set_codecolumn("userId");
            obj.set_datacolumn("userNm");
            obj.set_displayrowcount("6");
            obj = new Static("Static01", "absolute", "88", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("102");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "249", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("103");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "55", "1122", "20", null, null, this);
            obj.set_taborder("45");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordQty00", "absolute", "597", "435", "92", "31", null, null, this);
            obj.set_taborder("46");
            obj.set_text("고객요청사항");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_align("center middle");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custReq", "absolute", "694", "440", "419", "21", null, null, this);
            obj.set_taborder("14");
            obj.set_maxlength("200");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_mobNo", "absolute", "418", "380", "141", "21", null, null, this);
            obj.set_taborder("4");
            obj.set_type("string");
            obj.set_mask("###-####-####");
            obj.set_enable("true");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1113, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("44");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDProvisionalContractRegister");
            		p.set_titletext("가계약등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_custNo","value","ds_provsnList","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_patternNm","value","ds_provsnList","patternNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_carNo","value","ds_provsnList","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_specNm","value","ds_provsnList","specNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_mcNm","value","ds_provsnList","mcNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","ed_period","value","ds_provsnList","period");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","ed_regiAmt","value","ds_provsnList","regiAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","ed_emailAddr","value","ds_provsnList","emailAddr");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","ed_rentAmt","value","ds_provsnList","rentAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","ed_addr","value","ds_provsnList","addr");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item26","ed_contactGet","value","ds_provsnList","contactGet");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_cnt","value","ds_provsnList","cnt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","cal_planDay","value","ds_provsnList","planDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","ed_custReq","value","ds_provsnList","custReq");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item32","ed_mobNo","value","ds_provsnList","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDProvisionalContractRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDProvisionalContractRegister.xfdl", function() {
        //include "lib::comLib.xjs"; 

        // 상수 선언
        this.PROVSN_TP = "B";										// 가계약구분 (B:방판주문, H:홈쇼핑주문)
        this.USER_GRP  = "09";										// 사용자그룹 (09:방판)
        this.SK_ENCAR  = "412622";									// SK엔카 방판 사용자 ID

        // 전역변수 선언
        this.url = application.services["svcurl"].url+"XImport";	// 엑셀 import용 URL
        this.fUserId  = "";											// 현재 로그인 사용자의 ID
        this.fUserGrp = "";											// 현재 로그인 사용자의 사용자그룹

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDProvisionalContractRegister_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.parent.setButton("C", this);
        	// 판매처 조회
        	this.fn_getSaleInfo();
        	// 사용자그룹 설정 
        	this.fUserId  = application.gds_userInfo.getColumn(0, "userId" );
        	this.fUserGrp = application.gds_userInfo.getColumn(0, "userGrp");
        }

        /**
         * 판매처 조회
         */ 
        this.fn_getSaleInfo = function() {
        	var sSvcID      	= "getSaleInfo";  
        	var sController   	= "listUserInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_user=listUser";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("userGrp", this.USER_GRP);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }	

        /**
         * 저장 버튼의 클릭 이벤트 처리
         */
        this.fn_save = function() {
        	this.rowCnt = this.ds_provsnList.getRowCount();
        	
        	for (var i=0; i < this.rowCnt; i++) {
        		var nRow = i+1;
        		
        		if (this.ds_provsnList.getColumn(i, "hshopTp") == this.SK_ENCAR) {
        			if (nvl(this.ds_provsnList.getColumn(i, "contactGet")) == "") {
        				this.alert(nRow + "행 : 지점명과 판매사원명을 정확히 기재하지 않을 경우 프로모션 및 PI지급이 제한될 수 있습니다.");
        				return false;
        			}
        		}
        				
        	    if(nvl(this.ds_provsnList.getColumn(i, "custNm")) == ""){
        			this.alert(nRow + "행 : 고객명이 누락되었습니다.");
        			return false;
        	    }
        	    
        	    if(nvl(this.ds_provsnList.getColumn(i, "mobNo")) == ""){
        			this.alert(nRow + "행 : 휴대폰 번호가 누락되었습니다.");
        			return false;
        	    }
        	    
        	    if(nvl(this.ds_provsnList.getColumn(i, "contactGet")) == ""){
        			this.alert(nRow + "행 : 연락처 수집방법이 누락되었습니다.");
        			return false;
        	    }
        	}
        	
        	if (this.rowCnt > 0) {
        		if (confirm( "저장하시겠습니까?")) {
        			var sSvcID        	= "saveProvsn";                    
        			var sController   	= "rtms/sd/saveProvisionalContract.do";
        			var sInDatasets   	= "ds_provsnList=ds_provsnList:U";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	} else {
        		this.alert("저장할 건이 없습니다.");
        		return false;
        	}
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		case "getSaleInfo":			
        			if (this.fUserGrp == "09") {
        				this.div_search.cmb_condSaleId.set_value(this.fUserId);
        				this.div_search.cmb_condSaleId.set_enable(false);
        			} else if (this.fUserGrp == "01" || this.fUserGrp == "02") {
        				this.div_search.cmb_condSaleId.set_enable(true);
        			} else {
        				this.div_search.cmb_condSaleId.set_enable(false);
        			}
        			
        			break;
        			
        		case "saveProvsn":
        			alert(strErrorMsg);
        			this.reload();		     
        			break;
        			
        		default:
        			break;
        	}
        }

        /**
         * 신규 버튼의 클릭 이벤트 처리
         */
        this.btn_new_onclick = function(obj,e) {
        	var saleId = nvl(this.div_search.cmb_condSaleId.value);
        	if (saleId == "") {
        		this.alert("판매처를 선택해야 합니다.");
        		return false;
        	}
        	
        	this.div_search.cmb_condSaleId.set_enable(false);
        	
        	var idx = this.ds_provsnList.addRow();
        	this.ds_provsnList.setColumn(idx, "provsnTp", this.PROVSN_TP);
        	this.ds_provsnList.setColumn(idx, "hshopTp" , saleId);
        	
        	if (saleId == this.SK_ENCAR) {
        		this.ed_contactGet.set_displaynulltext("지점명 / 판매사원명");
        	}
        }

        /**
         * 삭제 버튼의 클릭 이벤트 처리
         */
        this.btn_del_onclick = function(obj,e) {	
        	this.ds_provsnList.deleteRow(this.grid_provsnList.currentrow);
        }

        /**
         * 파일선택 버튼의 클릭 이벤트 처리
         */
        this.div_search_btn_fileChoice_onclick = function(obj,e) {
        	if (nvl(this.div_search.cmb_condSaleId.value) == "") {
        		this.alert("판매처를 선택해야 합니다.");
        		return false;
        	}
        	
        	this.ds_excelUp.clear();
        	
        	this.importObj = new nexacro.ExcelImportObject("Import01",this);
        	this.importObj.addEventHandler("onsuccess", this.Import01_onsuccess, this);
        	this.importObj.addEventHandler("onerror", this.Import01_onerror, this);
        	this.importObj.set_importurl(this.url);
        	this.importObj.importData("", "Sheet1!A1:O", "ds_excelUp");
        	this.importObj.parent.addChild("Import01",this.importObj);
        	this.importObj = null;
        }

        /**
         * 엑셀업로드 성공 시 처리
         */
        this.Import01_onsuccess = function(obj,e) {
        	// 업로드 데이터 검증로직 추가예정
        	if (this.fn_chkUpDataset()) {
        		// 엑셀업로드 데이터셋을 가계약목록 데이터셋으로 복사
        		if (this.fn_copyUpDataset()) {
        			this.alert("엑셀업로드 완료!");
        		} else {
        			this.alert("업로드 데이터 복사 실패!");
        		}
        	}
        }

        /**
         * 엑셀업로드 실패 시 처리
         */
        this.Import01_onerror = function(obj,e) {
        	this.alert("엑셀업로드 실패!");
        }

        /**
         * 엑셀업로드 데이터셋 유효성 검사
         */
        this.fn_chkUpDataset = function () {
        	for (var i=0; i < this.ds_excelUp.getRowCount(); i++) {
        		var nRow        = i+1;
        		/*
        		var vCustNm     = this.ds_excelUp.getColumn(i, "custNm"    ); // 고객명
        		var vMobNo      = this.ds_excelUp.getColumn(i, "mobNo"     ); // 연락처
        		var vSpecNm     = this.ds_excelUp.getColumn(i, "specNm"    ); // 타이어규격
        		var vContactGet = this.ds_excelUp.getColumn(i, "contactGet"); // 연락처수집방법
        		*/
        		var vCustNm     = this.ds_excelUp.getColumn(i, 0);	// 고객명
        		var vMobNo      = this.ds_excelUp.getColumn(i, 1);	// 연락처
        		var vSpecNm     = this.ds_excelUp.getColumn(i, 4);	// 타이어규격
        		var vContactGet = this.ds_excelUp.getColumn(i, 13);	// 연락처수집방법

        		if (nvl(vCustNm) == "") {
        			this.alert(nRow + "번째 행의 고객명이 누락되었습니다.");
        			return false;
        		} else if (nvl(vMobNo) == "") {
        			this.alert(nRow + "번째 행의 연락처가 누락되었습니다.");
        			return false;
        		} else if (nvl(vSpecNm) == "") {
        			//this.alert(nRow + "번째 행의 타이어규격이 누락되었습니다.");
        			//return false;
        		} else if (nvl(vContactGet) == "") {
        			this.alert(nRow + "번째 행의 연락처수집방법이 누락되었습니다.");
        			return false;
        		}
        	}
        	
        	return true;
        }

        /**
         * 엑셀업로드 데이터셋을 가계약목록 데이터셋으로 복사
         */
        this.fn_copyUpDataset = function () {
        	for (var i=0; i < this.ds_excelUp.getRowCount(); i++) {
        		var idxAddRow     = this.ds_provsnList.addRow();	
        		/* 엑셀파일 업로드 시 헤더명이 바뀔 수 있음을 고려하여 copyRow 미사용 */
        		//var bSuccCopyRow  = this.ds_provsnList.copyRow(idxAddRow, this.ds_excelUp, i, strColInfo);
        		this.ds_provsnList.setColumn(idxAddRow, "provsnTp"  , this.PROVSN_TP);
        		this.ds_provsnList.setColumn(idxAddRow, "hshopTp"   , this.div_search.cmb_condSaleId.value);
        		this.ds_provsnList.setColumn(idxAddRow, "custNm"    , this.ds_excelUp.getColumn(i, 0));
        		this.ds_provsnList.setColumn(idxAddRow, "mobNo"     , this.ds_excelUp.getColumn(i, 1));
        		this.ds_provsnList.setColumn(idxAddRow, "addr"      , this.ds_excelUp.getColumn(i, 2));
        		this.ds_provsnList.setColumn(idxAddRow, "mcNm"      , this.ds_excelUp.getColumn(i, 3));
        		this.ds_provsnList.setColumn(idxAddRow, "specNm"    , this.ds_excelUp.getColumn(i, 4));
        		this.ds_provsnList.setColumn(idxAddRow, "carNo"     , this.ds_excelUp.getColumn(i, 5));
        		this.ds_provsnList.setColumn(idxAddRow, "patternNm" , this.ds_excelUp.getColumn(i, 6));
        		this.ds_provsnList.setColumn(idxAddRow, "cnt"       , this.ds_excelUp.getColumn(i, 7));
        		this.ds_provsnList.setColumn(idxAddRow, "period"    , this.ds_excelUp.getColumn(i, 8));
        		this.ds_provsnList.setColumn(idxAddRow, "regiAmt"   , this.ds_excelUp.getColumn(i, 9));
        		this.ds_provsnList.setColumn(idxAddRow, "rentAmt"   , this.ds_excelUp.getColumn(i, 10));
        		this.ds_provsnList.setColumn(idxAddRow, "planDay"   , this.ds_excelUp.getColumn(i, 11));
        		this.ds_provsnList.setColumn(idxAddRow, "emailAddr" , this.ds_excelUp.getColumn(i, 12));
        		this.ds_provsnList.setColumn(idxAddRow, "contactGet", this.ds_excelUp.getColumn(i, 13));
        		this.ds_provsnList.setColumn(idxAddRow, "custReq"   , this.ds_excelUp.getColumn(i, 14));		
        		/*
        		if (!bSuccCopyRow) {
        			return false;
        		}
        		*/
        	}
        	
        	return true;
        }

        /**
         * 연락처수집방법 포커스아웃 이벤트 처리
         */
        this.ed_contactGet_canchange = function(obj,e) {
        	var saleId = nvl(this.div_search.cmb_condSaleId.value);
        	
        	// SK엔카의 경우 연락처 수집방법에 PI지급을 위해 지점명과 판매사원명을 명기해야 함
        	if (saleId == this.SK_ENCAR && nvl(e.posttext) == "") {
        		this.alert("지점명과 판매사원명을 정확히 기재하지 않을 경우 프로모션 및 PI지급이 제한될 수 있습니다.");
        		this.ed_contactGet.set_value(null);		
        	}	
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_user.addEventHandler("onrowposchanged", this.checkSaveMode, this);
            this.addEventHandler("onload", this.RTSDProvisionalContractRegister_onload, this);
            this.grid_provsnList.addEventHandler("oncellclick", this.grid_closeList_oncellclick, this);
            this.ed_contactGet.addEventHandler("canchange", this.ed_contactGet_canchange, this);
            this.btn_new.addEventHandler("onclick", this.btn_new_onclick, this);
            this.btn_del.addEventHandler("onclick", this.btn_del_onclick, this);
            this.div_search.btn_fileChoice.addEventHandler("onclick", this.div_search_btn_fileChoice_onclick, this);
            this.div_search.cmb_condSaleId.addEventHandler("onitemchanged", this.div_search_cmb_condProvsnSt_onitemchanged, this);

        };

        this.loadIncludeScript("RTSDProvisionalContractRegister.xfdl");

       
    };
}
)();

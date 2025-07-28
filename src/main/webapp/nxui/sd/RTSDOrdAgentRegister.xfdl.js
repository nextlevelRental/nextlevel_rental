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
                this.set_name("RTSDOrdAgentRegister");
                this.set_classname("RTSDOrdAgentRegister");
                this.set_titletext("판매인 등록");
                this._setFormPosition(0,0,1147,553);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_rtsd0113", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordAgent\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgnm\" type=\"STRING\" size=\"256\"/><Column id=\"orgAgtel\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"lifnr\" type=\"STRING\" size=\"256\"/><Column id=\"num\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"taxRqcd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"sgNm\" type=\"STRING\" size=\"256\"/><Column id=\"soNm\" type=\"STRING\" size=\"256\"/><Column id=\"taxRqnm\" type=\"STRING\" size=\"256\"/><Column id=\"useNm\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYn2", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_chanCd", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_taxRqCd", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsChanLclsCdIns", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsChanMclsCdIns", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsChanMclsCd", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsChanLclsCd", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grid_rtsd0113", "absolute", "0", "120", "1122", "218", null, null, this);
            obj.set_taborder("0");
            obj.set_binddataset("ds_rtsd0113");
            obj.set_cellsizingtype("col");
            obj.set_cellmovingtype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"70\"/><Column size=\"110\"/><Column size=\"90\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"75\"/><Column size=\"75\"/><Column size=\"70\"/><Column size=\"88\"/><Column size=\"100\"/><Column size=\"88\"/><Column size=\"100\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"30\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"판매인번호\"/><Cell col=\"1\" text=\"판매인명\"/><Cell col=\"2\" text=\"전화번호\"/><Cell col=\"3\" text=\"채널코드\"/><Cell col=\"4\" text=\"채널명\"/><Cell col=\"5\" text=\"대분류\"/><Cell col=\"6\" text=\"중분류\"/><Cell col=\"7\" text=\"벤더코드\"/><Cell col=\"8\" text=\"렌탈지사코드\"/><Cell col=\"9\" text=\"렌탈지사명\"/><Cell col=\"10\" text=\"렌탈지점코드\"/><Cell col=\"11\" text=\"렌탈지점명\"/><Cell col=\"12\" text=\"노출순서\"/><Cell col=\"13\" text=\"사용유무\"/><Cell col=\"14\"/></Band><Band id=\"body\"><Cell text=\"bind:ordAgent\"/><Cell col=\"1\" text=\"bind:orgAgnm\"/><Cell col=\"2\" text=\"bind:orgAgtel\"/><Cell col=\"3\" text=\"bind:chanCd\"/><Cell col=\"4\" text=\"bind:chanNm\"/><Cell col=\"5\" text=\"bind:chanLclsNm\"/><Cell col=\"6\" text=\"bind:chanMclsNm\"/><Cell col=\"7\" text=\"bind:lifnr\"/><Cell col=\"8\" text=\"bind:rentalGroup\"/><Cell col=\"9\" text=\"bind:rentalGroupNm\"/><Cell col=\"10\" text=\"bind:rentalOffice\"/><Cell col=\"11\" text=\"bind:rentalOfficeNm\"/><Cell col=\"12\" text=\"bind:num\"/><Cell col=\"13\" text=\"bind:useNm\"/><Cell col=\"14\" text=\"bind:taxRqcd\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", "1122", "80", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "30", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("138");
            obj.set_text("판매인명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordAgentCd", "absolute", "117", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("139");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_ordAgent", "absolute", "235", "12", "21", "21", null, null, this.div_search);
            obj.set_taborder("140");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordAgentNm", "absolute", "256", "12", "120", "21", null, null, this.div_search);
            obj.set_taborder("141");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("150");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "1122", "0", "25", "496", null, null, this.div_search);
            obj.set_taborder("146");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "400", "11", "80", "20", null, null, this.div_search);
            obj.set_taborder("147");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1118", "12", null, null, this.div_search);
            obj.set_taborder("151");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "375", "0", "25", "44", null, null, this.div_search);
            obj.set_taborder("152");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "739", "0", "25", "44", null, null, this.div_search);
            obj.set_taborder("153");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "44", null, null, this.div_search);
            obj.set_taborder("154");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "0", "64", "1118", "12", null, null, this.div_search);
            obj.set_taborder("156");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_useYn", "absolute", "480", "12", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("157");
            obj.set_autoselect("true");
            obj.set_innerdataset("ds_useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Static("st_chanLclsCd", "absolute", "30", "44", "80", "21", null, null, this.div_search);
            obj.set_taborder("158");
            obj.set_text("대분류");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_chanLclsCd", "absolute", "117", "44", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("159");
            obj.set_autoselect("true");
            obj.set_innerdataset("@dsChanLclsCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Static("st_chanMclsCd", "absolute", "400", "44", "80", "21", null, null, this.div_search);
            obj.set_taborder("160");
            obj.set_text("중분류");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_chanMclsCd", "absolute", "480", "44", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("161");
            obj.set_autoselect("true");
            obj.set_innerdataset("@dsChanMclsCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Button("btn_search", "absolute", "945", null, null, "25", "16", "735", this);
            obj.set_taborder("2");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_schArea");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "80", "1147", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "96", "169", "20", null, null, this);
            obj.set_taborder("4");
            obj.set_text("메인 LIST");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "110", "1147", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "1121", "0", "26", "550", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "336", "1147", "10", null, null, this);
            obj.set_taborder("10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "352", "169", "20", null, null, this);
            obj.set_taborder("11");
            obj.set_text("변경할 내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "366", "1147", "10", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "405", "1121", "31", null, null, this);
            obj.set_taborder("13");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "435", "1121", "31", null, null, this);
            obj.set_taborder("14");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "375", "1121", "31", null, null, this);
            obj.set_taborder("15");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_orgAgtel", "absolute", "873", "380", "240", "20", null, null, this);
            obj.set_taborder("18");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_orgAgtel", "absolute", "718", "375", "150", "31", null, null, this);
            obj.set_taborder("19");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_taxRqcd", "absolute", "718", "405", "150", "31", null, null, this);
            obj.set_taborder("21");
            obj.set_text("세금계산서 발행여부");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_lifnr", "absolute", "718", "435", "150", "31", null, null, this);
            obj.set_taborder("23");
            obj.set_text("벤더코드");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_orgAgnm", "absolute", "357", "375", "100", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_text("판매인명");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_orgAgnm", "absolute", "462", "380", "250", "20", null, null, this);
            obj.set_taborder("25");
            obj.set_readonly("false");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_num", "absolute", "462", "410", "250", "20", null, null, this);
            obj.set_taborder("26");
            obj.set_enable("true");
            obj.set_maxlength("10");
            obj.set_inputtype("number");
            this.addChild(obj.name, obj);

            obj = new Static("st_salesOffice", "absolute", "357", "435", "100", "31", null, null, this);
            obj.set_taborder("28");
            obj.set_text("지점");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_num", "absolute", "357", "405", "100", "31", null, null, this);
            obj.set_taborder("29");
            obj.set_text("노출순서");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_salesGroup", "absolute", "0", "435", "100", "31", null, null, this);
            obj.set_taborder("31");
            obj.set_text("지사");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordAgent", "absolute", "0", "375", "100", "31", null, null, this);
            obj.set_taborder("33");
            obj.set_text("판매인번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordAgent", "absolute", "105", "380", "172", "20", null, null, this);
            obj.set_taborder("38");
            obj.set_readonly("false");
            obj.set_enable("true");
            obj.set_maxlength("10");
            obj.set_inputtype("number,english");
            this.addChild(obj.name, obj);

            obj = new Button("bt_ordAgent", "absolute", "282", "380", "70", "21", null, null, this);
            obj.set_taborder("39");
            obj.set_text("중복확인");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_salesGroupCd", "absolute", "105", "440", "80", "21", null, null, this);
            obj.set_taborder("41");
            obj.set_readonly("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("bt_salesGroup", "absolute", "183", "439", "21", "21", null, null, this);
            obj.set_taborder("42");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_salesGroupNm", "absolute", "204", "440", "148", "21", null, null, this);
            obj.set_taborder("43");
            obj.set_readonly("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_salesOfficeCd", "absolute", "462", "440", "80", "21", null, null, this);
            obj.set_taborder("44");
            obj.set_readonly("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_salesOfficeNm", "absolute", "561", "440", "151", "21", null, null, this);
            obj.set_taborder("46");
            obj.set_readonly("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_lifnr", "absolute", "873", "441", "240", "20", null, null, this);
            obj.set_taborder("47");
            obj.set_enable("true");
            obj.set_maxlength("10");
            obj.set_inputtype("number,english");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_taxRqcd", "absolute", "873", "409", "240", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("48");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_taxRqCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Combo("cb_chanCd", "absolute", "105", "409", "246", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("49");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_chanCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("st_chanCd", "absolute", "0", "405", "100", "31", null, null, this);
            obj.set_taborder("50");
            obj.set_text("채널");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Button("btn_insert", "absolute", "1080", "353", "41", "21", null, null, this);
            obj.set_taborder("51");
            obj.set_text("추가");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_delete", "absolute", "1035", "353", "41", "21", null, null, this);
            obj.set_taborder("52");
            obj.set_text("취소");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "465", "1121", "31", null, null, this);
            obj.set_taborder("53");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_useYn", "absolute", "0", "465", "100", "31", null, null, this);
            obj.set_taborder("54");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_useYn", "absolute", "105", "470", "246", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("55");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_useYn2");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Button("bt_salesOffice", "absolute", "540", "439", "21", "21", null, null, this);
            obj.set_taborder("56");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_chanLclsCd", "absolute", "462", "470", "250", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("57");
            obj.set_autoselect("true");
            obj.set_innerdataset("dsChanLclsCdIns");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_enable("false");

            obj = new Static("st_chanLclsCd", "absolute", "357", "465", "100", "31", null, null, this);
            obj.set_taborder("58");
            obj.set_text("채널 대분류");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_background("#f2f2efff left middle");
            obj.style.set_padding("0 10 0 10");
            this.addChild(obj.name, obj);

            obj = new Static("st_chgNm01", "absolute", "718", "465", "150", "31", null, null, this);
            obj.set_taborder("59");
            obj.set_text("채널 중분류");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_background("#f2f2efff left middle");
            obj.style.set_padding("0 10 0 10");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_chanMclsCd", "absolute", "873", "470", "240", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("60");
            obj.set_autoselect("true");
            obj.set_innerdataset("dsChanMclsCdIns");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_enable("false");

            obj = new Static("Static09", "absolute", "0", "495", "1121", "31", null, null, this);
            obj.set_taborder("61");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_useYn00", "absolute", "0", "495", "100", "31", null, null, this);
            obj.set_taborder("62");
            obj.set_text("렌탈지역");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_salesGroupCd00", "absolute", "105", "500", "80", "21", null, null, this);
            obj.set_taborder("68");
            obj.set_readonly("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("bt_salesGroup00", "absolute", "183", "500", "21", "21", null, null, this);
            obj.set_taborder("69");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_salesGroupNm00", "absolute", "204", "500", "148", "21", null, null, this);
            obj.set_taborder("70");
            obj.set_readonly("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_salesGroupCd01", "absolute", "105", "500", "37", "21", null, null, this);
            obj.set_taborder("71");
            obj.set_readonly("true");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_salesGroupNm01", "absolute", "204", "500", "36", "21", null, null, this);
            obj.set_taborder("72");
            obj.set_readonly("true");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 80, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 553, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDOrdAgentRegister");
            		p.set_titletext("판매인 등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_ordAgent","value","ds_rtsd0113","ordAgent");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_orgAgnm","value","ds_rtsd0113","orgAgnm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_orgAgtel","value","ds_rtsd0113","orgAgtel");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","cb_chanCd","value","ds_rtsd0113","chanCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_num","value","ds_rtsd0113","num");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","cb_taxRqcd","value","ds_rtsd0113","taxRqcd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_salesGroupCd","value","ds_rtsd0113","salesGroup");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_salesOfficeCd","value","ds_rtsd0113","salesOffice");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","ed_lifnr","value","ds_rtsd0113","lifnr");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","cb_useYn","value","ds_rtsd0113","useYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","cb_chanLclsCd","value","ds_rtsd0113","chanLclsCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","cb_chanMclsCd","value","ds_rtsd0113","chanMclsCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","ed_salesGroupCd00","value","ds_rtsd0113","rentalGroupNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","ed_salesGroupNm00","value","ds_rtsd0113","rentalOfficeNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","ed_salesGroupCd01","value","ds_rtsd0113","rentalGroup");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","ed_salesGroupNm01","value","ds_rtsd0113","rentalOffice");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDOrdAgentRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDOrdAgentRegister.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명: RDSDOrdAgentRegister.xfdl                                                             *
         * 설    명: 판매인 등록                                                                           *
         * 작 성 자:                                                                                       *  
         * 변경이력: ver1.1 2016-04-21 이영근, 대리점 채널 대분류,중분류 항목 추가                         *
         ***************************************************************************************************/
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs"; 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 	 	 = "RTSDOrdAgentRegister"; 
        this.cntOrdAgent = "";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if (nErrorCode < 0) {
        		alert(strErrorMsg);		
        		return;
        	}
        	
        	if( strSvcId == "initRTSDOrdAgentRegister" ){
        		var useYnCnt = this.ds_useYn.getRowCount();
        		if( useYnCnt != 0 ){
        			this.div_search.cb_useYn.set_value("Y");
        		}
        		
        		// 2016-04-19 이영근, 채널 대분류, 중분류 추가
        		this.dsChanMclsCd.addColumn("lcd","string");
        		for(var i=0; i<this.dsChanMclsCd.rowcount; i++){
        			this.dsChanMclsCd.setColumn(i,"lcd",this.dsChanMclsCd.getColumn(i,"cd").substr(0,2));
        		}		
        		
        		this.dsChanLclsCdIns.copyData(this.dsChanLclsCd);
        		this.dsChanMclsCdIns.copyData(this.dsChanMclsCd);		
        		
        		var chanLclsCdCnt = this.dsChanLclsCd.getRowCount();
        		if(chanLclsCdCnt != 0){
        			var nRow = this.dsChanLclsCd.insertRow(0);
        			this.dsChanLclsCd.setColumn(0,"cd"," ");
        			this.dsChanLclsCd.setColumn(0,"cdNm","전체");
        			this.div_search.cb_chanLclsCd.set_value(" ");
        		}
        		
        		var chanMclsCdCnt = this.dsChanMclsCd.getRowCount();
        		if(chanMclsCdCnt != 0){
        			var nRow = this.dsChanMclsCd.insertRow(0);
        			this.dsChanMclsCd.setColumn(0,"cd"," ");
        			this.dsChanMclsCd.setColumn(0,"cdNm","전체");
        			this.div_search.cb_chanMclsCd.set_value(" ");
        			this.div_search.cb_chanMclsCd.enable = false;
        		}		
        	}
        	
        	if( strSvcId == "selectRTSDOrdAgentRegister" ){
        		var nRowCount = this.ds_rtsd0113.getRowCount();
        		if(nRowCount != 0){
        			this.ds_rtsd0113.set_updatecontrol(false);
        			for( var i = 0 ; i < nRowCount ; i++ ){
        				this.ds_rtsd0113.setColumn(i, "orgAgtel",FN_numberHyphenInReturn(nvl(this.ds_rtsd0113.getColumn(i,"orgAgtel"))));
        			}
        			this.ds_rtsd0113.set_updatecontrol(true);
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grid_rtsd0113.set_nodatatext("조회된 데이터가 없습니다.");
        			this.div_search.ed_ordAgentCd.setFocus(true);
        		}
        		
        		// 2016-04-20 이영근, 그리드 내 채널 대분류/중분류 정보 표기
        		this.ds_rtsd0113.updatecontrol = false;
        		var tpLclsNm = "";
        		var tpLclsCd = "";
        		var tpMclsNm = "";
        		var tpMclsCd = "";
        		for(var i=0; i<nRowCount; i++)
        		{
        			tpLclsCd = this.ds_rtsd0113.getColumn(i, "chanLclsCd");
        			tpLclsNm = this.dsChanLclsCd.getColumn(this.dsChanLclsCd.findRow("cd",tpLclsCd),"cdNm");
        			this.ds_rtsd0113.setColumn(i,"chanLclsNm",tpLclsNm);
        			tpMclsCd = this.ds_rtsd0113.getColumn(i, "chanMclsCd");
        			tpMclsNm = this.dsChanMclsCd.getColumn(this.dsChanMclsCd.findRow("cd",tpMclsCd),"cdNm");
        			this.ds_rtsd0113.setColumn(i,"chanMclsNm",tpMclsNm);			
        		}
        		this.ds_rtsd0113.updatecontrol = true;			
        	}
        	
        	if( strSvcId == "saveRTSDOrdAgentRegister" ){
        		alert(strErrorMsg);
        		if( nErrorCode == "0" ){
        			this.div_search.ed_ordAgentCd.set_value(this.ed_ordAgent.value);
        			this.div_search.cb_useYn.set_value(this.cb_useYn.value);
        			this.fn_search();
        		}
        	}
        	
        	if( strSvcId == "checkOrdAgent" ){
        		if( this.cntOrdAgent != "0" ) {
        			alert('입력하신 판매인번호 \'' + this.ed_ordAgent.value + '\'는 존재하고 있습니다.'); 
        			this.ed_ordAgent.set_value('');
        			this.ed_ordAgent.setFocus(true);
        		}else{
        			this.ed_ordAgent.set_enable(false);
        			this.bt_ordAgent.set_enable(false);
        			this.ed_orgAgnm.setFocus(true);
        			alert('사용가능한 판매인번호 입니다.');
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTSDOrdAgentRegister_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	this.parent.setButton("S|E|C", this);
        }
        this.fn_init = function(){
        	var sSvcID      	= "initRTSDOrdAgentRegister";  
        	var sController   	= "rtms/sd/initRTSDOrdAgentRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_useYn=mapDsUseYn ";
        	sOutDatasets += " ds_useYn2=mapDsUseYn2 ";
        	sOutDatasets += " ds_chanCd=mapDsChanCd ";
        	sOutDatasets += " ds_taxRqCd=mapDsTaxRqCd ";
        	sOutDatasets += " dsChanLclsCd=mapDsChanLclsCd ";
        	sOutDatasets += " dsChanMclsCd=mapDsChanMclsCd ";	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	var ordAgentCd 	= nvl(this.div_search.ed_ordAgentCd.value);
        	var useYn  		= nvl(this.div_search.cb_useYn.value);
        	var chanLclsCd	= nvl(this.div_search.cb_chanLclsCd.value);
        	var chanMclsCd	= nvl(this.div_search.cb_chanMclsCd.value);	
        	var userId      = application.gds_userInfo.getColumn(0, "userId"); //사용자ID	

        	var sSvcID        	= "selectRTSDOrdAgentRegister";                    
        	var sController   	= "rtms/sd/selectRTSDOrdAgentRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_rtsd0113=mapRtsd0113";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordAgentCd", ordAgentCd);
        	sArgs += Ex.util.setParam("useYn", useYn);
        	sArgs += Ex.util.setParam("chanLclsCd", chanLclsCd);
        	sArgs += Ex.util.setParam("chanMclsCd", chanMclsCd);
        	sArgs += Ex.util.setParam("userId", userId);	
        	this.ds_rtsd0113.clearData();
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.grid_rtsd0113);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(){
        	var flag 	   = 0;
        	var insertFlag = false;
        	
        	var nCnt = this.ds_rtsd0113.getRowCount();
        	for( var i = 0 ; i < nCnt ; i++ ){
        		var rowType  = this.ds_rtsd0113.getRowType(i);
        		var ordAgent = nvl(this.ds_rtsd0113.getColumn(i, "ordAgent"));
        		var orgAgnm  = nvl(this.ds_rtsd0113.getColumn(i, "orgAgnm"));
        		var orgAgtel = nvl(this.ds_rtsd0113.getColumn(i, "orgAgtel"));
        		var orgAgtel = nvl(this.ds_rtsd0113.getColumn(i, "orgAgtel"));
        		
        		
        		var chanCd	 = nvl(this.ds_rtsd0113.getColumn(i, "chanCd"));
        		var msg 	 = " 값이 없습니다.";
        		
        		if( ordAgent == "" ){ alert("판매인번호"+msg);	this.ds_rtsd0113.set_rowposition(i); this.ed_ordAgent.setFocus(true); 	return false; }
        		if( orgAgnm == "" ){  alert("판매인명"+msg);   this.ds_rtsd0113.set_rowposition(i); this.ed_orgAgnm.setFocus(true); 	return false; }
        		if( orgAgtel == "" ){ alert("전화번호"+msg); 	this.ds_rtsd0113.set_rowposition(i); this.ed_orgAgtel.setFocus(true); 	return false; }
        		if( chanCd == "" ){   alert("채널"+msg); 		this.ds_rtsd0113.set_rowposition(i); this.cb_chanCd.setFocus(true); 	return false; }
        		if( FN_numberHyphenOut(nvl(this.ds_rtsd0113.getColumn(i,"orgAgtel"))).length < 8 ){
        			alert("전화번호를 확인하세요.");
        			this.ds_rtsd0113.set_rowposition(i);
        			this.ed_orgAgtel.setFocus(true);
        			return false;
        		}
        		
        		if( (rowType == 2) || (rowType == 4) ){
        			flag++;
        		}
        		if( rowType == 2 ){
        			insertFlag = true;
        		}
        		
        	}
        	
        	if( flag == 1 ){
        		if( insertFlag && (this.cntOrdAgent == "") ){
        			alert("판매인정보 중복확인을 하세요.");
        			this.bt_ordAgent.setFocus(true);
        			return false;
        		}else{
        			var sSvcID        	= "saveRTSDOrdAgentRegister";                    
        			var sController   	= "rtms/sd/saveRTSDOrdAgentRegister.do";
        			var sInDatasets   	= " input=ds_rtsd0113:U ";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			for( var i = 0 ; i < nCnt ; i++){
        				if( (this.ds_rtsd0113.getRowType(i) == 2) || (this.ds_rtsd0113.getRowType(i) == 4) ){
        					this.ds_rtsd0113.setColumn(i, "orgAgtel",FN_numberHyphenOut(nvl(this.ds_rtsd0113.getColumn(i,"orgAgtel"))));
        				}
        			}
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}else if( flag > 1){
        		alert("수정되거나 추가된 정보가 2건 이상이므로 저장할 수 없습니다.");
        		return false;
        	}else{
        		alert("변경된 정보가 없습니다.");
        		return false;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_ordAgentCd_onchanged = function(obj,e){
        	if(e.keycode == 13){
        		this.fn_search();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_ed_ordAgentCd_onkeyup = function(obj,e){
        	this.div_search.ed_ordAgentNm.set_value("");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_ordAgent_onclick = function(obj,e){
        	var args ={p_arg : this.p_arg};
        	Ex.core.popup(this,"판매인 조회","comm::RTCOMMOrdAgentList_pop.xfdl",args, "modaless=false");
        }
        this.FN_sellers = function(res){
        	this.div_search.ed_ordAgentCd.set_value(res[0]);
        	this.div_search.ed_ordAgentNm.set_value(res[1]);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_rtsd0113_onselectchanged = function(obj,e){
        	var nRow = this.ds_rtsd0113.rowposition;
        	var rowType = this.ds_rtsd0113.getRowType(nRow);
        	
        	this.cb_chanLclsCd.set_enable(true);
        	this.cb_chanMclsCd.set_enable(true);	
        	
        	if( rowType == 2 ){
        		this.ed_ordAgent.set_enable(true);
        		this.bt_ordAgent.set_enable(true);
        		//this.bt_salesGroup.set_enable(true);
        		//this.bt_salesOffice.set_enable(true);
        		
        	}else{
        		this.ed_ordAgent.set_enable(false);
        		this.bt_ordAgent.set_enable(false);
        		//this.bt_salesGroup.set_enable(false);
        		//this.bt_salesOffice.set_enable(false);
        	
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_delete_onclick = function(obj,e){
        	var nRow = this.ds_rtsd0113.rowposition;
        	var rowType = this.ds_rtsd0113.getRowType(nRow);
        	if( rowType == 2 ){
        		this.ds_rtsd0113.deleteRow(nRow);
        	}else{
        		alert("조회 정보나 수정된 정보는 취소할 수 없습니다.");
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_insert_onclick = function(obj,e){
        	var flag = false;
        	var nCnt = this.ds_rtsd0113.getRowCount();
        	for( var i = 0 ; i < nCnt ; i++ ){
        		var rowType = this.ds_rtsd0113.getRowType(i);
        		if( (rowType == 2) || (rowType == 4) ){
        			flag = true;
        			break;
        		}
        	}
        	
        	if( flag ){
        		alert("변경된 정보나 추가된 정보가 있으므로 추가할 수 없습니다.");
        	}else{
        		var nRow = this.ds_rtsd0113.addRow();
        		this.ds_rtsd0113.setColumn( nRow, "useYn", "Y");
        		this.ds_rtsd0113.setColumn( nRow, "taxRqcd", "R");
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.bt_ordAgent_onclick = function(obj,e){
        	if(nvl(this.ed_ordAgent.value) == "") {
        		alert("판매인번호를  입력해주십시오.");
        		this.ed_ordAgent.setFocus(true);
        		return;
        	}else{
        		var sSvcID        	= "checkOrdAgent";                    
        		var sController   	= "rtms/sd/checkOrdAgent.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sArgs += Ex.util.setParam("ordAgent",this.ed_ordAgent.value);
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.ed_orgAgtel_onkeyup = function(obj,e){
        	FN_numberHyphenIn(obj, e);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.bt_salesGroup_onclick = function(obj,e){
        	var args ={ p_arg : this.p_arg };
        	Ex.core.popup(this,"지사 조회","comm::RTCOMMVkgrp_pop_old.xfdl",args,"modaless=false");
        }
        this.return_salesGroup = function(val) {
        	var nm = val[0];
        	var cd = val[1];
        	this.ed_salesGroupCd.set_value(cd);
        	this.ed_salesGroupNm.set_value(nm);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.bt_salesOffice_onclick = function(obj,e){
        	var args ={ p_arg : this.p_arg };
        	Ex.core.popup(this,"지점 조회","comm::RTCOMMVkbur_pop_old.xfdl",args,"modaless=false");
        }
        this.return_salesOffice = function(val) {
        	var nm = val[0];
        	var cd = val[1];
        	this.ed_salesOfficeCd.set_value(cd);
        	this.ed_salesOfficeNm.set_value(nm);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        // 2016-04-19 이영근, 채널 중분류 값 변경시 이벤트
        this.div_search_cb_chanLclsCd_onitemchanged = function(obj,e)
        {
        	if(this.div_search.cb_chanLclsCd.value == " "){
        		this.div_search.cb_chanMclsCd.enable = false;
        	}else{
        		this.div_search.cb_chanMclsCd.enable = true;
        	}
        	this.dsChanMclsCd.filter("lcd=='"+this.div_search.cb_chanLclsCd.value+"' || lcd==null");
        	this.div_search.cb_chanMclsCd.set_value(" ");
        }

        this.cb_chanLclsCd_onitemchanged = function(obj,e)
        {
        	this.dsChanMclsCdIns.filter("lcd=='"+this.cb_chanLclsCd.value+"'");
        }
        this.bt_salesGroup00_onclick = function(obj,e)
        {
        	var args ={p_argGrpNo:""};
        	Ex.core.popup(this,"렌탈지역등록","sd::RTSDRentalAreaRegisterPopup2_new.xfdl",args, "modaless=false");
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

        		this.ed_salesGroupCd01.set_value(rentalGroup);		
        		this.ed_salesGroupNm01.set_value(rentalOffice);
        		this.ed_salesGroupCd00.set_value(rentalGroupNm);
        		this.ed_salesGroupNm00.set_value(rentalOfficeNm);		
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDOrdAgentRegister_onload, this);
            this.grid_rtsd0113.addEventHandler("onselectchanged", this.grid_rtsd0113_onselectchanged, this);
            this.div_search.ed_ordAgentCd.addEventHandler("onkeyup", this.div_search_ed_ordAgentCd_onkeyup, this);
            this.div_search.ed_ordAgentCd.addEventHandler("onchanged", this.div_search_ed_ordAgentCd_onchanged, this);
            this.div_search.bt_ordAgent.addEventHandler("onclick", this.div_search_bt_ordAgent_onclick, this);
            this.div_search.cb_chanLclsCd.addEventHandler("onitemchanged", this.div_search_cb_chanLclsCd_onitemchanged, this);
            this.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.ed_orgAgtel.addEventHandler("onkeyup", this.ed_orgAgtel_onkeyup, this);
            this.ed_ordAgent.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.bt_ordAgent.addEventHandler("onclick", this.bt_ordAgent_onclick, this);
            this.bt_salesGroup.addEventHandler("onclick", this.bt_salesGroup_onclick, this);
            this.btn_insert.addEventHandler("onclick", this.btn_insert_onclick, this);
            this.btn_delete.addEventHandler("onclick", this.btn_delete_onclick, this);
            this.bt_salesOffice.addEventHandler("onclick", this.bt_salesOffice_onclick, this);
            this.cb_chanLclsCd.addEventHandler("onitemchanged", this.cb_chanLclsCd_onitemchanged, this);
            this.bt_salesGroup00.addEventHandler("onclick", this.bt_salesGroup00_onclick, this);

        };

        this.loadIncludeScript("RTSDOrdAgentRegister.xfdl");

       
    };
}
)();

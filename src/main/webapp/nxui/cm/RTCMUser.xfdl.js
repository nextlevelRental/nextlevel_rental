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
                this.set_name("form");
                this.set_classname("Authority");
                this.set_titletext("사용자 등록관리");
                this._setFormPosition(0,0,1147,527);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_user", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"tmpPwYn\" type=\"string\" size=\"32\"/><Column id=\"lastPwDt\" type=\"STRING\" size=\"17\"/><Column id=\"agentNm\" type=\"string\" size=\"32\"/><Column id=\"failCnt\" type=\"bigdecimal\" size=\"16\"/><Column id=\"userGrpNm\" type=\"string\" size=\"32\"/><Column id=\"agentId\" type=\"string\" size=\"32\"/><Column id=\"oldPassword\" type=\"string\" size=\"32\"/><Column id=\"chgId\" type=\"string\" size=\"32\"/><Column id=\"password\" type=\"string\" size=\"32\"/><Column id=\"userGrp\" type=\"string\" size=\"32\"/><Column id=\"userNm\" type=\"string\" size=\"32\"/><Column id=\"vkgrpNm\" type=\"string\" size=\"32\"/><Column id=\"lastLogonDt\" type=\"STRING\" size=\"17\"/><Column id=\"userId\" type=\"string\" size=\"32\"/><Column id=\"chgDt\" type=\"STRING\" size=\"17\"/><Column id=\"vkbur\" type=\"string\" size=\"32\"/><Column id=\"regDt\" type=\"STRING\" size=\"17\"/><Column id=\"regId\" type=\"string\" size=\"32\"/><Column id=\"lockYn\" type=\"string\" size=\"32\"/><Column id=\"vkburNm\" type=\"string\" size=\"32\"/><Column id=\"vkgrp\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsGrp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"cd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsLock", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"data\">사용불가</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"data\">사용</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("Dataset00", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsGrp2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/><Column id=\"cd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static58", "absolute", "748", "465", null, "31", "25", null, this);
            obj.set_taborder("110");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static56", "absolute", "748", "405", null, "31", "25", null, this);
            obj.set_taborder("108");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static57", "absolute", "748", "435", null, "31", "25", null, this);
            obj.set_taborder("109");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static55", "absolute", "748", "375", null, "31", "25", null, this);
            obj.set_taborder("107");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static54", "absolute", "748", "345", null, "31", "25", null, this);
            obj.set_taborder("106");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "0", "345", "749", "31", null, null, this);
            obj.set_taborder("102");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "375", "749", "31", null, null, this);
            obj.set_taborder("50");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Button("Button34", "absolute", null, "313", "123", "22", "25", null, this);
            obj.set_taborder("33");
            obj.set_text("비밀번호 초기화");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_Group", "absolute", "0", "86", null, "216", "25", null, this);
            obj.set_taborder("4");
            obj.set_autofittype("none");
            obj.set_binddataset("ds_user");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj.set_scrollbars("autoboth");
            obj.set_cellclickbound("cell");
            obj.set_cellmovingtype("none");
            obj.set_autosizebandtype("head");
            obj.set_scrollpixel("all");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"88\"/><Column size=\"80\"/><Column size=\"0\"/><Column size=\"93\"/><Column size=\"83\"/><Column size=\"91\"/><Column size=\"96\"/><Column size=\"165\"/><Column size=\"116\"/><Column size=\"80\"/><Column size=\"150\"/><Column size=\"80\"/><Column size=\"150\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"아이디\"/><Cell col=\"1\" text=\"이름\"/><Cell col=\"2\" text=\"비밀번호\"/><Cell col=\"3\" text=\"대리점\"/><Cell col=\"4\" text=\"ERP지점\"/><Cell col=\"5\" text=\"ERP지사\"/><Cell col=\"6\" text=\"사용자 그룹\"/><Cell col=\"7\" text=\"임시비밀번호 사용여부\"/><Cell col=\"8\" text=\"사용불가 계정여부\"/><Cell col=\"9\" text=\"등록자 ID\"/><Cell col=\"10\" text=\"등록일\"/><Cell col=\"11\" text=\"변경자 ID\"/><Cell col=\"12\" text=\"변경일\"/></Band><Band id=\"body\"><Cell text=\"bind:userId\"/><Cell col=\"1\" text=\"bind:userNm\"/><Cell col=\"2\" displaytype=\"none\" text=\"bind:password\"/><Cell col=\"3\" text=\"bind:agentNm\"/><Cell col=\"4\" text=\"bind:vkburNm\"/><Cell col=\"5\" text=\"bind:vkgrpNm\"/><Cell col=\"6\" text=\"bind:userGrpNm\"/><Cell col=\"7\" text=\"bind:tmpPwYn\"/><Cell col=\"8\" text=\"bind:lockYn\"/><Cell col=\"9\" text=\"bind:regId\"/><Cell col=\"10\" displaytype=\"normal\" text=\"bind:regDt\"/><Cell col=\"11\" text=\"bind:chgId\"/><Cell col=\"12\" text=\"bind:chgDt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_BG", "absolute", "10", "0", null, "40", "-10", null, this);
            obj.set_cssclass("sta_WF_SearchBox");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("19");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "0", "64", "41", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("사용자ID");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_searchCondition", "absolute", "88", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            var cmb_searchCondition_innerdataset = new Dataset("cmb_searchCondition_innerdataset", this.div_search.cmb_searchCondition);
            cmb_searchCondition_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">0</Col><Col id=\"datacolumn\">아이디</Col></Row><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">이름</Col></Row></Rows>");
            obj.set_innerdataset(cmb_searchCondition_innerdataset);
            obj.set_taborder("17");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Edit("edt_searchKeyword", "absolute", "233", "10", "260", "21", null, null, this.div_search);
            obj.set_taborder("18");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("userGrp", "absolute", "609", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("19");
            obj.set_innerdataset("@dsGrp2");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj = new Static("st_searchCondition01", "absolute", "523", "0", "90", "41", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_text("사용자 그룹");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "61", "81", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", null, "0", "716", "12", "430", null, this);
            obj.set_taborder("25");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "0.09%", "33", null, "12", "37.49%", null, this);
            obj.set_taborder("26");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this);
            obj.set_taborder("27");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "43.16%", "0", null, "44", "54.23%", null, this);
            obj.set_taborder("28");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "45", "1122", "20", null, null, this);
            obj.set_taborder("29");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("30");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0%", "76", null, "10", "2.18%", null, this);
            obj.set_taborder("31");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "302", "1122", "20", null, null, this);
            obj.set_taborder("32");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "335", "1122", "10", null, null, this);
            obj.set_taborder("34");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "318", "81", "20", null, null, this);
            obj.set_taborder("35");
            obj.set_text("변경할 내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "374", "345", "130", "31", null, null, this);
            obj.set_taborder("37");
            obj.set_text("ERP 지사");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "374", "375", "130", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_text("ERP 지점");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("vkgrp", "absolute", "508", "350", "116", "21", null, null, this);
            obj.set_taborder("39");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("vkbur", "absolute", "508", "380", "116", "21", null, null, this);
            obj.set_taborder("40");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("failCnt", "absolute", "882", "350", "235", "21", null, null, this);
            obj.set_taborder("41");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("regId", "absolute", "882", "380", "235", "21", null, null, this);
            obj.set_taborder("42");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "748", "375", "130", "31", null, null, this);
            obj.set_taborder("43");
            obj.set_text("등록자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "748", "345", "130", "31", null, null, this);
            obj.set_taborder("44");
            obj.set_text("접속실패건수");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "0", "345", "130", "31", null, null, this);
            obj.set_taborder("46");
            obj.set_text("사용자 ID");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "0", "375", "130", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_text("사용자명");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Edit("userNm", "absolute", "134", "380", "236", "21", null, null, this);
            obj.set_taborder("48");
            this.addChild(obj.name, obj);

            obj = new Edit("userId", "absolute", "134", "350", "167", "21", null, null, this);
            obj.set_taborder("49");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "0", "405", "749", "31", null, null, this);
            obj.set_taborder("51");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("regDt", "absolute", "882", "410", "235", "21", null, null, this);
            obj.set_taborder("52");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "748", "405", "130", "31", null, null, this);
            obj.set_taborder("53");
            obj.set_text("등록일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit01", "absolute", "508", "410", "236", "21", null, null, this);
            obj.set_taborder("54");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "374", "405", "130", "31", null, null, this);
            obj.set_taborder("55");
            obj.set_text("대리점");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "0", "405", "130", "31", null, null, this);
            obj.set_taborder("57");
            obj.set_text("사용자그룹");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "0", "435", "749", "31", null, null, this);
            obj.set_taborder("58");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("chgId", "absolute", "882", "440", "235", "21", null, null, this);
            obj.set_taborder("59");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "748", "435", "130", "31", null, null, this);
            obj.set_taborder("60");
            obj.set_text("수정자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("lastPwDt", "absolute", "508", "440", "236", "21", null, null, this);
            obj.set_taborder("61");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "374", "435", "130", "31", null, null, this);
            obj.set_taborder("62");
            obj.set_text("비밀번호변경일");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "0", "435", "130", "31", null, null, this);
            obj.set_taborder("64");
            obj.set_text("사용불가여부");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "0", "465", "749", "31", null, null, this);
            obj.set_taborder("65");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("chgDt", "absolute", "882", "470", "235", "21", null, null, this);
            obj.set_taborder("66");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static28", "absolute", "748", "465", "130", "31", null, null, this);
            obj.set_taborder("67");
            obj.set_text("수정일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("lastLogonDt", "absolute", "508", "470", "236", "21", null, null, this);
            obj.set_taborder("68");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static29", "absolute", "374", "465", "130", "31", null, null, this);
            obj.set_taborder("69");
            obj.set_text("최종접속일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static30", "absolute", "0", "465", "130", "31", null, null, this);
            obj.set_taborder("71");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "304", "350", "65", "21", null, null, this);
            obj.set_taborder("74");
            obj.set_text("중복확인");
            this.addChild(obj.name, obj);

            obj = new Edit("vkgrpNm", "absolute", "628", "350", "116", "21", null, null, this);
            obj.set_taborder("75");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("vkburNm", "absolute", "628", "380", "116", "21", null, null, this);
            obj.set_taborder("76");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", "604", "349", "20", "21", null, null, this);
            obj.set_taborder("77");
            obj.set_cssclass("btn_WF_edtSch");
            this.addChild(obj.name, obj);

            obj = new Button("Button03", "absolute", "604", "379", "20", "21", null, null, this);
            obj.set_taborder("78");
            obj.set_cssclass("btn_WF_edtSch");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "96.08%", "0", null, "45", "2.18%", null, this);
            obj.set_taborder("79");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static32", "absolute", "1098", "88", "30", "1", null, null, this);
            obj.set_taborder("80");
            obj.style.set_background("red");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static33", "absolute", "95.73%", "117", null, "1", "1.66%", null, this);
            obj.set_taborder("81");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "1119", "94", "50", "21", null, null, this);
            obj.set_taborder("82");
            obj.set_text("H:30px");
            obj.style.set_color("red");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static35", "absolute", "1121", "71", "59", "21", null, null, this);
            obj.set_taborder("83");
            obj.set_text("Line H:2px");
            obj.style.set_color("red");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static36", "absolute", "1", "469", "1", "30", null, null, this);
            obj.set_taborder("84");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static37", "absolute", "11.25%", "469", null, "30", "88.67%", null, this);
            obj.set_taborder("85");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit14", "absolute", "134", "470", "236", "21", null, null, this);
            obj.set_taborder("86");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static38", "absolute", "11.68%", "469", null, "30", "88.23%", null, this);
            obj.set_taborder("87");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static39", "absolute", "32.17%", "469", null, "30", "67.74%", null, this);
            obj.set_taborder("88");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static40", "absolute", "32.61%", "469", null, "30", "67.31%", null, this);
            obj.set_taborder("89");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static41", "absolute", "40", "496", "47", "21", null, null, this);
            obj.set_taborder("90");
            obj.set_text("W:130px");
            obj.style.set_color("red");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static42", "absolute", "120", "495", "47", "21", null, null, this);
            obj.set_taborder("91");
            obj.set_text("4 px");
            obj.style.set_color("red");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static43", "absolute", "32.08%", "495", null, "21", "63.82%", null, this);
            obj.set_taborder("92");
            obj.set_text("4 px");
            obj.style.set_color("red");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static44", "absolute", "76", "40", "47", "21", null, null, this);
            obj.set_taborder("93");
            obj.set_text("5 px");
            obj.style.set_color("red");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static45", "absolute", "85", "14", "1", "30", null, null, this);
            obj.set_taborder("94");
            obj.set_visible("false");
            obj.style.set_background("red");
            obj.set_text("5 px");
            this.addChild(obj.name, obj);

            obj = new Static("Static46", "absolute", "90", "14", "1", "30", null, null, this);
            obj.set_taborder("95");
            obj.set_visible("false");
            obj.style.set_background("red");
            obj.set_text("5 px");
            this.addChild(obj.name, obj);

            obj = new Static("Static47", "absolute", "19.27%", "40", null, "21", "76.63%", null, this);
            obj.set_taborder("96");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static48", "absolute", "20.49%", "14", null, "30", "79.42%", null, this);
            obj.set_taborder("97");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static49", "absolute", "20.05%", "14", null, "30", "79.86%", null, this);
            obj.set_taborder("98");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static50", "absolute", "51.96%", "41", null, "21", "43.94%", null, this);
            obj.set_taborder("99");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static51", "absolute", "53.18%", "15", null, "30", "46.73%", null, this);
            obj.set_taborder("100");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static52", "absolute", "52.75%", "15", null, "30", "47.17%", null, this);
            obj.set_taborder("101");
            obj.set_text("5 px");
            obj.set_visible("false");
            obj.style.set_background("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static53", "absolute", "32", "518", "404", "21", null, null, this);
            obj.set_taborder("103");
            obj.set_text("*Detail Area는 Guide 09 가이드 참고");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Combo("userGrp", "absolute", "134", "410", "236", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("104");
            obj.set_value("0");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@dsGrp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("0");

            obj = new Combo("Combo01", "absolute", "134", "440", "236", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("105");
            obj.set_value("0");
            obj.set_innerdataset("@dsLock");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("data");
            obj.set_displayrowcount("5");
            obj.set_index("0");


            
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
            obj = new Layout("default", "", 1147, 527, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("사용자 등록관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","userId","value","ds_user","userId");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","userNm","value","ds_user","userNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","vkgrp","value","ds_user","vkgrp");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","vkgrpNm","value","ds_user","vkgrpNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","vkbur","value","ds_user","vkbur");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","vkburNm","value","ds_user","vkburNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","lastPwDt","value","ds_user","lastPwDt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","lastLogonDt","value","ds_user","lastLogonDt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","failCnt","value","ds_user","failCnt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","regId","value","ds_user","regId");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","regDt","value","ds_user","regDt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","chgId","value","ds_user","chgId");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","chgDt","value","ds_user","chgDt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","userGrp","value","ds_user","userGrp");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","Combo01","value","ds_user","lockYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","Edit01","value","ds_user","agentNm");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMUser.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMUser.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 사용자 등록관리
         * 02. 그룹명   :
         * 03. 그룹설명 :
         * 04. 작성일   :
         * 05. 작성자   :
         * 06. 수정이력 :
         ***********************************************************************
         *     수정일     작성자   내용
         ***********************************************************************
         *
         ***********************************************************************
         */

        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * 그룹 변수 선언부
         ************************************************************************/
          this.resultCnt = "";
        	this.form_onload = function(obj,e)
        	{
        		/* 1. N : 신규추가
        		 * 2. S : 조회
        		 * 3. C : 데이타생성
        		 * 4. E : 엑셀데이타생성
        		 */

        		Ex.core.init(obj); 	
        		this.fn_search();
        		this.parent.setButton("E|C|N|S", this);
        		
        	} 
        	 
         

        	/***********************************************************************************
        	* Transaction Function
        	***********************************************************************************/
        	//목록조회 Search
        	this.fn_search = function()
        	{
        		var userId 			= this.div_search.edt_searchKeyword.value;
        		var sSvcID        	= "listUserInfo";                    
        		var sController   	= "listUserInfo.do";
        		var sInDatasets   	= "user_=ds_user";
        		var sOutDatasets  	= "ds_user=listUser dsGrp=userGrp";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		if (this.div_search.cmb_searchCondition.value == 1) {
        			sArgs += Ex.util.setParam("userNm", this.div_search.edt_searchKeyword.value);
        		} else if (this.div_search.cmb_searchCondition.value == 0) {
        			sArgs += Ex.util.setParam("userId", this.div_search.edt_searchKeyword.value);
        		}
        		
        		sArgs += Ex.util.setParam("userGrp", this.div_search.userGrp.value);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        	
        	//아이디 중복확인
        	this.fn_userId_exists = function()
        	{
        		if(nvl(this.userId.value) == "") {
        			alert("아이디를 입력해주십시오.");
        			this.userId.setFocus();
        			return;
        		}
        		var sSvcID        	= "userIdExists";                    
        		var sController   	= "checkIdExists.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sArgs += Ex.util.setParam("userId",this.userId.value);
        		sInDatasets   		= "";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	this.checkForm = function() {
        		if(nvl(this.userId.value) == "") {
        			alert("사용자 아이디는 필수입력항목입니다.");
        			this.userId.setFocus();
        			return false;
        		}
        		
        		if(nvl(this.userNm.value) == "") {
        			alert("사용자명은 필수입력항목입니다.");
        			this.userNm.setFocus();
        			return false;
        		}
        		
        		if(nvl(this.userGrp.value) == "") {
        			alert("사용자그룹은 필수입력항목입니다.");
        			return false;
        		}
        		return true;
        	}

        	//저장
        	this.fn_save = function() {
        		
        		
        		if(!this.checkForm()) {
        			return;
        		}
        		
        		if(!this.fn_updateCnt("save")) {
        			alert('변경된 데이타가 없습니다.');
        			return;
        		}
        		
        		
        		var sSvcID        	= "saveUserInfo";                    
        		var sController   	= "saveUserInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		sInDatasets   		= "input=ds_user:U";
        		sOutDatasets  		= "ds_user=listUser dsGrp=userGrp";
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	// 사용자 암호 초기화
        	this.clearUserPassword = function()	{
        		var sSvcID        	= "clearPwd";                    
        		var sController   	= "clearPwd.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		sArgs += Ex.util.setParam("userId",this.userId.value);
        		sInDatasets   		= "";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/

        	/* callBack함수 */
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt) { 
        		if (nErrorCode < 0) {
        			alert(strErrorMsg);		
        			return;
        		}
        		
        		if (strSvcId == "listUserInfo") {
        			this.dsGrp2.copyData(this.dsGrp);
        			this.fn_search_post();
        			this.grd_Group.set_scrollbars("autoboth");
        			
        		}
        		
        		if (strSvcId == "saveUserInfo") {
        			alert(strErrorMsg);
        			//this.fn_search();
        		}
        		
        		if (strSvcId == "userIdExists") {
        			var msg = "";
        			this.ds_user.getRowType();
        			var position = this.ds_user.rowposition;
        			var id = this.userId.value;
        			if(this.resultCnt != '0') {
        				msg = '입력하신 아이디 \'' + id + '\'는 존재하고 있습니다.';
        				this.userId.set_value('');
        			} else {
        				var msg = '사용가능한 아이디 입니다.';
        			}
        			alert(msg);
        		}
        		
        		if(strSvcId == "clearPwd") {
        			alert(strErrorMsg);
        		}

        	}
        	
        	//====================================================
        	// 입력중인 데이타가 있는경우 추가버튼 금지
        	//====================================================
        	this.fn_updateCnt = function(chkVal) {
        		var b = false;
        		var cnt = this.ds_user.getRowCount();
        		var updateCnt = 0;
        		for(var i = 0; i<cnt; i++) {
        			if(chkVal == "save") {
        				if(this.ds_user.getRowType(i) == 4 || this.ds_user.getRowType(i) == 2) {
        					b = true;
        					break;
        				}
        			} else if(chkVal == "add") {
        				if(this.ds_user.getRowType(i) == 2) {
        					b = true;
        					break;
        				}
        			}
        		}
        		return b;
        	}

        	/***********************************************************************************
        	* Component Event
        	***********************************************************************************/

        	// 그룹 추가 버튼 클릭시 이벤트 처리
        	this.fn_add = function(obj,e) {
        		if(this.fn_updateCnt("add")) {
        			alert("수정 및 신규작성중인 자료저장후 추가해주십시오.");
        			return;
        		}
        		var nRow = this.ds_user.addRow();
        		this.Combo01.set_value("N");
        	}

        	// 그룹 삭제 버튼 클릭시 이벤트 처리
        	this.fn_delete = function(obj,e)
        	{
        		var nRow = this.ds_user.rowposition;
        		this.ds_user.deleteRow(nRow);
        	}

        	//검색 시 Enter키 이벤트 처리
        	this.div_search_edt_searchKeyword_onkeyup = function(obj,e)
        	{
        		if ( e.keycode == 13 )
        		{
        			this.fn_search();
        		}
        	}

        	this.div_grid_bottom_btn_find_onclick = function(obj,e)
        	{
        		this.gfn_findPopup(this.grd_Group);
        	}

        	this.div_grid_bottom_btn_excel_onclick = function(obj,e)
        	{
        		Ex.core.exportExcel(this.grd_Group);
        	}

        	/***********************************************************************************
        	* User Function
        	***********************************************************************************/

        
        	this.showVkgrp = function(obj,e)
        	{
        	  var args ={p_arg:""};
        	  Ex.core.popup(this,"StringReturnSample","comm::RTCOMMVkgrp_pop_old.xfdl",args,"modaless=false");
        	}
        	
        	// 파라미터 반환
        	this._setReturn = function(val) {
        		var cd = val[0];
        		var nm = val[1];
        		var gb 		= val[2];
        		if(gb == "vkgrp") {
        			this.vkgrp.set_value(cd);
        			this.vkgrpNm.set_value(nm);
        		} else if(gb == "vkbur" ) {
        			this.vkbur.set_value(cd);
        			this.vkburNm.set_value(nm);
        		}
        	}
        	
        	this.showVkbur = function(obj,e)
        	{
        	  var args ={p_arg:""};
        	  //Ex.core.popup(this,"StringReturnSample","comm::RTCOMMVkbur_pop.xfdl",args,"modaless=false");
        	  Ex.core.popup(this,"StringReturnSample","comm::RTCOMMVkbur_pop_old.xfdl",args,"modaless=false");
        	}
        	
        	this.checkSaveMode = function(obj,e) {
        		var rowType = obj.getRowType(e.newrow);
        		
        		if(rowType !=  "2") { //신규등록만 입력가능하도록 !!!
        			this.userId.enable = false;
        			this.Button01.enable = false;
        		} else {
        			this.userId.enable = true;
        			this.Button01.enable = true;
        		}
        		
        		if(obj.getColumn(e.newrow, "userGrpNm") == "렌탈마스터") {
        			this.vkbur.set_enable(false);
        			this.Button02.set_enable(false);
        			this.vkgrpNm.set_enable(false);
        			this.vkgrp.set_enable(false);
        			this.Button03.set_enable(false);
        			this.vkburNm.set_enable(false);
        		} else {
        			this.vkbur.set_enable(true);
        			this.Button02.set_enable(true);
        			this.vkgrpNm.set_enable(true);
        			this.vkgrp.set_enable(true);
        			this.Button03.set_enable(true);
        			this.vkburNm.set_enable(true);
        		}
        	}

        	// 사용자 그룹 변경 이벤트 발생시 처리 함수
        	this.div_search00_userGrp_onitemchanged = function(obj,obj2,e) {
        		var idx = this.ds_user.rowposition;
        		var rowType = this.ds_user.getRowType(idx);
        		//신규입력은 대리점 선택 못하도록

        		if(rowType ==  "2" && this.userGrp.value == "05") {
        			var msg = "신규등록인경우 대리점은 선택하실수 없습니다.";
        			alert(msg);
        			this.userGrp.set_value("");
        			return;
        		}
        		
        		// 렌탈 마스터 항목 선택시 ERP 지사, ERP 지점 비활성
        		if (this.userGrp.value == "RM") {
        			this.vkbur.set_enable(false);
        			this.Button02.set_enable(false);
        			this.vkgrpNm.set_enable(false);
        			this.vkgrp.set_enable(false);
        			this.Button03.set_enable(false);
        			this.vkburNm.set_enable(false);
        		} else {
        			this.vkbur.set_enable(true);
        			this.Button02.set_enable(true);
        			this.vkgrpNm.set_enable(true);
        			this.vkgrp.set_enable(true);
        			this.Button03.set_enable(true);
        			this.vkburNm.set_enable(true);
        		}
        		
        	} 

        	this.fn_excel= function() {
        		Ex.core.exportExcel(this, this.grd_Group);
        	}

        	//신규등록인경우 만 처리
        	this.userId_onkillfocus = function(obj,e){
        		this.fn_userId_exists();
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_user.addEventHandler("onrowposchanged", this.checkSaveMode, this);
            this.addEventHandler("ontimer", this.form_ontimer, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.Button34.addEventHandler("onclick", this.clearUserPassword, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.vkgrp.addEventHandler("oneditclick", this.vkgrp_oneditclick, this);
            this.userId.addEventHandler("onkillfocus", this.userId_onkillfocus, this);
            this.Edit01.addEventHandler("oneditclick", this.Edit01_oneditclick, this);
            this.lastPwDt.addEventHandler("oneditclick", this.lastPwDt_oneditclick, this);
            this.Button01.addEventHandler("onclick", this.fn_userId_exists, this);
            this.Button02.addEventHandler("onclick", this.showVkgrp, this);
            this.Button03.addEventHandler("onclick", this.showVkbur, this);
            this.userGrp.addEventHandler("onitemchanged", this.div_search00_userGrp_onitemchanged, this);

        };

        this.loadIncludeScript("RTCMUser.xfdl");

       
    };
}
)();

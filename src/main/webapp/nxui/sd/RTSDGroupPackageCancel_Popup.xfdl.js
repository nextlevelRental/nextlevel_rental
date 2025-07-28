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
                this.set_titletext("단체(묶음)해지팝업");
                this.set_scrollbars("none");
                this._setFormPosition(0,0,1144,575);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("comGrp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdDesc\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/><Column id=\"cd\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_yn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">판매중</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">판매중지</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_dcYn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">할부</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">할부불가</Col></Row></Rows>");
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
            obj._setContents("<ColumnInfo><Column id=\"grpNo\" type=\"STRING\" size=\"0\"/><Column id=\"grpNm\" type=\"STRING\" size=\"0\"/><Column id=\"grpSt\" type=\"STRING\" size=\"0\"/><Column id=\"minAgrCnt\" type=\"STRING\" size=\"0\"/><Column id=\"restCnt\" type=\"STRING\" size=\"0\"/><Column id=\"grpType\" type=\"STRING\" size=\"0\"/><Column id=\"regId\" type=\"STRING\" size=\"0\"/><Column id=\"regDt\" type=\"STRING\" size=\"0\"/><Column id=\"chgId\" type=\"STRING\" size=\"0\"/><Column id=\"chgDt\" type=\"STRING\" size=\"0\"/><Column id=\"grpDcRate\" type=\"STRING\" size=\"0\"/><Column id=\"grpDcAmt\" type=\"STRING\" size=\"0\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"pkgDcYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("comType", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cdDesc\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/><Column id=\"cd\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_ordNoList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderNm\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carKind\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"grpType\" type=\"STRING\" size=\"256\"/><Column id=\"dcGb\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_ordNoListChk", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderNm\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carKind\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"grpType\" type=\"STRING\" size=\"256\"/><Column id=\"dcGb\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_ordNoListChk00", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderNm\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carKind\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"custTp\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"dcCd\" type=\"STRING\" size=\"256\"/><Column id=\"grpType\" type=\"STRING\" size=\"256\"/><Column id=\"dcGb\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("st_BG", "absolute", "20", "2", null, "40", "4", null, this);
            obj.set_cssclass("sta_WF_SearchBox");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "10", "2", "1125", "45", null, null, this);
            obj.set_taborder("19");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "25", "12", "80", "20", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("단체번호");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "885", "12", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "0", "33", "885", "12", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("edt_grpNo", "absolute", "119", "10", "124", "21", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_enable("false");
            obj.set_maxlength("100");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, "9", "45", "22", "20", null, this.div_search);
            obj.set_taborder("25");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_cancel", "absolute", null, "9", "45", "22", "68", null, this.div_search);
            obj.set_taborder("26");
            obj.set_text("해지");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "63", "89", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("단체정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "10", "2", "33", "45", null, null, this);
            obj.set_taborder("27");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "255", "2", "33", "44", null, null, this);
            obj.set_taborder("28");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "10", "47", "869", "20", null, null, this);
            obj.set_taborder("128");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "10", "77", "869", "10", null, null, this);
            obj.set_taborder("129");
            obj.set_text("Static02");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "1086", "538", "49", "21", null, null, this);
            obj.set_taborder("134");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "8", "85", "1127", "61", null, null, this);
            obj.set_taborder("135");
            obj.set_binddataset("dsList");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_selecttype("row");
            obj.set_scrollbars("none");
            obj.set_useselcolor("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"140\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"단체명\"/><Cell col=\"1\" text=\"단체번호\"/><Cell col=\"2\" text=\"단체유형\"/><Cell col=\"3\" text=\"단체상태\"/><Cell col=\"4\" text=\"최소약정본수\"/><Cell col=\"5\" text=\"현재단체계약본수\"/><Cell col=\"6\" text=\"단체할인율\"/><Cell col=\"7\" text=\"단체할인금액\"/></Band><Band id=\"body\"><Cell edittype=\"none\" style=\"align:left;\" text=\"bind:grpNm\"/><Cell col=\"1\" edittype=\"none\" style=\"align:center;\" text=\"bind:grpNo\"/><Cell col=\"2\" displaytype=\"combo\" text=\"bind:grpType\" combodataset=\"comType\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"3\" displaytype=\"combo\" style=\"align:center;\" text=\"bind:grpSt\" combodataset=\"comGrp\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"4\" displaytype=\"number\" edittype=\"none\" style=\"align:right;\" text=\"bind:minAgrCnt\" mask=\"###,###,###,##0\"/><Cell col=\"5\" displaytype=\"number\" edittype=\"none\" style=\"align:right;\" text=\"bind:restCnt\" mask=\"###,###,###,##0\"/><Cell col=\"6\" displaytype=\"number\" edittype=\"none\" style=\"align:right;\" text=\"bind:grpDcRate\" mask=\"##0.0%\"/><Cell col=\"7\" displaytype=\"number\" edittype=\"none\" style=\"align:right;\" text=\"bind:grpDcAmt\" mask=\"###,###,###,##0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_ordNoList", "absolute", "8", "172", "1127", "199", null, null, this);
            obj.set_taborder("136");
            obj.set_binddataset("ds_ordNoList");
            obj.set_cellsizingtype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"30\"/><Column size=\"80\"/><Column size=\"85\"/><Column size=\"80\"/><Column size=\"75\"/><Column size=\"85\"/><Column size=\"80\"/><Column size=\"40\"/><Column size=\"60\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"0\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"65\"/><Column size=\"55\"/><Column size=\"60\"/><Column size=\"84\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" text=\"계약일자\"/><Cell col=\"2\" text=\"계약번호\"/><Cell col=\"3\" text=\"고객코드\"/><Cell col=\"4\" text=\"법정생년월일\"/><Cell col=\"5\" text=\"사업자번호\"/><Cell col=\"6\" text=\"고객명\"/><Cell col=\"7\" text=\"성별\"/><Cell col=\"8\" text=\"내외국인\"/><Cell col=\"9\" text=\"핸드폰\"/><Cell col=\"10\" text=\"핸드폰\"/><Cell col=\"11\" text=\"전화번호\"/><Cell col=\"12\" text=\"전화번호\"/><Cell col=\"13\" text=\"회사전화\"/><Cell col=\"14\" text=\"전화번호2\"/><Cell col=\"15\" text=\"주소\"/><Cell col=\"16\" text=\"차량번호\"/><Cell col=\"17\" text=\"차종\"/><Cell col=\"18\" text=\"계약상태\"/><Cell col=\"19\" text=\"채널\"/><Cell col=\"20\" text=\"홈쇼핑\"/><Cell col=\"21\" text=\"월렌탈료\"/><Cell col=\"22\" text=\"단체번호\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" displaytype=\"date\" text=\"bind:ordDay\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"3\" text=\"bind:custNo\"/><Cell col=\"4\" displaytype=\"normal\" text=\"bind:birthDay\" mask=\"####-'**'-'**'\"/><Cell col=\"5\" displaytype=\"normal\" text=\"bind:buslNo\" mask=\"###-##-#####\"/><Cell col=\"6\" text=\"bind:custNm\"/><Cell col=\"7\" text=\"bind:genderNm\"/><Cell col=\"8\" text=\"bind:lfNm\"/><Cell col=\"9\" text=\"bind:mobNo\" expr=\"expr:FN_numberMaskReturn(mobNo)\"/><Cell col=\"10\" text=\"bind:mobNo\"/><Cell col=\"11\" text=\"bind:telNo\" expr=\"expr:FN_numberMaskReturn(telNo)\"/><Cell col=\"12\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\"/><Cell col=\"13\" text=\"bind:telNo2\" expr=\"expr:FN_numberMaskReturn(telNo2)\"/><Cell col=\"14\" text=\"bind:telNo2\" expr=\"expr:FN_numberHyphenInReturn(telNo2)\"/><Cell col=\"15\" text=\"bind:addr\"/><Cell col=\"16\" text=\"bind:carNo\"/><Cell col=\"17\" text=\"bind:carKind\"/><Cell col=\"18\" text=\"bind:statNm\"/><Cell col=\"19\" text=\"bind:chanNm\"/><Cell col=\"20\" text=\"bind:hshopGbNm\"/><Cell col=\"21\" displaytype=\"number\" style=\"align:right;\" text=\"bind:monAmt\"/><Cell col=\"22\" text=\"bind:grpNo\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "10", "152", "89", "20", null, null, this);
            obj.set_taborder("137");
            obj.set_text("계약정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Div("div_ordNoDetail", "absolute", "10", "376", null, "156", "4", null, this);
            obj.set_taborder("138");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "30", "1125", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("102");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "90", "1125", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("103");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "60", "1125", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("104");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "120", "1125", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("106");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0", "0", "1125", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("107");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new MaskEdit("ed_birthDay", "absolute", "155", "35", "200", "21", null, null, this.div_ordNoDetail);
            obj.set_taborder("108");
            obj.set_type("string");
            obj.set_mask("####-##-##");
            obj.set_enable("false");
            obj.style.setStyleValue("align", "disabled", "left middle");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_birthDay", "absolute", "0", "30", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("109");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("Static34", "absolute", "10", "433", "281", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("110");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "876", "5", "240", "20", null, null, this.div_ordNoDetail);
            obj.set_taborder("115");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_custNo", "absolute", "721", "0", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("116");
            obj.set_text("고객코드");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_genderNm", "absolute", "876", "35", "240", "20", null, null, this.div_ordNoDetail);
            obj.set_taborder("117");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_genderNm", "absolute", "721", "30", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("118");
            obj.set_text("성별");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_lfNm", "absolute", "876", "65", "240", "20", null, null, this.div_ordNoDetail);
            obj.set_taborder("119");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_lfNm", "absolute", "721", "60", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("120");
            obj.set_text("내외국인");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_telNo2", "absolute", "876", "95", "240", "20", null, null, this.div_ordNoDetail);
            obj.set_taborder("121");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_telNo2", "absolute", "721", "90", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("122");
            obj.set_text("회사번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_addr", "absolute", "516", "125", "600", "21", null, null, this.div_ordNoDetail);
            obj.set_taborder("123");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_telNo", "absolute", "516", "95", "200", "20", null, null, this.div_ordNoDetail);
            obj.set_taborder("124");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_telNo", "absolute", "360", "90", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("125");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_addr", "absolute", "360", "120", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("126");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_ordNo", "absolute", "360", "0", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("127");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "516", "5", "200", "20", null, null, this.div_ordNoDetail);
            obj.set_taborder("128");
            obj.set_readonly("true");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "516", "35", "200", "20", null, null, this.div_ordNoDetail);
            obj.set_taborder("129");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_carKind", "absolute", "516", "65", "200", "20", null, null, this.div_ordNoDetail);
            obj.set_taborder("130");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_carKind", "absolute", "360", "60", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("131");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_custNm", "absolute", "360", "30", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("132");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_statNm", "absolute", "155", "125", "200", "21", null, null, this.div_ordNoDetail);
            obj.set_taborder("134");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_mobNo", "absolute", "155", "95", "200", "21", null, null, this.div_ordNoDetail);
            obj.set_taborder("135");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Edit("ed_carNo", "absolute", "155", "65", "200", "21", null, null, this.div_ordNoDetail);
            obj.set_taborder("136");
            obj.set_enable("false");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_carNo", "absolute", "0", "60", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("137");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_mobNo", "absolute", "0", "90", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("138");
            obj.set_text("핸드폰");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_statNm", "absolute", "0", "120", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("139");
            obj.set_text("계약상태");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Calendar("cal__ordDay", "absolute", "154", "4", "200", "21", null, null, this.div_ordNoDetail);
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj.set_taborder("141");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_cssclass("readonly");
            obj.set_enable("false");
            obj.set_value("null");
            obj = new Static("st_ordDay", "absolute", "0", "0", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("142");
            obj.set_text("계약일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new Static("st_buslNo", "absolute", "0", "30", "150", "31", null, null, this.div_ordNoDetail);
            obj.set_taborder("143");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_ordNoDetail.addChild(obj.name, obj);
            obj = new MaskEdit("ed_buslNo", "absolute", "155", "35", "200", "21", null, null, this.div_ordNoDetail);
            obj.set_taborder("144");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            obj.set_enable("false");
            obj.set_visible("false");
            obj.style.setStyleValue("align", "disabled", "left middle");
            this.div_ordNoDetail.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1125, 45, this.div_search,
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
            obj = new Layout("default", "", 0, 156, this.div_ordNoDetail,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("138");
            		p.set_scrollbars("none");

            	}
            );
            this.div_ordNoDetail.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1144, 575, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("단체(묶음)해지팝업");
            		p.set_scrollbars("none");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","div_ordNoDetail.cal__ordDay","value","ds_ordNoList","ordDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_ordNoDetail.ed_ordNo","value","ds_ordNoList","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_ordNoDetail.ed_custNo","value","ds_ordNoList","custNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","div_ordNoDetail.ed_custNm","value","ds_ordNoList","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_ordNoDetail.ed_genderNm","value","ds_ordNoList","genderNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","div_ordNoDetail.ed_carNo","value","ds_ordNoList","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","div_ordNoDetail.ed_carKind","value","ds_ordNoList","carKind");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","div_ordNoDetail.ed_lfNm","value","ds_ordNoList","lfNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","div_ordNoDetail.ed_mobNo","value","ds_ordNoList","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","div_ordNoDetail.ed_telNo","value","ds_ordNoList","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","div_ordNoDetail.ed_telNo2","value","ds_ordNoList","telNo2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","div_ordNoDetail.ed_statNm","value","ds_ordNoList","statNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","div_ordNoDetail.ed_addr","value","ds_ordNoList","addr");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_ordNoDetail.ed_buslNo","value","ds_ordNoList","buslNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","div_ordNoDetail.ed_birthDay","value","ds_ordNoList","birthDay");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDGroupPackageCancel_Popup.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDGroupPackageCancel_Popup.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 단체(묶음)해지 팝업
         * 02. 그룹명   : 주문관리
         * 03. 그룹설명 :
         * 04. 작성일   : 2018.10.23
         * 05. 작성자   : Sean
         * 06. 수정이력 :
         * 07. Parameter  
         *		(1) Input: p_argGrpNo(단체번호)
         *		(2) Output: ds_ordNoList
         * 08. 설명:
         * 		(1) 재사용
         * 			① 단체정보: 기존소스 호출 - RTSDGroupRegister.xfdl와 해당서비스
         * 			② 계약정보: 기존소스 호출 - RTCOMMOrderNo_pop.xfdl와 해당서비스 이용
         * 		(2) 공통코드
         * 			① S202: 단체상태
         * 				N - 정상
         * 				C - 해지
         * 			② S204: 단체유형
         * 				D - 단체계약
         * 				F - 패키지계약 
         *		(3) [해지] Flow
         *			① RTSD0105: 계약이력 Insert multi rows. (key: ord_no)
         *			② RTSD0031: Update 잔여계약
         *			③ RTSD0104: Update 월렌탈료, 단체번호(null)
         *			④ RTSD0040: 사용여부('N'), 기준종료일: 현재일자
         *			⑤ RTSD0032: Update 단체해지일: 현재일자
         *			⑥ RTSD0031: Update 단체상태, 단체할인율, 단체할인금액
         *			⑦ 청구스케쥴: ToDo(공통 개발 예정)
         *			패키지는 최소약정본수가 없으므로 0건을 기준으로 함
         ***********************************************************************
         *     수정일     작성자   내용
         ***********************************************************************
         * 완료 - ToDo.1. 계약정보조회 팝업의 div를 사용하되, 개인과 사업자가 동시에 조회될 수 있으므로 정적인 화면으로 변경
         ***********************************************************************
         */

        /***********************************************************************************
         * 1. Script Include 
         ***********************************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************************
         * 2. FORM 변수 선언 영역
        ***********************************************************************************/
        	//팝업에서 전달받은 변수 저장
        	var fv_grpNo = this.parent.p_argGrpNo; 

        /***********************************************************************************
         * 3. Common Events and Functions
        ***********************************************************************************/
        	this.form_onload = function(obj,e)
        	{
        		Ex.core.init(obj);

        		//trace("fv_grpNo = " + fv_grpNo);

        		if(fv_grpNo == "" || fv_grpNo == null || fv_grpNo.length == 0){
        			alert("단체번호가 없습니다.");
        			this.close(); 
        		}else{
        			this.div_search.edt_grpNo.set_value(fv_grpNo);					
        			this.listCommInfo(); //공통코드 조회(S202: 단체상태, S204: 단체유형)
        		}
        	} 
        	 
        /***********************************************************************************
        * 4. Transaction Functions
        ***********************************************************************************/
        	//----------------------------------------------------------------------------------
        	// Search: 단체
        	//----------------------------------------------------------------------------------
        	this.fn_search = function()
        	{
        		this.dsList.clearData();
        		var sSvcID        	= "listGroupInfo";                    
        		var sController   	= "/rtms/sd/listAddGroupInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsList=ds_output";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs 			+= Ex.util.setParam("grpNo",   nvl(this.div_search.edt_grpNo.value));
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        	
        	//----------------------------------------------------------------------------------
        	// Search: 계약
        	//----------------------------------------------------------------------------------	
        	this.fn_searchContract = function(){
        		var sSvcID        	= "ordNoList";                    
        		var sController   	= "rtms/comm/ordNoList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_ordNoList=ordNoMap";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        			sArgs 			+= Ex.util.setParam("grpNo",   nvl(this.div_search.edt_grpNo.value));
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        	//----------------------------------------------------------------------------------
        	// Cancel: 해지
        	//----------------------------------------------------------------------------------
        	this.fn_cancel = function()
        	{
        		if(!this.fn_cancelValidation())
        		{
        			return false;
        		}
        				
        		if( confirm( "해지하시겠습니까?"))
        		{
        			this.ds_ordNoListChk.clearData();
        			this.ds_ordNoListChk.copyData(this.ds_ordNoList);
        			this.ds_ordNoListChk.addColumn("grpType", "string");			
        			var nRow = this.ds_ordNoListChk.rowcount;
        			var sGrpType = this.dsList.getColumn(0, "grpType"); //단체유형
        			var nRestCnt = nexacro.toNumber(this.dsList.getColumn(0, "restCnt")); //잔여계약수
        			var nCntCd = 0; //선택한 타이어본수의 합
        			var nCntSum = 0;

        			if(sGrpType == "D") //단체
        			{			
        			this.ds_ordNoListChk.clearData();
        			this.ds_ordNoListChk00.clearData();
        			var nListCnt = this.ds_ordNoList.getRowCount();
        			for(var i=0;i<this.ds_ordNoList.getRowCount();i++){
        				if(this.ds_ordNoList.getColumn(i,"chk")==1){
        					this.ds_ordNoListChk.copyRow(this.ds_ordNoListChk.addRow(),this.ds_ordNoList,i);
        					if(this.ds_ordNoList.getColumn(i,"statCd") == '01' || this.ds_ordNoList.getColumn(i,"statCd") == '03' || this.ds_ordNoList.getColumn(i,"statCd") == '04'){
        						var sCntCd = this.ds_ordNoList.getColumn(i,"cntCd");
        						nCntCd = nCntCd + nexacro.toNumber(sCntCd.substr(1));
        					}
        				}else{
        					this.ds_ordNoListChk00.copyRow(this.ds_ordNoListChk00.addRow(),this.ds_ordNoList,i);				}
        			}
        			nCntSum = nRestCnt - nCntCd;
        		}
        			if(nCntSum < nRestCnt){
        				this.fn_cancelGroup2();
        			}else{
        			this.fn_cancelGroup();
        			}			
        		}
        	}
        	//----------------------------------------------------------------------------------
        	// Cancel: 해지:Step1
        	//----------------------------------------------------------------------------------

        	this.fn_cancelGroup = function(){
        	for(var i=0;i<this.ds_ordNoListChk.getRowCount();i++){
        		this.ds_ordNoListChk.setColumn(i,"grpType","D");
        		this.ds_ordNoListChk.setColumn(i,"dcGb","Z");
        	}
        	
        		var sSvcID        	= "cancelOrdNo";
        		var sController   	= "/rtms/sd/cancelOrdNo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		sInDatasets   		+= "input=ds_ordNoListChk";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        					
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);					
        	}
        	//----------------------------------------------------------------------------------
        	// Cancel: 해지:Step2
        	//----------------------------------------------------------------------------------
        	
        	this.fn_cancelGroup2= function(){

        	for(var i=0;i<this.ds_ordNoListChk.getRowCount();i++){
        		this.ds_ordNoListChk.setColumn(i,"grpType","D");
        		this.ds_ordNoListChk.setColumn(i,"dcGb","Z");
        	}
        	for(var i=0;i<this.ds_ordNoListChk00.getRowCount();i++){
        		this.ds_ordNoListChk00.setColumn(i,"grpType","D");
        		this.ds_ordNoListChk00.setColumn(i,"dcGb","Z");
        	}
        		var sSvcID        	= "cancelOrdNo2";
        		var sController   	= "/rtms/sd/cancelOrdNo2.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		sInDatasets   		+= "dsOrdNolistChk=ds_ordNoListChk:A";
        		sInDatasets   		+= "dsOrdNolistChk00=ds_ordNoListChk00:A";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        					
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);					
        	}		

        //공통
        	this.listCommInfo = function()
        	{
        		var sSvcID        	= "listCommInfo";                    
        		var sController   	= "/rtms/sd/listAddGroupCommInfo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "comGrp=com_grp comType=com_type";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        	
        	
        /***********************************************************************************
        * 5. CallBack Functions
        ***********************************************************************************/	
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/

        	/* callBack함수 */
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        	{ 
        		if (nErrorCode < 0) {
        			alert(strErrorMsg);		
        		}
        		
        		if (strSvcId == "listCommInfo") { //공통코드
        			this.fn_search();
        		}else if (strSvcId == "listGroupInfo") { //단체정보 조회
        			var nRow = this.dsList.rowcount;
        			if( nRow < 1 ){
        				alert("조회된 데이터가 없습니다.");
        			}else{				
        				this.fn_searchContract(); //계약정보
        			}
        		}else if( strSvcId == "ordNoList"){	//계약정보 조회
        			var nRow = this.ds_ordNoList.rowcount;
        			if( nRow > 0 ){
        				//this.fn_changeComponent(this.ds_ordNoList.getColumn(this.ds_ordNoList.rowposition, "custTp"));//고객유형(S024)별 Componenet변경
        				for(var i=0; i<this.ds_ordNoList.rowcount; i++){
        					//trace("setColumn :: " + this.ds_ordNoList.setColumn(i, "chk", 0));
        				}
        			}
        		}else if( strSvcId == "cancelOrdNo"){	//해지
        			alert(strErrorMsg);
        			this.fn_search();	
        		}else if( strSvcId == "cancelOrdNo2"){	//해지
        			alert(strErrorMsg);
        			this.fn_search();		
        		}
        	}

        /***********************************************************************************
         * 6. User Functions
        ***********************************************************************************/
        /***********************************************************************************
        * Component Event
        ***********************************************************************************/
        	//=======================================
        	//검색 시 Enter키 이벤트 처리
        	//=======================================
        	this.div_search_edt_prodNm_onkeyup = function(obj,e)
        	{
        		if ( e.keycode == 13 ){
        			this.fn_search();
        		}
        	}
        	
        	//----------------------------------------------------------------------------------
        	// Add
        	//----------------------------------------------------------------------------------
        	this.fn_add = function() {
        		var row = this.dsPrice.addRow();
        		
         		this.dsPrice.setColumn(row, "dcAmt", 0);
         		this.dsPrice.setColumn(row, "gdsGb", "2");
        	}

        	//----------------------------------------------------------------------------------
        	// Excel
        	//----------------------------------------------------------------------------------
        	this.fn_excel= function() {
        		Ex.core.exportExcel(this, this.Grid01);
        	}

        	//----------------------------------------------------------------------------------
        	// 칼럼변경시
        	//----------------------------------------------------------------------------------
        	this.dsPrice_oncolumnchanged = function(obj,e)
        	{
        		var sColId = e.columnid;
        		var nRow = e.row;
        				
        		if(sColId == "dcAmt"){		//할인금액		
        			obj.setColumn(nRow, "actAmt", nvl(obj.getColumn(nRow, "amt"), 0) - nvl( obj.getColumn(nRow, "dcAmt"), 0));
        		}else if(sColId == "amt"){	//금액
        			obj.setColumn(nRow, "actAmt", nvl(obj.getColumn(nRow, "amt"), 0) - nvl( obj.getColumn(nRow, "dcAmt"), 0));
        		}
        	}
        	
        	//----------------------------------------------------------------------------------
        	// Cancel Validation
        	//----------------------------------------------------------------------------------
        	this.fn_cancelValidation = function() {
        		if(this.ds_ordNoList.getCaseCount("chk == 1") < 1 ) {
        			alert("해지할 계약을 체크해주세요");
        			return false;
        		}
        		return true;
        	}	

        	//----------------------------------------------------------------------------------
        	// 선택
        	//----------------------------------------------------------------------------------
        	this.grid_ordNoList_oncelldblclick = function(obj,e)
        	{

        	}

        	this.fn_select = function()
        	{
        		var nRow = this.ds_ordNoList.rowposition;
        		if(nRow < 0) return false;
        		
        		this.ds_ordNoListCp.clearData();
        		this.ds_ordNoListCp.addRow();
        		
        		this.ds_ordNoListCp.copyRow(0, this.ds_ordNoList, this.ds_ordNoList.rowposition);
        		var arr = [this.ds_ordNoListCp];
        		this.close(this.opener._setReturnGroupContract(arr));
        	}

        	//----------------------------------------------------------------------------------
        	// 닫기
        	//----------------------------------------------------------------------------------
        	this.btn_close_onclick = function(obj,e)
        	{
        		this.close(this.opener.fn_searchContract());
        	}

        	//----------------------------------------------------------------------------------
        	// 고객유형(S024)별 Componenet변경: 01 - 개인, 02 - 사업자
        	//----------------------------------------------------------------------------------	
        	this.fn_changeComponent = function(custTpVal){
        		//this.ds_ordNoList.clearData();
        		if( custTpVal == "01" ){
        			this.div_ordNoDetail.st_buslNo.set_visible(false);
        			this.div_ordNoDetail.ed_buslNo.set_visible(false);
        			
        			this.div_ordNoDetail.st_birthDay.set_visible(true);
        			this.div_ordNoDetail.ed_birthDay.set_visible(true);
        			
        			this.div_ordNoDetail.st_genderNm.set_visible(true);
        			this.div_ordNoDetail.ed_genderNm.set_visible(true);
        			
        			this.div_ordNoDetail.st_lfNm.set_visible(true);
        			this.div_ordNoDetail.ed_lfNm.set_visible(true);
        			
        			this.div_ordNoDetail.st_telNo2.set_text("전화번호2");
        			
        // 			this.grid_ordNoList.setRealColSize( 3, 100 );//법정생년월일
        // 			this.grid_ordNoList.setRealColSize( 4, 0 );//사업자번호
        // 			this.grid_ordNoList.setRealColSize( 6, 100 );//성별
        // 			this.grid_ordNoList.setRealColSize( 7, 100 );//내외국인			
        // 			this.grid_ordNoList.setCellProperty("head", 12, "text", "전화번호2");
        		}else if( custTpVal == "02" ){
        			this.div_ordNoDetail.st_buslNo.set_visible(true);
        			this.div_ordNoDetail.ed_buslNo.set_visible(true);
        			
        			this.div_ordNoDetail.st_birthDay.set_visible(false);
        			this.div_ordNoDetail.ed_birthDay.set_visible(false);
        			
        			this.div_ordNoDetail.st_genderNm.set_visible(false);
        			this.div_ordNoDetail.ed_genderNm.set_visible(false);
        			
        			this.div_ordNoDetail.st_lfNm.set_visible(false);
        			this.div_ordNoDetail.ed_lfNm.set_visible(false);
        			
        			this.div_ordNoDetail.st_telNo2.set_text("회사전화");
        			
        // 			this.grid_ordNoList.setRealColSize( 3, 0 );//법정생년월일
        // 			this.grid_ordNoList.setRealColSize( 4, 100 );//사업자번호
        // 			this.grid_ordNoList.setRealColSize( 6, 0 );//성별
        // 			this.grid_ordNoList.setRealColSize( 7, 0 );//내외국인
        // 			this.grid_ordNoList.setCellProperty("head", 12, "text", "회사전화");
        		}else{
        			return false;
        		}
        	}

        	//----------------------------------------------------------------------------------
        	//Rowposition변경시
        	//----------------------------------------------------------------------------------
        	this.Dataset_onrowposchanged = function(obj,e)
        	{
        		this.fn_changeComponent(this.ds_ordNoList.getColumn(this.ds_ordNoList.rowposition, "custTp"));//고객유형(S024)별 Componenet변경	
        	}

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.dsList.addEventHandler("oncolumnchanged", this.dsPrice_oncolumnchanged, this);
            this.ds_ordNoList.addEventHandler("onrowposchanged", this.Dataset_onrowposchanged, this);
            this.ds_ordNoListChk.addEventHandler("onrowposchanged", this.Dataset_onrowposchanged, this);
            this.ds_ordNoListChk00.addEventHandler("onrowposchanged", this.Dataset_onrowposchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.div_search.edt_grpNo.addEventHandler("onkeyup", this.div_search_edt_prodNm_onkeyup, this);
            this.div_search.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.div_search.btn_cancel.addEventHandler("onclick", this.fn_cancel, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.Grid01.addEventHandler("oncellclick", this.Grid01_oncellclick, this);
            this.div_ordNoDetail.ed_custNo.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_genderNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_lfNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_telNo2.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_addr.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_telNo.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_ordNo.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_custNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_carKind.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_statNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_mobNo.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_ordNoDetail.ed_carNo.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);

        };

        this.loadIncludeScript("RTSDGroupPackageCancel_Popup.xfdl");

       
    };
}
)();

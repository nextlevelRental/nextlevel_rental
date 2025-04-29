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
                this.set_name("RTSDAgency");
                this.set_classname("Authority");
                this.set_titletext("대리점정보관리");
                this._setFormPosition(0,0,1147,585);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsAgency", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroup\" type=\"STRING\" size=\"256\"/><Column id=\"salesGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"salesOffice\" type=\"STRING\" size=\"256\"/><Column id=\"salesOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"street\" type=\"STRING\" size=\"256\"/><Column id=\"sidoCd\" type=\"STRING\" size=\"256\"/><Column id=\"sigunCd\" type=\"STRING\" size=\"256\"/><Column id=\"serNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"faxNo\" type=\"STRING\" size=\"256\"/><Column id=\"taxNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"rentalYn\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"posX\" type=\"STRING\" size=\"256\"/><Column id=\"posY\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"seasonGbn\" type=\"STRING\" size=\"256\"/><Column id=\"lmYn\" type=\"STRING\" size=\"256\"/><Column id=\"fmYn\" type=\"STRING\" size=\"256\"/><Column id=\"cwYn\" type=\"STRING\" size=\"256\"/><Column id=\"olimitCnt\" type=\"STRING\" size=\"256\"/><Column id=\"lifnr\" type=\"STRING\" size=\"256\"/><Column id=\"taxRqcd\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"opYn\" type=\"STRING\" size=\"256\"/><Column id=\"memo\" type=\"STRING\" size=\"256\"/><Column id=\"desorptCd\" type=\"STRING\" size=\"256\"/><Column id=\"desorptNm\" type=\"STRING\" size=\"256\"/><Column id=\"alignCd\" type=\"STRING\" size=\"256\"/><Column id=\"alignNm\" type=\"STRING\" size=\"256\"/><Column id=\"balanceCd\" type=\"STRING\" size=\"256\"/><Column id=\"balanceNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroup\" type=\"STRING\" size=\"256\"/><Column id=\"rentalGroupNm\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOffice\" type=\"STRING\" size=\"256\"/><Column id=\"rentalOfficeNm\" type=\"STRING\" size=\"256\"/><Column id=\"prplYn\" type=\"STRING\" size=\"256\"/><Column id=\"apfdEndYn\" type=\"STRING\" size=\"256\"/><Column id=\"chainYn\" type=\"STRING\" size=\"256\"/><Column id=\"rntMstId\" type=\"STRING\" size=\"256\"/><Column id=\"rntMstNm\" type=\"STRING\" size=\"256\"/><Column id=\"rntMstMob\" type=\"STRING\" size=\"256\"/><Column id=\"egolNchrgChkYn\" type=\"STRING\" size=\"256\"/><Column id=\"bkpdNchrgChkYn\" type=\"STRING\" size=\"256\"/><Column id=\"washerNchrgPayYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsUseYn", this);
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

            obj = new Dataset("dsSeason", this);
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

            obj = new Dataset("dsTaxRqCd", this);
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

            obj = new Dataset("dsDesorptCd", this);
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

            obj = new Dataset("dsAlignCd", this);
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

            obj = new Dataset("dsBalanceCd", this);
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

            obj = new Dataset("dsEgolNchrgChkYn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsBkpdNchrgChkYn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsWasherNchrgPayYn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"string\" size=\"32\"/><Column id=\"cdNm\" type=\"string\" size=\"32\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsPrplYn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">Y</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">N</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsYn", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">예</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">아니오</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_controlAuth", this);
            obj._setContents("<ColumnInfo><Column id=\"mdlCd\" type=\"STRING\" size=\"256\"/><Column id=\"prgmCd\" type=\"STRING\" size=\"256\"/><Column id=\"controlId\" type=\"STRING\" size=\"256\"/><Column id=\"userGrp\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"typeCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static56", "absolute", "748", "146", null, "31", "25", null, this);
            obj.set_taborder("108");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static57", "absolute", "748", "176", null, "31", "25", null, this);
            obj.set_taborder("109");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static55", "absolute", "748", "86", null, "31", "25", null, this);
            obj.set_taborder("107");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "86", "1122", "31", null, null, this);
            obj.set_taborder("50");
            obj.set_cssclass("sta_WF_detailLabel2");
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
            obj = new Static("st_searchCondition", "absolute", "20", "10", "64", "21", null, null, this.div_search);
            obj.set_taborder("15");
            obj.set_text("대리점");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("agencyCd", "absolute", "96", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btn_save00", "absolute", "234", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("21");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("agencyNm", "absolute", "255", "10", "276", "21", null, null, this.div_search);
            obj.set_taborder("22");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1118", "10", null, null, this.div_search);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "31", "1117", "10", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "61", "81", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("변경할 내용");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "45", "1147", "20", null, null, this);
            obj.set_taborder("29");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("#ff9197ff");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "522", null, null, this);
            obj.set_taborder("30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "76", "1147", "10", null, null, this);
            obj.set_taborder("31");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("#ff9197ff");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "374", "86", "130", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_text("지사");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "748", "86", "130", "31", null, null, this);
            obj.set_taborder("43");
            obj.set_text("지점");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "0", "86", "149", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_text("대리점명");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "0", "146", "1122", "31", null, null, this);
            obj.set_taborder("51");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("faxNo", "absolute", "882", "151", "235", "21", null, null, this);
            obj.set_taborder("52");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "748", "146", "130", "31", null, null, this);
            obj.set_taborder("53");
            obj.set_text("FAX번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "374", "146", "130", "31", null, null, this);
            obj.set_taborder("55");
            obj.set_text("휴대폰번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "0", "146", "149", "31", null, null, this);
            obj.set_taborder("57");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "0", "176", "1122", "31", null, null, this);
            obj.set_taborder("58");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "374", "176", "130", "31", null, null, this);
            obj.set_taborder("62");
            obj.set_text("대표명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "0", "176", "149", "31", null, null, this);
            obj.set_taborder("64");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static50", "absolute", "51.96%", "41", null, "21", "43.94%", null, this);
            obj.set_taborder("99");
            obj.set_visible("false");
            obj.style.set_color("red");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "748", "176", "130", "31", null, null, this);
            obj.set_taborder("115");
            obj.set_text("렌탈시작일");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "748", "206", null, "31", "25", null, this);
            obj.set_taborder("117");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "206", "1122", "31", null, null, this);
            obj.set_taborder("118");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "374", "206", "130", "31", null, null, this);
            obj.set_taborder("119");
            obj.set_text("업태");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "0", "206", "149", "31", null, null, this);
            obj.set_taborder("120");
            obj.set_text("업종");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "748", "206", "130", "31", null, null, this);
            obj.set_taborder("123");
            obj.set_text("렌탈종료일");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "748", "236", null, "31", "25", null, this);
            obj.set_taborder("125");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "0", "236", "1122", "31", null, null, this);
            obj.set_taborder("126");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "0", "236", "149", "31", null, null, this);
            obj.set_taborder("128");
            obj.set_text("대리점주소");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static28", "absolute", "748", "236", "130", "31", null, null, this);
            obj.set_taborder("131");
            obj.set_text("렌탈대리점여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static29", "absolute", "748", "266", null, "31", "25", null, this);
            obj.set_taborder("133");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static30", "absolute", "0", "266", "1122", "31", null, null, this);
            obj.set_taborder("134");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static36", "absolute", "374", "266", "130", "31", null, null, this);
            obj.set_taborder("135");
            obj.set_text("Y좌표");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static37", "absolute", "0", "266", "149", "31", null, null, this);
            obj.set_taborder("136");
            obj.set_text("X좌표");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Static("Static38", "absolute", "748", "266", "130", "31", null, null, this);
            obj.set_taborder("139");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static39", "absolute", "748", "296", null, "31", "25", null, this);
            obj.set_taborder("141");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static40", "absolute", "0", "296", "1122", "31", null, null, this);
            obj.set_taborder("142");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static41", "absolute", "374", "296", "130", "31", null, null, this);
            obj.set_taborder("143");
            obj.set_text("경정비");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static42", "absolute", "0", "296", "149", "31", null, null, this);
            obj.set_taborder("144");
            obj.set_text("계절구분");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Combo("seasonGbn", "absolute", "155", "301", "214", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("145");
            obj.set_displayrowcount("5");
            obj.set_enable("false");
            obj.set_innerdataset("@dsSeason");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Combo("lmYn", "absolute", "508", "301", "236", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("146");
            obj.set_displayrowcount("5");
            obj.set_enable("true");
            obj.set_innerdataset("@dsUseYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Static("Static43", "absolute", "748", "296", "130", "31", null, null, this);
            obj.set_taborder("147");
            obj.set_text("수입차정비");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static51", "absolute", "748", "326", null, "31", "25", null, this);
            obj.set_taborder("149");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static52", "absolute", "0", "326", "1122", "31", null, null, this);
            obj.set_taborder("150");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static53", "absolute", "374", "326", "130", "31", null, null, this);
            obj.set_taborder("151");
            obj.set_text("추천장착점");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static54", "absolute", "0", "326", "149", "31", null, null, this);
            obj.set_taborder("152");
            obj.set_text("세차가능");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Combo("cwYn", "absolute", "155", "331", "214", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("153");
            obj.set_innerdataset("@dsUseYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_enable("true");

            obj = new Combo("chYn", "absolute", "508", "331", "236", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("154");
            obj.set_displayrowcount("5");
            obj.set_enable("true");
            obj.set_innerdataset("@dsUseYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Static("Static58", "absolute", "748", "326", "130", "31", null, null, this);
            obj.set_taborder("155");
            obj.set_text("일 주문제한");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("olimitCnt", "absolute", "882", "331", "235", "21", null, null, this);
            obj.set_taborder("156");
            this.addChild(obj.name, obj);

            obj = new Edit("agencyNm", "absolute", "155", "91", "213", "21", null, null, this);
            obj.set_taborder("157");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("salesGroup", "absolute", "508", "91", "94", "21", null, null, this);
            obj.set_taborder("158");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("bt_searchSalesGroup", "absolute", "578", "90", "20", "21", null, null, this);
            obj.set_taborder("159");
            obj.set_cssclass("btn_WF_edtSch");
            this.addChild(obj.name, obj);

            obj = new Edit("salesGroupNm", "absolute", "606", "91", "138", "21", null, null, this);
            obj.set_taborder("160");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("salesOffice", "absolute", "882", "91", "94", "21", null, null, this);
            obj.set_taborder("161");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("bt_searchSalesGroup00", "absolute", "952", "90", "20", "21", null, null, this);
            obj.set_taborder("162");
            obj.set_cssclass("btn_WF_edtSch");
            this.addChild(obj.name, obj);

            obj = new Edit("salesOfficeNm", "absolute", "980", "91", "137", "21", null, null, this);
            obj.set_taborder("163");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("telNo", "absolute", "155", "151", "213", "21", null, null, this);
            obj.set_taborder("164");
            obj.set_enable("true");
            obj.set_maxlength("12");
            this.addChild(obj.name, obj);

            obj = new Edit("taxNo", "absolute", "155", "181", "213", "21", null, null, this);
            obj.set_taborder("165");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("busiType", "absolute", "155", "211", "213", "21", null, null, this);
            obj.set_taborder("166");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("mobNo", "absolute", "508", "151", "235", "21", null, null, this);
            obj.set_taborder("167");
            obj.set_enable("true");
            obj.set_maxlength("12");
            this.addChild(obj.name, obj);

            obj = new Edit("repNm", "absolute", "508", "181", "235", "21", null, null, this);
            obj.set_taborder("168");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("busiCond", "absolute", "508", "211", "235", "21", null, null, this);
            obj.set_taborder("169");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("posCd", "absolute", "155", "241", "108", "21", null, null, this);
            obj.set_taborder("170");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("street", "absolute", "508", "241", "235", "21", null, null, this);
            obj.set_taborder("172");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("city", "absolute", "268", "241", "235", "21", null, null, this);
            obj.set_taborder("173");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Combo("rentalYn", "absolute", "882", "241", "235", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("174");
            obj.set_displayrowcount("5");
            obj.set_enable("true");
            obj.set_innerdataset("@dsUseYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Edit("posX", "absolute", "155", "271", "213", "21", null, null, this);
            obj.set_taborder("175");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("posY", "absolute", "508", "271", "235", "21", null, null, this);
            obj.set_taborder("176");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Combo("useYn", "absolute", "882", "271", "235", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("177");
            obj.set_displayrowcount("5");
            obj.set_enable("true");
            obj.set_innerdataset("@dsUseYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Combo("fmYn", "absolute", "882", "301", "235", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("178");
            obj.set_displayrowcount("5");
            obj.set_enable("true");
            obj.set_innerdataset("@dsUseYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Calendar("strDay", "absolute", "882", "182", "234", "20", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("179");
            obj.set_dateformat("yyyy-MM-dd ddd");

            obj = new Calendar("endDay", "absolute", "882", "211", "234", "20", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("180");
            obj.set_dateformat("yyyy-MM-dd ddd");

            obj = new Static("Static24", "absolute", "0", "356", "1122", "31", null, null, this);
            obj.set_taborder("181");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static59", "absolute", "0", "356", "149", "31", null, null, this);
            obj.set_taborder("182");
            obj.set_text("세금계산서 발행여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_taxRqcd", "absolute", "155", "361", "214", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("183");
            obj.set_innerdataset("@dsTaxRqCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("Static60", "absolute", "374", "356", "130", "31", null, null, this);
            obj.set_taborder("184");
            obj.set_text("벤더코드");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_lifnr", "absolute", "508", "361", "235", "21", null, null, this);
            obj.set_taborder("185");
            obj.set_inputtype("number");
            obj.set_maxlength("7");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "0", "386", "1122", "31", null, null, this);
            obj.set_taborder("186");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "0", "386", "149", "31", null, null, this);
            obj.set_taborder("187");
            obj.set_text("채널 대분류");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "374", "386", "130", "31", null, null, this);
            obj.set_taborder("188");
            obj.set_text("채널 중분류");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_chanLclsCd", "absolute", "155", "391", "214", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("189");
            obj.set_innerdataset("@dsChanLclsCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Combo("cb_chanMclsCd", "absolute", "508", "391", "236", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("190");
            obj.set_innerdataset("@dsChanMclsCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("Static32", "absolute", "748", "356", "130", "31", null, null, this);
            obj.set_taborder("191");
            obj.set_text("온라인장착가능");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_opYn", "absolute", "882", "361", "235", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("192");
            obj.set_innerdataset("@dsUseYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("Static33", "absolute", "748", "386", "130", "31", null, null, this);
            obj.set_taborder("193");
            obj.set_text("비고");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_memo", "absolute", "882", "391", "235", "21", null, null, this);
            obj.set_taborder("194");
            obj.set_maxlength("49");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "0", "416", "1122", "31", null, null, this);
            obj.set_taborder("195");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static35", "absolute", "0", "416", "149", "31", null, null, this);
            obj.set_taborder("196");
            obj.set_text("탈착기");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static44", "absolute", "374", "416", "130", "31", null, null, this);
            obj.set_taborder("197");
            obj.set_text("얼라인먼트");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_desorptCd", "absolute", "155", "421", "214", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("198");
            obj.set_innerdataset("@dsDesorptCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("Static45", "absolute", "748", "416", "130", "31", null, null, this);
            obj.set_taborder("200");
            obj.set_text("밸런스");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_alignCd", "absolute", "508", "421", "236", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("201");
            obj.set_innerdataset("@dsAlignCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Combo("cb_balanceCd", "absolute", "882", "421", "235", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("202");
            obj.set_innerdataset("@dsBalanceCd");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("Static46", "absolute", "0", "476", "1122", "31", null, null, this);
            obj.set_taborder("203");
            obj.set_cssclass("sta_WF_detailLabel2");
            obj.style.set_background("#ffffffff");
            obj.style.set_color("#999999ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static47", "absolute", "0", "476", "149", "31", null, null, this);
            obj.set_taborder("204");
            obj.set_text("렌탈지역");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("salesGroup00", "absolute", "156", "481", "140", "21", null, null, this);
            obj.set_taborder("205");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("bt_searchSalesGroup01", "absolute", "274", "481", "20", "21", null, null, this);
            obj.set_taborder("206");
            obj.set_cssclass("btn_WF_edtSch");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("salesGroupNm00", "absolute", "310", "481", "193", "21", null, null, this);
            obj.set_taborder("207");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("salesGroup01", "absolute", "148", "481", "36", "21", null, null, this);
            obj.set_taborder("208");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("salesGroupNm01", "absolute", "310", "481", "26", "21", null, null, this);
            obj.set_taborder("209");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static48", "absolute", "748", "476", "130", "31", null, null, this);
            obj.set_taborder("210");
            obj.set_text("퍼플점 여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_plplYn", "absolute", "882", "481", "235", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("211");
            obj.set_innerdataset("@dsPrplYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("Static49", "absolute", "0", "506", "149", "31", null, null, this);
            obj.set_taborder("212");
            obj.set_text("탈착기");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static61", "absolute", "0", "506", "1122", "31", null, null, this);
            obj.set_taborder("213");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_apfdEndYn", "absolute", "155", "511", "214", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("214");
            obj.set_innerdataset("@dsYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("Static62", "absolute", "0", "506", "149", "31", null, null, this);
            obj.set_taborder("215");
            obj.set_text("충당금 반환여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static63", "absolute", "374", "506", "130", "31", null, null, this);
            obj.set_taborder("216");
            obj.set_text("직영도매거래선");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("chainYn", "absolute", "508", "511", "235", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("217");
            obj.set_innerdataset("@dsUseYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("Static64", "absolute", "748", "146", "130", "31", null, null, this);
            obj.set_taborder("218");
            obj.set_text("담당영업사원");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("rntMstNm", "absolute", "882", "151", "94", "21", null, null, this);
            obj.set_taborder("219");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("rntMstMob", "absolute", "85.44%", "151", "137", "21", null, null, this);
            obj.set_taborder("221");
            obj.set_enable("true");
            obj.set_mask("###-####-####");
            obj.set_type("string");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static65", "absolute", "0", "446", "1122", "31", null, null, this);
            obj.set_taborder("222");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static66", "absolute", "0", "446", "149", "31", null, null, this);
            obj.set_taborder("223");
            obj.set_text("엔진 오일 무료 점검");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("egolNchrgChkYn", "absolute", "155", "451", "214", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("225");
            obj.set_innerdataset("@dsEgolNchrgChkYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("Static67", "absolute", "374", "446", "130", "31", null, null, this);
            obj.set_taborder("224");
            obj.set_text("브레이크 패드 무료 점검");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("bkpdNchrgChkYn", "absolute", "508", "451", "236", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("227");
            obj.set_innerdataset("@dsBkpdNchrgChkYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("Static68", "absolute", "748", "446", "130", "31", null, null, this);
            obj.set_taborder("226");
            obj.set_text("워셔액 무료 지급");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("washerNchrgPayYn", "absolute", "882", "451", "235", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("228");
            obj.set_innerdataset("@dsWasherNchrgPayYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Static("Static69", "absolute", "0", "116", "1122", "31", null, null, this);
            obj.set_taborder("229");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static70", "absolute", "0", "116", "149", "31", null, null, this);
            obj.set_taborder("230");
            obj.set_text("홈페이지 대리점명");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.addChild(obj.name, obj);

            obj = new Edit("hpAgencyNm", "absolute", "155", "120", "213", "21", null, null, this);
            obj.set_taborder("231");
            obj.set_maxlength("120");
            this.addChild(obj.name, obj);


            
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
            obj = new Layout("default", "", 1147, 585, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Authority");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("대리점정보관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","div_search.agencyNm","value","","");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","agencyNm","value","dsAgency","agencyNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","salesGroup","value","dsAgency","salesGroup");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","salesGroupNm","value","dsAgency","salesGroupNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","salesOffice","value","dsAgency","salesOffice");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","salesOfficeNm","value","dsAgency","salesOfficeNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","posCd","value","dsAgency","posCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","city","value","dsAgency","city");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","street","value","dsAgency","street");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","sidoCd","value","dsAgency","sidoCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","sigunCd","value","dsAgency","sigunCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","serNo","value","dsAgency","serNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","telNo","value","dsAgency","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","mobNo","value","dsAgency","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","faxNo","value","dsAgency","faxNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","taxNo","value","dsAgency","taxNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","repNm","value","dsAgency","repNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","busiType","value","dsAgency","busiType");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","busiCond","value","dsAgency","busiCond");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","rentalYn","value","dsAgency","rentalYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","strDay","value","dsAgency","strDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","endDay","value","dsAgency","endDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","posX","value","dsAgency","posX");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","posY","value","dsAgency","posY");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item24","useYn","value","dsAgency","useYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item25","seasonGbn","value","dsAgency","seasonGbn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item26","lmYn","value","dsAgency","lmYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item27","fmYn","value","dsAgency","fmYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item28","cwYn","value","dsAgency","cwYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item29","olimitCnt","value","dsAgency","olimitCnt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item30","chYn","value","dsAgency","chYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item31","cb_taxRqcd","value","dsAgency","taxRqcd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item32","ed_lifnr","value","dsAgency","lifnr");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item33","cb_chanLclsCd","value","dsAgency","chanLclsCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item34","cb_chanMclsCd","value","dsAgency","chanMclsCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item35","cmb_opYn","value","dsAgency","opYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item36","ed_memo","value","dsAgency","memo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item37","cb_desorptCd","value","dsAgency","desorptCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item38","cb_alignCd","value","dsAgency","alignCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item39","cb_balanceCd","value","dsAgency","balanceCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item40","salesGroup00","value","dsAgency","rentalGroupNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item41","salesGroupNm00","value","dsAgency","rentalOfficeNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item42","salesGroup01","value","dsAgency","rentalGroup");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item43","salesGroupNm01","value","dsAgency","rentalOffice");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item44","cmb_plplYn","value","dsAgency","prplYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item45","cb_apfdEndYn","value","dsAgency","apfdEndYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item46","chainYn","value","dsAgency","chainYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item47","rntMstNm","value","dsAgency","rntMstNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item48","rntMstMob","value","dsAgency","rntMstMob");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item49","egolNchrgChkYn","value","dsAgency","egolNchrgChkYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item50","bkpdNchrgChkYn","value","dsAgency","bkpdNchrgChkYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item51","washerNchrgPayYn","value","dsAgency","washerNchrgPayYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item52","hpAgencyNm","value","dsAgency","hpAgencyNm");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDAgency.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDAgency.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RDSDAgency.xfdl
         * 설    명 : 대리점 정보 관리 
         * 작 성 자 : 
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2016-04-15	이영근		대리점 채널 대분류,중분류 항목 추가
         * 2016-05-04	이영근		벤더코드 문자입력 방지
         * 2016-09-23	wjim		온라인장착가능 항목 추가 
         * 2017-06-02	wjim		[20170602_01] 사용여부-온라인장착가능 연동 제거
         * 2017-09-15	wjim		[20170915_01] 전화번호, 휴대폰번호 수정가능하도록 수정
         * 2018-01-02	wjim		[20171226_01] 비고 추가
         * 2018-03-12	wjim		[20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
         * 2019-08-01	wjim		[20190731_01] 충당금반환여부 추가
         *							 - 충당금 반환여부가 '예'인 경우, 렌탈대리점여부, 사용여부 변경 불가
         * 2019-09-0	kstka		[20190909_01] 렌탈팀과 로디안 그룹간 수정항목 분리
         ***************************************************************************************************/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.resultCnt = "";
        this.userId = application.gds_userInfo.getColumn(0,"userId");
        this.userGrp = application.gds_userInfo.getColumn(0,"userGrp");
        this.apfdAuthYn = false;	// 충당금 반환여부 수정권한 여부

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt){
        	if (nErrorCode < 0) {
        		alert(strErrorMsg);
        		return;
        	}
        	
        	if( strSvcId == "initRTSDAgency" ){
        	
        		//[20231023_1] kstka 충당금 반환여부 활성화
        		var auth = this.getControlAuthCheck("cb_apfdEndYn", "", this.userId);
        		if( auth == "Y" ){
        			this.apfdAuthYn = true;
        		}
        			
        		// 2016-04-19 이영근, 채널 중분류 컬럼 추가 및 값 세팅
        		this.dsChanMclsCd.addColumn("lcd","string");
        		for(var i=0; i<this.dsChanMclsCd.rowcount; i++){
        			this.dsChanMclsCd.setColumn(i,"lcd",this.dsChanMclsCd.getColumn(i,"cd").substr(0,2));
        		}
        		
        		//2019-09-09 렌탈팀과 로디안그룹간 수정항목 분리
        		this.fn_setEnable();
        	}
        	
        	if( strSvcId == "detailAgencyInfo" ) {
        		// 2016-04-19 이영근, 대리점 조회 후 채널 중분류 세팅			
        		this.cb_chanLclsCd_onitemchanged();
        		
        		if (this.apfdAuthYn) {
        			//[20190923_01] 렌탈마스터는 수정권한 삭제
        			if(this.userGrp != "RM"){
        				this.cb_apfdEndYn.set_enable(true);
        			}
        		} else {
        			this.cb_apfdEndYn.set_enable(false);
        		}		

        		// [20190731_01] 충당금 반환여부가 '예'인 경우, 렌탈대리점여부, 사용여부 변경 불가
        		// - 사용자가 담당자인 경우에만 변경 가능
        		if (!this.apfdAuthYn && this.dsAgency.getColumn(0, "apfdEndYn") == "Y") {
        			this.rentalYn.set_enable(false);
        			this.useYn.set_enable(false);
        		} else {
        			//[20190923_01] 렌탈마스터는 수정권한 삭제
        			if(this.userGrp != "RM"){
        				this.rentalYn.set_enable(true);
        				this.useYn.set_enable(true);
        			}
        		}
        	}
        	
        	if( strSvcId == "saveAgencyInfo" ) {
        		alert(strErrorMsg);
        		if( nErrorCode == "0" ){
        			this.fn_search();
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTSDAgency_onload = function(obj,e){
        	Ex.core.init(obj);	
        	this.parent.setButton("C|S", this);	
        	
        	this.listControlAuth("SD", "RTSDAgency");
        	this.fn_init();
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_setEnable = function() {

        	//렌탈마스터
        	if(this.userGrp == "RM"){
        		this.cb_taxRqcd.set_enable(false);
        		this.cb_chanLclsCd.set_value(false);
        		this.cb_apfdEndYn.set_enable(false);
        		this.ed_lifnr.set_enable(false);
        		this.cb_chanLclsCd.set_enable(false);
        		this.cb_chanMclsCd.set_enable(false);
        		this.strDay.set_enable(false);
        		this.endDay.set_enable(false);
        		this.rentalYn.set_enable(false);
        		this.useYn.set_enable(false);
        		this.olimitCnt.set_enable(false);
        		this.cmb_plplYn.set_enable(false);
        	}else{ //렌탈팀
        		this.cb_taxRqcd.set_enable(true);
        		this.cb_chanLclsCd.set_value(true);
        		this.cb_apfdEndYn.set_enable(true);
        		this.ed_lifnr.set_enable(true);
        		this.cb_chanLclsCd.set_enable(true);
        		this.cb_chanMclsCd.set_enable(true);
        		this.strDay.set_enable(true);
        		this.endDay.set_enable(true);
        		this.rentalYn.set_enable(true);
        		this.useYn.set_enable(true);
        		this.olimitCnt.set_enable(true);
        		this.cmb_plplYn.set_enable(true);
        	}
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	// [20190731_01] 사용자가 담당자인 경우에만 '충당금 반환여부' 변경 가능
        	// - 담당자 : 렌탈팀 박용대(10191017), 김영작(10164030)
        // 	if (this.userId == '10191017' || this.userId == '10164030') {
        // 		this.apfdAuthYn = true;
        // 	}
        	
        	var sSvcID      	= "initRTSDAgency";  
        	var sController   	= "rtms/sd/initRTSDAgency.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sOutDatasets += " dsUseYn=mapDsUseYn ";
        	sOutDatasets += " dsSeason=mapDsSeason ";
        	sOutDatasets += " dsTaxRqCd=mapDsTaxRqCd ";
        	sOutDatasets += " dsChanLclsCd=mapDsChanLclsCd ";
        	sOutDatasets += " dsChanMclsCd=mapDsChanMclsCd ";
        	sOutDatasets += " dsDesorptCd=mapDesorptCd ";
        	sOutDatasets += " dsAlignCd=mapAlignCd ";
        	sOutDatasets += " dsBalanceCd=mapBalanceCd ";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	var agencyCd = nvl(this.div_search.agencyCd.value);
        	var userId   = application.gds_userInfo.getColumn(0, "userId"); //사용자ID
        	
        	
        	if(agencyCd == ""){
        		alert("대리점 정보를 선택해주십시오");
        		return false;
        	}
        	var sSvcID        	= "detailAgencyInfo";
        	var sController   	= "rtms/sd/detailAgencyInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsAgency=ds_output";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("agencyCd", agencyCd);
        	sArgs += Ex.util.setParam("userId", userId);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(){
        	var rowtype = this.dsAgency.getRowType(0);
        	if(rowtype != 4) {
        		alert("변경된 자료가 없습니다.");
        		return false;
        	}
        	
        	if (this.dsAgency.getColumn(0, "apfdEndYn")=="Y" && (this.dsAgency.getColumn(0, "rentalYn")=="Y" || this.dsAgency.getColumn(0, "useYn")=="Y")) {
        		if (!this.confirm("충당금 반환여부를 '예'로 변경하면, 렌탈대리점여부, 사용여부가 '미사용'으로 전환되며 이후 수정이 불가합니다.\n진행하시겠습니까?")) {
        			return false;
        		}
        	}	
        	
        	var sSvcID        	= "saveAgencyInfo";                    
        	var sController   	= "rtms/sd/saveAgencyInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        		sArgs		   += "";
        	sInDatasets   		= "input=dsAgency:U";
        	sOutDatasets  		= "";
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.searcgAgency = function(obj,e){
        	var args = {p_formId : "RTSDAgency"};
        	Ex.core.popup(this,"대리점 조회","comm::RTCOMMAgency_pop.xfdl",args,"modaless=false");
        }
        this._setReturn = function(val) {
        	var cd = val[0];
        	var nm = val[1];
        	var gb = val[2];
        	this.div_search.agencyCd.set_value(cd);
        	this.div_search.agencyNm.set_value(nm);
        	this.fn_search();
        }

        /* [20170602_01] 에 의거 이벤트 제거 */
        //this.rentalYn_onitemchanged = function(obj:Combo, e:nexacro.ItemChangeEventInfo){
        //	this.useYn.set_value(obj.value);
        //}

        /* [20170602_01] 에 의거 이벤트 제거 */
        //this.useYn_onitemchanged = function(obj:Combo, e:nexacro.ItemChangeEventInfo){
        //	this.rentalYn.set_value(obj.value);
        //}

        // 2016-04-19 이영근, 채널 중분류 값 변경시 이벤트
        this.cb_chanLclsCd_onitemchanged = function(obj,e)
        {
        	this.dsChanMclsCd.filter("lcd=='"+this.cb_chanLclsCd.value+"'");
        }

        
        this.div_search_bt_searchSalesGroup01_onclick = function(obj,e)
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

        		this.salesGroup01.set_value(rentalGroup);		
        		this.salesGroupNm01.set_value(rentalOffice);
        		this.salesGroup00.set_value(rentalGroupNm);
        		this.salesGroupNm00.set_value(rentalOfficeNm);		
        	}

        this.bt_searchSalesGroup_onclick = function(obj,e)
        {
        	var args ={p_arg : "RTSDAgency"};
        	Ex.core.popup(this,"지사","comm::RTCOMMVkgrp_pop_old.xfdl",args, "modaless=false");
        }

        this.return_salesGroup = function(arr){
        	this.salesGroupNm.set_value(arr[0]);
        	this.salesGroup.set_value(arr[1]);
        }

        this.bt_searchSalesGroup00_onclick = function(obj,e)
        {
        	var args ={p_arg : "RTSDAgency"};
        	Ex.core.popup(this,"지점조회","comm::RTCOMMVkbur_pop_old.xfdl",args, "modaless=false");
        }

        this.return_salesOffice = function(arr){
        	this.salesOfficeNm.set_value(arr[0]);
        	this.salesOffice.set_value(arr[1]);
        }

        //[20230607_1] kstka
        //==================================================================================
        this.listControlAuth = function(mdlCd,prgmCd){
        	
        	var sSvcID        	= "listControlAuth";                    
        	var sController   	= "/rtms/cm/listControlAuth.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_controlAuth=output";
        	var sArgs 			= Ex.util.setParam("mdlCd", mdlCd);
        		sArgs 			+= Ex.util.setParam("prgmCd", prgmCd);
        	    
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        this.getControlAuthCheck = function(controlId,userGrp,userId){
        	var expr = "controlId == '" + controlId + "'";
        	if(nvl(userGrp) != "") expr += " && userGrp == '" + userGrp + "'";
        	if(nvl(userId) != "") expr += " && userId == '" + userId + "'";
        	expr += " && useYn == 'Y'";
        	
        	var nRow = this.ds_controlAuth.findRowExpr(expr);
        	if(nRow < 0) return "N";
        	if(nRow >= 0) return "Y";
        }
        //==================================================================================
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("ontimer", this.form_ontimer, this);
            this.addEventHandler("onload", this.RTSDAgency_onload, this);
            this.div_search.agencyCd.addEventHandler("onkeyup", this.div_search_matCd_onkeyup, this);
            this.div_search.btn_save00.addEventHandler("onclick", this.searcgAgency, this);
            this.div_search.agencyNm.addEventHandler("onkeyup", this.div_search_matCd_onkeyup, this);
            this.lmYn.addEventHandler("onitemchanged", this.div_search00_userGrp_onitemchanged, this);
            this.chYn.addEventHandler("onitemchanged", this.div_search00_userGrp_onitemchanged, this);
            this.salesGroup.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.bt_searchSalesGroup.addEventHandler("onclick", this.bt_searchSalesGroup_onclick, this);
            this.salesOffice.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.bt_searchSalesGroup00.addEventHandler("onclick", this.bt_searchSalesGroup00_onclick, this);
            this.rentalYn.addEventHandler("onitemchanged", this.rentalYn_onitemchanged, this);
            this.fmYn.addEventHandler("onitemchanged", this.div_search00_userGrp_onitemchanged, this);
            this.cb_chanLclsCd.addEventHandler("onitemchanged", this.cb_chanLclsCd_onitemchanged, this);
            this.Static45.addEventHandler("onclick", this.Static45_onclick, this);
            this.salesGroup00.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.bt_searchSalesGroup01.addEventHandler("onclick", this.div_search_bt_searchSalesGroup01_onclick, this);
            this.salesGroup01.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.Static48.addEventHandler("onclick", this.Static45_onclick, this);
            this.Static68.addEventHandler("onclick", this.Static45_onclick, this);

        };

        this.loadIncludeScript("RTSDAgency.xfdl");

       
    };
}
)();

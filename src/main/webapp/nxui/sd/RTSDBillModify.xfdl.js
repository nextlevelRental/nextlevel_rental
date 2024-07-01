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
                this.set_name("RTSDBillModify");
                this.set_classname("RTSDBillModify");
                this.set_titletext("계산서 여부수정");
                this.set_scrollbars("none");
                this.set_dragscrolltype("none");
                this._setFormPosition(0,0,1130,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_BillModifyList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"custAddr\" type=\"STRING\" size=\"256\"/><Column id=\"cCustNm\" type=\"STRING\" size=\"256\"/><Column id=\"cTelNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"classNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"billYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_BillModifySave", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"repNm\" type=\"STRING\" size=\"256\"/><Column id=\"busiType\" type=\"STRING\" size=\"256\"/><Column id=\"busiCond\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"custAddr\" type=\"STRING\" size=\"256\"/><Column id=\"cCustNm\" type=\"STRING\" size=\"256\"/><Column id=\"cTelNo\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"classNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"billYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_billYn", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">발행</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">미발행</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_copy", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">발행</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">미발행</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1105", "45", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "100", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("80");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "20", "10", "80", "21", null, null, this.div_search);
            obj.set_taborder("81");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_ordNo", "absolute", "130", "10", "120", "21", null, null, this.div_search);
            obj.set_taborder("82");
            obj.set_displaynulltext("계약번호");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("Button00", "absolute", "229", "10", "21", "21", null, null, this.div_search);
            obj.set_taborder("83");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition02", "absolute", "590", "10", "70", "20", null, null, this.div_search);
            obj.set_taborder("89");
            obj.set_text("발행여부");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_billYn", "absolute", "660", "10", "120", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("90");
            obj.set_autoselect("true");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_innerdataset("@ds_billYn");
            obj.set_index("-1");
            obj = new Static("Static00", "absolute", "250", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("91");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "560", "0", "30", "44", null, null, this.div_search);
            obj.set_taborder("92");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNm", "absolute", "460", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("94");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_custNo", "absolute", "360", "10", "100", "21", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_enable("true");
            obj.set_displaynulltext("고객번호");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition01", "absolute", "280", "10", "80", "20", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_text("고객");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("Button01", "absolute", "439", "9", "21", "21", null, null, this.div_search);
            obj.set_taborder("98");
            obj.set_cssclass("btn_WF_edtSch");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", "1118", "10", null, null, this.div_search);
            obj.set_taborder("99");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "1", "31", "1117", "10", null, null, this.div_search);
            obj.set_taborder("100");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("101");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "45", "1130", "20", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "60", "100", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_text("메인 LIST");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "76", "1130", "10", null, null, this);
            obj.set_taborder("3");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "252", "1126", "15", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "277", "1129", "8", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "263", "169", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("세부 내역");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "285", "1105", "31", null, null, this);
            obj.set_taborder("8");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm", "absolute", "272", "285", "88", "31", null, null, this);
            obj.set_taborder("11");
            obj.set_text("법 인 명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "315", "1105", "31", null, null, this);
            obj.set_taborder("15");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_busiType", "absolute", "364", "321", "183", "20", null, null, this);
            obj.set_taborder("18");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_busiType", "absolute", "272", "315", "88", "31", null, null, this);
            obj.set_taborder("19");
            obj.set_text("업   종");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_repNm", "absolute", "0", "315", "88", "31", null, null, this);
            obj.set_taborder("21");
            obj.set_text("대표자명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "345", "1105", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_telNo", "absolute", "272", "345", "88", "31", null, null, this);
            obj.set_taborder("25");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_telNo", "absolute", "364", "351", "183", "20", null, null, this);
            obj.set_taborder("26");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_mobNo", "absolute", "0", "345", "88", "31", null, null, this);
            obj.set_taborder("29");
            obj.set_text("핸 드 폰");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mobNo", "absolute", "92", "351", "176", "20", null, null, this);
            obj.set_taborder("30");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNm", "absolute", "364", "291", "183", "20", null, null, this);
            obj.set_taborder("44");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordNo", "absolute", "92", "291", "176", "20", null, null, this);
            obj.set_taborder("45");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_buslNo", "absolute", "645", "291", "182", "21", null, null, this);
            obj.set_taborder("51");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            obj.set_enable("false");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_buslNo", "absolute", "552", "285", "88", "31", null, null, this);
            obj.set_taborder("52");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_repNm", "absolute", "92", "321", "176", "20", null, null, this);
            obj.set_taborder("53");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_busiCond", "absolute", "552", "315", "88", "31", null, null, this);
            obj.set_taborder("54");
            obj.set_text("업     태");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "375", "1105", "31", null, null, this);
            obj.set_taborder("55");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_cCustNm", "absolute", "0", "375", "88", "31", null, null, this);
            obj.set_taborder("56");
            obj.set_text("담당자명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_cCustNm", "absolute", "92", "381", "176", "20", null, null, this);
            obj.set_taborder("57");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_cTelNo", "absolute", "272", "375", "88", "31", null, null, this);
            obj.set_taborder("58");
            obj.set_text("담당자전화");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_cTelNo", "absolute", "364", "381", "183", "20", null, null, this);
            obj.set_taborder("59");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_custAddr", "absolute", "552", "345", "88", "31", null, null, this);
            obj.set_taborder("60");
            obj.set_text("주    소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNo", "absolute", "832", "285", "88", "31", null, null, this);
            obj.set_taborder("61");
            obj.set_text("고객번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_emailAddr", "absolute", "832", "315", "88", "31", null, null, this);
            obj.set_taborder("62");
            obj.set_text("E-mail");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("true");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "0", "405", "1105", "31", null, null, this);
            obj.set_taborder("63");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_procDay", "absolute", "272", "405", "88", "31", null, null, this);
            obj.set_taborder("65");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordDay", "absolute", "0", "405", "88", "31", null, null, this);
            obj.set_taborder("67");
            obj.set_text("계약일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "0", "435", "1105", "31", null, null, this);
            obj.set_taborder("68");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_matNm", "absolute", "364", "441", "183", "20", null, null, this);
            obj.set_taborder("69");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_matNm", "absolute", "272", "435", "88", "31", null, null, this);
            obj.set_taborder("70");
            obj.set_text("상 품 명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_matCd", "absolute", "92", "441", "176", "20", null, null, this);
            obj.set_taborder("71");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_matCd", "absolute", "0", "435", "88", "31", null, null, this);
            obj.set_taborder("72");
            obj.set_text("상품코드");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "0", "465", "1105", "31", null, null, this);
            obj.set_taborder("73");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_monAmt", "absolute", "364", "470", "183", "20", null, null, this);
            obj.set_taborder("74");
            obj.set_enable("false");
            obj.style.setStyleValue("align", "disabled", "right");
            obj.set_value("0");
            this.addChild(obj.name, obj);

            obj = new Static("st_monAmt", "absolute", "272", "465", "88", "31", null, null, this);
            obj.set_taborder("75");
            obj.set_text("렌 탈 료");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_regiAmt", "absolute", "92", "470", "176", "20", null, null, this);
            obj.set_taborder("76");
            obj.set_enable("false");
            obj.set_value("0");
            obj.style.setStyleValue("align", "disabled", "right");
            this.addChild(obj.name, obj);

            obj = new Static("st_regiAmt", "absolute", "0", "465", "88", "31", null, null, this);
            obj.set_taborder("77");
            obj.set_text("등록비");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_classNm", "absolute", "552", "405", "88", "31", null, null, this);
            obj.set_taborder("78");
            obj.set_text("차   종");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_classNm", "absolute", "645", "411", "182", "20", null, null, this);
            obj.set_taborder("79");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_busiCond", "absolute", "645", "321", "182", "20", null, null, this);
            obj.set_taborder("82");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custAddr", "absolute", "645", "351", "455", "20", null, null, this);
            obj.set_taborder("83");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNo", "absolute", "924", "291", "176", "20", null, null, this);
            obj.set_taborder("84");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_emailAddr", "absolute", "924", "321", "176", "20", null, null, this);
            obj.set_taborder("85");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_periodNm", "absolute", "552", "435", "88", "31", null, null, this);
            obj.set_taborder("87");
            obj.set_text("계약기간");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_cntNm", "absolute", "832", "435", "88", "31", null, null, this);
            obj.set_taborder("88");
            obj.set_text("본   수");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_periodNm", "absolute", "645", "441", "86", "20", null, null, this);
            obj.set_taborder("89");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_cntNm", "absolute", "924", "441", "86", "20", null, null, this);
            obj.set_taborder("90");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_BillModifyList", "absolute", "0", "86", "1105", "166", null, null, this);
            obj.set_taborder("91");
            obj.set_binddataset("ds_BillModifyList");
            obj.set_cellsizingtype("col");
            obj.set_cellmovingtype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_scrollbars("autoboth");
            obj.set_autosizingtype("none");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"320\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\"/><Cell col=\"1\" displaytype=\"normal\" text=\"계약번호\"/><Cell col=\"2\" text=\"사업자번호\"/><Cell col=\"3\" text=\"법인명\"/><Cell col=\"4\" text=\"계약일자\"/><Cell col=\"5\" text=\"장착일자\"/><Cell col=\"6\" text=\"상품코드\"/><Cell col=\"7\" text=\"상품명\"/><Cell col=\"8\" text=\"차종\"/><Cell col=\"9\" text=\"차량번호\"/><Cell col=\"10\" text=\"발행여부\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"none\" text=\"bind:check\"/><Cell col=\"1\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"2\" text=\"bind:buslNo\"/><Cell col=\"3\" text=\"bind:custNm\"/><Cell col=\"4\" displaytype=\"date\" text=\"bind:ordDay\" calendardisplaynulltype=\"none\"/><Cell col=\"5\" displaytype=\"date\" text=\"bind:procDay\" calendardisplaynulltype=\"none\"/><Cell col=\"6\" text=\"bind:matCd\"/><Cell col=\"7\" text=\"bind:matNm\"/><Cell col=\"8\" text=\"bind:classNm\"/><Cell col=\"9\" text=\"bind:carNo\"/><Cell col=\"10\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:billYn\" suppress=\"0\" combodataset=\"ds_copy\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplayrowcount=\"0\" combodisplay=\"display\" combotype=\"dropdown\"/></Band><Band id=\"summary\"><Cell colspan=\"2\" text=\"건수\"/><Cell col=\"2\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"3\" style=\"align:right;\" expr=\"dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"4\"/><Cell col=\"5\"/><Cell col=\"6\"/><Cell col=\"7\" combotype=\"filter\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_carNo", "absolute", "832", "405", "88", "31", null, null, this);
            obj.set_taborder("92");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carNo", "absolute", "924", "411", "176", "20", null, null, this);
            obj.set_taborder("93");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNo", "absolute", "0", "285", "88", "31", null, null, this);
            obj.set_taborder("94");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "1105", "0", "25", "496", null, null, this);
            obj.set_taborder("95");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Calendar("dt_ordDay", "absolute", "92", "411", "176", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("96");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_cssclass("readonly");
            obj.set_enable("false");

            obj = new Calendar("dt_prodDay", "absolute", "364", "410", "183", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("97");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_cssclass("readonly");
            obj.set_enable("false");


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1105, 45, this.div_search,
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
            obj = new Layout("default", "", 1130, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDBillModify");
            		p.set_titletext("계산서 여부수정");
            		p.set_scrollbars("none");
            		p.set_dragscrolltype("none");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_ordNo","value","ds_BillModifyList","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_custNm","value","ds_BillModifyList","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_buslNo","value","ds_BillModifyList","buslNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_custNo","value","ds_BillModifyList","custNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_repNm","value","ds_BillModifyList","repNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_busiType","value","ds_BillModifyList","busiType");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_busiCond","value","ds_BillModifyList","busiCond");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_emailAddr","value","ds_BillModifyList","emailAddr");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","ed_mobNo","value","ds_BillModifyList","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","ed_telNo","value","ds_BillModifyList","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","ed_custAddr","value","ds_BillModifyList","custAddr");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","ed_cCustNm","value","ds_BillModifyList","cCustNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","ed_cTelNo","value","ds_BillModifyList","cTelNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","dt_ordDay","value","ds_BillModifyList","ordDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","ed_classNm","value","ds_BillModifyList","classNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","ed_carNo","value","ds_BillModifyList","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","ed_matCd","value","ds_BillModifyList","matCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","ed_matNm","value","ds_BillModifyList","matNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","ed_periodNm","value","ds_BillModifyList","periodNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","ed_cntNm","value","ds_BillModifyList","cntNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","ed_regiAmt","value","ds_BillModifyList","regiAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","ed_monAmt","value","ds_BillModifyList","monAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","dt_prodDay","value","ds_BillModifyList","procDay");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDBillModify.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDBillModify.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg = "RTSDBillModify";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if(strSvcId == "initBillModifyBillYn") {
        		var nRow = this.ds_billYn.insertRow(0);
        		this.ds_billYn.setColumn(nRow,"cd"," ");
        		this.ds_billYn.setColumn(nRow,"cdNm","전체");
        		this.div_search.cb_billYn.set_value(" ");
        	
        	}else if( strSvcId == "listBill" ){
        		var nCnt = this.ds_BillModifyList.getRowCount();
        		if( nCnt  != 0 ){
        			this.ds_BillModifyList.set_updatecontrol(false);
        			for( var i = 0 ; i < nCnt ; i++){
        				this.ds_BillModifyList.setColumn(i, "check", "0");
        			}
        			this.ds_BillModifyList.set_updatecontrol(true);
        			
        			if( nvl(this.div_search.ed_custNo.value) == "" ){
        				this.div_search.ed_custNm.set_value(" ");
        			}
        		}else{
        			alert("조회된 데이터가 없습니다.");
        			this.grid_BillModifyList.set_nodatatext( "조회된 데이터가 없습니다." );
        		}
        		
        		if( this.grid_BillModifyList.getCellProperty("head", 0, "text") == 1 ){
        			this.grid_BillModifyList.setCellProperty("head", 0, "text", 0);
        		}
        	}else if (strSvcId == "saveBillInfo") {
        		alert(strErrorMsg);
        		if( nErrorCode < 0 ){
        			return false;
        		}else{
        			this.fn_search();
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTSDBillModify_onload  = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	this.fn_initBtn();
        } 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	var sSvcID      	= "initBillModifyBillYn";  
        	var sController   	= "rtms/sd/initBillModifyBillYn.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "ds_billYn=mapDsRASMenu";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";	 
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_initBtn  = function(){
        	this.parent.setButton("E|C|S", this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	var ordNo    = nvl(this.div_search.ed_ordNo.value);
        	var custNo 	 = nvl(this.div_search.ed_custNo.value);
        	var billYn   = nvl(this.div_search.cb_billYn.value);

        	var sSvcID        	= "listBill";                    
        	var sController   	= "rtms/sd/listBill.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_BillModifyList=billInfo";
        	var sArgs			= "";
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordNo",  ordNo);
        	sArgs += Ex.util.setParam("custNo", custNo);
        	sArgs += Ex.util.setParam("billYn", billYn);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function() {
        	var saveFalg = false;
        	this.ds_BillModifySave.clearData();
        	var checkCnt = -1;

        	for( i=0 ; i < this.ds_BillModifyList.getRowCount() ; i++ ) {
        		if(this.ds_BillModifyList.getColumn(i, "check") == 1) {
        			if(this.ds_BillModifyList.getRowType(i) != 4){
        				alert("해당 데이터는 변경된 정보가 없습니다.");
        				this.ds_BillModifyList.set_rowposition(i);
        				saveFalg = false;
        				break;
        			}else{
        				saveFalg = true;
        				var copyBoolean = this.ds_BillModifySave.copyRow(this.ds_BillModifySave.addRow(),this.ds_BillModifyList,i);
        				if( !copyBoolean ){
        					alert("SYSTEM ERROR.");
        					break;
        				}else{
        					checkCnt++;
        				}
        			}
        		}
        	}
        	
        	if( (saveFalg) && (checkCnt != -1) ){
        		var sSvcID        	= "saveBillInfo";                    
        		var sController   	= "rtms/sd/saveBillInfo.do";
        		var sInDatasets   	= "input=ds_BillModifySave:U";
        		var sOutDatasets  	= "";
        		var sArgs			= "";
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.grid_BillModifyList);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_Button00_onclick = function(obj,e){
        	var args ={p_arg:this.p_arg};
        	Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");
        }
        this.returnOrderNo = function(val){
        	this.div_search.ed_ordNo.set_value(val);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_Button01_onclick = function(obj,e){
        	var args ={p_arg:this.p_arg};
        	Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");    
        }
        this.returnCustInfo = function(res) {
        	this.div_search.ed_custNo.set_value(res[0]);
        	this.div_search.ed_custNm.set_value(res[1]);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.grid_BillModifyList_oncellclick = function(obj,e){
        	if(e.cell == 10){
        	  this.ds_BillModifyList.setColumn(e.row, "check", 1); 
        	  return false;
        	}
        	
        	this.ds_BillModifyList.set_updatecontrol(false);
        	var checkVal = this.ds_BillModifyList.getColumn( e.row, "check" );
        	if( checkVal == 0 ){
        		this.ds_BillModifyList.setColumn( e.row, "check", 1 );
        	}else{
        		this.ds_BillModifyList.setColumn( e.row, "check", 0 );
        	}
        	this.ds_BillModifyList.set_updatecontrol(true);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_eb_ordNo_onkeyup = function(obj,e){
        	if ( e.keycode == 13 ) {
        		this.fn_search();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_eb_custNo_onkeyup = function(obj,e){
        	if(e.keycode == 13) {
        		this.fn_search();
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDBillModify_onload, this);
            this.div_search.ed_ordNo.addEventHandler("onkeyup", this.div_search_eb_ordNo_onkeyup, this);
            this.div_search.Button00.addEventHandler("onclick", this.div_search_Button00_onclick, this);
            this.div_search.cb_billYn.addEventHandler("ondropdown", this.div_search_cb_billYn_ondropdown, this);
            this.div_search.ed_custNm.addEventHandler("onkeyup", this.div_search_eb_custNo_onkeyup, this);
            this.div_search.Button01.addEventHandler("onclick", this.div_search_Button01_onclick, this);
            this.Static10.addEventHandler("onclick", this.Static10_onclick, this);
            this.st_custNm.addEventHandler("onclick", this.st_ordNo_onclick, this);
            this.grid_BillModifyList.addEventHandler("oncellclick", this.grid_BillModifyList_oncellclick, this);
            this.st_ordNo.addEventHandler("onclick", this.st_ordDay_onclick, this);

        };

        this.loadIncludeScript("RTSDBillModify.xfdl");

       
    };
}
)();

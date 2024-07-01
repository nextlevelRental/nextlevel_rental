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
                this.set_name("RTSDProvisionalContractContact");
                this.set_classname("RTSDProvisionalContractContact");
                this.set_titletext("홈쇼핑가계약상담");
                this._setFormPosition(0,0,1147,505);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_provsnList", this);
            obj._setContents("<ColumnInfo><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"provsnTp\" type=\"STRING\" size=\"256\"/><Column id=\"provsnDay\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/><Column id=\"specNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"patternNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"STRING\" size=\"256\"/><Column id=\"period\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"provsnSt\" type=\"STRING\" size=\"256\"/><Column id=\"provsnStDtl\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"hshopTp\" type=\"STRING\" size=\"256\"/><Column id=\"hshopOrdno\" type=\"STRING\" size=\"256\"/><Column id=\"airDay\" type=\"STRING\" size=\"256\"/><Column id=\"airTm\" type=\"STRING\" size=\"256\"/><Column id=\"contactGet\" type=\"STRING\" size=\"256\"/><Column id=\"contactCnt\" type=\"STRING\" size=\"256\"/><Column id=\"custReq\" type=\"STRING\" size=\"256\"/><Column id=\"recallDay\" type=\"STRING\" size=\"256\"/><Column id=\"recallTm\" type=\"STRING\" size=\"256\"/><Column id=\"rsrvDay\" type=\"STRING\" size=\"256\"/><Column id=\"rsrvTm\" type=\"STRING\" size=\"256\"/><Column id=\"atflPathNm\" type=\"STRING\" size=\"256\"/><Column id=\"atflNm\" type=\"STRING\" size=\"256\"/><Column id=\"addMobNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S093", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S094", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S093_cond", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_S094_cond", this);
            obj.set_firefirstcount("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_provsnExcelList", this);
            obj._setContents("<ColumnInfo><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"provsnTp\" type=\"STRING\" size=\"256\"/><Column id=\"provsnDay\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/><Column id=\"specNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"patternNm\" type=\"STRING\" size=\"256\"/><Column id=\"cnt\" type=\"STRING\" size=\"256\"/><Column id=\"period\" type=\"STRING\" size=\"256\"/><Column id=\"regiAmt\" type=\"STRING\" size=\"256\"/><Column id=\"rentAmt\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"provsnSt\" type=\"STRING\" size=\"256\"/><Column id=\"provsnStDtl\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"hshopTp\" type=\"STRING\" size=\"256\"/><Column id=\"hshopOrdno\" type=\"STRING\" size=\"256\"/><Column id=\"airDay\" type=\"STRING\" size=\"256\"/><Column id=\"airTm\" type=\"STRING\" size=\"256\"/><Column id=\"contactGet\" type=\"STRING\" size=\"256\"/><Column id=\"media\" type=\"STRING\" size=\"256\"/><Column id=\"reqCustNm\" type=\"STRING\" size=\"256\"/><Column id=\"resCustNo\" type=\"STRING\" size=\"256\"/><Column id=\"contactCnt\" type=\"STRING\" size=\"256\"/><Column id=\"callDay\" type=\"STRING\" size=\"256\"/><Column id=\"callTm\" type=\"STRING\" size=\"256\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/><Column id=\"callChgId\" type=\"STRING\" size=\"256\"/><Column id=\"custReq\" type=\"STRING\" size=\"256\"/><Column id=\"recallDay\" type=\"STRING\" size=\"256\"/><Column id=\"recallTm\" type=\"STRING\" size=\"256\"/><Column id=\"rsrvDay\" type=\"STRING\" size=\"256\"/><Column id=\"rsrvTm\" type=\"STRING\" size=\"256\"/><Column id=\"chSml\" type=\"STRING\" size=\"256\"/><Column id=\"saleDesc\" type=\"STRING\" size=\"256\"/><Column id=\"addMobNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Dataset("ds_S096", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_imgYn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">A</Col><Col id=\"cdNm\">전체</Col></Row><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">존재</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">미존재</Col></Row></Rows>");
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

            obj = new Static("Static05", "absolute", "0", "120", "1123", "19", null, null, this);
            obj.set_taborder("3");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "146", "120", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_text("주문목록");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "159", "1122", "10", null, null, this);
            obj.set_taborder("6");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "486", null, null, this);
            obj.set_taborder("7");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("8");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_provsnList", "absolute", "9", "169", "1113", "186", null, null, this);
            obj.set_taborder("9");
            obj.set_binddataset("ds_provsnList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"96\"/><Column size=\"73\"/><Column size=\"90\"/><Column size=\"65\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"151\"/><Column size=\"73\"/><Column size=\"46\"/><Column size=\"56\"/><Column size=\"86\"/><Column size=\"35\"/><Column size=\"72\"/><Column size=\"45\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"방송사\"/><Cell col=\"1\" text=\"주문접수일\"/><Cell col=\"2\" text=\"가계약번호\"/><Cell col=\"3\" text=\"고객명\"/><Cell col=\"4\" text=\"연락처\"/><Cell col=\"5\" text=\"추가연락처\"/><Cell col=\"6\" text=\"주소\"/><Cell col=\"7\" text=\"예약접수일\"/><Cell col=\"8\" text=\"시간\"/><Cell col=\"9\" text=\"상태\"/><Cell col=\"10\" text=\"세부상태\"/><Cell col=\"11\" text=\"컨택\"/><Cell col=\"12\" text=\"재컨택일자\"/><Cell col=\"13\" text=\"시간\"/><Cell col=\"14\" text=\"진계약번호\"/><Cell col=\"15\" text=\"고객요청사항\"/></Band><Band id=\"body\"><Cell displaytype=\"combo\" text=\"bind:hshopTp\" combodataset=\"ds_S096\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"1\" text=\"bind:provsnDay\" mask=\"####-##-##\" suppress=\"0\"/><Cell col=\"2\" text=\"bind:provsnNo\" suppress=\"0\"/><Cell col=\"3\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:custNm\"/><Cell col=\"4\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:mobNo\"/><Cell col=\"5\" text=\"bind:addMobNo\"/><Cell col=\"6\" displaytype=\"normal\" style=\"align:left;\" text=\"bind:addr\"/><Cell col=\"7\" text=\"bind:rsrvDay\" mask=\"####-##-##\"/><Cell col=\"8\" displaytype=\"normal\" text=\"bind:rsrvTm\" mask=\"##:##\"/><Cell col=\"9\" displaytype=\"combo\" text=\"bind:provsnSt\" combodataset=\"ds_S093\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"10\" displaytype=\"combo\" text=\"bind:provsnStDtl\" combodataset=\"ds_S094\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"11\" text=\"bind:contactCnt\"/><Cell col=\"12\" text=\"bind:recallDay\" mask=\"####-##-##\"/><Cell col=\"13\" text=\"bind:recallTm\" mask=\"##:##\"/><Cell col=\"14\" text=\"bind:ordNo\"/><Cell col=\"15\" style=\"align:left;\" text=\"bind:custReq\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\"/><Cell col=\"2\"/><Cell col=\"3\" text=\"총계\"/><Cell col=\"4\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/><Cell col=\"5\"/><Cell col=\"6\" style=\"align:right;\"/><Cell col=\"7\"/><Cell col=\"8\"/><Cell col=\"9\"/><Cell col=\"10\"/><Cell col=\"11\"/><Cell col=\"12\"/><Cell col=\"13\"/><Cell col=\"14\"/><Cell col=\"15\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "10", "431", "1113", "31", null, null, this);
            obj.set_taborder("10");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNo", "absolute", "10", "431", "125", "31", null, null, this);
            obj.set_taborder("18");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNo", "absolute", "140", "436", "142", "21", null, null, this);
            obj.set_taborder("17");
            obj.set_maxlength("50");
            obj.set_readonly("true");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm", "absolute", "287", "431", "125", "31", null, null, this);
            obj.set_taborder("34");
            obj.set_text("연락처");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mobNo", "absolute", "417", "436", "142", "21", null, null, this);
            obj.set_taborder("35");
            obj.set_maxlength("14");
            obj.set_readonly("true");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Static("cust_birth_title", "absolute", "564", "431", "125", "31", null, null, this);
            obj.set_taborder("50");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_addr", "absolute", "694", "436", "419", "21", null, null, this);
            obj.set_taborder("19");
            obj.set_maxlength("200");
            obj.set_readonly("true");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_contractInfo", "absolute", "10", "374", "80", "21", null, null, this);
            obj.set_taborder("51");
            obj.set_text("주문정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "354", null, "15", "0", null, this);
            obj.set_taborder("52");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "391", "1147", "10", null, null, this);
            obj.set_taborder("53");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_contact", "absolute", "1077", "369", "45", "22", null, null, this);
            obj.set_taborder("54");
            obj.set_text("상담");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "10", "401", "1113", "31", null, null, this);
            obj.set_taborder("55");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordNo", "absolute", "1006", "406", "107", "21", null, null, this);
            obj.set_taborder("16");
            obj.set_readonly("true");
            obj.set_maxlength("100");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_statNm00", "absolute", "920", "401", "82", "31", null, null, this);
            obj.set_taborder("56");
            obj.set_text("진계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_saleNm00", "absolute", "545", "401", "82", "31", null, null, this);
            obj.set_taborder("57");
            obj.set_text("상태");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_provsnNo", "absolute", "270", "406", "107", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_readonly("true");
            obj.set_maxlength("20");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_chanNm00", "absolute", "184", "401", "82", "31", null, null, this);
            obj.set_taborder("58");
            obj.set_text("가계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNm00", "absolute", "10", "401", "82", "31", null, null, this);
            obj.set_taborder("59");
            obj.set_text("주문접수일");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("me_provsnDay", "absolute", "96", "406", "84", "21", null, null, this);
            obj.set_taborder("11");
            obj.set_readonly("true");
            obj.set_type("string");
            obj.set_mask("####-##-##");
            obj.style.set_align("left middle");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_saleNm01", "absolute", "381", "401", "82", "31", null, null, this);
            obj.set_taborder("60");
            obj.set_text("컨택횟수");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_contactCnt", "absolute", "467", "406", "74", "21", null, null, this);
            obj.set_taborder("13");
            obj.set_maxlength("8");
            obj.set_readonly("true");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_provsnSt", "absolute", "631", "406", "81", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("14");
            obj.set_innerdataset("@ds_S093");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_readonly("false");
            obj.set_enable("false");

            obj = new Combo("cmb_provsnStDtl", "absolute", "716", "406", "200", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("15");
            obj.set_innerdataset("@ds_S094");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_readonly("false");
            obj.set_enable("false");

            obj = new Grid("grid_provsnExcelList", "absolute", "28.6%", "219", null, "147", "35.14%", null, this);
            obj.set_taborder("62");
            obj.set_binddataset("ds_provsnExcelList");
            obj.set_visible("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"126\"/><Column size=\"80\"/><Column size=\"117\"/><Column size=\"465\"/><Column size=\"55\"/><Column size=\"106\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"237\"/><Column size=\"55\"/><Column size=\"54\"/><Column size=\"73\"/><Column size=\"63\"/><Column size=\"59\"/><Column size=\"64\"/><Column size=\"62\"/><Column size=\"49\"/><Column size=\"64\"/><Column size=\"76\"/><Column size=\"48\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"201\"/><Column size=\"67\"/><Column size=\"65\"/><Column size=\"80\"/><Column size=\"56\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell style=\"font:8 arial;\" text=\"주문접수일\"/><Cell col=\"1\" style=\"font:8 arial;\" text=\"가계약번호\"/><Cell col=\"2\" style=\"font:8 arial;\" text=\"고객명\"/><Cell col=\"3\" style=\"font:8 arial;\" text=\"연락처\"/><Cell col=\"4\" style=\"font:8 arial;\" text=\"주소\"/><Cell col=\"5\" style=\"font:8 arial;\" text=\"상태\"/><Cell col=\"6\" style=\"font:8 arial;\" text=\"세부상태\"/><Cell col=\"7\" style=\"font:8 arial;\" text=\"진계약번호\"/><Cell col=\"8\" style=\"font:8 arial;\" text=\"판매처\"/><Cell col=\"9\" style=\"font:8 arial;\" text=\"고객요청사항\"/><Cell col=\"10\" style=\"font:8 Arial Narrow;\" text=\"방송일자\"/><Cell col=\"11\" style=\"font:8 Arial Narrow;\" text=\"방송시간\"/><Cell col=\"12\" style=\"font:8 Arial Narrow;\" text=\"예약접수일\"/><Cell col=\"13\" style=\"font:8 Arial Narrow;\" text=\"예약접수시간\"/><Cell col=\"14\" style=\"font:8 Arial Narrow;\" text=\"미디어\"/><Cell col=\"15\" style=\"font:8 Arial Narrow;\" text=\"신청고객명\"/><Cell col=\"16\" style=\"font:8 Arial Narrow;\" text=\"고객번호\"/><Cell col=\"17\" style=\"font:8 Arial;\" text=\"소채널\"/><Cell col=\"18\" style=\"font:8 Arial;\" text=\"판매상세\"/><Cell col=\"19\" style=\"font:8 Arial;\" text=\"추가연락처\"/><Cell col=\"20\" style=\"font:8 arial;\" text=\"컨택횟수\"/><Cell col=\"21\" style=\"font:8 arial;\" text=\"상담일자\"/><Cell col=\"22\" style=\"font:8 arial;\" text=\"상담시간\"/><Cell col=\"23\" style=\"font:8 arial;\" text=\"상담내용\"/><Cell col=\"24\" style=\"font:8 arial;\" text=\"재컨택일자\"/><Cell col=\"25\" style=\"font:8 arial;\" text=\"재컨택시간\"/><Cell col=\"26\" style=\"font:8 arial;\" text=\"상담사\"/><Cell col=\"27\" text=\"방송사\"/></Band><Band id=\"body\"><Cell style=\"font:8 굴림체;\" text=\"bind:provsnDay\" suppress=\"0\"/><Cell col=\"1\" style=\"font:8 굴림체;\" text=\"bind:provsnNo\" suppress=\"0\"/><Cell col=\"2\" style=\"font:8 굴림체;\" text=\"bind:custNm\" suppress=\"0\"/><Cell col=\"3\" style=\"font:8 굴림체;\" text=\"bind:mobNo\" suppress=\"0\"/><Cell col=\"4\" style=\"align:left;font:8 굴림체;\" text=\"bind:addr\" suppress=\"0\"/><Cell col=\"5\" displaytype=\"combo\" style=\"font:8 굴림체;\" text=\"bind:provsnSt\" suppress=\"0\" combodataset=\"ds_S093\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"6\" displaytype=\"combo\" style=\"font:8 굴림체;\" text=\"bind:provsnStDtl\" suppress=\"0\" combodataset=\"ds_S094\" combocodecol=\"cd\" combodatacol=\"cdNm\"/><Cell col=\"7\" style=\"font:8 굴림체;\" text=\"bind:ordNo\" suppress=\"0\"/><Cell col=\"8\" displaytype=\"combo\" style=\"font:8 굴림체;\" text=\"bind:hshopTp\" suppress=\"0\" combodataset=\"ds_user\" combocodecol=\"userId\" combodatacol=\"userNm\"/><Cell col=\"9\" style=\"font:8 굴림체;\" text=\"bind:custReq\" suppress=\"0\"/><Cell col=\"10\" text=\"bind:airDay\"/><Cell col=\"11\" text=\"bind:airTm\"/><Cell col=\"12\" text=\"bind:rsrvDay\"/><Cell col=\"13\" text=\"bind:rsrvTm\"/><Cell col=\"14\" text=\"bind:media\"/><Cell col=\"15\" text=\"bind:reqCustNm\"/><Cell col=\"16\" text=\"bind:resCustNo\"/><Cell col=\"17\" text=\"bind:chSml\"/><Cell col=\"18\" text=\"bind:saleDesc\"/><Cell col=\"19\" text=\"bind:addMobNo\"/><Cell col=\"20\" style=\"font:8 굴림체;\" text=\"bind:contactCnt\" suppress=\"0\"/><Cell col=\"21\" style=\"font:8 굴림체;\" text=\"bind:callDay\"/><Cell col=\"22\" style=\"font:8 굴림체;\" text=\"bind:callTm\"/><Cell col=\"23\" style=\"align:left;font:8 굴림체;\" text=\"bind:callDtl\"/><Cell col=\"24\" style=\"font:8 굴림체;\" text=\"bind:recallDay\"/><Cell col=\"25\" style=\"font:8 굴림체;\" text=\"bind:recallTm\"/><Cell col=\"26\" style=\"font:8 굴림체;\" text=\"bind:callChgId\"/><Cell col=\"27\" displaytype=\"combo\" text=\"bind:hshopTp\" combodataset=\"ds_S096\" combocodecol=\"cd\" combodatacol=\"cdNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "10", "461", "1113", "31", null, null, this);
            obj.set_taborder("63");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordQty00", "absolute", "617", "461", "92", "31", null, null, this);
            obj.set_taborder("64");
            obj.set_text("고객요청사항");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_contactGet", "absolute", "714", "466", "399", "21", null, null, this);
            obj.set_taborder("65");
            obj.set_readonly("true");
            obj.set_maxlength("200");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNm01", "absolute", "10", "461", "82", "31", null, null, this);
            obj.set_taborder("66");
            obj.set_text("예약접수일");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("me_rsrvDay", "absolute", "96", "466", "84", "21", null, null, this);
            obj.set_taborder("67");
            obj.set_readonly("true");
            obj.set_type("string");
            obj.set_mask("####-##-##");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNm02", "absolute", "186", "461", "92", "31", null, null, this);
            obj.set_taborder("68");
            obj.set_text("예약접수시간");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("me_rsrvTm", "absolute", "284", "466", "84", "21", null, null, this);
            obj.set_taborder("69");
            obj.set_readonly("true");
            obj.set_type("string");
            obj.set_mask("##:##");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new FileDownload("FileDownload", "absolute", "766", "370", "100", "21", null, null, this);
            obj.set_taborder("70");
            obj.getSetter("retry").set("0");
            obj.set_text("파일다운로드");
            obj.set_visible("false");
            obj.set_enableevent("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_img", "absolute", "1028", "369", "45", "22", null, null, this);
            obj.set_taborder("71");
            obj.set_text("이미지");
            obj.set_cssclass("btn_WF_module");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm00", "absolute", "373", "461", "92", "31", null, null, this);
            obj.set_taborder("72");
            obj.set_text("추가연락처");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_addMobNo", "absolute", "470", "466", "142", "21", null, null, this);
            obj.set_taborder("73");
            obj.set_readonly("true");
            obj.set_maxlength("14");
            this.addChild(obj.name, obj);

            obj = new Tab("tab_cond", "absolute", "0.7%", "0", null, "145", "2.27%", null, this);
            obj.set_taborder("74");
            obj.set_tabindex("0");
            obj.set_scrollbars("autoboth");
            this.addChild(obj.name, obj);
            obj = new Tabpage("tabpage1", this.tab_cond);
            obj.set_text("조건1");
            obj.set_url("sd::RTSDHomeShoppingContractContact_tab01.xfdl");
            this.tab_cond.addChild(obj.name, obj);
            obj = new Tabpage("tabpage2", this.tab_cond);
            obj.set_text("조건2");
            obj.set_url("sd::RTSDHomeShoppingContractContact_tab02.xfdl");
            this.tab_cond.addChild(obj.name, obj);
            obj = new Tabpage("tabpage3", this.tab_cond);
            obj.set_text("조건3");
            obj.set_url("sd::RTSDHomeShoppingContractContact_tab03.xfdl");
            this.tab_cond.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 505, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDProvisionalContractContact");
            		p.set_titletext("홈쇼핑가계약상담");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_custNo","value","ds_provsnList","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_mobNo","value","ds_provsnList","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","ed_addr","value","ds_provsnList","addr");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_ordNo","value","ds_provsnList","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","ed_provsnNo","value","ds_provsnList","provsnNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","me_provsnDay","value","ds_provsnList","provsnDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","ed_contactCnt","value","ds_provsnList","contactCnt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","cmb_provsnSt","value","ds_provsnList","provsnSt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","cmb_provsnStDtl","value","ds_provsnList","provsnStDtl");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","ed_contactGet","value","ds_provsnList","custReq");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","me_rsrvDay","value","ds_provsnList","rsrvDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","me_rsrvTm","value","ds_provsnList","rsrvTm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_addMobNo","value","ds_provsnList","addMobNo");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "sd::RTSDHomeShoppingContractContact_tab01.xfdl");
            this._addPreloadList("fdl", "sd::RTSDHomeShoppingContractContact_tab02.xfdl");
            this._addPreloadList("fdl", "sd::RTSDHomeShoppingContractContact_tab03.xfdl");
        };
        
        // User Script
        this.addIncludeScript("RTSDHomeShoppingContractContact.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDHomeShoppingContractContact.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTSDHomeShoppingContractContact.xfdl
         * 설    명 : 홈쇼핑가계약상담
         * 작 성 자 : 
         * 변경이력 :
         * ---------------------------------
         * 변경일자		변경자		변경내용
         * ---------------------------------
         * ...			...			...
         * 2017-01-18	wjim		[20170118_01] 상태수정 기준 변경
         *							- 변경전 : '완료'상태 전이 시 이후 수정 불가
         *							- 변경후 : '완료'상태 이후에도 수정 가능
         * 2017-04-12	wjim		[20170412_01] '이미지' 조회조건 추가
         * 2017-06-20	wjim		[20170612_01] SMS연동
         *							- 상담팝업으로 SMS관련항목 연동
         * 2017-09-22	wjim		[20170922_01] O/B 상담실 개선요청
         *							- '방송사' 조회조건에 '전체' 추가
         *							- '추가연락처' 추가
         *							- '진계약번호' Copy & Paste 가능
         * 2019-07-08	wjim		[20190708_01] 엑셀 다운로드를 조회와 transaction 분리
         * 2019-07-16	wjim		[20190716_01] 조회조건 tab 적용
         * 2019-08-08	wjim		[20190808_01] 조회조건3 상담사 조회조건 추가
         ***************************************************************************************************/

        //include "lib::comLib.xjs";

        // 전역변수
        this.toDay    = "";
        this.END_STCD = "50";	// 완료 상태코드					
        this.fUserId  = "";		// 현재 로그인 사용자의 ID
        this.fUserGrp = "";		// 현재 로그인 사용자의 사용자그룹

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDProvisionalContractContact_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.parent.setButton("E|C|S", this);
        	this.fn_init();
        }

        /**
         * 화면 초기화
         */
        this.fn_init = function() {
        	// 공통코드 조회
        	this.fn_getCommCode();
        	//홈쇼핑종류 조회
        	this.fn_getHomeCodeInfo();	
        	// 기준년월 조회
        	this.fn_initYmd();
        	// 조회조건-이미지 초기화 (초기값 = 전체) [20170412_01]
        	this.tab_cond.tabpage1.div_search.cmb_imgYn.set_value("A");			
        	// 사용자정보 설정 
        	this.fUserId  = application.gds_userInfo.getColumn(0, "userId" );
        	this.fUserGrp = application.gds_userInfo.getColumn(0, "userGrp");
        }

        /**
         * 공통코드 조회
         */ 
        this.fn_getCommCode  = function() {
        	var sSvcID      	= "getCommCode";  
        	var sController   	= "rtms/sd/commCodeProvisionalContract.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_S093=ds_S093 ds_S094=ds_S094";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }	

        //-------------------------------------------------------------------------------  	
        //홈쇼핑 종류 조회
        //------------------------------------------------------------------------------- 
        this.fn_getHomeCodeInfo = function() 
        {
        	var sSvcID      	= "getHomeCode";  
        	var sController   	= "/listCommInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_S096=listBroadCast";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("nodeNm", 	"listBroadCast");	//리턴받을 DstaSet이름
        	sArgs += Ex.util.setParam("cdGrpCd", 	"S096");		    //공통 그룹코드
        	sArgs += Ex.util.setParam("useYn", 		"Y");			    //사용여부
        	sArgs += Ex.util.setParam("cdNm","");

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }

        /**
         * 서버기준 오늘 날자 조회 후 세팅
         */
        this.fn_initYmd = function() {
        	var sSvcID      	= "getToday";  
        	var sController   	= "ntrms/re/getDayMongth.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        /**
         * 조회 버튼의 클릭 이벤트 처리
         */
        this.fn_search = function() {
        	var sArgs = "";
        	
        	sArgs += Ex.util.setParam("provsnTp", "H"                   );
        	sArgs += Ex.util.setParam("tabIndex", this.tab_cond.tabindex);

        	//this.alert(this.tab_cond.tabindex);	
        	
        	if (this.tab_cond.tabindex == 0) {
        		var day = 1000 * 60 * 60 * 24;
        		var custNm = this.tab_cond.tabpage1.div_search.ed_custNm.text;
        		var mobNo = this.tab_cond.tabpage1.div_search.ed_mobNo.text;
        		var provsnNo = this.tab_cond.tabpage1.div_search.ed_provsnNoF.text
        		var recallDay = this.tab_cond.tabpage1.div_search.cal_recallDay.value;
        		
        		//고객명, 휴대폰번호, 가계약번호, 재컨택일자중 조건이 하나라도 걸려 있지 않으면 
        		//조회일 기준으로 30일까지만 조회
        		//2018.12.06 김선태
        		if(nvl(custNm) == "" && nvl(mobNo) == "" && nvl(provsnNo) == "" && nvl(recallDay) == ""){	
        			//주문접수일
        			var provsnFrom = this.tab_cond.tabpage1.div_search.cal_condProvsnDayFrom.text.split('-');
        			var provsnTo = this.tab_cond.tabpage1.div_search.cal_condProvsnDayTo.text.split('-');

        			if(nvl(provsnFrom ) == "" || nvl(provsnTo) == "") {
        				alert("주문접수일은 시작일/종료일 모두 입력해야 합니다.");
        				return;
        			}
        			
        			var provsnFromDate = new Date(provsnFrom[0], provsnFrom[1], provsnFrom[2]);
        			var provsnToDate = new Date(provsnTo[0], provsnTo[1], provsnTo[2]);

        			var provsnDiff = provsnToDate - provsnFromDate;
        				
        			var provsnDiffDay = parseInt(provsnDiff/day);
        			
        			//상담일자
        			var callFrom = this.tab_cond.tabpage1.div_search.cal_condCallDayFrom.text.split('-');
        			var callTo = this.tab_cond.tabpage1.div_search.cal_condCallDayTo.text.split('-');
        			
        			var callFromDate = new Date(callFrom[0], callFrom[1], callFrom[2]);
        			var callToDate = new Date(callTo[0], callTo[1], callTo[2]);
        			
        			var callDiff = callToDate - callFromDate;
        			
        			var callDiffDay = parseInt(callDiff/day);
        			
        			if(provsnDiffDay > 30) {
        				alert("주문접수일 조회기간은 30일 이내로 지정해 주세요.");
        				return;
        			}
        			
        			if(callDiffDay > 30) {
        				alert("상담일자 조회기간은 30일 이내로 지정해 주세요.");
        				return;
        			}
        		}		
        		
        		sArgs += Ex.util.setParam("provsnDayFrom", this.tab_cond.tabpage1.div_search.cal_condProvsnDayFrom.value);
        		sArgs += Ex.util.setParam("provsnDayTo"  , this.tab_cond.tabpage1.div_search.cal_condProvsnDayTo.value  );
        		sArgs += Ex.util.setParam("custNm"       , this.tab_cond.tabpage1.div_search.ed_custNm.value            );
        		sArgs += Ex.util.setParam("provsnSt"     , this.tab_cond.tabpage1.div_search.cmb_condProvsnSt.value     );
        		sArgs += Ex.util.setParam("provsnStDtl"  , this.tab_cond.tabpage1.div_search.cmb_condProvsnStDtl.value  );
        		sArgs += Ex.util.setParam("mobNo"        , this.tab_cond.tabpage1.div_search.ed_mobNo.value             );
        		sArgs += Ex.util.setParam("callId"       , this.tab_cond.tabpage1.div_search.ed_callId.value            );
        		sArgs += Ex.util.setParam("callDayFrom"  , this.tab_cond.tabpage1.div_search.cal_condCallDayFrom.value  );
        		sArgs += Ex.util.setParam("callDayTo"    , this.tab_cond.tabpage1.div_search.cal_condCallDayTo.value    );
        		sArgs += Ex.util.setParam("hshopTp"      , this.tab_cond.tabpage1.div_search.cmb_homeshoppingList.value );		
        		sArgs += Ex.util.setParam("recallDay"    , this.tab_cond.tabpage1.div_search.cal_recallDay.value        ); // 재컨택일자
        		sArgs += Ex.util.setParam("provsnNoF"    , this.tab_cond.tabpage1.div_search.ed_provsnNoF.text          );
        		sArgs += Ex.util.setParam("provsnNoT"    , this.tab_cond.tabpage1.div_search.ed_provsnNoT.text          );
        		sArgs += Ex.util.setParam("atflYn"       , this.tab_cond.tabpage1.div_search.cmb_imgYn.value            ); // 이미지 [20170412_01]
        		
        	} else if (this.tab_cond.tabindex == 1) {
        		sArgs += Ex.util.setParam("custNm"       , this.tab_cond.tabpage2.div_search.ed_custNm.value            );
        		sArgs += Ex.util.setParam("mobNo"        , this.tab_cond.tabpage2.div_search.ed_mobNo.value             );
        		sArgs += Ex.util.setParam("provsnNoF"    , this.tab_cond.tabpage2.div_search.ed_provsnNoF.text          );
        		sArgs += Ex.util.setParam("provsnNoT"    , this.tab_cond.tabpage2.div_search.ed_provsnNoT.text          );
        	
        	} else if (this.tab_cond.tabindex == 2) {
        		sArgs += Ex.util.setParam("recallDay"    , this.tab_cond.tabpage3.div_search.cal_recallDay.value        );
        		sArgs += Ex.util.setParam("callId"       , this.tab_cond.tabpage3.div_search.ed_callId.value            ); // 상담사 [20190808_01]
        	}
        	
        	// 기존 조회결과 초기화
        	this.ds_provsnList.deleteAll();
        	
        	var sSvcID        	= "listProvsn";                    
        	var sController   	= "rtms/sd/listProvisionalContract.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_provsnList=ds_provsnList";
        	var fn_callBack		= "fn_callBack";
        	
        	application.set_httptimeout(600);
        	 
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * 저장 버튼의 클릭 이벤트 처리
         */
        this.fn_save = function() {

        	//주문완료건에 진계약번호가 입력되지 않았는지 체크
        	var strStCd    = this.ds_provsnList.getColumn(this.ds_provsnList.rowposition, "provsnSt");	
        	
        	if (strStCd == this.END_STCD && this.ed_ordNo.text == "") {
        		this.alert("주문완료::진계약번호가 입력되지 않았습니다.");
        		return false;
        	}
        	var cnt = 0;
        	for( var i = 0 ; i < this.ds_provsnList.getRowCount() ; i++ ){
        		var iRowType = this.ds_provsnList.getRowType(i);		
        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        			cnt++;
        			}
        		}
        		
        	if(cnt != 0){
        	
        		if (confirm( "저장하시겠습니까?")) {
        			var sSvcID        	= "saveProvsn";                    
        			var sController   	= "rtms/sd/saveProvisionalContract.do";
        			var sInDatasets   	= "ds_provsnList=ds_provsnList:U";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}else{	
        		alert("변경된 데이터가 없습니다!");
        		return false; 
        	}
        }

        /**
         * 엑셀 버튼의 클릭 이벤트 처리
         */
        this.fn_excel= function() {
        	if (this.tab_cond.tabindex != 0) {
        		this.alert("조건1에서만 엑셀조회 및 다운로드 가능합니다.");
        		return;
        	}

        	var day       = 1000 * 60 * 60 * 24;
        	var custNm    = this.tab_cond.tabpage1.div_search.ed_custNm.text;
        	var mobNo     = this.tab_cond.tabpage1.div_search.ed_mobNo.text;
        	var provsnNo  = this.tab_cond.tabpage1.div_search.ed_provsnNoF.text
        	var recallDay = this.tab_cond.tabpage1.div_search.cal_recallDay.value;
        	
        	//고객명, 휴대폰번호, 가계약번호, 재컨택일자중 조건이 하나라도 걸려 있지 않으면 
        	//조회일 기준으로 30일까지만 조회
        	//2018.12.06 김선태
        	if(nvl(custNm) == "" && nvl(mobNo) == "" && nvl(provsnNo) == "" && nvl(recallDay) == ""){	
        		//주문접수일
        		var provsnFrom = this.tab_cond.tabpage1.div_search.cal_condProvsnDayFrom.text.split('-');
        		var provsnTo = this.tab_cond.tabpage1.div_search.cal_condProvsnDayTo.text.split('-');

        		if(nvl(provsnFrom ) == "" || nvl(provsnTo) == "") {
        			alert("주문접수일은 시작일/종료일 모두 입력해야 합니다.");
        			return;
        		}
        				
        		var provsnFromDate = new Date(provsnFrom[0], provsnFrom[1], provsnFrom[2]);
        		var provsnToDate = new Date(provsnTo[0], provsnTo[1], provsnTo[2]);

        		var provsnDiff = provsnToDate - provsnFromDate;			
        		var provsnDiffDay = parseInt(provsnDiff/day);
        		
        		//상담일자
        		var callFrom = this.tab_cond.tabpage1.div_search.cal_condCallDayFrom.text.split('-');
        		var callTo = this.tab_cond.tabpage1.div_search.cal_condCallDayTo.text.split('-');
        		
        		var callFromDate = new Date(callFrom[0], callFrom[1], callFrom[2]);
        		var callToDate = new Date(callTo[0], callTo[1], callTo[2]);
        		
        		var callDiff = callToDate - callFromDate;		
        		var callDiffDay = parseInt(callDiff/day);
        		
        		if(provsnDiffDay > 30) {
        			alert("주문접수일 조회기간은 30일 이내로 지정해 주세요.");
        			return;
        		}
        		
        		if(callDiffDay > 30) {
        			alert("상담일자 조회기간은 30일 이내로 지정해 주세요.");
        			return;
        		}
        	}
        	
        	// 기존 조회결과 초기화
        	this.ds_provsnExcelList.deleteAll();
        	
        	var sSvcID        	= "listExcelProvsn";                    
        	var sController   	= "rtms/sd/listExcelProvisionalContract.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_provsnExcelList=ds_provsnExcelList";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("provsnTp"     , "H"                                                          );
        	sArgs += Ex.util.setParam("provsnDayFrom", this.tab_cond.tabpage1.div_search.cal_condProvsnDayFrom.value);
        	sArgs += Ex.util.setParam("provsnDayTo"  , this.tab_cond.tabpage1.div_search.cal_condProvsnDayTo.value  );
        	sArgs += Ex.util.setParam("custNm"       , this.tab_cond.tabpage1.div_search.ed_custNm.value            );
        	sArgs += Ex.util.setParam("provsnSt"     , this.tab_cond.tabpage1.div_search.cmb_condProvsnSt.value     );
        	sArgs += Ex.util.setParam("provsnStDtl"  , this.tab_cond.tabpage1.div_search.cmb_condProvsnStDtl.value  );
        	sArgs += Ex.util.setParam("mobNo"        , this.tab_cond.tabpage1.div_search.ed_mobNo.value             );
        	sArgs += Ex.util.setParam("callId"       , this.tab_cond.tabpage1.div_search.ed_callId.value            );
        	sArgs += Ex.util.setParam("callDayFrom"  , this.tab_cond.tabpage1.div_search.cal_condCallDayFrom.value  );
        	sArgs += Ex.util.setParam("callDayTo"    , this.tab_cond.tabpage1.div_search.cal_condCallDayTo.value    );
        	sArgs += Ex.util.setParam("hshopTp"      , this.tab_cond.tabpage1.div_search.cmb_homeshoppingList.value );		
        	sArgs += Ex.util.setParam("recallDay"    , this.tab_cond.tabpage1.div_search.cal_recallDay.value        ); // 재컨택일자
        	sArgs += Ex.util.setParam("provsnNoF"    , this.tab_cond.tabpage1.div_search.ed_provsnNoF.text          );
        	sArgs += Ex.util.setParam("provsnNoT"    , this.tab_cond.tabpage1.div_search.ed_provsnNoT.text          );
        	sArgs += Ex.util.setParam("atflYn"       , this.tab_cond.tabpage1.div_search.cmb_imgYn.value            );	// 이미지 [20170412_01]
        	
        	application.set_httptimeout(600);
        	 
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		case "getCommCode":
        			// 조회조건-상태 초기화
        			this.tab_cond.tabpage1.ds_S093_cond.copyData(this.ds_S093);
        			var insert = this.tab_cond.tabpage1.ds_S093_cond.insertRow(0);
        			this.tab_cond.tabpage1.ds_S093_cond.setColumn(insert,"cd","");
        			this.tab_cond.tabpage1.ds_S093_cond.setColumn(insert,"cdNm","전체");			
        			this.tab_cond.tabpage1.div_search.cmb_condProvsnSt.set_value("");
        			
        			// 조회조건-(세부)상태 초기화
        			this.tab_cond.tabpage1.ds_S094_cond.copyData(this.ds_S094);			
        			insert = this.tab_cond.tabpage1.ds_S094_cond.insertRow(0);
        			this.tab_cond.tabpage1.ds_S094_cond.setColumn(insert,"cd","");
        			this.tab_cond.tabpage1.ds_S094_cond.setColumn(insert,"cdNm","전체");
        			this.tab_cond.tabpage1.div_search.cmb_condProvsnStDtl.set_value("");

        		    break;
        		
        		case "getHomeCode":
        			// 조회조건-방송사 초기화 [20170922_01]
        			this.tab_cond.tabpage1.ds_S096.copyData(this.ds_S096);
        			var insert = this.tab_cond.tabpage1.ds_S096.insertRow(0);
        			this.tab_cond.tabpage1.ds_S096.setColumn(insert,"cd","");
        			this.tab_cond.tabpage1.ds_S096.setColumn(insert,"cdNm","전체");
        			this.tab_cond.tabpage1.div_search.cmb_homeshoppingList.set_value("");
        			break;
        			
        		case "getToday":
        			this.tab_cond.tabpage1.div_search.cal_condProvsnDayFrom.set_value(this.toDay);
        			this.tab_cond.tabpage1.div_search.cal_condProvsnDayTo.set_value(this.toDay);
        			break;
        			
        		case "listProvsn":
        			var rowCt = this.ds_provsnList.getRowCount();

        			if( rowCt == 0 ){
        				this.alert("조회된 데이터가 없습니다.");
        				this.grid_provsnList.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        			
        			this.fn_setStComboActive(0);
        			this.fn_filtStDtl("ROW_IDX", 0);
        			
        			var strAtflPathNm = nvl(this.ds_provsnList.getColumn(0, "atflPathNm"));	// 첨부파일경로명
        			var strAtflNm     = nvl(this.ds_provsnList.getColumn(0, "atflNm"));		// 첨부파일명
        			
        			if (strAtflPathNm != "" && strAtflNm != "") {
        				this.btn_img.set_visible(true);
        			} else {
        				this.btn_img.set_visible(false);
        			}

        			break;

        		case "listExcelProvsn":
        			var rowCt = this.ds_provsnExcelList.getRowCount();
        			
        			if (rowCt == 0) {
        				this.alert("조회된 엑셀데이터가 없습니다.");
        				this.grid_provsnExcelList.set_nodatatext("조회된 데이터가 없습니다.");
        			} else {
        				Ex.core.exportExcel(this, this.grid_provsnExcelList);
        			}
        			
        			break;
        			
        		case "saveProvsn":
        			this.alert(strErrorMsg);
        			break;
        		
        		default:
        			break;
        	}
        }

        
        /**
         * 가계약정보의 상태 콤보 활성화 여부 동적 처리
         */
        this.fn_setStComboActive = function (pRowIdx) {	
        	var strStCd    = this.ds_provsnList.getColumn(pRowIdx, "provsnSt");	
        	var strRowType = this.ds_provsnList.getRowType(pRowIdx);
        	
        	if (this.fUserGrp == "01" || this.fUserGrp == "02" || this.fUserGrp == "13") {
        		/* [2017018_01]
        		if (strStCd == this.END_STCD && strRowType != Dataset.ROWTYPE_UPDATE) {
        			this.cmb_provsnSt.set_enable(false);
        			this.cmb_provsnStDtl.set_enable(false);
        		} else {
        			this.cmb_provsnSt.set_enable(true);
        			this.cmb_provsnStDtl.set_enable(true);
        		}
        		*/ 
        		this.cmb_provsnSt.set_enable(true);		//[2017018_01]
        		this.cmb_provsnStDtl.set_enable(true);	//[2017018_01]
        	} else {
        		this.cmb_provsnSt.set_enable(false);
         		this.cmb_provsnStDtl.set_enable(false);
        	} 	
        }

        /**
         * 상태에 따른 상세상태 콤보 필터링
         */
        this.fn_filtStDtl = function (pMod,pArg) {
        	var strStCd;
        	
        	if (pMod == "VALUE") {
        		strStCd = pArg;
        	} else if (pMod == "ROW_IDX") {
        		strStCd = this.ds_provsnList.getColumn(pArg, "provsnSt");
        	}
        	
         	this.ds_S094.filter("cd.substr(0,2) == '" + strStCd + "'");
        }

        /**
         * 가계약목록 데이터셋의 행의 위치가 변경되기 전 이벤트 처리
         */
        this.ds_provsnList_canrowposchange = function(obj,e) {
        	// 상태만 수정하고 상세상태를 선택하지 않은 상태로 다른 행으로 이동하려 할 때 오류 처리
        	if (e.newrow != -1) {
        		if (!this.fn_chkStDtl(e.oldrow)) {
        			this.alert("상세상태값이 정상적으로 선택되지 않았습니다.");
        			return false;
        		}
        		
        		this.fn_filtStDtl("ROW_IDX", e.newrow);				// 상세상태 콤보 필터링
        		this.fn_setStComboActive(e.newrow);					// 상태 콤보 활성화 설정
        		this.fn_setOrdNoEdActive("ROW_IDX", e.newrow);		// 진계약번호 입력창 활성화 설정
        	}	
        }

        /**
         * 상태와 세부상태의 매핑이 정상인지 확인
         */
        this.fn_chkStDtl = function (pRowIdx) {
        	var chkResult = true;
        		
        	var strProvsnSt    = this.ds_provsnList.getColumn(pRowIdx, "provsnSt");
        	var strProvsnStDtl = this.ds_provsnList.getColumn(pRowIdx, "provsnStDtl");
        	
        	if (strProvsnSt != strProvsnStDtl.substr(0,2)) {
        		chkResult = false;
        	}
        	
        	return chkResult;
        }

        /**
         * 상태와 세부상태의 매핑이 정상인지 확인
         */
        this.fn_chkOrdNo = function (pRowIdx) {
        	var chkResult = true;

        	var strProvsnSt    = this.ds_provsnList.getColumn(pRowIdx, "provsnSt");
        	var strProvsnSt    = this.ds_provsnList.getColumn(pRowIdx, "ordNo");
        	
        	if (strProvsnSt ) {
        		chkResult = false;
        	}
        	
        	return chkResult;
        }

        /**
         * 가계약정보의 진계약번호 입력창 활성화여부 동적 처리
         */
        this.fn_setOrdNoEdActive = function (pMod,pArg) {	
        	var strStCd;
        	var strRowType;
        	
        	if (pMod == "VALUE") {
        		strStCd    = pArg;
        		strRowType = Dataset.ROWTYPE_UPDATE;
        	} else if (pMod == "ROW_IDX") {
        		strStCd    = this.ds_provsnList.getColumn(pArg, "provsnSt");
        		strRowType = this.ds_provsnList.getRowType(pArg);
        	}
        	
        	if (this.fUserGrp == "01" || this.fUserGrp == "02" || this.fUserGrp == "13") { 
        		/*
        		if (strStCd == this.END_STCD && strRowType == Dataset.ROWTYPE_UPDATE) {
        			this.ed_ordNo.set_enable(true);
        		} else {
        			this.ed_ordNo.set_enable(false);
        		}
        		*/
        		//this.ed_ordNo.set_enable(true);	//[20170118_01]
        		this.ed_ordNo.set_readonly(false);	//[20170922_01]
        	} else {
        		//this.ed_ordNo.set_enable(false);
        		this.ed_ordNo.set_readonly(true);	//[20170922_01]
        	}	
        }

        /**
         * 가계약목록 그리드의 Body 영역 셀 클릭 이벤트 처리
         * - 첨부파일이 존재하는 경우에만 [이미지]버튼 보이기
         */
        this.grid_provsnList_oncellclick = function(obj,e) {
        	var strAtflPathNm = nvl(this.ds_provsnList.getColumn(e.row, "atflPathNm"));	// 첨부파일경로명
        	var strAtflNm     = nvl(this.ds_provsnList.getColumn(e.row, "atflNm"));		// 첨부파일명

        	if (strAtflPathNm != "" && strAtflNm != "") {
        		this.btn_img.set_visible(true);
        	} else {
        		this.btn_img.set_visible(false);
        	}
        }

        /**
         * 가계약목록 그리드의 Body 영역 셀 더블 클릭 이벤트 처리
         */
        this.grid_provsnList_oncelldblclick = function(obj,e) {
        	this.btn_del_onclick();
        }

        /**
         * 이미지 버튼의 클릭 이벤트 처리
         */
        this.btn_img_onclick = function(obj,e) {
        	var strAtflPathNm = nvl(this.ds_provsnList.getColumn(this.grid_provsnList.currentrow, "atflPathNm"));	// 첨부파일경로명
        	var strAtflNm     = nvl(this.ds_provsnList.getColumn(this.grid_provsnList.currentrow, "atflNm"));		// 첨부파일명
        	
        	if (strAtflPathNm != "" && strAtflNm != "") {
        		//this.alert("strAtflPathNm = [" + strAtflPathNm + "]");
        		//this.alert("strAtflNm = [" + strAtflNm + "]");
        		
        		var sFileUrl = "/rtms/sd/fileDownCustTire.do?filePath=" + strAtflPathNm + "&fileName=" + strAtflNm;
        		this.FileDownload.set_downloadurl(sFileUrl);
        		var bSucc = this.FileDownload.download();
        	} else {
        		this.alert("첨부파일정보가 존재하지 않습니다([" + strAtflPathNm + "][" + strAtflNm + "])");
        		return false;
        	}
        }

        /**
         * 상담 버튼의 클릭 이벤트 처리
         */
        this.btn_del_onclick = function(obj,e) {	
        	if (this.ds_provsnList.getRowCount() < 1) {
        		this.alert("상담할 계약대상이 존재하지 않습니다.");
        		return false;
        	}
        	
        	var strProvsnNo = this.ds_provsnList.getColumn(this.grid_provsnList.currentrow, "provsnNo");
        	var strMobNo    = this.ds_provsnList.getColumn(this.grid_provsnList.currentrow, "mobNo");
        	
        	// 팝업화면 연동 파라미터 세팅
        	// - 연락처 추가 [20170612_01]
        	var arr ={
        		  p_provsnNo : strProvsnNo
        		, p_today    : this.toDay
        		, p_userGrp  : this.fUserGrp
        		, p_mobNo    : strMobNo
        	};
        			
        	Ex.core.popup(this, "홈쇼핑주문상담", "sd::RTSDHomeShoppingContractContactPopUp.xfdl", arr, "modaless=false");
        }

        /**
         * 상태 콤보에서 변경된 값이 적용된 후 이벤트 처리
         */
        this.cmb_provsnSt_onitemchanged = function(obj,e) {
        	this.fn_filtStDtl("VALUE", e.postvalue);			// 상세상태 콤보 필터링	
        	this.fn_setOrdNoEdActive("VALUE", e.postvalue);		// 진계약번호 입력항목 활성화
        }

        
        /**
         * TabPage가 변경되기 직전 이벤트 처리
         * - 기존 조회결과가 존재하는 경우 확인 후 삭제
         */
        this.tab_cond_canchange = function(obj,e) {	
        	if (this.ds_provsnList.getRowCount() > 0) {
        		if (this.confirm("조회조건탭을 변경하면 기존 조회결과가 초기화됩니다.\n진행하시겠습니까?")) {
        			// 기존 조회결과 초기화
        			this.ds_provsnList.deleteAll();
        		} else {
        			return false;
        		}
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_provsnList.addEventHandler("canrowposchange", this.ds_provsnList_canrowposchange, this);
            this.ds_provsnExcelList.addEventHandler("canrowposchange", this.ds_provsnList_canrowposchange, this);
            this.ds_user.addEventHandler("onrowposchanged", this.checkSaveMode, this);
            this.ds_S096.addEventHandler("onrowposchanged", this.checkSaveMode, this);
            this.addEventHandler("onload", this.RTSDProvisionalContractContact_onload, this);
            this.grid_provsnList.addEventHandler("oncelldblclick", this.grid_provsnList_oncelldblclick, this);
            this.grid_provsnList.addEventHandler("oncellclick", this.grid_provsnList_oncellclick, this);
            this.btn_contact.addEventHandler("onclick", this.btn_del_onclick, this);
            this.cmb_provsnSt.addEventHandler("onitemchanged", this.cmb_provsnSt_onitemchanged, this);
            this.btn_img.addEventHandler("onclick", this.btn_img_onclick, this);
            this.tab_cond.addEventHandler("canchange", this.tab_cond_canchange, this);

        };

        this.loadIncludeScript("RTSDHomeShoppingContractContact.xfdl");
        this.loadPreloadList();
       
    };
}
)();

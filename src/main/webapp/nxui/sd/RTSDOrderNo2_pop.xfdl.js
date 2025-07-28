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
                this.set_name("RTSDOrderNo2_pop");
                this.set_classname("RTCOMMOrderNo_pop");
                this.set_titletext("패키지묶음 팝업");
                this._setFormPosition(0,0,1145,580);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_custTpCd", this);
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

            obj = new Dataset("ds_statCd", this);
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

            obj = new Dataset("ds_lfCd", this);
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

            obj = new Dataset("ds_genderCd", this);
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

            obj = new Dataset("ds_ordNoListCp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderNm\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carKind\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderNm\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carKind\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"grpCnt\" type=\"STRING\" size=\"256\"/><Column id=\"grpSt\" type=\"STRING\" size=\"256\"/><Column id=\"grpDcRate\" type=\"STRING\" size=\"256\"/><Column id=\"grpDcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_ordNoListSave", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderNm\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carKind\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"grpDcRate\" type=\"STRING\" size=\"256\"/><Column id=\"grpDcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"dcGubun\" type=\"STRING\" size=\"256\"/><Column id=\"dcCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_TopMenuNoList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"dcGb\" type=\"STRING\" size=\"256\"/><Column id=\"grpStdNm\" type=\"STRING\" size=\"256\"/><Column id=\"dcRate\" type=\"STRING\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"grpCnt\" type=\"STRING\" size=\"256\"/><Column id=\"dcCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_TopMenuNoList2", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_restCnt", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"grpStdNm\" type=\"STRING\" size=\"256\"/><Column id=\"dcCd\" type=\"STRING\" size=\"256\"/><Column id=\"dcRate\" type=\"STRING\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"minCnt\" type=\"STRING\" size=\"256\"/><Column id=\"maxCnt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_ordNoListSave00", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"chk\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"buslNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"genderCd\" type=\"STRING\" size=\"256\"/><Column id=\"genderNm\" type=\"STRING\" size=\"256\"/><Column id=\"lfCd\" type=\"STRING\" size=\"256\"/><Column id=\"lfNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo2\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carKind\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"instDay\" type=\"STRING\" size=\"256\"/><Column id=\"seasonCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"hshopGbNm\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"grpNo\" type=\"STRING\" size=\"256\"/><Column id=\"grpDcRate\" type=\"STRING\" size=\"256\"/><Column id=\"grpDcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"dcGubun\" type=\"STRING\" size=\"256\"/><Column id=\"dcCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grid_ordNoList", "absolute", "10", "120", "1125", "199", null, null, this);
            obj.set_taborder("0");
            obj.set_binddataset("ds_ordNoList");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"40\"/><Column size=\"60\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"100\"/><Column size=\"0\"/><Column size=\"0\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"86\"/><Column size=\"65\"/><Column size=\"55\"/><Column size=\"60\"/><Column size=\"84\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"선택\"/><Cell col=\"1\" text=\"계약일자\"/><Cell col=\"2\" text=\"계약번호\"/><Cell col=\"3\" text=\"고객코드\"/><Cell col=\"4\" text=\"법정생년월일\"/><Cell col=\"5\" text=\"사업자번호\"/><Cell col=\"6\" text=\"고객명\"/><Cell col=\"7\" text=\"성별\"/><Cell col=\"8\" text=\"내외국인\"/><Cell col=\"9\" text=\"핸드폰\"/><Cell col=\"10\" text=\"핸드폰\"/><Cell col=\"11\" text=\"전화번호\"/><Cell col=\"12\" text=\"전화번호\"/><Cell col=\"13\" text=\"전화번호2\"/><Cell col=\"14\" text=\"전화번호2\"/><Cell col=\"15\" text=\"주소\"/><Cell col=\"16\" text=\"차량번호\"/><Cell col=\"17\" text=\"차종\"/><Cell col=\"18\" text=\"계약상태\"/><Cell col=\"19\" text=\"판매상품명\"/><Cell col=\"20\" text=\"채널\"/><Cell col=\"21\" text=\"홈쇼핑\"/><Cell col=\"22\" text=\"월렌탈료\"/><Cell col=\"23\" text=\"단체번호\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:chk\"/><Cell col=\"1\" displaytype=\"date\" text=\"bind:ordDay\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"3\" text=\"bind:custNo\"/><Cell col=\"4\" displaytype=\"normal\" text=\"bind:birthDay\" mask=\"####-**-**\"/><Cell col=\"5\" displaytype=\"normal\" text=\"bind:buslNo\" mask=\"###-##-#####\"/><Cell col=\"6\" text=\"bind:custNm\"/><Cell col=\"7\" text=\"bind:genderNm\"/><Cell col=\"8\" text=\"bind:lfNm\"/><Cell col=\"9\" text=\"bind:mobNo\" expr=\"expr:FN_numberMaskReturn(mobNo)\"/><Cell col=\"10\" text=\"bind:mobNo\"/><Cell col=\"11\" text=\"bind:telNo\" expr=\"expr:FN_numberMaskReturn(telNo)\"/><Cell col=\"12\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\"/><Cell col=\"13\" text=\"bind:telNo2\" expr=\"expr:FN_numberMaskReturn(telNo2)\"/><Cell col=\"14\" text=\"bind:telNo2\" expr=\"expr:FN_numberHyphenInReturn(telNo2)\"/><Cell col=\"15\" text=\"bind:addr\"/><Cell col=\"16\" text=\"bind:carNo\"/><Cell col=\"17\" text=\"bind:carKind\"/><Cell col=\"18\" text=\"bind:statNm\"/><Cell col=\"19\" text=\"bind:saleNm\"/><Cell col=\"20\" text=\"bind:chanNm\"/><Cell col=\"21\" text=\"bind:hshopGbNm\"/><Cell col=\"22\" displaytype=\"number\" text=\"bind:monAmt\"/><Cell col=\"23\" text=\"bind:grpNo\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "1094", "551", "41", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "10", "59", "1113", "31", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_cancDay", "absolute", "617", "59", "82", "31", null, null, this);
            obj.set_taborder("5");
            obj.set_text("패키지     할인율");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_wordwrap("char");
            this.addChild(obj.name, obj);

            obj = new Static("st_procDay", "absolute", "421", "59", "82", "31", null, null, this);
            obj.set_taborder("6");
            obj.set_text("패키지    계약건");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_wordwrap("char");
            this.addChild(obj.name, obj);

            obj = new Static("st_planDay", "absolute", "227", "59", "82", "31", null, null, this);
            obj.set_taborder("7");
            obj.set_text("패키지유형");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordDay", "absolute", "10", "59", "82", "31", null, null, this);
            obj.style.set_align("center middle");
            obj.set_taborder("8");
            obj.set_text("패키지번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_period", "absolute", "316", "64", "100", "21", null, null, this);
            obj.set_taborder("9");
            obj.set_inputtype("number");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_regiAmt", "absolute", "510", "64", "100", "21", null, null, this);
            obj.set_taborder("10");
            obj.set_inputtype("number");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_cnt", "absolute", "100", "64", "121", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_inputtype("number");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordQty00", "absolute", "813", "59", "92", "31", null, null, this);
            obj.set_taborder("13");
            obj.set_text("패키지      할인금액");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_align("left middle");
            obj.set_wordwrap("char");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custReq", "absolute", "912", "64", "200", "21", null, null, this);
            obj.set_taborder("14");
            obj.set_maxlength("200");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "8", "358", "1125", "31", null, null, this);
            obj.set_taborder("18");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "8", "418", "1125", "31", null, null, this);
            obj.set_taborder("19");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "8", "388", "1125", "31", null, null, this);
            obj.set_taborder("20");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "8", "478", "1125", "31", null, null, this);
            obj.set_taborder("21");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "8", "448", "1125", "31", null, null, this);
            obj.set_taborder("22");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "8", "328", "1125", "31", null, null, this);
            obj.set_taborder("23");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_birthDay", "absolute", "163", "363", "200", "21", null, null, this);
            obj.set_taborder("24");
            obj.set_type("string");
            obj.set_mask("####-##-##");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_birthDay", "absolute", "8", "358", "150", "31", null, null, this);
            obj.set_taborder("25");
            obj.set_text("법정생년월일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_planDay00", "absolute", "368", "478", "150", "31", null, null, this);
            obj.set_taborder("26");
            obj.set_text("장착예정일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_planDay", "absolute", "524", "483", "200", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("27");
            obj.set_value("20150715");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_cssclass("readonly");
            obj.set_enable("false");

            obj = new Calendar("cal_instDay", "absolute", "884", "483", "240", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("28");
            obj.set_value("20150715");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_cssclass("readonly");
            obj.set_enable("false");

            obj = new Static("st_instDay", "absolute", "729", "478", "150", "31", null, null, this);
            obj.set_taborder("29");
            obj.set_text("장착일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNo", "absolute", "884", "333", "240", "20", null, null, this);
            obj.set_taborder("30");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNo", "absolute", "729", "328", "150", "31", null, null, this);
            obj.set_taborder("31");
            obj.set_text("고객코드");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_genderNm", "absolute", "884", "363", "240", "20", null, null, this);
            obj.set_taborder("32");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_genderNm", "absolute", "729", "358", "150", "31", null, null, this);
            obj.set_taborder("33");
            obj.set_text("성별");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_lfNm", "absolute", "884", "393", "240", "20", null, null, this);
            obj.set_taborder("34");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_lfNm", "absolute", "729", "388", "150", "31", null, null, this);
            obj.set_taborder("35");
            obj.set_text("내외국인");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_telNo2", "absolute", "884", "423", "240", "20", null, null, this);
            obj.set_taborder("36");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_telNo2", "absolute", "729", "418", "150", "31", null, null, this);
            obj.set_taborder("37");
            obj.set_text("전화번호2");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_addr", "absolute", "524", "453", "600", "21", null, null, this);
            obj.set_taborder("38");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_telNo", "absolute", "524", "423", "200", "20", null, null, this);
            obj.set_taborder("39");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_telNo", "absolute", "368", "418", "150", "31", null, null, this);
            obj.set_taborder("40");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_addr", "absolute", "368", "448", "150", "31", null, null, this);
            obj.set_taborder("41");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNo", "absolute", "368", "328", "150", "31", null, null, this);
            obj.set_taborder("42");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordNo", "absolute", "524", "333", "200", "20", null, null, this);
            obj.set_taborder("43");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNm", "absolute", "524", "363", "200", "20", null, null, this);
            obj.set_taborder("44");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carKind", "absolute", "524", "393", "200", "20", null, null, this);
            obj.set_taborder("45");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_carKind", "absolute", "368", "388", "150", "31", null, null, this);
            obj.set_taborder("46");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm", "absolute", "368", "358", "150", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_statNm", "absolute", "163", "453", "200", "21", null, null, this);
            obj.set_taborder("49");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mobNo", "absolute", "163", "423", "200", "21", null, null, this);
            obj.set_taborder("50");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carNo", "absolute", "163", "393", "200", "21", null, null, this);
            obj.set_taborder("51");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_carNo", "absolute", "8", "388", "150", "31", null, null, this);
            obj.set_taborder("52");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_mobNo", "absolute", "8", "418", "150", "31", null, null, this);
            obj.set_taborder("53");
            obj.set_text("핸드폰");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_statNm", "absolute", "8", "448", "150", "31", null, null, this);
            obj.set_taborder("54");
            obj.set_text("계약상태");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal__ordDay", "absolute", "163", "333", "200", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("56");
            obj.set_value("20150715");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_cssclass("readonly");
            obj.set_enable("false");

            obj = new Static("st_ordDay00", "absolute", "8", "328", "150", "31", null, null, this);
            obj.set_taborder("57");
            obj.set_text("계약일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "8", "508", "1125", "31", null, null, this);
            obj.set_taborder("60");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_matNm01", "absolute", "8", "478", "150", "31", null, null, this);
            obj.set_taborder("63");
            obj.set_text("판매상품명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_seasonCd00", "absolute", "163", "483", "200", "20", null, null, this);
            obj.set_taborder("64");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_matNm02", "absolute", "8", "508", "150", "31", null, null, this);
            obj.set_taborder("65");
            obj.set_text("월렌탈료");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_seasonCd01", "absolute", "163", "513", "200", "20", null, null, this);
            obj.set_taborder("66");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_buslNo", "absolute", "8", "358", "150", "31", null, null, this);
            obj.set_taborder("67");
            obj.set_text("사업자번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_buslNo", "absolute", "163", "363", "200", "21", null, null, this);
            obj.set_taborder("68");
            obj.set_type("string");
            obj.set_mask("###-##-#####");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_cnt00", "absolute", "100", "24", "121", "21", null, null, this);
            obj.set_taborder("70");
            obj.set_inputtype("number");
            obj.set_readonly("true");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_period00", "absolute", "316", "32", "47", "21", null, null, this);
            obj.set_taborder("71");
            obj.set_inputtype("number");
            obj.set_readonly("true");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_search", "absolute", "1084", "20", "45", "22", null, null, this);
            obj.set_taborder("72");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("bt_price02", "absolute", null, "20", "84", "22", "72", null, this);
            obj.set_taborder("73");
            obj.set_text("패키지묶음");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("bt_price01", "absolute", null, "20", "113", "22", "166", null, this);
            obj.set_taborder("74");
            obj.set_text("패키지(대상)등록");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_period01", "absolute", "412", "24", "47", "21", null, null, this);
            obj.set_taborder("75");
            obj.set_inputtype("number");
            obj.set_readonly("true");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_period02", "absolute", "468", "24", "47", "21", null, null, this);
            obj.set_taborder("76");
            obj.set_inputtype("number");
            obj.set_readonly("true");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_rentAmt", "absolute", "706", "64", "100", "21", null, null, this);
            obj.set_taborder("78");
            obj.set_inputtype("number");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1145, 580, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMOrderNo_pop");
            		p.set_titletext("패키지묶음 팝업");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item3","ed_birthDay","value","ds_ordNoList","birthDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","cal_planDay","value","ds_ordNoList","planDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","cal_instDay","value","ds_ordNoList","instDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_custNo","value","ds_ordNoList","custNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","ed_genderNm","value","ds_ordNoList","genderNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","ed_lfNm","value","ds_ordNoList","lfNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_telNo2","value","ds_ordNoList","telNo2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_addr","value","ds_ordNoList","addr");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","ed_telNo","value","ds_ordNoList","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_ordNo","value","ds_ordNoList","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_custNm","value","ds_ordNoList","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","ed_carKind","value","ds_ordNoList","carKind");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","ed_statNm","value","ds_ordNoList","statNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","ed_mobNo","value","ds_ordNoList","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","ed_carNo","value","ds_ordNoList","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","cal__ordDay","value","ds_ordNoList","ordDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item24","ed_seasonCd00","value","ds_ordNoList","saleNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item25","ed_seasonCd01","value","ds_ordNoList","monAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","ed_buslNo","value","ds_ordNoList","buslNo");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDOrderNo2_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDOrderNo2_pop.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt,checkAuthGrpuCd){
        	if( strSvcId == "initRTCOMMOrderNo" ){
        		var rowCtCustTp = this.ds_custTpCd.rowcount;
        		if( rowCtCustTp != 0 ){
        			this.ds_ordNoList.addColumn("chk", "string", 256);
        			this.div_ordNoSearch.ra_A_custTp.set_value( this.ds_custTpCd.getColumn(0,"cd") );
        		}
        		
        		var rowcChanCd = this.ds_chanCd.rowcount;
        		if( rowcChanCd != 0 ){
        			var insert = this.ds_chanCd.insertRow( 0 );
        			this.ds_chanCd.setColumn(insert,"cd"," ");
        			this.ds_chanCd.setColumn(insert,"cdNm","전체");
        			this.div_ordNoSearch.cb_chanCd.set_value( " " );
        		}
        		
        		var rowCtStatCd = this.ds_statCd.rowcount;
        		if( rowCtStatCd != 0 ){
        			var insert = this.ds_statCd.insertRow( 0 );
        			this.ds_statCd.setColumn(insert,"cd"," ");
        			this.ds_statCd.setColumn(insert,"cdNm","전체");
        			this.div_ordNoSearch.cb_statCd.set_value(" ");
        		}
        	}
        	
        	if( strSvcId == "ordNoList" ){
        			
        		this.ds_ordNoList.addColumn("chk", "string", 256);
        		var ct = this.ds_ordNoList.rowcount;
        			if( ct == 0 ){
        				alert("조회된 데이터가 없습니다.");
        				this.grid_ordNoList.set_nodatatext( "조회된 데이터가 없습니다." );
        			}
        			for(var i=0;i<this.ds_ordNoList.getRowCount();i++){
        				this.ds_ordNoList.setColumn(i,"chk","1");
        					if(this.ds_ordNoList.getColumn(i,"chk",1)=="1"){
        						this.grid_ordNoList.setCellProperty("body", this.grid_ordNoList.getBindCellIndex("body", "chk"), "edittype", "none");
        					}
        			}			
        		this.FN_search2();
        	}
        	
        	if (strSvcId =="saveNoOrderNo"){
        	var ct =this.ds_ordNoList.rowcount;
        		if(ct>0){
        		alert(strErrorMsg);
        		this.FN_search2();		
        		}
        	}
        	if (strSvcId =="saveOrderNo"){
        	alert(strErrorMsg);
        	this.FN_search2();
        	}
        	if (strSvcId =="saveOrderNo2"){
        	alert(strErrorMsg);
        	this.FN_search2();
        	}	
        	
        	if (strSvcId =="restCnt"){
        	}
        	
        	if (strSvcId =="TopMenuNoList"){
        		for(var i =0; i<this.ds_TopMenuNoList.getRowCount();i++){
        		this.ed_cnt.set_value(this.ds_TopMenuNoList.getColumn(i,"grpNo"));
        		this.ed_period.set_value(this.ds_TopMenuNoList.getColumn(i,"grpStdNm"));
        		this.ed_period00.set_value(this.ds_TopMenuNoList.getColumn(i,"dcGb"));
        		this.ed_regiAmt.set_value(nvl(this.ds_TopMenuNoList.getColumn(i,"grpCnt")));
        		this.ed_rentAmt.set_value(nvl(this.ds_TopMenuNoList.getColumn(i,"dcRate"))+"%");
        		this.ed_custReq.set_value(nvl(this.ds_TopMenuNoList.getColumn(i,"dcAmt")));
        		this.ed_period01.set_value(nvl(this.ds_TopMenuNoList.getColumn(i,"dcCd")));
        		}
        	}
        	if (strSvcId =="TopMenuNoList2"){
        		for(var i=0;i<this.ds_TopMenuNoList2.getRowCount();i++){	
        		this.ed_cnt.set_value(this.ds_TopMenuNoList2.getColumn(i,"seq"));
        	}

        	for(var i=0; i<this.ds_restCnt.getRowCount();i++){
        		if(this.ds_restCnt.getColumn(i,"minCnt")<=this.ds_ordNoListSave.getRowCount()){
        			if(this.ds_restCnt.getColumn(i,"maxCnt")>=this.ds_ordNoListSave.getRowCount()){
        				if(this.ed_period01.value!=this.ds_restCnt.getColumn(i,"dcCd")){
        					this.ed_period02.set_value(this.ds_restCnt.getColumn(i,"dcCd"));
        				}
        			}
        		}
        	}

        	for(var i = 0 ;i<this.ds_ordNoListSave.getRowCount();i++){
        		this.ds_ordNoListSave.setColumn(i,"grpNo",nvl(this.ed_cnt.value));
        		this.ds_ordNoListSave.setColumn(i,"dcGubun","N");
        		this.ds_ordNoListSave.setColumn(i,"dcCd",nvl(this.ed_period02.value)==""?nvl(this.ed_period01.value):nvl(this.ed_period02.value));
        	}

        	var sSvcID        	= "saveNoOrderNo";                    
        	var sController   	= "rtms/sd/saveOrderNo.do";		
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	sInDatasets   		+= "input=ds_ordNoListSave:U";
        	sOutDatasets  		= "";
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTSDOrderNo2_pop_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.Fn_restCnt();
        	if(this.parent.p_formId == "popupTestForm"){
        		if(this.parent.p_grpCd!=""){
        			this.ed_cnt.set_value(this.parent.p_grpCd);
        			this.btn_search_onclick();	
        		}	
        	}	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_search_onclick = function(obj,e){
        	if(nvl(this.ed_cnt.value) == "") {
        		alert("패키지 대상 선택후 등록 해주십시오.");
        		return false;
        	}
        		var sArgs 			= "";	
        		var grpNo 		= nvl(this.ed_cnt.value);
        		sArgs += Ex.util.setParam("grpNo", grpNo);
        		this.FN_search(sArgs);
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_search = function(sArgs){

        	var sSvcID        	= "ordNoList";                    
        	var sController   	= "rtms/comm/ordNoList2.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_ordNoList=ordNoMap";
        	var sArgs 			= sArgs;	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Fn_restCnt= function(){

        	var sSvcID        	= "restCnt";                    
        	var sController   	= "rtms/comm/restCnt.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_restCnt=ordNoMap";
        	var sArgs 			= sArgs;	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_choice_onclick = function(obj,e){
        	this.FN_choice();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_choice = function(){
        	var pos = this.ds_ordNoList.rowposition;
        	if( pos == -1 ){
        		alert("선택된 행이 없습니다.");
        	}else{
        		
        		var nCnt = this.ds_ordNoList.getRowCount();
        			this.ds_ordNoListCp.clearData();
        			for( var i = 0 ; i < nCnt ; i++){
        			if(this.ds_ordNoList.getColumn(i,"chk",1)==1){
        				if(this.ds_ordNoList.getColumn(i,"grpNo")==null){
        			var idx = this.ds_ordNoListCp.addRow();						
        			this.ds_ordNoListCp.copyRow(idx,this.ds_ordNoList,idx);
        			}
        				if(this.ds_ordNoList.getColumn(i,"grpNo")!=null){
        				alert(this.ds_ordNoList.getColumn(i,"ordNo")+"는 이미 grpNo가 있습니다.");
        				}
        			}

        		}			
        			var arr = [this.ds_ordNoListCp];
        			this.close(this.opener.returnOrderNoInfo(arr));
        		}
        	}

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_ra_A_custTp_onitemchanged = function(obj,e){
        	var custTpVal = nvl(this.div_ordNoSearch.ra_A_custTp.value);
        	this.ds_ordNoList.clearData();
        	if( custTpVal == "01" ){
        		this.div_ordNoSearch.div_ordNo01.set_visible(true);
        		this.div_ordNoSearch.div_ordNo02.set_visible(false);
        		
        		this.div_ordNoDetail.st_buslNo.set_visible(false);
        		this.div_ordNoDetail.ed_buslNo.set_visible(false);
        		
        		this.div_ordNoDetail.st_birthDay.set_visible(true);
        		this.div_ordNoDetail.ed_birthDay.set_visible(true);
        		
        		this.div_ordNoDetail.st_genderNm.set_visible(true);
        		this.div_ordNoDetail.ed_genderNm.set_visible(true);
        		
        		this.div_ordNoDetail.st_lfNm.set_visible(true);
        		this.div_ordNoDetail.ed_lfNm.set_visible(true);
        		
        		this.div_ordNoDetail.st_telNo2.set_text("전화번호2");
        		
        		this.grid_ordNoList.setRealColSize( 3, 100 );//법정생년월일
        		this.grid_ordNoList.setRealColSize( 4, 0 );//사업자번호
        		this.grid_ordNoList.setRealColSize( 6, 100 );//성별
        		this.grid_ordNoList.setRealColSize( 7, 100 );//내외국인
        		
        		this.grid_ordNoList.setCellProperty( "head", 10, "text", "전화번호2");
        	}else if( custTpVal == "02" ){
        		this.div_ordNoSearch.div_ordNo01.set_visible(false);
        		this.div_ordNoSearch.div_ordNo02.set_visible(true);
        		
        		this.div_ordNoDetail.st_buslNo.set_visible(true);
        		this.div_ordNoDetail.ed_buslNo.set_visible(true);
        		
        		this.div_ordNoDetail.st_birthDay.set_visible(false);
        		this.div_ordNoDetail.ed_birthDay.set_visible(false);
        		
        		this.div_ordNoDetail.st_genderNm.set_visible(false);
        		this.div_ordNoDetail.ed_genderNm.set_visible(false);
        		
        		this.div_ordNoDetail.st_lfNm.set_visible(false);
        		this.div_ordNoDetail.ed_lfNm.set_visible(false);
        		
        		this.div_ordNoDetail.st_telNo2.set_text("회사전화");
        		
        		this.grid_ordNoList.setRealColSize( 3, 0 );//법정생년월일
        		this.grid_ordNoList.setRealColSize( 4, 100 );//사업자번호
        		this.grid_ordNoList.setRealColSize( 6, 0 );//성별
        		this.grid_ordNoList.setRealColSize( 7, 0 );//내외국인
        		this.grid_ordNoList.setCellProperty( "head", 10, "text", "회사전화");
        	}else{
        		return false;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTSDOrderNo2_pop_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo02_ed_A_custNm_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo02_ed_A_buslNo_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo02_ed_B_carNo_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo02_ed_A_mobNo_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo02_ed_A_telNo_onkeyup = function(obj,e){
        }
        /*||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}|||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo02_ed_A_telNo2_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo01_ed_A_custNm_onkeyup = function(obj,e)
        {
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo01_ed_A_birthDay_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo01_ed_B_carNo_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo01_ed_A_mobNo_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo01_ed_A_telNo_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo01_ed_A_telNo2_onkeyup = function(obj,e){
        	if( e.keycode == "13" ){
        		this.div_ordNoSearch_btn_search_onclick();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo02_ed_A_buslNo_onsetfocus = function(obj,e){
        	this.FN_setSelect(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo01_ed_A_birthDay_onsetfocus = function(obj,e){
        	this.FN_setSelect(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo01_ed_A_mobNo_onsetfocus = function(obj,e){
        	this.FN_setSelect(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_ordNoSearch_div_ordNo02_ed_A_mobNo_onsetfocus = function(obj,e){
        	this.FN_setSelect(obj);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_setSelect = function(obj){
        	obj.setSelect(0);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        this.bt_price01_onclick = function(obj,e)
        {
        	var args ={p_formId :""};
        	Ex.core.popup(this,"패키지 대상 선택 ","sd::RTSDOrderNo_pop.xfdl",args, "modaless=false");
        }
         

        this.bt_price02_onclick = function(obj,e)
        {
        	if( confirm( "패키지 묶음 처리를 하시겠습니까?") ){
        	
        		var cnt = 0;
        		for( var i = 0 ; i < this.ds_ordNoList.getRowCount() ; i++ ){
        		var iRowType = this.ds_ordNoList.getRowType(i);		
        		if( iRowType == 2 ){ //2:Insert, 4:Update, 8:Delete
        			cnt++;
        			}
        		}
        		if(cnt != 0) {

        	if(!this.submitFormCheck()) {
        		return;
        	}
        	if(this.ed_period00.value=='D'){
        		alert("해당유형은 단체계약입니다");
        		return;
        	};
        	var saveFlag = false;
        	this.ds_ordNoListSave.clearData();

        	for(var i=0;i<this.ds_ordNoList.getRowCount();i++){
        		if(this.ds_ordNoList.getColumn(i,"chk",1)==1){
        			if(this.ed_cnt.value==null){
        				this.ds_ordNoListSave.copyRow(this.ds_ordNoListSave.addRow(),this.ds_ordNoList,i);
        				this.ed_cnt00.set_value(this.ds_ordNoList.getColumn(i,"ordNo"));
        				saveFlag = false;
        			}else{
        				this.ds_ordNoListSave.copyRow(this.ds_ordNoListSave.addRow(),this.ds_ordNoList,i);
        				saveFlag = true;
        			}
        		}
        	}

        	if(saveFlag ==true){							//값 있을때
        		for(var i=0; i<this.ds_restCnt.getRowCount();i++){
        			if(this.ds_restCnt.getColumn(i,"minCnt")<=this.ds_ordNoListSave.getRowCount()){
        				if(this.ds_restCnt.getColumn(i,"maxCnt")>=this.ds_ordNoListSave.getRowCount()){
        					if(this.ed_period01.value!=this.ds_restCnt.getColumn(i,"dcCd")){
        						this.ed_period02.set_value(this.ds_restCnt.getColumn(i,"dcCd"));
        						this.restOrder();		//할인율 변경
        					}else{					
        						this.Fn_save();			//할인율 유지
        					}
        				}
        			}
        		}	
        	}
        	if(saveFlag == false){				//값 없을때
        		if(this.ds_ordNoListSave.getRowCount()==0){
        			alert("패키지 대상을 선택해주세요");
        			return false;
        		}else{
        			this.FN_search3();			//시퀀스 생성
        		}
        	}
        	
        	
        	}else{	
        		alert("변경된 데이터가 없습니다!");
        		return false; 
        	}
        	}
        			
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.submitFormCheck = function() {
        	if(nvl(this.ed_custNm.value) == "") {
        		alert("패키지 대상 선택후 등록 해주십시오.");
        		return false;
        	}

        	return true;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.restOrder = function(){				//할인율 코드가 다를시

        	for(var i=0;i<this.ds_ordNoListSave.getRowCount();i++){
        		this.ds_ordNoListSave.setColumn(i,"grpNo",nvl(this.ed_cnt.value));
        		this.ds_ordNoListSave.setColumn(i,"dcRate",nvl(this.ed_rentAmt.value));	
        		this.ds_ordNoListSave.setColumn(i,"dcAmt",nvl(this.ed_custReq.value));
        		this.ds_ordNoListSave.setColumn(i,"dcGubun","Y");
        		this.ds_ordNoListSave.setColumn(i,"dcCd",nvl(this.ed_period02.value)==""?nvl(this.ed_period01.value):nvl(this.ed_period02.value));
        	}

        	var sSvcID        	= "saveOrderNo2";                    
        	var sController   	= "rtms/sd/saveOrderNo2.do";		
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	sInDatasets   		+= "input=ds_ordNoListSave:A";
        	sOutDatasets  		= "";
        	var fn_callBack		= "fn_callBack";
        	
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Fn_save = function(){					//할인율 코드가 같을시
        this.ds_ordNoListSave00.clearData();

        	for(var i = 0 ;i<this.ds_ordNoListSave.getRowCount();i++){
        		if(this.ds_ordNoListSave.getColumn(i,"grpNo")==null){
        			this.ds_ordNoListSave00.copyRow(this.ds_ordNoListSave00.addRow(),this.ds_ordNoListSave,i);
        			}
        		}
        		for(var i=0; i<this.ds_ordNoListSave00.getRowCount();i++){
        			this.ds_ordNoListSave00.setColumn(i,"grpNo",nvl(this.ed_cnt.value));
        			this.ds_ordNoListSave00.setColumn(i,"dcRate",nvl(this.ed_rentAmt.value));	
        			this.ds_ordNoListSave00.setColumn(i,"dcAmt",nvl(this.ed_custReq.value));
        			this.ds_ordNoListSave00.setColumn(i,"dcGubun","N");
        			this.ds_ordNoListSave00.setColumn(i,"dcCd",nvl(this.ed_period01.value));
        		}
        	
        	var sSvcID        	= "saveOrderNo";                    
        	var sController   	= "rtms/sd/saveOrderNo.do";		
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	sInDatasets   		+= "input=ds_ordNoListSave00:A";
        	sOutDatasets  		= "";
        	var fn_callBack		= "fn_callBack";
        	
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);

        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.returnOrderNoInfo = function(arr){
        	this.ds_ordNoListCp.addRow();
        	this.ds_ordNoListCp.copyData(arr[0]);
        	a = this.ds_ordNoList.getRowCount();		
        	var idx = true;
        	var arr = new Array();
        	
        	var nCnt = this.ds_ordNoList.getRowCount();

        	if(nCnt > 0){
        		for( var j=0; j<nCnt; j++) {
        			arr[j] = this.ds_ordNoList.getColumn(j, "ordNo");				//가져올Key값
        		}
        	}
        	for (var i=0; i<this.ds_ordNoListCp.getRowCount(); i++) {

        		idx = false;
        		
        		// opener dataset 에 존재하자 않는 row 만 입력
        		if(arr.length > 0){
        			var chk = true;
        			for(var k=0; k<arr.length; k++) {
        				if(arr[k] == this.ds_ordNoListCp.getColumn(i, "ordNo")){				//비교할 Key 값
        					chk = false;
        					break;
        				}				
        			}			
        			if(chk){
        				var nRow = this.ds_ordNoList.addRow();
        				this.ds_ordNoList.copyRow(nRow, this.ds_ordNoListCp, i);
        				this.ds_ordNoList.addColumn("chk", "string", 256);
        				this.ds_ordNoList.setColumn(nRow,"chk",1);
        			}
        		}else{
        			var nRow = this.ds_ordNoList.addRow();
        			this.ds_ordNoList.copyRow(nRow, this.ds_ordNoListCp, i);
        		}
        	}
        }

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_search2 = function(){							//탑메뉴 조회

        	var sSvcID        	= "TopMenuNoList";                    
        	var sController   	= "rtms/sd/TopMenuNoList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_TopMenuNoList=TopMenuNoList";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_TopMenuNoList.deleteAll();
        	sArgs += Ex.util.setParam("nodeNm", 	"TopMenuNoList");	//리턴받을 DstaSet이름	
        	sArgs += Ex.util.setParam("grpNo", 	nvl(this.ed_cnt.value));	//리턴받을 DstaSet이름
        	sArgs += Ex.util.setParam("ordNo", 	nvl(this.ed_cnt00.value));	//리턴받을 DstaSet이름	
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/

        
        this.FN_search3 = function(){
        	var sSvcID        	= "TopMenuNoList2";                    
        	var sController   	= "rtms/sd/TopMenuNoList2.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_TopMenuNoList2=TopMenuNoList2";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	this.ds_TopMenuNoList.deleteAll();
        	sArgs += Ex.util.setParam("nodeNm", 	"TopMenuNoList2");	//리턴받을 DstaSet이름
        	sArgs += Ex.util.setParam("ordNo", 	nvl(this.ed_cnt00.value));	//리턴받을 DstaSet이름	
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_ordNoList.addEventHandler("canrowposchange", this.ds_ordNoList_canrowposchange, this);
            this.addEventHandler("onload", this.RTSDOrderNo2_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTSDOrderNo2_pop_onkeyup, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.ed_custNo.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.ed_genderNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.ed_lfNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.ed_telNo2.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.ed_addr.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.ed_telNo.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.ed_ordNo.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.ed_custNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.ed_carKind.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.ed_statNm.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.ed_mobNo.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.ed_carNo.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.st_matNm01.addEventHandler("onclick", this.div_ordNoDetail_st_matNm01_onclick, this);
            this.ed_seasonCd00.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.ed_seasonCd01.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.btn_search.addEventHandler("onclick", this.btn_search_onclick, this);
            this.bt_price02.addEventHandler("onclick", this.bt_price02_onclick, this);
            this.bt_price01.addEventHandler("onclick", this.bt_price01_onclick, this);
            this.ed_period01.addEventHandler("onchanged", this.ed_period01_onchanged, this);
            this.ed_period02.addEventHandler("onchanged", this.ed_period01_onchanged, this);

        };

        this.loadIncludeScript("RTSDOrderNo2_pop.xfdl");

       
    };
}
)();

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
                this.set_name("RTCSHappyCallRegister");
                this.set_classname("RTCSHappyCallRegister");
                this.set_titletext("해피콜상담등록");
                this._setFormPosition(0,0,1147,1072);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"jobTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"callNo\" type=\"STRING\" size=\"256\"/><Column id=\"userIdNm\" type=\"STRING\" size=\"256\"/><Column id=\"callStatus\" type=\"STRING\" size=\"256\"/><Column id=\"callStatusNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"jobCnt\" type=\"STRING\" size=\"256\"/><Column id=\"jobDay\" type=\"STRING\" size=\"256\"/><Column id=\"callDay\" type=\"STRING\" size=\"256\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/><Column id=\"servSeq\" type=\"STRING\" size=\"256\"/><Column id=\"servNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows/>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsQuestion", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"question01\" type=\"STRING\" size=\"256\"/><Column id=\"question02\" type=\"STRING\" size=\"256\"/><Column id=\"question03\" type=\"STRING\" size=\"256\"/><Column id=\"question04\" type=\"STRING\" size=\"256\"/><Column id=\"question05\" type=\"STRING\" size=\"256\"/><Column id=\"question06\" type=\"STRING\" size=\"256\"/><Column id=\"question07\" type=\"STRING\" size=\"256\"/><Column id=\"question08\" type=\"STRING\" size=\"256\"/><Column id=\"question09\" type=\"STRING\" size=\"256\"/><Column id=\"question10\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus01\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus02\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus03\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus04\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus05\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus06\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus07\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus08\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus09\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus10\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsJobTp", this);
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

            obj = new Dataset("dsCallStatus", this);
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

            obj = new Dataset("dsDetailInfo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"regiNm\" type=\"STRING\" size=\"256\"/><Column id=\"monAmt\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"manufactureDrop\" type=\"STRING\" size=\"256\"/><Column id=\"modelNM\" type=\"STRING\" size=\"256\"/><Column id=\"widthDrop\" type=\"STRING\" size=\"256\"/><Column id=\"inchDrop\" type=\"STRING\" size=\"256\"/><Column id=\"ratioDrop\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsAnswer1", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"answerCd\" type=\"string\" size=\"32\"/><Column id=\"answer\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsAnswer2", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"answerCd\" type=\"string\" size=\"32\"/><Column id=\"answer\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsAnswer3", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"answerCd\" type=\"string\" size=\"32\"/><Column id=\"answer\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsAnswer4", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"answerCd\" type=\"string\" size=\"32\"/><Column id=\"answer\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsAnswer5", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"answerCd\" type=\"string\" size=\"32\"/><Column id=\"answer\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsAnswer6", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"answerCd\" type=\"string\" size=\"32\"/><Column id=\"answer\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsAnswer7", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"answerCd\" type=\"string\" size=\"32\"/><Column id=\"answer\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsAnswer8", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"answerCd\" type=\"string\" size=\"32\"/><Column id=\"answer\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsAnswer9", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"answerCd\" type=\"string\" size=\"32\"/><Column id=\"answer\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsAnswer10", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"answerCd\" type=\"string\" size=\"32\"/><Column id=\"answer\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsQuestAns", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"question01\" type=\"INT\" size=\"256\"/><Column id=\"question02\" type=\"STRING\" size=\"256\"/><Column id=\"question03\" type=\"STRING\" size=\"256\"/><Column id=\"question04\" type=\"STRING\" size=\"256\"/><Column id=\"question05\" type=\"STRING\" size=\"256\"/><Column id=\"question06\" type=\"STRING\" size=\"256\"/><Column id=\"question07\" type=\"STRING\" size=\"256\"/><Column id=\"question08\" type=\"STRING\" size=\"256\"/><Column id=\"question09\" type=\"STRING\" size=\"256\"/><Column id=\"question10\" type=\"STRING\" size=\"256\"/><Column id=\"answer01\" type=\"STRING\" size=\"256\"/><Column id=\"answer02\" type=\"STRING\" size=\"256\"/><Column id=\"answer03\" type=\"STRING\" size=\"256\"/><Column id=\"answer04\" type=\"STRING\" size=\"256\"/><Column id=\"answer05\" type=\"STRING\" size=\"256\"/><Column id=\"answer06\" type=\"STRING\" size=\"256\"/><Column id=\"answer07\" type=\"STRING\" size=\"256\"/><Column id=\"answer08\" type=\"STRING\" size=\"256\"/><Column id=\"answer09\" type=\"STRING\" size=\"256\"/><Column id=\"answer10\" type=\"STRING\" size=\"256\"/><Column id=\"objectAns10\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu01\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu02\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu03\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu04\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu05\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu06\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu07\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu08\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu09\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu10\" type=\"STRING\" size=\"256\"/><Column id=\"subjectQus1\" type=\"STRING\" size=\"256\"/><Column id=\"subjectQus2\" type=\"STRING\" size=\"256\"/><Column id=\"subjectQus3\" type=\"STRING\" size=\"256\"/><Column id=\"subjectQus4\" type=\"STRING\" size=\"256\"/><Column id=\"subjectQus5\" type=\"STRING\" size=\"256\"/><Column id=\"subjectAns1\" type=\"STRING\" size=\"256\"/><Column id=\"subjectAns2\" type=\"STRING\" size=\"256\"/><Column id=\"subjectAns3\" type=\"STRING\" size=\"256\"/><Column id=\"subjectAns4\" type=\"STRING\" size=\"256\"/><Column id=\"subjectAns5\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsQusAnsInput", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"callNo\" type=\"INT\" size=\"256\"/><Column id=\"objectQus01\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus02\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus03\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus04\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus05\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus06\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus07\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus08\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus09\" type=\"STRING\" size=\"256\"/><Column id=\"objectQus10\" type=\"STRING\" size=\"256\"/><Column id=\"objectAns01\" type=\"STRING\" size=\"256\"/><Column id=\"objectAns02\" type=\"STRING\" size=\"256\"/><Column id=\"objectAns03\" type=\"STRING\" size=\"256\"/><Column id=\"objectAns04\" type=\"STRING\" size=\"256\"/><Column id=\"objectAns05\" type=\"STRING\" size=\"256\"/><Column id=\"objectAns06\" type=\"STRING\" size=\"256\"/><Column id=\"objectAns07\" type=\"STRING\" size=\"256\"/><Column id=\"objectAns08\" type=\"STRING\" size=\"256\"/><Column id=\"objectAns09\" type=\"STRING\" size=\"256\"/><Column id=\"objectAns10\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu01\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu02\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu03\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu04\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu05\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu06\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu07\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu08\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu09\" type=\"STRING\" size=\"256\"/><Column id=\"objectJumsu10\" type=\"STRING\" size=\"256\"/><Column id=\"subjectQus1\" type=\"STRING\" size=\"256\"/><Column id=\"subjectQus2\" type=\"STRING\" size=\"256\"/><Column id=\"subjectQus3\" type=\"STRING\" size=\"256\"/><Column id=\"subjectQus4\" type=\"STRING\" size=\"256\"/><Column id=\"subjectQus5\" type=\"STRING\" size=\"256\"/><Column id=\"subjectAns1\" type=\"STRING\" size=\"256\"/><Column id=\"subjectAns2\" type=\"STRING\" size=\"256\"/><Column id=\"subjectAns3\" type=\"STRING\" size=\"256\"/><Column id=\"subjectAns4\" type=\"STRING\" size=\"256\"/><Column id=\"subjectAns5\" type=\"STRING\" size=\"256\"/><Column id=\"manufactureDrop\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"widthDrop\" type=\"STRING\" size=\"256\"/><Column id=\"inchDrop\" type=\"STRING\" size=\"256\"/><Column id=\"ratioDrop\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsWidth", this);
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

            obj = new Dataset("dsRatio", this);
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

            obj = new Dataset("dsInch", this);
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

            obj = new Dataset("dsManufacture", this);
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

            obj = new Dataset("dsService", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"serviceCd\" type=\"STRING\" size=\"256\"/><Column id=\"serviceNm\" type=\"STRING\" size=\"256\"/><Column id=\"procInCd\" type=\"STRING\" size=\"256\"/><Column id=\"procInNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procTm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("Div00", "absolute", "0", "0", "1122", "81", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "36", "12", "79", "21", null, null, this.Div00);
            obj.set_taborder("19");
            obj.set_text("상담유형");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "279", "12", "79", "21", null, null, this.Div00);
            obj.set_taborder("22");
            obj.set_text("처리일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("userNm", "absolute", "664", "12", "140", "21", null, null, this.Div00);
            obj.set_taborder("23");
            obj.set_tooltiptext("edit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("20");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "596", "12", "79", "21", null, null, this.Div00);
            obj.set_taborder("24");
            obj.set_text("상담사");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "839", "12", "79", "21", null, null, this.Div00);
            obj.set_taborder("26");
            obj.set_text("통화상태");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("Edit05", "absolute", "103", "44", "140", "21", null, null, this.Div00);
            obj.set_taborder("32");
            obj.set_tooltiptext("edit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("120");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "36", "44", "79", "21", null, null, this.Div00);
            obj.set_taborder("33");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("Calendar02", "absolute", "462", "12", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("34");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static07", "absolute", "450", "12", "9", "21", null, null, this.Div00);
            obj.set_taborder("35");
            obj.set_text("~");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("Calendar01", "absolute", "347", "12", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("36");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Combo("Combo01", "absolute", "103", "12", "140", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("40");
            obj.set_innerdataset("@dsJobTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("-1");
            obj = new Button("Button00", "absolute", "783", "11", "21", "21", null, null, this.Div00);
            obj.set_taborder("41");
            obj.set_cssclass("btn_WF_edtSch");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("userId", "absolute", "664", "12", "92", "21", null, null, this.Div00);
            obj.set_taborder("42");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("20");
            obj.set_tooltiptext("edit");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Combo("Combo00", "absolute", "906", "12", "140", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("45");
            obj.set_innerdataset("@dsCallStatus");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Edit("Edit01", "absolute", "664", "44", "140", "21", null, null, this.Div00);
            obj.set_taborder("46");
            obj.set_displaynulltext("뒷번호 4자리");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_tooltiptext("edit");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "596", "44", "79", "21", null, null, this.Div00);
            obj.set_taborder("47");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("Edit04", "absolute", "347", "44", "140", "21", null, null, this.Div00);
            obj.set_taborder("48");
            obj.set_displaynulltext("뒷번호 4자리");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("4");
            obj.set_tooltiptext("edit");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "279", "44", "79", "21", null, null, this.Div00);
            obj.set_taborder("49");
            obj.set_text("휴대번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", null, "12", "0", null, this.Div00);
            obj.set_taborder("50");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "33", null, "12", "0", null, this.Div00);
            obj.set_taborder("51");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "0", "65", null, "12", "0", null, this.Div00);
            obj.set_taborder("52");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "0", "0", "30", "76", null, null, this.Div00);
            obj.set_taborder("53");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "243", "0", "30", "76", null, null, this.Div00);
            obj.set_taborder("54");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "560", "0", "30", "76", null, null, this.Div00);
            obj.set_taborder("55");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "804", "0", "30", "76", null, null, this.Div00);
            obj.set_taborder("56");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "96", "81", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("상담리스트");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "121", "1122", "250", null, null, this);
            obj.set_taborder("5");
            obj.set_binddataset("dsList");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"상담유형\"/><Cell col=\"1\" text=\"상담번호\"/><Cell col=\"2\" text=\"상담사\"/><Cell col=\"3\" text=\"통화상태\"/><Cell col=\"4\" text=\"계약번호\"/><Cell col=\"5\" text=\"고객명\"/><Cell col=\"6\" text=\"휴대번호\"/><Cell col=\"7\" text=\"전화번호\"/><Cell col=\"8\" text=\"시도건수\"/><Cell col=\"9\" text=\"처리일자\"/><Cell col=\"10\" text=\"통화일자\"/><Cell col=\"11\" text=\"서비스명\"/></Band><Band id=\"body\"><Cell text=\"bind:jobTpNm\"/><Cell col=\"1\" text=\"bind:callNo\"/><Cell col=\"2\" text=\"bind:userIdNm\"/><Cell col=\"3\" text=\"bind:callStatusNm\"/><Cell col=\"4\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"5\" text=\"bind:custNm\"/><Cell col=\"6\" text=\"bind:mobNo\"/><Cell col=\"7\" text=\"bind:telNo\"/><Cell col=\"8\" text=\"bind:jobCnt\"/><Cell col=\"9\" text=\"bind:jobDay\"/><Cell col=\"10\" text=\"bind:callDay\"/><Cell col=\"11\" text=\"bind:servNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "392", "81", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("계약정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("Button31", "absolute", "1051", "391", "71", "22", null, null, this);
            obj.set_taborder("8");
            obj.set_text("상담등록");
            obj.set_cssclass("btn_WF_module");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Combo("Combo00", "absolute", "895", "391", "126", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("9");
            obj.set_innerdataset("@dsCallStatus");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_enable("false");

            obj = new Static("Static08", "absolute", "828", "392", "74", "20", null, null, this);
            obj.set_taborder("10");
            obj.set_text("통화상태");
            obj.set_cssclass("sta_WF_schTitle");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit_callNo", "absolute", "657", "391", "140", "21", null, null, this);
            obj.set_taborder("11");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static35", "absolute", "589", "391", "66", "20", null, null, this);
            obj.set_taborder("12");
            obj.set_text("상담번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.addChild(obj.name, obj);

            obj = new Div("Div02", "absolute", "0", "732", "1122", "350", null, null, this);
            obj.set_taborder("13");
            this.addChild(obj.name, obj);
            obj = new Static("Static35", "absolute", "0", "0", "130", "31", null, null, this.Div02);
            obj.set_taborder("78");
            obj.set_text("질문번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_align("center middle");
            obj.style.set_font("bold 9 Dotum");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static27", "absolute", "129", "0", "864", "31", null, null, this.Div02);
            obj.set_taborder("79");
            obj.set_text("질문내용");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_align("center middle");
            obj.style.set_font("bold 9 Dotum");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static28", "absolute", "992", "0", null, "31", "0", null, this.Div02);
            obj.set_taborder("80");
            obj.set_text("답변");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_align("center middle");
            obj.style.set_font("bold 9 Dotum");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "30", "130", "31", null, null, this.Div02);
            obj.set_taborder("81");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "129", "30", "864", "31", null, null, this.Div02);
            obj.set_taborder("82");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "992", "30", null, "31", "0", null, this.Div02);
            obj.set_taborder("83");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "60", "130", "31", null, null, this.Div02);
            obj.set_taborder("84");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "129", "60", "864", "31", null, null, this.Div02);
            obj.set_taborder("85");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "992", "60", null, "31", "0", null, this.Div02);
            obj.set_taborder("86");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "90", "130", "31", null, null, this.Div02);
            obj.set_taborder("87");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "129", "90", "864", "31", null, null, this.Div02);
            obj.set_taborder("88");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "992", "90", null, "31", "0", null, this.Div02);
            obj.set_taborder("89");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "0", "150", "130", "31", null, null, this.Div02);
            obj.set_taborder("90");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "129", "150", "864", "31", null, null, this.Div02);
            obj.set_taborder("91");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "992", "150", null, "31", "0", null, this.Div02);
            obj.set_taborder("92");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "992", "120", null, "31", "0", null, this.Div02);
            obj.set_taborder("93");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "129", "120", "864", "31", null, null, this.Div02);
            obj.set_taborder("94");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "0", "120", "130", "31", null, null, this.Div02);
            obj.set_taborder("95");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit12", "absolute", "5", "35", "120", "21", null, null, this.Div02);
            obj.set_taborder("96");
            obj.set_value("1");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question01", "absolute", "134", "35", "854", "21", null, null, this.Div02);
            obj.set_taborder("97");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question02", "absolute", "134", "65", "854", "21", null, null, this.Div02);
            obj.set_taborder("98");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit04", "absolute", "5", "65", "120", "21", null, null, this.Div02);
            obj.set_taborder("99");
            obj.set_value("2");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question04", "absolute", "134", "125", "854", "21", null, null, this.Div02);
            obj.set_taborder("100");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit07", "absolute", "5", "125", "120", "21", null, null, this.Div02);
            obj.set_taborder("101");
            obj.set_value("4");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit08", "absolute", "5", "95", "120", "21", null, null, this.Div02);
            obj.set_taborder("102");
            obj.set_value("3");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question03", "absolute", "134", "95", "854", "21", null, null, this.Div02);
            obj.set_taborder("103");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question05", "absolute", "134", "155", "854", "21", null, null, this.Div02);
            obj.set_taborder("104");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit14", "absolute", "5", "155", "120", "21", null, null, this.Div02);
            obj.set_taborder("105");
            obj.set_value("5");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Combo("Combo00", "absolute", null, "35", "120", "21", "5", null, this.Div02);
            this.Div02.addChild(obj.name, obj);
            obj.set_taborder("106");
            obj.set_innerdataset("@dsAnswer1");
            obj.set_codecolumn("answerCd");
            obj.set_datacolumn("answer");
            obj.set_displayrowcount("5");
            obj = new Combo("Combo01", "absolute", "997", "65", "120", "21", null, null, this.Div02);
            this.Div02.addChild(obj.name, obj);
            obj.set_taborder("107");
            obj.set_innerdataset("@dsAnswer2");
            obj.set_codecolumn("answerCd");
            obj.set_datacolumn("answer");
            obj.set_displayrowcount("5");
            obj = new Combo("Combo02", "absolute", "997", "95", "120", "21", null, null, this.Div02);
            this.Div02.addChild(obj.name, obj);
            obj.set_taborder("108");
            obj.set_innerdataset("@dsAnswer3");
            obj.set_codecolumn("answerCd");
            obj.set_datacolumn("answer");
            obj.set_displayrowcount("5");
            obj = new Combo("Combo03", "absolute", "997", "125", "120", "21", null, null, this.Div02);
            this.Div02.addChild(obj.name, obj);
            obj.set_taborder("109");
            obj.set_innerdataset("@dsAnswer4");
            obj.set_codecolumn("answerCd");
            obj.set_datacolumn("answer");
            obj.set_displayrowcount("5");
            obj = new Combo("Combo04", "absolute", "997", "155", "120", "21", null, null, this.Div02);
            this.Div02.addChild(obj.name, obj);
            obj.set_taborder("110");
            obj.set_innerdataset("@dsAnswer5");
            obj.set_codecolumn("answerCd");
            obj.set_datacolumn("answer");
            obj.set_displayrowcount("5");
            obj = new Static("Static15", "absolute", "0", "180", "130", "31", null, null, this.Div02);
            obj.set_taborder("111");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static16", "absolute", "129", "180", "864", "31", null, null, this.Div02);
            obj.set_taborder("112");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "992", "180", null, "31", "0", null, this.Div02);
            obj.set_taborder("113");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static18", "absolute", "0", "210", "130", "31", null, null, this.Div02);
            obj.set_taborder("114");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static19", "absolute", "129", "210", "864", "31", null, null, this.Div02);
            obj.set_taborder("115");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static20", "absolute", "992", "210", null, "31", "0", null, this.Div02);
            obj.set_taborder("116");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "240", "130", "31", null, null, this.Div02);
            obj.set_taborder("117");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "129", "240", "864", "31", null, null, this.Div02);
            obj.set_taborder("118");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "992", "240", null, "31", "0", null, this.Div02);
            obj.set_taborder("119");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "0", "300", "130", "31", null, null, this.Div02);
            obj.set_taborder("120");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static25", "absolute", "129", "300", "864", "31", null, null, this.Div02);
            obj.set_taborder("121");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "992", "300", null, "31", "0", null, this.Div02);
            obj.set_taborder("122");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static29", "absolute", "992", "270", null, "31", "0", null, this.Div02);
            obj.set_taborder("123");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static30", "absolute", "129", "270", "864", "31", null, null, this.Div02);
            obj.set_taborder("124");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static31", "absolute", "0", "270", "130", "31", null, null, this.Div02);
            obj.set_taborder("125");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit01", "absolute", "5", "185", "120", "21", null, null, this.Div02);
            obj.set_taborder("126");
            obj.set_value("6");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question06", "absolute", "134", "185", "854", "21", null, null, this.Div02);
            obj.set_taborder("127");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question07", "absolute", "134", "215", "854", "21", null, null, this.Div02);
            obj.set_taborder("128");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit10", "absolute", "5", "215", "120", "21", null, null, this.Div02);
            obj.set_taborder("129");
            obj.set_value("7");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question09", "absolute", "134", "275", "854", "21", null, null, this.Div02);
            obj.set_taborder("130");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit15", "absolute", "5", "275", "120", "21", null, null, this.Div02);
            obj.set_taborder("131");
            obj.set_value("9");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit16", "absolute", "5", "245", "120", "21", null, null, this.Div02);
            obj.set_taborder("132");
            obj.set_value("8");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question08", "absolute", "134", "245", "854", "21", null, null, this.Div02);
            obj.set_taborder("133");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question10", "absolute", "134", "305", "854", "21", null, null, this.Div02);
            obj.set_taborder("134");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit19", "absolute", "5", "305", "120", "21", null, null, this.Div02);
            obj.set_taborder("135");
            obj.set_value("10");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Combo("Combo05", "absolute", "997", "185", "120", "21", null, null, this.Div02);
            this.Div02.addChild(obj.name, obj);
            obj.set_taborder("136");
            obj.set_innerdataset("@dsAnswer6");
            obj.set_codecolumn("answerCd");
            obj.set_datacolumn("answer");
            obj.set_displayrowcount("5");
            obj = new Combo("Combo06", "absolute", "997", "215", "120", "21", null, null, this.Div02);
            this.Div02.addChild(obj.name, obj);
            obj.set_taborder("137");
            obj.set_innerdataset("@dsAnswer7");
            obj.set_codecolumn("answerCd");
            obj.set_datacolumn("answer");
            obj.set_displayrowcount("5");
            obj = new Combo("Combo07", "absolute", "997", "245", "120", "21", null, null, this.Div02);
            this.Div02.addChild(obj.name, obj);
            obj.set_taborder("138");
            obj.set_innerdataset("@dsAnswer8");
            obj.set_codecolumn("answerCd");
            obj.set_datacolumn("answer");
            obj.set_displayrowcount("5");
            obj = new Combo("Combo08", "absolute", "997", "275", "120", "21", null, null, this.Div02);
            this.Div02.addChild(obj.name, obj);
            obj.set_taborder("139");
            obj.set_innerdataset("@dsAnswer9");
            obj.set_codecolumn("answerCd");
            obj.set_datacolumn("answer");
            obj.set_displayrowcount("5");
            obj = new Combo("Combo09", "absolute", "997", "305", "120", "21", null, null, this.Div02);
            this.Div02.addChild(obj.name, obj);
            obj.set_taborder("140");
            obj.set_innerdataset("@dsAnswer10");
            obj.set_codecolumn("answerCd");
            obj.set_datacolumn("answer");
            obj.set_displayrowcount("5");
            obj = new Edit("Edit_quesNo01", "absolute", "893", "35", "95", "21", null, null, this.Div02);
            obj.set_taborder("141");
            obj.set_visible("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_quesNo02", "absolute", "893", "65", "95", "21", null, null, this.Div02);
            obj.set_taborder("142");
            obj.set_visible("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_quesNo03", "absolute", "893", "95", "95", "21", null, null, this.Div02);
            obj.set_taborder("143");
            obj.set_visible("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_quesNo04", "absolute", "893", "125", "95", "21", null, null, this.Div02);
            obj.set_taborder("144");
            obj.set_visible("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_quesNo05", "absolute", "893", "155", "95", "21", null, null, this.Div02);
            obj.set_taborder("145");
            obj.set_visible("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_quesNo06", "absolute", "893", "185", "95", "21", null, null, this.Div02);
            obj.set_taborder("146");
            obj.set_visible("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_quesNo07", "absolute", "893", "215", "95", "21", null, null, this.Div02);
            obj.set_taborder("147");
            obj.set_visible("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_quesNo08", "absolute", "893", "245", "95", "21", null, null, this.Div02);
            obj.set_taborder("148");
            obj.set_visible("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_quesNo09", "absolute", "893", "275", "95", "21", null, null, this.Div02);
            obj.set_taborder("149");
            obj.set_visible("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_quesNo10", "absolute", "893", "305", "95", "21", null, null, this.Div02);
            obj.set_taborder("150");
            obj.set_visible("false");
            this.Div02.addChild(obj.name, obj);

            obj = new Div("Div01", "absolute", "0", "422", "1122", "315", null, null, this);
            obj.set_taborder("14");
            this.addChild(obj.name, obj);
            obj = new Static("Static49", "absolute", "841", "0", "281", "31", null, null, this.Div01);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static50", "absolute", "560", "30", "562", "31", null, null, this.Div01);
            obj.set_taborder("1");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static47", "absolute", "560", "0", "281", "31", null, null, this.Div01);
            obj.set_taborder("2");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static45", "absolute", "280", "0", "281", "31", null, null, this.Div01);
            obj.set_taborder("3");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static46", "absolute", "280", "30", "281", "31", null, null, this.Div01);
            obj.set_taborder("4");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static34", "absolute", "0", "0", "281", "31", null, null, this.Div01);
            obj.set_taborder("5");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static39", "absolute", "0", "30", "281", "31", null, null, this.Div01);
            obj.set_taborder("6");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static35", "absolute", "0", "0", "130", "31", null, null, this.Div01);
            obj.set_taborder("7");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit_ordNo", "absolute", "134", "5", "142", "21", null, null, this.Div01);
            obj.set_taborder("8");
            obj.set_readonly("true");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static36", "absolute", "0", "30", "130", "31", null, null, this.Div01);
            obj.set_taborder("9");
            obj.set_text("장착대리점");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit_agencyNm", "absolute", "134", "35", "142", "21", null, null, this.Div01);
            obj.set_taborder("10");
            obj.set_readonly("true");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit_custNm", "absolute", "414", "5", "142", "21", null, null, this.Div01);
            obj.set_taborder("11");
            obj.set_readonly("true");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit_procDay", "absolute", "414", "35", "142", "21", null, null, this.Div01);
            obj.set_taborder("12");
            obj.set_readonly("true");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "280", "30", "130", "31", null, null, this.Div01);
            obj.set_taborder("13");
            obj.set_text("장착일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static27", "absolute", "280", "0", "130", "31", null, null, this.Div01);
            obj.set_taborder("14");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static28", "absolute", "560", "0", "130", "31", null, null, this.Div01);
            obj.set_taborder("16");
            obj.set_text("휴대번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static29", "absolute", "560", "30", "130", "31", null, null, this.Div01);
            obj.set_taborder("17");
            obj.set_text("상품명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static31", "absolute", "840", "0", "130", "31", null, null, this.Div01);
            obj.set_taborder("18");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit_telNo", "absolute", "974", "5", "143", "21", null, null, this.Div01);
            obj.set_taborder("19");
            obj.set_readonly("true");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit_matCd", "absolute", "694", "35", "423", "21", null, null, this.Div01);
            obj.set_taborder("20");
            obj.set_readonly("true");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "840", "60", "282", "31", null, null, this.Div01);
            obj.set_taborder("21");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "560", "60", "281", "31", null, null, this.Div01);
            obj.set_taborder("22");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "280", "60", "281", "31", null, null, this.Div01);
            obj.set_taborder("23");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "60", "281", "31", null, null, this.Div01);
            obj.set_taborder("24");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "60", "130", "31", null, null, this.Div01);
            obj.set_taborder("25");
            obj.set_text("등록비");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "280", "60", "130", "31", null, null, this.Div01);
            obj.set_taborder("28");
            obj.set_text("월렌탈료");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "560", "60", "130", "31", null, null, this.Div01);
            obj.set_taborder("30");
            obj.set_text("타이어본수");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "840", "60", "130", "31", null, null, this.Div01);
            obj.set_taborder("31");
            obj.set_text("렌탈기간(월)");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit_periodNm", "absolute", "974", "65", "143", "21", null, null, this.Div01);
            obj.set_taborder("32");
            obj.set_readonly("true");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "90", "1122", "150", null, null, this.Div01);
            obj.set_taborder("33");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new TextArea("TextArea00", "absolute", "134", "95", "556", "140", null, null, this.Div01);
            obj.set_taborder("34");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "0", "90", "130", "150", null, null, this.Div01);
            obj.set_taborder("35");
            obj.set_text("상담내용");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new MaskEdit("Edit_mobNo", "absolute", "694", "5", "142", "21", null, null, this.Div01);
            obj.set_taborder("15");
            obj.set_type("string");
            obj.set_mask("###-####-####");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.Div01.addChild(obj.name, obj);
            obj = new MaskEdit("Edit_regiNm", "absolute", "134", "65", "142", "21", null, null, this.Div01);
            obj.set_taborder("36");
            obj.set_type("number");
            obj.set_mask("###,###,###,##0");
            obj.set_readonly("true");
            this.Div01.addChild(obj.name, obj);
            obj = new MaskEdit("Edit_monAmt", "absolute", "414", "65", "142", "21", null, null, this.Div01);
            obj.set_taborder("37");
            obj.set_mask("###,###,###,##0");
            obj.set_readonly("true");
            this.Div01.addChild(obj.name, obj);
            obj = new MaskEdit("Edit_cntCd", "absolute", "694", "65", "142", "21", null, null, this.Div01);
            obj.set_taborder("38");
            obj.set_mask("###,###,###,##0");
            obj.set_readonly("true");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "0%", "269", "386", "31", null, null, this.Div01);
            obj.set_taborder("39");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static16", "absolute", "0%", "239", "385", "31", null, null, this.Div01);
            obj.set_taborder("52");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "0%", "269", "130", "31", null, null, this.Div01);
            obj.set_taborder("53");
            obj.set_text("타이어제조사");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Combo("manufactureDrop", "absolute", "11.94%", "274", "244", "21", null, null, this.Div01);
            this.Div01.addChild(obj.name, obj);
            obj.set_taborder("55");
            obj.set_innerdataset("@dsManufacture");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("-1");
            obj = new Static("Static18", "absolute", "34.14%", "239", "739", "31", null, null, this.Div01);
            obj.set_taborder("56");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("modelNM", "absolute", "46.08%", "244", "247", "21", null, null, this.Div01);
            obj.set_taborder("58");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static19", "absolute", "34.14%", "239", "130", "31", null, null, this.Div01);
            obj.set_taborder("64");
            obj.set_text("모델명");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Grid("grid_service", "absolute", "694", "95", "424", "140", null, null, this.Div01);
            obj.set_taborder("66");
            obj.set_binddataset("dsService");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"190\"/><Column size=\"80\"/><Column size=\"60\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"서비스명\"/><Cell col=\"1\" text=\"처리자\"/><Cell col=\"2\" text=\"처리일자\"/><Cell col=\"3\" text=\"처리시간\"/></Band><Band id=\"body\"><Cell text=\"bind:serviceNm\"/><Cell col=\"1\" text=\"bind:procInNm\"/><Cell col=\"2\" displaytype=\"date\" text=\"bind:procDay\" calendardisplaynulltype=\"none\"/><Cell col=\"3\" text=\"bind:procTm\" mask=\"##:##:##\"/></Band></Format></Formats>");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "0", "239", "130", "31", null, null, this.Div01);
            obj.set_taborder("67");
            obj.set_text("단면폭");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Combo("widthDrop", "absolute", "134", "242", null, "21", "744", null, this.Div01);
            this.Div01.addChild(obj.name, obj);
            obj.set_taborder("68");
            obj.set_innerdataset("@dsWidth");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Static("Static14", "absolute", "770", "269", "352", "31", null, null, this.Div01);
            obj.set_taborder("69");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "383", "269", null, "31", "351", null, this.Div01);
            obj.set_taborder("70");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "383", "269", "130", "31", null, null, this.Div01);
            obj.set_taborder("71");
            obj.set_text("편평비");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Combo("ratioDrop", "absolute", "517", "274", "247", "21", null, null, this.Div01);
            this.Div01.addChild(obj.name, obj);
            obj.set_taborder("72");
            obj.set_innerdataset("@dsRatio");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Static("Static15", "absolute", "770", "269", "130", "31", null, null, this.Div01);
            obj.set_taborder("73");
            obj.set_text("인치");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Combo("InchDrop", "absolute", "904", "274", null, "21", "5", null, this.Div01);
            this.Div01.addChild(obj.name, obj);
            obj.set_taborder("74");
            obj.set_innerdataset("@dsInch");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");

            obj = new Edit("Edit_jobCnt", "absolute", "513", "391", "44", "21", null, null, this);
            obj.set_taborder("15");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("3");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "445", "391", "66", "20", null, null, this);
            obj.set_taborder("16");
            obj.set_text("시도건수");
            obj.set_cssclass("sta_WF_schTitle");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", null, null, "0", this);
            obj.set_taborder("17");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "80", "1147", "20", null, null, this);
            obj.set_taborder("18");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "111", "1147", "10", null, null, this);
            obj.set_taborder("19");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "412", "1147", "10", null, null, this);
            obj.set_taborder("21");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "1021", "371", "30", "51", null, null, this);
            obj.set_taborder("22");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "797", "371", "30", "51", null, null, this);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "557", "371", "30", "51", null, null, this);
            obj.set_taborder("24");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "371", "1147", "20", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "722", "1147", "10", null, null, this);
            obj.set_taborder("26");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "0", "1063", "1147", "9", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 81, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 350, this.Div02,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("13");

            	}
            );
            this.Div02.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1122, 254, this.Div01,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("14");

            	}
            );
            this.Div01.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 1072, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSHappyCallRegister");
            		p.set_titletext("해피콜상담등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item1","Div01.Edit_ordNo","value","dsDetailInfo","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","Div01.Edit_custNm","value","dsDetailInfo","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","Div01.Edit_telNo","value","dsDetailInfo","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","Div01.Edit_agencyNm","value","dsDetailInfo","agencyNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","Div01.Edit_procDay","value","dsDetailInfo","procDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","Div01.Edit_matCd","value","dsDetailInfo","matNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","Div01.Edit_periodNm","value","dsDetailInfo","periodNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","Div02.Edit_question01","value","dsQuestion","question01");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","Div02.Edit_question02","value","dsQuestion","question02");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","Div02.Edit_question03","value","dsQuestion","question03");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","Div02.Edit_question04","value","dsQuestion","question04");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","Div02.Edit_question05","value","dsQuestion","question05");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","Div02.Edit_question06","value","dsQuestion","question06");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","Div02.Edit_question07","value","dsQuestion","question07");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","Div02.Edit_question08","value","dsQuestion","question08");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item20","Div02.Edit_question09","value","dsQuestion","question09");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item21","Div02.Edit_question10","value","dsQuestion","question10");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item33","Div02.Edit_quesNo01","value","dsQuestion","objectQus01");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item34","Div02.Edit_quesNo02","value","dsQuestion","objectQus02");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item35","Div02.Edit_quesNo03","value","dsQuestion","objectQus03");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item36","Div02.Edit_quesNo04","value","dsQuestion","objectQus04");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item37","Div02.Edit_quesNo05","value","dsQuestion","objectQus05");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item38","Div02.Edit_quesNo06","value","dsQuestion","objectQus06");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item39","Div02.Edit_quesNo07","value","dsQuestion","objectQus07");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item40","Div02.Edit_quesNo08","value","dsQuestion","objectQus08");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item41","Div02.Edit_quesNo09","value","dsQuestion","objectQus09");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item42","Div02.Edit_quesNo10","value","dsQuestion","objectQus10");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","Div02.Combo00","text","dsQuestAns","answer01");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item43","Div02.Combo01","text","dsQuestAns","answer02");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item22","Div02.Combo02","text","dsQuestAns","answer03");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item23","Div02.Combo03","text","dsQuestAns","answer04");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item24","Div02.Combo04","text","dsQuestAns","answer05");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item25","Div02.Combo05","text","dsQuestAns","answer06");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item26","Div02.Combo06","text","dsQuestAns","answer07");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item27","Div02.Combo07","text","dsQuestAns","answer08");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item28","Div02.Combo08","text","dsQuestAns","answer09");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item29","Div02.Combo09","text","dsQuestAns","answer10");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item32","Div01.Edit_mobNo","value","dsDetailInfo","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","Div01.Edit_regiNm","value","dsDetailInfo","regiNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","Div01.Edit_monAmt","value","dsDetailInfo","monAmt");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","Div01.Edit_cntCd","value","dsDetailInfo","cntCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item50","Div01.modelNM","value","dsDetailInfo","modelNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item49","Div01.manufactureDrop","value","dsDetailInfo","manufactureDrop");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item51","Div01.widthDrop","value","dsDetailInfo","widthDrop");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item52","Div01.ratioDrop","value","dsDetailInfo","ratioDrop");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item53","Div01.InchDrop","value","dsDetailInfo","inchDrop");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSRegister.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.toDay  = "";
        this.stat 	= "";
        this.bfStat = "";
        this.afStat = "";
        this.cnt 	= 0;
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){ 
        	if(nErrorCode < 0){
        		alert(strErrorMsg);				
        		return;
        	} 
        	
        	if(strSvcId == "initRegister") {
        		var ct = this.dsJobTp.rowcount;
        		if( ct != 0 ){
        			this.Div00.Combo01.set_value( this.dsJobTp.getColumn(1,"cd") );
        			this.Div00_Combo01_onitemchanged();
        		}
        	}	
        	
        	if(strSvcId == "getToday"){
        		this.Div00.Calendar01.set_value(this.toDay);
        		this.Div00.Calendar02.set_value(this.toDay);
        	}
        	
        	if(strSvcId == "registerList"){
        	var cnt = this.dsList.getRowCount();
        		if( cnt <= 0) {
        			alert("조회된 데이터가 없습니다.");
        			return;
        		}
        	}
        	
        	if(strSvcId == "registerInfo"){
        		this.Edit_callNo.set_value(this.dsList.getColumn(this.dsList.rowposition, "callNo")); //상담번호 세팅
        		this.Edit_jobCnt.set_value(this.dsList.getColumn(this.dsList.rowposition, "jobCnt")); //시도건수 세팅
        		var cnt = this.dsDetailInfo.getRowCount();
        		if(cnt <= 0) {
        			return;
        		}else{
        			this.questionInfo();
        			
        			var callStatus = nvl(this.dsList.getColumn(this.dsList.rowposition, "callStatus")); //통화상태
        			this.Combo00.set_value(callStatus);
        			
        			var callDtl = nvl(this.dsList.getColumn(this.dsList.rowposition, "callDtl")); //상담내용
        			this.Div01.TextArea00.set_value(callDtl);
        			
        			if(callStatus == "C") {
        				this.Combo00.set_enable(false); 	//통화상태버튼 비활성화
        				//this.Button31.set_enable(false); 	//상담등록버튼 비활성화	-> 20151123 장착완료건도 수정가능하게 수정함
        			}else{
        				this.Combo00.set_enable(true); 		//통화상태버튼 활성화
        				//this.Button31.set_enable(true); 	//상담등록버튼 활성화		-> 20151123 장착완료건도 수정가능하게 수정함
        			}
        		}
        		this.FN_telNoChange();
        	}
        	
        	if (strSvcId == "registerSaveDaset") {
        		if(nErrorCode == "0"){
        			alert(strErrorMsg);
        			this.clearEvent();
        			this.fn_search();
        		}else{
        			alert(strErrorMsg);
        		}
        	}
        	
        	if(strSvcId == "sRtcs0100ServiceHistory"){
        		var cnt = this.dsService.getRowCount();
        		if( cnt <= 0) {
        			this.Div01.grid_service.set_nodatatext("조회된 데이터가 없습니다.");
        		}
        	}
        	
        	if(strSvcId == "questionInfo"){
        		
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.form_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	this.get_date();
        	this.parent.setButton("E|S", this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	var sSvcID      	= "initRegister";  
        	var sController   	= "/ntrms/cs/initRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsJobTp=output dsCallStatus=output2 dsWidth=output3 dsRatio=output4 dsInch=output5 dsManufacture=output6";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.get_date = function(){
        	var sSvcID        	= "getToday";                    
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        this.fn_search = function(obj,e){
        	var jobTp 		= nvl(this.Div00.Combo01.value); 		//상담유형
        	var jobDay1 	= nvl(this.Div00.Calendar01.value); 	//처리일자FROM	
        	var jobDay2 	= nvl(this.Div00.Calendar02.value); 	//처리일자TO
        	var userId		= nvl(this.Div00.userId.value); 		//상담자 code
        	var callStatus	= nvl(this.Div00.Combo00.value); 		//통화상태
        	var custNm 		= nvl(this.Div00.Edit05.value); 		//고객명
        	var agencyCd 	= ""; 									//장착대리점
        	var mobNo 		= nvl(this.Div00.Edit04.value); 		//휴대번호
        	var telNo 		= nvl(this.Div00.Edit01.value); 		//전화번호

        	if( jobTp == ""   || jobTp == null   || jobTp.length == 0	) { alert("상담유형을 입력해주세요."); 		   return; }
        	if( jobDay1 == "" || jobDay1 == null || jobDay1.length == 0	) { alert("처리일자(시작일)을 입력해주세요."); return; }
        	if( jobDay2 == "" || jobDay2 == null || jobDay2.length == 0	) { alert("처리일자(종료일)을 입력해주세요."); return; }
        	
        	var sSvcID        	= "registerList";             
        	var sController   	= "/ntrms/cs/registerList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=output";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsList.clearData();

        	sArgs += Ex.util.setParam("jobTp", jobTp);
        	sArgs += Ex.util.setParam("jobDay1", jobDay1);
        	sArgs += Ex.util.setParam("jobDay2", jobDay2);
        	sArgs += Ex.util.setParam("userId", userId);
        	sArgs += Ex.util.setParam("callStatus", callStatus);
        	sArgs += Ex.util.setParam("custNm", custNm);
        	sArgs += Ex.util.setParam("agencyCd", agencyCd);
        	sArgs += Ex.util.setParam("mobNo", mobNo);
        	sArgs += Ex.util.setParam("telNo", telNo);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Button00_onclick = function(obj,e){
        	var args ={p_arg:"RTCSRegister"};
        	Ex.core.popup(this,"listUser","comm::RTCOMMUser_pop.xfdl",args, "modaless=false");
        }
        this.returnUserInfo = function(arr) {
        	var	cd = arr[0].getColumn(0, "userId");
        	var cdNm = arr[0].getColumn(0, "userNm");
        	
        	this.Div00.userId.set_value(cd);
        	this.Div00.userNm.set_value(cdNm);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Grid00_oncelldblclick = function(obj,e){
        	this.chgEndFlag = false;
        	this.Button31.set_enable(true); 												//상담등록버튼 비활성화
        	this.stat  		= this.dsList.getColumn(this.dsList.rowposition,"callStatus");
        	var ordNo 		= nvl(this.dsList.getColumn(this.dsList.rowposition, "ordNo"));
        	var servSeq 	= nvl(this.dsList.getColumn(this.dsList.rowposition, "servSeq"));
        	
        	this.clearEvent();
        	
        	var sSvcID        	= "registerInfo";             
        	var sController   	= "/ntrms/cs/registerInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsDetailInfo=output";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("ordNo", ordNo);
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        	if( ordNo != "" && servSeq != ""){
        		this.serviceHistory(ordNo, servSeq);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.serviceHistory = function(ordNo,servSeq){
        	if( ordNo != "" && servSeq != ""){
        		var sSvcID        	= "sRtcs0100ServiceHistory";             
        		var sController   	= "/ntrms/cs/sRtcs0100ServiceHistory.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsService=serviceHistory";
        		var sArgs 			= ""
        		var fn_callBack		= "fn_callBack";
        		this.dsService.clearData();
        		sArgs += Ex.util.setParam("ordNo", ordNo);
        		sArgs += Ex.util.setParam("servSeq", servSeq);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.questionInfo = function(){//질문/ 답변
        	var callNo = nvl(this.dsList.getColumn(this.dsList.rowposition, "callNo")); //상담번호
        	var sSvcID        	= "questionInfo";             
        	var sController   	= "/ntrms/cs/questionInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " dsQuestion=output ";
        	sOutDatasets += " dsAnswer1=output1 ";
        	sOutDatasets += " dsAnswer2=output2 ";
        	sOutDatasets += " dsAnswer3=output3 ";
        	sOutDatasets += " dsAnswer4=output4 ";
        	sOutDatasets += " dsAnswer5=output5 ";
        	sOutDatasets += " dsAnswer6=output6 ";
        	sOutDatasets += " dsAnswer7=output7 ";
        	sOutDatasets += " dsAnswer8=output8 ";
        	sOutDatasets += " dsAnswer9=output9 ";
        	sOutDatasets += " dsAnswer10=output10 ";
        	sOutDatasets += " dsQuestAns=output11 ";
        	
        	this.dsQuestion.clearData();
        	
        	sArgs += Ex.util.setParam("callNo", callNo);
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Button31_onclick = function(obj,e){//상담등록
        	var callNo 			= nvl(this.Edit_callNo.value); 											//상담번호
        	var jobCnt 			= nvl(this.Edit_jobCnt.value); 											//시도건수
        	var ordNo 			= nvl(this.dsDetailInfo.getColumn(0, "ordNo"))							//계약번호
        	var callDtl 		= nvl(this.Div01.TextArea00.value);  									//상담내용
        	var callStatus 		= nvl(this.Combo00.value); 												//통화상태
        	var callStatusNow 	= nvl(this.dsList.getColumn(this.dsList.rowposition, "callStatus")); 	//기존 통화상태
        	
        	//통화 완료건이면 등록 X -> 20151123 장착완료건도 수정가능하게 수정함
        	//if(callStatusNow == "C"){
        	//	alert("통화완료건 입니다.")
        	//	return;
        	//} 
        	
        	if(callStatus=="" || callStatus.length == 0){
        		alert("통화상태를 선택해주세요");
        		return;
        	} 
        	
        	//통화상태 통화미완료, 통화완료 저장시 시도건수 +1 저장
        	if(callStatus == "N" || callStatus == "C") {
        		jobCnt = parseInt(jobCnt, 10) + 1;
        	}
        	
        	var sSvcID        	= "registerSaveDaset";
        	var sController   	= "/ntrms/cs/registerSaveDaset.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	sInDatasets   		= "input2=dsQusAnsInput";
        	sOutDatasets  		= "";
        	var fn_callBack		= "fn_callBack";

        	//dsList 파라미터값 세팅
        	sArgs += Ex.util.setParam("callNo", callNo);
        	sArgs += Ex.util.setParam("jobCnt", jobCnt);
        	sArgs += Ex.util.setParam("ordNo", ordNo);
        	sArgs += Ex.util.setParam("callDtl", callDtl);
        	sArgs += Ex.util.setParam("callStatus", callStatus);
        	
        	//통화 완료시 dsQuestAns 질문에 대한 답변 null체크/ 타이어 제조사 값 체크
        	if(callStatus == "C") {
        		if(nvl(this.Div02.Edit_quesNo01.value) != "" && nvl(this.Div02.Combo00.value) == "") {
        			alert("1번째 질문에대한 답변 등록후 저장하세요");
        			return;
        		}
        		if(nvl(this.Div02.Edit_quesNo03.value) != "" && nvl(this.Div02.Combo01.value) == "") {
        			alert("2번째 질문에대한 답변 등록후 저장하세요");
        			return;
        		}
        		if(nvl(this.Div02.Edit_quesNo03.value) != "" && nvl(this.Div02.Combo02.value) == "") {
        			alert("3번째 질문에대한 답변 등록후 저장하세요");
        			return;
        		}
        		if(nvl(this.Div02.Edit_quesNo04.value) != "" && nvl(this.Div02.Combo03.value) == "") {
        			alert("4번째 질문에대한 답변 등록후 저장하세요");
        			return;
        		}
        		if(nvl(this.Div02.Edit_quesNo05.value) != "" && nvl(this.Div02.Combo04.value) == "") {
        			alert("5번째 질문에대한 답변 등록후 저장하세요");
        			return;
        		}
        		if(nvl(this.Div02.Edit_quesNo06.value) != "" && nvl(this.Div02.Combo05.value) == "") {
        			alert("6번째 질문에대한 답변 등록후 저장하세요");
        			return;
        		}
        		if(nvl(this.Div02.Edit_quesNo07.value) != "" && nvl(this.Div02.Combo06.value) == "") {
        			alert("7번째 질문에대한 답변 등록후 저장하세요");
        			return;
        		}
        		if(nvl(this.Div02.Edit_quesNo08.value) != "" && nvl(this.Div02.Combo07.value) == "") {
        			alert("8번째 질문에대한 답변 등록후 저장하세요");
        			return;
        		}
        		if(nvl(this.Div02.Edit_quesNo09.value) != "" && nvl(this.Div02.Combo08.value) == "") {
        			alert("9번째 질문에대한 답변 등록후 저장하세요");
        			return;
        		}
        		if(nvl(this.Div02.Edit_quesNo10.value) != "" && nvl(this.Div02.Combo09.value) == "") {
        			alert("10번째 질문에대한 답변 등록후 저장하세요");
        			return;
        		}

        		if(nvl(this.Div01.manufactureDrop.value) == "") {  
        		    alert("타이어 제조사를 등록후 저장하세요");
        			return;
        		}
        		
        	}
        	
        	//dsQuestAns 파라미터값 세팅
        	this.dsQusAnsInput.clearData();
        	this.dsQusAnsInput.addRow();
        	
        	this.dsQusAnsInput.setColumn(0, "callNo", callNo); //상담번호
        	
        	this.dsQusAnsInput.setColumn(0, "objectQus01", this.Div02.Edit_quesNo01.value); //질문1 코드
        	this.dsQusAnsInput.setColumn(0, "objectQus02", this.Div02.Edit_quesNo02.value); //질문2 코드
        	this.dsQusAnsInput.setColumn(0, "objectQus03", this.Div02.Edit_quesNo03.value); //질문3 코드
        	this.dsQusAnsInput.setColumn(0, "objectQus04", this.Div02.Edit_quesNo04.value); //질문4 코드
        	this.dsQusAnsInput.setColumn(0, "objectQus05", this.Div02.Edit_quesNo05.value); //질문5 코드
        	this.dsQusAnsInput.setColumn(0, "objectQus06", this.Div02.Edit_quesNo06.value); //질문6 코드
        	this.dsQusAnsInput.setColumn(0, "objectQus07", this.Div02.Edit_quesNo07.value); //질문7 코드
        	this.dsQusAnsInput.setColumn(0, "objectQus08", this.Div02.Edit_quesNo08.value); //질문8 코드
        	this.dsQusAnsInput.setColumn(0, "objectQus09", this.Div02.Edit_quesNo09.value); //질문9 코드
        	this.dsQusAnsInput.setColumn(0, "objectQus10", this.Div02.Edit_quesNo10.value); //질문10 코드
        	
        	this.dsQusAnsInput.setColumn(0, "objectAns01", this.Div02.Combo00.value); //답변1 코드
        	this.dsQusAnsInput.setColumn(0, "objectAns02", this.Div02.Combo01.value); //답변2 코드
        	this.dsQusAnsInput.setColumn(0, "objectAns03", this.Div02.Combo02.value); //답변3 코드
        	this.dsQusAnsInput.setColumn(0, "objectAns04", this.Div02.Combo03.value); //답변4 코드
        	this.dsQusAnsInput.setColumn(0, "objectAns05", this.Div02.Combo04.value); //답변5 코드
        	this.dsQusAnsInput.setColumn(0, "objectAns06", this.Div02.Combo05.value); //답변6 코드
        	this.dsQusAnsInput.setColumn(0, "objectAns07", this.Div02.Combo06.value); //답변7 코드
        	this.dsQusAnsInput.setColumn(0, "objectAns08", this.Div02.Combo07.value); //답변8 코드
        	this.dsQusAnsInput.setColumn(0, "objectAns09", this.Div02.Combo08.value); //답변9 코드
        	this.dsQusAnsInput.setColumn(0, "objectAns10", this.Div02.Combo09.value); //답변10 코드
        	
            this.dsQusAnsInput.setColumn(0, "manufactureDrop", 	this.dsDetailInfo.getColumn(0,"manufactureDrop") );
        	this.dsQusAnsInput.setColumn(0, "modelNm", 			this.dsDetailInfo.getColumn(0,"modelNm") );
        	this.dsQusAnsInput.setColumn(0, "widthDrop", 		this.dsDetailInfo.getColumn(0,"widthDrop") );
        	this.dsQusAnsInput.setColumn(0, "inchDrop", 		this.dsDetailInfo.getColumn(0,"inchDrop") );
        	this.dsQusAnsInput.setColumn(0, "ratioDrop", 		this.dsDetailInfo.getColumn(0,"ratioDrop") );
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.clearEvent = function() {				//클리어 이벤트
        	this.dsDetailInfo.clearData(); 			//계약상세
        	this.dsQuestion.clearData(); 			//질문내용
        	this.dsAnswer1.clearData(); 			//답변내용1
        	this.dsAnswer2.clearData(); 			//답변내용2
        	this.dsAnswer3.clearData(); 			//답변내용3
        	this.dsAnswer4.clearData(); 			//답변내용4
        	this.dsAnswer5.clearData(); 			//답변내용5
        	this.dsAnswer6.clearData(); 			//답변내용6
        	this.dsAnswer7.clearData(); 			//답변내용7
        	this.dsAnswer8.clearData(); 			//답변내용8
        	this.dsAnswer9.clearData(); 			//답변내용9
        	this.dsAnswer10.clearData(); 			//답변내용10
        	this.dsService.clearData();				//서비스 처리내역
        	this.Edit_callNo.set_value(""); 		//상담번호 초기화
        	this.Combo00.set_index(-1); 			//통화상태 초기화
        	this.Edit_jobCnt.set_value(""); 		//시도건수 초기화
        	this.Div01.TextArea00.set_value(""); 	//상담내용
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_telNoChange = function(){
        	this.Div01.Edit_telNo.set_value( FN_numberHyphenInReturn(this.dsDetailInfo.getColumn(0,"telNo")));
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Combo00_onitemchanged = function(obj,e){//초기:I, 통화미완료:N, 통화완료:C
        	if(this.cnt > 1) {
        		this.cnt = 0;
        	}
        	this.bfStat = this.dsList.getColumn(this.dsList.rowposition,"callStatus");
        	this.afStat = obj.value;

        	if(this.bfStat == "N" && this.afStat == "I") {
        		if(this.cnt == 0) {
        			alert('통화미완료건은 초기상태로 변경이 불가능합니다.');
        		}
        		this.Combo00.set_value(this.bfStat);
        		this.cnt++;
        	}else {
        		this.cnt = 0;	
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.Div00_Combo01_onitemchanged = function(obj,e){
        	if( this.Div00.Combo01.value == "H1" ){
        		this.Div01.grid_service.set_visible(false);
        		this.Div01.TextArea00.resize(983,140);
        	}else{
        		this.Div01.grid_service.set_visible(true);
        		this.Div01.TextArea00.resize(556,140);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_excel = function(obj,e){
        	Ex.core.exportExcel(this, this.Grid00);
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Div00.Combo01.addEventHandler("onitemchanged", this.Div00_Combo01_onitemchanged, this);
            this.Div00.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.Grid00.addEventHandler("oncelldblclick", this.Grid00_oncelldblclick, this);
            this.Button31.addEventHandler("onclick", this.Button31_onclick, this);
            this.Combo00.addEventHandler("onitemchanged", this.Combo00_onitemchanged, this);
            this.Div02.Combo00.addEventHandler("onitemchanged", this.Combo00_onitemchanged, this);
            this.Div02.Combo01.addEventHandler("onitemchanged", this.Combo00_onitemchanged, this);
            this.Div02.Combo02.addEventHandler("onitemchanged", this.Combo00_onitemchanged, this);
            this.Div02.Combo03.addEventHandler("onitemchanged", this.Combo00_onitemchanged, this);
            this.Div02.Combo04.addEventHandler("onitemchanged", this.Combo00_onitemchanged, this);
            this.Div02.Combo05.addEventHandler("onitemchanged", this.Combo00_onitemchanged, this);
            this.Div02.Combo06.addEventHandler("onitemchanged", this.Combo00_onitemchanged, this);
            this.Div02.Combo07.addEventHandler("onitemchanged", this.Combo00_onitemchanged, this);
            this.Div02.Combo08.addEventHandler("onitemchanged", this.Combo00_onitemchanged, this);
            this.Div02.Combo09.addEventHandler("onitemchanged", this.Combo00_onitemchanged, this);

        };

        this.loadIncludeScript("RTCSRegister.xfdl");

       
    };
}
)();

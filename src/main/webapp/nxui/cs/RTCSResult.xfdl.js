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
                this.set_name("RTCSResult");
                this.set_classname("RTCSHappyCallRegister");
                this.set_titletext("해피콜상담결과조회");
                this._setFormPosition(0,0,1147,900);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsJobTp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsCallStatus", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"jobTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"callNo\" type=\"STRING\" size=\"256\"/><Column id=\"userIdNm\" type=\"STRING\" size=\"256\"/><Column id=\"callStatusNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"jobCnt\" type=\"STRING\" size=\"256\"/><Column id=\"jobDay\" type=\"STRING\" size=\"256\"/><Column id=\"callDay\" type=\"STRING\" size=\"256\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/><Column id=\"servSeq\" type=\"STRING\" size=\"256\"/><Column id=\"procInNm\" type=\"STRING\" size=\"256\"/><Column id=\"answer\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"serviceNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsQuestAns", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"question01\" type=\"STRING\" size=\"256\"/><Column id=\"question02\" type=\"STRING\" size=\"256\"/><Column id=\"question03\" type=\"STRING\" size=\"256\"/><Column id=\"question04\" type=\"STRING\" size=\"256\"/><Column id=\"question05\" type=\"STRING\" size=\"256\"/><Column id=\"question06\" type=\"STRING\" size=\"256\"/><Column id=\"question07\" type=\"STRING\" size=\"256\"/><Column id=\"question08\" type=\"STRING\" size=\"256\"/><Column id=\"question09\" type=\"STRING\" size=\"256\"/><Column id=\"question10\" type=\"STRING\" size=\"256\"/><Column id=\"answer01\" type=\"STRING\" size=\"256\"/><Column id=\"answer02\" type=\"STRING\" size=\"256\"/><Column id=\"answer03\" type=\"STRING\" size=\"256\"/><Column id=\"answer04\" type=\"STRING\" size=\"256\"/><Column id=\"answer05\" type=\"STRING\" size=\"256\"/><Column id=\"answer06\" type=\"STRING\" size=\"256\"/><Column id=\"answer07\" type=\"STRING\" size=\"256\"/><Column id=\"answer08\" type=\"STRING\" size=\"256\"/><Column id=\"answer09\" type=\"STRING\" size=\"256\"/><Column id=\"answer10\" type=\"STRING\" size=\"256\"/><Column id=\"subjectQus1\" type=\"STRING\" size=\"256\"/><Column id=\"subjectQus2\" type=\"STRING\" size=\"256\"/><Column id=\"subjectQus3\" type=\"STRING\" size=\"256\"/><Column id=\"subjectQus4\" type=\"STRING\" size=\"256\"/><Column id=\"subjectQus5\" type=\"STRING\" size=\"256\"/><Column id=\"subjectAns1\" type=\"STRING\" size=\"256\"/><Column id=\"subjectAns2\" type=\"STRING\" size=\"256\"/><Column id=\"subjectAns3\" type=\"STRING\" size=\"256\"/><Column id=\"subjectAns4\" type=\"STRING\" size=\"256\"/><Column id=\"subjectAns5\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsService", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"serviceCd\" type=\"STRING\" size=\"256\"/><Column id=\"serviceNm\" type=\"STRING\" size=\"256\"/><Column id=\"procInCd\" type=\"STRING\" size=\"256\"/><Column id=\"procInNm\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procTm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("Div00", "absolute", "0", "0", "1122", "80", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "36", "11", "79", "21", null, null, this.Div00);
            obj.set_taborder("19");
            obj.set_text("상담유형");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "279", "11", "79", "21", null, null, this.Div00);
            obj.set_taborder("22");
            obj.set_text("처리일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("userNm", "absolute", "672", "11", "140", "21", null, null, this.Div00);
            obj.set_taborder("23");
            obj.set_tooltiptext("edit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("20");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "604", "11", "79", "21", null, null, this.Div00);
            obj.set_taborder("24");
            obj.set_text("상담사");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "848", "11", "79", "21", null, null, this.Div00);
            obj.set_taborder("26");
            obj.set_text("통화상태");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Combo("Combo_callStatus", "absolute", "915", "11", "140", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("4");
            obj.set_innerdataset("@dsCallStatus");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Edit("Ed_agencyCd", "absolute", "359", "43", "209", "21", null, null, this.Div00);
            obj.set_taborder("6");
            obj.set_tooltiptext("edit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("10");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "279", "43", "79", "21", null, null, this.Div00);
            obj.set_taborder("31");
            obj.set_text("장착대리점");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("Ed_custNm", "absolute", "103", "43", "140", "21", null, null, this.Div00);
            obj.set_taborder("5");
            obj.set_tooltiptext("edit");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("120");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "36", "43", "79", "21", null, null, this.Div00);
            obj.set_taborder("33");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("Calendar02", "absolute", "468", "11", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("2");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Static("Static07", "absolute", "456", "11", "9", "21", null, null, this.Div00);
            obj.set_taborder("35");
            obj.set_text("~");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("Calendar01", "absolute", "359", "11", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj = new Combo("Combo_jobTp", "absolute", "103", "11", "140", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_innerdataset("@dsJobTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Button("Button00", "absolute", "791", "11", "21", "21", null, null, this.Div00);
            obj.set_taborder("3");
            obj.set_cssclass("btn_WF_edtSch");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("userId", "absolute", "672", "11", "92", "21", null, null, this.Div00);
            obj.set_taborder("42");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("20");
            obj.set_visible("false");
            obj.set_tooltiptext("edit");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "0", "0", null, "12", "0", null, this.Div00);
            obj.set_taborder("43");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "0", "31", null, "12", "0", null, this.Div00);
            obj.set_taborder("44");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "64", null, "12", "0", null, this.Div00);
            obj.set_taborder("45");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "0", "0", "30", "76", null, null, this.Div00);
            obj.set_taborder("46");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "243", "0", "30", "76", null, null, this.Div00);
            obj.set_taborder("47");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "568", "0", "30", "76", null, null, this.Div00);
            obj.set_taborder("48");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "812", "0", "30", "76", null, null, this.Div00);
            obj.set_taborder("49");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "96", "81", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("상담리스트");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Div("Div01", "absolute", "0", "381", "1147", "162", null, null, this);
            obj.set_taborder("6");
            this.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "1122", "150", null, null, this.Div01);
            obj.set_taborder("36");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div01.addChild(obj.name, obj);
            obj = new TextArea("TextArea00", "absolute", "135", "5", "553", "140", null, null, this.Div01);
            obj.set_taborder("37");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "0", "0", "130", "150", null, null, this.Div01);
            obj.set_taborder("38");
            obj.set_text("상담내용");
            obj.set_cssclass("sta_WF_detailLabel");
            this.Div01.addChild(obj.name, obj);
            obj = new Grid("grid_service", "absolute", "692", "5", "424", "140", null, null, this.Div01);
            obj.set_taborder("39");
            obj.set_binddataset("dsService");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"190\"/><Column size=\"80\"/><Column size=\"60\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"서비스명\"/><Cell col=\"1\" text=\"처리자\"/><Cell col=\"2\" text=\"처리일자\"/><Cell col=\"3\" text=\"처리시간\"/></Band><Band id=\"body\"><Cell text=\"bind:serviceNm\"/><Cell col=\"1\" text=\"bind:procInNm\"/><Cell col=\"2\" displaytype=\"date\" text=\"bind:procDay\" calendardisplaynulltype=\"none\"/><Cell col=\"3\" text=\"bind:procTm\" mask=\"##:##:##\"/></Band></Format></Formats>");
            this.Div01.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "121", "1122", "250", null, null, this);
            obj.set_taborder("20");
            obj.set_binddataset("dsList");
            obj.set_autofittype("none");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"93\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"70\"/><Column size=\"100\"/><Column size=\"73\"/><Column size=\"138\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"60\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"66\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"상담유형\"/><Cell col=\"1\" text=\"상담번호\"/><Cell col=\"2\" text=\"상담사\"/><Cell col=\"3\" text=\"통화상태\"/><Cell col=\"4\" text=\"계약번호\"/><Cell col=\"5\" text=\"고객명\"/><Cell col=\"6\" text=\"대리점\"/><Cell col=\"7\" text=\"휴대번호\"/><Cell col=\"8\" text=\"전화번호\"/><Cell col=\"9\" text=\"시도건수\"/><Cell col=\"10\" text=\"처리일자\"/><Cell col=\"11\" text=\"통화일자\"/><Cell col=\"12\" text=\"고객만족도\"/><Cell col=\"13\" text=\"등록자\"/><Cell col=\"14\" text=\"서비스명\"/></Band><Band id=\"body\"><Cell text=\"bind:jobTpNm\"/><Cell col=\"1\" text=\"bind:callNo\"/><Cell col=\"2\" text=\"bind:userIdNm\"/><Cell col=\"3\" text=\"bind:callStatusNm\"/><Cell col=\"4\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\"/><Cell col=\"5\" text=\"bind:custNm\"/><Cell col=\"6\" style=\"align:left;\" text=\"bind:procInNm\" tooltiptext=\"bind:procInNm\"/><Cell col=\"7\" text=\"bind:mobNo\" expr=\"expr:FN_numberMaskReturn(mobNo)\"/><Cell col=\"8\" text=\"bind:telNo\" expr=\"expr:FN_numberMaskReturn(telNo)\"/><Cell col=\"9\" text=\"bind:jobCnt\"/><Cell col=\"10\" displaytype=\"date\" text=\"bind:jobDay\" calendardisplaynulltype=\"none\"/><Cell col=\"11\" displaytype=\"date\" text=\"bind:callDay\" calendardisplaynulltype=\"none\"/><Cell col=\"12\" text=\"bind:answer\"/><Cell col=\"13\" text=\"bind:chgId\"/><Cell col=\"14\" text=\"bind:serviceNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("Div02", "absolute", "0", "541", "1147", "349", null, null, this);
            obj.set_taborder("21");
            this.addChild(obj.name, obj);
            obj = new Static("Static35", "absolute", "0", "0", "130", "31", null, null, this.Div02);
            obj.set_taborder("0");
            obj.set_text("질문번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_align("center middle");
            obj.style.set_font("bold 9 Dotum");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static27", "absolute", "129", "0", "864", "31", null, null, this.Div02);
            obj.set_taborder("1");
            obj.set_text("질문내용");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_align("center middle");
            obj.style.set_font("bold 9 Dotum");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static28", "absolute", "992", "0", "130", "31", null, null, this.Div02);
            obj.set_taborder("2");
            obj.set_text("답변");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.style.set_align("center middle");
            obj.style.set_font("bold 9 Dotum");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "30", "130", "31", null, null, this.Div02);
            obj.set_taborder("3");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "129", "30", "864", "31", null, null, this.Div02);
            obj.set_taborder("4");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "992", "30", "130", "31", null, null, this.Div02);
            obj.set_taborder("5");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "0", "60", "130", "31", null, null, this.Div02);
            obj.set_taborder("6");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "129", "60", "864", "31", null, null, this.Div02);
            obj.set_taborder("7");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "992", "60", "130", "31", null, null, this.Div02);
            obj.set_taborder("8");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "0", "90", "130", "31", null, null, this.Div02);
            obj.set_taborder("9");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "129", "90", "864", "31", null, null, this.Div02);
            obj.set_taborder("10");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "992", "90", "130", "31", null, null, this.Div02);
            obj.set_taborder("11");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "0", "150", "130", "31", null, null, this.Div02);
            obj.set_taborder("12");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static10", "absolute", "129", "150", "864", "31", null, null, this.Div02);
            obj.set_taborder("13");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static11", "absolute", "992", "150", "130", "31", null, null, this.Div02);
            obj.set_taborder("14");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static12", "absolute", "992", "120", "130", "31", null, null, this.Div02);
            obj.set_taborder("15");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static13", "absolute", "129", "120", "864", "31", null, null, this.Div02);
            obj.set_taborder("16");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "0", "120", "130", "31", null, null, this.Div02);
            obj.set_taborder("17");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit12", "absolute", "5", "35", "120", "21", null, null, this.Div02);
            obj.set_taborder("18");
            obj.set_value("1");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question01", "absolute", "134", "35", "854", "21", null, null, this.Div02);
            obj.set_taborder("19");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question02", "absolute", "134", "65", "854", "21", null, null, this.Div02);
            obj.set_taborder("20");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit04", "absolute", "5", "65", "120", "21", null, null, this.Div02);
            obj.set_taborder("21");
            obj.set_value("2");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question04", "absolute", "134", "125", "854", "21", null, null, this.Div02);
            obj.set_taborder("22");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit07", "absolute", "5", "125", "120", "21", null, null, this.Div02);
            obj.set_taborder("23");
            obj.set_value("4");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit08", "absolute", "5", "95", "120", "21", null, null, this.Div02);
            obj.set_taborder("24");
            obj.set_value("3");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question03", "absolute", "134", "95", "854", "21", null, null, this.Div02);
            obj.set_taborder("25");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question05", "absolute", "134", "155", "854", "21", null, null, this.Div02);
            obj.set_taborder("26");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit14", "absolute", "5", "155", "120", "21", null, null, this.Div02);
            obj.set_taborder("27");
            obj.set_value("5");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "180", "130", "31", null, null, this.Div02);
            obj.set_taborder("33");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static16", "absolute", "129", "180", "864", "31", null, null, this.Div02);
            obj.set_taborder("34");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "992", "180", "130", "31", null, null, this.Div02);
            obj.set_taborder("35");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static18", "absolute", "0", "210", "130", "31", null, null, this.Div02);
            obj.set_taborder("36");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static19", "absolute", "129", "210", "864", "31", null, null, this.Div02);
            obj.set_taborder("37");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static20", "absolute", "992", "210", "130", "31", null, null, this.Div02);
            obj.set_taborder("38");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static21", "absolute", "0", "240", "130", "31", null, null, this.Div02);
            obj.set_taborder("39");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "129", "240", "864", "31", null, null, this.Div02);
            obj.set_taborder("40");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "992", "240", "130", "31", null, null, this.Div02);
            obj.set_taborder("41");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "0", "300", "130", "31", null, null, this.Div02);
            obj.set_taborder("42");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static25", "absolute", "129", "300", "864", "31", null, null, this.Div02);
            obj.set_taborder("43");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "992", "300", "130", "31", null, null, this.Div02);
            obj.set_taborder("44");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static29", "absolute", "992", "270", "130", "31", null, null, this.Div02);
            obj.set_taborder("45");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static30", "absolute", "129", "270", "864", "31", null, null, this.Div02);
            obj.set_taborder("46");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Static("Static31", "absolute", "0", "270", "130", "31", null, null, this.Div02);
            obj.set_taborder("47");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit01", "absolute", "5", "185", "120", "21", null, null, this.Div02);
            obj.set_taborder("48");
            obj.set_value("6");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question06", "absolute", "134", "185", "854", "21", null, null, this.Div02);
            obj.set_taborder("49");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question07", "absolute", "134", "215", "854", "21", null, null, this.Div02);
            obj.set_taborder("50");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit10", "absolute", "5", "215", "120", "21", null, null, this.Div02);
            obj.set_taborder("51");
            obj.set_value("7");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question09", "absolute", "134", "275", "854", "21", null, null, this.Div02);
            obj.set_taborder("52");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit15", "absolute", "5", "275", "120", "21", null, null, this.Div02);
            obj.set_taborder("53");
            obj.set_value("9");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit16", "absolute", "5", "245", "120", "21", null, null, this.Div02);
            obj.set_taborder("54");
            obj.set_value("8");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question08", "absolute", "134", "245", "854", "21", null, null, this.Div02);
            obj.set_taborder("55");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_question10", "absolute", "134", "305", "854", "21", null, null, this.Div02);
            obj.set_taborder("56");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit19", "absolute", "5", "305", "120", "21", null, null, this.Div02);
            obj.set_taborder("57");
            obj.set_value("10");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_answer01", "absolute", "997", "36", "120", "20", null, null, this.Div02);
            obj.set_taborder("63");
            obj.set_visible("true");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_answer02", "absolute", "997", "66", "120", "20", null, null, this.Div02);
            obj.set_taborder("64");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_answer03", "absolute", "997", "96", "120", "20", null, null, this.Div02);
            obj.set_taborder("65");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_answer04", "absolute", "997", "126", "120", "20", null, null, this.Div02);
            obj.set_taborder("66");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_answer05", "absolute", "997", "156", "120", "20", null, null, this.Div02);
            obj.set_taborder("67");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_answer06", "absolute", "997", "186", "120", "20", null, null, this.Div02);
            obj.set_taborder("68");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_answer07", "absolute", "997", "216", "120", "20", null, null, this.Div02);
            obj.set_taborder("69");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_answer08", "absolute", "997", "246", "120", "20", null, null, this.Div02);
            obj.set_taborder("70");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_answer09", "absolute", "997", "276", "120", "20", null, null, this.Div02);
            obj.set_taborder("71");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);
            obj = new Edit("Edit_answer10", "absolute", "997", "306", "120", "20", null, null, this.Div02);
            obj.set_taborder("72");
            obj.set_enable("false");
            this.Div02.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "882", null, null, this);
            obj.set_taborder("22");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "80", "1147", "20", null, null, this);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "111", "1147", "10", null, null, this);
            obj.set_taborder("24");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "371", "1147", "10", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "531", "1147", "10", null, null, this);
            obj.set_taborder("26");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "872", "1147", "10", null, null, this);
            obj.set_taborder("27");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1122, 80, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 162, this.Div01,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("6");

            	}
            );
            this.Div01.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 349, this.Div02,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("21");

            	}
            );
            this.Div02.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 900, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSHappyCallRegister");
            		p.set_titletext("해피콜상담결과조회");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","Div02.Edit_question01","value","dsQuestAns","question01");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","Div02.Edit_question02","value","dsQuestAns","question02");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","Div02.Edit_question03","value","dsQuestAns","question03");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","Div02.Edit_question04","value","dsQuestAns","question04");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","Div02.Edit_question05","value","dsQuestAns","question05");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","Div02.Edit_question06","value","dsQuestAns","question06");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","Div02.Edit_question07","value","dsQuestAns","question07");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","Div02.Edit_question08","value","dsQuestAns","question08");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","Div02.Edit_question09","value","dsQuestAns","question09");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","Div02.Edit_question10","value","dsQuestAns","question10");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","Div02.Edit_answer01","value","dsQuestAns","answer01");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","Div02.Edit_answer02","value","dsQuestAns","answer02");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","Div02.Edit_answer03","value","dsQuestAns","answer03");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","Div02.Edit_answer04","value","dsQuestAns","answer04");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","Div02.Edit_answer05","value","dsQuestAns","answer05");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","Div02.Edit_answer06","value","dsQuestAns","answer06");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item16","Div02.Edit_answer07","value","dsQuestAns","answer07");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","Div02.Edit_answer08","value","dsQuestAns","answer08");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item18","Div02.Edit_answer09","value","dsQuestAns","answer09");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item19","Div02.Edit_answer10","value","dsQuestAns","answer10");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSResult.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSResult.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSResult.xfdl
         * 설    명 : 해피콜 결과조회
         * 작 성 자 : 
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2017-06-22	wjim		[20170621_01] 등록자 추가
         ***************************************************************************************************/

        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";
        this.toDay  = "";

        /***********************************************************************************
        * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        ***********************************************************************************/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if (nErrorCode < 0) {
        		alert(strErrorMsg);		
        		return;
        	}
        	
        	if (strSvcId == "initResult"){
        		var ct = this.dsJobTp.rowcount;
        		if( ct != 0 ){
        			this.Div00.Combo_jobTp.set_value( this.dsJobTp.getColumn(1,"cd") );
        			this.Div00_Combo_jobTp_onitemchanged();
        		}
        	}
        	
        	if(strSvcId == "getToday") {
        		this.Div00.Calendar01.set_value(this.toDay);
        		this.Div00.Calendar02.set_value(this.toDay);
        	}
        	
        	if (strSvcId == "resultList"){
        		var cnt = this.dsList.getRowCount();
        		if(cnt <= 0){
        			alert("조회된 데이터가 없습니다.");
        			this.Grid00.set_nodatatext("조회된 데이터가 없습니다.");
        			return;
        		}else{
        			return
        		}
        	}

        	if(strSvcId = "questionInfo2"){
        		var callDtl = nvl(this.dsList.getColumn(this.dsList.rowposition, "callDtl")); //상담내용
        		this.Div01.TextArea00.set_value(callDtl);									  //상담내용 세팅
        	}
        }

        

        this.form_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	this.get_date();
        	this.parent.setButton("E|S", this);
        }

        

        //콤보박스 세팅
        this.fn_init = function(){
        	var sSvcID      	= "initResult";  
        	var sController   	= "/ntrms/cs/initResult.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsJobTp=output dsCallStatus=output2";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        

        //java comm에서 현재 날짜 가져오기
        this.get_date = function(){
        	var sSvcID        	= "getToday";                    
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        

        //조회
        this.fn_search = function(obj,e){
        	var jobTp 		= nvl(this.Div00.Combo_jobTp.value); 		//상담유형
        	var jobDay1 	= nvl(this.Div00.Calendar01.value); 		//처리일자FROM	
        	var jobDay2 	= nvl(this.Div00.Calendar02.value); 		//처리일자TO
        	var userId		= nvl(this.Div00.userId.value); 			//상담자 code
        	var callStatus	= nvl(this.Div00.Combo_callStatus.value); 	//통화상태
        	var custNm 		= nvl(this.Div00.Ed_custNm.value); 			//고객명
        	var agencyCd 	= nvl(this.Div00.Ed_agencyCd.value); 		//장착대리점
        	var loginId     = application.gds_userInfo.getColumn(0, "userId"); //사용자ID
        	
        	if( jobTp   == "" || jobTp == null   || jobTp.length == 0   ) { alert("상담유형을 입력해주세요."); 			return; }
        	if( jobDay1 == "" || jobDay1 == null || jobDay1.length == 0 ) { alert("처리일자(시작일)을 입력해주세요."); 	return; }
        	if( jobDay2 == "" || jobDay2 == null || jobDay2.length == 0 ) { alert("처리일자(종료일)을 입력해주세요."); 	return; }
        	
        	var sSvcID        	= "resultList";             
        	var sController   	= "/ntrms/cs/resultList.do";
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
        	sArgs += Ex.util.setParam("loginId", loginId);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        

        //엑셀
        this.fn_excel= function() {
        	Ex.core.exportExcel(this, this.Grid00);
        }

        

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

        

        //상단 그리드 더블 클릭
        this.Grid00_oncelldblclick = function(obj,e){
        	this.dsQuestAns.clearData();
        	this.questionInfo();
        }

        

        this.questionInfo = function(){
        	var callNo  = nvl(this.dsList.getColumn(this.dsList.rowposition, "callNo")); //상담번호
        	var ordNo 	= nvl(this.dsList.getColumn(this.dsList.rowposition, "ordNo"));
        	var servSeq = nvl(this.dsList.getColumn(this.dsList.rowposition, "servSeq"));
        	
        	var sSvcID        	= "questionInfo2";             
        	var sController   	= "/ntrms/cs/questionInfo2.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsQuestAns=output";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	
        	this.dsQuestAns.clearData();
        	this.Div01.TextArea00.set_value("");
        	sArgs += Ex.util.setParam("callNo", callNo);
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        	if( ordNo != "" && servSeq != ""){
        		this.serviceHistory(ordNo, servSeq);
        	}
        }
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

        
        this.Div00_Combo_jobTp_onitemchanged = function(obj,e){
        	this.dsList.clearData();
        	if( this.Div00.Combo_jobTp.value == "H1" ){
        		this.Grid00.setCellProperty( "head", 6, "text", "대리점");
        		this.Div01.grid_service.set_visible(false);
        		this.Div01.TextArea00.resize(983,140);
        	}else{
        		this.Grid00.setCellProperty( "head", 6, "text", "서비스처리자");
        		this.Div01.grid_service.set_visible(true);
        		this.Div01.TextArea00.resize(553,140);
        	}
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Div00.Combo_jobTp.addEventHandler("onitemchanged", this.Div00_Combo_jobTp_onitemchanged, this);
            this.Div00.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.Grid00.addEventHandler("oncelldblclick", this.Grid00_oncelldblclick, this);

        };

        this.loadIncludeScript("RTCSResult.xfdl");

       
    };
}
)();

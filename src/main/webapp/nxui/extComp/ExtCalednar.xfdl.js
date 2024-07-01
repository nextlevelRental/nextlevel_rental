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
                this.set_name("extCalendar");
                this.set_classname("COA0101");
                this.set_titletext("년도달력");
                this.set_scrollbars("none");
                this._setFormPosition(0,0,116,21);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsCalendar", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj._setContents("<ColumnInfo><Column id=\"month0\" type=\"STRING\" size=\"256\"/><Column id=\"month1\" type=\"STRING\" size=\"256\"/><Column id=\"month2\" type=\"STRING\" size=\"256\"/><Column id=\"month3\" type=\"STRING\" size=\"256\"/><Column id=\"img0\" type=\"STRING\" size=\"256\"/><Column id=\"img1\" type=\"STRING\" size=\"256\"/><Column id=\"img2\" type=\"STRING\" size=\"256\"/><Column id=\"img3\" type=\"STRING\" size=\"256\"/><Column id=\"img0_1\" type=\"STRING\" size=\"256\"/><Column id=\"img1_1\" type=\"STRING\" size=\"256\"/><Column id=\"img2_1\" type=\"STRING\" size=\"256\"/><Column id=\"img3_1\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"month0\">1</Col><Col id=\"month1\">2</Col><Col id=\"month2\">3</Col><Col id=\"month3\">4</Col><Col id=\"img0\">img::m_01.png</Col><Col id=\"img1\">img::m_02.png</Col><Col id=\"img2\">img::m_03.png</Col><Col id=\"img3\">img::m_04.png</Col><Col id=\"img0_1\">img::m_01_1.png</Col><Col id=\"img1_1\">img::m_02_1.png</Col><Col id=\"img2_1\">img::m_03_1.png</Col><Col id=\"img3_1\">img::m_04_1.png</Col></Row><Row><Col id=\"month0\">5</Col><Col id=\"month1\">6</Col><Col id=\"month2\">7</Col><Col id=\"month3\">8</Col><Col id=\"img0\">img::m_05.png</Col><Col id=\"img1\">img::m_06.png</Col><Col id=\"img2\">img::m_07.png</Col><Col id=\"img3\">img::m_08.png</Col><Col id=\"img0_1\">img::m_05_1.png</Col><Col id=\"img1_1\">img::m_06_1.png</Col><Col id=\"img2_1\">img::m_07_1.png</Col><Col id=\"img3_1\">img::m_08_1.png</Col></Row><Row><Col id=\"month0\">9</Col><Col id=\"month1\">10</Col><Col id=\"month2\">11</Col><Col id=\"month3\">12</Col><Col id=\"img0\">img::m_09.png</Col><Col id=\"img1\">img::m_10.png</Col><Col id=\"img2\">img::m_11.png</Col><Col id=\"img3\">img::m_12.png</Col><Col id=\"img0_1\">img::m_09_1.png</Col><Col id=\"img1_1\">img::m_10_1.png</Col><Col id=\"img2_1\">img::m_11_1.png</Col><Col id=\"img3_1\">img::m_12_1.png</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_year", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"value\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows/>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tCalendar", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"a\" type=\"STRING\" size=\"256\"/><Column id=\"b\" type=\"STRING\" size=\"256\"/><Column id=\"d1\" type=\"STRING\" size=\"256\"/><Column id=\"d11\" type=\"STRING\" size=\"256\"/><Column id=\"d2\" type=\"STRING\" size=\"256\"/><Column id=\"d22\" type=\"STRING\" size=\"256\"/><Column id=\"d3\" type=\"STRING\" size=\"256\"/><Column id=\"d33\" type=\"STRING\" size=\"256\"/><Column id=\"d4\" type=\"STRING\" size=\"256\"/><Column id=\"d44\" type=\"STRING\" size=\"256\"/><Column id=\"d5\" type=\"STRING\" size=\"256\"/><Column id=\"d55\" type=\"STRING\" size=\"256\"/><Column id=\"d6\" type=\"STRING\" size=\"256\"/><Column id=\"d66\" type=\"STRING\" size=\"256\"/><Column id=\"d7\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tHoliday", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"DateColumn\" type=\"STRING\" size=\"256\"/><Column id=\"TextColorColumn\" type=\"STRING\" size=\"256\"/><Column id=\"BackColorColumn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Calendar("cal_day", "absolute", "0", "0", null, null, "0", "0", this);
            this.addChild(obj.name, obj);
            obj.set_taborder("6");
            obj.set_dateformat("MM/dd/yyyy");
            obj.set_editformat("MM/dd/yyyy");
            obj.set_value("null");
            obj.set_autoselect("true");

            obj = new PopupDiv("popDiv_Cal", "absolute", "-1", "31", "196", "208", null, null, this);
            obj.set_scrollbars("none");
            obj.set_cssclass("POPCA_popDiv");
            obj.set_visible("false");
            obj.getSetter("taborder").set("0");
            this.addChild(obj.name, obj);
            obj = new Div("divDay", "absolute", "0", "0", "194", "206", null, null, this.popDiv_Cal);
            obj.set_taborder("0");
            obj.set_positionstep("-1");
            obj.style.set_border("2 solid #54769fff");
            obj.set_cssclass("div_POPCA_divLine");
            obj.set_tabstop("false");
            this.popDiv_Cal.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "58", "190", "23", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("2");
            obj.set_cssclass("sta_POPCA_headerWeek");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "0", "190", "58", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("1");
            obj.set_cssclass("sta_POPCA_header");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stc0", "absolute", "4", "61", "24", "14", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("3");
            obj.set_text("Su");
            obj.set_cssclass("stc_POPMCA_WeekSun");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stc1", "absolute", "30", "61", "25", "14", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("4");
            obj.set_text("Mo");
            obj.set_cssclass("stc_POPMCA_Week");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stc2", "absolute", "57", "61", "24", "14", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("5");
            obj.set_text("Tu");
            obj.set_cssclass("stc_POPMCA_Week");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stc3", "absolute", "83", "61", "24", "14", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("6");
            obj.set_text("We");
            obj.set_cssclass("stc_POPMCA_Week");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stc4", "absolute", "109", "61", "24", "14", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("7");
            obj.set_text("Tu");
            obj.set_cssclass("stc_POPMCA_Week");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stc5", "absolute", "135", "61", "24", "14", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("8");
            obj.set_text("Fr");
            obj.set_cssclass("stc_POPMCA_Week");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stc6", "absolute", "161", "61", "24", "14", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("9");
            obj.set_text("Sa");
            obj.set_cssclass("stc_POPMCA_WeekSat");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD2", "absolute", "30", "81", "25", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("10");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD7", "absolute", "161", "81", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("11");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            obj.style.set_color("#666666ff");
            obj.style.set_align("center middle");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD6", "absolute", "135", "81", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("12");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD5", "absolute", "109", "81", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("13");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD4", "absolute", "83", "81", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("14");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD3", "absolute", "57", "81", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("15");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD1", "absolute", "4", "81", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("16");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            obj.style.set_color("#666666ff");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD36", "absolute", "4", "176", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("17");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            obj.style.set_color("#666666ff");
            obj.style.set_align("center middle");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD42", "absolute", "161", "176", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("18");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            obj.style.set_color("#666666ff");
            obj.style.set_align("center middle");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD41", "absolute", "135", "176", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("19");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD40", "absolute", "109", "176", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("20");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD39", "absolute", "83", "176", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("21");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD38", "absolute", "57", "176", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("22");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD37", "absolute", "30", "176", "25", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("23");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD29", "absolute", "4", "157", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("24");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            obj.style.set_color("#666666ff");
            obj.style.set_align("center middle");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD22", "absolute", "4", "138", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("25");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            obj.style.set_color("#666666ff");
            obj.style.set_align("center middle");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD15", "absolute", "4", "119", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("26");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            obj.style.set_color("#666666ff");
            obj.style.set_align("center middle");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD8", "absolute", "4", "100", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("27");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            obj.style.set_color("#666666ff");
            obj.style.set_align("center middle");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD28", "absolute", "161", "138", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("28");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            obj.style.set_color("#666666ff");
            obj.style.set_align("center middle");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD35", "absolute", "161", "157", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("29");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            obj.style.set_color("#666666ff");
            obj.style.set_align("center middle");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD21", "absolute", "161", "119", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("30");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            obj.style.set_color("#666666ff");
            obj.style.set_align("center middle");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD14", "absolute", "161", "100", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("31");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            obj.style.set_color("#666666ff");
            obj.style.set_align("center middle");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD34", "absolute", "135", "157", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("32");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD27", "absolute", "135", "138", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("33");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD20", "absolute", "135", "119", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("34");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD13", "absolute", "135", "100", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("35");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD12", "absolute", "109", "100", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("36");
            obj.set_text("1");
            obj.style.set_border("0 none #808080ff");
            obj.style.set_color("#666666ff");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD19", "absolute", "109", "119", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("37");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD26", "absolute", "109", "138", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("38");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD33", "absolute", "109", "157", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("39");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD32", "absolute", "83", "157", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("40");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD25", "absolute", "83", "138", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("41");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD18", "absolute", "83", "119", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("42");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD11", "absolute", "83", "100", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("43");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD10", "absolute", "57", "100", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("44");
            obj.set_text("1");
            obj.style.set_border("0 none #808080ff");
            obj.style.set_color("#000000ff");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD17", "absolute", "57", "119", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("45");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD24", "absolute", "57", "138", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("46");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD31", "absolute", "57", "157", "24", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("47");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD30", "absolute", "30", "157", "25", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("48");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD23", "absolute", "30", "138", "25", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("49");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD16", "absolute", "30", "119", "25", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("50");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Static("stcD9", "absolute", "30", "100", "25", "20", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("51");
            obj.set_text("1");
            obj.set_cssclass("stc_POPCA_Day");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Button("btnNextMon", "absolute", "146", "9", "40", "11", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("52");
            obj.set_cssclass("btn_POPCA_Next");
            obj.set_tabstop("false");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Button("btnPreMon", "absolute", "4", "9", "40", "11", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("53");
            obj.set_cssclass("btn_POPCA_Prev");
            obj.set_tabstop("false");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Button("btn_today", "absolute", "68", "4", "54", "19", null, null, this.popDiv_Cal.divDay);
            obj.set_taborder("54");
            obj.set_text("Today");
            obj.set_cssclass("btn_POPCA_Today");
            obj.set_tabstop("false");
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj = new Combo("cboMonth", "absolute", "4", "30", "108", "19", null, null, this.popDiv_Cal.divDay);
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            var cboMonth_innerdataset = new Dataset("cboMonth_innerdataset", this.popDiv_Cal.divDay.cboMonth);
            cboMonth_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">01</Col><Col id=\"datacolumn\">January</Col></Row><Row><Col id=\"codecolumn\">02</Col><Col id=\"datacolumn\">February</Col></Row><Row><Col id=\"codecolumn\">03</Col><Col id=\"datacolumn\">March</Col></Row><Row><Col id=\"codecolumn\">04</Col><Col id=\"datacolumn\">April</Col></Row><Row><Col id=\"codecolumn\">05</Col><Col id=\"datacolumn\">May</Col></Row><Row><Col id=\"codecolumn\">06</Col><Col id=\"datacolumn\">June</Col></Row><Row><Col id=\"codecolumn\">07</Col><Col id=\"datacolumn\">July</Col></Row><Row><Col id=\"codecolumn\">08</Col><Col id=\"datacolumn\">August</Col></Row><Row><Col id=\"codecolumn\">09</Col><Col id=\"datacolumn\">September</Col></Row><Row><Col id=\"codecolumn\">10</Col><Col id=\"datacolumn\">October</Col></Row><Row><Col id=\"codecolumn\">11</Col><Col id=\"datacolumn\">November</Col></Row><Row><Col id=\"codecolumn\">12</Col><Col id=\"datacolumn\">December</Col></Row></Rows>");
            obj.set_innerdataset(cboMonth_innerdataset);
            obj.set_taborder("55");
            obj.set_autoselect("true");
            obj.set_autoskip("true");
            obj.set_value("01");
            obj.set_text("January");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_type("dropdown");
            obj.set_cssclass("cmb_POPCA");
            obj.set_displayrowcount("13");
            obj.style.set_itemheight("15");
            obj.set_tabstop("false");
            obj.getSetter("_useprop").set("false");
            obj.set_readonly("false");
            obj.set_index("0");
            obj = new Combo("cb_year", "absolute", "117", "30", "69", "19", null, null, this.popDiv_Cal.divDay);
            this.popDiv_Cal.divDay.addChild(obj.name, obj);
            obj.set_taborder("0");
            obj.set_autoselect("true");
            obj.set_innerdataset("@ds_year");
            obj.set_codecolumn("code");
            obj.set_datacolumn("value");
            obj.set_cssclass("cmb_POPCA");
            obj.set_displayrowcount("12");
            obj.style.set_itemheight("15");
            obj.style.set_buttonsize("15");
            obj.set_tabstop("false");
            obj.getSetter("_userprop").set("false");
            obj.set_readonly("false");
            obj.set_index("-1");

            obj = new Button("btn_cal", "absolute", null, "1", "29", null, "1", "1", this);
            obj.set_taborder("2");
            obj.set_cssclass("btn_calendar");
            obj.style.set_background("#ffffffff");
            obj.style.set_cursor("hand");
            obj.set_tabstop("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 194, 206, this.popDiv_Cal.divDay,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_positionstep("-1");
            		p.style.set_border("2 solid #54769fff");
            		p.set_cssclass("div_POPCA_divLine");
            		p.set_tabstop("false");

            	}
            );
            this.popDiv_Cal.divDay.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 196, 208, this.popDiv_Cal,
            	//-- Layout function
            	function(p) {
            		p.set_scrollbars("none");
            		p.set_cssclass("POPCA_popDiv");
            		p.set_visible("false");
            		p.getSetter("taborder").set("0");

            	}
            );
            this.popDiv_Cal.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 116, 21, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("COA0101");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("년도달력");
            		p.set_scrollbars("none");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ExtCalednar.xfdl", function() {

        /***********************************************************************************
        * SYSTEM      : HGR Industrial Surplus
        * BUSINESS    : 년도 달력
        * FILE NAME   : ExtCalendar.xfdl
        * PROGRAMMER  : w.s.jeong
        * DATE        : 2014.10.01
        * DESCRIPTION : userComponent
        *------------------------------------------------------------------
        * MODIFY DATE   PROGRAMMER			DESCRIPTION
        *------------------------------------------------------------------

        *------------------------------------------------------------------
        ***********************************************************************************/

        
        /***********************************************************************************
        * Common Library
        ***********************************************************************************/
        //include "lib::comLib.xjs";

        
        /***********************************************************************************
        * Global/Local Variable
        ***********************************************************************************/
        this.oArg = {
             oDivDay : this.popDiv_Cal.divDay,
             oldDate : "",
             curChar : "",
             maMonth : new Array(12),
        	 msToday : "",
        	 msDate : "",
        	 mvArgValue : "",
        	 msSundayPosition : "F"

        };

        
        /***********************************************************************************
        * Form Event
        ***********************************************************************************/
        this.form_onload = function (obj,e)
        {
            //폼로드시 공통함수 
        	//Ex.core.onload(obj);
        	this._onloadSetBind();	
        }

        

        /**
         * onload 수행시 데이타셋 바인딩
         * @param {string} 바인딩할 dataset 명
         * @return 
         * @example
         *  obj.setBind("dsbind","date")
         * @memberOf private
         */
        this._onloadSetBind = function()
        {
             
            if(this.hasOwnProperty("_bindds") && this.hasOwnProperty("_bindcol"))
            {
               if(!Eco.isEmpty(this._bindds) && !Eco.isEmpty(this._bindcol))
               {
                 var v_sDs = this._bindds;
                 var v_sColName = this._bindcol;
                 var dsObj = this.parent.all[v_sDs];
                
                 if(this.isValidObject(this.name + "_CALENDAR"))
                 {	
        			this.removeChild(this.name  + "_CALENDAR");
                 } 
            
        		 var v_objNewbindItem = new BindItem;
        		 v_objNewbindItem.init(this.name  + "_CALENDAR","cal_day", "value", v_sDs , v_sColName);
        	   

        		 this.addChild(this.name  + "_CALENDAR", v_objNewbindItem);
        		 v_objNewbindItem.bind();
        		 
        		
        		 this.oArg.curDate = this.cal_day.value;
               }
            }
            
            //필수 체크
            if(!Eco.isEmpty(this.cssclass) && this.cssclass == "essential")
            {
                this.cal_day.set_cssclass(this.cssclass);
                this.btn_cal.set_cssclass("btn_calendar_" + this.cssclass);
            }
        }

        this.fn_CalendarCallBack = function(svcId,varient)
        {
           if(!Eco.isEmpty(varient[0]))
           {

               var find =  this.searchCalParentFunc("_canChange_callback");
                
                if(find)
                {
                     find.call(this,this.name ,varient[0]);
                }
           }

        }

        this.searchCalParentFunc = function()
        {

        	var idx = 1;
        	var parentStr = "";
        	var pThis = "this.parent.";
        	var  i=0;
        	var functionName = arguments[0];
        	var isFind = false;
        	
        	while(idx<5)
        	{
        		
        	   if(Eco.isFunction(eval(pThis + parentStr + functionName)) == true)
        	   {
        		 
        		 
        		  // eval(pThis + parentStr + functionName);
        		   
        		 isFind= true;
        		 break;
        	   }
        	   else
        	   {
        		   
        		  parentStr =  "parent." + parentStr;
        		 idx++;
        	   }
        	  
        	}
          
           if(!isFind)
           {
        	   //Eco.Logger.error({message: "unknown function error !!!" + functionName, elapsed: true});
        	}
           else
        	{
        	
        	
        	   isFind = eval(pThis + parentStr + functionName);
        	   
        	} 
           
        	return isFind;
        }

        
        /*----------------------------------------------------------------------*/
        // Calendar Load
        /*----------------------------------------------------------------------*/
        this.fn_titleSet = function()
        {
         
        	var oDiv = this.popDiv_Cal.divDay;
        	if (this.oArg.msSundayPosition == "L") 
        	{
        		oDiv.stc0.set_text("Mo"); //월
        		oDiv.stc1.set_text("Tu");  //화
        		oDiv.stc2.set_text("We");  //수
        		oDiv.stc3.set_text("Th");  //목
        		oDiv.stc4.set_text("Fr");   //금
        		oDiv.stc5.set_text("Sa");   //토
        		oDiv.stc6.set_text("Su");   //일
        	}
        	else 
        	{
        		oDiv.stc0.set_text("Su");   //일
        		oDiv.stc1.set_text("Mo");   //월
        		oDiv.stc2.set_text("Tu");   //화
        		oDiv.stc3.set_text("We");   //수
        		oDiv.stc4.set_text("Th");  //목
        		oDiv.stc5.set_text("Fr");   //금
        		oDiv.stc6.set_text("Sa");   //토
        	}
        	
        	this.oArg.curDate = this.cal_day.value;
        	this.fn_setDefault();
        	
        }

        /*----------------------------------------------------------------------*/
        //  Calendar Load
        /*----------------------------------------------------------------------*/
        this.fn_SetCalendar = function(strYY,strMM,strDD)
        {

        	if(strDD == null) strDD = "";
        	if(strDD.length == 0) strDD = Ex.util.today().substr(6,2);

        	var bCurMonth = false;

        	if((Ex.util.today().substr(0,4) == strYY) && (Ex.util.today().substr(4,2) == strMM)) {
        		bCurMonth = true;
        	}

        	var oDiv = this.oArg.oDivDay;
        	this.ds_tCalendar.clearData();
            var findRow = this.ds_year.findRow("value",strYY);
        	
        	oDiv.cboMonth.set_index(parseInt(strMM)-1);
        	oDiv.cb_year.set_index(findRow);

        	oDiv.cb_year.set_text(strYY);
        	var totalDay =    strYY + strMM + "01";
        	
        	nLastDay = Eco.date.getLastDayOfMonth(totalDay);
        		
        	var nFDay = this.fn_GetDay(strYY + strMM + "01");
        	
        	if(this.oArg.msSundayPosition == "L") {
        		nFDay = Ex.util.gDecode(nFDay,0,7,nFDay);
        	} else{
        		nFDay++; // 시작일자 요일 
        	}
        	var svnFDay = nFDay;
        	var nLDay = this.fn_GetDay(strYY + strMM + this._Lpad(nLastDay,2, "0"));

        	if(this.oArg.msSundayPosition == "L") {
        		nLDay = Ex.util.gDecode(nLDay,0,7,nLDay);
        	} else{
        		nLDay++;
        	}

        	var nLineCnt = parseInt((31 + (nFDay-1) + (7-nLDay)) / 7);
        	var objDay,objWeek;
        	
        	var nSundayValue = 1;
        	if(this.oArg.msSundayPosition == "L") {
        		nSundayValue = 0;
        	} else {
        		nSundayValue = 1;
        	}
            var objTotlCnt = 42;
        	var strODivNm = "this.popDiv_Cal.divDay";	
        	//------ day 초기화	
        	for(var i=1;i<=objTotlCnt;i++) {	
        	
        	 
        		objDay = eval(strODivNm +".stcD" + i);
        		objDay.setEventHandler("onclick", this.fn_day_onclick, this);
        	    objDay.set_cssclass("");
        	    objDay.set_cssclass("stc_POPCA_Day");

         		objDay.style.set_background("");
         		objDay.style.set_border("0 none #808080");
         		objDay.style.set_color("#666666ff");
         		objDay.set_text("");
        		objDay.set_visible(false);
        	}

        	// dummy 자리
        	for(var i=1;i<nFDay;i++) {
        		objDay = eval(strODivNm + ".stcD" + i);
        		objDay.set_visible(true);
        	}
        	
        	var strSvDate;
        	var nCurLine = 0;

        	for(var i=1;i<=nLastDay;i++) {

        		objDay = eval(strODivNm + ".stcD" + nFDay);
        		objDay.set_text(i);

        		// 오늘
        		if(bCurMonth) {

        			if(parseInt(Ex.util.today().substr(6,2)) == i) {
        			   objDay.set_cssclass("");
        				objDay.set_cssclass("stc_POPCA_toDay");	
        				objDay.style.set_background("#fdeeeeff");
         		        objDay.style.set_border("1 solid #f7c5c5ff");
        			}
        		}
        		
        		//토/일
        		if(this.fn_GetDay(strYY + strMM + this._Lpad(i, 2, "0")) == 0) objDay.style.set_color("#ed2e2eff");
        		else if(this.fn_GetDay(strYY + strMM + this._Lpad(i, 2, "0")) == 6) objDay.style.set_color("#3c67d0ff");
        		
        		//선택일
        		if(parseInt(strDD) == i) {
        		    objDay.set_cssclass("");
        			objDay.set_cssclass("stc_POPCA_selDay");
        			objDay.style.set_background("#5498eaff");
         		    objDay.style.set_border("1 solid #5498eaff");
         		    objDay.style.set_color("#ffffffff");
        		}  

        		objDay.set_visible(true);
        		nFDay++;
        	}
        	
        	// dummy 자리
        	var nDum;
        	if(nFDay <= 29) {
        		nDum = 28;
        	} else if(nFDay <= 36) {
        		nDum = 35;
        	} else {
        		nDum = 42;
        	}
        	for(var i=(nLastDay+1);i<=nDum;i++) {
        		objDay = eval(strODivNm+ ".stcD" + i);
        		objDay.set_visible(true);
        	}
        	
        }

        
        //날짜 클릭 event
        this.fn_day_onclick = function(obj,e)
        {
            
        	var aRtnVal = new Array(2);
        	if(Eco.isEmpty(obj.text)) 
        	{
        		aRtnVal[0] = "";
        		aRtnVal[1] = "";
        	}
        	else
        	{
        	   var oDiv = this.popDiv_Cal.divDay;	   
        	   var strYY = oDiv.cb_year.value;	   
        	    var strYYMMDD = "";

        	  if(!Eco.isStringDate(oDiv.cb_year.value +oDiv.cboMonth.value+ this._Lpad(obj.text,2,"0")))
        	   { 
        	      strYYMMDD = this._Lpad(this.oArg.msDate.toString(), 6) + this._Lpad(obj.text,2,"0");
        	   }
        	   else
        	   {
        	      strYYMMDD = oDiv.cb_year.value +oDiv.cboMonth.value + this._Lpad(obj.text,2,"0");
        	   }
                
        		aRtnVal[0] = strYYMMDD;
        		aRtnVal[1] = "N";
        	
        	}
         if(Eco.isEmpty(aRtnVal[0])) return;
        	this.cal_day.set_value(strYYMMDD);
            this.oArg.msDate = strYYMMDD;
            
           
            
        	this.popDiv_Cal.closePopup(aRtnVal);

        }

         /**
         * 날짜 로 변경 날짜 값 가져오는함수
         * @param {string} 날짜 value
         * @return 
         * @example
         *  this._Lpad(obj.text,2,"0")
         * @memberOf private
         */
        this.fn_GetDay = function(strDate)
        {

            var date = new Date();
             date.setYear(strDate.substr(0, 4));
             date.setMonth(strDate.substr(4, 2) - 1);
             date.setDate(strDate.substr(6, 2));
           
            return date.getDay();
        }

         /**
         * utility 왼쪽문자열에 값 추가
         * @param {string} value값
         * @param {number} 넣을 length 위치
         * @param {string} 넣을 값
         * @return 
         * @example
         *  this._Lpad(obj.text,2,"0")
         * @memberOf private
         */
        this._Lpad = function(sValue,nLength,Char) 
        {
            if(Eco.isUndefined (sValue)) sValue = "";
        	var strRetVal = new String(sValue);
        	var strChar = "";
        	var nIteration = nLength - Eco.string.getLength(strRetVal,"utf8");
        	for (var i = 0; i < nIteration; i++) {
        		strChar = Char + strChar;
        	}
        	return (strChar + strRetVal);
        }

        /**
         *기본 년도 월 셋팅
         * @param 
         * @return 
         * @example
         * @memberOf public
        */
        this.fn_setDefault = function()
        {
            
            var strOldDate = this.oArg.oldDate;
        	var objMonth = this.popDiv_Cal.divDay.cboMonth;
        	var strYear = "";	
        	var nMonth = 0;
        	var strMonth = "";
        	var strDay = "";
        	this.oArg.msDate = Eco.isEmpty(this.cal_day.value) ? "" :this.cal_day.value ;

        	if(!Eco.isEmpty(this.oArg.msDate.toString() ))
        	{
        	  if(!Eco.isStringDate(this.oArg.msDate.toString() )) return;

        	   strYear = this.oArg.msDate.toString().slice(0,4);

        	   nMonth = Math.floor(this.oArg.msDate.toString().slice(4,6),10);
        	   strMonth = this.oArg.msDate.toString().slice(4,6);
        	   strDay =  this.oArg.msDate.toString().slice(6);
        	}
        	else
        	{
        		 strYear = Ex.util.today().slice(0,4);	
        		 nMonth = Math.floor(Ex.util.today().slice(4,6),10);
        		 strMonth = Ex.util.today().slice(4,6);
        		 strDay = Ex.util.today().slice(6);
        	}

        	this.fn_setDsYear(strYear);  //년도 셋팅
        	//일자로드
        	this.fn_SetCalendar(strYear, strMonth, strDay);
        	this.oArg.msDate  = strYear + strMonth +strDay;

        	 
           return true;
        }

        
        /**
         *년도 콤보 셋팅
         * @param {string} 년도값 
         * @return 
         * @example
         * @memberOf public
        */
        this.fn_setDsYear = function(strYear)
        {
         
        	var p = 1;
        	var objYear = this.ds_year;
        	var objComp = this.popDiv_Cal.divDay.cb_year;
        	var objArray = [];
        	    objYear.deleteAll();
        	   objArray[0] = strYear;
        	
        	while(p  < 5)
        	{ 
        	  	objArray[p] = parseInt(strYear)+ p;
        		 p++;

        	}
        	p = 1;
        	while(p <5)
        	{
        	    objArray[p+5] = parseInt(strYear) - p;
        		p++;
        	}
        	

        	objArray.sort();	
        	objYear.set_enableevent(false);
            for(var i  in  objArray)
            {
                var nRow =  objYear.addRow();
        	           objYear.setColumn(nRow,"code",objArray[i]);
                       objYear.setColumn(nRow,"value",objArray[i]);	

            }
            objYear.set_enableevent(true);
        	objComp.updateToDataset();
        	objYear.applyChange();
        	
        }

        
        /************************************************
        *********** 화면에서 사용하는 함수 ***********
        /************************************************/
         /**
         *달력 값 가져오는 함순
         * @param
         * @return {string} 처리할 mask
         * @example
         *  this.div_calednar.getValue()
         * @memberOf Ex.util
        */
        this.get_value = function()
        {
         
           return this.cal_day.value ;
        }

         /**
         *달력 값 설정하는 함수
         * @param {string} 설정할 변수값
         * @return {string} 처리할 mask
         * @example
         *  this.div_calednar.setValue()
         * @memberOf public
        */
        this.set_value = function(value)
        {
           if(Eco.isEmpty(value)) return;
           if(!Eco.isStringDate(value)) Eco.Logger.error({message:"error dateformat string" ,stack:true,elapsed:true});
          
           this.cal_day.set_value(value);
        }

        /**
         * 스크립트로 바인딩 처리시 수행
         * @param {string} 바인딩할 dataset 명
         * @return 
         * @example
         *  obj.setBind("dsbind","date")
         * @memberOf public
         */
        this.setBind = function(v_sDs,v_sColName)
        {
          if(Eco.isEmpty(v_sDs) || Eco.isEmpty(v_sColName)) return;
          
          var v_sDs = v_sDs;
          var v_sColName = v_sColName;

           if(this.isValidObject(this.name  + "_DEFAULTCALENDAR"))
           {	
        	 this.removeChild(this.name  + "_DEFAULTCALENDAR");
           } 
         
        		 var v_objNewbindItem = new BindItem;
        		 v_objNewbindItem.init(this.name  +"_DEFAULTCALENDAR","cal_day", "value", v_sDs , v_sColName);
        	   

        		 this.addChild(this.name  + "_DEFAULTCALENDAR", v_objNewbindItem);
        		 v_objNewbindItem.bind();
        		
        		 this.oArg.curDate = this.cal_day.value;
           
        }

        /**************************************
        *********** event *********************
        /**************************************/
        /**
         *달력 버튼 클릭시 발생되는 event
         * @return 
         * @example
         * @memberOf public
        */
        this.btn_cal_onclick = function(obj,e)
        {

         	this.fn_setDefault(); 

        
         //this.popDiv_Cal.trackPopupByComponent(this,0,nexacro.toNumber(this.height) -240,"fn_CalendarCallBack");

         	 
        //    	var v_nX = system.clientToScreenX(this, 0) - system.clientToScreenX(application.mainframe, 0);
        // 	var nHeight = 918-25;
        // 	trace(" v_nX : " + v_nX);
        // 	trace(">>>1 : "  + system.clientToScreenY(this, this.cal_day.height) - );
        // 	trace(">>>2 : "  + system.clientToScreenY(this, system.clientToScreenY(application.mainframe, 0)));
        // 	
        // 	trace(" >>>3 : "  + nexacro.toNumber(system.clientToScreenY(this, this.btn_cal.getOffsetBottom())) -  nexacro.toNumber(system.clientToScreenY(application.mainframe, 0)));
        // 	trace(" nHeight : " + nHeight);
        // 	if(nexacro.toNumber(system.clientToScreenY(this, this.btn_cal.getOffsetBottom())) -  nexacro.toNumber(system.clientToScreenY(application.mainframe, 0)) > nHeight)
        // 	{
        // 	   v_nY =  nexacro.toNumber(this.height) - 206-25;
        // 	   
        // 	}
        //  	else
        //  	{
        // // 	
          var v_nY = nexacro.toNumber(this.height);	// Top	// Top
        // // 	  trace(" v_nY1 : "  + v_nY);
        //  	}
        // 	trace(" v_nY2 : "  + v_nY);
        //trace(" v_nY : " + v_nY);

        this.popDiv_Cal.trackPopupByComponent(this,0,nexacro.toNumber(this.height),196,208,"fn_CalendarCallBack");
          // var v_sRet = this.popDiv_Cal.trackPopupByComponent(this,0,v_nY,194,206,"fn_CalendarCallBack");
           
           
           
        // 	var v_sRet = this.popDiv_Cal.trackPopup(v_nX,v_nY,null,null,"fn_CalendarCallBack");
        	 
        // // 	var v_nX = system.clientToScreenX(this, 0) - system.clientToScreenX(application.mainframe, 0);
        // // 	var nHeight = 918-25; 
        // 	//var v_nX = system.clientToScreenX(this, 0) - system.clientToScreenX(application.mainframe, 0);
        // 	var v_nX = system.clientToScreenX(this, 0) - system.clientToScreenX(application.mainframe, 0);
        // 	var nHeight = 918-25;
        // 	
        // // 	if(system.clientToScreenY(this, this.cal_day.getOffsetBottom()) - system.clientToScreenY(application.mainframe, 0) > nHeight)
        // // 	{
        // // 	   v_nY = system.clientToScreenY(this, this.cal_day.getOffsetBottom() -207) - system.clientToScreenY(application.mainframe, 0);	// Top
        // // 	}
        // // 	else
        // // 	{
        // // 	  v_nY = system.clientToScreenY(this, this.cal_day.getOffsetBottom()) - system.clientToScreenY(application.mainframe, 0);	// Top	// Top
        // // 	}
        // 
        // //      if(system.clientToScreenY(this, this.cal_day.getOffsetBottom()) - system.clientToScreenY(application.mainframe, 0) > nHeight)
        // // 	{
        // // 	   v_nY = system.clientToScreenY(this, this.cal_day.getOffsetBottom() -207) - system.clientToScreenY(this, 0);	// Top
        // // 	}
        // // 	else
        // // 	{
        // trace(">>>wwww>");
        // 	  v_nY = system.clientToScreenY(this, this.cal_daygetOffsetBottom()) - system.clientToScreenY(this, 0);	// Top	// Top
        // 	//}
        // 	
        // 	var v_sRet = this.popDiv_Cal.trackPopup(v_nX,v_nY,null,null,"fn_CalendarCallBack");
        // 	
        // 	
        // 	
        // // 		if(system.clientToScreenY(this, this.Button00.getOffsetBottom()) - system.clientToScreenY(application.mainframe, 0) > nHeight)
        // // 	{
        // // 	   v_nY = system.clientToScreenY(this, this.Button00.getOffsetBottom() -207) - system.clientToScreenY(this, 0);	// Top
        // // 	}
        // // 	else
        // // 	{
        // // 	  v_nY = system.clientToScreenY(this, this.Button00.getOffsetBottom()) - system.clientToScreenY(this, 0);	// Top	// Top
        // // 	}
        // // 	
        // // 	var v_sRet = this.PopupDiv00.trackPopup(v_nX,v_nY,null,null,"fn_CalendarCallBack");
        }

        
        /**
         *날짜 변경시 변경값 체크
         * @return 
         * @example
         * @memberOf public
        */
        this.cal_day_ontextchanged = function(obj,e)
        {
           
        }

        
        /**
         *팝업 캘린더 오늘날짜 버튼 클릭시 발생되는 event
         * @return 
         * @example
         * @memberOf public
        */
        this.popDiv_Cal_divDay_btn_today_onclick = function(obj,e)
        {
        	 var strYear = Ex.util.today().slice(0,4);			
        	 var strMonth = Ex.util.today().slice(4,6);
        	var strDay = Ex.util.today().slice(6);

            this.fn_SetCalendar(strYear,strMonth,strDay);
        }

        /**
         *팝업 캘린더 next 버튼 클릭시 event
         * @return 
         * @example
         * @memberOf public
        */
        this.btnNextMon_onclick = function(obj,e)
        {
        	var oDiv = this.oArg.oDivDay;
        	var strYY = oDiv.cb_year.text;
        	var nM = Ex.util.gDecode(oDiv.cboMonth.index,11,1,oDiv.cboMonth.index+2);
        	if(nM==1) {
        		oDiv.cb_year.set_text((parseInt(strYY) + 1).toString());
        		strYY = oDiv.cb_year.text;
        	}
        	var strMM = this._Lpad(nM,2,"0");
            var strDD = "1";
        	this.oArg.msDate = strYY + strMM + this.oArg.msDate.substr(6,2);

           //년도 필터 재설정
        	this.fn_setDsYear(strYY);
        	this.fn_SetCalendar(strYY,strMM,strDD);
        	
        }

        /**
         *팝업 캘린더 perev 버튼 클릭시 event
         * @return 
         * @example
         * @memberOf public
        */
        this.btnPreYear_onclick = function(obj,e)
        {	
        	var oDiv = this.oArg.oDivDay;
        	var strYY = oDiv.cb_year.text;
        	var nM = Ex.util.gDecode(oDiv.cboMonth.index,0,12,oDiv.cboMonth.index);
        	
        	if(nM==12) {
        		oDiv.cb_year.set_value( (parseInt(strYY) - 1).toString())
        		strYY = oDiv.cb_year.value;
        	}

        	var strMM = this._Lpad(nM,2,"0");
        	var strDD = "1";
        	this.oArg.msDate = strYY + strMM + this.oArg.msDate.toString().substr(6,2);
        	this.fn_setDsYear(strYY);
        	this.fn_SetCalendar(strYY,strMM,strDD);
        }

        
        //월 변경
        this.popDiv_Cal_divDay_cboMonth_onitemchanged = function(obj,e)
        {
            var strYY = this.popDiv_Cal.divDay.cb_year.text;
            var strMM = e.postvalue ;
           
            var strDD = "01";

            this.fn_SetCalendar(strYY,strMM,strDD);
        }

        //년도 변경
        this.popDiv_Cal_divDay_cb_year_onitemchanged = function(obj,e)
        {
        	var strYY = e.posttext;
            var strMM = this.popDiv_Cal.divDay.cboMonth.value ;
            var strDD = "01";

            this.fn_SetCalendar(strYY,strMM,strDD);
            this.oArg.msDate  = strYY + strMM +strDD;

        }

        this.extCalendar_onkeyup = function(obj,e)
        {
        	if (e.keycode == 13)
        	{
        		this.parent.parent.fn_onkeyup(obj, e);
        	}
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onkeyup", this.extCalendar_onkeyup, this);
            this.cal_day.addEventHandler("ontextchanged", this.cal_day_ontextchanged, this);
            this.popDiv_Cal.divDay.Static00.addEventHandler("onclick", this.btnPreMon_onclick, this);
            this.popDiv_Cal.divDay.btnNextMon.addEventHandler("onclick", this.btnNextMon_onclick, this);
            this.popDiv_Cal.divDay.btnPreMon.addEventHandler("onclick", this.btnPreYear_onclick, this);
            this.popDiv_Cal.divDay.btn_today.addEventHandler("onclick", this.popDiv_Cal_divDay_btn_today_onclick, this);
            this.popDiv_Cal.divDay.cboMonth.addEventHandler("onitemchanged", this.popDiv_Cal_divDay_cboMonth_onitemchanged, this);
            this.popDiv_Cal.divDay.cb_year.addEventHandler("onitemchanged", this.popDiv_Cal_divDay_cb_year_onitemchanged, this);
            this.btn_cal.addEventHandler("onclick", this.btn_cal_onclick, this);

        };

        this.loadIncludeScript("ExtCalednar.xfdl");

       
    };
}
)();

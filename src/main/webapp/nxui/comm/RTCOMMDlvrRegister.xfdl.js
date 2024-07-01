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
                this.set_name("RTCOMMDlvrRegister");
                this.set_classname("RTCSDlvrRegister");
                this.set_titletext("출고등록");
                this._setFormPosition(0,0,975,536);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_rtcs0203", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"strgSeq\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custTelNo\" type=\"STRING\" size=\"256\"/><Column id=\"custMobNo\" type=\"STRING\" size=\"256\"/><Column id=\"carKind\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"srrgDay\" type=\"STRING\" size=\"256\"/><Column id=\"strgYn\" type=\"STRING\" size=\"256\"/><Column id=\"strgStat\" type=\"STRING\" size=\"256\"/><Column id=\"strgStatNm\" type=\"STRING\" size=\"256\"/><Column id=\"srsvYn\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"agencyNm\" type=\"STRING\" size=\"256\"/><Column id=\"agencyMobNo\" type=\"STRING\" size=\"256\"/><Column id=\"warehCd\" type=\"STRING\" size=\"256\"/><Column id=\"warehNm\" type=\"STRING\" size=\"256\"/><Column id=\"addr\" type=\"STRING\" size=\"256\"/><Column id=\"strgDay\" type=\"STRING\" size=\"256\"/><Column id=\"strgDt\" type=\"STRING\" size=\"256\"/><Column id=\"strgMthd\" type=\"STRING\" size=\"256\"/><Column id=\"strgMthdNm\" type=\"STRING\" size=\"256\"/><Column id=\"strgFilePath\" type=\"STRING\" size=\"256\"/><Column id=\"strgFileName\" type=\"STRING\" size=\"256\"/><Column id=\"strgUserId\" type=\"STRING\" size=\"256\"/><Column id=\"strgUserNm\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrDt\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrFilePath\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrFileName\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrUserId\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrUserNm\" type=\"STRING\" size=\"256\"/><Column id=\"mfCd\" type=\"STRING\" size=\"256\"/><Column id=\"mfNm\" type=\"STRING\" size=\"256\"/><Column id=\"patternCd\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"tireCnt\" type=\"STRING\" size=\"256\"/><Column id=\"mfCdF\" type=\"STRING\" size=\"256\"/><Column id=\"mfNmF\" type=\"STRING\" size=\"256\"/><Column id=\"patternCdF\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidthF\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatioF\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInchesF\" type=\"STRING\" size=\"256\"/><Column id=\"plyRatingF\" type=\"STRING\" size=\"256\"/><Column id=\"tireCntF\" type=\"STRING\" size=\"256\"/><Column id=\"mfCdR\" type=\"STRING\" size=\"256\"/><Column id=\"mfNmR\" type=\"STRING\" size=\"256\"/><Column id=\"patternCdR\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidthR\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatioR\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInchesR\" type=\"STRING\" size=\"256\"/><Column id=\"plyRatingR\" type=\"STRING\" size=\"256\"/><Column id=\"tireCntR\" type=\"STRING\" size=\"256\"/><Column id=\"totTireCnt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgNm\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_keepHistory_1", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"mfNm\" type=\"STRING\" size=\"256\"/><Column id=\"patternCd\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidth\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatio\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInches\" type=\"STRING\" size=\"256\"/><Column id=\"plyRating\" type=\"STRING\" size=\"256\"/><Column id=\"tireCnt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_keepHistory_2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"check\" type=\"STRING\" size=\"256\"/><Column id=\"mfNmF\" type=\"STRING\" size=\"256\"/><Column id=\"patternCdF\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidthF\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatioF\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInchesF\" type=\"STRING\" size=\"256\"/><Column id=\"plyRatingF\" type=\"STRING\" size=\"256\"/><Column id=\"tireCntF\" type=\"STRING\" size=\"256\"/><Column id=\"mfNmR\" type=\"STRING\" size=\"256\"/><Column id=\"patternCdR\" type=\"STRING\" size=\"256\"/><Column id=\"selectionWidthR\" type=\"STRING\" size=\"256\"/><Column id=\"aspectRatioR\" type=\"STRING\" size=\"256\"/><Column id=\"wheelInchesR\" type=\"STRING\" size=\"256\"/><Column id=\"plyRatingR\" type=\"STRING\" size=\"256\"/><Column id=\"tireCntR\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYn", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static03", "absolute", "15", "10", "169", "20", null, null, this);
            obj.set_taborder("0");
            obj.set_text("계약자정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_rtcs0203_1", "absolute", "15", "247", "945", "63", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_keepHistory_1");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"구분\"/><Cell col=\"1\" text=\"제조사\"/><Cell col=\"2\" text=\"패턴\"/><Cell col=\"3\" text=\"폭\"/><Cell col=\"4\" text=\"시리즈\"/><Cell col=\"5\" text=\"인치\"/><Cell col=\"6\" text=\"PR\"/><Cell col=\"7\" text=\"수량\"/></Band><Band id=\"body\"><Cell text=\"앞/뒷바퀴\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:mfNm\" editdisplay=\"display\" calendardisplay=\"edit\"/><Cell col=\"2\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:patternCd\" editdisplay=\"display\" calendardisplay=\"edit\"/><Cell col=\"3\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:selectionWidth\" editdisplay=\"display\" calendardisplay=\"edit\"/><Cell col=\"4\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:aspectRatio\" editdisplay=\"display\" calendardisplay=\"edit\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:wheelInches\" editdisplay=\"display\" calendardisplay=\"edit\"/><Cell col=\"6\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:plyRating\" editdisplay=\"display\" calendardisplay=\"edit\"/><Cell col=\"7\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:tireCnt\" editdisplay=\"display\" calendardisplay=\"edit\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "30", "975", "10", null, null, this);
            obj.set_taborder("2");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "15", "40", "945", "30", null, null, this);
            obj.set_taborder("3");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_ordNo", "absolute", "15", "40", "120", "31", null, null, this);
            obj.set_taborder("4");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_carKind", "absolute", "330", "40", "120", "31", null, null, this);
            obj.set_taborder("5");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_telNo", "absolute", "646", "40", "120", "31", null, null, this);
            obj.set_taborder("6");
            obj.set_text("자택전화");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "15", "69", "945", "30", null, null, this);
            obj.set_taborder("7");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_cust", "absolute", "15", "69", "120", "30", null, null, this);
            obj.set_taborder("8");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_carNo", "absolute", "330", "69", "120", "30", null, null, this);
            obj.set_taborder("9");
            obj.set_text("차량번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_mobNo", "absolute", "646", "69", "120", "30", null, null, this);
            obj.set_taborder("10");
            obj.set_text("핸드폰");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "101", "975", "20", null, null, this);
            obj.set_taborder("11");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "15", "117", "169", "20", null, null, this);
            obj.set_taborder("12");
            obj.set_text("보관서비스 제공자 정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "132", "975", "10", null, null, this);
            obj.set_taborder("13");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "15", "142", "945", "31", null, null, this);
            obj.set_taborder("14");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_buslNo01", "absolute", "15", "142", "120", "31", null, null, this);
            obj.set_taborder("15");
            obj.set_text("렌탈전문점");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm01", "absolute", "330", "142", "120", "31", null, null, this);
            obj.set_taborder("16");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_agencyMobNo", "absolute", "454", "147", "187", "20", null, null, this);
            obj.set_taborder("17");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_genderNm01", "absolute", "646", "142", "120", "31", null, null, this);
            obj.set_taborder("18");
            obj.set_text("보관번호");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "15", "172", "945", "31", null, null, this);
            obj.set_taborder("19");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_buslNo02", "absolute", "15", "172", "120", "31", null, null, this);
            obj.set_taborder("20");
            obj.set_text("보관지명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNm02", "absolute", "330", "172", "120", "31", null, null, this);
            obj.set_taborder("21");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_addr", "absolute", "454", "177", "500", "20", null, null, this);
            obj.set_taborder("22");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "0", "203", "975", "20", null, null, this);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "15", "222", "300", "20", null, null, this);
            obj.set_taborder("24");
            obj.set_text("보관내역 (앞/뒤 바퀴가 같은 경우)");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "15", "237", "945", "10", null, null, this);
            obj.set_taborder("25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "0", "310", "975", "20", null, null, this);
            obj.set_taborder("26");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "15", "326", "300", "20", null, null, this);
            obj.set_taborder("27");
            obj.set_text("보관내역 (앞/뒤 바퀴가 다른 경우)");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "15", "341", "945", "10", null, null, this);
            obj.set_taborder("28");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_rtcs0203_2", "absolute", "15", "351", "945", "93", null, null, this);
            obj.set_taborder("29");
            obj.set_binddataset("ds_keepHistory_2");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"구분\"/><Cell col=\"1\" text=\"제조사\"/><Cell col=\"2\" text=\"패턴\"/><Cell col=\"3\" text=\"폭\"/><Cell col=\"4\" text=\"시리즈\"/><Cell col=\"5\" text=\"인치\"/><Cell col=\"6\" text=\"PR\"/><Cell col=\"7\" text=\"수량\"/></Band><Band id=\"body\"><Cell text=\"앞바퀴\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:mfNmF\" editdisplay=\"display\"/><Cell col=\"2\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:patternCdF\" editdisplay=\"display\"/><Cell col=\"3\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:selectionWidthF\" editdisplay=\"display\"/><Cell col=\"4\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:aspectRatioF\" editdisplay=\"display\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:wheelInchesF\" editdisplay=\"display\"/><Cell col=\"6\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:plyRatingF\" editdisplay=\"display\"/><Cell col=\"7\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:tireCntF\" editdisplay=\"display\"/><Cell row=\"1\" text=\"뒷바퀴\"/><Cell row=\"1\" col=\"1\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:mfNmR\" editdisplay=\"display\"/><Cell row=\"1\" col=\"2\" displaytype=\"normal\" edittype=\"readonly\" text=\"bind:patternCdR\" editdisplay=\"display\"/><Cell row=\"1\" col=\"3\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:selectionWidthR\" editdisplay=\"display\"/><Cell row=\"1\" col=\"4\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:aspectRatioR\" editdisplay=\"display\"/><Cell row=\"1\" col=\"5\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:wheelInchesR\" editdisplay=\"display\"/><Cell row=\"1\" col=\"6\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:plyRatingR\" editdisplay=\"display\"/><Cell row=\"1\" col=\"7\" displaytype=\"normal\" edittype=\"readonly\" style=\"align:center;\" text=\"bind:tireCntR\" editdisplay=\"display\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "15", "454", "945", "31", null, null, this);
            obj.set_taborder("30");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_buslNo03", "absolute", "15", "454", "150", "31", null, null, this);
            obj.set_taborder("31");
            obj.set_text("출고일자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordNo", "absolute", "139", "44", "187", "21", null, null, this);
            obj.set_taborder("32");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carNo", "absolute", "454", "74", "187", "21", null, null, this);
            obj.set_taborder("36");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carKind", "absolute", "454", "45", "187", "21", null, null, this);
            obj.set_taborder("37");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custTelNo", "absolute", "771", "45", "183", "21", null, null, this);
            obj.set_taborder("38");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custMobNo", "absolute", "771", "74", "183", "21", null, null, this);
            obj.set_taborder("39");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_agencyNm", "absolute", "139", "147", "187", "21", null, null, this);
            obj.set_taborder("42");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_dlvrDay", "absolute", "170", "459", "100", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("44");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Static("Static00", "absolute", "0", "0", "15", "536", null, null, this);
            obj.set_taborder("45");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "960", "0", "15", "536", null, null, this);
            obj.set_taborder("46");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "0", "0", "975", "10", null, null, this);
            obj.set_taborder("47");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "0", "485", "975", "10", null, null, this);
            obj.set_taborder("48");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_save", "absolute", "870", "495", "41", "21", null, null, this);
            obj.set_taborder("49");
            obj.set_text("저장");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "919", "495", "41", "21", null, null, this);
            obj.set_taborder("50");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "516", "975", "20", null, null, this);
            obj.set_taborder("51");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "910", "484", "10", "52", null, null, this);
            obj.set_taborder("52");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "0", "444", "975", "10", null, null, this);
            obj.set_taborder("54");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_strgSeq", "absolute", "771", "147", "183", "20", null, null, this);
            obj.set_taborder("57");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_custNm", "absolute", "139", "74", "187", "21", null, null, this);
            obj.set_taborder("58");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_warehNm", "absolute", "139", "177", "187", "21", null, null, this);
            obj.set_taborder("59");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_genderNm00", "absolute", "487", "454", "150", "31", null, null, this);
            obj.set_taborder("60");
            obj.set_text("서비스적용여부");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_srsvYn", "absolute", "641", "459", "120", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("61");
            obj.set_autoselect("true");
            obj.set_innerdataset("ds_useYn");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 975, 536, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSDlvrRegister");
            		p.set_titletext("출고등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","ed_ordNo","value","ds_rtcs0203","ordNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_carKind","value","ds_rtcs0203","carKind");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_custTelNo","value","ds_rtcs0203","custTelNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_custNm","value","ds_rtcs0203","custNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_carNo","value","ds_rtcs0203","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_custMobNo","value","ds_rtcs0203","custMobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_agencyNm","value","ds_rtcs0203","agencyNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_agencyMobNo","value","ds_rtcs0203","agencyMobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","ed_strgSeq","value","ds_rtcs0203","strgSeq");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","ed_warehNm","value","ds_rtcs0203","warehNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","ed_addr","value","ds_rtcs0203","addr");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","cal_dlvrDay","value","ds_rtcs0203","dlvrDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","cb_srsvYn","value","ds_rtcs0203","srsvYn");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMDlvrRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMDlvrRegister.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs"; 
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 	 = "RTCOMMDlvrRegister";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.toDay 	 = ""; 				//현재날짜
        this.grid_1_AddFlag = false;	//보관내역(앞/뒤 바퀴가 같은 경우) 체크해제시 false
        this.grid_2_AddFlag = false;	//보관내역(앞/뒤 바퀴가 다른 경우) 체크해제시 false
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "initRTCOMMStrgRegister" ){
        		var useYnCt = this.ds_useYn.getRowCount();
        		if( useYnCt > 0 ){
        			this.cb_srsvYn.set_value( "Y" );
        		}
        	}
        	
        	if( strSvcId == "getToday" ){
        		if( nvl(this.toDay) != "" ){
        			this.cal_dlvrDay.set_value(this.toDay);
        		}
        	}
        	
        	if( strSvcId == "saveRtcs0203WinterOut" ){
        		alert(strErrorMsg);
        		if( nErrorCode == "0" ){
        			var pos = this.ds_rtcs0203.rowposition;
        			var ordNo 		= nvl(this.ds_rtcs0203.getColumn(pos, "ordNo"));
        			var agencyCd 	= nvl(this.ds_rtcs0203.getColumn(pos, "agencyCd"));
        			var agencyNm	= nvl(this.ed_agencyNm.value);
        			var dlvrDay 	= nvl(this.ds_rtcs0203.getColumn(pos, "dlvrDay"));
        			var custNo 		= nvl(this.ds_rtcs0203.getColumn(pos, "custNo"));
        			var custNm		= nvl(this.ed_custNm.value);
        			var warehCd 	= nvl(this.ds_rtcs0203.getColumn(pos, "warehCd"));
        			var warehNm		= nvl(this.ds_rtcs0203.getColumn(pos, "warehNm"));
        			var carNo		= nvl(this.ed_carNo.value);
        			var strgStat 	= "D";
        			var strgMthd 	= nvl(this.ds_rtcs0203.getColumn(pos, "strgMthd"));
        			this.close( this.opener.FNdlvrSave(ordNo, agencyCd, agencyNm, dlvrDay, custNo, custNm, warehCd, warehNm, carNo, strgStat, strgMthd) );
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMDlvrRegister_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        }
        this.fn_init = function(){
        	if( this.parent.p_arg != "" ){
        		this.ds_rtcs0203.clearData();
        		var nRowCnt = this.ds_rtcs0203.copyData( this.parent.p_arg );
        		if( nRowCnt != 0){
        			this.FN_inDataRtcs0203();
        		}else{
        			alert("데이터를 가져오지 못하였습니다.");
        			this.close();
        		}
        	}else{
        		alert("데이터를 가져오지 못하였습니다.");
        		this.close();
        	}
        	
        	var sSvcID      	= "getToday";  
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	
        	var sSvcID      	= "initRTCOMMDlvrRegister";  
        	var sController   	= "rtms/cs/initRTCOMMDlvrRegister.do";
        	var sInDatasets   	= "";
        	var sOutDatasets	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_useYn=mapDsUseYn ";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        this.FN_inDataRtcs0203 = function(){
        	var pos = this.ds_rtcs0203.rowposition;
        	
        	var custTelNo 			= nvl( this.ds_rtcs0203.getColumn( pos, "custTelNo") );
        	var custMobNo 			= nvl( this.ds_rtcs0203.getColumn( pos, "custMobNo") );
        	var agencyMobNo 		= nvl( this.ds_rtcs0203.getColumn( pos, "agencyMobNo") );
        	
        	if( custTelNo != "" ){   this.ds_rtcs0203.setColumn(pos, "custTelNo", FN_numberHyphenInReturn(custTelNo))		}
        	if( custMobNo != "" ){   this.ds_rtcs0203.setColumn(pos, "custMobNo", FN_numberHyphenInReturn(custMobNo))		}
        	if( agencyMobNo != "" ){ this.ds_rtcs0203.setColumn(pos, "agencyMobNo", FN_numberHyphenInReturn(agencyMobNo))	}
        	
        	var mfNm 			= nvl( this.ds_rtcs0203.getColumn( pos, "mfNm") );
        	var patternCd 		= nvl( this.ds_rtcs0203.getColumn( pos, "patternCd") );
        	var selectionWidth 	= nvl( this.ds_rtcs0203.getColumn( pos, "selectionWidth") );
        	var aspectRatio 	= nvl( this.ds_rtcs0203.getColumn( pos, "aspectRatio") );
        	var wheelInches 	= nvl( this.ds_rtcs0203.getColumn( pos, "wheelInches") );
        	var plyRating 		= nvl( this.ds_rtcs0203.getColumn( pos, "plyRating") );
        	var tireCnt			= nvl( this.ds_rtcs0203.getColumn( pos, "tireCnt") );
        	if( (mfNm!="") && (patternCd!="") && (selectionWidth!="") && (aspectRatio!="") && (wheelInches!="") && (plyRating!="") && (tireCnt!="") ){
        		this.ds_keepHistory_1.clearData();
        		var pos_1 = this.ds_keepHistory_1.addRow();
        		this.ds_keepHistory_1.setColumn(pos_1, "mfNm", 			 mfNm);
        		this.ds_keepHistory_1.setColumn(pos_1, "patternCd", 	 patternCd);
        		this.ds_keepHistory_1.setColumn(pos_1, "selectionWidth", selectionWidth);
        		this.ds_keepHistory_1.setColumn(pos_1, "aspectRatio", 	 aspectRatio);
        		this.ds_keepHistory_1.setColumn(pos_1, "wheelInches", 	 wheelInches);
        		this.ds_keepHistory_1.setColumn(pos_1, "plyRating", 	 plyRating);
        		this.ds_keepHistory_1.setColumn(pos_1, "tireCnt", 		 tireCnt);
        		this.grid_1_AddFlag = true;
        	}else{
        		this.grid_1_AddFlag = false;
        	}
        	
        	var mfNmF 				= nvl( this.ds_rtcs0203.getColumn( pos, "mfNmF") );
        	var patternCdF 			= nvl( this.ds_rtcs0203.getColumn( pos, "patternCdF") );
        	var selectionWidthF 	= nvl( this.ds_rtcs0203.getColumn( pos, "selectionWidthF") );
        	var aspectRatioF 		= nvl( this.ds_rtcs0203.getColumn( pos, "aspectRatioF") );
        	var wheelInchesF 		= nvl( this.ds_rtcs0203.getColumn( pos, "wheelInchesF") );
        	var plyRatingF 			= nvl( this.ds_rtcs0203.getColumn( pos, "plyRatingF") );
        	var tireCntF 			= nvl( this.ds_rtcs0203.getColumn( pos, "tireCntF") );
        	var mfNmR 				= nvl( this.ds_rtcs0203.getColumn( pos, "mfNmR") );
        	var patternCdR 			= nvl( this.ds_rtcs0203.getColumn( pos, "patternCdR") );
        	var selectionWidthR 	= nvl( this.ds_rtcs0203.getColumn( pos, "selectionWidthR") );
        	var aspectRatioR 		= nvl( this.ds_rtcs0203.getColumn( pos, "aspectRatioR") );
        	var wheelInchesR 		= nvl( this.ds_rtcs0203.getColumn( pos, "wheelInchesR") );
        	var plyRatingR 			= nvl( this.ds_rtcs0203.getColumn( pos, "plyRatingR") );
        	var tireCntR 			= nvl( this.ds_rtcs0203.getColumn( pos, "tireCntR") );
        	if( ( (mfNmF!="") && (patternCdF!="") && (selectionWidthF!="") && (aspectRatioF!="") && (wheelInchesF!="") && (plyRatingF!="") && (tireCntF!="") )
        		||
        	    ( (mfNmR!="") && (patternCdR!="") && (selectionWidthR!="") && (aspectRatioR!="") && (wheelInchesR!="") && (plyRatingR!="") && (tireCntR!="") )
        	){
        		this.ds_keepHistory_2.clearData();
        		var pos_2 = this.ds_keepHistory_2.addRow();
        		this.ds_keepHistory_2.setColumn(pos_2, "mfNmF", 			mfNmF);
        		this.ds_keepHistory_2.setColumn(pos_2, "patternCdF", 		patternCdF);
        		this.ds_keepHistory_2.setColumn(pos_2, "selectionWidthF", 	selectionWidthF);
        		this.ds_keepHistory_2.setColumn(pos_2, "aspectRatioF", 		aspectRatioF);
        		this.ds_keepHistory_2.setColumn(pos_2, "wheelInchesF", 		wheelInchesF);
        		this.ds_keepHistory_2.setColumn(pos_2, "plyRatingF", 		plyRatingF);
        		this.ds_keepHistory_2.setColumn(pos_2, "tireCntF", 			tireCntF);
        		this.ds_keepHistory_2.setColumn(pos_2, "mfNmR", 			mfNmR);
        		this.ds_keepHistory_2.setColumn(pos_2, "patternCdR", 		patternCdR);
        		this.ds_keepHistory_2.setColumn(pos_2, "selectionWidthR", 	selectionWidthR);
        		this.ds_keepHistory_2.setColumn(pos_2, "aspectRatioR", 		aspectRatioR);
        		this.ds_keepHistory_2.setColumn(pos_2, "wheelInchesR", 		wheelInchesR);
        		this.ds_keepHistory_2.setColumn(pos_2, "plyRatingR", 		plyRatingR);
        		this.ds_keepHistory_2.setColumn(pos_2, "tireCntR", 			tireCntR);
        		this.grid_2_AddFlag = true;
        	}else{
        		this.grid_2_AddFlag = false;
        	}
        	
        	if( ((this.grid_1_AddFlag == true) && (this.grid_2_AddFlag == true)) || ((this.grid_1_AddFlag == false) && (this.grid_2_AddFlag == false))){
        		alert("보관내역을 다시 확인하세요.");
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMStrgRegister_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.cal_dlvrDay_onchanged = function(obj,e){
        	var strgDay = this.ds_rtcs0203.getColumn(this.ds_rtcs0203.rowposition, "strgDay");
        	var thisValue =  obj.value;
        	//var toDay     =  this.toDay;
        	var lastDay   =  this.toDay.substr(0,4)+this.toDay.substr(4,2)+Eco.date.getLastDayOfMonth(this.toDay);
        	if( (strgDay > thisValue) || (thisValue > lastDay) ){
        		alert("출고일자는 "+strgDay.substr(0,4)+"-"+strgDay.substr(4,2)+"-"+strgDay.substr(6,2)+" ~ "+lastDay.substr(0,4)+"-"+lastDay.substr(4,2)+"-"+lastDay.substr(6,2)+" 선택가능합니다.");
        		obj.set_value(this.toDay);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_save_onclick = function(obj,e){
        	var pos = this.ds_rtcs0203.rowposition;
        	if( pos != -1 ){
        		var ordNo 		 = nvl(this.ds_rtcs0203.getColumn( pos, "ordNo" ));
        		var strgSeq 	 = nvl(this.ds_rtcs0203.getColumn( pos, "strgSeq" ));
        		var dlvrDay 	 = nvl(this.ds_rtcs0203.getColumn( pos, "dlvrDay" ));
        		var srsvYn 		 = nvl(this.ds_rtcs0203.getColumn( pos, "srsvYn" ));
        		var dlvrFilePath = nvl(this.ds_rtcs0203.getColumn( pos, "dlvrFilePath" ));
        		var dlvrFileName = nvl(this.ds_rtcs0203.getColumn( pos, "dlvrFileName" ));
        		var msg			 = " 값이 없습니다.";
        		
        		if( ordNo == "" ){ 		alert("계약번호" + msg); 				return false; }
        		if( strgSeq == "" ){ 	alert("보관순번" + msg); 				return false; }
        		if( dlvrDay == "" ){ 	alert("출고일자" + msg); 				return false; }
        		if( srsvYn == "" ){ 	alert("보관서비스적용여부" + msg); 	return false; }
        		
        		var sSvcID        	= "saveRtcs0203WinterOut";                    
        		var sController   	= "rtms/cs/saveRtcs0203WinterOut.do";
        		var sInDatasets   	= " input=ds_rtcs0203:U ";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}else{
        		alert("출고 등록할 정보가 없습니다.");
        		return false;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMDlvrRegister_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCOMMDlvrRegister_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMDlvrRegister_onkeyup, this);
            this.cal_dlvrDay.addEventHandler("onchanged", this.cal_dlvrDay_onchanged, this);
            this.btn_save.addEventHandler("onclick", this.btn_save_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMDlvrRegister.xfdl");

       
    };
}
)();

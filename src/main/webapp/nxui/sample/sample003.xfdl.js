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
                this.set_name("sample003");
                this.set_classname("");
                this.set_titletext("validation샘플");
                this._setFormPosition(0,0,1150,827);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/><Column id=\"Column3\" type=\"STRING\" size=\"256\"/><Column id=\"Column4\" type=\"STRING\" size=\"256\"/><Column id=\"Column5\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row/><Row/><Row/><Row/></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("static01", "absolute", "26", "40", "396", "573", null, null, this);
            obj.set_taborder("68");
            obj.style.set_background("aliceblue");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit04", "absolute", "116", "195", "149", "20", null, null, this);
            obj.set_taborder("45");
            obj.getSetter("_check").set("MAX_LENGTH_UTF8:5");
            obj.getSetter("_msg").set("edit");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit00", "absolute", "116", "56", "149", "20", null, null, this);
            obj.set_taborder("83");
            obj.getSetter("_check").set("MAX:5");
            obj.getSetter("_msg").set("Edit00");
            this.addChild(obj.name, obj);

            obj = new Button("btnGridVali", "absolute", "318", "627", "79", "19", null, null, this);
            obj.set_taborder("2");
            obj.set_text("그리드 체크");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", "240", "625", "71", "22", null, null, this);
            obj.set_taborder("3");
            obj.set_text("행추가");
            this.addChild(obj.name, obj);

            obj = new Static("Static41", "absolute", "284", "576", "90", "20", null, null, this);
            obj.set_taborder("7");
            obj.set_text("NUM|ZERO");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea06", "absolute", "118", "576", "150", "20", null, null, this);
            obj.set_taborder("8");
            obj.getSetter("_check").set("NUM|ZERO");
            obj.getSetter("_msg").set("TextArea06");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);

            obj = new Static("Static40", "absolute", "18", "576", "90", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_text("textarea :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static39", "absolute", "284", "546", "90", "20", null, null, this);
            obj.set_taborder("10");
            obj.set_text("NUM|ZERO");
            this.addChild(obj.name, obj);

            obj = new Static("Static38", "absolute", "18", "546", "90", "20", null, null, this);
            obj.set_taborder("11");
            obj.set_text("maskedit :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("MaskEdit06", "absolute", "118", "546", "150", "20", null, null, this);
            obj.set_taborder("12");
            obj.set_type("string");
            obj.set_mask("#####");
            obj.getSetter("_check").set("NUM|ZERO");
            obj.getSetter("_msg").set("MaskEidt06");
            this.addChild(obj.name, obj);

            obj = new Static("Static37", "absolute", "284", "516", "90", "20", null, null, this);
            obj.set_taborder("13");
            obj.set_text("NUM|ZERO");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit06", "absolute", "118", "516", "149", "20", null, null, this);
            obj.set_taborder("14");
            obj.getSetter("_check").set("NUM|ZERO");
            obj.getSetter("_msg").set("Edit02");
            this.addChild(obj.name, obj);

            obj = new Static("Static36", "absolute", "18", "516", "90", "20", null, null, this);
            obj.set_taborder("15");
            obj.set_text("edit :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "18", "492", "90", "20", null, null, this);
            obj.set_taborder("16");
            obj.set_text("textarea :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea03", "absolute", "118", "492", "150", "20", null, null, this);
            obj.set_taborder("17");
            obj.getSetter("_check").set("MIN_LENGTH:3|MAX_LENGTH:5");
            obj.getSetter("_msg").set("TextArea03");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("MaskEdit03", "absolute", "118", "462", "150", "20", null, null, this);
            obj.set_taborder("18");
            obj.set_type("string");
            obj.set_mask("#####");
            obj.getSetter("_check").set("MIN_LENGTH_UTF8:3|MAX_LENGTH_UTF8:5");
            obj.getSetter("_msg").set("MaskEdit03");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "18", "462", "90", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_text("maskedit :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "18", "435", "90", "20", null, null, this);
            obj.set_taborder("20");
            obj.set_text("edit :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit03", "absolute", "118", "435", "149", "20", null, null, this);
            obj.set_taborder("21");
            obj.getSetter("_check").set("MIN_LENGTH_UTF8:3|MAX_LENGTH_UTF8:5");
            obj.getSetter("_msg").set("Edit03");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "272", "463", "312", "33", null, null, this);
            obj.set_taborder("22");
            obj.set_text("MIN_LENGTH_UTF8:3\r\n|MAX_LENGTH_UTF8:5");
            this.addChild(obj.name, obj);

            obj = new Static("Static19", "absolute", "18", "411", "90", "20", null, null, this);
            obj.set_taborder("23");
            obj.set_text("textarea :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea02", "absolute", "118", "411", "150", "20", null, null, this);
            obj.set_taborder("24");
            obj.getSetter("_check").set("NUM");
            obj.getSetter("_msg").set("textArea02");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);

            obj = new Static("Static18", "absolute", "284", "411", "40", "20", null, null, this);
            obj.set_taborder("25");
            obj.set_text("NUM");
            this.addChild(obj.name, obj);

            obj = new Static("Static16", "absolute", "284", "381", "40", "20", null, null, this);
            obj.set_taborder("26");
            obj.set_text("NUM");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "18", "381", "90", "20", null, null, this);
            obj.set_taborder("27");
            obj.set_text("maskedit :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("MaskEdit02", "absolute", "118", "381", "150", "20", null, null, this);
            obj.set_taborder("28");
            obj.set_type("string");
            obj.set_mask("#####");
            obj.getSetter("_check").set("NUM");
            obj.getSetter("_msg").set("MaskEdit02");
            this.addChild(obj.name, obj);

            obj = new Static("Static35", "absolute", "16", "323", "90", "20", null, null, this);
            obj.set_taborder("29");
            obj.set_text("textarea :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "16", "293", "90", "20", null, null, this);
            obj.set_taborder("30");
            obj.set_text("maskedit :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static33", "absolute", "16", "271", "90", "20", null, null, this);
            obj.set_taborder("31");
            obj.set_text("edit :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit05", "absolute", "116", "271", "149", "20", null, null, this);
            obj.set_taborder("32");
            obj.getSetter("_check").set("MIN_LENGTH_UTF8:3");
            obj.getSetter("_msg").set("edit");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("MaskEdit05", "absolute", "116", "293", "150", "20", null, null, this);
            obj.set_taborder("33");
            obj.set_type("string");
            obj.set_mask("#####");
            obj.getSetter("_check").set("MIN_LENGTH_UTF16:3");
            obj.getSetter("_msg").set("MaskEdit05");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea05", "absolute", "116", "323", "150", "20", null, null, this);
            obj.set_taborder("34");
            obj.getSetter("_check").set("MIN_LENGTH_ASCII:3");
            obj.getSetter("_msg").set("textArea05");
            this.addChild(obj.name, obj);

            obj = new Static("Static32", "absolute", "282", "323", "142", "20", null, null, this);
            obj.set_taborder("35");
            obj.set_text("MIN_LENGTH_ASCII:3");
            this.addChild(obj.name, obj);

            obj = new Static("Static31", "absolute", "272", "293", "144", "20", null, null, this);
            obj.set_taborder("36");
            obj.set_text("MIN_LENGTH_UTF16:3");
            this.addChild(obj.name, obj);

            obj = new Static("Static30", "absolute", "282", "271", "135", "20", null, null, this);
            obj.set_taborder("37");
            obj.set_text("MIN_LENGTH_UTF8:3");
            this.addChild(obj.name, obj);

            obj = new Static("Static29", "absolute", "278", "247", "162", "20", null, null, this);
            obj.set_taborder("38");
            obj.set_text("MAX_LENGTH_ASCII:5");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea04", "absolute", "116", "247", "150", "20", null, null, this);
            obj.set_taborder("39");
            obj.getSetter("_check").set("MAX_LENGTH_ASCII:5");
            obj.getSetter("_msg").set("textArea");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);

            obj = new Static("Static28", "absolute", "16", "247", "90", "20", null, null, this);
            obj.set_taborder("40");
            obj.set_text("textarea :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "16", "217", "90", "20", null, null, this);
            obj.set_taborder("41");
            obj.set_text("maskedit :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("MaskEdit04", "absolute", "116", "217", "150", "20", null, null, this);
            obj.set_taborder("42");
            obj.set_type("string");
            obj.set_mask("#####");
            obj.getSetter("_check").set("MAX_LENGTH_UTF16:5");
            obj.getSetter("_msg").set("maskEdit");
            this.addChild(obj.name, obj);

            obj = new Static("Static26", "absolute", "274", "217", "176", "20", null, null, this);
            obj.set_taborder("43");
            obj.set_text("MAX_LENGTH_UTF16:5");
            this.addChild(obj.name, obj);

            obj = new Static("Static25", "absolute", "274", "195", "143", "24", null, null, this);
            obj.set_taborder("44");
            obj.set_text("MAX_LENGTH_UTF8:5");
            obj.set_wordwrap("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "16", "195", "90", "20", null, null, this);
            obj.set_taborder("46");
            obj.set_text("edit :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static17", "absolute", "284", "351", "40", "20", null, null, this);
            obj.set_taborder("47");
            obj.set_text("NUM");
            this.addChild(obj.name, obj);

            obj = new Static("Static14", "absolute", "282", "125", "40", "20", null, null, this);
            obj.set_taborder("48");
            obj.set_text("MIN:3");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "282", "147", "40", "20", null, null, this);
            obj.set_taborder("49");
            obj.set_text("MIN:3");
            this.addChild(obj.name, obj);

            obj = new Static("Static12", "absolute", "282", "171", "40", "20", null, null, this);
            obj.set_taborder("50");
            obj.set_text("MIN:3");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "282", "102", "40", "20", null, null, this);
            obj.set_taborder("51");
            obj.set_text("MAX:5");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "282", "80", "40", "20", null, null, this);
            obj.set_taborder("52");
            obj.set_text("MAX:5");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "282", "58", "40", "20", null, null, this);
            obj.set_taborder("53");
            obj.set_text("MAX:5");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit02", "absolute", "118", "351", "149", "20", null, null, this);
            obj.set_taborder("54");
            obj.getSetter("_check").set("NUM");
            obj.getSetter("_msg").set("Eidt02");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "18", "351", "90", "20", null, null, this);
            obj.set_taborder("55");
            obj.set_text("edit :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea01", "absolute", "116", "171", "150", "20", null, null, this);
            obj.set_taborder("56");
            obj.getSetter("_check").set("MIN:3");
            obj.getSetter("_msg").set("textArea");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "16", "171", "90", "20", null, null, this);
            obj.set_taborder("57");
            obj.set_text("textarea :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("MaskEdit01", "absolute", "116", "147", "150", "20", null, null, this);
            obj.set_taborder("58");
            obj.set_type("string");
            obj.set_mask("#####");
            obj.getSetter("_check").set("MIN:3");
            obj.getSetter("_msg").set("maskEdit");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "16", "147", "90", "20", null, null, this);
            obj.set_taborder("59");
            obj.set_text("maskedit :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "16", "125", "90", "20", null, null, this);
            obj.set_taborder("61");
            obj.set_text("edit :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea00", "absolute", "116", "102", "150", "20", null, null, this);
            obj.set_taborder("62");
            obj.set_tooltiptext("컴포넌트3");
            obj.getSetter("_check").set("MAX:5");
            obj.getSetter("_msg").set("textArea");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "16", "102", "90", "20", null, null, this);
            obj.set_taborder("63");
            obj.set_text("textarea :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("MaskEdit00", "absolute", "116", "80", "150", "20", null, null, this);
            obj.set_taborder("64");
            obj.set_type("string");
            obj.set_mask("@@@@@");
            obj.set_tooltiptext("컴포넌트2");
            obj.getSetter("_check").set("MAX:5");
            obj.getSetter("_msg").set("maskEdit00");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "16", "80", "90", "20", null, null, this);
            obj.set_taborder("65");
            obj.set_text("maskedit :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "16", "58", "90", "20", null, null, this);
            obj.set_taborder("67");
            obj.set_text("edit :");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "422", "546", "702", "262", null, null, this);
            obj.set_taborder("69");
            obj.set_text("\r\n\r\n1. Grid 에서 _check 속성에 정합성 체크 조건을 넣으면 해당 조건에 맞춰 validation 체크를 진행한다.\r\n사용자 속성에서 사용할 수 있는 속성 종류는 다음과 같다.\r\nMIN:2 - 최소값 지정 ':' 문자로 구분하며 'MIN:최소값' 형태로 지정한다.\r\nMAX:3 - 최대값 지정 ':' 문자로 구분하며 'MAX:최대값' 형태로 지정한다.\r\nMIN_LENGTH_UTF8:3 - 최소길이 지정 ':' 문자로 구분하며 'MIN_LENGTH:최소길이' 형태로 지정한다.\r\nMAX_LENGTH_UTF8:5 - 최대길이 지정 ':' 문자로 구분하며 'MAX_LENGTH:최대길이' 형태로 지정한다.\r\nNUM - 숫자형인지 여부 지정\r\nZERO - '0' 이 빈값인지 여부 지정\r\n\r\n2. 속성들은 '|' 값으로 구분할 수 있다.\r\n\r\n3. 여러컬럼을 지정할 경우 '^' 값으로 구분시켜 사용한다.\r\n\r\n4. Grid 의 Cell edittype 이 'none' 이 아닐때 validation 을 진행한다. \r\n(Cell edittype 이 아무것도 잡혀있지 않으면 검사 대상이 아니다)\r\n\r\n5. 속성에 조건을 넣지않고 '컬럼명' 만 입력할 경우 단순 필수값 여부만 체크한다.\r\n");
            obj.style.set_background("#ffd70055");
            obj.style.set_padding("5 5 5 5");
            this.addChild(obj.name, obj);

            obj = new Button("btn_InitVal3", "absolute", "212", "10", "80", "19", null, null, this);
            obj.set_taborder("72");
            obj.set_text("setInitVal3");
            this.addChild(obj.name, obj);

            obj = new Button("btn_InitVal2", "absolute", "124", "10", "80", "19", null, null, this);
            obj.set_taborder("73");
            obj.set_text("setInitVal2");
            this.addChild(obj.name, obj);

            obj = new Button("btn_InitVal", "absolute", "42", "10", "80", "19", null, null, this);
            obj.set_taborder("74");
            obj.set_text("setInitVal");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "422", "18", "706", "393", null, null, this);
            obj.set_taborder("76");
            obj.set_text("1. component dd 별 validation 속성을 지정하기 위해선 _check 속성에 조건을 지정하면 된다.\r\n1-1. Misc 속성에 이미 _check 가 존재하는 확장 컴포넌트의 경우 별도의 사용자 속성을 추가할 필요가 없다.\r\n1-2. 확장 컴포넌트가 아닌 일반 컴포넌트의 경우( Edit, Mask, TextArea... )  Properties 창에서 사용자 속성을 추가 한다.\r\n사용자 속성에서 사용할 수 있는 속성 종류는 다음과 같다.\r\nMIN:2 - 최소값 지정 ':' 문자로 구분하며 'MIN:최소값' 형태로 지정한다.\r\nMAX:3 - 최대값 지정 ':' 문자로 구분하며 'MAX:최대값' 형태로 지정한다.\r\nMIN_LENGTH_UTF8:3 - 한 문자당 영문1, 다국어 2~5의 값으로 합산함.':' 문자로 구분하며 'MIN_LENGTH_UTF8:최소길이' 형태로 지정한다.\r\nMIN_LENGTH_UTF16:3 - 한문자당 1의 값으로 합산함. ':' 문자로 구분하며 'MIN_LENGTH_UTF16:최소길이' 형태로 지정한다.\r\nMIN_LENGTH_ASCII:3 - 한문자당 영문 1, 한글 2의 값으로 합산함.':' 문자로 구분하며 'MIN_LENGTH_ASCII:최소길이' 형태로 지정한다.\r\n\r\nMAX_LENGTH_UTF8:5 -  한 문자당 영문1, 다국어 2~5의 값으로 합산함.':' 문자로 구분하며 'MAX_LENGTH_UTF8:최대길이' 형태로 지정한다.\r\nMAX_LENGTH_UTF16:5 - 한문자당 1의 값으로 합산함. ':' 문자로 구분하며 'MAX_LENGTH_UTF16:최대길이' 형태로 지정한다.\r\nMAX_LENGTH_ASCII:5 - 한문자당 영문 1, 한글 2의 값으로 합산함.:' 문자로 구분하며 'MAX_LENGTH_ASCII:최대길이' 형태로 지정한다.\r\n\r\nNUM - 숫자형인지 여부 지정\r\nZERO - '0' 이 빈값인지 여부 지정\r\n\r\n2. 속성들은 '|' 값으로 구분할 수 있다.\r\n\r\n3. 항목명에대한 메세지 구분입력\r\n_msg 프로퍼티 추가 : Edit00 \r\noutput : Edit00은 필수 입력입니다.\r\n\r\n");
            obj.style.set_background("#ffd70055");
            obj.style.set_padding("5 5 5 5");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer01", "absolute", "869", "411", "265", "97", null, null, this);
            obj.set_taborder("77");
            obj.set_image("URL('image::sample02.png')");
            obj.set_stretch("fit");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer00", "absolute", "656", "264", "205", "281", null, null, this);
            obj.set_taborder("78");
            obj.set_image("URL('image::sample01.png')");
            obj.set_stretch("fit");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "1019", "0", "101", "18", null, null, this);
            obj.set_taborder("79");
            obj.set_text("전체vali 실행");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "42", "652", "370", "140", null, null, this);
            obj.set_taborder("6");
            obj.set_binddataset("ds_list");
            obj.set_autoenter("select");
            obj.set_cellmovingtype("col");
            obj.set_autofittype("col");
            obj.set_tooltiptype("hover");
            obj.getSetter("_check").set("Column0|MAX:5");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"60\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"보상&#10;고사주수&#10;(주)\"/><Cell col=\"1\" text=\"Column1\"/><Cell col=\"2\" text=\"Column2\"/><Cell col=\"3\" text=\"Column3\"/><Cell col=\"4\" text=\"Column4&#13;&#10;테스트1\"/><Cell col=\"5\" text=\"Column5\"/></Band><Band id=\"body\"><Cell edittype=\"normal\" text=\"bind:Column0\"/><Cell col=\"1\" edittype=\"normal\" text=\"bind:Column1\"/><Cell col=\"2\" edittype=\"normal\" text=\"bind:Column2\"/><Cell col=\"3\" edittype=\"normal\" text=\"bind:Column3\"/><Cell col=\"4\" edittype=\"normal\" text=\"bind:Column4\"/><Cell col=\"5\" edittype=\"normal\" text=\"bind:Column5\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit01", "absolute", "116", "125", "149", "20", null, null, this);
            obj.set_taborder("84");
            obj.getSetter("_check").set("MIN:3");
            obj.getSetter("_msg").set("Edit01");
            this.addChild(obj.name, obj);

            obj = new Static("Static42", "absolute", "272", "431", "312", "33", null, null, this);
            obj.set_taborder("85");
            obj.set_text("MIN_LENGTH_UTF8:3\r\n|MAX_LENGTH_UTF8:5");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer02", "absolute", "864", "296", "268", "110", null, null, this);
            obj.set_taborder("87");
            obj.set_image("URL('image::msgvali.png')");
            obj.set_stretch("fit");
            this.addChild(obj.name, obj);

            obj = new Button("btn_valiTest", "absolute", "297", "10", "124", "20", null, null, this);
            obj.set_taborder("88");
            obj.set_text("특정대상Comp vali");
            this.addChild(obj.name, obj);

            obj = new Div("div_test", "absolute", "451", "426", "160", "108", null, null, this);
            obj.set_taborder("89");
            obj.set_text("Div00");
            this.addChild(obj.name, obj);
            obj = new Edit("Edit01", "absolute", "11", "13", "149", "20", null, null, this.div_test);
            obj.set_taborder("0");
            obj.getSetter("_check").set("MIN:3");
            obj.getSetter("_msg").set("Edit01");
            this.div_test.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 160, 108, this.div_test,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("89");
            		p.set_text("Div00");

            	}
            );
            this.div_test.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1150, 827, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("");
            		p.set_titletext("validation샘플");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("sample003.xfdl", "lib::comLib.xjs");
        this.registerScript("sample003.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : 
        * BUSINESS    : 
        * FILE NAME   : 
        * PROGRAMMER  : 
        * DATE        : 
        * DESCRIPTION : 
        *------------------------------------------------------------------
        * MODIFY DATE   PROGRAMMER			DESCRIPTION
        *------------------------------------------------------------------
        * 
        *------------------------------------------------------------------
        ***********************************************************************************/

        
        /***********************************************************************************
        * Common Library
        ***********************************************************************************/
        //include "lib::comLib.xjs";

        
        /***********************************************************************************
        * Global/Local Variable
        ***********************************************************************************/

        
        /***********************************************************************************
        * Form Event
        ***********************************************************************************/
        this.form_onload = function(obj,e)
        {
           var nHeight = 827;
            //폼로드시 공통함수 
        	Ex.core.init(obj,nHeight);
        }

        

        /***********************************************************************************
        * Component Event
        ***********************************************************************************/

        
        this.btn_InitVal_onclick = function(obj,e)
        {
        	this.Edit00.set_value("1");
        	this.MaskEdit00.set_value("1");
        	this.TextArea00.set_value("1");
        	
        	this.Edit01.set_value("1");
        	this.MaskEdit01.set_value("1");
        	this.TextArea01.set_value("1");
        	
        	this.Edit02.set_value("A");
        	this.MaskEdit02.set_value("1");
        	this.TextArea02.set_value("A");
        	
        	this.Edit03.set_value("1");
        	this.MaskEdit03.set_value("1");
        	this.TextArea03.set_value("1");
        	
        	this.Edit04.set_value("1");
        	this.MaskEdit04.set_value("1");
        	this.TextArea04.set_value("1");
        	
        	this.Edit05.set_value("1");
        	this.MaskEdit05.set_value("1");
        	this.TextArea05.set_value("1");
        	
        	this.Edit06.set_value("1");
        	this.MaskEdit06.set_value("1");
        	this.TextArea06.set_value("1");
        }

        this.btn_InitVal2_onclick = function(obj,e)
        {
        	this.Edit00.set_value("123");
        	this.MaskEdit00.set_value("123");
        	this.TextArea00.set_value("123");
        	
        	this.Edit01.set_value("123");
        	this.MaskEdit01.set_value("123");
        	this.TextArea01.set_value("123");
        	
        	this.Edit02.set_value("AAA");
        	this.MaskEdit02.set_value("123");
        	this.TextArea02.set_value("BBB");
        	
        	this.Edit03.set_value("123");
        	this.MaskEdit03.set_value("123");
        	this.TextArea03.set_value("123");
        	
        	this.Edit04.set_value("AAA");
        	this.MaskEdit04.set_value("123");
        	this.TextArea04.set_value("BBB");
        	
        	this.Edit05.set_value("123");
        	this.MaskEdit05.set_value("123");
        	this.TextArea05.set_value("123");
        	
        	this.Edit06.set_value("123");
        	this.MaskEdit06.set_value("123");
        	this.TextArea06.set_value("123");
        }

        this.btn_InitVal3_onclick = function(obj,e)
        {
        	this.Edit00.set_value("123456");
        	this.MaskEdit00.set_value("123456");
        	this.TextArea00.set_value("123456");
        	
        	this.Edit01.set_value("123456");
        	this.MaskEdit01.set_value("123456");
        	this.TextArea01.set_value("123456");
        	
        	this.Edit02.set_value("CCCCCC");
        	this.MaskEdit02.set_value("123456");
        	this.TextArea02.set_value("DDDDDD");
        	
        	this.Edit03.set_value("123456");
        	this.MaskEdit03.set_value("123456");
        	this.TextArea03.set_value("123456");
        	
        	this.Edit04.set_value("CCCCCC");
        	this.MaskEdit04.set_value("123456");
        	this.TextArea04.set_value("DDDDDD");
        	
        	this.Edit05.set_value("123456");
        	this.MaskEdit05.set_value("123456");
        	this.TextArea05.set_value("123456");
        	
        	this.Edit06.set_value("123456");
        	this.MaskEdit06.set_value("123456");
        	this.TextArea06.set_value("123456");
        }

        
        this.Edit07_canchange = function(obj,e)
        {
            trace(" e.posttet >>> "   + e.posttext);
        }

        this.Button02_onclick = function(obj,e)
        {
        	this.ds_list.addRow();
        }

        this.Button03_onclick = function(obj,e)
        {
        		if(!Ex.vali.isValidGridValue(this.Grid00))
        		{
        		   alert( "OK" );
        		}
        }

        this.Button00_onclick = function(obj,e)
        {

        	
        }

        
        //전체 validation 실행
        this.fn_RunVali = function(obj,e)
        {

        	if(Ex.vali.isValidComp(this) ) {
        		alert( "OK" );
        	}
        }

        

        this.Button06_onclick = function(obj,e)
        {

        }

        
        //Grid validation 체크테스트
        this.btnGridVali_onclick = function(obj,e)
        {
        		
        		/*grid validation 
        		*@ {nxComp} this
        		*@ {nxComp} validation 할 component
        		*/
        		if(Ex.vali.isValidGridValue(this.Grid00))
        		{
        		   application.alert( "OK" );
        		}
        }

        this.btnTest_onclick = function(obj,e)
        {
        	this.Edit01.setFocus();
        }

        // 특정 대상 컴퍼넌트 validation
        this.btn_valiTest_onclick = function(obj,e)
        {
        	
        	
        	var res  = Ex.vali.isValidComponentValue(this.Edit01);
        	
        	
        	trace(" res :  " + res);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.btnGridVali.addEventHandler("onclick", this.btnGridVali_onclick, this);
            this.Button02.addEventHandler("onclick", this.Button02_onclick, this);
            this.btn_InitVal3.addEventHandler("onclick", this.btn_InitVal3_onclick, this);
            this.btn_InitVal2.addEventHandler("onclick", this.btn_InitVal2_onclick, this);
            this.btn_InitVal.addEventHandler("onclick", this.btn_InitVal_onclick, this);
            this.Button00.addEventHandler("onclick", this.fn_RunVali, this);
            this.btn_valiTest.addEventHandler("onclick", this.btn_valiTest_onclick, this);

        };

        this.loadIncludeScript("sample003.xfdl");

       
    };
}
)();

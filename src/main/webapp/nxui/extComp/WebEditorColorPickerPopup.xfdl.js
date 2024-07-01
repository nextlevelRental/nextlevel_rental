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
                this.set_name("ColorPickerPopup");
                this.set_classname("OColorDialog");
                this.set_titletext("Color 선택");
                this._setFormPosition(0,0,527,344);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static10", "absolute", "0", "0", "527", "344", null, null, this);
            obj.set_taborder("90");
            obj.style.set_background("#e4e5e9ff");
            obj.style.set_border("1 solid #748ba6ff");
            obj.style.set_bordertype("round 4 4");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "17", "10", "122", "15", null, null, this);
            obj.set_text("Basic Color");
            obj.set_taborder("0");
            this.addChild(obj.name, obj);

            obj = new Button("selectColorBoder11", "absolute", "244", "212", "16", "48", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Editer_btn_clrAdd");
            this.addChild(obj.name, obj);

            obj = new Static("b11", "absolute", "15", "26", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("2");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b21", "absolute", "15", "53", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("3");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b31", "absolute", "15", "80", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("4");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b41", "absolute", "15", "107", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("5");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b51", "absolute", "15", "134", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("6");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b61", "absolute", "15", "161", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("7");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b12", "absolute", "44", "26", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("8");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b13", "absolute", "73", "26", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("9");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b14", "absolute", "102", "26", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("10");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b15", "absolute", "131", "26", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("11");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b16", "absolute", "160", "26", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("12");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b17", "absolute", "189", "26", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("13");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b18", "absolute", "218", "26", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("14");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Button("btnCancel", "absolute", "189", "308", "71", "25", null, null, this);
            obj.set_taborder("77");
            obj.set_text("Cancel");
            obj.set_cssclass("WF_btn_Pnt");
            this.addChild(obj.name, obj);

            obj = new Button("btnApply", "absolute", "263", "308", "71", "25", null, null, this);
            obj.set_taborder("76");
            obj.set_text("OK");
            obj.set_cssclass("WF_btn_Pnt");
            this.addChild(obj.name, obj);

            obj = new Static("b22", "absolute", "44", "53", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("17");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b32", "absolute", "44", "80", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("18");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b42", "absolute", "44", "107", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("19");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b52", "absolute", "44", "134", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("20");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b62", "absolute", "44", "161", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("21");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b23", "absolute", "73", "53", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("22");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b33", "absolute", "73", "80", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("23");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b43", "absolute", "73", "107", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("24");
            obj.set_cssclass("Editer_sta_clrBox");
            obj.style.set_background("#ffffffff URL('image::editer/Editer_sta_clrBox.png')");
            this.addChild(obj.name, obj);

            obj = new Static("b53", "absolute", "73", "134", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("25");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b63", "absolute", "73", "161", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("26");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b24", "absolute", "102", "53", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("27");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b34", "absolute", "102", "80", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("28");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b44", "absolute", "102", "107", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("29");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b54", "absolute", "102", "134", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("30");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b64", "absolute", "102", "161", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("31");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b25", "absolute", "131", "53", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("32");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b35", "absolute", "131", "80", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("33");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b45", "absolute", "131", "107", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("34");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b55", "absolute", "131", "134", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("35");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b65", "absolute", "131", "161", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("36");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b26", "absolute", "160", "53", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("37");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b36", "absolute", "160", "80", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("38");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b46", "absolute", "160", "107", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("39");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b56", "absolute", "160", "134", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("40");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b66", "absolute", "160", "161", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("41");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b27", "absolute", "189", "53", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("42");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b37", "absolute", "189", "80", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("43");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b47", "absolute", "189", "107", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("44");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b57", "absolute", "189", "134", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("45");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b67", "absolute", "189", "161", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("46");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b28", "absolute", "218", "53", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("47");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b38", "absolute", "218", "80", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("48");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b48", "absolute", "218", "107", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("49");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b58", "absolute", "218", "134", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("50");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("b68", "absolute", "218", "161", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("51");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("colorImage", "absolute", "260", "29", "221", "172", null, null, this);
            obj.set_taborder("85");
            obj.set_image("URL('image::editer/colorDialog.jpg')");
            obj.set_tabstop("false");
            obj.style.set_border("0 none #808080ff");
            obj.style.set_bordertype("normal 0 0");
            this.addChild(obj.name, obj);

            obj = new Static("lightnessBar", "absolute", "492", "29", "13", "171", null, null, this);
            obj.style.set_background("@gradation");
            obj.style.set_gradation("linear 0,0 white 0,100 black [50% blue]");
            obj.set_text("");
            obj.set_taborder("53");
            this.addChild(obj.name, obj);

            obj = new Static("previewColor", "absolute", "260", "211", "72", "48", null, null, this);
            obj.set_text("");
            obj.style.set_background("red");
            obj.set_taborder("54");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "363", "365", "56", "12", null, null, this);
            obj.set_text("색|단색");
            obj.set_taborder("55");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "344", "236", "32", "23", null, null, this);
            obj.set_text("Set");
            obj.set_taborder("56");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "344", "261", "32", "23", null, null, this);
            obj.set_text("Lum");
            obj.set_taborder("57");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "344", "211", "36", "23", null, null, this);
            obj.set_text("Hue");
            obj.set_taborder("58");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "423", "236", "48", "23", null, null, this);
            obj.set_text("Green");
            obj.set_taborder("59");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "423", "261", "32", "23", null, null, this);
            obj.set_text("Blue");
            obj.set_taborder("60");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "423", "211", "32", "23", null, null, this);
            obj.set_text("Red");
            obj.set_taborder("61");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "17", "191", "168", "15", null, null, this);
            obj.set_text("Custom Add Color");
            obj.set_taborder("62");
            this.addChild(obj.name, obj);

            obj = new Static("u0", "absolute", "15", "209", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("63");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("u2", "absolute", "44", "209", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("64");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("u4", "absolute", "73", "209", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("65");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("u6", "absolute", "102", "209", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("66");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("u8", "absolute", "131", "209", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("67");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("u10", "absolute", "160", "209", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("68");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("u12", "absolute", "189", "209", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("69");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("u14", "absolute", "218", "209", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("70");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("u1", "absolute", "15", "236", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("71");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("u3", "absolute", "44", "236", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("72");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("u5", "absolute", "73", "236", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("73");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("u7", "absolute", "102", "236", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("74");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("u9", "absolute", "131", "236", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("75");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("u11", "absolute", "160", "236", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("15");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("u13", "absolute", "189", "236", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("16");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Static("u15", "absolute", "218", "236", "27", "27", null, null, this);
            obj.set_text("");
            obj.set_taborder("52");
            obj.set_cssclass("Editer_sta_clrBox");
            this.addChild(obj.name, obj);

            obj = new Button("btnAddUserColor", "absolute", "260", "263", "72", "21", null, null, this);
            obj.set_taborder("84");
            obj.set_text("Add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_cancel01", "absolute", "30", "360", "232", "22", null, null, this);
            obj.set_taborder("86");
            obj.set_text("사용자 지정 색 만들기 >>");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("selectPointer", "absolute", "267", "14", "19", "19", null, null, this);
            obj.getSetter("transparenthittest").set("true");
            obj.set_taborder("87");
            obj.style.set_background("transparent");
            obj.style.set_border("0 solid #e5e5e5ff");
            obj.set_tabstop("false");
            obj.set_image("URL('image::select.GIF')");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("slider", "absolute", "505", "45", "9", "15", null, null, this);
            obj.set_taborder("88");
            obj.set_image("URL('image::editer/Editr_arrow.png')");
            obj.style.set_background("#ffffff00");
            obj.style.set_cursor("hand");
            obj.set_tabstop("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "0", "297", "525", "1", null, null, this);
            obj.set_taborder("89");
            obj.set_cssclass("WF_sta_lineDiv");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_r", "absolute", "465", "211", "40", "23", null, null, this);
            obj.set_taborder("81");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_g", "absolute", "465", "236", "40", "23", null, null, this);
            obj.set_taborder("82");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_b", "absolute", "465", "261", "40", "23", null, null, this);
            obj.set_taborder("83");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_h", "absolute", "374", "211", "40", "23", null, null, this);
            obj.set_taborder("78");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_s", "absolute", "374", "236", "40", "23", null, null, this);
            obj.set_taborder("79");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_v", "absolute", "374", "261", "40", "23", null, null, this);
            obj.set_taborder("80");
            this.addChild(obj.name, obj);

            obj = new Button("selectColorBoder", "absolute", "120", "1", "27", "27", null, null, this);
            obj.set_taborder("93");
            obj.style.set_background("transparent URL('image::editer/Editer_sta_clrBox_O.png')");
            obj.style.set_shadow("outer 0,0 0 #0000004a");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 527, 344, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("OColorDialog");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("Color 선택");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("WebEditorColorPickerPopup.xfdl", function() {
        /*
         * Color Picker Sample at XPLATFORM
         * 
         *
         * Copyright (c) 2013 EcoSystem of TOBESOFT
         * Licensed Free under XPLATFORM.
        */

        /**
         * 기본색상(48개)을 선택할 수 있는 Color Picker.
         * Hue의 범위는 0 ~ 240도.
         */  

        this.initColor = '#000000';

        //HSL과 RGB값을 가진 Color객체 
        this.colorValue = {R:0, G:0, B:0, A:255, H:0, S:0, V:0};
        //팝업호출시 전달받은 색상
        this.receiveColor = "#000000"; 
        //선택한 "사용자 색"관련 컴포넌트
        this.userColorComponent = this.u0;

        //selectPointer 폭
        this.selectPointerWidth;
        //selectPointer 높이
        this.selectPointerHeight;

        //명도선택판 높이
        this.lightnessBarHeight;
        //명도선택판 Top Position
        this.lightnessBarTop;
        //명도선택판 Bottom Position
        this.lightnessBarBottom;

        //slider Left Position
        this.sliderLeft;
        //slider 높이
        this.sliderHeight;

        this.fixSize = 19;

        this.ColorPickerPopup_onload = function(obj,e)
        {
        	this.selectPointerWidth = 20;
        	this.selectPointerHeight = 20;
        	
        	this.lightnessBarHeight = this.lightnessBar.height;
        	this.lightnessBarTop = this.lightnessBar.top;
        	this.lightnessBarBottom = this.lightnessBar.bottom;
        	
        	this.sliderLeft = this.slider.left;
        	this.sliderHeight = 10;

        	//기본색 
        	var basicColors= Eco.Color.basicColors;
        	var horizontalLen = basicColors[0].length; //8
        	var verticalLen   = basicColors.length; //6
        	var i = j = 0;
        	var row, col, color, currentItem;
        	
        	//전달받은 색상이 "기본 색"일 때 
        	//이에 해당하는 컴포넌트
        	var matchComponent = this.b61; //기본검정색

        	//팝업호출시 전달받은 색상
        	
         	if(!Eco.isEmpty(this.initColor)) 
         	{
        		this.receiveColor = this.initColor; 
        	}
        	
        	var baseColor = Eco.Color;
        	
        	//"기본 색"관련 컴포넌트에 배경색 설정
        	for(var i=0; i<verticalLen; i++)
        	{
        		row = i+1;
        		
        		for(var j=0; j<horizontalLen; j++)
        		{
        			col = j+1;
        			color = baseColor.basicColors[i][j];
        			color += " URL('image::editer/Editer_sta_clrBox.png')";
        			
        			currentItem = this.components["b"+row+col];
        			currentItem.style.set_background(color);
        			
        			if( color == this.receiveColor )
        			{
        				matchComponent = currentItem;
        			}			
        		
        		}
        	}
        	
        	

         	//색선택 표시용 테두리 설정
         	this.setSelectColorBorder(matchComponent);
         	
         	//colorValue 설정
         	this.setColor(this.receiveColor);
        	
        	this.setValue();
        	
         	this.onChangeRGB();
        	
        	this.setPreview();
        	
         	this.setLightnessBar();
        	
        	
        // 	//"사용자 지정 색" 존재시 배경색 설정
        // 	for( i = 0 ; i < 16 ; i++ )
        // 	{
        // 		var userColor;
        // 		userColor = application.getPrivateProfile("ColorDialog/u"+i);
        // 		
        // 		if( "x"+userColor != "x" )
        // 		{
        // 			this.components["u"+i].style.background = userColor;
        // 		}
        // 			
        // 	}		

        }  
          

          
          
        /*========================================================================
        	Function Area
        ========================================================================*/
        /**
         * color를 헥사문자열값으로 반환.
         * @example
         *   getHexColor(); //return "#FF0000"
         */	
        this.getHexColor = function()
        {
        // 	trace("## getHexColor >>> this.colorValue.R="+this.colorValue.R);
        // 	trace("## getHexColor >>> this.colorValue.G="+this.colorValue.G);
        // 	trace("## getHexColor >>> this.colorValue.B="+this.colorValue.B);
        	
        	return Eco.Color.rgbToHex(this.colorValue.R, this.colorValue.G, this.colorValue.B, this.colorValue.A);
        }

        
        this.checkRgbaValue = function(r,g,b,a)
        {
        	var len = arguments.length;
        	
        	if(len < 3) return false;
        	var i = 0,
        	    value;
        	for( ; i < len; i++)
        	{
        		value = arguments[i];
        		if(value < 0 || value > 255) return false;
        	}
        	
        	return true;
        }

        /**
         * this.colorValue 설정
         * @param {string | number} firstValue Color 값 문자열 또는 Red 값 ( 0 ~ 255 ).
         * @param {number=} green Green 값.( 0 ~ 255 )의 입력범위를 가집니다.
         * @param {number=} blue Blue 값.( 0 ~ 255 )의 입력범위를 가집니다.
         * @param {number=} alpha Alpha 값.( 0 ~ 255 ) 의 입력범위를 가집니다.
         * @example
         *   this.setColor("#FF0000");
         *   this.setColor(255,0,0);
         */
        this.setColor = function(firstValue,green,blue,alpha)
        {
        	//trace("\n\n  this.setColor >> f=" + firstValue + ", g=" + green + ", b=" + blue + ", a=" + alpha);
        	
        	//var color = new Color;
        	var color = {r: 0, g: 0, b: 0, a: 0};
        	color.setColor = function(r,g,b,a){
        		this.r = r;
        		this.g = g;
        		this.b = b;
        		
        		if(Eco.isEmpty(a)) return;
        		
        		this.a = a;
        	};
        	
        	var ret;
        	
        	//trace("\n typeof(firstValue)="+ typeof(firstValue));
        	
        	if( typeof(firstValue) == "string" && Eco.isEmpty(green))
        	{
        		ret = Eco.Color.hexToRgb(firstValue);
        		
        		//trace("\n typeof(firstValue)="+ typeof(firstValue) + ", ret="+ret);
        		
        		if(ret)
        		{
        			color.setColor(ret[0], ret[1], ret[2], ret[3]);
        			//trace("\n color.r="+ color.r + ", color.a="+color.a);
        			ret = true;
        		}
        	}
        	else
        	{
        		if( alpha == null )
        		{
        			color.setColor(firstValue,green,blue);
        			ret = this.checkRgbaValue(firstValue,green,blue);
        			
        		}
        		else
        		{
        			color.setColor(firstValue,green,blue,alpha);
        			ret = this.checkRgbaValue(firstValue,green,blue,alpha);
        		}
        	}
        		
        	if( ret == true )
        	{
        		//trace("여기 $$$!!!color.r="+color.r+ ", color.g="+color.g +  ", color.b="+color.b);
        		this.colorValue.R = color.r;
        		this.colorValue.G = color.g;
        		this.colorValue.B = color.b;
        		this.colorValue.A = color.a;
        		
        		var hsv = Eco.Color.rgbToHsl(color.r, color.g, color.b);
        		//trace("여기 !!!hsv="+hsv);
        		
        		this.colorValue.H = hsv[0];
        		this.colorValue.S = hsv[1];
        		this.colorValue.V = hsv[2];
        		
        	}
        	else
        	{
        // 		trace("aaa ret="+ret);
        // 		trace("aaa color.r="+color.r+ ", color.g="+color.g);
        		this.colorValue.R = 255;
        		this.colorValue.G = 255;
        		this.colorValue.B = 255;
        		this.colorValue.A = 255;

        		var hsv = Eco.Color.rgbToHsl(color.r, color.g, color.b);
        		this.colorValue.H = hsv[0];
        		this.colorValue.S = hsv[1];
        		this.colorValue.V = hsv[2];
        		
        	}	

        	
        	return ret;
        }

        /**
         * HSL,RGB표시용 컴포넌트 값설정.
         * colorValue의 값을 사용한다.
         */	
        this.setValue = function()
        {
        	//trace("this.setValue >> this.colorValue.H=" + this.colorValue.H + ", this.colorValue.V=" + this.colorValue.V + ", this.colorValue.S=" + this.colorValue.S);
        	this.ed_h.set_value(this.colorValue.H);
        	this.ed_v.set_value(this.colorValue.V);
        	this.ed_s.set_value(this.colorValue.S);
        	
        	this.ed_r.set_value(this.colorValue.R);
        	this.ed_g.set_value(this.colorValue.G);
        	this.ed_b.set_value(this.colorValue.B);
        }

        
        //RGB와 연관된 컴포넌트의 값을 업데이트합니다.
        this.setRgbValue = function()
        {
        	this.ed_r.set_value( this.colorValue.R );
        	this.ed_g.set_value( this.colorValue.G);
        	this.ed_b.set_value( this.colorValue.B);
        }

        this.setHslValue = function()
        {
        	
        	this.ed_h.set_value( this.colorValue.H);
        	this.ed_v.set_value( this.colorValue.V);
        	this.ed_s.set_value( this.colorValue.S);
        }

        
        /**
         * 미리보기 컴포넌트의 배경색을 설정합니다.
         */
        this.setPreview = function()
        {
            var hexColor = this.getHexColor();
            
            //BB.log.debug("setPreview >>> hexColor="+hexColor);
            //알파값이 적용되지 않음...2014.05.13
            var removeAlpha = hexColor.substr(0, hexColor.length - 2); 
            this.previewColor.style.set_background(removeAlpha);
        	
        }

        
        /**
         * 명도선택판 배경색을 설정합니다.
         */
        this.setLightnessBar = function()
        {
        	var hexColor;
        	
        	//명도가 0이면 모든색상이 검은색으로만 나오는 문제 보완.
        	//BB.log.debug("*******   setLightnessBar >>> this.colorValue.V="+this.colorValue.V);
        	if(this.colorValue.V < 1)
        	{
        		var rgb = Eco.Color.hslToRgb(this.colorValue.H,this.colorValue.S, 120);
        		//BB.log.debug("rgb="+rgb);
        		hexColor = Eco.Color.rgbToHex(rgb[0],rgb[1],rgb[2],this.colorValue.A);
        	} 
        	else 
        	{
        		hexColor = this.getHexColor();
        	}
        	
        	
        	//BB.log.debug("hexColor="+hexColor);
        	    //알파값이 적용되지 않음...2014.05.13
            var removeAlpha = hexColor.substr(0, hexColor.length - 2); 

        	
        	//this.lightnessBar.style.gradation = "linear 0,0 white 0,100 black [70% " + hexColor + "]";
        	this.lightnessBar.style.set_gradation("linear 0%,0% white 0%,100% black [70% " + removeAlpha + "]");
        }

        

        

        /**
         * "기본 색" 및 "사용자 지정 색" 컴포넌트를 대상으로
         * selectColorBoder를 이동시켜 선택된 컴포넌트를 표시한다.
         * @param {component} xpComp 테두리가 위치할 컴포넌트 객체.
         */
        this.setSelectColorBorder = function(xpComp)
        {
        	this.selectColorBoder.move(xpComp.left, xpComp.top);	
        }

        /**
         * RGB값 변경시 처리함수.
         * SelectPointer와 Slider를 color에 맞게 이동시킨다.
         */
        this.onChangeRGB = function()
        {
        	this.moveSelectPointer();
        	this.moveSlider();	
        }

        
        //명도선택판에서 선택된 명도로
        //관련된 정보를 업데이트합니다.
        this.onChangeLightnessBar = function()
        {
        	var sliderTop = nexacro.toNumber(this.slider.top);
        	var lightnessBarTop = nexacro.toNumber(this.lightnessBar.top);
        	
        	//trace("onChangeLightnessBar >>> sliderTop="+sliderTop + ", this.lightnessBarTop="+this.lightnessBarTop);
        	
        	var adjustTop = sliderTop + (this.sliderHeight/2);
        	var topGap  = adjustTop - this.lightnessBarTop;
        	
        	//trace("onChangeLightnessBar >>> adjustTop="+adjustTop + ", topGap="+topGap);
        	
        	var lightRate = nexacro.round((240 * 1)/174, 2); //명도배율. 1일때	
        	var light = 240 - nexacro.round(topGap * lightRate);
        	
        	this.ed_v.set_value(light);
        	
         	var rgb = Eco.Color.hslToRgb(this.ed_h.value, this.ed_s.value, light);
        	//trace("onChangeLightnessBar >>> light="+light + ", rgb="+rgb);
        	
        	this.setColor(rgb[0], rgb[1], rgb[2]);
        	this.setPreview();
        	this.setRgbValue();
        	
        }

        //색상,채도,명도 입력시 처리
        this.onChangeHslValue = function(obj)
        {
        	var value = obj.value;
        	if(Eco.isEmpty(value)) return;
        	
        	this.setValidate(obj);
        	
        	var h = parseInt(this.ed_h.value);
        	var s = parseInt(this.ed_s.value);
        	var l = parseInt(this.ed_v.value);
        	
        	var rgb = Eco.Color.hslToRgb(h,s,l);
        	this.setColor(rgb[0], rgb[1], rgb[2]);
        	this.setPreview();
        	this.setLightnessBar();
        		
        	this.setRgbValue();
        	this.moveSlider();
        	this.moveSelectPointer();
        }

        //R,G,B 입력시 처리
        this.onChangeRgbValue = function(obj)
        {
        	var value = obj.value;
        	if(Eco.isEmpty(value)) return;
        	
        	this.setValidate(obj);
        	
        	var r = parseInt(this.ed_r.value);
        	var g = parseInt(this.ed_g.value);
        	var b = parseInt(this.ed_b.value);
        	
        	this.setColor(r, g, b);
         	this.setPreview();
         	this.setLightnessBar();

         	this.setHslValue();
         	this.moveSlider();
         	this.moveSelectPointer();
        }

        
        this.setValidate = function(obj)
        {
        	var max_val;
        	
        	if( obj === this.ed_h || obj === this.ed_s || obj === this.ed_v )
        	{
        		max_val = 240;
        	}
        	
        	if( obj === this.ed_r || obj === this.ed_g || obj === this.ed_b ) 
        	{
        		max_val = 255;
        	}

        	if( obj.value > max_val ) 
        	{
        		obj.set_value(max_val);
        		obj.setCaretPos(-1); //입력 Caret을 마지막으로 이동
        	}
        }

        
        //색채선택판에서 선택된 색으로 
        //관련된 정보를 업데이트합니다.
        this.onChangeHueSat = function()
        {
        	var pointerLeft = this.selectPointer.left;
        	var pointerTop = this.selectPointer.top;
        	var colorImageLeft = this.colorImage.left;
        	var colorImageTop = this.colorImage.top;
        	
        	var adjustLeft = pointerLeft + (this.selectPointerWidth/2);
        	var adjustTop  = pointerTop  + (this.selectPointerHeight/2);
        	
        	var leftGap = adjustLeft - colorImageLeft;
        	var topGap  = adjustTop - colorImageTop;
        	
        	var hue = sat = 0;
        	var hueRate = nexacro.round((240 * 1)/208, 2); //색상배율. 1일때.
        	var satRate = nexacro.round((240 * 1)/174, 2); //채도배율. 1일때	
        	
        	hue = nexacro.round(leftGap * hueRate);
        	sat = 240 - nexacro.round(topGap * satRate);

        	light = this.ed_v.value;
        	
        	//BB.log.debug("## onChangeHueSat >>> hue="+hue + " , sat="+sat+ " , light="+light);
        	//alert("## onChangeHueSat >>> hue="+hue + " , sat="+sat+ " , light="+light);
        	
        	var rgb = Eco.Color.hslToRgb(hue,sat,light);
        	
        	this.ed_h.set_value(hue);
        	this.ed_v.set_value(light);
        	this.ed_s.set_value(sat);
        	this.ed_r.set_value(rgb[0]);
        	this.ed_g.set_value(rgb[1]);
        	this.ed_b.set_value(rgb[2]);
        	
        	//BB.log.debug("## rgb[0]="+rgb[0] + " , rgb[1]="+rgb[1]+ " , rgb[2]="+rgb[2]);
        	this.setColor(rgb[0], rgb[1], rgb[2]);
        	this.setPreview();
        	this.setLightnessBar();	
        	
        }

        

        /**
         * selectPointer 이동.
         * left position은 색상(hue)과 연동.
         * top position은 채도(saturation)와 연동.
         */
        this.moveSelectPointer = function()
        {
        	//var left = top = 0;	// IE8 디버그 모드에서 비정상 작동
        	var left = 0,
        		top = 0;
        	var hue = this.colorValue.H;
        	var sat = this.colorValue.S;
        	
        	if(hue < 1)
        	{
        		left = nexacro.toNumber(this.colorImage.left);
        		
        	}
        	else if(hue <= 240 )
        	{
        		var rate = nexacro.round((208 * 1)/240, 2); //색상이 1일 때 배율.
        		left = nexacro.round(rate * hue);
        		left += nexacro.toNumber(this.colorImage.left);
        		left -= (this.selectPointerWidth/2);	
        	}
        	else 
        	{
        		left = nexacro.toNumber(this.colorImage.left) + nexacro.toNumber(this.colorImage.width);
        		left -= (this.selectPointerWidth/2);
        	}
        	
        	if(sat < 1)
        	{
        		//trace("a 1");
        		top = nexacro.toNumber(this.colorImage.top) + nexacro.toNumber(this.colorImage.height);
        		top -= ((this.selectPointerWidth/2)+3);
        	}
        	else if(sat <= 240 )
        	{
        		
        		var rate = nexacro.round((174 * 1)/240, 2); //채도가 1일 때 배율.
        		top = nexacro.round(rate * sat);
        		
        		
        		top = nexacro.toNumber(this.colorImage.top) + nexacro.toNumber(this.colorImage.height) - top;
        		//top = nexacro.toNumber(this.colorImage.bottom) - top;
        		
        		top -= ((this.selectPointerWidth/2) -3) ;	
        		
        	}
        	else 
        	{
        		top = nexacro.toNumber(this.colorImage.top);
        		top -= (this.selectPointerWidth/2);
        	}	
        	 

        	this.selectPointer.move(left, top);
        	
        }

        
        /**
         * slider 이동.
         * top position은 명도와 연동.
         */
        this.moveSlider = function()
        {
        	var left, top;
        	var lightness = this.colorValue.V;
        	
        	left = nexacro.toNumber(this.slider.left);

        	if(lightness < 1)
        	{
        		top = nexacro.toNumber(this.lightnessBar.top) + nexacro.toNumber(this.lightnessBar.height) - (this.sliderHeight/2);
        	} 
        	else if(lightness <= 240)
        	{
        		var rate = nexacro.round((174 * 1)/240, 2); //명도가 1일때 배율.
        		top = nexacro.round(rate * lightness);
        		top = nexacro.toNumber(this.lightnessBar.top) + nexacro.toNumber(this.lightnessBar.height) - top;
        		top -= (this.sliderHeight/2);
        	}
        	else
        	{
        		top = nexacro.toNumber(this.lightnessBar.top) + (this.sliderHeight/2);
        	}

        	//trace("this.moveSlider >> left=" + left + ", top=" + top); 
        	this.slider.move(left, top);
        }

        	
        //기본색 클릭시 이벤트 처리
        this.basicColor_onclick = function(obj,e)
        {
        	this.setSelectColorBorder(obj);
        	//this.setColor(obj.style.background.toString());
        	this.setColor(obj.style.background.color.toString());
        	this.setValue();
        	this.onChangeRGB();
        	
        	this.setPreview();
        	this.setLightnessBar();
        }

        this.btnApply_onclick = function(obj,e)
        {
        	var selcolor = this.previewColor.style.background.color.toString().substr(0,7);
        	this.parent.setColor(selcolor);
        }

        this.btnCancel_onclick = function(obj,e)
        {
        	this.parent.setColor();
        }

        
        //색채선택판 마우스클릭 이벤트
        this.colorImage_onclick = function(obj,e)
        {
        	var left = nexacro.toNumber(obj.left);
        	var top = nexacro.toNumber(obj.top);
        	var cx = e.clientX;
        	var cy = e.clientY;
        	var width = nexacro.round(this.fixSize / 2);
        	var height = nexacro.round(this.fixSize / 2);

        	this.selectPointer.move(nexacro.toNumber(obj.left) + e.clientX - nexacro.round(nexacro.toNumber(this.fixSize)/2)
        	                         , nexacro.toNumber(obj.top) + e.clientY - nexacro.round(nexacro.toNumber(this.fixSize)/2));

        	this.onChangeHueSat();
        }

        
        //명도선택판 마우스클릭 이벤트
        this.lightnessBar_onclick = function(obj,e)
        {
        	//this.slider.move(nexacro.toNumber(this.slider.left), obj.top + e.clientY- (this.slider.height/2));
        	this.slider.move(nexacro.toNumber(this.slider.left)
        	                   , nexacro.toNumber(obj.top) + e.clientY - nexacro.round(15/2));	
        	
        	this.onChangeLightnessBar();
        }

        
        this.btnAddUserColor_onclick = function(obj,e)
        {
        	//trace("this.previewColor.style.background="+this.previewColor.style.background);
        	this.userColorComponent.style.set_background(this.previewColor.style.background);
        	//application.setPrivateProfile("ColorDialog/"+this.userColorComponent.name, this.userColorComponent.style.background.toString());
        	
        	
        	//trace("this.userColorComponent.name="+this.userColorComponent.name);
        	var id = parseInt(this.userColorComponent.name.substr(1))+1;
        	
        	id = (id%16);
        	//trace("after id="+id);
        	
        	this.userColorComponent = this.components["u"+((parseInt(this.userColorComponent.name.substr(1))+1)%16)];
        }

        //"사용자 지정 색" 클릭시 이벤트 처리
        this.userColor_onclick = function(obj,e)
        {
        	this.userColorComponent = obj;

        	this.setSelectColorBorder(obj);
        	//this.setColor(obj.style.background.toString());
        	this.setColor(obj.style.background.color.toString());
        	this.setValue();
         	this.setPreview();
         	this.setLightnessBar();

         	//selectPointer 이동 
         	this.moveSelectPointer();
        }

        

        

        

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onmousemove", this.ColorPickerPopup_onmousemove, this);
            this.addEventHandler("onload", this.ColorPickerPopup_onload, this);
            this.b11.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b21.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b31.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b41.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b51.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b61.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b12.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b13.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b14.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b15.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b16.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b17.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b18.addEventHandler("onclick", this.basicColor_onclick, this);
            this.btnCancel.addEventHandler("onclick", this.btnCancel_onclick, this);
            this.btnApply.addEventHandler("onclick", this.btnApply_onclick, this);
            this.b22.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b32.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b42.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b52.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b62.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b23.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b33.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b43.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b53.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b63.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b24.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b34.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b44.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b54.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b64.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b25.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b35.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b45.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b55.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b65.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b26.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b36.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b46.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b56.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b66.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b27.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b37.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b47.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b57.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b67.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b28.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b38.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b48.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b58.addEventHandler("onclick", this.basicColor_onclick, this);
            this.b68.addEventHandler("onclick", this.basicColor_onclick, this);
            this.colorImage.addEventHandler("onclick", this.colorImage_onclick, this);
            this.lightnessBar.addEventHandler("onclick", this.lightnessBar_onclick, this);
            this.previewColor.addEventHandler("onclick", this.basicColor_onclick, this);
            this.u0.addEventHandler("onclick", this.userColor_onclick, this);
            this.u2.addEventHandler("onclick", this.userColor_onclick, this);
            this.u4.addEventHandler("onclick", this.userColor_onclick, this);
            this.u6.addEventHandler("onclick", this.userColor_onclick, this);
            this.u8.addEventHandler("onclick", this.userColor_onclick, this);
            this.u10.addEventHandler("onclick", this.userColor_onclick, this);
            this.u12.addEventHandler("onclick", this.userColor_onclick, this);
            this.u14.addEventHandler("onclick", this.userColor_onclick, this);
            this.u1.addEventHandler("onclick", this.userColor_onclick, this);
            this.u3.addEventHandler("onclick", this.userColor_onclick, this);
            this.u5.addEventHandler("onclick", this.userColor_onclick, this);
            this.u7.addEventHandler("onclick", this.userColor_onclick, this);
            this.u9.addEventHandler("onclick", this.userColor_onclick, this);
            this.u11.addEventHandler("onclick", this.userColor_onclick, this);
            this.u13.addEventHandler("onclick", this.userColor_onclick, this);
            this.u15.addEventHandler("onclick", this.userColor_onclick, this);
            this.btnAddUserColor.addEventHandler("onclick", this.btnAddUserColor_onclick, this);
            this.slider.addEventHandler("onmousemove", this.slider_onmousemove, this);
            this.slider.addEventHandler("onlbuttonup", this.slider_onlbuttonup, this);
            this.ed_r.addEventHandler("ontextchanged", this.onChangeRgbValue, this);
            this.ed_g.addEventHandler("ontextchanged", this.onChangeRgbValue, this);
            this.ed_b.addEventHandler("ontextchanged", this.onChangeRgbValue, this);
            this.ed_h.addEventHandler("ontextchanged", this.onChangeHslValue, this);
            this.ed_s.addEventHandler("ontextchanged", this.onChangeHslValue, this);
            this.ed_v.addEventHandler("ontextchanged", this.onChangeHslValue, this);

        };

        this.loadIncludeScript("WebEditorColorPickerPopup.xfdl");

       
    };
}
)();
